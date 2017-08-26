<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String lrr=null;
String lrbm=null;
double cbj=0;
double dfgsjg=0;
double dgzjg=0;
java.sql.Date sxsj=null;

lrr=cf.GB2Uni(request.getParameter("lrr"));
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
ls=request.getParameter("cbj");
try{
	if (!(ls.equals("")))  cbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[cbj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[成本价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dfgsjg");
try{
	if (!(ls.equals("")))  dfgsjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dfgsjg]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[对分公司价格]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dgzjg");
try{
	if (!(ls.equals("")))  dgzjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dgzjg]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[对工长价格]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sxsj");
try{
	if (!(ls.equals("")))  sxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sxsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[生效时间]类型转换发生意外:"+e);
	return;
}

String whereclbm=null;
String wheredqbm=null;
String wherelrsj=null;
whereclbm=cf.GB2Uni(request.getParameter("whereclbm"));
wheredqbm=cf.GB2Uni(request.getParameter("wheredqbm"));
wherelrsj=cf.GB2Uni(request.getParameter("wherelrsj"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jxc_tzcljgjl set lrsj=TRUNC(SYSDATE),lrr=?,lrbm=?,cbj=?,dfgsjg=?,dgzjg=?,sxsj=? ";
	ls_sql+=" where  (clbm='"+whereclbm+"') and  (dqbm='"+wheredqbm+"') and  (lrsj=TO_DATE('"+wherelrsj+"','YYYY-MM-DD'))  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,lrr);
	ps.setString(2,lrbm);
	ps.setDouble(3,cbj);
	ps.setDouble(4,dfgsjg);
	ps.setDouble(5,dgzjg);
	ps.setDate(6,sxsj);
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