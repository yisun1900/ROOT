<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010114")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>

<%
String dzbjbz=cf.GB2Uni(request.getParameter("dzbjbz"));
String dzbjbz1=cf.GB2Uni(request.getParameter("dzbjbz1"));

String dwbh=cf.GB2Uni(request.getParameter("dwbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	 conn.setAutoCommit(false);

	ls_sql="delete from bj_dzbjbz";
	ls_sql+=" where dwbh='"+dwbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_dzbjbz(dwbh,dzbjbz,dzbjbz1) values('"+dwbh+"',EMPTY_CLOB(),EMPTY_CLOB())";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	oracle.sql.CLOB  clob=null;
	oracle.sql.CLOB  clob1=null;

	ls_sql="select dzbjbz,dzbjbz1";
	ls_sql+=" from  bj_dzbjbz";
	ls_sql+=" where dwbh='"+dwbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clob=(oracle.sql.CLOB)rs.getClob("dzbjbz");
		clob1=(oracle.sql.CLOB)rs.getClob("dzbjbz1");
	}
	rs.close();
	ps.close();

	clob.putString(1,dzbjbz);
	clob1.putString(1,dzbjbz1);

	ls_sql="update bj_dzbjbz set dzbjbz=?,dzbjbz1=?";
	ls_sql+=" where dwbh='"+dwbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setClob(1,clob);
	ps.setClob(2,clob1);
	ps.executeUpdate();
	ps.close();

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
	out.print("<BR>" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>






