<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String djxh=null;
String khbh=null;
String zpnr=null;
String jsr=null;
String bz=null;
java.sql.Date djrq=null;
//******************************************
//�������
//******************************************
String ls_sql2=null;
int xh=0;
String xhs=null;
ls_sql2="select NVL(max(TO_NUMBER(djxh))+1,1)";
ls_sql2+=" from  qh_lfcxdjb";
xhs=cf.executeQuery(ls_sql2);
xh=Integer.parseInt(xhs);
djxh=cf.addZero(xh,7);
//�Զ��������
khbh=cf.GB2Uni(request.getParameter("khbh"));
zpnr=cf.GB2Uni(request.getParameter("zpnr"));
jsr=cf.GB2Uni(request.getParameter("jsr"));
bz=cf.GB2Uni(request.getParameter("bz"));
ls=request.getParameter("djrq");
try{
	if (!(ls.equals("")))  djrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����djrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Ǽ�����]����ת����������:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into qh_lfcxdjb ( djxh,khbh,zpnr,jsr,djrq,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,djxh);
	ps.setString(2,khbh);
	ps.setString(3,zpnr);
	ps.setString(4,jsr);
	ps.setDate(5,djrq);
	ps.setString(6,bz);
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