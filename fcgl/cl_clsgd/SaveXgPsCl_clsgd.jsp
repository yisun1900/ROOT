<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
//==================================查询最大申购批号=======================================================
String ls=null;
double yf=0;
java.sql.Date shsj=null;
String pslrr=null;
java.sql.Date pslrsj=null;
String bz=null;

ls=request.getParameter("yf");
try{
	if (!(ls.equals("")))  yf=Double.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[运费]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("shsj");
try{
	if (!(ls.equals("")))  shsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量shsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[送货时间]类型转换发生意外:"+e);
	return;
}

pslrr=cf.GB2Uni(request.getParameter("pslrr"));
ls=request.getParameter("pslrsj");
try{
	if (!(ls.equals("")))  pslrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pslrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[配送录入时间]类型转换发生意外:"+e);
	return;
}

bz=cf.GB2Uni(request.getParameter("bz"));

String sgph=cf.GB2Uni(request.getParameter("sgph"));

String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
//=====================================将申购批号写入数据库======================================================
try {
	conn=cf.getConnection();

	ls_sql="update cl_clsgd set sgzt='7',shsj=?,yf=?,pslrr=?,pslrsj=?,bz=?";
	ls_sql+=" where sgph='"+sgph+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,shsj);
	ps.setDouble(2,yf);
	ps.setString(3,pslrr);
	ps.setDate(4,pslrsj);
	ps.setString(5,bz);
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
