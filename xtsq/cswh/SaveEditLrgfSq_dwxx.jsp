<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010122")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>

<%
String ls=null;

String zxkhlrjc=cf.GB2Uni(request.getParameter("zxkhlrjc"));
int zxkhlrts=0;
ls=request.getParameter("zxkhlrts");
try{
	if (!(ls.equals("")))  zxkhlrts=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zxkhlrts不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[咨询客户提前录入天数]类型转换发生意外:"+e);
	return;
}
String qdkhbljc=cf.GB2Uni(request.getParameter("qdkhbljc"));
int qdkhblts=0;
ls=request.getParameter("qdkhblts");
try{
	if (!(ls.equals("")))  qdkhblts=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qdkhblts不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签单客户补录允许天数]类型转换发生意外:"+e);
	return;
}

int djbhts=0;
ls=request.getParameter("djbhts");
try{
	if (!(ls.equals("")))  djbhts=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量djbhts不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[交定金客户保护天数]类型转换发生意外:"+e);
	return;
}

int scyjts=0;
ls=request.getParameter("scyjts");
try{
	if (!(ls.equals("")))  scyjts=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量scyjts不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[市场客户移交有效天数]类型转换发生意外:"+e);
	return;
}

String sjszdgh=cf.GB2Uni(request.getParameter("sjszdgh"));
String sjszdjz=cf.GB2Uni(request.getParameter("sjszdjz"));
String ywyzdgh=cf.GB2Uni(request.getParameter("ywyzdgh"));
String khjlzdgh=cf.GB2Uni(request.getParameter("khjlzdgh"));
String khjlzdjz=cf.GB2Uni(request.getParameter("khjlzdjz"));

String dwbh=cf.GB2Uni(request.getParameter("dwbh"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	
	ls_sql="update sq_dwxx set zxkhlrjc=?,zxkhlrts=?,qdkhbljc=?,qdkhblts=?,djbhts=?,scyjts=?,sjszdgh=?,sjszdjz=?,ywyzdgh=?,khjlzdgh=?,khjlzdjz=? ";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zxkhlrjc);
	ps.setInt(2,zxkhlrts);
	ps.setString(3,qdkhbljc);
	ps.setInt(4,qdkhblts);
	ps.setInt(5,djbhts);
	ps.setInt(6,scyjts);
	ps.setString(7,sjszdgh);
	ps.setString(8,sjszdjz);
	ps.setString(9,ywyzdgh);
	ps.setString(10,khjlzdgh);
	ps.setString(11,khjlzdjz);
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
	out.print("Exception: " + e);
	out.print("<BR>" + ls_sql);
	return;
}
finally 
{
	try{
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>






