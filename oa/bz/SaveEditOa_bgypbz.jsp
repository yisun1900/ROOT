<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dwbh=null;
String xm=null;
String zw=null;
long je=0;
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
xm=cf.GB2Uni(request.getParameter("xm"));
zw=cf.GB2Uni(request.getParameter("zw"));
ls=request.getParameter("je");
try{
	if (!(ls.equals("")))  je=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量je不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[金额]类型转换发生意外:"+e);
	return;
}
String[] flbm=request.getParameterValues("flbm");

String wheredwbh=null;
String wherexm=null;
wheredwbh=cf.GB2Uni(request.getParameter("wheredwbh"));
wherexm=cf.GB2Uni(request.getParameter("wherexm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="update oa_bgypbz set dwbh=?,xm=?,zw=?,je=? ";
	ls_sql+=" where  (dwbh='"+wheredwbh+"') and  (xm='"+wherexm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dwbh);
	ps.setString(2,xm);
	ps.setString(3,zw);
	ps.setLong(4,je);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from oa_lqfw ";
	ls_sql+=" where  (dwbh='"+wheredwbh+"') and  (xm='"+wherexm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<flbm.length ;i++ )
	{
		if (flbm[i].equals(""))
		{
			continue;
		}
		ls_sql="insert into oa_lqfw ( dwbh,xm,flbm) ";
		ls_sql+=" values ( ?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,dwbh);
		ps.setString(2,xm);
		ps.setString(3,flbm[i]);
		ps.executeUpdate();
		ps.close();
	}

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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>