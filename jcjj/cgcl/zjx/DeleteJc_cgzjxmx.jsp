<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] xh=request.getParameterValues("xh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<xh.length ;i++ )
	{
		String clzt=null;
		ls_sql="select clzt";
		ls_sql+=" from  jc_cgzjx,jc_cgzjxmx";
		ls_sql+=" where jc_cgzjx.ddbh=jc_cgzjxmx.ddbh and  jc_cgzjx.zjxxh=jc_cgzjxmx.zjxxh and  jc_cgzjxmx.xh="+xh[i];
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			clzt=rs.getString(1);
		}
		else{
			conn.rollback();
			out.println("错误！增减项序号不存在："+xh[i]);
			return;
		}
		rs.close();
		ps.close();
		if (!clzt.equals("00"))//00：录入未完成
		{
			conn.rollback();
			out.println("错误！增减项已完成，不能再删除："+xh[i]);
			return;
		}

		ls_sql="delete from jc_cgzjxmx";
		ls_sql+=" where xh="+xh[i];
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>