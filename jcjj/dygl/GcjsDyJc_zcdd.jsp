<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ddbh=request.getParameter("ddbh");
String gysjslrr=cf.GB2Uni(request.getParameter("gysjslrr"));

java.sql.Date gysjslrsj=null;
ls=request.getParameter("gysjslrsj");
try{
	if (!(ls.equals("")))  gysjslrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gysjslrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[供应商接收录入时间]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt="";
	String tdqrbz="";
	ls_sql =" select clzt,tdqrbz";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
		tdqrbz=cf.fillNull(rs.getString("tdqrbz"));
	}
	rs.close();
	ps.close();

	if (clzt.equals("11") || (clzt.equals("99") && tdqrbz.equals("Y")) || clzt.equals("13"))
	{
	}
	else{
		out.println("<BR>错误，存盘失败！订单状态不正确，可能已接受");
		return;
	}

	if (clzt.equals("11"))
	{
		ls_sql="update jc_zcdd set gysjslrr=?,gysjslrsj=SYSDATE,clzt='13'";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,gysjslrr);
		ps.executeUpdate();
		ps.close();
	}
	else if (clzt.equals("99"))
	{
		ls_sql="update jc_zcdd set gysjslrr=?,gysjslrsj=SYSDATE,tdqrbz='J'";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,gysjslrr);
		ps.executeUpdate();
		ps.close();
	}

	response.sendRedirect("/jcjj/dygl/gyszcfj.jsp?ddbh="+ddbh);

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>