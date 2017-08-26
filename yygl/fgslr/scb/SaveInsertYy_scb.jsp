<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
int zqs=0;
String ls=null;
String yy_scb_lrr=null;
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
yy_scb_lrr=cf.GB2Uni(request.getParameter("yy_scb_lrr"));


String[] yy_scb_ygmc=request.getParameterValues("yy_scb_ygmc");
String[] ssbm=request.getParameterValues("ssbm");
String[] ssfgs=request.getParameterValues("ssfgs");

String[] yy_scbkh_byjhStr=request.getParameterValues("yy_scbkh_byjh");
String[] yy_scbkh_byljStr=request.getParameterValues("yy_scbkh_bylj");
String[] yy_scbkh_szjhStr=request.getParameterValues("yy_scbkh_szjh");
String[] yy_scbkh_szwcStr=request.getParameterValues("yy_scbkh_szwc");
String[] yy_scbkh_bzyjStr=request.getParameterValues("yy_scbkh_bzyj");

String[] yy_scbdj_byjhStr=request.getParameterValues("yy_scbdj_byjh");
String[] yy_scbdj_byljStr=request.getParameterValues("yy_scbdj_bylj");
String[] yy_scbdj_szjhStr=request.getParameterValues("yy_scbdj_szjh");
String[] yy_scbdj_szwcStr=request.getParameterValues("yy_scbdj_szwc");
String[] yy_scbdj_bzjhStr=request.getParameterValues("yy_scbdj_bzjh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);
	

    for(int i=0;i<yy_scb_ygmc.length;i++ )
	{
		int yy_scbkh_byjh=0;
		int yy_scbkh_bylj=0;
		int yy_scbkh_szjh=0;
		int yy_scbkh_szwc=0;
		int yy_scbkh_bzyj=0;

		int yy_scbdj_byjh=0;
		int yy_scbdj_bylj=0;
		int yy_scbdj_szjh=0;
		int yy_scbdj_szwc=0;
		int yy_scbdj_bzjh=0;

		try{
			yy_scbkh_byjh=Integer.parseInt(yy_scbkh_byjhStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(yy_scb_ygmc[i])+"[目标客户数量本月计划]不是整数:"+e);
			return;
		}

		try{
			yy_scbkh_bylj=Integer.parseInt(yy_scbkh_byljStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(yy_scb_ygmc[i])+"[目标客户数量本月累计]不是整数:"+e);
			return;
		}

		try{
			yy_scbkh_szjh=Integer.parseInt(yy_scbkh_szjhStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(yy_scb_ygmc[i])+"[目标客户数量上周计划]不是整数:"+e);
			return;
		}


		try{
			yy_scbkh_szwc=Integer.parseInt(yy_scbkh_szwcStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(yy_scb_ygmc[i])+"[目标客户数量上周完成]不是整数:"+e);
			return;
		}

		try{
			yy_scbkh_bzyj=Integer.parseInt(yy_scbkh_bzyjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(yy_scb_ygmc[i])+"[目标客户数量本周预计]不是整数:"+e);
			return;
		}

		try{
			yy_scbdj_byjh=Integer.parseInt(yy_scbdj_byjhStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(yy_scb_ygmc[i])+"[收取定金本月计划]不是整数:"+e);
			return;
		}

		try{
			yy_scbdj_bylj=Integer.parseInt(yy_scbdj_byljStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(yy_scb_ygmc[i])+"[收取定金本月累计]不是整数:"+e);
			return;
		}

		try{
			yy_scbdj_szjh=Integer.parseInt(yy_scbdj_szjhStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(yy_scb_ygmc[i])+"[收取定金上周完成]不是整数:"+e);
			return;
		}

		try{
			yy_scbdj_szwc=Integer.parseInt(yy_scbdj_szwcStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(yy_scb_ygmc[i])+"[收取定金上周完成]不是整数:"+e);
			return;
		}

		try{
			yy_scbdj_bzjh=Integer.parseInt(yy_scbdj_bzjhStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(yy_scb_ygmc[i])+"[收取定金本周预计]不是整数:"+e);
			return;
		}

		ls_sql="insert into yy_scb ( zqs,yy_scb_ygmc,ssbm,ssfgs,yy_scbkh_byjh,yy_scbkh_bylj,yy_scbkh_szjh,yy_scbkh_szwc,yy_scbkh_bzyj,yy_scbdj_byjh,yy_scbdj_bylj,yy_scbdj_szjh,yy_scbdj_szwc,yy_scbdj_bzjh,yy_scb_lrr,yy_scb_lrsj ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,SYSDATE ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,zqs);
		ps.setString(2,cf.GB2Uni(yy_scb_ygmc[i]));
		ps.setString(3,ssbm[i]);
		ps.setString(4,ssfgs[i]);
		ps.setInt(5,yy_scbkh_byjh);
		ps.setInt(6,yy_scbkh_bylj);
		ps.setInt(7,yy_scbkh_szjh);
		ps.setInt(8,yy_scbkh_szwc);
		ps.setInt(9,yy_scbkh_bzyj);
		ps.setInt(10,yy_scbdj_byjh);
		ps.setInt(11,yy_scbdj_bylj);
		ps.setInt(12,yy_scbdj_szjh);
		ps.setInt(13,yy_scbdj_szwc);
		ps.setInt(14,yy_scbdj_bzjh);
		ps.setString(15,yy_scb_lrr);
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