<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] sgph=request.getParameterValues("sgph");
if (sgph.length>1)
{
	out.println("错误！每次只能删除1条");
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	String sfzcgd=null;
	ls_sql="select sfzcgd";
	ls_sql+=" from  jxc_clsgd";
	ls_sql+=" where sgph='"+sgph[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfzcgd=cf.fillNull(rs.getString("sfzcgd"));
	}
	rs.close();
	ps.close();

	if (!sfzcgd.equals("M"))//N：未转；Y：转为采购计划；M：转为供应商订单
	{
		conn.rollback();
		out.println("错误！未转为供应商订单");
		return;
	}

	String gysddph=null;
	String ddzt=null;
	ls_sql="select gysddph,ddzt";
	ls_sql+=" from  jxc_gysdd";
	ls_sql+=" where sgph='"+sgph[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gysddph=cf.fillNull(rs.getString("gysddph"));
		ddzt=cf.fillNull(rs.getString("ddzt"));
	}
	rs.close();
	ps.close();

	if (!ddzt.equals("0"))//7：未提交；0：已提交；1：已下单；2：已接受；3：部分发货；5：已完成发货；4：已入库；6：正在办理入库； 9：已结算
	{
		conn.rollback();
		out.println("错误！供应商订单已下单");
		return;
	}


	ls_sql="delete from jxc_gysdd ";
	ls_sql+=" where gysddph='"+gysddph+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from jxc_gysddmx ";
	ls_sql+=" where gysddph='"+gysddph+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update  jxc_clsgd set sfzcgd='N',sfrksgdw='N'";
	ls_sql+=" where sgph='"+sgph[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();
		
	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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