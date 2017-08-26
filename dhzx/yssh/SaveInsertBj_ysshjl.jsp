<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ysshjl=null;
String khbh=null;
String sqsm=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
ysshjl=cf.GB2Uni(request.getParameter("ysshjl"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
sqsm=cf.GB2Uni(request.getParameter("sqsm"));
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
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String yysshjl=null;
	ls_sql="select ysshjl";
	ls_sql+=" from  bj_ysshjl";
	ls_sql+=" where khbh='"+khbh+"' and zxbz='Y'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yysshjl=cf.fillNull(rs.getString("ysshjl"));
	}
	rs.close();
	ps.close();

	String yysshbz=null;
	ls_sql="select ysshbz";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yysshbz=cf.fillNull(rs.getString("ysshbz"));
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="update bj_ysshjl set zxbz='N'";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_ysshjl ( ysshjl,khbh,sqsm,lrr,lrsj,bz,yysshjl,yysshbz,zxbz,ysshbz,shdf ) ";
	ls_sql+=" values ( ?,?,?,?,SYSDATE,?,?,?,'Y','B',0 ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ysshjl);
	ps.setString(2,khbh);
	ps.setString(3,sqsm);
	ps.setString(4,lrr);
	ps.setString(5,bz);
	ps.setString(6,yysshjl);
	ps.setString(7,yysshbz);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_zxkhxx set ysshbz='B'";//N��δ���룻B��������ˣ�C���������룻Y�����ͨ����M�����δͨ��
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