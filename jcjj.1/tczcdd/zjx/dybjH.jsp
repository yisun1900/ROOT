<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String lx="";

try {
	conn=cf.getConnection();

	String bjjb=null;
	ls_sql="select bjjb";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjb=rs.getString("bjjb");
	}
	rs.close();
	ps.close();


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
    <td height="90"><span class="STYLE1">打印电子报价（退补货序号：<%=zjxxh%>）</span></td>
  </tr>

<%
	if (lx.equals("1"))//1：非套餐；2：套餐
	{
		%>
		  <tr  align="center">
			<td height="36">
			  <p>
			    <input type="button"  onClick="window.open('dzbj/zxbjmx/Bj_khbjmxHList.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>')"  value="打印工程报价"   /></p>
		    </td>
		  </tr>
		<%
	}
	else{
		%>
		  <tr align="center" >
			<td height="36"><input name="button3" type="button" onClick="window.open('dzbj/zxbjmx/Bj_khbjmxTcDyKhListH.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>')"  value="套餐－打印工程报价（客户）"   /></td>
		  </tr>
		  <tr align="center" >
			<td height="36"><input name="button32" type="button" onClick="window.open('dzbj/zxbjmx/Bj_khbjmxTcDySgdListH.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>')"  value="套餐－打印工程报价（工长）"   /></td>
		  </tr>
		  <tr align="center" >
			<td  height="36">
			<input type="button"  value="套餐－主材清单" onClick="window.open('dzbj/zxbjmx/Bj_khbjmxDyTcZcListH.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>')"  /></td>
		  </tr>
		  <tr align="center" >
			<td  height="36">
			<input type="button"  value="套餐－主材升级清单" onClick="window.open('dzbj/zxbjmx/Bj_khbjmxDyTcZcSjListH.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>')"  /></td>
		  </tr>
		  <tr align="center" >
			<td  height="36">
			<input type="button"  value="套餐－主材超量加价清单" onClick="window.open('dzbj/zxbjmx/Bj_khbjmxDyTcZcClListH.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>')"  /></td>
		  </tr>
		  <tr align="center" >
			<td  height="36">
			<input type="button"  value="套餐－需收费主材清单" onClick="window.open('dzbj/zxbjmx/Bj_khbjmxDyTcZcSfListH.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>')"  /></td>
		  </tr>
		  <tr align="center" >
			<td  height="36">
			<input type="button"  value="主材减免清单" onClick="window.open('dzbj/zxbjmx/Bj_khbjmxDyTcZcJmListH.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>')"  /></td>
		  </tr>
		  <tr align="center" >
			<td  height="36">
			<input type="button"  value="顶配主材清单" onClick="window.open('dzbj/zxbjmx/Bj_khbjmxDyTcBcjListH.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>')"  /></td>
		  </tr>
		  <tr align="center" >
			<td height="36">
			<input type="button"  value="套餐－工长主材（充值）" onClick="window.open('dzbj/zxbjmx/Bj_khbjmxDyGzClList_czH.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>')"  /></td>
		  </tr>
		  <tr align="center" >
			<td height="36">
			<input type="button"  value="家具套餐" onClick="window.open('dzbj/zxbjmx/Bj_zctcmcDyListH.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>')"  />
			<input type="button" onClick="window.open('dzbj/zxbjmx/Bj_khwntcmcDyListH.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>')"  value="二次装修打印"  /></td>
		  </tr>
		  <tr align="center" >
			<td height="36">
			<input type="button" onClick="window.open('dzbj/zxbjmx/BjDyListH.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>')"  value="套餐－总价"></td>
		  </tr>
		<%
	}
%>

</table>

</body>
</html>

