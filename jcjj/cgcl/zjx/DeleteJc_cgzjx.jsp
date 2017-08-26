<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] zjxxh = request.getParameterValues("zjxxh");

String ddbh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String clzt=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<zjxxh.length ;i++ )
	{
		ls_sql="select ddbh,clzt";
		ls_sql+=" from  jc_cgzjx";
		ls_sql+=" where zjxxh='"+zjxxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ddbh=rs.getString("ddbh");
			clzt=rs.getString("clzt");
		}
		rs.close();
		ps.close();
		if (!clzt.equals("00"))//00：录入未完成
		{
			conn.rollback();
			out.println("<BR>错误！增减项已完成，不能再删除：增减项序号="+zjxxh[i]);
			return;
		}

		//删除增减项
		ls_sql="delete from jc_cgzjxmx ";
		ls_sql+=" where zjxxh='"+zjxxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from jc_cgzjx ";
		ls_sql+=" where zjxxh='"+zjxxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

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
	out.print("存盘失败,发生意外: " + e);
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