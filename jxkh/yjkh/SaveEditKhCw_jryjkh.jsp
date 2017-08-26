<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

int byqds=0;
ls=request.getParameter("byqds");
try{
	if (!(ls.equals("")))  byqds=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[byqds]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[本月签单数]类型转换发生意外:"+e);
	return;
}

double byyj=0;
ls=request.getParameter("byyj");
try{
	if (!(ls.equals("")))  byyj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[byyj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[本月业绩]类型转换发生意外:"+e);
	return;
}
double dzkhbl=0;
ls=request.getParameter("dzkhbl");
try{
	if (!(ls.equals("")))  dzkhbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dzkhbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[考核比例]类型转换发生意外:"+e);
	return;
}


String khr=null;
khr=cf.GB2Uni(request.getParameter("khr"));

java.sql.Date khsj=null;
ls=request.getParameter("khsj");
try{
	if (!(ls.equals("")))  khsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[khsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[考核时间]类型转换发生意外:"+e);
	return;
}
String bz=null;
bz=cf.GB2Uni(request.getParameter("bz"));

String wherekhzq=cf.GB2Uni(request.getParameter("wherekhzq"));
String whereygbh=cf.GB2Uni(request.getParameter("whereygbh"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update cw_jryjkh set sfkh='Y',byqds="+byqds+",byyj="+byyj+",dzkhbl="+dzkhbl+",khr='"+khr+"',khsj=SYSDATE,bz='"+bz+"'";//1：未考核；2：录入任务；3：考核；4：提成
	ls_sql+=" where khzq='"+wherekhzq+"' and ygbh='"+whereygbh+"'";
	ps= conn.prepareStatement(ls_sql);
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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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