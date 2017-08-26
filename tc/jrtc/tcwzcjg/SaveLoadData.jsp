<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");

String ppmc = request.getParameter("ppmc");
String dqbm = request.getParameter("dqbm");

String[] gysmc =request.getParameterValues("gysmc");
String[] tccpdlbm =request.getParameterValues("tccpdlbm");
String[] tccplbbm =request.getParameterValues("tccplbbm");
String[] cpmc =request.getParameterValues("cpmc");
String[] xh =request.getParameterValues("xh");
String[] gg =request.getParameterValues("gg");
String[] jldw =request.getParameterValues("jldw");
String[] xdjldw =request.getParameterValues("xdjldw");
String[] xdb =request.getParameterValues("xdb");
String[] dj =request.getParameterValues("dj");
String[] sfkgdj =request.getParameterValues("sfkgdj");
String[] jsfs =request.getParameterValues("jsfs");
String[] jsj =request.getParameterValues("jsj");
String[] jsbl =request.getParameterValues("jsbl");
String[] jjfs =request.getParameterValues("jjfs");
String[] sh =request.getParameterValues("sh");
String[] sfxclxs =request.getParameterValues("sfxclxs");
String[] sfycx =request.getParameterValues("sfycx");
String[] cxkssj =request.getParameterValues("cxkssj");
String[] cxjssj =request.getParameterValues("cxjssj");
String[] cxj =request.getParameterValues("cxj");
String[] sfyx =request.getParameterValues("sfyx");
String[] yxkssj =request.getParameterValues("yxkssj");
String[] yxjzsj =request.getParameterValues("yxjzsj");
String[] cxjsj =request.getParameterValues("cxjsj");
String[] cxjsbl =request.getParameterValues("cxjsbl");


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
	sql="select NVL(max(SUBSTR(cpbm,4,10)),0)";
	sql+=" from  bj_tcwzck";
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
		cpbm="TCW"+cf.addZero(count,10);

		sql="insert into bj_tcwzck ( dqbm,cpbm,tccpdlbm,tccplbbm,cpmc,xh,gg    ";
		sql+=" ,jldw,xdjldw,xdb,dj,sfkgdj,jsfs,jsj,jsbl,jjfs,sh,ppmc,gysmc,sfxclxs   ,lrr,lrsj,sfyx,yxkssj,yxjzsj,sfycx,cxkssj,cxjssj,cxj,cxjsj,cxjsbl ) ";
		sql+=" values('"+dqbm+"','"+cpbm+"','"+tccpdlbm[i]+"','"+tccplbbm[i]+"','"+cf.GB2Uni(cpmc[i])+"','"+cf.GB2Uni(xh[i])+"','"+cf.GB2Uni(gg[i])+"'";
		sql+=" ,'"+cf.GB2Uni(jldw[i])+"','"+cf.GB2Uni(xdjldw[i])+"','"+xdb[i]+"','"+dj[i]+"','"+sfkgdj[i]+"','"+jsfs[i]+"','"+jsj[i]+"','"+jsbl[i]+"','"+jjfs[i]+"','"+sh[i]+"','"+cf.GB2Uni(ppmc)+"','"+cf.GB2Uni(gysmc[i])+"','"+sfxclxs[i]+"'";
		sql+=" ,'"+yhmc+"',SYSDATE,'"+sfyx[i]+"',TO_DATE('"+yxkssj[i]+"','YYYY-MM-DD'),TO_DATE('"+yxjzsj[i]+"','YYYY-MM-DD'),'"+sfycx[i]+"',TO_DATE('"+cxkssj[i]+"','YYYY-MM-DD'),TO_DATE('"+cxjssj[i]+"','YYYY-MM-DD'),'"+cxj[i]+"','"+cxjsj[i]+"','"+cxjsbl[i]+"')";
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
