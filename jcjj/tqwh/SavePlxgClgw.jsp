<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String[] ddbh=request.getParameterValues("ddbh");
String clgw=cf.GB2Uni(request.getParameter("clgw"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<ddbh.length ;i++ )
	{

		ls_sql="update jc_zcdd set clgw=?";
		ls_sql+=" where  (ddbh='"+ddbh[i]+"')  ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,clgw);
		ps.executeUpdate();
		ps.close();

		ls_sql="update jc_zczjx set clgw=?";
		ls_sql+=" where  (ddbh='"+ddbh[i]+"')  ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,clgw);
		ps.executeUpdate();
		ps.close();

		//集成订单
		ls_sql="update jc_jcdd set clgw=?";
		ls_sql+=" where ddbh='"+ddbh[i]+"' and lx='4'";//1：木门；2：橱柜；3：家具；4：主材
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,clgw);
		ps.executeUpdate();
		ps.close();
	}

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