<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dwbh=null;
String sqr=null;
String fgflbm=null;
String zxjwbm=null;
String hxbm=null;
String hxmjbm=null;
String ysbm=null;
String sfyqd=null;
String bz=null;
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String sqbh=cf.GB2Uni(request.getParameter("sqbh"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
sqr=cf.GB2Uni(request.getParameter("sqr"));
fgflbm=cf.GB2Uni(request.getParameter("fgflbm"));
zxjwbm=cf.GB2Uni(request.getParameter("zxjwbm"));
hxbm=cf.GB2Uni(request.getParameter("hxbm"));
hxmjbm=cf.GB2Uni(request.getParameter("hxmjbm"));
ysbm=cf.GB2Uni(request.getParameter("ysbm"));
sfyqd=cf.GB2Uni(request.getParameter("sfyqd"));
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="insert into ybj_cgsq ( dwbh,sqr,fgflbm,zxjwbm,hxbm,hxmjbm,ysbm,sfyqd,bz,sqbh,sqsj,clzt,khbh ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,TRUNC(SYSDATE),'1',? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dwbh);
	ps.setString(2,sqr);
	ps.setString(3,fgflbm);
	ps.setString(4,zxjwbm);
	ps.setString(5,hxbm);
	ps.setString(6,hxmjbm);
	ps.setString(7,ysbm);
	ps.setString(8,sfyqd);
	ps.setString(9,bz);
	ps.setString(10,sqbh);
	ps.setString(11,khbh);
	ps.executeUpdate();
	ps.close();

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
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
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