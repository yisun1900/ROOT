<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dwbh=null;
long clxlbm=0;
double bzlybl=0;
double lyblxx=0;
double lyblsx=0;
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
ls=request.getParameter("clxlbm");
try{
	if (!(ls.equals("")))  clxlbm=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[clxlbm]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����С�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("bzlybl");
try{
	if (!(ls.equals("")))  bzlybl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[bzlybl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��׼���ñ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("lyblxx");
try{
	if (!(ls.equals("")))  lyblxx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[lyblxx]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ñ�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("lyblsx");
try{
	if (!(ls.equals("")))  lyblsx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[lyblsx]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ñ�������]����ת����������:"+e);
	return;
}
String wheredwbh=null;
String whereclxlbm=null;
wheredwbh=cf.GB2Uni(request.getParameter("wheredwbh"));
whereclxlbm=cf.GB2Uni(request.getParameter("whereclxlbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jxc_fclybl set bzlybl=?,lyblxx=?,lyblsx=? ";
	ls_sql+=" where  (dwbh='"+wheredwbh+"') and  (clxlbm="+whereclxlbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,bzlybl);
	ps.setDouble(2,lyblxx);
	ps.setDouble(3,lyblsx);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
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
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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