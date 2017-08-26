<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
String ychsqk=cf.GB2Uni(request.getParameter("ychsqk"));
String zsycyybm=cf.GB2Uni(request.getParameter("zsycyybm"));
String ychsr=cf.GB2Uni(request.getParameter("ychsr"));
String ycclzt=cf.GB2Uni(request.getParameter("ycclzt"));
String sfxwyj=cf.GB2Uni(request.getParameter("sfxwyj"));
String jjfa=cf.GB2Uni(request.getParameter("jjfa"));

String ls=null;
java.sql.Date ychssj=null;
ls=request.getParameter("ychssj");
try{
	if (!(ls.equals("")))  ychssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ychssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ӳٺ�ʵʱ��]����ת����������:"+e);
	return;
}
double wyj=0;
ls=request.getParameter("wyj");
try{
	if (!(ls.equals("")))  wyj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wyj������");
	return;
}
catch (Exception e){
	out.println("<BR>[ΥԼ��]����ת����������:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String oldclzt=null;

try {
	conn=cf.getConnection();

	ls_sql="select clzt";
	ls_sql+=" from  jc_mmydd";
	ls_sql+=" where  yddbh='"+yddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		oldclzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();
	if (!oldclzt.equals("15"))
	{
		out.println("������ʧ�ܣ�����״̬����ȷ��");
		return;
	}
	
	ls_sql="update jc_mmydd set ychssj=?,ychsr=?,ychsqk=?,zsycyybm=?,ycclzt=?,sfxwyj=?,wyj=?,jjfa=?";
	ls_sql+=" where  yddbh='"+yddbh+"' and clzt='15' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,ychssj);
	ps.setString(2,ychsr);
	ps.setString(3,ychsqk);
	ps.setString(4,zsycyybm);
	ps.setString(5,ycclzt);
	ps.setString(6,sfxwyj);
	ps.setDouble(7,wyj);
	ps.setString(8,jjfa);
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
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>