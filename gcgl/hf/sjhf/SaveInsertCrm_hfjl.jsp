<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String hfjlh=request.getParameter("hfjlh");
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String jglxbm=request.getParameter("jglxbm");
String hfsm=cf.GB2Uni(request.getParameter("hfsm"));
String bz=cf.GB2Uni(request.getParameter("bz"));

String clfs=cf.GB2Uni(request.getParameter("clfs"));
String hfr=cf.GB2Uni(request.getParameter("hfr"));
String hfbm=request.getParameter("hfbm");
java.sql.Date hfsj=null;

ls=request.getParameter("hfsj");
try{
	if (!(ls.equals("")))  hfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量hfsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[回访时间]类型转换发生意外:"+e);
	return;
}

String[] dwbh=request.getParameterValues("dwbh");





Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	
	conn.setAutoCommit(false);

	
	ls_sql="insert into crm_sjhfjl (hfjlh,khbh,jglxbm,hfsm,clfs,hfsj,hfr,hfbm,bz) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hfjlh);
	ps.setString(2,khbh);
	ps.setString(3,jglxbm);
	ps.setString(4,hfsm);
	ps.setString(5,clfs);
	ps.setDate(6,hfsj);
	ps.setString(7,hfr);
	ps.setString(8,hfbm);
	ps.setString(9,bz);
	ps.executeUpdate();
	ps.close();

	if (dwbh!=null)
	{
		for (int i=0;i<dwbh.length ;i++ )
		{
			ls_sql="insert into crm_sjhffkbm (hfjlh,dwbh,clzt ) ";
			ls_sql+=" values (?,?,'N') ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,hfjlh);
			ps.setString(2,dwbh[i]);
			ps.executeUpdate();
			ps.close();
		}
	}

	ls_sql="update crm_khxx set sjhfsj=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,hfsj);
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
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL: " + ls_sql);
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