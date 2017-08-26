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
	out.println("<BR>变量jssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算时间]类型转换发生意外:"+e);
	return;
}

double jsl=0;//本期结算率

ls=request.getParameter("jsl");
try{
	if (!(ls.equals("")))  jsl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jsl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[本期结算率]类型转换发生意外:"+e);
	return;
}

try {

	cwgl.gcjs(jsjlh,khbh,jsr,jssj,jsdw,bz,jsl,jsfs);//结算方式：1：增减项全款结算；2：增减项同比例结算

	%>
	<SCRIPT language=javascript >
	<!--
	alert("结算成功！");
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

