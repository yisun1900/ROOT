<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] psdh = request.getParameterValues("psdh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<psdh.length ;i++ )
	{
		String pszt=null;
		ls_sql=" SELECT pszt ";
		ls_sql+=" FROM cl_psd ";
		ls_sql+=" where psdh='"+psdh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			pszt=cf.fillNull(rs.getString("pszt"));
		}
		rs.close();
		ps.close();

		if (!pszt.equals("1") && !pszt.equals("2"))//1：未提交；2：已提交；3：已配送
		{
			conn.rollback();
			out.print("错误！已配送，不能再删除");
			return;
		}
		
		ls_sql="delete from cl_psdmx ";
		ls_sql+=" where psdh='"+psdh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		
		ls_sql="delete from cl_psd ";
		ls_sql+=" where psdh='"+psdh[i]+"'";
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
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);

	try{
		if (ps!= null) ps.close(); 
		if (rs!= null) rs.close();
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>