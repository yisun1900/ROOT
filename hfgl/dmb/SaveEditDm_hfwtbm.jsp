<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String hfwtbm=null;
String hfwtmc=null;
String hflxbm=null;

hfwtbm=cf.GB2Uni(request.getParameter("hfwtbm"));
hfwtmc=cf.GB2Uni(request.getParameter("hfwtmc"));
hflxbm=cf.GB2Uni(request.getParameter("hflxbm"));

String wherehfwtbm=null;
wherehfwtbm=cf.GB2Uni(request.getParameter("wherehfwtbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_hfwtbm set hfwtbm=?,hfwtmc=?,hflxbm=?";
	ls_sql+=" where  (hfwtbm='"+wherehfwtbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hfwtbm);
	ps.setString(2,hfwtmc);
	ps.setString(3,hflxbm);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>�޸����ݿ�ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("���̳ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>