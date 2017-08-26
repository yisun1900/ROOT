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
//下面的7个列属性值均为数字型，但是在这里先取为String，在往数据库中插入是再转换为数字
String[] jjbqntq =request.getParameterValues("jjbqntq");//去年同期月度主材产值
String[] jjbbyjh=request.getParameterValues("jjbbyjh");//
String[] jjbylj=request.getParameterValues("jjbylj");//
String[] jjbdmbylj=request.getParameterValues("jjbdmbylj");//
String[] jjbszjh=request.getParameterValues("jjbszjh");//
String[] jjbszwc=request.getParameterValues("jjbszwc");//

String[] jjbbzyj =request.getParameterValues("jjbbzyj");//


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

		ls_sql=" delete from yy_jjb " ;
		ls_sql+=" where yy_jjb_ygmc='"+cf.GB2Uni(ygmc[i])+"' and zqs='"+zqs+"'" ;
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
			
		ls_sql="insert into yy_jjb ( zqs,yy_jjb_ygmc,ssbm,ssfgs,yy_jjbqntq ,yy_jjbbyjh,yy_jjbylj,yy_jjbdmbylj,yy_jjbszjh,yy_jjbszwc,yy_jjbbzyj,yy_jjb_lrr,yy_jjb_lrsj ) ";
	//	ls_sql="insert into yy_jjb ";
		ls_sql+=" values('"+zqs+"','"+cf.GB2Uni(ygmc[i])+"','"+ssbm+"','"+ssfgs+"','"+Double.parseDouble(jjbqntq[i])+"','"+Double.parseDouble(jjbbyjh[i])+"','"+Double.parseDouble(jjbylj[i])+"','"+Double.parseDouble(jjbdmbylj[i])+"','"+Double.parseDouble(jjbszjh[i])+"','"+Double.parseDouble(jjbszwc[i])+"','"+Double.parseDouble(jjbbzyj[i])+"'";
		ls_sql+=" ,'"+yhmc+"',SYSDATE)";
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
