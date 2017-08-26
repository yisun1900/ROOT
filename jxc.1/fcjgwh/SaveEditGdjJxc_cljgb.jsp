<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%


String ls=null;

double dgzjg=0;
ls=request.getParameter("dgzjg");
try{
	if (!(ls.equals("")))  dgzjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dgzjg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[对工长价格]类型转换发生意外:"+e);
	return;
}

String bz=null;
bz=cf.GB2Uni(request.getParameter("bz"));

String lrr=cf.GB2Uni(request.getParameter("lrr"));
String lrbm=cf.GB2Uni(request.getParameter("lrbm"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));


String clbm=null;
String dqbm=null;
clbm=cf.GB2Uni(request.getParameter("clbm"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update jxc_cljgb set dgzjg=?,lrr=?,lrsj=SYSDATE,lrbm=?,ssfgs=?,bz=? ";
	ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dgzjg);
	ps.setString(2,lrr);
	ps.setString(3,lrbm);
	ps.setString(4,ssfgs);
	ps.setString(5,bz);
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