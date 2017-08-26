<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
String lrr=(String)session.getAttribute("yhmc");

String ssfgs = request.getParameter("ssfgs");
String khzq = request.getParameter("khzq");

String[] ygbh =request.getParameterValues("ygbh");
String[] bianhao =request.getParameterValues("bianhao");
String[] yhmc =request.getParameterValues("yhmc");
String[] dwbh =request.getParameterValues("dwbh");
String[] xzzwbm =request.getParameterValues("xzzwbm");

String[] byrw =request.getParameterValues("byrw");
  
//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;

try {
	conn=cf.getConnection();    //得到连接

	java.sql.Date khqssj=null;
	java.sql.Date khjzsj=null;
	sql="select khqssj,khjzsj";
	sql+=" from  cw_jrkhzq";
	sql+=" where khzq='"+khzq+"'";
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khqssj=rs.getDate("khqssj");
		khjzsj=rs.getDate("khjzsj");
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	for (int i=0;i<ygbh.length ;i++ )
	{
		sql="delete from cw_jryjkh ";
		sql+=" where ygbh="+ygbh[i]+" and  khzq='"+khzq+"'";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();

		String zw = null;
		sql="select gzbm";
		sql+=" from  dm_xzzwbm";
		sql+=" where xzzwmc='"+cf.GB2Uni(xzzwbm[i])+"'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zw=rs.getString("gzbm");
		}
		rs.close();
		ps.close();

		sql="insert into cw_jryjkh ( khzq,khqssj,khjzsj,fgsbh,dwbh,ygbh,yhmc,bianhao,xzzwbm,zw,byrw,lrr,lrsj,byqds,byyj,dzkhbl,sfkh) ";
		sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,SYSDATE,0,0,0,'N') ";
		ps= conn.prepareStatement(sql);
		ps.setString(1,khzq);
		ps.setDate(2,khqssj);
		ps.setDate(3,khjzsj);
		ps.setString(4,ssfgs);
		ps.setString(5,dwbh[i]);
		ps.setString(6,ygbh[i]);
		ps.setString(7,cf.GB2Uni(yhmc[i]));
		ps.setString(8,cf.GB2Uni(bianhao[i]));
		ps.setString(9,cf.GB2Uni(xzzwbm[i]));
		ps.setString(10,zw);
		ps.setString(11,byrw[i]);
		ps.setString(12,lrr);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("保存成功");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>sql=" + sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
