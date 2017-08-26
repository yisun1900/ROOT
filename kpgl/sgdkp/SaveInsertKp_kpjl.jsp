<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long kpjlh=0;
java.sql.Date qssj=null;
java.sql.Date jzsj=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
ls=request.getParameter("kpjlh");
try{
	if (!(ls.equals("")))  kpjlh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kpjlh������");
	return;
}
catch (Exception e){
	out.println("<BR>[������¼��]����ת����������:"+e);
	return;
}
ls=request.getParameter("qssj");
try{
	if (!(ls.equals("")))  qssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[������ʼʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("jzsj");
try{
	if (!(ls.equals("")))  jzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jzsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[������ֹʱ��]����ת����������:"+e);
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
String fgs=cf.GB2Uni(request.getParameter("fgs"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);
	
	ls_sql=" update kp_kpjl set zxbz='N' where fgs='"+fgs+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="insert into kp_kpjl ( kpjlh,qssj,jzsj,lrr,lrsj,bz,zxbz,fgs ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,'Y',? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,kpjlh);
	ps.setDate(2,qssj);
	ps.setDate(3,jzsj);
	ps.setString(4,lrr);
	ps.setDate(5,lrsj);
	ps.setString(6,bz);
	ps.setString(7,fgs);
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
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>