<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();
String yhmc=(String)session.getAttribute("yhmc");

int zqs=0;
String ls=null;
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

String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String ssbm = request.getParameter("ssbm");

String[] ygmc =request.getParameterValues("ygmc");
String[] yy_sjbdj_sydjcbStr=request.getParameterValues("yy_sjbdj_sydjcb");
String[] yy_sjbdj_byjhStr=request.getParameterValues("yy_sjbdj_byjh");
String[] yy_sjbdj_byljStr=request.getParameterValues("yy_sjbdj_bylj");
String[] yy_sjbdj_szjhStr=request.getParameterValues("yy_sjbdj_szjh");
String[] yy_sjbdj_szwcStr=request.getParameterValues("yy_sjbdj_szwc");
String[] yy_sjbdj_bzyjStr=request.getParameterValues("yy_sjbdj_bzyj");
String[] yy_sjbdj_bztdjStr=request.getParameterValues("yy_sjbdj_bztdj");
String[] yy_sjbdj_byljtdjStr=request.getParameterValues("yy_sjbdj_byljtdj");
String[] yy_sjbsjf_byjhStr=request.getParameterValues("yy_sjbsjf_byjh");
String[] yy_sjbsjf_byljStr=request.getParameterValues("yy_sjbsjf_bylj");
String[] yy_sjbsjf_szjhStr=request.getParameterValues("yy_sjbsjf_szjh");
String[] yy_sjbsjf_szwcStr=request.getParameterValues("yy_sjbsjf_szwc");
String[] yy_sjbsjf_bzyjStr=request.getParameterValues("yy_sjbsjf_bzyj");
String[] yy_sjbgccz_byjhStr=request.getParameterValues("yy_sjbgccz_byjh");
String[] yy_sjbgccz_byljStr=request.getParameterValues("yy_sjbgccz_bylj");
String[] yy_sjbgccz_szjhStr=request.getParameterValues("yy_sjbgccz_szjh");
String[] yy_sjbgccz_szwcStr=request.getParameterValues("yy_sjbgccz_szwc");
String[] yy_sjbgccz_bzyjStr=request.getParameterValues("yy_sjbgccz_bzyj");
String[] yy_sjbzccz_byjhStr=request.getParameterValues("yy_sjbzccz_byjh");
String[] yy_sjbzccz_byljStr=request.getParameterValues("yy_sjbzccz_bylj");
String[] yy_sjbzccz_szjhStr=request.getParameterValues("yy_sjbzccz_szjh");
String[] yy_sjbzccz_szwcStr=request.getParameterValues("yy_sjbzccz_szwc");
String[] yy_sjbzccz_bzyjStr=request.getParameterValues("yy_sjbzccz_bzyj");

//////////////////////////////////////////////////////  

