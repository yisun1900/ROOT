<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010205")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<%
String ls=null;

String kzdzfs=cf.GB2Uni(request.getParameter("kzdzfs"));
double zdmll=0;
ls=request.getParameter("zdmll");
try{
	if (!(ls.equals("")))  zdmll=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zdmll]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ǩ�����ë����]����ת����������:"+e);
	return;
}
double zkl=0;
ls=request.getParameter("zkl");
try{
	if (!(ls.equals("")))  zkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zkl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ǩ������ۿ�]����ת����������:"+e);
	return;
}
int sqtszkcs=0;
ls=request.getParameter("sqtszkcs");
try{
	if (!(ls.equals("")))  sqtszkcs=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sqtszkcs]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ÿ�����������ۿ۴���]����ת����������:"+e);
	return;
}

String[] ygbh = request.getParameterValues("ygbh");

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;

try {
	conn=cf.getConnection();    //�õ�����

	conn.setAutoCommit(false);

	for (int i=0;i<ygbh.length ;i++ )
	{
		ls_sql = "update sq_yhxx ";
		ls_sql+= " set kzdzfs='"+kzdzfs+"',zkl='"+zkl+"',zdmll='"+zdmll+"',sqtszkcs='"+sqtszkcs+"' ";
		ls_sql+= " where ygbh='"+ygbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();
		
	%>
	<SCRIPT language=javascript >
	<!--
	alert("���۳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
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
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>
