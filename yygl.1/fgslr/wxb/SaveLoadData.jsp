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
String[] byjh =request.getParameterValues("byjh");
String[] bylj =request.getParameterValues("bylj");
String[] szjh =request.getParameterValues("szjh");
String[] szwc =request.getParameterValues("szwc");
String[] bzyj =request.getParameterValues("bzyj");

String[] byjhdj =request.getParameterValues("byjhdj");
String[] byljdj =request.getParameterValues("byljdj");
String[] szjhdj =request.getParameterValues("szjhdj");
String[] szwcdj =request.getParameterValues("szwcdj");
String[] bzjhdj =request.getParameterValues("bzjhdj");

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

		ls_sql=" delete from yy_wxb " ;
		ls_sql+=" where yy_wxb_ygmc='"+cf.GB2Uni(ygmc[i])+"' and zqs='"+zqs+"'" ;
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
			
		ls_sql="insert into yy_wxb ( zqs,yy_wxb_ygmc,ssbm,ssfgs,yy_wxbkh_byjh,yy_wxbkh_bylj,yy_wxbkh_szjh,yy_wxbkh_szwc,yy_wxbkh_bzyj,yy_wxbdj_byjh,yy_wxbdj_bylj,yy_wxbdj_szjh,yy_wxbdj_szwc,yy_wxbdj_bzjh,yy_wxb_lrr,yy_wxb_lrsj ) ";
		ls_sql+=" values('"+zqs+"','"+cf.GB2Uni(ygmc[i])+"','"+ssbm+"','"+ssfgs+"','"+byjh[i]+"','"+bylj[i]+"','"+szjh[i]+"','"+szwc[i]+"','"+szwc[i]+"'";
		ls_sql+=" ,'"+byjhdj[i]+"',"+byljdj[i]+",'"+szjhdj[i]+"','"+szwcdj[i]+"','"+bzjhdj[i]+"','"+yhmc+"',SYSDATE)";
		ps= conn.prepareStatement(ls_sql);
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
