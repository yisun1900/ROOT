<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="cwgl" scope="page" class="cwgl.Cwgl"/>
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String jsr=request.getParameter("jsr");
String jsjlh=request.getParameter("jsjlh");
String khbh=request.getParameter("khbh");
String jsdw=cf.GB2Uni(request.getParameter("jsdw"));
String jsfs=cf.GB2Uni(request.getParameter("jsfs"));
String bz=cf.GB2Uni(request.getParameter("bz"));
java.sql.Date jssj=null;
ls=request.getParameter("jssj");
try{
	if (!(ls.equals("")))  jssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}

double jsl=0;//���ڽ�����

ls=request.getParameter("jsl");
try{
	if (!(ls.equals("")))  jsl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jsl������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ڽ�����]����ת����������:"+e);
	return;
}

try {

	cwgl.gcjs(jsjlh,khbh,jsr,jssj,jsdw,bz,jsl,jsfs);//���㷽ʽ��1��������ȫ����㣻2��������ͬ��������

	%>
	<SCRIPT language=javascript >
	<!--
	alert("����ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	out.print(e.getMessage());
	return;
}
%>

