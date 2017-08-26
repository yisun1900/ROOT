<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");
String[] xmbh=request.getParameterValues("xmbh");

String bjbbh=null;
String bjjb=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
long xh=0;
int count=0;
try {
	conn=cf.getConnection();

	String sfwc="";
	ls_sql="select sfwc";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N：未完成；Y：完成
	{
		out.println("错误！增减项已完成，不能再修改");
		return;
	}

	String ssfgs=null;
	ls_sql="SELECT bjbbh,bjjb,ssfgs";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjbbh=rs.getString("bjbbh");
		bjjb=rs.getString("bjjb");
		ssfgs=rs.getString("ssfgs");
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


	ls_sql="select NVL(max(xh)+1,1)";
	ls_sql+=" from  bj_bjxmmxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getLong(1);
	}
	rs.close();
	ps.close();

	int xmpx=0;//项目排序
	ls_sql="select NVL(max(xmpx)+1,1)";
	ls_sql+=" from  bj_bjxmmxh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xmpx=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);
	for (int i=0;i<xmbh.length ;i++ )
	{
		ls_sql="select count(*)";
		ls_sql+=" from  bj_bjxmmxh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xmbh='"+xmbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count>0)//项目已存在
		{
			continue;
		}


		ls_sql="insert into bj_bjxmmxh (zjxxh,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,cldj,rgdj   ,jxdj,zcf,shf,ysf,qtf,clcb,rgcb,jxcb,zqdj,zk,dj,cbenj,sgdbj,sgcbj,sfyxdz,zdzk   ,gycl,flmcgg,bz,dqbm,bjjb,bjlx,xmlx    ,jzbz,xmpx,sfzgzc,sfbxx,zdyxmyxq,lrr,lrsj,sfxycl,sfxyyjd,tcnxmbz ) ";
		ls_sql+=" select                   ?,?,?,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clbj,rgbj   ,jxbj,zcf,shf,ysf,qtf,clcb,rgcb,jxcb,bj  ,10,bj,cbenj,sgdbj,sgcbj,'Y',0        ,gycl,flmcgg,bz,dqbm,?,'2','1'         ,'1',?,'N','4',zdyxmyxq,'"+yhdlm+"',SYSDATE,sfxycl,sfxyyjd,'N'";//1：需要；2：不需要
		ls_sql+=" from bj_zdyxmb ";
		ls_sql+=" where lrr='"+yhdlm+"' and bjjbbm='"+bjjb+"' and xmbh='"+xmbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,zjxxh);
		ps.setLong(2,xh);
		ps.setString(3,khbh);
		ps.setString(4,bjjb);
		ps.setInt(5,xmpx);
		ps.executeUpdate();
		ps.close();


		xh++;
		xmpx++;

		ls_sql="delete from bj_khglfxbh ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"'  and xmbh='"+xmbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_khglfxbh (zjxxh,khbh,glbxh,dqbm,bjjb  ,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx) ";
		ls_sql+="                   select ?,?,glbxh,?,?        ,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,NVL(wlllbz,'N'),lx ";
		ls_sql+=" from bj_zdyglfxb ";
		ls_sql+=" where xmlrr='"+yhdlm+"' and xmbh='"+xmbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,zjxxh);
		ps.setString(2,khbh);
		ps.setString(3,dqbm);
		ps.setString(4,bjjb);
		ps.executeUpdate();
		ps.close();
	}


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
//	window.close();
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>