<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");

String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
String dqbm = request.getParameter("dqbm");

String[] bjjbbm =request.getParameterValues("bjjbbm");
String[] hxbm =request.getParameterValues("hxbm");
String[] jgwzbm =request.getParameterValues("jgwzbm");
String[] tccplbbm =request.getParameterValues("tccplbbm");
String[] bzsl =request.getParameterValues("bzsl");
String[] sfxzsl =request.getParameterValues("sfxzsl");
String[] sfbxx =request.getParameterValues("sfbxx");
String[] sfyxsj =request.getParameterValues("sfyxsj");
String[] tcsjflbm =request.getParameterValues("tcsjflbm");
String[] sfyqxtpp =request.getParameterValues("sfyqxtpp");

String[] jldw =request.getParameterValues("jldw");
String[] sfkjm =request.getParameterValues("sfkjm");
String[] jmfl =request.getParameterValues("jmfl");
String[] jmjldw =request.getParameterValues("jmjldw");
String[] yxjmzdsl =request.getParameterValues("yxjmzdsl");
String[] jmdj =request.getParameterValues("jmdj");
String[] sfkgh =request.getParameterValues("sfkgh");
String[] khzdsl =request.getParameterValues("khzdsl");
String[] ghzj =request.getParameterValues("ghzj");

//////////////////////////////////////////////////////  

String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);


	for (int i=0;i<tccplbbm.length ;i++ )
	{
		ls_sql="insert into bj_tcbzzcxm (bjbbh,dqbm,bjjbbm,hxbm,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,jldw,sfxzsl   ,bzsl,sfkjm,jmfl,jmjldw,yxjmzdsl,jmdj,sfkgh,khzdsl,ghzj,sfyqxtpp,lrr,lrsj)  ";
		ls_sql+=" values('"+bjbbh+"','"+dqbm+"','"+bjjbbm[i]+"','"+hxbm[i]+"','"+cf.GB2Uni(jgwzbm[i])+"','"+tccplbbm[i]+"','"+tcsjflbm[i]+"','"+sfbxx[i]+"','"+sfyxsj[i]+"','"+cf.GB2Uni(jldw[i])+"','"+sfxzsl[i]+"'   ,'"+bzsl[i]+"','"+sfkjm[i]+"','"+cf.GB2Uni(jmfl[i])+"','"+cf.GB2Uni(jmjldw[i])+"','"+yxjmzdsl[i]+"','"+jmdj[i]+"','"+sfkgh[i]+"','"+khzdsl[i]+"','"+ghzj[i]+"','"+sfyqxtpp[i]+"','"+yhmc+"',SYSDATE)";
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
	out.print("<BR>sql=" + ls_sql);
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
