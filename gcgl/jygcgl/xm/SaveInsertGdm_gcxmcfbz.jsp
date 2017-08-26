<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xmbm=null;
String wgjbbm=null;
String xzzwbm=null;
String zgyq=null;
long sgdkf=0;
double sgdfkje=0;
long ygkf=0;
double ygfkje=0;
String bz=null;
xmbm=cf.GB2Uni(request.getParameter("xmbm"));
wgjbbm=cf.GB2Uni(request.getParameter("wgjbbm"));
xzzwbm=cf.GB2Uni(request.getParameter("xzzwbm"));
zgyq=cf.GB2Uni(request.getParameter("zgyq"));
ls=request.getParameter("sgdkf");
try{
	if (!(ls.equals("")))  sgdkf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sgdkf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[施工队扣分]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sgdfkje");
try{
	if (!(ls.equals("")))  sgdfkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sgdfkje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[施工队罚款金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ygkf");
try{
	if (!(ls.equals("")))  ygkf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ygkf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[员工扣分]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ygfkje");
try{
	if (!(ls.equals("")))  ygfkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ygfkje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[员工罚款金额]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into gdm_gcxmcfbz ( xmbm,wgjbbm,xzzwbm,zgyq,sgdkf,sgdfkje,ygkf,ygfkje,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xmbm);
	ps.setString(2,wgjbbm);
	ps.setString(3,xzzwbm);
	ps.setString(4,zgyq);
	ps.setLong(5,sgdkf);
	ps.setDouble(6,sgdfkje);
	ps.setLong(7,ygkf);
	ps.setDouble(8,ygfkje);
	ps.setString(9,bz);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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