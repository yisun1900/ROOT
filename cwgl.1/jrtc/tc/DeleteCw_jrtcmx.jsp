<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khzq = request.getParameter("khzq");
String ssfgs = request.getParameter("ssfgs");
String khbh = request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);



	String lx=null;
	ls_sql="select lx";
	ls_sql+=" from  cw_jrtcmx";
	ls_sql+=" where khzq='"+khzq+"' and ssfgs='"+ssfgs+"' and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		lx=rs.getString("lx");

		String sjsjsbz=null;//0：未提成；1：签单提成；2：结算提成
		if (lx.equals("1"))//1：签单提成；2：结算提成
		{
			sjsjsbz="0";
		}
		else {
			sjsjsbz="1";
		}

		ls_sql="update crm_khxx  set sjsjsbz='"+sjsjsbz+"'";
		ls_sql+=" where khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="delete from cw_jrtcmx";
		ls_sql+=" where khzq='"+khzq+"' and khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
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
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>