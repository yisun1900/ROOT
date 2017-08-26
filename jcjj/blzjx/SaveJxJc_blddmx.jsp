<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String lx=request.getParameter("lx");
String blzjxyybm=request.getParameter("blzjxyybm");

String lrxh=request.getParameter("lrxh");
String yddbh=request.getParameter("yddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double bljxje=0;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="update jc_blddmx set lx=?,blzjxyybm=? ";
	ls_sql+=" where  (lrxh="+lrxh+") and lx in('1','3') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,lx);
	ps.setString(2,blzjxyybm);
	ps.executeUpdate();
	ps.close();


	ls_sql="select sum(dj*sl)";
	ls_sql+=" from  jc_blddmx";
	ls_sql+=" where  yddbh='"+yddbh+"' and lx='3' ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bljxje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="update jc_mmydd set bljxje=?";
	ls_sql+=" where  (yddbh='"+yddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,bljxje);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！玻璃减项金额=<%=bljxje%>");
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>