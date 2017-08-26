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
	out.println("<BR>����clxlbm������");
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
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clxlmc=null;
	ls_sql="select clxlmc";
	ls_sql+=" from  jxc_clxlbm";
	ls_sql+=" where clxlbm="+clxlbm;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clxlmc=cf.fillNull(rs.getString("clxlmc"));
	}
	rs.close();
	ps.close();

	ls_sql="insert into jxc_fclybl ( dwbh,clxlbm,clxlmc,bzlybl,lyblxx,lyblsx ) ";
	ls_sql+=" values ( ?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dwbh);
	ps.setLong(2,clxlbm);
	ps.setString(3,clxlmc);
	ps.setDouble(4,bzlybl);
	ps.setDouble(5,lyblxx);
	ps.setDouble(6,lyblsx);
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
	out.print("<BR>����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>