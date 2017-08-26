<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String wjlrr=cf.GB2Uni(request.getParameter("wjlrr"));
java.sql.Date wjsj=null;
ls=request.getParameter("wjsj");
try{
	if (!(ls.equals("")))  wjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[完结时间]类型转换发生意外:"+e);
	return;
}

String ddbh=request.getParameter("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	String oldclzt=null;
	String oldycclzt=null;
	ls_sql="select clzt,ycclzt";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		oldclzt=rs.getString("clzt");
		oldycclzt=cf.fillNull(rs.getString("ycclzt"));
	}
	rs.close();
	ps.close();
	if (!oldclzt.equals("33"))
	{
		out.println("！错误，处理状态不正确");
		return;
	}

	if (oldycclzt.equals("1"))//0：未延迟；1：延迟未核实；2：延迟原因属实；3：延迟原因不属实
	{
		out.println("！错误，延迟未处理，不能完结");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update jc_cgdd set wjsj=?,wjlrr=?,clzt='35'";
	ls_sql+=" where  ddbh='"+ddbh+"' and clzt='33'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,wjsj);
	ps.setString(2,wjlrr);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_cgzjx set clzt='04',azwcsj=?";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,wjsj);
	ps.executeUpdate();
	ps.close();

	
	conn.commit();

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
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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