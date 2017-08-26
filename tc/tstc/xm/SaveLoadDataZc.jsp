<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");

String dqbm = request.getParameter("dqbm");
String bjjbbm = request.getParameter("bjjbbm");

String[] tccpdlbm =request.getParameterValues("tccpdlbm");
String[] tccplbbm =request.getParameterValues("tccplbbm");
String[] tcsjflbm =request.getParameterValues("tcsjflbm");
String[] sfbxx =request.getParameterValues("sfbxx");
String[] sfyxsj =request.getParameterValues("sfyxsj");
String[] sfyqxtpp =request.getParameterValues("sfyqxtpp");
String[] jldw =request.getParameterValues("jldw");
String[] bzsl =request.getParameterValues("bzsl");
String[] sfxzsl =request.getParameterValues("sfxzsl");

String[] sfkjm =request.getParameterValues("sfkjm");
String[] yxjmzdsl =request.getParameterValues("yxjmzdsl");
String[] jmdj =request.getParameterValues("jmdj");
String[] sfkgh =request.getParameterValues("sfkgh");
String[] khzdsl =request.getParameterValues("khzdsl");
String[] ghzj =request.getParameterValues("ghzj");


//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
PreparedStatement ps1=null;
ResultSet rs1=null;
try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);


	for (int i=0;i<tccplbbm.length ;i++ )
	{
		sql="insert into tc_tczcxm ( dqbm,bjjbbm,tccpdlbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,sfyqxtpp,jldw,bzsl,sfxzsl,sfkjm,yxjmzdsl,jmdj,sfkgh,khzdsl,ghzj,lrr,lrsj ) ";
		sql+=" values('"+dqbm+"','"+bjjbbm+"','"+tccpdlbm[i]+"','"+tccplbbm[i]+"','"+tcsjflbm[i]+"','"+sfbxx[i]+"','"+sfyxsj[i]+"','"+sfyqxtpp[i]+"','"+cf.GB2Uni(jldw[i])+"','"+bzsl[i]+"','"+sfxzsl[i]+"','"+sfkjm[i]+"','"+yxjmzdsl[i]+"','"+jmdj[i]+"','"+sfkgh[i]+"','"+khzdsl[i]+"','"+ghzj[i]+"','"+yhmc+"',SYSDATE )";
		ps= conn.prepareStatement(sql);
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
	out.print("<BR>sql=" + sql);
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
