<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<%

String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;

//=====================================���������д�����ݿ�======================================================
String ls=null;

String shyj=cf.GB2Uni(request.getParameter("shyj"));
String shr=cf.GB2Uni(request.getParameter("shr"));

java.sql.Date shsj=null;
ls=request.getParameter("shsj");
try{
	if (!(ls.equals("")))  shsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����shsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʱ��]����ת����������:"+e);
	return;
}

String rkph=cf.GB2Uni(request.getParameter("rkph"));


try {
	conn=cf.getConnection();

	ls_sql="update cl_rkd set rkzt='3',shsj=?,shr=?,shyj=?";
	ls_sql+=" where rkph='"+rkph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,shsj);
	ps.setString(2,shr);
	ps.setString(3,shyj);

	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
			alert("���̳ɹ�!!!");
			window.close();
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
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
