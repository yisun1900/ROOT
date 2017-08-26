<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zgjlh=request.getParameter("zgjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String xjjlh=null;
	ls_sql="select xjjlh";
	ls_sql+=" from  kp_zggdmx";
	ls_sql+=" where zgjlh='"+zgjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xjjlh=rs.getString("xjjlh");
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	ls_sql="delete from kp_zggdmx  ";
	ls_sql+=" where zgjlh='"+zgjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	int zgcount=0;
	ls_sql="select count(*)";
	ls_sql+=" from  kp_zggdmx";
	ls_sql+=" where xjjlh='"+xjjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zgcount=rs.getInt(1);
	}
	rs.close();
	ps.close();

	String wtclbz="";//B：无整改；N：整改未接收；C：在处理；Y：已解决
	if (zgcount>0)
	{
		wtclbz="N";
	}
	else{
		wtclbz="B";
	}

	ls_sql="update kp_xjgdjl set wtclbz='"+wtclbz+"'";
	ls_sql+=" where  xjjlh='"+xjjlh+"'";
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
	out.print("存盘失败,发生意外: " + e);
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