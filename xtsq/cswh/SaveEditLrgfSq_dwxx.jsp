<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010122")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<%
String ls=null;

String zxkhlrjc=cf.GB2Uni(request.getParameter("zxkhlrjc"));
int zxkhlrts=0;
ls=request.getParameter("zxkhlrts");
try{
	if (!(ls.equals("")))  zxkhlrts=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zxkhlrts������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ѯ�ͻ���ǰ¼������]����ת����������:"+e);
	return;
}
String qdkhbljc=cf.GB2Uni(request.getParameter("qdkhbljc"));
int qdkhblts=0;
ls=request.getParameter("qdkhblts");
try{
	if (!(ls.equals("")))  qdkhblts=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qdkhblts������");
	return;
}
catch (Exception e){
	out.println("<BR>[ǩ���ͻ���¼��������]����ת����������:"+e);
	return;
}

int djbhts=0;
ls=request.getParameter("djbhts");
try{
	if (!(ls.equals("")))  djbhts=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����djbhts������");
	return;
}
catch (Exception e){
	out.println("<BR>[������ͻ���������]����ת����������:"+e);
	return;
}

int scyjts=0;
ls=request.getParameter("scyjts");
try{
	if (!(ls.equals("")))  scyjts=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����scyjts������");
	return;
}
catch (Exception e){
	out.println("<BR>[�г��ͻ��ƽ���Ч����]����ת����������:"+e);
	return;
}

String sjszdgh=cf.GB2Uni(request.getParameter("sjszdgh"));
String sjszdjz=cf.GB2Uni(request.getParameter("sjszdjz"));
String ywyzdgh=cf.GB2Uni(request.getParameter("ywyzdgh"));
String khjlzdgh=cf.GB2Uni(request.getParameter("khjlzdgh"));
String khjlzdjz=cf.GB2Uni(request.getParameter("khjlzdjz"));

String dwbh=cf.GB2Uni(request.getParameter("dwbh"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	
	ls_sql="update sq_dwxx set zxkhlrjc=?,zxkhlrts=?,qdkhbljc=?,qdkhblts=?,djbhts=?,scyjts=?,sjszdgh=?,sjszdjz=?,ywyzdgh=?,khjlzdgh=?,khjlzdjz=? ";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zxkhlrjc);
	ps.setInt(2,zxkhlrts);
	ps.setString(3,qdkhbljc);
	ps.setInt(4,qdkhblts);
	ps.setInt(5,djbhts);
	ps.setInt(6,scyjts);
	ps.setString(7,sjszdgh);
	ps.setString(8,sjszdjz);
	ps.setString(9,ywyzdgh);
	ps.setString(10,khjlzdgh);
	ps.setString(11,khjlzdjz);
	ps.executeUpdate();
	ps.close();


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
	out.print("Exception: " + e);
	out.print("<BR>" + ls_sql);
	return;
}
finally 
{
	try{
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>






