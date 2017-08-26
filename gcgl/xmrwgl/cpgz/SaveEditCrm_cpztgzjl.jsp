<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date fssj=null;
String zrr=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
ls=request.getParameter("fssj");
try{
	if (!(ls.equals("")))  fssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fssj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[发生时间]类型转换发生意外:"+e);
	return;
}
zrr=cf.GB2Uni(request.getParameter("zrr"));
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

String khbh=request.getParameter("khbh");
String cpflbm=request.getParameter("cpflbm");
String cpztbm=request.getParameter("cpztbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getpztbm=null;
	java.sql.Date getztfssj=null;
	ls_sql=" SELECT cpztbm,ztfssj";
	ls_sql+=" from crm_cpgzjl";
	ls_sql+=" where khbh='"+khbh+"' and cpflbm='"+cpflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getpztbm=cf.fillNull(rs.getString("cpztbm"));
		getztfssj=rs.getDate("ztfssj");
	}
	rs.close();
	ps.close();

	if (!getpztbm.equals(cpztbm))
	{
		out.println("错误！产品状态已改变，不能再修改");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_cpgzjl set ztfssj=? ";
	ls_sql+=" where khbh='"+khbh+"' and cpflbm='"+cpflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,fssj);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_cpztgzjl set fssj=?,zrr=?,lrr=?,lrsj=?,lrbm=?,bz=? ";
	ls_sql+=" where khbh='"+khbh+"' and cpflbm='"+cpflbm+"' and cpztbm='"+cpztbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,fssj);
	ps.setString(2,zrr);
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