<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dwbh=null;
String dwmc=null;
String dwjc=null;
String ssdw=null;
String dwlx=null;
String dwdz=null;
String dwfzr=null;
String dwdh=null;
String dwcz=null;
String email=null;
String bz=null;
String cxbz=cf.GB2Uni(request.getParameter("cxbz"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
dwmc=cf.GB2Uni(request.getParameter("dwmc"));
dwjc=cf.GB2Uni(request.getParameter("dwjc"));
ssdw=cf.GB2Uni(request.getParameter("ssdw"));
dwlx=cf.GB2Uni(request.getParameter("dwlx"));
dwdz=cf.GB2Uni(request.getParameter("dwdz"));
dwfzr=cf.GB2Uni(request.getParameter("dwfzr"));
dwdh=cf.GB2Uni(request.getParameter("dwdh"));
dwcz=cf.GB2Uni(request.getParameter("dwcz"));
email=cf.GB2Uni(request.getParameter("email"));
bz=cf.GB2Uni(request.getParameter("bz"));
String duihao=cf.GB2Uni(request.getParameter("duihao"));
String sgdjbbm=cf.GB2Uni(request.getParameter("sgdjbbm"));
String jcf=cf.GB2Uni(request.getParameter("jcf"));

String tdbz=cf.GB2Uni(request.getParameter("tdbz"));
int zbj=0;
ls=request.getParameter("zbj");
try{
	if (!(ls.equals("")))  zbj=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zbj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[质保金]类型转换发生意外:"+e);
	return;
}
int bzs=0;
ls=request.getParameter("bzs");
try{
	if (!(ls.equals("")))  bzs=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bzs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[班组数]类型转换发生意外:"+e);
	return;
}

java.sql.Date tdkssj=null;
ls=request.getParameter("tdkssj");
try{
	if (!(ls.equals("")))  tdkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tdkssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[停单开始时间]类型转换发生意外:"+e);
	return;
}
java.sql.Date tdzzsj=null;
ls=request.getParameter("tdzzsj");
try{
	if (!(ls.equals("")))  tdzzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tdzzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[停单终止时间]类型转换发生意外:"+e);
	return;
}
String jjlxr=cf.GB2Uni(request.getParameter("jjlxr"));
String lxrdh=cf.GB2Uni(request.getParameter("lxrdh"));
String sfzhm=cf.GB2Uni(request.getParameter("sfzhm"));
String hjszd=cf.GB2Uni(request.getParameter("hjszd"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));


String wheredwbh=cf.GB2Uni(request.getParameter("wheredwbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update sq_dwxx set ssfgs=?,dwmc=?,ssdw=?,dwlx=?,dwdz=?,dwdh=?,dwcz=?,bz=?,zbj=?,tdbz=?,tdkssj=?,tdzzsj=?,bzs=?,cxbz=?,jjlxr=?,lxrdh=?,sfzhm=?,hjszd=?,dqbm=?,duihao=?,sgdjbbm=?,jcf=?";
	ls_sql+=" where  (dwbh='"+wheredwbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ssfgs);
	ps.setString(2,dwmc);
	ps.setString(3,ssdw);
	ps.setString(4,dwlx);
	ps.setString(5,dwdz);
	ps.setString(6,dwdh);
	ps.setString(7,dwcz);
	ps.setString(8,bz);

	ps.setInt(9,zbj);
	ps.setString(10,tdbz);
	ps.setDate(11,tdkssj);
	ps.setDate(12,tdzzsj);
	ps.setInt(13,bzs);
	ps.setString(14,cxbz);
	ps.setString(15,jjlxr);
	ps.setString(16,lxrdh);
	ps.setString(17,sfzhm);
	ps.setString(18,hjszd);
	ps.setString(19,dqbm);
	ps.setString(20,duihao);
	ps.setString(21,sgdjbbm);
	ps.setString(22,jcf);

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