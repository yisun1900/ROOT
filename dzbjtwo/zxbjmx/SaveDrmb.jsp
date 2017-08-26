<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String khbh=request.getParameter("khbh");
String dqbm=request.getParameter("dqbm");
String mbmc=cf.GB2Uni(request.getParameter("mbmc"));
int pos=mbmc.indexOf("+");
String yhdlm=mbmc.substring(pos+1);
mbmc=mbmc.substring(0,pos);

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
long xh=0;
int xmpx=0;
int count=0;

String xmbh=null;
String ckxm=null;
String bjlx=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;

String bjbbh=null;
String bjjb=null;

try {
	conn=cf.getConnection();

	String getzxzt=null;//0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过
	ls_sql="SELECT zxzt,bjbbh,bjjb";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
		bjbbh=rs.getString("bjbbh");
		bjjb=rs.getString("bjjb");
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

	ls_sql=" delete from bj_bjxmmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_khglxmb ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql=" delete from bj_fjxx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_gclmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="select NVL(max(xh)+1,1)";
	ls_sql+=" from  bj_bjxmmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getLong(1);
	}
	rs.close();
	ps.close();

	//工程量明细
	ls_sql="insert into bj_gclmx (khbh,dqbm,xmbh,jgwzbm,sl,bz,fjnxh) ";
	ls_sql+=" select '"+khbh+"',dqbm,xmbh,jgwzbm,0,bz,fjnxh";
	ls_sql+=" from bj_bjmbgclmx ";
	ls_sql+=" where yhdlm='"+yhdlm+"' and mbmc='"+mbmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//房间信息
	ls_sql="insert into bj_fjxx (khbh,jgwzbm,fjmj,xuhao,oldjgwzbm) ";
	ls_sql+=" select '"+khbh+"',jgwzbm,fjmj,xuhao,jgwzbm";
	ls_sql+=" from bj_bjmbfjxx ";
	ls_sql+=" where yhdlm='"+yhdlm+"' and mbmc='"+mbmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//报价项目明细
	ls_sql="select bj_bjmb.xh,bj_bjmb.xmbh,xmmc,xmdlbm,xmxlbm";
	ls_sql+=" from  bj_bjmb,bj_jzbjb";
	ls_sql+=" where bj_bjmb.yhdlm='"+yhdlm+"' and bj_bjmb.mbmc='"+mbmc+"' and bj_jzbjb.bjjbbm='"+bjjb+"' and bj_jzbjb.bjbbh='"+bjbbh+"'";
	ls_sql+=" and bj_bjmb.dqbm=bj_jzbjb.dqbm and bj_bjmb.xmbh=bj_jzbjb.xmbh";
	ls_sql+=" order by bj_bjmb.xh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		xmpx=rs1.getInt("xh");
		xmbh=rs1.getString("xmbh");
		xmmc=rs1.getString("xmmc");
		xmdlbm=rs1.getString("xmdlbm");
		xmxlbm=rs1.getString("xmxlbm");

		ls_sql="select count(*)";
		ls_sql+=" from  bj_bjxmmx";
		ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count>0)
		{
			conn.rollback();
			out.println("错误！项目编号【"+xmbh+"】已存在");
			return;
		}

		//报价项目明细
		ls_sql="insert into bj_bjxmmx (xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,zqdj,zk,dj,clcb,rgcb,jxcb,cbenj,sgdbj,sgcbj,sfyxdz,zdzk,gycl,bz,dqbm,bjjb,xmlx,jzbz,xmpx,sfxycl,sfzgzc,bjlx,glxmbh,sfbxx,lrr,lrsj,SFXYYJD ) ";
		ls_sql+=" select                   ?,?,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clbj,rgbj,jxbj,zcf,shf,ysf,qtf,bj  ,10,bj,clcb,rgcb,jxcb,cbenj,sgdbj,sgcbj,sfyxdz,zdzk,gycl,bz,dqbm,bjjbbm,'1','1',?,'2','N','1',glxmbh,sfbxx,?,SYSDATE,SFXYYJD";//1：需要；2：不需要
		ls_sql+=" from bj_jzbjb ";
		ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjb+"' and bjbbh='"+bjbbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,xh);
		ps.setString(2,khbh);
		ps.setInt(3,xmpx);
		ps.setString(4,yhmc);
		ps.executeUpdate();
		ps.close();

		//插入：客户关联项目表
		ls_sql="insert into bj_khglxmb (khbh,xmbh,glxmbh) ";
		ls_sql+=" select ?,xmbh,glxmbh";
		ls_sql+=" from bj_glxmb ";
		ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjb+"' and bjbbh='"+bjbbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.executeUpdate();
		ps.close();

		xh++;
	}
	rs1.close();
	ps1.close();



	//获取：电子报价总额
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	double dzbjze=dzbj.getAllBjje(conn,khbh,"yz");


	//修改：电子报价总额
	ls_sql="update crm_zxkhxx set sfzdzbj='Y',dzbjze=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("导入成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>