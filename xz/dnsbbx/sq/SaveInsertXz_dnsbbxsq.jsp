<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dwbh=null;
String fgsbh=null;
String sqr=null;
java.sql.Date bxrq=null;
java.sql.Date jhlqrq=null;
String bgr=null;
String sfyzysj=null;
String gzxxsm=null;
String gsbh=null;
String gdzcmc=null;
String bmbh=null;
String xh=null;
String pp=null;
String pz1=null;
String pz2=null;
String pz3=null;
String pz4=null;
String pz5=null;
String pz6=null;
String lrr=null;
String dnsbflmc=null;
String dnsbgzmc=null;
String gdzcflmc=null;

dwbh=cf.GB2Uni(request.getParameter("dwbh"));
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
sqr=cf.GB2Uni(request.getParameter("sqr"));
ls=request.getParameter("bxrq");
try{
	if (!(ls.equals("")))  bxrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bxrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[报修日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jhlqrq");
try{
	if (!(ls.equals("")))  jhlqrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhlqrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[希望完成日期]类型转换发生意外:"+e);
	return;
}
bgr=cf.GB2Uni(request.getParameter("bgr"));
sfyzysj=cf.GB2Uni(request.getParameter("sfyzysj"));
gzxxsm=cf.GB2Uni(request.getParameter("gzxxsm"));
gsbh=cf.GB2Uni(request.getParameter("gsbh"));
gdzcmc=cf.GB2Uni(request.getParameter("gdzcmc"));
bmbh=cf.GB2Uni(request.getParameter("bmbh"));
xh=cf.GB2Uni(request.getParameter("xh"));
pp=cf.GB2Uni(request.getParameter("pp"));
pz1=cf.GB2Uni(request.getParameter("pz1"));
pz2=cf.GB2Uni(request.getParameter("pz2"));
pz3=cf.GB2Uni(request.getParameter("pz3"));
pz4=cf.GB2Uni(request.getParameter("pz4"));
pz5=cf.GB2Uni(request.getParameter("pz5"));
pz6=cf.GB2Uni(request.getParameter("pz6"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
dnsbflmc=cf.GB2Uni(request.getParameter("dnsbflmc"));
dnsbgzmc=cf.GB2Uni(request.getParameter("dnsbgzmc"));
gdzcflmc=cf.GB2Uni(request.getParameter("gdzcflmc"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int bxxh=0;	
	ls_sql="select NVL(max(bxxh),0)";
	ls_sql+=" from  xz_dnsbbxsq";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bxxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	bxxh++;
	
	ls_sql="insert into xz_dnsbbxsq ( bxxh,dwbh,fgsbh,sqr,bxrq,jhlqrq,bgr,sfyzysj,gzxxsm,gsbh,gdzcmc,bmbh,xh,pp,pz1,pz2,pz3,pz4,pz5,pz6,lrr,dnsbflmc,dnsbgzmc,gdzcflmc,wxfy,clzt ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,0,'1') ";//1：未接收；2：接收；3：采购中；4：送修中；5：完成
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,bxxh);
	ps.setString(2,dwbh);
	ps.setString(3,fgsbh);
	ps.setString(4,sqr);
	ps.setDate(5,bxrq);
	ps.setDate(6,jhlqrq);
	ps.setString(7,bgr);
	ps.setString(8,sfyzysj);
	ps.setString(9,gzxxsm);
	ps.setString(10,gsbh);
	ps.setString(11,gdzcmc);
	ps.setString(12,bmbh);
	ps.setString(13,xh);
	ps.setString(14,pp);
	ps.setString(15,pz1);
	ps.setString(16,pz2);
	ps.setString(17,pz3);
	ps.setString(18,pz4);
	ps.setString(19,pz5);
	ps.setString(20,pz6);
	ps.setString(21,lrr);
	ps.setString(22,dnsbflmc);
	ps.setString(23,dnsbgzmc);
	ps.setString(24,gdzcflmc);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！生成报修序号："+bxxh);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>