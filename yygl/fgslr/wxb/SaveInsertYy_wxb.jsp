<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
int zqs=0;
String ls=null;
String yy_wxb_lrr=null;
ls=request.getParameter("zqs");
try{
	if (!(ls.equals("")))  zqs=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zqs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[周期数]类型转换发生意外:"+e);
	return;
}
yy_wxb_lrr=cf.GB2Uni(request.getParameter("yy_wxb_lrr"));


String[] yy_wxb_ygmc=request.getParameterValues("yy_wxb_ygmc");
String[] ssbm=request.getParameterValues("ssbm");
String[] ssfgs=request.getParameterValues("ssfgs");

String[] yy_wxbkh_byjhStr =request.getParameterValues("yy_wxbkh_byjh ");
String[] yy_wxbkh_byljStr=request.getParameterValues("yy_wxbkh_bylj");
String[] yy_wxbkh_szjhStr=request.getParameterValues("yy_wxbkh_szjh");
String[] yy_wxbkh_szwcStr=request.getParameterValues("yy_wxbkh_szwc");
String[] yy_wxbkh_bzyjStr=request.getParameterValues("yy_wxbkh_bzyj");
String[] yy_wxbdj_byjhStr=request.getParameterValues("yy_wxbdj_byjh");
String[] yy_wxbdj_byljStr=request.getParameterValues("yy_wxbdj_bylj");
String[] yy_wxbdj_szjhStr=request.getParameterValues("yy_wxbdj_szjh");
String[] yy_wxbdj_szwcStr=request.getParameterValues("yy_wxbdj_szwc");
String[] yy_wxbdj_bzjhStr=request.getParameterValues("yy_wxbdj_bzjh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

    for(int i=0;i<yy_wxb_ygmc.length;i++ )
	{
		int yy_wxbkh_byjh=0;
		int yy_wxbkh_bylj=0;
		int yy_wxbkh_szjh=0;
		int yy_wxbkh_szwc=0;
		int yy_wxbkh_bzyj=0;
		int yy_wxbdj_byjh=0;
		int yy_wxbdj_bylj=0;
		int yy_wxbdj_szjh=0;
		int yy_wxbdj_szwc=0;
		int yy_wxbdj_bzjh=0;

		try{
			yy_wxbkh_byjh=Integer.parseInt(yy_wxbkh_byjhStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(yy_wxb_ygmc[i])+"[目标客户数量本月计划]不是整数:"+e);
			return;
		}

		try{
			yy_wxbkh_bylj=Integer.parseInt(yy_wxbkh_byljStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(yy_wxb_ygmc[i])+"[目标客户数量本月累计]不是整数:"+e);
			return;
		}

		try{
			yy_wxbkh_szjh=Integer.parseInt(yy_wxbkh_szjhStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(yy_wxb_ygmc[i])+"[目标客户数量上周计划]不是整数:"+e);
			return;
		}

		try{
			yy_wxbkh_szwc=Integer.parseInt(yy_wxbkh_szwcStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(yy_wxb_ygmc[i])+"[目标客户数量上周完成]不是整数:"+e);
			return;
		}

		try{
			yy_wxbkh_bzyj=Integer.parseInt(yy_wxbkh_bzyjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(yy_wxb_ygmc[i])+"[目标客户数量本周预计]不是整数:"+e);
			return;
		}

		try{
			yy_wxbdj_byjh=Integer.parseInt(yy_wxbdj_byjhStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(yy_wxb_ygmc[i])+"[收取定金数量本月计划]不是整数:"+e);
			return;
		}

		try{
			yy_wxbdj_bylj=Integer.parseInt(yy_wxbdj_byljStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(yy_wxb_ygmc[i])+"[收取定金数量本月累计]不是整数:"+e);
			return;
		}

		try{
			yy_wxbdj_szjh=Integer.parseInt(yy_wxbdj_szjhStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(yy_wxb_ygmc[i])+"[收取定金数量上周计划]不是整数:"+e);
			return;
		}

		try{
			yy_wxbdj_szwc=Integer.parseInt(yy_wxbdj_szwcStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(yy_wxb_ygmc[i])+"[收取定金数量上周完成]不是整数:"+e);
			return;
		}

		try{
			yy_wxbdj_bzjh=Integer.parseInt(yy_wxbdj_bzjhStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(yy_wxb_ygmc[i])+"[收取定金数量本周计划]不是整数:"+e);
			return;
		}
		
		ls_sql="insert into yy_wxb ( zqs,yy_wxb_ygmc,ssbm,ssfgs,yy_wxbkh_byjh,yy_wxbkh_bylj,yy_wxbkh_szjh,yy_wxbkh_szwc,yy_wxbkh_bzyj,yy_wxbdj_byjh,yy_wxbdj_bylj,yy_wxbdj_szjh,yy_wxbdj_szwc,yy_wxbdj_bzjh,yy_wxb_lrr,yy_wxb_lrsj ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,SYSDATE ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,zqs);
		ps.setString(2,cf.GB2Uni(yy_wxb_ygmc[i]));
		ps.setString(3,ssbm[i]);
		ps.setString(4,ssfgs[i]);
		ps.setInt(5,yy_wxbkh_byjh);
		ps.setInt(6,yy_wxbkh_bylj);
		ps.setInt(7,yy_wxbkh_szjh);
		ps.setInt(8,yy_wxbkh_szwc);
		ps.setInt(9,yy_wxbkh_bzyj);
		ps.setInt(10,yy_wxbdj_byjh);
		ps.setInt(11,yy_wxbdj_bylj);
		ps.setInt(12,yy_wxbdj_szjh);
		ps.setInt(13,yy_wxbdj_szwc);
		ps.setInt(14,yy_wxbdj_bzjh);
		ps.setString(15,yy_wxb_lrr);
		ps.executeUpdate();
		ps.close();
	}
	
		
	conn.commit();

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
	conn.rollback();
	out.print("Exception: " + e);
	out.print("sql: " + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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