<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String zzjgbm=null;
String zzjgmc=null;
zzjgbm=cf.GB2Uni(request.getParameter("zzjgbm"));
zzjgmc=cf.GB2Uni(request.getParameter("zzjgmc"));
String wherezzjgbm=null;
wherezzjgbm=cf.GB2Uni(request.getParameter("wherezzjgbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_zzjgbm set zzjgbm=?,zzjgmc=? ";
	ls_sql+=" where  (zzjgbm='"+wherezzjgbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zzjgbm);
	ps.setString(2,zzjgmc);
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