<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String sjs=null;
String clgw=null;
String hth=null;
java.sql.Date qtchtsj=null;
//double pms=0;
//double dj=0;
double tchtje=0;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
sjs=cf.GB2Uni(request.getParameter("sjs"));
clgw=cf.GB2Uni(request.getParameter("clgw"));
hth=cf.GB2Uni(request.getParameter("hth"));
ls=request.getParameter("qtchtsj");
try{
	if (!(ls.equals("")))  qtchtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[qtchtsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签套餐合同时间]类型转换发生意外:"+e);
	return;
}
/*ls=request.getParameter("pms");
try{
	if (!(ls.equals("")))  pms=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[pms]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[平米数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单价]类型转换发生意外:"+e);
	return;
}*/
ls=request.getParameter("tchtje");
try{
	if (!(ls.equals("")))  tchtje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tchtje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[套餐合同金额]类型转换发生意外:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String sfzhm=cf.GB2Uni(request.getParameter("sfzhm"));
String hyh=cf.GB2Uni(request.getParameter("hyh"));

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String qtchtbz=null;
	ls_sql="select qtchtbz";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qtchtbz=cf.fillNull(rs.getString("qtchtbz"));
	}
	rs.close();
	ps.close();

	if (qtchtbz.equals("Y"))
	{
		out.println("错误！已签套餐合同");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="insert into crm_tchtxx ( khbh,sjs,tchth,qtchtsj,tchtje,lrr,lrsj,lrbm,bz,clgw ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,sjs);
	ps.setString(3,hth);
	ps.setDate(4,qtchtsj);
	//ps.setDouble(5,pms);
	//ps.setDouble(6,dj);
	ps.setDouble(5,tchtje);
	ps.setString(6,lrr);
	ps.setDate(7,lrsj);
	ps.setString(8,lrbm);
	ps.setString(9,bz);
	ps.setString(10,clgw);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_zxkhxx set qtchtbz='Y',qtchtsj=?,tchtje=?,hth=?,sfzhm=?,hyh=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,qtchtsj);
	ps.setDouble(2,tchtje);
	ps.setString(3,hth);
	ps.setString(4,sfzhm);
	ps.setString(5,hyh);
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
	out.print(ls_sql);
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