<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String[] rkph =request.getParameterValues("rkph");
String[] clbm =request.getParameterValues("clbm");
String[] rksl =request.getParameterValues("rksl");
String[] rkdj =request.getParameterValues("rkdj");
String[] rkje =request.getParameterValues("rkje");
String gysmc =cf.GB2Uni(request.getParameter("gysmc"));
double rkzsl = 0;
double rkzje = 0;
for (int k=0;k<clbm.length ;k++ )
{
	String sl=rksl[k];
	try{
	if (!(sl.equals("")))  rkzsl=Double.parseDouble(sl.trim())+rkzsl;
	}
	catch (java.lang.NullPointerException nulle){
		out.println("<BR>变量rksl不存在");
		return;
	}
	catch (Exception e){
		out.println("<BR>[入库数量]类型转换发生意外:"+e);
		return;
	}
}
for (int n=0;n<clbm.length ;n++ )
{
	String je=rkje[n];
	try{
	if (!(je.equals("")))  rkzje=Double.parseDouble(je.trim())+rkzje;
	}
	catch (java.lang.NullPointerException nulle){
		out.println("<BR>变量rkje不存在");
		return;
	}
	catch (Exception e){
		out.println("<BR>[入库金额]类型转换发生意外:"+e);
		return;
	}
}
String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
int count=0;
try {
	conn=cf.getConnection();    //得到连接
	conn.setAutoCommit(false);
	for (int i=0;i<clbm.length ;i++ )
	{
		sql=" update cl_rkmx set rkdj='"+rkdj[i]+"',rksl='"+rksl[i]+"',rkje='"+rkje[i]+"' where clbm='"+clbm[i]+"' and rkph='"+rkph[i]+"' ";
//		out.println(sql);
		ps= conn.prepareStatement(sql);		
		ps.executeUpdate();
		ps.close();
//		out.println("i="+i);
	}	
	sql=" update cl_rkd set gysmc='"+gysmc+"',rkzsl='"+rkzsl+"',rkzje='"+rkzje+"' where rkph='"+rkph[0]+"' ";
	ps= conn.prepareStatement(sql);		
	ps.executeUpdate();
	ps.close();
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

