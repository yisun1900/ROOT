<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String cgbm=null;
String cgmc=null;
double zsmbdj=0;
String mbbm=null;
String mbfbbm=null;
String xtbm=null;
String lsbm=null;
String tjbbm=null;
String ctbm=null;
String jlbm=null;
String dwbh=null;
String zp=null;
String bz=null;
cgbm=cf.GB2Uni(request.getParameter("cgbm"));
cgmc=cf.GB2Uni(request.getParameter("cgmc"));
ls=request.getParameter("zsmbdj");
try{
	if (!(ls.equals("")))  zsmbdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zsmbdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[装饰门板单价]类型转换发生意外:"+e);
	return;
}
mbbm=cf.GB2Uni(request.getParameter("mbbm"));
mbfbbm=cf.GB2Uni(request.getParameter("mbfbbm"));
xtbm=cf.GB2Uni(request.getParameter("xtbm"));
lsbm=cf.GB2Uni(request.getParameter("lsbm"));
tjbbm=cf.GB2Uni(request.getParameter("tjbbm"));
ctbm=cf.GB2Uni(request.getParameter("ctbm"));
jlbm=cf.GB2Uni(request.getParameter("jlbm"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
zp=cf.GB2Uni(request.getParameter("zp"));
bz=cf.GB2Uni(request.getParameter("bz"));
String wherecgbm=null;
wherecgbm=cf.GB2Uni(request.getParameter("wherecgbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jc_cgjgb set cgbm=?,cgmc=?,zsmbdj=?,mbbm=?,mbfbbm=?,xtbm=?,lsbm=?,tjbbm=?,ctbm=?,jlbm=?,dwbh=?,zp=?,bz=? ";
	ls_sql+=" where  (cgbm='"+wherecgbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cgbm);
	ps.setString(2,cgmc);
	ps.setDouble(3,zsmbdj);
	ps.setString(4,mbbm);
	ps.setString(5,mbfbbm);
	ps.setString(6,xtbm);
	ps.setString(7,lsbm);
	ps.setString(8,tjbbm);
	ps.setString(9,ctbm);
	ps.setString(10,jlbm);
	ps.setString(11,dwbh);
	ps.setString(12,zp);
	ps.setString(13,bz);
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