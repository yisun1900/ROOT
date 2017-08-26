<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String kpxmbm=null;
String kpxmmc=null;
String kpdlbm=null;
String kpjg=null;
String kpjgdy=null;
String kpcfbm=null;
kpxmbm=cf.GB2Uni(request.getParameter("kpxmbm"));
kpxmmc=cf.GB2Uni(request.getParameter("kpxmmc"));
kpdlbm=cf.GB2Uni(request.getParameter("kpdlbm"));
kpjg=cf.GB2Uni(request.getParameter("kpjg"));
kpjgdy=cf.GB2Uni(request.getParameter("kpjgdy"));
kpcfbm=cf.GB2Uni(request.getParameter("kpcfbm"));
double sgdfk=0;
ls=request.getParameter("sgdfk");
try{
	if (!(ls.equals("")))  sgdfk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sgdfk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[罚款]类型转换发生意外:"+e);
	return;
}
double kf=0;
ls=request.getParameter("kf");
try{
	if (!(ls.equals("")))  kf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣分]类型转换发生意外:"+e);
	return;
}
double kcjdebl=0;
ls=request.getParameter("kcjdebl");
try{
	if (!(ls.equals("")))  kcjdebl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kcjdebl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣除接单额百分比]类型转换发生意外:"+e);
	return;
}
String cfbz=cf.GB2Uni(request.getParameter("cfbz"));

String wherekpxmbm=null;
String wherekpjg=null;
wherekpxmbm=cf.GB2Uni(request.getParameter("wherekpxmbm"));
wherekpjg=cf.GB2Uni(request.getParameter("wherekpjg"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update kp_gckpxm set kpxmbm=?,kpxmmc=?,kpdlbm=?,kpjg=?,kpjgdy=?,kpcfbm=?,cfbz=?,kf=?,sgdfk=?,kcjdebl=?";
	ls_sql+=" where  (kpxmbm='"+wherekpxmbm+"') and  (kpjg='"+wherekpjg+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,kpxmbm);
	ps.setString(2,kpxmmc);
	ps.setString(3,kpdlbm);
	ps.setString(4,kpjg);
	ps.setString(5,kpjgdy);
	ps.setString(6,kpcfbm);
	ps.setString(7,cfbz);
	ps.setDouble(8,kf);
	ps.setDouble(9,sgdfk);
	ps.setDouble(10,kcjdebl);
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