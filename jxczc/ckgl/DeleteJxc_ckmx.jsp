<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ckph = request.getParameter("ckph");

String[] ckxh =request.getParameterValues("chitem");

String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;

try {
	conn=cf.getConnection();    //得到连接


	//查询出库单
	String ckdzt = null;
	ls_sql = " select ckdzt ";
	ls_sql+= " from jxc_ckd ";
	ls_sql +=" where ckph='"+ckph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ckdzt=cf.fillNull(rs.getString("ckdzt"));
	}
	else
	{
		out.print("错误！不存在的出库单");
		return;
	}
	rs.close();
	ps.close();
	if (!ckdzt.equals("0"))
	{
		out.print("错误！出库单已提交");
		return;
	}


	conn.setAutoCommit(false);

	for (int i=0;i<ckxh.length ;i++ )
	{
		ls_sql="delete from jxc_ckmx  ";
		ls_sql+=" where jxc_ckmx.ckxh='"+ckxh[i]+"' and jxc_ckmx.ckph='"+ckph+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("删除成功");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>ls_sql=" + ls_sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              

