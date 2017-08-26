<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<%
String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String bjjb=null;


try {
	conn=cf.getConnection();

	ls_sql="SELECT bjjb";
	ls_sql+=" FROM crm_khxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bjjb=cf.fillHtml(rs.getString("bjjb"));
	}
	rs.close();
	ps.close();

	String lx="";
	ls_sql="select lx";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" where bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lx=rs.getString("lx");
	}
	rs.close();
	ps.close();

	if (lx.equals("2"))//1：非套餐；2：套餐
	{
		response.sendRedirect("Bj_khbjmxBgdTcList.jsp?zjxxh="+zjxxh+"&khbh="+khbh);
	}
	else{
		response.sendRedirect("Bj_khbjmxBgdGxList.jsp?zjxxh="+zjxxh+"&khbh="+khbh);
	}

}
catch (Exception e) {
	out.print("发生意外: " + e);
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