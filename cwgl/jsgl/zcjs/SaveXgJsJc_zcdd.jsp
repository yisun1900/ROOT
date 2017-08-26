<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ddbh=request.getParameter("ddbh");
String jsr=cf.GB2Uni(request.getParameter("jsr"));

java.sql.Date jssj=null;
ls=request.getParameter("jssj");
try{
	if (!(ls.equals("")))  jssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算时间]类型转换发生意外:"+e);
	return;
}
String jssm=cf.GB2Uni(request.getParameter("jssm"));
double jsje=0;
ls=request.getParameter("jsje");
try{
	if (!(ls.equals("")))  jsje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jsje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算金额]类型转换发生意外:"+e);
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sfjs=null;
	String clzt=null;
	String khbh=null;
	java.sql.Date jhtbhsj=null;
	ls_sql =" select sfjs,clzt,khbh,jhtbhsj";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfjs=cf.fillNull(rs.getString("sfjs"));
		clzt=rs.getString("clzt");
		khbh=rs.getString("khbh");
		jhtbhsj=rs.getDate("jhtbhsj");
	}
	rs.close();
	ps.close();

	if (!sfjs.equals("Y"))
	{
		out.println("<BR>错误，未结算");
		return;
	}



	ls_sql="update jc_zcdd set jssj=?,jsr=?,jsje=?,jssm=?";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,jssj);
	ps.setString(2,jsr);
	ps.setDouble(3,jsje);
	ps.setString(4,jssm);
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
