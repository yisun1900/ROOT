<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");

String dqbm = request.getParameter("dqbm");

String[] bjjbbm =request.getParameterValues("bjjbbm");
String[] yxthsj =request.getParameterValues("yxthsj");
String[] kdbm =request.getParameterValues("kdbm");
String[] nbbm =request.getParameterValues("nbbm");
String[] tccpdlbm =request.getParameterValues("tccpdlbm");
String[] tccplbbm =request.getParameterValues("tccplbbm");
String[] cpmc =request.getParameterValues("cpmc");
String[] xh =request.getParameterValues("xh");
String[] gg =request.getParameterValues("gg");
String[] jldw =request.getParameterValues("jldw");
String[] xdjldw =request.getParameterValues("xdjldw");
String[] xdb =request.getParameterValues("xdb");
String[] jsj =request.getParameterValues("jsj");
String[] sh =request.getParameterValues("sh");
String[] xuhao =request.getParameterValues("xuhao");
String[] ppmc =request.getParameterValues("ppmc");
String[] gysmc =request.getParameterValues("gysmc");
String[] sfxclxs =request.getParameterValues("sfxclxs");
String[] sfyx =request.getParameterValues("sfyx");
String[] yxkssj =request.getParameterValues("yxkssj");
String[] yxjzsj =request.getParameterValues("yxjzsj");


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
	sql+=" from  tckd_tczcbj";
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

		String cpbm=null;
		cpbm="TC"+cf.addZero(count,11);

		sql="insert into tckd_tczcbj ( dqbm,bjjbbm,cpbm,kdbm,nbbm,yxthsj,tccpdlbm,tccplbbm,cpmc,xh,gg    ";
		sql+=" ,jldw,xdjldw,xdb,jsj,sh,ppmc,gysmc,xuhao,sfxclxs   ,lrr,lrsj,sfyx,yxkssj,yxjzsj ) ";
		sql+=" values('"+dqbm+"','"+bjjbbm[i]+"','"+cpbm+"','"+kdbm[i]+"','"+nbbm[i]+"','"+yxthsj[i]+"','"+tccpdlbm[i]+"','"+tccplbbm[i]+"','"+cf.GB2Uni(cpmc[i])+"','"+cf.GB2Uni(xh[i])+"','"+cf.GB2Uni(gg[i])+"'";
		sql+=" ,'"+cf.GB2Uni(jldw[i])+"','"+cf.GB2Uni(xdjldw[i])+"','"+xdb[i]+"','"+jsj[i]+"','"+sh[i]+"','"+cf.GB2Uni(ppmc[i])+"','"+cf.GB2Uni(gysmc[i])+"','"+xuhao[i]+"','"+sfxclxs[i]+"'";
		sql+=" ,'"+yhmc+"',SYSDATE,'"+sfyx[i]+"',TO_DATE('"+yxkssj[i]+"','YYYY-MM-DD'),TO_DATE('"+yxjzsj[i]+"','YYYY-MM-DD'))";
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
