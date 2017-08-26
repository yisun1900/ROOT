<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String[] zjxxh = request.getParameterValues("zjxxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<zjxxh.length ;i++ )
	{
		String sfwc=null;
		ls_sql="select sfwc";
		ls_sql+=" from  crm_zjxdj";
		ls_sql+=" where zjxxh='"+zjxxh[i]+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sfwc=cf.fillNull(rs.getString("sfwc"));
		}
		rs.close();
		ps.close();

		if (!sfwc.equals("K"))//N：未完成；Y：已完成；K：已扣款
		{
			conn.rollback();
			out.println("错误！增减项序号状态不正确:"+zjxxh[i]);
			return;
		}



		ls_sql="update crm_zjxdj set sfwc='Y',czkkr=null,czkksj=null,czkkje=0";
		ls_sql+=" where zjxxh='"+zjxxh[i]+"'  ";
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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