<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
int zqs=0;
String ls=null;
String yy_jjb_lrr=null;
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
yy_jjb_lrr=cf.GB2Uni(request.getParameter("yy_jjb_lrr"));


String[] yy_jjb_ygmc=request.getParameterValues("yy_jjb_ygmc");
String[] ssbm=request.getParameterValues("ssbm");
String[] ssfgs=request.getParameterValues("ssfgs");

String[] yy_jjbqntqStr =request.getParameterValues("yy_jjbqntq ");
String[] yy_jjbbyjhStr=request.getParameterValues("yy_jjbbyjh");
String[] yy_jjbyljStr=request.getParameterValues("yy_jjbylj");
String[] yy_jjbdmbyljStr=request.getParameterValues("yy_jjbdmbylj");
String[] yy_jjbszjhStr=request.getParameterValues("yy_jjbszjh");
String[] yy_jjbszwcStr=request.getParameterValues("yy_jjbszwc");
String[] yy_jjbbzyjStr=request.getParameterValues("yy_jjbbzyj");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	
    for(int i=0;i<yy_jjb_ygmc.length;i++ )
	{
		double yy_jjbqntq=0;
		double yy_jjbbyjh=0;
		double yy_jjbylj=0;
		double yy_jjbdmbylj=0;
		double yy_jjbszjh=0;
		double yy_jjbszwc=0;
		double yy_jjbbzyj=0;


		try{
			yy_jjbqntq=Double.parseDouble(yy_jjbqntqStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(yy_jjb_ygmc[i])+"[去年同期月度主材产值]类型转换发生意外:"+e);
			return;
		}

		try{
			yy_jjbbyjh=Double.parseDouble(yy_jjbbyjhStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(yy_jjb_ygmc[i])+"[本月计划]类型转换发生意外:"+e);
			return;
		}

		try{
			yy_jjbylj=Double.parseDouble(yy_jjbyljStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(yy_jjb_ygmc[i])+"[本月累计]类型转换发生意外:"+e);
			return;
		}

		try{
			yy_jjbdmbylj=Double.parseDouble(yy_jjbdmbyljStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(yy_jjb_ygmc[i])+"[所属店面本月累计工程产值]类型转换发生意外:"+e);
			return;
		}

		try{
			yy_jjbszjh=Double.parseDouble(yy_jjbszjhStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(yy_jjb_ygmc[i])+"[上周计划]类型转换发生意外:"+e);
			return;
		}

		try{
			yy_jjbszwc=Double.parseDouble(yy_jjbszwcStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(yy_jjb_ygmc[i])+"[上周完成]类型转换发生意外:"+e);
			return;
		}

		try{
			yy_jjbbzyj=Double.parseDouble(yy_jjbbzyjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>"+cf.GB2Uni(yy_jjb_ygmc[i])+"[本周预计]类型转换发生意外:"+e);
			return;
		}

		ls_sql="insert into yy_jjb ( zqs,yy_jjb_ygmc,ssbm,ssfgs,yy_jjbqntq,yy_jjbbyjh,yy_jjbylj,yy_jjbdmbylj,yy_jjbszjh,yy_jjbszwc,yy_jjbbzyj,yy_jjb_lrr,yy_jjb_lrsj ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,SYSDATE ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,zqs);
		ps.setString(2,cf.GB2Uni(yy_jjb_ygmc[i]));
		ps.setString(3,ssbm[i]);
		ps.setString(4,ssfgs[i]);
		ps.setDouble(5,yy_jjbqntq);
		ps.setDouble(6,yy_jjbbyjh);
		ps.setDouble(7,yy_jjbylj);
		ps.setDouble(8,yy_jjbdmbylj);
		ps.setDouble(9,yy_jjbszjh);
		ps.setDouble(10,yy_jjbszwc);
		ps.setDouble(11,yy_jjbbzyj);
		ps.setString(12,yy_jjb_lrr);
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