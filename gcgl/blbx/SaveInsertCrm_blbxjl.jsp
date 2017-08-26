<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String kbxbz=null;
String bxlbbm=null;
java.sql.Date bxkssj=null;
java.sql.Date bxjzsj=null;
String bxsm=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
kbxbz=cf.GB2Uni(request.getParameter("kbxbz"));
bxlbbm=cf.GB2Uni(request.getParameter("bxlbbm"));
ls=request.getParameter("bxkssj");
try{
	if (!(ls.equals("")))  bxkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[bxkssj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[保修开始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("bxjzsj");
try{
	if (!(ls.equals("")))  bxjzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[bxjzsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[保修截止时间]类型转换发生意外:"+e);
	return;
}
bxsm=cf.GB2Uni(request.getParameter("bxsm"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));

String[] xzbxxm=request.getParameterValues("xzbxxm");
String[] bxxm=request.getParameterValues("bxxm");
String[] qksm=request.getParameterValues("qksm");

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="insert into crm_blbxjl ( khbh,kbxbz,bxlbbm,bxkssj,bxjzsj,bxsm,lrr,lrsj,lrbm ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,kbxbz);
	ps.setString(3,bxlbbm);
	ps.setDate(4,bxkssj);
	ps.setDate(5,bxjzsj);
	ps.setString(6,bxsm);
	ps.setString(7,lrr);
	ps.setDate(8,lrsj);
	ps.setString(9,lrbm);
	ps.executeUpdate();
	ps.close();


	ls_sql="update crm_khxx set kbxbz=?,bxkssj=?,bxjzsj=?";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,kbxbz);
	ps.setDate(2,bxkssj);
	ps.setDate(3,bxjzsj);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_khbxxm";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (bxxm!=null)
	{
		ls_sql="insert into crm_khbxxm(khbh,bxxm,sfbx,qksm)";
		ls_sql+=" select '"+khbh+"',bxxm,'N',''";
		ls_sql+=" from crm_bxxmbm";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		if (!kbxbz.equals("N"))
		{
			for (int i=0;i<xzbxxm.length ;i++ )
			{
				ls_sql="update crm_khbxxm set sfbx='Y'";
				ls_sql+="  where khbh='"+khbh+"' and bxxm='"+cf.GB2Uni(xzbxxm[i])+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
		}

		for (int i=0;i<bxxm.length ;i++ )
		{
			ls_sql="update crm_khbxxm set qksm='"+cf.GB2Uni(qksm[i])+"'";
			ls_sql+="  where khbh='"+khbh+"' and bxxm='"+cf.GB2Uni(bxxm[i])+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}

		
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>