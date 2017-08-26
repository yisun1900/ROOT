<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">人工调整库存</font></B>
</CENTER>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");

String	dqbm=request.getParameter("dqbm");
String	ckbh=request.getParameter("ckbh");
String	clbm=request.getParameter("clbm");
String	nbbm=request.getParameter("nbbm");
String[] lsh=request.getParameterValues("lsh");
String[] kcsl=request.getParameterValues("kcsl");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String clmc=null;
	ls_sql="select clmc ";
	ls_sql+=" from  jxc_clbm";
	ls_sql+=" where clbm='"+clbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clmc=rs.getString(1);
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	for (int i=0;i<lsh.length ;i++ )
	{
		double ykcsl=0;
		ls_sql="select kcsl ";
		ls_sql+=" from  jxc_kcb";
		ls_sql+=" where lsh='"+lsh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ykcsl=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql="update jxc_kcb set kcsl="+kcsl[i];
		ls_sql+=" where lsh='"+lsh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into jxc_rgtzkcjl (lsh,xgsj,xgr,clbm,clmc,ykcsl,xkcsl,ssfgs,dwbh)";
		ls_sql+=" values(?,SYSDATE,?,?,?,?,?,?,? )";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,lsh[i]);
		ps.setString(2,yhmc);
		ps.setString(3,clbm);
		ps.setString(4,clmc);
		ps.setDouble(5,ykcsl);
		ps.setString(6,kcsl[i]);
		ps.setString(7,ssfgs);
		ps.setString(8,dwbh);
		ps.executeUpdate();
		ps.close();


	}

	double zcpzsl=0;
	double ccpzsl=0;
	double bfpzsl=0;

	ls_sql="select sum(kcsl) ";
	ls_sql+=" from  jxc_kcb";
	ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"' and zljb='1'";//1：正常品；2：残次品；3：报废品
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcpzsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(kcsl) ";
	ls_sql+=" from  jxc_kcb";
	ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"' and zljb='2'";//1：正常品；2：残次品；3：报废品
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ccpzsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(kcsl) ";
	ls_sql+=" from  jxc_kcb";
	ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"' and zljb='3'";//1：正常品；2：残次品；3：报废品
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bfpzsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql=" update jxc_cljgb set zcpzsl="+zcpzsl+",ccpzsl="+ccpzsl+",bfpzsl="+bfpzsl;
	ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	out.println("成功！");


}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>
