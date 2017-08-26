<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String dadbh=cf.GB2Uni(request.getParameter("dadbh"));
String dagdr=cf.GB2Uni(request.getParameter("dagdr"));

String ls=null;
java.sql.Date dagdsj=null;
ls=request.getParameter("dagdsj");
try{
	if (!(ls.equals("")))  dagdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dagdsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[归档时间]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*) ";
	ls_sql+=" from  crm_gcdagl";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and gdbz='N'";//Y：归档；N：借出
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("错误！有档案借出未归还，不能归档");
		return;
	}


	ls_sql="update crm_khxx set dalqbz='3',dadbh=?,dagdr=?,dagdsj=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dadbh);
	ps.setString(2,dagdr);
	ps.setDate(3,dagdsj);
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
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{

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