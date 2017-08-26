<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
//==================================查询最大申购批号=======================================================
String ls=null;
String lrr=null;
String dwbh=null;
java.sql.Date lrsj=null;

lrr=cf.GB2Uni(request.getParameter("lrr"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));

ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}

String sgph=cf.GB2Uni(request.getParameter("sgph"));
String bz=cf.GB2Uni(request.getParameter("bz"));

String psfs=null;
java.sql.Date jhshsj=null;
psfs=cf.GB2Uni(request.getParameter("psfs"));
ls=request.getParameter("jhshsj");
try{
	if (!(ls.equals("")))  jhshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhshsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划送货时间]类型转换发生意外:"+e);
	return;
}


String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
//=====================================将申购批号写入数据库======================================================
try {
	conn=cf.getConnection();

	ls_sql="update cl_clsgd set dwbh=?,lrr=?,lrsj=?,bz=?,psfs=?,jhshsj=?";
	ls_sql+=" where sgph='"+sgph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dwbh);
	ps.setString(2,lrr);
	ps.setDate(3,lrsj);
	ps.setString(4,bz);
	ps.setString(5,psfs);
	ps.setDate(6,jhshsj);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
			alert("存盘成功");
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
