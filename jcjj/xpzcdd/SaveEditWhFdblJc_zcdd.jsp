<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
double fdbl=0;
ls=request.getParameter("fdbl");
try{
	if (!(ls.equals("")))  fdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fdbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[正常品厂商结算比例]类型转换发生意外:"+e);
	return;
}

double khfdbl=0;
ls=request.getParameter("khfdbl");
try{
	if (!(ls.equals("")))  khfdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量khfdbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[正常品客户返点比例]类型转换发生意外:"+e);
	return;
}
double tcjrbl=0;
ls=request.getParameter("tcjrbl");
try{
	if (!(ls.equals("")))  tcjrbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tcjrbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[正常品提成记入比例]类型转换发生意外:"+e);
	return;
}



double tjpfdbl=0;
ls=request.getParameter("tjpfdbl");
try{
	if (!(ls.equals("")))  tjpfdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tjpfdbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[特价品厂商结算比例]类型转换发生意外:"+e);
	return;
}

double tjpkhfdbl=0;
ls=request.getParameter("tjpkhfdbl");
try{
	if (!(ls.equals("")))  tjpkhfdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量khfdbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[特价品客户返点比例]类型转换发生意外:"+e);
	return;
}
double tjptcjrbl=0;
ls=request.getParameter("tjptcjrbl");
try{
	if (!(ls.equals("")))  tjptcjrbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tjptcjrbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[特价品提成记入比例]类型转换发生意外:"+e);
	return;
}
double azfjsbl=0;
ls=request.getParameter("azfjsbl");
try{
	if (!(ls.equals("")))  azfjsbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量azfjsbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[安装费结算比例]类型转换发生意外:"+e);
	return;
}
double ycfjsbl=0;
ls=request.getParameter("ycfjsbl");
try{
	if (!(ls.equals("")))  ycfjsbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ycfjsbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[远程费结算比例]类型转换发生意外:"+e);
	return;
}

String bz=cf.GB2Uni(request.getParameter("bz"));


String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sfjs="";
	ls_sql="select sfjs";
	ls_sql+=" from jc_zcdd ";
	ls_sql+=" where  (ddbh='"+ddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfjs=cf.fillNull(rs.getString("sfjs"));
	}
	rs.close();
	ps.close();

	if (sfjs.equals("Y") || sfjs.equals("M") || sfjs.equals("F"))//N：未结算；C：已选择结算；Y：已结算；M：结算已审核；F：结算付款；P：不需结算
	{
		out.println("错误！已结算");
		return;
	}


	String ppbm=null;
	String gys=null;
	String fgsbh=null;
	ls_sql="select ppbm,gys,fgsbh ";
	ls_sql+=" from jc_zcdd  ";
	ls_sql+=" where  (ddbh='"+ddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ppbm=rs.getString("ppbm");
		gys=rs.getString("gys");
		fgsbh=rs.getString("fgsbh");
	}
	rs.close();
	ps.close();


	ls_sql="update jc_zcdd set fdbl=?,khfdbl=?,tcjrbl=?,tjpfdbl=?,tjpkhfdbl=?,tjptcjrbl=?  ,cbze=round(zcpclf*?/100+tjpclf*?/100,2),bz=?,azfjsbl=?,ycfjsbl=?,htyjjrje=round(zcpclf*?/100,2)+round(tjpclf*?/100,2)";
	ls_sql+=" where  (ddbh='"+ddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,fdbl);
	ps.setDouble(2,khfdbl);
	ps.setDouble(3,tcjrbl);
	ps.setDouble(4,tjpfdbl);
	ps.setDouble(5,tjpkhfdbl);
	ps.setDouble(6,tjptcjrbl);

	ps.setDouble(7,fdbl);
	ps.setDouble(8,tjpfdbl);
	ps.setString(9,bz);
	ps.setDouble(10,azfjsbl);
	ps.setDouble(11,ycfjsbl);
	ps.setDouble(12,tcjrbl);
	ps.setDouble(13,tjptcjrbl);
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
	out.print("Exception: " + e);
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