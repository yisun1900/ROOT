<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sgd=null;
String zbjjsyybm=null;
double je=0;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
sgd=cf.GB2Uni(request.getParameter("sgd"));
zbjjsyybm=cf.GB2Uni(request.getParameter("zbjjsyybm"));
ls=request.getParameter("je");
try{
	if (!(ls.equals("")))  je=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量je不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[金额]类型转换发生意外:"+e);
	return;
}
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
bz=cf.GB2Uni(request.getParameter("bz"));
String lrbm=request.getParameter("lrbm");

String wherexuhao=null;
wherexuhao=cf.GB2Uni(request.getParameter("wherexuhao"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	double oldje=0;
	ls_sql="select je";
	ls_sql+=" from  cw_zbjxgjl";
	ls_sql+=" where scbz='N' and xuhao="+wherexuhao;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		oldje=rs.getDouble("je");
	}
	else{
		out.println("错误！不存在的序号："+wherexuhao);
		return;
	}
	rs.close();
	ps.close();
	
	conn.setAutoCommit(false);

	ls_sql="update sq_sgd set zbj=zbj-?+?";
	ls_sql+=" where sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,oldje);
	ps.setDouble(2,je);
	ps.executeUpdate();
	ps.close();

	ls_sql="update cw_zbjxgjl set zbjjsyybm=?,je=?,lrr=?,lrsj=?,lrbm=?,bz=? ";
	ls_sql+=" where  (xuhao="+wherexuhao+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zbjjsyybm);
	ps.setDouble(2,je);
	ps.setString(3,lrr);
	ps.setDate(4,lrsj);
	ps.setString(5,lrbm);
	ps.setString(6,bz);
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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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