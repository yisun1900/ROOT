<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String sql=null;

String sfkdybj="";
String bjjb=null;
String lx="";

String mark="";
try {
	conn=cf.getConnection();

	//检查：是否可打印报价＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	String bjdysq="";
	sql="select bjjb,bjdysq";
	sql+=" from  crm_zxkhxx";
	sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjb=rs.getString("bjjb");
		bjdysq=cf.fillNull(rs.getString("bjdysq"));//0：未授权；1：可导出；2：可打印
	}
	rs.close();
	ps.close();

	sql="select sfkdybj";
	sql+=" from  sq_yhxx";
	sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfkdybj=cf.fillNull(rs.getString("sfkdybj"));//是否可打印报价  Y：需授权打印；N：不需授权打印；M：不能打印
	}
	rs.close();
	ps.close();

/*	if (sfkdybj.equals("M"))//M：不能打印
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
	}*/
	//检查：是否可打印报价＝＝＝＝＝＝＝＝＝＝＝＝＝结束


	//套餐
	sql="select lx";
	sql+=" from  bdm_bjjbbm";
	sql+=" where bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(sql);
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
	out.print("<BR>SQL=" + sql);
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
    <td height="90"><span class="STYLE1">打印电子报价（客户编号：<%=khbh%>）</span></td>
  </tr>

<%
	if (lx.equals("1"))//1：非套餐；2：套餐
	{
		%>
		  <tr  align="center">
			<td height="46">
			  <!--<p>
			    <input type="button" <%=mark%> onClick="window.open('/dzbj/zxbjmx/Bj_khbjmxDyList.jsp?khbh=<%=khbh%>')"  value="打印工程报价"   />
			  </p>-->
			  <p>
			    <input type="button" <%=mark%> onClick="window.open('/dzbj/zxbjmx/Crm_khbjdy4.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')"  value="预览电子报价"   />
			  </p>
		    <p>
			    <input type="button" onClick="window.open('/dzbj/zxbjmx/Bj_khbjmxDyLsBjList.jsp?khbh=<%=khbh%>')"  value="打印临时报价"   />
			  </p>
		    <p>
		      <input type="button" onClick="window.open('/dzbj/zxbjmx/ViewBj.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')"  value="预览工程报价"   />			    
            </p></td>
		  </tr>
		<%
	}
	else{
		%>
		  <tr align="center" >
			<td height="46"><input name="button3" type="button" onClick="window.open('/dzbj/zxbjmx/Bj_khbjmxTcDyKhList.jsp?khbh=<%=khbh%>')"  value="套餐－打印工程报价（客户）"   /></td>
		  </tr>
		  <tr align="center" >
			<td height="46"><input name="button32" type="button" onClick="window.open('/dzbj/zxbjmx/Bj_khbjmxTcDySgdList.jsp?khbh=<%=khbh%>')"  value="套餐－打印工程报价（工长）"   /></td>
		  </tr>
		  <tr align="center" >
			<td  height="46">
			<input type="button"  value="套餐－主材清单" onClick="window.open('/dzbj/zxbjmx/Bj_khbjmxDyTcZcList.jsp?khbh=<%=khbh%>')"  /></td>
		  </tr>
		  <tr align="center" >
			<td  height="46">
			<input type="button"  value="套餐－主材升级清单" onClick="window.open('/dzbj/zxbjmx/Bj_khbjmxDyTcZcSjList.jsp?khbh=<%=khbh%>')"  /></td>
		  </tr>
		  <tr align="center" >
			<td height="46">
			<input type="button"  value="套餐－工长主材" onClick="window.open('/dzbj/zxbjmx/Bj_khbjmxDyGzClList.jsp?khbh=<%=khbh%>')"  /></td>
		  </tr>
		  <tr align="center" >
			<td height="46">
			<input type="button"  value="套餐－工长主材（充值）" onClick="window.open('/dzbj/zxbjmx/Bj_khbjmxDyGzClList_cz.jsp?khbh=<%=khbh%>')"  /></td>
		  </tr>
		  <tr align="center" >
			<td height="46">
			<input name="button2" type="button" onClick="window.open('/dzbj/zxbjmx/BjDyList.jsp?khbh=<%=khbh%>')"  value="套餐－总价"></td>
		  </tr>
		<%
	}
%>

</table>

</body>
</html>

