<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sbxh=null;
String dwbh=null;
java.sql.Date sbrq=null;
String xxlybm=null;
String zl=null;
String sfjhn=null;
double tfsj=0;
double htfy=0;
double sjfy=0;
String htsfsp=null;
String bz=null;
//******************************************
//�������
//******************************************
String ls_sql2=null;
int xh=0;
String xhs=null;
ls_sql2="select NVL(max(TO_NUMBER(sbxh))+1,1)";
ls_sql2+=" from  qh_fyb";
xhs=cf.executeQuery(ls_sql2);
xh=Integer.parseInt(xhs);
sbxh=cf.addZero(xh,7);
//�Զ��������

dwbh=cf.GB2Uni(request.getParameter("dwbh"));
ls=request.getParameter("sbrq");
try{
	if (!(ls.equals("")))  sbrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sbrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[�걨����]����ת����������:"+e);
	return;
}
xxlybm=cf.GB2Uni(request.getParameter("xxlybm"));
zl=cf.GB2Uni(request.getParameter("zl"));
sfjhn=cf.GB2Uni(request.getParameter("sfjhn"));
ls=request.getParameter("tfsj");
try{
	if (!(ls.equals("")))  tfsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tfsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ͷ��ʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("htfy");
try{
	if (!(ls.equals("")))  htfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����htfy������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͬ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjfy");
try{
	if (!(ls.equals("")))  sjfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjfy������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�ʷ���]����ת����������:"+e);
	return;
}
htsfsp=cf.GB2Uni(request.getParameter("htsfsp"));
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into qh_fyb ( sbxh,dwbh,sbrq,xxlybm,zl,sfjhn,tfsj,htfy,sjfy,htsfsp,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sbxh);
	ps.setString(2,dwbh);
	ps.setDate(3,sbrq);
	ps.setString(4,xxlybm);
	ps.setString(5,zl);
	ps.setString(6,sfjhn);
	ps.setDouble(7,tfsj);
	ps.setDouble(8,htfy);
	ps.setDouble(9,sjfy);
	ps.setString(10,htsfsp);
	ps.setString(11,bz);
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
	out.print("����ʧ��,��������: " +e);
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