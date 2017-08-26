<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");

String jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String sfkdybj="";
String bjjb=null;
String lx="";

String mark="";
try {
	conn=cf.getConnection();


	

	//检查：是否可打印报价＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	String bjdysq="";
	String ssfgs="";
	ls_sql="select bjjb,bjdysq,ssfgs";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjb=rs.getString("bjjb");
		bjdysq=cf.fillNull(rs.getString("bjdysq"));//0：未授权；1：可导出；2：可打印
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	String sfqyyssh="";
	ls_sql="select sfqyyssh";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfqyyssh=cf.fillNull(rs.getString("sfqyyssh"));
	}
	rs.close();
	ps.close();
	if (sfqyyssh.equals("Y"))//是否启用预算审核  Y：启用；N：不启用
	{
		String ysshbz="";
		ls_sql=" select ysshbz";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where  (khbh='"+khbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ysshbz=cf.fillNull(rs.getString("ysshbz"));
		}
		rs.close();
		ps.close();

//		if (!ysshbz.equals("Y"))//N：未申请；B：申请审核；C：受理申请；Y：审核通过；M：审核未通过
//		{
//			out.println("错误！未预算审核，不能打印报价");
//			return;
//		}
	}

	ls_sql="select sfkdybj";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfkdybj=cf.fillNull(rs.getString("sfkdybj"));//是否可打印报价  Y：需授权打印；N：不需授权打印；M：不能打印
	}
	rs.close();
	ps.close();

	if (sfkdybj.equals("M"))//M：不能打印
	{
		out.println("提醒！您无权打印报价");
		mark="disabled";
	}
	else if (sfkdybj.equals("Y"))//Y：需授权打印
	{
		if ( !bjdysq.equals("1") && !bjdysq.equals("2"))//0：未授权；1：可导出；2：可打印
		{
			out.println("提醒！您需授权才能打印报价，目前未授权");
			mark="disabled";
		}
	}
	//检查：是否可打印报价＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	//套餐
	ls_sql="select lx";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" where bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lx=rs.getString("lx");
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>ls_sql=" + ls_sql);
	return;
}
finally 
{
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

<html>
<head>
<title>电子报价打印</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	font-size: 18px;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="100%" border="0">
  <tr  align="center">
    <td height="90"><span class="STYLE1">打印结算单（结算记录号：<%=jsjlh%>）</span></td>
  </tr>


	
	
		  <tr align="center" >
			<td height="36">
			<input type="button"  value="打印结算单---带结算比例" onClick="window.open('/jcjj/zccl/js/dyjsd.jsp?jsjlh=<%=jsjlh%>')"  /></td>
		  </tr>
		  <tr align="center" >
			<td height="36">
			<input type="button"  value="打印结算单---不带结算比例" onClick="window.open('/jcjj/zccl/js/dyjsd2.jsp?jsjlh=<%=jsjlh%>')"  /> </td>
		  </tr>
		
	

</table>

</body>
</html>

