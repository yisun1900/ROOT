<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;


String khbh=null;
String tccpdlbm=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
tccpdlbm=cf.GB2Uni(request.getParameter("tccpdlbm"));


double sjjmsl=0;
ls=request.getParameter("sjjmsl");
try{
	if (!(ls.equals("")))  sjjmsl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjjmsl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[减免数量]类型转换发生意外:"+e);
	return;
}

String tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
 
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update tc_csrjkhdbjmj set sjjmsl="+sjjmsl+",sjjmje=jmdj*"+sjjmsl;
	ls_sql+=" where khbh='"+khbh+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>