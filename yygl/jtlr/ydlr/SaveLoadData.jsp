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

String[] fgsbh=request.getParameterValues("fgsbh");
String[] yy_sjscb_mbkhStr=request.getParameterValues("yy_sjscb_mbkh");
String[] yy_sjscb_sqdjStr=request.getParameterValues("yy_sjscb_sqdj");
String[] yy_sjwxb_mbkhStr=request.getParameterValues("yy_sjwxb_mbkh");
String[] yy_sjwxb_sqdjStr=request.getParameterValues("yy_sjwxb_sqdj");
String[] yy_sjqtqd_mbkhStr=request.getParameterValues("yy_sjqtqd_mbkh");
String[] yy_sjqtqd_sqdjStr=request.getParameterValues("yy_sjqtqd_sqdj");
String[] yy_sjzky_mbkhStr=request.getParameterValues("yy_sjzky_mbkh");
String[] yy_sjzky_sqdjStr=request.getParameterValues("yy_sjzky_sqdj");
String[] yy_sjsjb_sjfStr=request.getParameterValues("yy_sjsjb_sjf");
String[] yy_sjsjb_tqsjfStr=request.getParameterValues("yy_sjsjb_tqsjf");
String[] yy_sjsjb_gcczStr=request.getParameterValues("yy_sjsjb_gccz");
String[] yy_sjsjb_tqgcczStr=request.getParameterValues("yy_sjsjb_tqgccz");
String[] yy_sjjjb_byjhStr=request.getParameterValues("yy_sjjjb_byjh");
String[] yy_sjjjb_qntqStr=request.getParameterValues("yy_sjjjb_qntq");

//////////////////////////////////////////////////////  

String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);

	ls_sql=" delete from yy_cx " ;
	ls_sql+=" where  zqs='"+zqs+"'" ;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<fgsbh.length ;i++ )
	{
		int yy_sjzky_mbkh=0;
		int yy_sjzky_sqdj=0;
		double yy_sjsjb_sjf=0;
		double yy_sjsjb_tqsjf=0;
		double yy_sjsjb_gccz=0;
		double yy_sjsjb_tqgccz=0;
		double yy_sjjjb_byjh=0;
		double yy_sjjjb_qntq=0;
		int yy_sjscb_mbkh=0;
		int yy_sjwxb_mbkh=0;
		int yy_sjqtqd_mbkh=0;
		int yy_sjscb_sqdj=0;
		int yy_sjwxb_sqdj=0;
		int yy_sjqtqd_sqdj=0;

 		try{
			yy_sjzky_mbkh=Integer.parseInt(yy_sjzky_mbkhStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+fgsbh[i]+"[总客源目标客户数量本月计划]不是数字:"+e);
			return;
		}

 		try{
			yy_sjzky_sqdj=Integer.parseInt(yy_sjzky_sqdjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+fgsbh[i]+"[总客源收取定金数量本月计划]不是数字:"+e);
			return;
		}

		try{
			yy_sjsjb_sjf=Double.parseDouble(yy_sjsjb_sjfStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+fgsbh[i]+"[设计部设计费本月计划]不是数字:"+e);
			return;
		}

		try{
			yy_sjsjb_tqsjf=Double.parseDouble(yy_sjsjb_tqsjfStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+fgsbh[i]+"[设计部去年同期月度设计费]不是数字:"+e);
			return;
		}

		try{
			yy_sjsjb_gccz=Double.parseDouble(yy_sjsjb_gcczStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+fgsbh[i]+"[设计部工程产值本月计划]不是数字:"+e);
			return;
		}

		try{
			yy_sjsjb_tqgccz=Double.parseDouble(yy_sjsjb_tqgcczStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+fgsbh[i]+"[设计部去年同期月度工程产值]不是数字:"+e);
			return;
		}

		try{
			yy_sjjjb_byjh=Double.parseDouble(yy_sjjjb_byjhStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+fgsbh[i]+"[家居部主材产值本月计划]不是数字:"+e);
			return;
		}

		try{
			yy_sjjjb_qntq=Double.parseDouble(yy_sjjjb_qntqStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+fgsbh[i]+"[家居部去年同期月度主材产值]不是数字:"+e);
			return;
		}

		try{
			yy_sjscb_mbkh=Integer.parseInt(yy_sjscb_mbkhStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+fgsbh[i]+"[市场部目标客户数量本月计划]不是数字:"+e);
			return;
		}

		try{
			yy_sjwxb_mbkh=Integer.parseInt(yy_sjwxb_mbkhStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+fgsbh[i]+"[网销部目标客户数量本月计划]不是数字:"+e);
			return;
		}

		try{
			yy_sjqtqd_mbkh=Integer.parseInt(yy_sjqtqd_mbkhStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+fgsbh[i]+"[其他渠道目标客户数量本月计划]不是数字:"+e);
			return;
		}

		try{
			yy_sjscb_sqdj=Integer.parseInt(yy_sjscb_sqdjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+fgsbh[i]+"[市场部收取定金数量本月计划]不是数字:"+e);
			return;
		}

		try{
			yy_sjwxb_sqdj=Integer.parseInt(yy_sjwxb_sqdjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+fgsbh[i]+"[网销部收取定金数量本月计划]不是数字:"+e);
			return;
		}

		try{
			yy_sjqtqd_sqdj=Integer.parseInt(yy_sjqtqd_sqdjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+fgsbh[i]+"[其他渠道收取定金数量本月计划]不是数字:"+e);
			return;
		}


		ls_sql="insert into yy_sj ( zqs,yy_sj_fgs,yy_sjzky_mbkh,yy_sjzky_sqdj,yy_sjsjb_sjf,yy_sjsjb_tqsjf,yy_sjsjb_gccz,yy_sjsjb_tqgccz,yy_sjjjb_byjh,yy_sjjjb_qntq,yy_sjscb_mbkh,yy_sjwxb_mbkh,yy_sjqtqd_mbkh,yy_sjscb_sqdj,yy_sjwxb_sqdj,yy_sjqtqd_sqdj,lrr,yy_sj_lrsj ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,SYSDATE ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,zqs);
		ps.setString(2,fgsbh[i]);
		ps.setInt(3,yy_sjzky_mbkh);
		ps.setInt(4,yy_sjzky_sqdj);
		ps.setDouble(5,yy_sjsjb_sjf);
		ps.setDouble(6,yy_sjsjb_tqsjf);
		ps.setDouble(7,yy_sjsjb_gccz);
		ps.setDouble(8,yy_sjsjb_tqgccz);
		ps.setDouble(9,yy_sjjjb_byjh);
		ps.setDouble(10,yy_sjjjb_qntq);
		ps.setInt(11,yy_sjscb_mbkh);
		ps.setInt(12,yy_sjwxb_mbkh);
		ps.setInt(13,yy_sjqtqd_mbkh);
		ps.setInt(14,yy_sjscb_sqdj);
		ps.setInt(15,yy_sjwxb_sqdj);
		ps.setInt(16,yy_sjqtqd_sqdj);
		ps.setString(17,yhmc);
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
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
