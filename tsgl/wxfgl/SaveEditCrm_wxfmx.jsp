<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
double wxrgf=0;
double wxcf=0;
double wxclf=0;
double wxzfy=0;
double zrfcdfy=0;
double sqyzfy=0;
double gscdfy=0;
double qtfcdfy=0;
String sfksj=null;
String fysm=null;
ls=request.getParameter("wxrgf");
try{
	if (!(ls.equals("")))  wxrgf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wxrgf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[维修人工费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wxcf");
try{
	if (!(ls.equals("")))  wxcf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wxcf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[维修车费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wxclf");
try{
	if (!(ls.equals("")))  wxclf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wxclf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[维修材料费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wxzfy");
try{
	if (!(ls.equals("")))  wxzfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wxzfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[维修总费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zrfcdfy");
try{
	if (!(ls.equals("")))  zrfcdfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zrfcdfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[施工队承担费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sqyzfy");
try{
	if (!(ls.equals("")))  sqyzfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqyzfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[业主承担费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gscdfy");
try{
	if (!(ls.equals("")))  gscdfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gscdfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[公司承担费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qtfcdfy");
try{
	if (!(ls.equals("")))  qtfcdfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qtfcdfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它方承担费用]类型转换发生意外:"+e);
	return;
}
sfksj=cf.GB2Uni(request.getParameter("sfksj"));
fysm=cf.GB2Uni(request.getParameter("fysm"));
String lrr=null;
java.sql.Date lrsj=null;
lrr=cf.GB2Uni(request.getParameter("lrr"));
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

String lrxh=cf.GB2Uni(request.getParameter("lrxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String jsbz=null;
	String tsjlh=null;
	ls_sql="select jsbz,tsjlh";
	ls_sql+=" from  crm_wxfmx";
	ls_sql+=" where  (lrxh="+lrxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jsbz=rs.getString("jsbz");
		tsjlh=rs.getString("tsjlh");
	}
	else{
		out.println("错误！序号："+lrxh+"不存在");
		return;
	}
	rs.close();
	ps.close();

	if (jsbz.equals("Y"))
	{
		out.println("错误！序号："+lrxh+"已结算，不能再修改");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_wxfmx set wxrgf=?,wxcf=?,wxclf=?,wxzfy=?,zrfcdfy=?,sqyzfy=?,gscdfy=?,qtfcdfy=?,sfksj=?,fysm=?,lrr=?,lrsj=?  ";
	ls_sql+=" where lrxh="+lrxh;
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,wxrgf);
	ps.setDouble(2,wxcf);
	ps.setDouble(3,wxclf);
	ps.setDouble(4,wxzfy);
	ps.setDouble(5,zrfcdfy);
	ps.setDouble(6,sqyzfy);
	ps.setDouble(7,gscdfy);
	ps.setDouble(8,qtfcdfy);
	ps.setString(9,sfksj);
	ps.setString(10,fysm);
	ps.setString(11,lrr);
	ps.setDate(12,lrsj);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="select sum(wxrgf),sum(wxcf),sum(wxclf),sum(wxzfy),sum(zrfcdfy),sum(sqyzfy),sum(gscdfy),sum(qtfcdfy)";
	ls_sql+=" from  crm_wxfmx";
	ls_sql+=" where tsjlh='"+tsjlh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wxrgf=rs.getDouble(1);
		wxcf=rs.getDouble(2);
		wxclf=rs.getDouble(3);
		wxzfy=rs.getDouble(4);
		zrfcdfy=rs.getDouble(5);
		sqyzfy=rs.getDouble(6);
		gscdfy=rs.getDouble(7);
		qtfcdfy=rs.getDouble(8);
	}
	rs.close();
	ps.close();
	
	ls_sql="update crm_tsjl set wxrgf=?,wxcf=?,wxclf=?,wxzfy=?,zrfcdfy=?,sqyzfy=?,gscdfy=?,qtfcdfy=?";
	ls_sql+=" where tsjlh='"+tsjlh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,wxrgf);
	ps.setDouble(2,wxcf);
	ps.setDouble(3,wxclf);
	ps.setDouble(4,wxzfy);
	ps.setDouble(5,zrfcdfy);
	ps.setDouble(6,sqyzfy);
	ps.setDouble(7,gscdfy);
	ps.setDouble(8,qtfcdfy);
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