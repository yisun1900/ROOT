<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String cpflbm=null;
String cpztbm=null;
java.sql.Date fssj=null;
String zrr=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
cpflbm=cf.GB2Uni(request.getParameter("cpflbm"));
cpztbm=cf.GB2Uni(request.getParameter("cpztbm"));
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
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String ycpztbm=null;
	java.sql.Date yztfssj=null;
	ls_sql=" SELECT cpztbm,ztfssj";
	ls_sql+=" from crm_cpgzjl";
	ls_sql+=" where khbh='"+khbh+"' and cpflbm='"+cpflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ycpztbm=cf.fillNull(rs.getString("cpztbm"));
		yztfssj=rs.getDate("ztfssj");
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="update crm_cpgzjl set cpztbm=?,ztfssj=? ";
	ls_sql+=" where khbh='"+khbh+"' and cpflbm='"+cpflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cpztbm);
	ps.setDate(2,fssj);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into crm_cpztgzjl ( khbh,cpflbm,cpztbm,fssj,zrr,lrr,lrsj,lrbm,bz,ycpztbm,yztfssj ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,cpflbm);
	ps.setString(3,cpztbm);
	ps.setDate(4,fssj);
	ps.setString(5,zrr);
	ps.setString(6,lrr);
	ps.setDate(7,lrsj);
	ps.setString(8,lrbm);
	ps.setString(9,bz);
	ps.setString(10,ycpztbm);
	ps.setDate(11,yztfssj);
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