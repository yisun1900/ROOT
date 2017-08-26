<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ysjlh=request.getParameter("ysjlh");
String gcysxmbm=request.getParameter("gcysxmbm");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sjysjg="0";//0：合格；1：需整改

	String clbz=null;
	ls_sql="select clbz";
	ls_sql+=" from  crm_heysjl";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clbz=cf.fillNull(rs.getString("clbz"));
	}
	rs.close();
	ps.close();

	if (!clbz.equals("9"))//9：录入未完成；0：没问题；1: 整改未接收；2：接收；3：已处理；4：已解决；5：验收通过；6：验收未通过
	{
		out.println("错误！录入已完成，不能再修改");
		return;
	}

	ls_sql="update crm_heysjl set sjysjg='0'";//0：合格；1：不合格
	ls_sql+=" where ysjlh='"+ysjlh+"' ";
	ps= conn.prepareStatement(ls_sql);
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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