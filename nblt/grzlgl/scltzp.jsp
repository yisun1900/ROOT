<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
String dlygbh=(String)session.getAttribute("ygbh");
String photoname=cf.GB2Uni(request.getParameter("photoname"));



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//查询是否已经修改过论坛资料
	ls_sql="update nblt_grzl set lttx=? ";
	ls_sql+=" where  (ltid='"+dlygbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,photoname);

	if (ps.executeUpdate()!=1)
	{
		conn.rollback();
		out.println("<BR>存盘失败！");
	}

	%>
		<SCRIPT language=javascript >
		<!--
		alert("编辑个人资料成功！");
		window.location.href="/nblt/fwlt/ktz.jsp";
		window.close();
		//-->
		</SCRIPT>
		<br><a href="/nblt/fwlt/ktz.jsp">如果您的的浏览器没有自动跳转，请点击这里！</a>
		<%
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
