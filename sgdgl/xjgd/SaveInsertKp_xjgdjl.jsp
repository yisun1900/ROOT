<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xjjlh=request.getParameter("xjjlh");
String xjlxbm=request.getParameter("xjlxbm");
String xjjgbm=request.getParameter("xjjgbm");
String lrdw=request.getParameter("lrdw");
String khbh=null;
String xjr=null;
java.sql.Date xjsj=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;

khbh=cf.GB2Uni(request.getParameter("khbh"));
xjr=cf.GB2Uni(request.getParameter("xjr"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("xjsj");
try{
	if (!(ls.equals("")))  xjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[处罚时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String sgd=cf.GB2Uni(request.getParameter("sgd"));
double jlje=0;
ls=request.getParameter("jlje");
try{
	if (!(ls.equals("")))  jlje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jlje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[奖励金额]类型转换发生意外:"+e);
	return;
}
String zpml=request.getParameter("zpml");


Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="insert into kp_xjgdjl ( xjjlh,khbh,xjlxbm,xjr,xjsj,xjjgbm,sgd,jlje,lrr,lrdw   ,bz,zpml,lrsj   ,cfspbz,kpbz,jsbz,wtclbz,fkze,kfzs,kcjdebl,zpsl) ";
	ls_sql+=" values (              ?,?,?,?,?,?,?,?,?,?                                   ,? ,?   ,sysdate,'1'   ,'N' ,'N' ,'B'   ,0   ,0   ,0      ,0) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xjjlh);
	ps.setString(2,khbh);
	ps.setString(3,xjlxbm);
	ps.setString(4,xjr);
	ps.setDate(5,xjsj);
	ps.setString(6,xjjgbm);
	ps.setString(7,sgd);
	ps.setDouble(8,jlje);
	ps.setString(9,lrr);
	ps.setString(10,lrdw);

	ps.setString(11,bz);
	ps.setString(12,zpml);
	ps.executeUpdate();
	ps.close();

	//发送短信
	ybl.dxxt.Dxxt dxxt=new ybl.dxxt.Dxxt("hmy");
	String retStr=dxxt.jcgdKhFs(conn,xjjlh,lrr);//调用发送短信函数
	if (retStr.equals(""))
	{
		out.println("短信发送成功");
	}
	else{
		out.println(retStr);//将发送结果显示到页面上
	}

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
	out.print("<BR>SQL= " + ls_sql);
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