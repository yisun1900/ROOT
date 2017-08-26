<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String kbxbz=null;
String bybxsm=null;
java.sql.Date bxkssj=null;
java.sql.Date bxjzsj=null;

khbh=cf.GB2Uni(request.getParameter("khbh"));
kbxbz=cf.GB2Uni(request.getParameter("kbxbz"));
bybxsm=cf.GB2Uni(request.getParameter("bybxsm"));
ls=request.getParameter("bxkssj");
try{
	if (!(ls.equals("")))  bxkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bxkssj不存在");
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
	out.println("<BR>变量bxjzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[保修截止时间]类型转换发生意外:"+e);
	return;
}

String[] xzbxxm=request.getParameterValues("xzbxxm");
String[] bxxm=request.getParameterValues("bxxm");
String[] qksm=request.getParameterValues("qksm");

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="update crm_khxx set kbxbz=?,bybxsm=?,bxkssj=?,bxjzsj=?";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,kbxbz);
	ps.setString(2,bybxsm);
	ps.setDate(3,bxkssj);
	ps.setDate(4,bxjzsj);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_khbxxm";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

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
	out.print("存盘失败,发生意外: " + e);
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