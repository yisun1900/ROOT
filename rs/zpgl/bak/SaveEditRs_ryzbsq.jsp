<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sqbh=null;
long zbye=0;
String zbzw=null;
String fgs=null;
String dwbh=null;
String zbly=null;
String zbqt=null;
java.sql.Date xwdgsj=null;
String xb=null;
String hy=null;
String nl=null;
String xl=null;
String zy=null;
String wy=null;
String jsjjn=null;
String gzjy=null;
String gx=null;
String jn=null;
String qt=null;
String rygznr=null;
String ztbm=null;
String bz=null;
sqbh=cf.GB2Uni(request.getParameter("sqbh"));
ls=request.getParameter("zbye");
try{
	if (!(ls.equals("")))  zbye=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zbye不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增补员额]类型转换发生意外:"+e);
	return;
}
zbzw=cf.GB2Uni(request.getParameter("zbzw"));
fgs=cf.GB2Uni(request.getParameter("fgs"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
zbly=cf.GB2Uni(request.getParameter("zbly"));
zbqt=cf.GB2Uni(request.getParameter("zbqt"));
ls=request.getParameter("xwdgsj");
try{
	if (!(ls.equals("")))  xwdgsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xwdgsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[希望到岗时间]类型转换发生意外:"+e);
	return;
}
xb=cf.GB2Uni(request.getParameter("xb"));
hy=cf.GB2Uni(request.getParameter("hy"));
nl=cf.GB2Uni(request.getParameter("nl"));
xl=cf.GB2Uni(request.getParameter("xl"));
zy=cf.GB2Uni(request.getParameter("zy"));
wy=cf.GB2Uni(request.getParameter("wy"));
jsjjn=cf.GB2Uni(request.getParameter("jsjjn"));
gzjy=cf.GB2Uni(request.getParameter("gzjy"));
gx=cf.GB2Uni(request.getParameter("gx"));
jn=cf.GB2Uni(request.getParameter("jn"));
qt=cf.GB2Uni(request.getParameter("qt"));
rygznr=cf.GB2Uni(request.getParameter("rygznr"));
ztbm=cf.GB2Uni(request.getParameter("ztbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String wheresqbh=null;
wheresqbh=cf.GB2Uni(request.getParameter("wheresqbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update rs_ryzbsq set sqbh=?,zbye=?,zbzw=?,fgs=?,dwbh=?,zbly=?,zbqt=?,xwdgsj=?,xb=?,hy=?,nl=?,xl=?,zy=?,wy=?,jsjjn=?,gzjy=?,gx=?,jn=?,qt=?,rygznr=?,ztbm=?,bz=? ";
	ls_sql+=" where  (sqbh='"+wheresqbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sqbh);
	ps.setLong(2,zbye);
	ps.setString(3,zbzw);
	ps.setString(4,fgs);
	ps.setString(5,dwbh);
	ps.setString(6,zbly);
	ps.setString(7,zbqt);
	ps.setDate(8,xwdgsj);
	ps.setString(9,xb);
	ps.setString(10,hy);
	ps.setString(11,nl);
	ps.setString(12,xl);
	ps.setString(13,zy);
	ps.setString(14,wy);
	ps.setString(15,jsjjn);
	ps.setString(16,gzjy);
	ps.setString(17,gx);
	ps.setString(18,jn);
	ps.setString(19,qt);
	ps.setString(20,rygznr);
	ps.setString(21,ztbm);
	ps.setString(22,bz);
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