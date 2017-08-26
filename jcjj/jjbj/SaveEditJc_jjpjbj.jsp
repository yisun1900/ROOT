<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gtpjbh=null;
String gtpjmc=null;
String xinghao=null;
String guige=null;
double dj=0;
String bz=null;
String jjpjflbm=null;
String jldwbm=null;
gtpjbh=cf.GB2Uni(request.getParameter("gtpjbh"));
gtpjmc=cf.GB2Uni(request.getParameter("gtpjmc"));
xinghao=cf.GB2Uni(request.getParameter("xinghao"));
guige=cf.GB2Uni(request.getParameter("guige"));
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单价]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
jjpjflbm=cf.GB2Uni(request.getParameter("jjpjflbm"));
jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));
String wheregtpjbh=null;
wheregtpjbh=cf.GB2Uni(request.getParameter("wheregtpjbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jc_jjpjbj set gtpjbh=?,gtpjmc=?,xinghao=?,guige=?,dj=?,bz=?,jjpjflbm=?,jldwbm=? ";
	ls_sql+=" where  (gtpjbh='"+wheregtpjbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gtpjbh);
	ps.setString(2,gtpjmc);
	ps.setString(3,xinghao);
	ps.setString(4,guige);
	ps.setDouble(5,dj);
	ps.setString(6,bz);
	ps.setString(7,jjpjflbm);
	ps.setString(8,jldwbm);
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