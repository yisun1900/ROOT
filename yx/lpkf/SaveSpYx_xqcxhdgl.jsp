<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String spjl=null;
String spr=null;
java.sql.Date spsj=null;
String spyj=null;
spjl=cf.GB2Uni(request.getParameter("spjl"));
spr=cf.GB2Uni(request.getParameter("spr"));
ls=request.getParameter("spsj");
try{
	if (!(ls.equals("")))  spsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量spsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审批时间]类型转换发生意外:"+e);
	return;
}
spyj=cf.GB2Uni(request.getParameter("spyj"));

String wherexqmc=null;
String wherefgsbh=null;
wherexqmc=cf.GB2Uni(request.getParameter("wherexqmc"));
wherefgsbh=cf.GB2Uni(request.getParameter("wherefgsbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String dqbm=null;
	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+wherefgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);
	
	ls_sql="update yx_xqcxhdgl set spjl=?,spr=?,spsj=?,spyj=?,spzt='2'";
	ls_sql+=" where  (xqmc='"+wherexqmc+"') and  (fgsbh='"+wherefgsbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,spjl);
	ps.setString(2,spr);
	ps.setDate(3,spsj);
	ps.setString(4,spyj);
	ps.executeUpdate();
	ps.close();

	String kfjd=null;
	if (spjl.equals("Y"))//Y：同意；N：不同意
	{
		kfjd="3";//1：未开发；2：已申请；3：已批准；4：未批准；5：已完成
	}
	else{
		kfjd="4";
	}

	ls_sql="update yx_lsdcb set kfjd='"+kfjd+"'";
	ls_sql+=" where xqmc='"+wherexqmc+"' and dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>