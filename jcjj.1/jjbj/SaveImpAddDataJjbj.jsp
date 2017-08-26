<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");


String[] xuhao =request.getParameterValues("xuhao");
String[] bcpp =request.getParameterValues("bcpp");
String[] bclx =request.getParameterValues("bclx");
String[] bchd =request.getParameterValues("bchd");
String[] dj =request.getParameterValues("dj");

  
//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;

int i=0;

try {
	conn=cf.getConnection();    //得到连接

	System.out.println("开始增加[家具板件]报价，操作人："+yhmc);


	conn.setAutoCommit(false);

	for (i=0;i<xuhao.length ;i++ )
	{
		sql ="insert into jc_jjbjbj (bcpp,bclx,dj,bchd)";
		sql+=" values('"+cf.GB2Uni(bcpp[i])+"','"+cf.GB2Uni(bclx[i])+"',"+dj[i]+","+cf.GB2Uni(bchd[i])+")";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();

		if (i%40==0)
		{
			System.out.println(xuhao[i]);
		}
	}
	
	conn.commit();

	System.out.println("增加[家具板件]报价完成，操作人："+yhmc);

	%>
	<SCRIPT language=javascript >
	<!--
		alert("[增加报价]成功！");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("<P>出错序号：" + xuhao[i]);
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
