<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String lyckr=null;
java.sql.Date lycksj=null;
String lyhfnr=null;

lyckr=cf.GB2Uni(request.getParameter("lyckr"));
ls=request.getParameter("lycksj");
try{
	if (!(ls.equals("")))  lycksj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lycksj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[留言查看时间]类型转换发生意外:"+e);
	return;
}
lyhfnr=cf.GB2Uni(request.getParameter("lyhfnr"));

String lyxh=cf.GB2Uni(request.getParameter("lyxh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update hd_khly set lysfyck=?,lyckr=?,lycksj=SYSDATE,lyhfnr=? ";
	ls_sql+=" where  (lyxh='"+lyxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,"Y");
	ps.setString(2,lyckr);
	ps.setString(3,lyhfnr);
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