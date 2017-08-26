<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date smsj=null;
String smmd=null;
long jdrbh=0;
String jdrbm=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String ssfgs=null;
String bz=null;
ls=request.getParameter("smsj");
try{
	if (!(ls.equals("")))  smsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[smsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
smmd=cf.GB2Uni(request.getParameter("smmd"));
ls=request.getParameter("jdrbh");
try{
	if (!(ls.equals("")))  jdrbh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jdrbh]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Ӵ��˱��]����ת����������:"+e);
	return;
}
jdrbm=cf.GB2Uni(request.getParameter("jdrbm"));
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
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
bz=cf.GB2Uni(request.getParameter("bz"));
String sjjdqk=cf.GB2Uni(request.getParameter("sjjdqk"));
String jlh=cf.GB2Uni(request.getParameter("jlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String zt=null;
	String khbh=null;
	ls_sql="select zt,khbh";
	ls_sql+=" from  crm_khsmjl";
	ls_sql+=" where  (jlh='"+jlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zt=rs.getString(1);
		khbh=rs.getString(2);
	}
	rs.close();
	ps.close();
	if (!zt.equals("2"))//1��δ¼�����2����¼�����3�������
	{
		out.println("����״̬����ȷ���������޸�");
		return;
	}

	String jdr=null;
	ls_sql="select yhmc";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where ygbh='"+jdrbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jdr=rs.getString(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="update crm_khsmjl set smsj=?,smmd=?,jdr=?,jdrbh=?,jdrbm=?,lrr=?,lrsj=?,lrbm=?,bz=?,sjjdqk=? ";
	ls_sql+=" where  (jlh='"+jlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,smsj);
	ps.setString(2,smmd);
	ps.setString(3,jdr);
	ps.setLong(4,jdrbh);
	ps.setString(5,jdrbm);
	ps.setString(6,lrr);
	ps.setDate(7,lrsj);
	ps.setString(8,lrbm);
	ps.setString(9,bz);
	ps.setString(10,sjjdqk);
	ps.executeUpdate();
	ps.close();

	java.sql.Date scsmsj=null;//�״�����ʱ��
	ls_sql="select min(smsj)";
	ls_sql+=" from  crm_khsmjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		scsmsj=rs.getDate(1);
	}
	rs.close();
	ps.close();
		
	ls_sql =" update crm_zxkhxx set scsmsj=?,zjsmsj=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,scsmsj);
	ps.setDate(2,smsj);
	ps.executeUpdate();
	ps.close();

	conn.commit();

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
	conn.rollback();
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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