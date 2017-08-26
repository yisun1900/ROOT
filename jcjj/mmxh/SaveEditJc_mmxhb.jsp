<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String mmxh=null;
String mxbm=null;
String mytbm=null;
String zp=null;
String bz=null;
mmxh=cf.GB2Uni(request.getParameter("mmxh"));
mxbm=cf.GB2Uni(request.getParameter("mxbm"));
mytbm=cf.GB2Uni(request.getParameter("mytbm"));
zp=cf.GB2Uni(request.getParameter("zp")).toUpperCase();
bz=cf.GB2Uni(request.getParameter("bz"));
double bzjg=0;
ls=request.getParameter("bzjg");
try{
	if (!(ls.equals("")))  bzjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bzjg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[标准价格]类型转换发生意外:"+e);
	return;
}

String dqbm=request.getParameter("dqbm");
String lrr=cf.GB2Uni(request.getParameter("lrr"));
String lrbm=cf.GB2Uni(request.getParameter("lrbm"));
java.sql.Date lrsj=null;
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

String wheremmxh=null;
wheremmxh=cf.GB2Uni(request.getParameter("wheremmxh"));
String wheredqbm=cf.GB2Uni(request.getParameter("wheredqbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jc_mmxhb set mmxh=?,mxbm=?,mytbm=?,zp=?,bz=?,bzjg=?  ,dqbm=?,lrr=?,lrsj=SYSDATE,lrbm=? ";
	ls_sql+=" where  (mmxh='"+wheremmxh+"' and dqbm='"+wheredqbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mmxh);
	ps.setString(2,mxbm);
	ps.setString(3,mytbm);
	ps.setString(4,zp);
	ps.setString(5,bz);
	ps.setDouble(6,bzjg);

	ps.setString(7,dqbm);
	ps.setString(8,lrr);
	ps.setString(9,lrbm);

	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>修改数据库失败！");
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
	out.print("Exception: " + e);
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