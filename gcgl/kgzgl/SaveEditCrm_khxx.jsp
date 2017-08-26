<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String kgzr=cf.GB2Uni(request.getParameter("kgzr"));
String kgzsm=cf.GB2Uni(request.getParameter("kgzsm"));
java.sql.Date kgzsj=null;
double clf=0;
double sge=0;
double sgebfb=0;
double gdkk=0;
ls=request.getParameter("clf");
try{
	if (!(ls.equals("")))  clf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量clf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[材料费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sge");
try{
	if (!(ls.equals("")))  sge=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sge不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[施工额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sgebfb");
try{
	if (!(ls.equals("")))  sgebfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sgebfb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[施工额百分比]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gdkk");
try{
	if (!(ls.equals("")))  gdkk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gdkk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[固定扣款]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("kgzsj");
try{
	if (!(ls.equals("")))  kgzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kgzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[出开工证时间]类型转换发生意外:"+e);
	return;
}


String wherekhbh=null;
wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="update crm_khxx set clf=?,sge=?,sgebfb=?,kgzsj=?,kgzr=?,kgzbz='Y',kgzsm=?,gdkk=?";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,clf);
	ps.setDouble(2,sge);
	ps.setDouble(3,sgebfb);
	ps.setDate(4,kgzsj);
	ps.setString(5,kgzr);
	ps.setString(6,kgzsm);
	ps.setDouble(7,gdkk);
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
	out.print("Exception: " +e);
	return;
}
finally 
{
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