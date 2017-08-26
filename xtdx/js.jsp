<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<html>
<head>
<title>短信接收页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">

<%  
//String fshm = request.getParameter("mobile");//接收传递过来的手机号码
//String dxnr=cf.GB2Uni(request.getParameter("msg"));//接收传递过来的短信内容
//String jssj = request.getParameter("Time");//接收传递过来的信息发送时间



String ls=null;
String xh=null;
String fshm=null;
String dxnr=null;
fshm=cf.GB2Uni(request.getParameter("mobile"));
dxnr=cf.GB2Uni(cf.getParameter(request,"msg"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	conn.setAutoCommit(false);

	ls_sql=" select lpad(NVL(sum(xh)+1,1),11,0) xh ";
	ls_sql+=" from dx_jsdx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getString("xh");//序号
	}
	rs.close();
	ps.close();

	ls_sql="insert into dx_jsdx ( xh,fshm,jssj,dxnr ) ";
	ls_sql+=" values ( ?,?,SYSDATE,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xh);
	ps.setString(2,fshm);
	ps.setString(3,dxnr);
	if (ps.executeUpdate()!=1)//0:失败 1:成功
	{
		out.println("0");
	}
	else
	{
		out.println("1");
	}
	conn.commit();
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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

</body>
</html>
