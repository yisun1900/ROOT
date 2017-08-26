<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");

String dqbm = request.getParameter("dqbm");

String[] tcmc =request.getParameterValues("tcmc");
String[] jgwzbm =request.getParameterValues("jgwzbm");
String[] cpmc =request.getParameterValues("cpmc");
String[] xh =request.getParameterValues("xh");
String[] gg =request.getParameterValues("gg");

String[] ppmc =request.getParameterValues("ppmc");
String[] gysmc =request.getParameterValues("gysmc");
String[] jldw =request.getParameterValues("jldw");
String[] ydj =request.getParameterValues("ydj");
String[] tcdj =request.getParameterValues("tcdj");
String[] sjzj =request.getParameterValues("sjzj");
String[] jsj =request.getParameterValues("jsj");
String[] bz =request.getParameterValues("bz");

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

	int count=0;
	sql="select NVL(max(SUBSTR(cpbm,3,11)),0)";
	sql+=" from  bj_cltczcmx";
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	for (int i=0;i<cpmc.length ;i++ )
	{
		count++;
		//生成材料编码
		String cpbm=null;
		cpbm="SC"+cf.addZero(count,11);

		sql="insert into bj_cltczcmx ( cpbm,cpmc                    ,dqbm         ,tcmc                    ,jgwzbm                    ,xh                    ,gg                    ,ppmc                    ,gysmc                    ,jldw                    ,ydj         ,tcdj         ,sjzj         ,jsj         ,lrr       ,lrsj   ,bz ) ";
		sql+=" values(              '"+cpbm+"','"+cf.GB2Uni(cpmc[i])+"','"+dqbm+"','"+cf.GB2Uni(tcmc[i])+"','"+cf.GB2Uni(jgwzbm[i])+"','"+cf.GB2Uni(xh[i])+"','"+cf.GB2Uni(gg[i])+"','"+cf.GB2Uni(ppmc[i])+"','"+cf.GB2Uni(gysmc[i])+"','"+cf.GB2Uni(jldw[i])+"','"+ydj[i]+"','"+tcdj[i]+"','"+sjzj[i]+"','"+jsj[i]+"','"+yhmc+"',SYSDATE,'"+cf.GB2Uni(bz[i])+"')";
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
