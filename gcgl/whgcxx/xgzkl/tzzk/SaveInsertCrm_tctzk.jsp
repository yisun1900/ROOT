
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String tzjlh=cf.GB2Uni(request.getParameter("tzjlh"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));

double bzjgzk=0;
ls=request.getParameter("bzjgzk");
try{
	if (!(ls.equals("")))  bzjgzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bzjgzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[套餐标准价格折扣]类型转换发生意外:"+e);
	return;
}

double mjzjzk=0;
ls=request.getParameter("mjzjzk");
try{
	if (!(ls.equals("")))  mjzjzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量mjzjzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[面积增加金额折扣]类型转换发生意外:"+e);
	return;
}

double zcsjzk=0;
ls=request.getParameter("zcsjzk");
try{
	if (!(ls.equals("")))  zcsjzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zcsjzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材升级差价折扣]类型转换发生意外:"+e);
	return;
}

double zcclzk=0;
ls=request.getParameter("zcclzk");
try{
	if (!(ls.equals("")))  zcclzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zcclzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材超量加价折扣]类型转换发生意外:"+e);
	return;
}

double zcsfzk=0;
ls=request.getParameter("zcsfzk");
try{
	if (!(ls.equals("")))  zcsfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zcsfzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[需收费主材折扣]类型转换发生意外:"+e);
	return;
}

double zcjmzk=0;
ls=request.getParameter("zcjmzk");
try{
	if (!(ls.equals("")))  zcjmzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zcjmzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材减免折扣]类型转换发生意外:"+e);
	return;
}

double ddzccjzk=0;
ls=request.getParameter("ddzccjzk");
try{
	if (!(ls.equals("")))  ddzccjzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ddzccjzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[顶配主材折扣]类型转换发生意外:"+e);
	return;
}

double ddzcclzk=0;
ls=request.getParameter("ddzcclzk");
try{
	if (!(ls.equals("")))  ddzcclzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ddzcclzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[选配主材折扣]类型转换发生意外:"+e);
	return;
}

double tcwgczk=0;
ls=request.getParameter("tcwgczk");
try{
	if (!(ls.equals("")))  tcwgczk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tcwgczk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[套餐外施工项折扣]类型转换发生意外:"+e);
	return;
}

double tcgcclzk=0;
ls=request.getParameter("tcgcclzk");
try{
	if (!(ls.equals("")))  tcgcclzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tcgcclzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程超量加价折扣]类型转换发生意外:"+e);
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="delete from crm_tctzk  ";
	ls_sql+=" where tzjlh='"+tzjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into crm_tctzk ( tzjlh,khbh,bzjgzk,mjzjzk,zcsjzk,zcclzk,zcsfzk,zcjmzk,ddzccjzk,ddzcclzk,tcwgczk,tcgcclzk) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tzjlh);
	ps.setString(2,khbh);
	ps.setDouble(3,bzjgzk);
	ps.setDouble(4,mjzjzk);
	ps.setDouble(5,zcsjzk);
	ps.setDouble(6,zcclzk);
	ps.setDouble(7,zcsfzk);
	ps.setDouble(8,zcjmzk);
	ps.setDouble(9,ddzccjzk);
	ps.setDouble(10,ddzcclzk);
	ps.setDouble(11,tcwgczk);
	ps.setDouble(12,tcgcclzk);

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
	out.print("<BR>SQL" + ls_sql);
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