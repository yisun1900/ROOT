<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=cf.GB2Uni(request.getParameter("wherekhbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;


try {
	conn=cf.getConnection();


	String ssfgs=null;
	String bjjb=null;
	String bjbbh=null;
	ls_sql="SELECT ssfgs,bjjb,bjbbh";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=rs.getString("ssfgs");
		bjjb=rs.getString("bjjb");
		bjbbh=rs.getString("bjbbh");
	}
	rs.close();
	ps.close();

	String dqbm=null;
	ls_sql="SELECT dqbm";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();

	//电子报价版本是否已停用
	int bjtyMark=0;
	ls_sql="select count(*)";
	ls_sql+=" from  bj_dzbjbb";
	ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and sfzybb='4'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjtyMark=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	//报价项目明细
	String xmbh=null;
	ls_sql="select bj_bjxmmx.xmbh";
	ls_sql+=" from  bj_bjxmmx";
	ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"' and bjlx='1'";
	ls_sql+=" order by bj_bjxmmx.xh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		xmbh=rs1.getString("xmbh");

		String xmmc=null;
		double clbj=0;
		double rgbj=0;
		double jxbj=0;
		double zcf=0;
		double shf=0;
		double ysf=0;
		double qtf=0;
		double bj=0;

		double sgdbj=0;
		double sgcbj=0;

		double clcb=0;
		double rgcb=0;
		double jxcb=0;
		double cbenj=0;
		String gycl=null;
		String bz=null;

		if (bjtyMark>0)//已停用，从表[bj_jzbjb1]取数据而非表[bj_jzbjb]
		{
			ls_sql="select bj_jzbjb1.xmmc,bj_jzbjb1.clbj,bj_jzbjb1.rgbj,bj_jzbjb1.jxbj,bj_jzbjb1.zcf,bj_jzbjb1.shf,bj_jzbjb1.ysf,bj_jzbjb1.qtf,bj_jzbjb1.bj   ,bj_jzbjb1.sgcbj,bj_jzbjb1.sgdbj,bj_jzbjb1.clcb,bj_jzbjb1.rgcb,bj_jzbjb1.jxcb,bj_jzbjb1.cbenj,bj_jzbjb1.gycl,bj_jzbjb1.bz";
			ls_sql+=" from  bj_jzbjb1";
			ls_sql+=" where bjbbh='"+bjbbh+"' and bjjbbm='"+bjjb+"' and xmbh='"+xmbh+"' and dqbm='"+dqbm+"'";
		}
		else{
			ls_sql="select bj_jzbjb.xmmc,bj_jzbjb.clbj,bj_jzbjb.rgbj,bj_jzbjb.jxbj,bj_jzbjb.zcf,bj_jzbjb.shf,bj_jzbjb.ysf,bj_jzbjb.qtf,bj_jzbjb.bj   ,bj_jzbjb.sgcbj,bj_jzbjb.sgdbj,bj_jzbjb.clcb,bj_jzbjb.rgcb,bj_jzbjb.jxcb,bj_jzbjb.cbenj,bj_jzbjb.gycl,bj_jzbjb.bz";
			ls_sql+=" from  bj_jzbjb";
			ls_sql+=" where bjbbh='"+bjbbh+"' and bjjbbm='"+bjjb+"' and xmbh='"+xmbh+"' and dqbm='"+dqbm+"'";
		}
//			out.println("<BR>"+ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xmmc=rs.getString("xmmc");

			clbj=rs.getDouble("clbj");
			rgbj=rs.getDouble("rgbj");
			jxbj=rs.getDouble("jxbj");
			zcf=rs.getDouble("zcf");
			shf=rs.getDouble("shf");
			ysf=rs.getDouble("ysf");
			qtf=rs.getDouble("qtf");
			bj=rs.getDouble("bj");

			sgcbj=rs.getDouble("sgcbj");
			sgdbj=rs.getDouble("sgdbj");

			clcb=rs.getDouble("clcb");
			rgcb=rs.getDouble("rgcb");
			jxcb=rs.getDouble("jxcb");
			cbenj=rs.getDouble("cbenj");

			gycl=cf.fillNull(rs.getString("gycl"));
			bz=cf.fillNull(rs.getString("bz"));
		}
		rs.close();
		ps.close();


		if (xmmc==null)
		{
			out.println("<BR>提醒！项目编号["+xmbh+"]在新的报价中不存在");
		}
		else{
			ls_sql="update bj_bjxmmx";
			ls_sql+=" set xmmc='"+xmmc+"',cldj="+clbj+",rgdj="+rgbj+",jxdj="+jxbj+",zcf="+zcf+",shf="+shf+",ysf="+ysf+",qtf="+qtf+",zqdj="+bj+",dj=zk/10*"+bj+"    ,sgcbj="+sgcbj+",sgdbj="+sgdbj+"   ,clcb="+clcb+",rgcb="+rgcb+",jxcb="+jxcb+",cbenj="+cbenj+",gycl='"+gycl+"',bz='"+bz+"'";
			ls_sql+=" where  khbh='"+khbh+"' and xmbh='"+xmbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

		if (cf.round(clbj+rgbj+jxbj+zcf+shf+ysf+qtf,2)!=bj)
		{
//			out.println("<BR>提醒！项目编号["+xmbh+"]价格错误！"+cf.round(clbj+rgbj+jxbj+zcf+shf+ysf+qtf,2)+","+bj);
		}

	}
	rs1.close();
	ps1.close();


	//初始化
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	//更新报价折扣
	dzbj.updateBjZkl(conn,khbh,"yz");
	//更新其它收费项目，调整收费百分比
	dzbj.updateSfxm(conn,khbh,"yz");
	//获取电子报价金额
	double dzbjze=dzbj.getAllBjje(conn,khbh,"yz");


	//修改：电子报价总额
	ls_sql="update crm_zxkhxx set dzbjze=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
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