<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String tzbh=null;
String hfnr=null;
String lch=null;
lch=cf.GB2Uni(request.getParameter("lch"));
tzbh=cf.GB2Uni(request.getParameter("tzbh"));
hfnr=cf.GB2Uni(request.getParameter("editor_body"));
String ygbh=cf.GB2Uni(request.getParameter("ygbh"));
String yhdlm=cf.GB2Uni(request.getParameter("yhdlm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update nblt_hfgl set hfnr=?,zhxgsj=SYSDATE ";
	ls_sql+=" where  (tzbh='"+tzbh+"') and lch='"+lch+"'  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hfnr);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("编辑成功！");
		window.location.href="cktz.jsp?tzbh=<%=tzbh%>&yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>";
//		window.close();
		//-->
		</SCRIPT>
		<br><a href="cktz.jsp?tzbh=<%=tzbh%>&yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>">如果您的的浏览器没有自动跳转，请点击这里！</a>
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