<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String khxm=null;
String xb=null;
String lxdh=null;
String fwdz=null;
long hxmj=0;
java.sql.Date jfrq=null;
String zxlxbm=null;
String zxnr=null;
String sfxhf=null;
java.sql.Date hfrq=null;
java.sql.Date zxsj=null;
String slr=null;
String sjs=null;
java.sql.Date sjssj=null;
String clfs=null;
String zxjg=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
khxm=cf.GB2Uni(request.getParameter("khxm"));
xb=cf.GB2Uni(request.getParameter("xb"));
lxdh=cf.GB2Uni(request.getParameter("lxdh"));
fwdz=cf.GB2Uni(request.getParameter("fwdz"));
ls=request.getParameter("hxmj");
try{
	if (!(ls.equals("")))  hxmj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����hxmj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("jfrq");
try{
	if (!(ls.equals("")))  jfrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jfrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
zxlxbm=cf.GB2Uni(request.getParameter("zxlxbm"));
zxnr=cf.GB2Uni(request.getParameter("zxnr"));
sfxhf=cf.GB2Uni(request.getParameter("sfxhf"));
ls=request.getParameter("hfrq");
try{
	if (!(ls.equals("")))  hfrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����hfrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ط�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("zxsj");
try{
	if (!(ls.equals("")))  zxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zxsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�绰��ѯʱ��]����ת����������:"+e);
	return;
}
slr=cf.GB2Uni(request.getParameter("slr"));
sjs=cf.GB2Uni(request.getParameter("sjs"));
ls=request.getParameter("sjssj");
try{
	if (!(ls.equals("")))  sjssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʦ��ѯʱ��]����ת����������:"+e);
	return;
}
clfs=cf.GB2Uni(request.getParameter("clfs"));
zxjg=cf.GB2Uni(request.getParameter("zxjg"));
String wherezxjlh=null;
wherezxjlh=cf.GB2Uni(request.getParameter("wherezxjlh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_dhzxjl set sfxhf=?,hfrq=?,sjs=?,sjssj=?,clfs=?,zxnr=? ";
	ls_sql+=" where  (zxjlh="+wherezxjlh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sfxhf);
	ps.setDate(2,hfrq);
	ps.setString(3,sjs);
	ps.setDate(4,sjssj);
	ps.setString(5,clfs);
	ps.setString(6,zxnr);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>�޸����ݿ�ʧ�ܣ�");
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>