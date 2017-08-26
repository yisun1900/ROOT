<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String tzbh=cf.GB2Uni(request.getParameter("tzbh"));
String ftzt=cf.GB2Uni(request.getParameter("ftzt"));
String ftnr=cf.GB2Uni(request.getParameter("editor_body"));
String sfyxhf=cf.GB2Uni(request.getParameter("sfyxhf"));
String ygbh=(String)session.getAttribute("ygbh");
String yhdlm=(String)session.getAttribute("yhdlm");
Connection conn  = null;
PreparedStatement ps=null;
PreparedStatement ps2=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="update nblt_ftgl set ftnr=empty_clob(),zhxgsj=SYSDATE,sfyxhf=? ";
	ls_sql+=" where  (tzbh='"+tzbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sfyxhf);
	ps.executeUpdate();
	ps.close();

	ls_sql = "select ftnr from nblt_ftgl where tzbh='"+tzbh+"' for update";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		oracle.sql.CLOB clobft = (oracle.sql.CLOB)rs.getClob(1);
		clobft.putString(1,ftnr);

		ls_sql = "update nblt_ftgl set ftzt=?,ftnr=? where tzbh='"+tzbh+"' "; //将大文本更新进去，呵呵
		ps2= conn.prepareStatement(ls_sql);
		ps2.setString(1, ftzt);
		ps2.setClob(2, clobft);
		ps2.executeUpdate();
		ps2.close();
	}
	ps.close();
	rs.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("编辑成功！");
	window.location.href="cktz.jsp?tzbh=<%=tzbh%>&yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>";
	//-->
	</SCRIPT>
	<br><a href="cktz.jsp?tzbh=<%=tzbh%>&yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>">如果您的的浏览器没有自动跳转，请点击这里！</a>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps2!= null) ps2.close(); 
		if (ps!= null) ps.close(); 
		if (rs!= null) rs.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>