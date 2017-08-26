<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");

String dqbm = request.getParameter("dqbm");

String[] bjjbbm =request.getParameterValues("bjjbbm");
String[] kbcpbm =request.getParameterValues("kbcpbm");
String[] kbwlbm =request.getParameterValues("kbwlbm");
String[] cpdl =request.getParameterValues("cpdl");
String[] cpxl =request.getParameterValues("cpxl");
String[] cpmc =request.getParameterValues("cpmc");
String[] xh =request.getParameterValues("xh");
String[] gg =request.getParameterValues("gg");
String[] jldw =request.getParameterValues("jldw");
String[] xdjldw =request.getParameterValues("xdjldw");
String[] xdb =request.getParameterValues("xdb");
String[] jsj =request.getParameterValues("jsj");
String[] lsj =request.getParameterValues("lsj");
String[] sjj =request.getParameterValues("sjj");
String[] cllx =request.getParameterValues("cllx");
String[] sh =request.getParameterValues("sh");
String[] xuhao =request.getParameterValues("xuhao");
String[] ppmc =request.getParameterValues("ppmc");
String[] gysmc =request.getParameterValues("gysmc");
String[] sfxclxs =request.getParameterValues("sfxclxs");
String[] sfyx =request.getParameterValues("sfyx");
String[] yxkssj =request.getParameterValues("yxkssj");
String[] yxjzsj =request.getParameterValues("yxjzsj");
String[] cptz =request.getParameterValues("cptz");
String[] czlx =request.getParameterValues("czlx");
String[] cpks =request.getParameterValues("cpks");
String[] cplx =request.getParameterValues("cplx");
String[] sfkgdj =request.getParameterValues("sfkgdj");


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
	sql+=" from  tckb_zck";
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

		sql="insert into tckb_zck ( dqbm,bjjbbm,cpbm,kbcpbm,kbwlbm,yxthsj,cpdl,cpxl,cpmc,xh,gg    ";
		sql+=" ,jldw,xdjldw,xdb,jsj,lsj,sjj,cllx,sh,ppmc,gysmc,xuhao,sfxclxs   ,lrr,lrsj,sfyx,yxkssj,yxjzsj,cptz,czlx,cpks,cplx,sfkgdj ) ";
		sql+=" values('"+dqbm+"','"+bjjbbm[i]+"','"+cpbm+"','"+kbcpbm[i]+"','"+kbwlbm[i]+"','Y','"+cf.GB2Uni(cpdl[i])+"','"+cf.GB2Uni(cpxl[i])+"','"+cf.GB2Uni(cpmc[i])+"','"+cf.GB2Uni(xh[i])+"','"+cf.GB2Uni(gg[i])+"'";
		sql+=" ,'"+cf.GB2Uni(jldw[i])+"','"+cf.GB2Uni(xdjldw[i])+"','"+xdb[i]+"','"+jsj[i]+"','"+lsj[i]+"','"+sjj[i]+"','"+cllx[i]+"','"+sh[i]+"','"+cf.GB2Uni(ppmc[i])+"','"+cf.GB2Uni(gysmc[i])+"','"+xuhao[i]+"','"+sfxclxs[i]+"'";
		sql+=" ,'"+yhmc+"',SYSDATE,'"+sfyx[i]+"',TO_DATE('"+yxkssj[i]+"','YYYY-MM-DD'),TO_DATE('"+yxjzsj[i]+"','YYYY-MM-DD'),'"+cf.GB2Uni(cptz[i])+"','"+cf.GB2Uni(czlx[i])+"','"+cf.GB2Uni(cpks[i])+"','"+cf.GB2Uni(cplx[i])+"','"+sfkgdj[i]+"')";
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
