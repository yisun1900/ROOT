<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gcjdbm=null;
java.sql.Date djsj=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrdw=null;
String bz=null;
gcjdbm=cf.GB2Uni(request.getParameter("gcjdbm"));
ls=request.getParameter("djsj");
try{
	if (!(ls.equals("")))  djsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量djsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际开工时间]类型转换发生意外:"+e);
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
lrdw=cf.GB2Uni(request.getParameter("lrdw"));
bz=cf.GB2Uni(request.getParameter("bz"));


String djjlh=null;
djjlh=cf.GB2Uni(request.getParameter("djjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String khbh=null;
	String sfszhf=null;
	String hfszjlh=null;
	ls_sql="select khbh,sfszhf,hfszjlh";
	ls_sql+=" from  crm_gcjddjjl";
	ls_sql+=" where djjlh='"+djjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=rs.getString("khbh");
		sfszhf=cf.fillNull(rs.getString("sfszhf"));
		hfszjlh=cf.fillNull(rs.getString("hfszjlh"));
	}
	else{
		out.println("错误！不存在的登记记录号："+djjlh);
		return;
	}
	rs.close();
	ps.close();
	
	String getsfyhf="";//是否已回访 ,Y：回访；N：未回访
	String getzxszbz="";//最新设置标志  ,Y：是；N：否
	ls_sql="SELECT sfyhf,zxszbz ";
	ls_sql+=" FROM crm_hfszjl ";
	ls_sql+=" where  hfszjlh='"+hfszjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getsfyhf=cf.fillNull(rs.getString("sfyhf"));
		getzxszbz=cf.fillNull(rs.getString("zxszbz"));
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	ls_sql="update crm_gcjddjjl set djsj=?,lrr=?,lrsj=?,lrdw=?,bz=?";
	ls_sql+=" where djjlh='"+djjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,djsj);
	ps.setString(2,lrr);
	ps.setDate(3,lrsj);
	ps.setString(4,lrdw);
	ps.setString(5,bz);
	ps.executeUpdate();
	ps.close();


	ls_sql="update crm_khxx set sybgcrq=?";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,djsj);
	ps.executeUpdate();
	ps.close();

	if (sfszhf.equals("1") && getsfyhf.equals("N") && getzxszbz.equals("Y"))//自动设置回访
	{
		ls_sql="update crm_khxx set hfrq=?+1 ";
		ls_sql+=" where  khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,djsj);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_hfszjl set hfsj=?+1,hfszr=?,hfszsj=SYSDATE";
		ls_sql+=" where  hfszjlh='"+hfszjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,djsj);
		ps.setString(2,lrr);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
