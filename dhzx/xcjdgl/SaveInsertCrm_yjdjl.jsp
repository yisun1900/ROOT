<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jdjlh=null;
String khbh=null;
java.sql.Date sqrq=null;
String sqr=null;
String sqrlxdh=null;
java.sql.Date jhjdrq=null;
String jhjdsj=null;
String sqsm=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
jdjlh=cf.GB2Uni(request.getParameter("jdjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
ls=request.getParameter("sqrq");
try{
	if (!(ls.equals("")))  sqrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sqrq]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
sqr=cf.GB2Uni(request.getParameter("sqr"));
sqrlxdh=cf.GB2Uni(request.getParameter("sqrlxdh"));
ls=request.getParameter("jhjdrq");
try{
	if (!(ls.equals("")))  jhjdrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jhjdrq]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ�Ԥ��������]����ת����������:"+e);
	return;
}

sqsm=cf.GB2Uni(request.getParameter("sqsm"));
jhjdsj=cf.GB2Uni(request.getParameter("jhjdsj"));
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
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String xcjdbz=null;
	ls_sql="select xcjdbz";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xcjdbz=cf.fillNull(rs.getString("xcjdbz"));
	}
	rs.close();
	ps.close();
	if (!xcjdbz.equals("1"))//1��δԤԤ���ף�2���ύ���룺3��ԤԤ����
	{
		out.println("�������ύԤԤ��������");
		return;
	}

	String clzt="1";//1�����룻2��������3����Ԥ����

	conn.setAutoCommit(false);

	ls_sql="insert into crm_yjdjl ( jdjlh,khbh,sqrq,sqr,sqrlxdh,jhjdrq,jhjdsj,sqsm,lrr,lrsj,lrbm,clzt ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jdjlh);
	ps.setString(2,khbh);
	ps.setDate(3,sqrq);
	ps.setString(4,sqr);
	ps.setString(5,sqrlxdh);
	ps.setDate(6,jhjdrq);
	ps.setString(7,jhjdsj);
	ps.setString(8,sqsm);
	ps.setString(9,lrr);
	ps.setDate(10,lrsj);
	ps.setString(11,lrbm);
	ps.setString(12,clzt);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_zxkhxx set xcjdbz='2'";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
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
	out.print("<BR>����ʧ��,��������: " + e);
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