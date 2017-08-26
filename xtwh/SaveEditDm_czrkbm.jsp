<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String czrkbm=null;
String czrkmc=null;
czrkbm=cf.GB2Uni(request.getParameter("czrkbm"));
czrkmc=cf.GB2Uni(request.getParameter("czrkmc"));
String whereczrkbm=null;
whereczrkbm=cf.GB2Uni(request.getParameter("whereczrkbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_czrkbm set czrkbm=?,czrkmc=? ";
	ls_sql+=" where  (czrkbm='"+whereczrkbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,czrkbm);
	ps.setString(2,czrkmc);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>´æÅÌÊ§°Ü£¡");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("´æÅÌ³É¹¦£¡");
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