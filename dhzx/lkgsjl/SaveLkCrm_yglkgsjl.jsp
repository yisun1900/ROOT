<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String jlh=cf.GB2Uni(request.getParameter("jlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String zt=null;
	ls_sql="select zt";
	ls_sql+=" from  crm_yglkgsjl";
	ls_sql+=" where jlh="+jlh ;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zt=cf.fillNull(rs.getString("zt"));
	}
	rs.close();
	ps.close();
	if (!zt.equals("1"))//1：录入申请；2：离开公司；3：返回公司；4：已审核
	{
		out.println("错误！状态不正确，已离开公司");
		return;
	}

	ls_sql="update crm_yglkgsjl set zt='2',sjlksj=TO_CHAR(SYSDATE,'hh24:mi:ss'),lklrr='"+yhmc+"',lklrsj=SYSDATE ";
	ls_sql+=" where jlh="+jlh ;
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
		alert("存盘成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
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