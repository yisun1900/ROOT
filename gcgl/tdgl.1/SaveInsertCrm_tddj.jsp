<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String tdxh=null;
String khbh=null;
String khxm=null;
String fwdz=null;
String dh=null;
String sjs=null;
String zjxm=null;
String sgd=null;
String sgbz=null;
String dwbh=null;
String tdyybm=null;
String tdyysm=null;
String sffj=null;
String sfyrz=null;
double ytje=0;
double stje=0;
String lrdw=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
tdxh=cf.GB2Uni(request.getParameter("tdxh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
khxm=cf.GB2Uni(request.getParameter("khxm"));
fwdz=cf.GB2Uni(request.getParameter("fwdz"));
dh=cf.GB2Uni(request.getParameter("dh"));
sjs=cf.GB2Uni(request.getParameter("sjs"));
zjxm=cf.GB2Uni(request.getParameter("zjxm"));
sgd=cf.GB2Uni(request.getParameter("sgd"));
sgbz=cf.GB2Uni(request.getParameter("sgbz"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
tdyybm=cf.GB2Uni(request.getParameter("tdyybm"));
tdyysm=cf.GB2Uni(request.getParameter("tdyysm"));
sffj=cf.GB2Uni(request.getParameter("sffj"));
sfyrz=cf.GB2Uni(request.getParameter("sfyrz"));
ls=request.getParameter("ytje");
try{
	if (!(ls.equals("")))  ytje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ytje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[应退金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("stje");
try{
	if (!(ls.equals("")))  stje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量stje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实退金额]类型转换发生意外:"+e);
	return;
}
lrdw=cf.GB2Uni(request.getParameter("lrdw"));
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
bz=cf.GB2Uni(request.getParameter("bz"));

java.sql.Date tdsj=null;
ls=request.getParameter("tdsj");
try{
	if (!(ls.equals("")))  tdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tdsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[退单时间]类型转换发生意外:"+e);
	return;
}


String sfthlp=cf.GB2Uni(request.getParameter("sfthlp"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//退单标志
	String zt=null;
	ls_sql="select zt";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zt=rs.getString(1);
	}
	ps.close();
	rs.close();

	if (zt.equals("3"))
	{
		out.println("错误！该用户已退单");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_khxx set zt='3',tdxh=?,tdsj=? where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tdxh);
	ps.setDate(2,tdsj);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into crm_tddj ( tdxh,khbh,khxm,fwdz,dh,sjs,zjxm,sgd,sgbz,dwbh,tdyybm,tdyysm,sffj,sfyrz,ytje,stje,lrdw,lrr,lrsj,bz,sfthlp,tdsj ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tdxh);
	ps.setString(2,khbh);
	ps.setString(3,khxm);
	ps.setString(4,fwdz);
	ps.setString(5,dh);
	ps.setString(6,sjs);
	ps.setString(7,zjxm);
	ps.setString(8,sgd);
	ps.setString(9,sgbz);
	ps.setString(10,dwbh);
	ps.setString(11,tdyybm);
	ps.setString(12,tdyysm);
	ps.setString(13,sffj);
	ps.setString(14,sfyrz);
	ps.setDouble(15,ytje);
	ps.setDouble(16,stje);
	ps.setString(17,lrdw);
	ps.setString(18,lrr);
	ps.setDate(19,lrsj);
	ps.setString(20,bz);
	ps.setString(21,sfthlp);
	ps.setDate(22,tdsj);
	ps.executeUpdate();
	ps.close();

	if (sfthlp.equals("Y"))//Y：退回；N：未退回
	{
		ls_sql="update yx_lqlpdj set shth='2',thdjr=?,thdjsj=? ";
		ls_sql+=" where shth='1' and khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,lrr);
		ps.setDate(2,lrsj);
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
	out.print("存盘失败,发生意外: " + e);
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