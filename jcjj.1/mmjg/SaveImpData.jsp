<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String dqbm = request.getParameter("dqbm");


String[] mmxh =request.getParameterValues("mmxh");
String[] ysbm =request.getParameterValues("ysbm");
String[] qhjgqjbm =request.getParameterValues("qhjgqjbm");
String[] ztmdj =request.getParameterValues("ztmdj");
String[] dmsjg =request.getParameterValues("dmsjg");
String[] dmtjg =request.getParameterValues("dmtjg");
String[] mtjg =request.getParameterValues("mtjg");
String[] dkmtjg =request.getParameterValues("dkmtjg");
String[] zmmjg =request.getParameterValues("zmmjg");
String[] zdmjjl =request.getParameterValues("zdmjjl");
String[] yksmjjl =request.getParameterValues("yksmjjl");
String[] ysbljjl =request.getParameterValues("ysbljjl");
String[] tlmpmdj =request.getParameterValues("tlmpmdj");
String[] bz =request.getParameterValues("bz");

 
//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;

int i=0;

try {
	conn=cf.getConnection();    //得到连接


	System.out.println("开始导入木门报价，操作人："+yhmc);


	conn.setAutoCommit(false);


	for (i=0;i<mmxh.length ;i++ )
	{
		sql ="insert into jc_mmbjb (mmxh,ysbm,qhjgqjbm,ztmdj,dmsjg,dmtjg,mtjg,dkmtjg,zmmjg,zdmjjl,yksmjjl,ysbljjl,tlmpmdj,dqbm,bz,lrr,lrsj,lrbm)";
		sql+=" values('"+mmxh[i]+"','"+ysbm[i]+"','"+qhjgqjbm[i]+"',"+ztmdj[i]+","+dmsjg[i]+","+dmtjg[i]+","+mtjg[i]+","+dkmtjg[i]+","+zmmjg[i]+","+zdmjjl[i]+","+yksmjjl[i]+","+ysbljjl[i]+","+tlmpmdj[i]+",'"+dqbm+"','"+cf.GB2Uni(bz[i])+"','"+yhmc+"',SYSDATE,'"+lrbm+"')";
//		out.println(sql);
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();

	}
	
	conn.commit();

	System.out.println("导入木门报价完成，操作人："+yhmc);

	%>
	<SCRIPT language=javascript >
	<!--
		alert("[导入木门报价]成功！");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("<P>存盘失败,发生意外: " + e);
	out.print("<P>sql=" + sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
