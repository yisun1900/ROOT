<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String sgph =request.getParameter("sgph");
String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
int count=0;
try {
	conn=cf.getConnection();    //�õ�����	
	sql=" update cl_clsgd set sgzt='4',gysxdr='"+yhdlm+"',gysxdsj=sysdate where sgph='"+sgph+"' ";
	ps= conn.prepareStatement(sql);		
	ps.executeUpdate();
	ps.close();
	%>
	<SCRIPT language=javascript >
	<!--
		alert("�µ���ɣ�");
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

