<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jklx=null;
double jkje=0;
String jkblr=null;
java.sql.Date jkblsj=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
jklx=cf.GB2Uni(request.getParameter("jklx"));
ls=request.getParameter("jkje");
try{
	if (!(ls.equals("")))  jkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jkje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����]����ת����������:"+e);
	return;
}
jkblr=cf.GB2Uni(request.getParameter("jkblr"));
ls=request.getParameter("jkblsj");
try{
	if (!(ls.equals("")))  jkblsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jkblsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[������ʱ��]����ת����������:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String wheregdjkjlh=null;
wheregdjkjlh=cf.GB2Uni(request.getParameter("wheregdjkjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String scbz=null;
	String czlx=null;
	String gdjsjd=null;
	ls_sql="select scbz,czlx,gdjsjd";
	ls_sql+=" from  cw_gdjkjl";
	ls_sql+=" where  (gdjkjlh='"+wheregdjkjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		scbz=rs.getString("scbz");
		czlx=rs.getString("czlx");
		gdjsjd=rs.getString("gdjsjd");
	}
	else{
		out.println("���󣡲����ڵ�����¼�ţ�"+wheregdjkjlh);
		return;
	}
	rs.close();
	ps.close();

	if (scbz.equals("Y"))
	{
		out.println("��������¼��["+wheregdjkjlh+"]�ѱ�ɾ��");
		return;
	}
	if (!czlx.equals("1"))//1��¼�룻2��������3������
	{
		out.println("��������¼��["+wheregdjkjlh+"]ƾ֤�ѵ�������ƾ֤�������޸�");
		return;
	}
	if (!gdjsjd.equals("0"))//0��δ���㣻1���ѽ���
	{
		out.println("��������¼��["+wheregdjkjlh+"]�ѽ��㣬�����޸�");
		return;
	}
	
	
	ls_sql="update cw_gdjkjl set jklx=?,jkje=?,jkblr=?,jkblsj=?,lrr=?,lrsj=?,bz=? ";
	ls_sql+=" where  (gdjkjlh='"+wheregdjkjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jklx);
	ps.setDouble(2,jkje);
	ps.setString(3,jkblr);
	ps.setDate(4,jkblsj);
	ps.setString(5,lrr);
	ps.setDate(6,lrsj);
	ps.setString(7,bz);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>