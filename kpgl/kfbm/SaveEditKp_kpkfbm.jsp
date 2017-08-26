<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String kpkfbm=null;
String kpkfmc=null;
long kfs=0;
String pfxmbm=null;
String kflx=null;
kpkfbm=cf.GB2Uni(request.getParameter("kpkfbm"));
kpkfmc=cf.GB2Uni(request.getParameter("kpkfmc"));
ls=request.getParameter("kfs");
try{
	if (!(ls.equals("")))  kfs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kfs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣分数]类型转换发生意外:"+e);
	return;
}
pfxmbm=cf.GB2Uni(request.getParameter("pfxmbm"));
kflx=cf.GB2Uni(request.getParameter("kflx"));
String wherekpkfbm=null;
wherekpkfbm=cf.GB2Uni(request.getParameter("wherekpkfbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update kp_kpkfbm set kpkfbm=?,kpkfmc=?,kfs=?,pfxmbm=?,kflx=? ";
	ls_sql+=" where  (kpkfbm='"+wherekpkfbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,kpkfbm);
	ps.setString(2,kpkfmc);
	ps.setLong(3,kfs);
	ps.setString(4,pfxmbm);
	ps.setString(5,kflx);
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