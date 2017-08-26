<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String zgshjl=cf.GB2Uni(request.getParameter("zgshjl"));
String zgshyj=cf.GB2Uni(request.getParameter("zgshyj"));

String zgshr=cf.GB2Uni(request.getParameter("zgshr"));
java.sql.Date zgshsj=null;
ls=request.getParameter("zgshsj");
try{
	if (!(ls.equals("")))  zgshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zgshsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审核时间]类型转换发生意外:"+e);
	return;
}
String jdzgsbyybm=cf.GB2Uni(request.getParameter("jdzgsbyybm"));
String jdzgsbkhlx=cf.GB2Uni(request.getParameter("jdzgsbkhlx"));

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String clzt="";
	ls_sql="select clzt";
	ls_sql+=" from  crm_qysbdj";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	if (!clzt.equals("2"))//1：设计师提交、2：设计部审核、3：市场部审核、4：接待主管审核、5：回访
	{
		out.println("错误！状态不正确");
		return;
	}


	conn.setAutoCommit(false);

	ls_sql="update crm_qysbdj set zgshjl=?,zgshr=?,zgshsj=?,zgshyj=?,jdzgsbyybm=?,jdzgsbkhlx=?,clzt='4'";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zgshjl);
	ps.setString(2,zgshr);
	ps.setDate(3,zgshsj);
	ps.setString(4,zgshyj);
	ps.setString(5,jdzgsbyybm);
	ps.setString(6,jdzgsbkhlx);
	ps.executeUpdate();
	ps.close();

	if (zgshjl.equals("N"))//Y：通过；N：未通过
	{
		ls_sql="update crm_zxkhxx set zxzt='5',hfsbyybm=?,hfsbkhlx=?,hfsbyyxs=?,hfsbsj=?";//0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过；6：散客
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,jdzgsbyybm);
		ps.setString(2,jdzgsbkhlx);
		ps.setString(3,zgshyj);
		ps.setDate(4,zgshsj);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql="update crm_zxkhxx set zxzt='4',hfsbyybm=?,hfsbkhlx=?,hfsbyyxs=?,hfsbsj=?";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,jdzgsbyybm);
		ps.setString(2,jdzgsbkhlx);
		ps.setString(3,zgshyj);
		ps.setDate(4,zgshsj);
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
	out.print("Exception: " + e);
	out.print("Exception: " + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>