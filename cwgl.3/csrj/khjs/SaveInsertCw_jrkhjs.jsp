<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String khbh=null;
double khpck=0;
double jsyh=0;


khbh=cf.GB2Uni(request.getParameter("khbh"));
ls=request.getParameter("khpck");
try{
	if (!(ls.equals("")))  khpck=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khpck]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户赔偿款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jsyh");
try{
	if (!(ls.equals("")))  jsyh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jsyh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算优惠]类型转换发生意外:"+e);
	return;
}
double yqf=0;
ls=request.getParameter("yqf");
try{
	if (!(ls.equals("")))  yqf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yqf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[延期费]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String khjsbz=null;
	ls_sql="select khjsbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khjsbz=cf.fillNull(rs.getString("khjsbz"));
	}
	rs.close();
	ps.close();

	if (!khjsbz.equals("N"))//N：未结算；Y：已结算；2：审批同意；3：审批不同意
	{
		out.println("错误！客户已结算");
		return;
	}
	
	conn.setAutoCommit(false);

	ls_sql="update crm_khxx set khjsbz='Y',khjssj=TRUNC(SYSDATE)";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_khqye set khpck=?,jsyh=?,yqf=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,khpck);
	ps.setDouble(2,jsyh);
	ps.setDouble(3,yqf);
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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