<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String bjjb=cf.GB2Uni(request.getParameter("bjjb"));
String jzbz=cf.GB2Uni(request.getParameter("jzbz"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String xmbh=null;
String ckxm=null;
String bjlx=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String dqbm=null;

double clbj=0;
double rgbj=0;
double jxbj=0;
double bj=0;
String gycl=null;
String bz=null;

double zcf=0;
double clf=0;
double rgf=0;
double jjf=0;
double glfbl=0;


try {
	conn=cf.getConnection();

	String getzxzt=null;//0：未分配店面；1: 分配店面；2: 飞单审核未通过；3：已签约；4：飞单；5：飞单审核未通过
	ls_sql="SELECT zxzt";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
	}
	rs.close();
	ps.close();
	if (getzxzt.equals("3"))
	{
		int czbzsq=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM cw_czbjsqjl";
		ls_sql+=" where khbh='"+khbh+"' and wcbz='1'";//1：未完成；2：完成；3：业绩结转
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			czbzsq=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (czbzsq==0)
		{
			out.println("错误！客户已签单，不能再修改报价");
			return;
		}
	}
	else if (getzxzt.equals("2") || getzxzt.equals("4"))
	{
		out.println("错误！客户签单失败，不能再修改报价");
		return;
	}

	conn.setAutoCommit(false);

	//更新报价
	//报价项目明细
	ls_sql="select bj_bjxmmx.xmbh,bj_bjxmmx.dqbm";
	ls_sql+=" from  bj_bjxmmx";
	ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
	ls_sql+=" order by bj_bjxmmx.xh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		xmbh=rs1.getString("xmbh");
		dqbm=rs1.getString("dqbm");


		ls_sql="select bj_jzbjb.xmmc,bj_jzbjb.clbj,bj_jzbjb.rgbj,bj_jzbjb.jxbj,bj_jzbjb.bj,bj_jzbjb.gycl,bj_jzbjb.bz";
		ls_sql+=" from  bj_jzbjb";
		ls_sql+=" where bj_jzbjb.bjjbbm='"+bjjb+"' and bj_jzbjb.xmbh='"+xmbh+"' and bj_jzbjb.dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xmmc=rs.getString("xmmc");
			clbj=rs.getDouble("clbj");
			rgbj=rs.getDouble("rgbj");
			jxbj=rs.getDouble("jxbj");
			bj=rs.getDouble("bj");
			gycl=cf.fillNull(rs.getString("gycl"));
			bz=cf.fillNull(rs.getString("bz"));
		}
		else{
			conn.rollback();
			out.println("<BR>错误！项目编号["+xmbh+"]不存在，在新的报价中，该项目可能已作废，<BR><B><font size=\"5\" color=\"#FF0000\">修改方式：在客户报价中，把不存在的项目删除即可</font></B>");
			return;
		}
		rs.close();
		ps.close();

		ls_sql="update bj_bjxmmx";
		ls_sql+=" set bjjb='"+bjjb+"',xmmc='"+xmmc+"',cldj="+clbj+",rgdj="+rgbj+",jxdj="+jxbj+",dj="+bj+",gycl='"+gycl+"',bz='"+bz+"'";
		ls_sql+=" where  khbh='"+khbh+"' and xmbh='"+xmbh+"' and dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	}
	rs1.close();
	ps1.close();

	//初始化
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	//更新其它收费项目，调整收费百分比
	dzbj.updateSfxm(conn,khbh,"hmy");
	//获取电子报价金额
	double dzbjze=dzbj.getAllBjje(conn,khbh,"hmy");


	//修改：电子报价总额
	ls_sql="update crm_zxkhxx set dzbjze=?,jzbz=?,bjjb=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.setString(2,jzbz);
	ps.setString(3,bjjb);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

