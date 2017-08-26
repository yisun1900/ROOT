<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");

String dqbm = request.getParameter("dqbm");

String[] nbbm =request.getParameterValues("nbbm");
String[] tccpdlbm =request.getParameterValues("tccpdlbm");
String[] tccplbbm =request.getParameterValues("tccplbbm");
String[] bzmc =request.getParameterValues("bzmc");
String[] cpmc =request.getParameterValues("cpmc");
String[] xh =request.getParameterValues("xh");
String[] gg =request.getParameterValues("gg");
String[] ppmc =request.getParameterValues("ppmc");
String[] gysmc =request.getParameterValues("gysmc");
String[] jldw =request.getParameterValues("jldw");
String[] xdjldw =request.getParameterValues("xdjldw");
String[] xdb =request.getParameterValues("xdb");
String[] sh =request.getParameterValues("sh");
String[] sfxclxs =request.getParameterValues("sfxclxs");
String[] yjsj =request.getParameterValues("yjsj");
String[] ykhxsdj =request.getParameterValues("ykhxsdj");
String[] ysgddj =request.getParameterValues("ysgddj");
String[] jsj =request.getParameterValues("jsj");
String[] khxsdj =request.getParameterValues("khxsdj");
String[] sgddj =request.getParameterValues("sgddj");
String[] sfyx =request.getParameterValues("sfyx");
String[] yxkssj =request.getParameterValues("yxkssj");
String[] yxjzsj =request.getParameterValues("yxjzsj");
String[] bjjbbm =request.getParameterValues("bjjbbm");
String[] sjbjjbbm =request.getParameterValues("sjbjjbbm");
String[] ysjsfj =request.getParameterValues("ysjsfj");
String[] sjsfj =request.getParameterValues("sjsfj");
String[] bz =request.getParameterValues("bz");
String[] zp =request.getParameterValues("zp");


//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);

	int count=0;
	sql="select NVL(max(SUBSTR(cpbm,3,11)),0)";
	sql+=" from  tc_csrjzck";
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

		sql="insert into tc_csrjzck ( cpbm,dqbm,bjjbbm,nbbm,tccpdlbm,tccplbbm,bzmc,cpmc,xh,gg    ";
		sql+=" ,ppmc,gysmc,jldw,xdjldw,xdb,sh,sfxclxs,yjsj,ykhxsdj,ysgddj,jsj,khxsdj,sgddj,lrr,lrsj,lx,sfyx,yxkssj,yxjzsj,zp,bz ) ";
		sql+=" values('"+cpbm+"','"+dqbm+"','"+bjjbbm[i]+"','"+nbbm[i]+"','"+cf.GB2Uni(tccpdlbm[i])+"','"+cf.GB2Uni(tccplbbm[i])+"','"+cf.GB2Uni(bzmc[i])+"','"+cf.GB2Uni(cpmc[i])+"','"+cf.GB2Uni(xh[i])+"','"+cf.GB2Uni(gg[i])+"'";
		sql+=" ,'"+cf.GB2Uni(ppmc[i])+"','"+cf.GB2Uni(gysmc[i])+"','"+cf.GB2Uni(jldw[i])+"','"+cf.GB2Uni(xdjldw[i])+"','"+xdb[i]+"','"+sh[i]+"','"+sfxclxs[i]+"','"+yjsj[i]+"','"+ykhxsdj[i]+"','"+ysgddj[i]+"','"+jsj[i]+"','"+khxsdj[i]+"','"+sgddj[i]+"'";
		sql+=" ,'"+yhmc+"',SYSDATE,'1','"+sfyx[i]+"',TO_DATE('"+yxkssj[i]+"','YYYY-MM-DD'),TO_DATE('"+yxjzsj[i]+"','YYYY-MM-DD'),'"+cf.GB2Uni(zp[i])+"','"+cf.GB2Uni(bz[i])+"')";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();


		sql="delete from tc_csrjzcsjcjb  ";
		sql+=" where cpbm='"+cpbm+"'";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();

		if (!sjbjjbbm[i].equals(""))
		{
			sql="insert into tc_csrjzcsjcjb ( cpbm,bjjbbm,ysjsfj,sjsfj,sfdz) ";
			sql+=" values('"+cpbm+"','"+sjbjjbbm[i]+"','"+ysjsfj[i]+"','"+sjsfj[i]+"','1')";
			ps= conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();
		}

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
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
