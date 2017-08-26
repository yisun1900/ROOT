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
String psfs=cf.GB2Uni(request.getParameter("psfs"));
String shfgs=cf.GB2Uni(request.getParameter("shfgs"));
String bz=cf.GB2Uni(request.getParameter("bz"));
String sj=cf.GB2Uni(request.getParameter("yqdhsj"));
java.sql.Date yqdhsj=null;
try{
	if (!(sj.equals("")))  yqdhsj=java.sql.Date.valueOf(sj.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yqdhsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[要求到货时间]类型转换发生意外:"+e);
	return;
}
String clbm=null;
double dhsl=0;
String dqbm=null;
String gysmc=null;
String ddzt=null;//0：等待下单；1：已下单；2：已接收；3：已发货；4：已入库；5：已结算 
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
try { 
	conn=cf.getConnection();
	conn.setAutoCommit(false);//关闭事物处理
	//检查订单状态是否符合出库标准
	ls_sql="select ddzt,dqbm ";
	ls_sql+=" from  jxc_gysdd";
	ls_sql+=" where gysddph='"+gysddph+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ddzt=cf.fillNull(rs.getString("ddzt"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	else
	{
		out.print("<font color=red>错误！不存在的订单：["+gysddph+"]</font>");
		conn.rollback();return;
	}
	rs.close();
	ps.close();
	if (ddzt.equals("0"))//0：等待下单；1：已下单；2：已接收；3：已发货；4：已入库；5：已结算 
	{
//		out.print("订单状态正确！");
	}
	else if (ddzt.equals("1"))
	{
		out.print("<font color=red>错误！订单["+gysddph+"]已经下单！</font>");
		conn.rollback();return;
	}
	else if (ddzt.equals("2"))
	{
		out.print("<font color=red>错误！订单["+gysddph+"]已接收！</font>");
		conn.rollback();return;
	}
	else if (ddzt.equals("3"))
	{
		out.print("<font color=red>错误！订单["+gysddph+"]已发货！</font>");
		conn.rollback();return;
	}
	else if (ddzt.equals("4"))
	{
		out.print("<font color=red>错误！订单["+gysddph+"]已入库！</font>");
		conn.rollback();return;
	}
	else if (ddzt.equals("5"))
	{
		out.print("<font color=red>错误！订单["+gysddph+"]已结算！</font>");
		conn.rollback();return;
	}
	//更给地区材料价格表中的订货数量
	ls_sql="select clbm,dhsl ";
	ls_sql+=" from  jxc_gysddmx ";
	ls_sql+=" where gysddph='"+gysddph+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		clbm=cf.fillNull(rs.getString("clbm"));
		dhsl=rs.getDouble("dhsl");
		//更新已采购数量
		ls_sql="update jxc_cljgb set ycgsl=ycgsl+"+dhsl+" ";
		ls_sql+=" where  clbm='"+clbm+"' and dqbm='"+dqbm+"' ";
		ps2= conn.prepareStatement(ls_sql);
		ps2.executeUpdate();
		ps2.close();
	}
	rs.close();
	ps.close();
	//更新订单状态
	ls_sql="update jxc_gysdd set ddzt='1',xdr=?,xdrq=SYSDATE,psfs=?,yqdhsj=?,bz=?,shfgs=? ";
	ls_sql+=" where  gysddph='"+gysddph+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,yhmc);
	ps.setString(2,psfs);
	ps.setDate(3,yqdhsj);
	ps.setString(4,bz);
	ps.setString(5,shfgs);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
		conn.rollback();return;
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("下单成功！");
		window.close();
		//-->
		</SCRIPT>
		<center><BR>下单成功，请通知厂家接收！</center>
		<!-- <center><BR><a href="printgysdd.jsp?gysddph=<%=gysddph%>" target="_back">打印订单</a></center> -->
		<center><BR><a href="/jxcdy/printgysdd.jsp?gysddph=<%=gysddph%>" target="_back">打印订单</a></center>
		<%
	}
		conn.commit();//提交事物
}
catch (Exception e) {
	conn.rollback();//事物回滚
	out.print("存盘失败,发生意外: " + e);
	out.print("SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);//打开事物处理
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
