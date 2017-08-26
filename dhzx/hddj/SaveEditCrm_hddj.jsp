<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String khxm=null;
String xb=null;
String lxfs=null;
String cqbm=null;
String fwdz=null;
String cgdz=null;
String hdsgd=null;
String hdsgbz=null;
String hdsjs=null;
String bz=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
khxm=cf.GB2Uni(request.getParameter("khxm"));
xb=cf.GB2Uni(request.getParameter("xb"));
lxfs=cf.GB2Uni(request.getParameter("lxfs"));
cqbm=cf.GB2Uni(request.getParameter("cqbm"));
fwdz=cf.GB2Uni(request.getParameter("fwdz"));
cgdz=cf.GB2Uni(request.getParameter("cgdz"));
hdsgd=cf.GB2Uni(request.getParameter("hdsgd"));
hdsgbz=cf.GB2Uni(request.getParameter("hdsgbz"));
hdsjs=cf.GB2Uni(request.getParameter("hdsjs"));
bz=cf.GB2Uni(request.getParameter("bz"));
String wherekhbh=null;
wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_hddj set khbh=?,khxm=?,xb=?,lxfs=?,cqbm=?,fwdz=?,cgdz=?,hdsgd=?,hdsgbz=?,hdsjs=?,bz=? ";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,khxm);
	ps.setString(3,xb);
	ps.setString(4,lxfs);
	ps.setString(5,cqbm);
	ps.setString(6,fwdz);
	ps.setString(7,cgdz);
	ps.setString(8,hdsgd);
	ps.setString(9,hdsgbz);
	ps.setString(10,hdsjs);
	ps.setString(11,bz);
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