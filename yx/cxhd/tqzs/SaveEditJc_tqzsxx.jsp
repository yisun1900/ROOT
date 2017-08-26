<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String zsxm=null;
String jldw=null;
double cbdj=0;
double scdj=0;
double zsslsx=0;
double zsslxx=0;
String sftz=null;
String bz=null;
zsxm=cf.GB2Uni(request.getParameter("zsxm"));
jldw=cf.GB2Uni(request.getParameter("jldw"));
ls=request.getParameter("cbdj");
try{
	if (!(ls.equals("")))  cbdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[cbdj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[成本单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("scdj");
try{
	if (!(ls.equals("")))  scdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[scdj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[市场单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zsslsx");
try{
	if (!(ls.equals("")))  zsslsx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zsslsx]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[赠送数量上限]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zsslxx");
try{
	if (!(ls.equals("")))  zsslxx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zsslxx]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[赠送数量下限]类型转换发生意外:"+e);
	return;
}
sftz=cf.GB2Uni(request.getParameter("sftz"));
bz=cf.GB2Uni(request.getParameter("bz"));
String wherefgsbh=null;
String wherezsxm=null;
wherefgsbh=cf.GB2Uni(request.getParameter("wherefgsbh"));
wherezsxm=cf.GB2Uni(request.getParameter("wherezsxm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jc_tqzsxx set zsxm=?,jldw=?,cbdj=?,scdj=?,zsslsx=?,zsslxx=?,sftz=?,bz=? ";
	ls_sql+=" where  (fgsbh='"+wherefgsbh+"') and  (zsxm='"+wherezsxm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zsxm);
	ps.setString(2,jldw);
	ps.setDouble(3,cbdj);
	ps.setDouble(4,scdj);
	ps.setDouble(5,zsslsx);
	ps.setDouble(6,zsslxx);
	ps.setString(7,sftz);
	ps.setString(8,bz);
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
	out.print("<BR>出错:" + e);
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