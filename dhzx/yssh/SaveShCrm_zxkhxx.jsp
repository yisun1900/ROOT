<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
java.sql.Date ysshsj=null;
String ysshr=cf.GB2Uni(request.getParameter("ysshr"));
ls=request.getParameter("ysshsj");
try{
	if (!(ls.equals("")))  ysshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ysshsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ԥ�����ʱ��]����ת����������:"+e);
	return;
}
String ysshbz=cf.GB2Uni(request.getParameter("ysshbz"));
String ysshyj=cf.GB2Uni(request.getParameter("ysshyj"));

String wherekhbh=null;
wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	ls_sql="update crm_zxkhxx set ysshbz=?,ysshr=?,ysshsj=?,ysshyj=?";
	ls_sql+=" where  (khbh='"+wherekhbh+"') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ysshbz);
	ps.setString(2,ysshr);
	ps.setDate(3,ysshsj);
	ps.setString(4,ysshyj);
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
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