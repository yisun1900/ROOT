<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<body bgcolor="#F5FBFF">
<%
String ygbh=(String)session.getAttribute("ygbh");
String yhdlm=cf.GB2Uni(request.getParameter("yhdlm"));
String dlygbh=ygbh;
String wherelttx=cf.GB2Uni(request.getParameter("lttx"));
String lttx=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ltid,ltnc,lttx,ftsl,htsl,grsm ";
	ls_sql+=" from  nblt_grzl";
	ls_sql+=" where  (ltid='"+dlygbh+"') ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		lttx=cf.fillNull(rs.getString("lttx"));
	}
	rs.close();
	ps.close();
	if (wherelttx!=null && !(wherelttx.equals("")))
	{
		out.print("<br><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"/nblt/grzlgl/lttx/"+wherelttx+".gif\">");
	}
	else if (lttx!=null && !(lttx.equals("")))
	{
		out.print("<br><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"/nblt/grzlgl/lttx/"+lttx+".gif\">");
	}
}
catch (Exception e) {
	out.print("<BR>³ö´í:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
</body>