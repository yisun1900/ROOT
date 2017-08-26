<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String fgsbh=null;
long bfcs=0;
String bfjs=null;
double bfbl=0;
double sdlbfbl=0;
String kzbjjs=null;
String sfwgjs=null;
String sdljsfs=null;
String sfkclk=null;
String sfkgdyp=null;
String sfkyfgf=null;
String sfkzbj=null;
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
ls=request.getParameter("bfcs");
try{
	if (!(ls.equals("")))  bfcs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bfcs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[拨付次数]类型转换发生意外:"+e);
	return;
}
bfjs=cf.GB2Uni(request.getParameter("bfjs"));
ls=request.getParameter("bfbl");
try{
	if (!(ls.equals("")))  bfbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[bfbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[拨付比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sdlbfbl");
try{
	if (!(ls.equals("")))  sdlbfbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sdlbfbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[水电路拨付比例]类型转换发生意外:"+e);
	return;
}
kzbjjs=cf.GB2Uni(request.getParameter("kzbjjs"));
sfwgjs=cf.GB2Uni(request.getParameter("sfwgjs"));
sdljsfs=cf.GB2Uni(request.getParameter("sdljsfs"));
sfkclk=cf.GB2Uni(request.getParameter("sfkclk"));
sfkgdyp=cf.GB2Uni(request.getParameter("sfkgdyp"));
sfkyfgf=cf.GB2Uni(request.getParameter("sfkyfgf"));
sfkzbj=cf.GB2Uni(request.getParameter("sfkzbj"));

double kzbjbl=0;
ls=request.getParameter("kzbjbl");
try{
	if (!(ls.equals("")))  kzbjbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[kzbjbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣质保金比例]类型转换发生意外:"+e);
	return;
}

String sgdjbxg=cf.GB2Uni(request.getParameter("sgdjbxg"));
String sfhzjx=cf.GB2Uni(request.getParameter("sfhzjx"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into dm_sgdjscsb ( fgsbh,bfcs,bfjs,bfbl,sdlbfbl,kzbjjs,sfwgjs,sdljsfs,sfkclk,sfkgdyp,sfkyfgf,sfkzbj,sgdjbxg,sfhzjx,kzbjbl ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setLong(2,bfcs);
	ps.setString(3,bfjs);
	ps.setDouble(4,bfbl);
	ps.setDouble(5,sdlbfbl);
	ps.setString(6,kzbjjs);
	ps.setString(7,sfwgjs);
	ps.setString(8,sdljsfs);
	ps.setString(9,sfkclk);
	ps.setString(10,sfkgdyp);
	ps.setString(11,sfkyfgf);
	ps.setString(12,sfkzbj);
	ps.setString(13,sgdjbxg);
	ps.setString(14,sfhzjx);
	ps.setDouble(15,kzbjbl);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>