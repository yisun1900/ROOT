<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String fgflbm=null;
String zxjwbm=null;
String hxbm=null;
String hxmjbm=null;
String ysbm=null;
String sfyqd=null;
String bz=null;
fgflbm=cf.GB2Uni(request.getParameter("fgflbm"));
zxjwbm=cf.GB2Uni(request.getParameter("zxjwbm"));
hxbm=cf.GB2Uni(request.getParameter("hxbm"));
hxmjbm=cf.GB2Uni(request.getParameter("hxmjbm"));
ysbm=cf.GB2Uni(request.getParameter("ysbm"));
sfyqd=cf.GB2Uni(request.getParameter("sfyqd"));
bz=cf.GB2Uni(request.getParameter("bz"));
String wheresqbh=null;
wheresqbh=cf.GB2Uni(request.getParameter("wheresqbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update ybj_cgsq set fgflbm=?,zxjwbm=?,hxbm=?,hxmjbm=?,ysbm=?,sfyqd=?,bz=? ";
	ls_sql+=" where  (sqbh="+wheresqbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgflbm);
	ps.setString(2,zxjwbm);
	ps.setString(3,hxbm);
	ps.setString(4,hxmjbm);
	ps.setString(5,ysbm);
	ps.setString(6,sfyqd);
	ps.setString(7,bz);
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