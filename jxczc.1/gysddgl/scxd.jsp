<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%

String yhmc=(String)session.getAttribute("yhmc");
String gysddph=cf.GB2Uni(request.getParameter("gysddph"));
String gysmc=null;
String ddzt=null;//0：等待下单；1：已下单；2：已接收；3：已发货；4：已入库；5：已结算 
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
try { 
	conn=cf.getConnection();
	//检查订单状态是否符合出库标准
	ls_sql="select ddzt ";
	ls_sql+=" from  jxc_gysdd";
	ls_sql+=" where gysddph='"+gysddph+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ddzt=cf.fillNull(rs.getString("ddzt"));
	}
	else
	{
		out.print("<font color=red>错误！不存在的订单：["+gysddph+"]</font>");
		return;
	}
	rs.close();
	ps.close();
	if (ddzt.equals("0"))//0：等待下单；1：已下单；2：已接收；3：已发货；4：已入库；5：已结算 
	{
		out.print("<font color=red>错误！订单["+gysddph+"]未下单！</font>");
		return;
	}
	else if (ddzt.equals("1"))
	{
//		out.print("<font color=red>错误！订单["+gysddph+"]已经下单！</font>");
//		return;
	}
	else if (ddzt.equals("2"))
	{
		out.print("<font color=red>错误！订单["+gysddph+"]已接收！</font>");
		return;
	}
	else if (ddzt.equals("3"))
	{
		out.print("<font color=red>错误！订单["+gysddph+"]已发货！</font>");
		return;
	}
	else if (ddzt.equals("4"))
	{
		out.print("<font color=red>错误！订单["+gysddph+"]已入库！</font>");
		return;
	}
	else if (ddzt.equals("5"))
	{
		out.print("<font color=red>错误！订单["+gysddph+"]已结算！</font>");
		return;
	}
	//更新订单状态
	ls_sql="update jxc_gysdd set ddzt='0',xdr='',xdrq='',psfs='',yqdhsj='',bz='' ";
	ls_sql+=" where  gysddph='"+gysddph+"' ";
	ps= conn.prepareStatement(ls_sql);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("删除下单标志成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
		out.println("<BR>订单标志已删除，请重新下单！");
	}
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	out.print("SQL=" + ls_sql);
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
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}

%>
