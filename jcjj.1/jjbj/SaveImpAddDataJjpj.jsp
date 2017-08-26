<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");


String[] xuhao =request.getParameterValues("xuhao");
String[] jjpjflbm =request.getParameterValues("jjpjflbm");
String[] gtpjmc =request.getParameterValues("gtpjmc");
String[] xinghao =request.getParameterValues("xinghao");
String[] guige =request.getParameterValues("guige");
String[] jldwbm =request.getParameterValues("jldwbm");
String[] dj =request.getParameterValues("dj");
String[] bz =request.getParameterValues("bz");

  
//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;

int i=0;

try {
	conn=cf.getConnection();    //得到连接

	System.out.println("开始增加家具配件报价，操作人："+yhmc);


	String gtpjbh="";
	int count=0;
	sql="select NVL(max(TO_NUMBER(gtpjbh)),0)";
	sql+=" from  jc_jjpjbj";
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	for (i=0;i<xuhao.length ;i++ )
	{
		gtpjbh=cf.addZero(count+i+1,4);
		

		sql ="insert into jc_jjpjbj (gtpjbh,gtpjmc,jjpjflbm,jldwbm,xinghao,guige,dj,bz)";
		sql+=" values('"+gtpjbh+"','"+cf.GB2Uni(gtpjmc[i])+"','"+jjpjflbm[i]+"','"+jldwbm[i]+"','"+cf.GB2Uni(xinghao[i])+"','"+cf.GB2Uni(guige[i])+"','"+dj[i]+"','"+cf.GB2Uni(bz[i])+"')";
//		out.println(sql);
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();

		if (i%40==0)
		{
			System.out.println(xuhao[i]);
		}
	}
	
	conn.commit();

	System.out.println("增加家具配件报价完成，操作人："+yhmc);

	%>
	<SCRIPT language=javascript >
	<!--
		alert("[增加新的家具配件报价]成功！");
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
