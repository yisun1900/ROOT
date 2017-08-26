<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String rwbm=null;
String rwmc=null;
String rwflbm=null;
String rwdx=null;
rwbm=cf.GB2Uni(request.getParameter("rwbm"));
rwmc=cf.GB2Uni(request.getParameter("rwmc"));
rwflbm=cf.GB2Uni(request.getParameter("rwflbm"));
rwdx=cf.GB2Uni(request.getParameter("rwdx"));

String sfsjysxm=request.getParameter("sfsjysxm");
String gcysxmbm=request.getParameter("gcysxmbm");
String sfsjzcxm=request.getParameter("sfsjzcxm");
String zcdlbm=cf.GB2Uni(request.getParameter("zcdlbm"));
String sjzcjd=request.getParameter("sjzcjd");


String sfyxhxgq=null;
sfyxhxgq=cf.GB2Uni(request.getParameter("sfyxhxgq"));
String zdjkrw=null;
zdjkrw=cf.GB2Uni(request.getParameter("zdjkrw"));

String bjsj=null;
bjsj=cf.GB2Uni(request.getParameter("bjsj"));
String bjjbbm=null;
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));

String sqbjnr=null;
int sqbjts=0;
String shbjnr=null;
int shbjts=0;
sqbjnr=cf.GB2Uni(request.getParameter("sqbjnr"));
ls=request.getParameter("sqbjts");
try{
	if (!(ls.equals("")))  sqbjts=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sqbjts]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[事前报警天数]类型转换发生意外:"+e);
	return;
}
shbjnr=cf.GB2Uni(request.getParameter("shbjnr"));
ls=request.getParameter("shbjts");
try{
	if (!(ls.equals("")))  shbjts=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[shbjts]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[事后报警天数]类型转换发生意外:"+e);
	return;
}



String bz=null;
bz=cf.GB2Uni(request.getParameter("bz"));


double rwxh=0;
ls=request.getParameter("rwxh");
try{
	if (!(ls.equals("")))  rwxh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rwxh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[任务序号]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();



	conn.setAutoCommit(false);


	ls_sql="insert into gdm_rwbm (rwbm,rwmc,rwflbm,rwdx,sfsjysxm,gcysxmbm,sfsjzcxm,zcdlbm,sjzcjd,sfyxhxgq,zdjkrw,bjsj,bjjbbm,sqbjnr,sqbjts,shbjnr,shbjts,rwxh,bz)";
	ls_sql+=" values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,rwbm);
	ps.setString(2,rwmc);
	ps.setString(3,rwflbm);
	ps.setString(4,rwdx);
	ps.setString(5,sfsjysxm);
	ps.setString(6,gcysxmbm);
	ps.setString(7,sfsjzcxm);
	ps.setString(8,zcdlbm);
	ps.setString(9,sjzcjd);
	ps.setString(10,sfyxhxgq);
	ps.setString(11,zdjkrw);
	ps.setString(12,bjsj);
	ps.setString(13,bjjbbm);
	ps.setString(14,sqbjnr);
	ps.setInt(15,sqbjts);
	ps.setString(16,shbjnr);
	ps.setInt(17,shbjts);

	ps.setDouble(18,rwxh);
	ps.setString(19,bz);
	ps.executeUpdate();
	ps.close();


	//调整序号
	int getrwxh=0;
	String getrwbm=null;
	ls_sql="SELECT rwbm";
	ls_sql+=" FROM gdm_rwbm";
	ls_sql+=" order by rwxh,rwbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getrwbm=rs.getString(1);

		getrwxh++;

		ls_sql="update gdm_rwbm set rwxh="+getrwxh;
		ls_sql+=" where  rwbm='"+getrwbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
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
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>