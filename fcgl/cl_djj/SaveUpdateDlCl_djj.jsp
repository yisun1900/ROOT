<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%

String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;

//=====================================将出库批号写入数据库======================================================
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String czxh=cf.GB2Uni(request.getParameter("czxh"));
String sfjm=cf.GB2Uni(request.getParameter("sfjm"));
String[] cldlmc=request.getParameterValues("cldlmc");
String[] jmyy=request.getParameterValues("jmyy");


String shzt="";
if (sfjm.equals("2"))
{
	shzt="1";
}

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="update cl_djj set sfjm=?,shzt=?";
	ls_sql+=" where  (czxh='"+czxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sfjm);
	ps.setString(2,shzt);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<cldlmc.length ;i++ )
	{
		ls_sql="update cl_djjflmx set jmyy='"+cf.GB2Uni(jmyy[i])+"'";
		ls_sql+=" where khbh='"+khbh+"' and cldlmc='"+cf.GB2Uni(cldlmc[i])+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("保存成功！");
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
