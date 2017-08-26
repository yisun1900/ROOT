<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String cpflbm=null;
java.sql.Date fssj=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
String qksm=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
cpflbm=cf.GB2Uni(request.getParameter("cpflbm"));
ls=request.getParameter("fssj");
try{
	if (!(ls.equals("")))  fssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fssj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[返补维修发生时间]类型转换发生意外:"+e);
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
qksm=cf.GB2Uni(request.getParameter("qksm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String fbdbh=null;
	int count=0;
	ls_sql="select NVL(max(substr(fbdbh,8,3)),0)";
	ls_sql+=" from  crm_fbdgl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	fbdbh=khbh+cf.addZero(count+1,3);

	conn.setAutoCommit(false);

	ls_sql="insert into crm_fbdgl ( fbdbh,khbh,cpflbm,fssj,lrr,lrsj,lrbm,bz,qksm,azsfcg,zt ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,'N','1' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fbdbh);
	ps.setString(2,khbh);
	ps.setString(3,cpflbm);
	ps.setDate(4,fssj);
	ps.setString(5,lrr);
	ps.setDate(6,lrsj);
	ps.setString(7,lrbm);
	ps.setString(8,bz);
	ps.setString(9,qksm);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_cpgzjl set sfxfb='Y',fbdbh=? ";
	ls_sql+=" where khbh='"+khbh+"' and cpflbm='"+cpflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fbdbh);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>