<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String khbh=null;
String yjfr=null;
java.sql.Date yjfsj=null;
String yjfsm=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;

khbh=cf.GB2Uni(request.getParameter("khbh"));
yjfr=cf.GB2Uni(request.getParameter("yjfr"));
ls=request.getParameter("yjfsj");
try{
	if (!(ls.equals("")))  yjfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yjfsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ԥ����ʱ��]����ת����������:"+e);
	return;
}
yjfsm=cf.GB2Uni(request.getParameter("yjfsm"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[lrsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));

String yjfjlh=cf.GB2Uni(request.getParameter("yjfjlh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getxmjfzt=null;
	ls_sql="select xmjfzt";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getxmjfzt=cf.fillNull(rs.getString("xmjfzt"));
	}
	rs.close();
	ps.close();

	if (!getxmjfzt.equals("S"))//N��δ������S��Ԥ������Y���طóɹ���X���ط�ʧ�ܣ�C��ʧ���Ѵ���W����Ŀ����
	{
		out.println("����״̬����ȷ");
		return;
	}
	

	String getyjfjlh="";
	ls_sql="select yjfjlh";
	ls_sql+=" from crm_xmyjfjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ls_sql+=" order by yjfjlh desc ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getyjfjlh=cf.fillNull(rs.getString("yjfjlh"));
	}
	rs.close();
	ps.close();

	if (!getyjfjlh.equals(yjfjlh))
	{
		out.println("����ֻ���޸����µĽ�����¼��"+getyjfjlh);
		return;
	}
	
	ls_sql="update crm_xmyjfjl set yjfr=?,yjfsj=?,yjfsm=?,lrr=?,lrsj=?,lrbm=? ";
	ls_sql+=" where  (yjfjlh='"+yjfjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,yjfr);
	ps.setDate(2,yjfsj);
	ps.setString(3,yjfsm);
	ps.setString(4,lrr);
	ps.setDate(5,lrsj);
	ps.setString(6,lrbm);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>