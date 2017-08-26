<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String scbshjl=cf.GB2Uni(request.getParameter("scbshjl"));
String scbshyj=cf.GB2Uni(request.getParameter("scbshyj"));

String scbshr=cf.GB2Uni(request.getParameter("scbshr"));
java.sql.Date scbshsj=null;
ls=request.getParameter("scbshsj");
try{
	if (!(ls.equals("")))  scbshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[scbshsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审核时间]类型转换发生意外:"+e);
	return;
}
String scbsbyybm=cf.GB2Uni(request.getParameter("scbsbyybm"));
String scbsbkhlx=cf.GB2Uni(request.getParameter("scbsbkhlx"));

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


	ls_sql="update crm_qysbdj set scbshjl=?,scbshr=?,scbshsj=?,scbshyj=?,scbsbyybm=?,scbsbkhlx=?,clzt='3'";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,scbshjl);
	ps.setString(2,scbshr);
	ps.setDate(3,scbshsj);
	ps.setString(4,scbshyj);
	ps.setString(5,scbsbyybm);
	ps.setString(6,scbsbkhlx);
	ps.executeUpdate();
	ps.close();

	if (scbshjl.equals("N"))//Y：通过；N：未通过
	{
		ls_sql="update crm_zxkhxx set zxzt='5',hfsbyybm=null,hfsbkhlx=null,hfsbyyxs=?,hfsbsj=?";//0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过；6：散客
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,scbshyj);
		ps.setDate(2,scbshsj);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql="update crm_zxkhxx set zxzt='4',hfsbyybm=?,hfsbkhlx=?,hfsbyyxs=?,hfsbsj=?";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,scbsbyybm);
		ps.setString(2,scbsbkhlx);
		ps.setString(3,scbshyj);
		ps.setDate(4,scbshsj);
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