String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
PreparedStatement ps1=null;
ResultSet rs1=null;
try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);

	for (int i=0;i<ygmc.length ;i++ )
	{
		int yy_sjbdj_sydjcb=0;
		int yy_sjbdj_byjh=0;
		int yy_sjbdj_bylj=0;
		int yy_sjbdj_szjh=0;
		int yy_sjbdj_szwc=0;
		int yy_sjbdj_bzyj=0;
		int yy_sjbdj_bztdj=0;
		int yy_sjbdj_byljtdj=0;
		double yy_sjbsjf_byjh=0;
		double yy_sjbsjf_bylj=0;
		double yy_sjbsjf_szjh=0;
		double yy_sjbsjf_szwc=0;
		double yy_sjbsjf_bzyj=0;
		double yy_sjbgccz_byjh=0;
		double yy_sjbgccz_bylj=0;
		double yy_sjbgccz_szjh=0;
		double yy_sjbgccz_szwc=0;
		double yy_sjbgccz_bzyj=0;
		double yy_sjbzccz_byjh=0;
		double yy_sjbzccz_bylj=0;
		double yy_sjbzccz_szjh=0;
		double yy_sjbzccz_szwc=0;
		double yy_sjbzccz_bzyj=0;


		try{
			yy_sjbdj_sydjcb=Integer.parseInt(yy_sjbdj_sydjcbStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(ygmc[i])+"[以往(非本月)储备]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbdj_byjh=Integer.parseInt(yy_sjbdj_byjhStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(ygmc[i])+"[本月计划收取定金]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbdj_bylj=Integer.parseInt(yy_sjbdj_byljStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(ygmc[i])+"[本月累计收取定金]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbdj_szjh=Integer.parseInt(yy_sjbdj_szjhStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(ygmc[i])+"[上周计划收取定金]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbdj_szwc=Integer.parseInt(yy_sjbdj_szwcStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(ygmc[i])+"[上周完成收取定金]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbdj_bzyj=Integer.parseInt(yy_sjbdj_bzyjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(ygmc[i])+"[本周预计收取定金]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbdj_bztdj=Integer.parseInt(yy_sjbdj_bztdjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(ygmc[i])+"[本周退定金]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbdj_byljtdj=Integer.parseInt(yy_sjbdj_byljtdjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(ygmc[i])+"[本月累计退定金]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbsjf_byjh=Double.parseDouble(yy_sjbsjf_byjhStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(ygmc[i])+"[设计费本月计划]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbsjf_bylj=Double.parseDouble(yy_sjbsjf_byljStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(ygmc[i])+"[设计费本月累计]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbsjf_szjh=Double.parseDouble(yy_sjbsjf_szjhStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(ygmc[i])+"[设计费上周计划]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbsjf_szwc=Double.parseDouble(yy_sjbsjf_szwcStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(ygmc[i])+"[设计费上周完成]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbsjf_bzyj=Double.parseDouble(yy_sjbsjf_bzyjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(ygmc[i])+"[设计费本周预计]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbgccz_byjh=Double.parseDouble(yy_sjbgccz_byjhStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(ygmc[i])+"[工程产值本月计划]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbgccz_bylj=Double.parseDouble(yy_sjbgccz_byljStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(ygmc[i])+"[工程产值本月累计]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbgccz_szjh=Double.parseDouble(yy_sjbgccz_szjhStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(ygmc[i])+"[工程产值上周计划]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbgccz_szwc=Double.parseDouble(yy_sjbgccz_szwcStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(ygmc[i])+"[工程产值上周完成]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbgccz_bzyj=Double.parseDouble(yy_sjbgccz_bzyjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(ygmc[i])+"[工程产值本周预计]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbzccz_byjh=Double.parseDouble(yy_sjbzccz_byjhStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(ygmc[i])+"[主材产值本月计划]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbzccz_bylj=Double.parseDouble(yy_sjbzccz_byljStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(ygmc[i])+"[主材产值本月累计]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbzccz_szjh=Double.parseDouble(yy_sjbzccz_szjhStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(ygmc[i])+"[主材产值上周计划]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbzccz_szwc=Double.parseDouble(yy_sjbzccz_szwcStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(ygmc[i])+"[主材产值上周完成]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbzccz_bzyj=Double.parseDouble(yy_sjbzccz_bzyjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(ygmc[i])+"[主材产值本月预计]不是数字类型:"+e);
			return;
		}


		ls_sql=" delete from yy_sjb " ;
		ls_sql+=" where yy_sjb_ygmc='"+cf.GB2Uni(ygmc[i])+"' and zqs='"+zqs+"' and ssbm='"+ssbm+"' and ssfgs='"+ssfgs+"'" ;
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
			
		ls_sql="insert into yy_sjb ( zqs,yy_sjb_ygmc,ssbm,ssfgs,yy_sjbdj_sydjcb,yy_sjbdj_byjh,yy_sjbdj_bylj,yy_sjbdj_szjh,yy_sjbdj_szwc,yy_sjbdj_bzyj,yy_sjbdj_bztdj,yy_sjbdj_byljtdj,yy_sjbsjf_byjh,yy_sjbsjf_bylj,yy_sjbsjf_szjh,yy_sjbsjf_szwc,yy_sjbsjf_bzyj,yy_sjbgccz_byjh,yy_sjbgccz_bylj,yy_sjbgccz_szjh,yy_sjbgccz_szwc,yy_sjbgccz_bzyj,yy_sjbzccz_byjh,yy_sjbzccz_bylj,yy_sjbzccz_szjh,yy_sjbzccz_szwc,yy_sjbzccz_bzyj,yy_sjb_lrr,yy_sjb_lrsj ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,SYSDATE ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,zqs);
		ps.setString(2,cf.GB2Uni(ygmc[i]));
		ps.setString(3,ssbm);
		ps.setString(4,ssfgs);
		ps.setInt(5,yy_sjbdj_sydjcb);
		ps.setInt(6,yy_sjbdj_byjh);
		ps.setInt(7,yy_sjbdj_bylj);
		ps.setInt(8,yy_sjbdj_szjh);
		ps.setInt(9,yy_sjbdj_szwc);
		ps.setInt(10,yy_sjbdj_bzyj);
		ps.setInt(11,yy_sjbdj_bztdj);
		ps.setInt(12,yy_sjbdj_byljtdj);
		ps.setDouble(13,yy_sjbsjf_byjh);
		ps.setDouble(14,yy_sjbsjf_bylj);
		ps.setDouble(15,yy_sjbsjf_szjh);
		ps.setDouble(16,yy_sjbsjf_szwc);
		ps.setDouble(17,yy_sjbsjf_bzyj);
		ps.setDouble(18,yy_sjbgccz_byjh);
		ps.setDouble(19,yy_sjbgccz_bylj);
		ps.setDouble(20,yy_sjbgccz_szjh);
		ps.setDouble(21,yy_sjbgccz_szwc);
		ps.setDouble(22,yy_sjbgccz_bzyj);
		ps.setDouble(23,yy_sjbzccz_byjh);
		ps.setDouble(24,yy_sjbzccz_bylj);
		ps.setDouble(25,yy_sjbzccz_szjh);
		ps.setDouble(26,yy_sjbzccz_szwc);
		ps.setDouble(27,yy_sjbzccz_bzyj);
		ps.setString(28,yhmc);
		ps.executeUpdate();
		ps.close();

	}


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("保存成功");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>ls_sql=" + ls_sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
