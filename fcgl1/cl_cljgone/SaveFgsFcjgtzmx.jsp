<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String dwbh=request.getParameter("dwbh");
String[] clbm =request.getParameterValues("clbm");
String[] gdj =request.getParameterValues("gdj");
String[] ckmc =request.getParameterValues("ckmc");
String[] sfrk =request.getParameterValues("sfrk");

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
int count=0;
try {
	conn=cf.getConnection();    //�õ�����


	conn.setAutoCommit(false);

	for (int i=0;i<clbm.length ;i++ )
	{
		sql=" update cl_jgmx set gdj="+gdj[i]+",ckmc='"+cf.GB2Uni(ckmc[i])+"',sfrk='"+sfrk[i]+"',tzr='"+yhmc+"',tzsj=SYSDATE";
		sql+=" where clbm='"+clbm[i]+"' and dwbh='"+dwbh+"' ";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();

	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("�۸�����ɹ�!!!");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("����ʧ��,��������: " + e);
	out.print("<BR>sql=" + sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //�ͷ�����
	}
	catch (Exception e){}
 }
%>              

