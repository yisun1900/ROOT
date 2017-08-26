<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String xdr=null;
java.sql.Date xdsj=null;

xdr=cf.GB2Uni(request.getParameter("xdr"));
ls=request.getParameter("xdsj");
try{
	if (!(ls.equals("")))  xdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xdsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[返补单下单日期]类型转换发生意外:"+e);
	return;
}

String fbdbh=null;
fbdbh=cf.GB2Uni(request.getParameter("fbdbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String zt=null;
	ls_sql="select zt";
	ls_sql+=" from  crm_fbdgl";
	ls_sql+=" where fbdbh='"+fbdbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zt=cf.fillNull(rs.getString("zt"));
	}
	rs.close();
	ps.close();
	if (!zt.equals("2"))//1：录入、2：出方案、3：下单、4：备货完成、9：安装完成
	{
		out.println("错误！处理状态不正确");
		return;
	}

	ls_sql="update crm_fbdgl set xdr=?,xdsj=?,zt='3'";
	ls_sql+=" where fbdbh='"+fbdbh+"' and zt='2'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xdr);
	ps.setDate(2,xdsj);
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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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