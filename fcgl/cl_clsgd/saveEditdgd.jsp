<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String[] sgph =request.getParameterValues("sgph");
String[] clbm =request.getParameterValues("clbm");
String[] sgsl =request.getParameterValues("sgsl");
double sgzl = 0;
for (int k=0;k<clbm.length ;k++ )
{
	String sl=sgsl[k];
	try{
	if (!(sl.equals("")))  sgzl=Double.parseDouble(sl.trim())+sgzl;
	}
	catch (java.lang.NullPointerException nulle){
		out.println("<BR>����sgsl������");
		return;
	}
	catch (Exception e){
		out.println("<BR>[�깺����]����ת����������:"+e);
		return;
	}
}
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
		sql=" update cl_clsgmx set sgsl='"+sgsl[i]+"' where clbm='"+clbm[i]+"' and sgph='"+sgph[i]+"' ";
//		out.println(sql);
		ps= conn.prepareStatement(sql);		
		ps.executeUpdate();
		ps.close();
//		out.println("i="+i);
	}	
	sql=" update cl_clsgd set sgzsl='"+sgzl+"' where sgph='"+sgph[0]+"' ";
	ps= conn.prepareStatement(sql);		
	ps.executeUpdate();
	ps.close();
	conn.commit();
	%>
	<SCRIPT language=javascript >
	<!--
		alert("����ɹ�");
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

