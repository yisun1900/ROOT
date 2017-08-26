<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sfjm=null;
String lrr=null;
java.sql.Date lrsj=null;
String dwbh=null;
String bz=null;
sfjm=cf.GB2Uni(request.getParameter("sfjm"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
bz=cf.GB2Uni(request.getParameter("bz"));
String qye=cf.GB2Uni(request.getParameter("qye"));


String czxh=null;
czxh=cf.GB2Uni(request.getParameter("czxh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;

String shzt="";
if (sfjm.equals("2"))
{
	shzt="1";
}

try {
	conn=cf.getConnection();

	ls_sql="update cl_djj set sfjm=?,lrr=?,lrsj=?,dwbh=?,bz=?,shzt=?,czzt='1',qye="+qye;
	ls_sql+=" where  (czxh='"+czxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sfjm);
	ps.setString(2,lrr);
	ps.setDate(3,lrsj);
	ps.setString(4,dwbh);
	ps.setString(5,bz);
	ps.setString(6,shzt);
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