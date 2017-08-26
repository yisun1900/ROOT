<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String yddbh=null;
String spks=null;
String spzl=null;
String spgn=null;
String spfw=null;
String azjs=null;
String fwtd=null;
String fwgf=null;
String mfsh=null;
String mfaz=null;
String zssm=null;
String syxt=null;
String sydb=null;
String wzzq=null;
String qlxc=null;
String cscp=null;
String jsbyzs=null;
String bzgkjxy=null;
String bzgkjcf=null;
String bsdtt=null;
String bjsgkxf=null;
String bsygksb=null;
String bjsgkyq=null;
String azhs=null;
String bz=null;
yddbh=cf.GB2Uni(request.getParameter("yddbh"));
spks=cf.GB2Uni(request.getParameter("spks"));
spzl=cf.GB2Uni(request.getParameter("spzl"));
spgn=cf.GB2Uni(request.getParameter("spgn"));
spfw=cf.GB2Uni(request.getParameter("spfw"));
azjs=cf.GB2Uni(request.getParameter("azjs"));
fwtd=cf.GB2Uni(request.getParameter("fwtd"));
fwgf=cf.GB2Uni(request.getParameter("fwgf"));
mfsh=cf.GB2Uni(request.getParameter("mfsh"));
mfaz=cf.GB2Uni(request.getParameter("mfaz"));
zssm=cf.GB2Uni(request.getParameter("zssm"));
syxt=cf.GB2Uni(request.getParameter("syxt"));
sydb=cf.GB2Uni(request.getParameter("sydb"));
wzzq=cf.GB2Uni(request.getParameter("wzzq"));
qlxc=cf.GB2Uni(request.getParameter("qlxc"));
cscp=cf.GB2Uni(request.getParameter("cscp"));
jsbyzs=cf.GB2Uni(request.getParameter("jsbyzs"));
bzgkjxy=cf.GB2Uni(request.getParameter("bzgkjxy"));
bzgkjcf=cf.GB2Uni(request.getParameter("bzgkjcf"));
bsdtt=cf.GB2Uni(request.getParameter("bsdtt"));
bjsgkxf=cf.GB2Uni(request.getParameter("bjsgkxf"));
bsygksb=cf.GB2Uni(request.getParameter("bsygksb"));
bjsgkyq=cf.GB2Uni(request.getParameter("bjsgkyq"));
azhs=cf.GB2Uni(request.getParameter("azhs"));
bz=cf.GB2Uni(request.getParameter("bz"));
String whereyddbh=null;
whereyddbh=cf.GB2Uni(request.getParameter("whereyddbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jc_mmazfkd set yddbh=?,spks=?,spzl=?,spgn=?,spfw=?,azjs=?,fwtd=?,fwgf=?,mfsh=?,mfaz=?,zssm=?,syxt=?,sydb=?,wzzq=?,qlxc=?,cscp=?,jsbyzs=?,bzgkjxy=?,bzgkjcf=?,bsdtt=?,bjsgkxf=?,bsygksb=?,bjsgkyq=?,azhs=?,bz=? ";
	ls_sql+=" where  (yddbh='"+whereyddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,yddbh);
	ps.setString(2,spks);
	ps.setString(3,spzl);
	ps.setString(4,spgn);
	ps.setString(5,spfw);
	ps.setString(6,azjs);
	ps.setString(7,fwtd);
	ps.setString(8,fwgf);
	ps.setString(9,mfsh);
	ps.setString(10,mfaz);
	ps.setString(11,zssm);
	ps.setString(12,syxt);
	ps.setString(13,sydb);
	ps.setString(14,wzzq);
	ps.setString(15,qlxc);
	ps.setString(16,cscp);
	ps.setString(17,jsbyzs);
	ps.setString(18,bzgkjxy);
	ps.setString(19,bzgkjcf);
	ps.setString(20,bsdtt);
	ps.setString(21,bjsgkxf);
	ps.setString(22,bsygksb);
	ps.setString(23,bjsgkyq);
	ps.setString(24,azhs);
	ps.setString(25,bz);
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