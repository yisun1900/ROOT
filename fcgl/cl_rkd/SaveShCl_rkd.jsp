<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<%

String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;

//=====================================将入库批号写入数据库======================================================
String ls=null;

String shyj=cf.GB2Uni(request.getParameter("shyj"));
String shr=cf.GB2Uni(request.getParameter("shr"));

java.sql.Date shsj=null;
ls=request.getParameter("shsj");
try{
	if (!(ls.equals("")))  shsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量shsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审核时间]类型转换发生意外:"+e);
	return;
}

String rkph=cf.GB2Uni(request.getParameter("rkph"));


try {
	conn=cf.getConnection();

	ls_sql="update cl_rkd set rkzt='3',shsj=?,shr=?,shyj=?";
	ls_sql+=" where rkph='"+rkph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,shsj);
	ps.setString(2,shr);
	ps.setString(3,shyj);

	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
			alert("存盘成功!!!");
			window.close();
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
