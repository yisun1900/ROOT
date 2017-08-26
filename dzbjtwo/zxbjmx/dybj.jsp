
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
String ysshbz="";
try {
	conn=cf.getConnection();

	//检查：是否可打印报价＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	String bjdysq="";
	sql="select bjjb,bjdysq,ysshbz";
	sql+=" from  crm_zxkhxx";
	sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjb=rs.getString("bjjb");
		bjdysq=cf.fillNull(rs.getString("bjdysq"));//0：未授权；1：可导出；2：可打印
		ysshbz=cf.fillNull(rs.getString("ysshbz"));//N：未申请；B：申请审核；C：受理申请；Y：审核通过；M：审核未通过；S：修改方案授权
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

	if (!ysshbz.equals("Y") && !ysshbz.equals("S"))
	{
		out.println("预算未审核！您无权打印报价:"+ysshbz);
		mark="disabled";
	}
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

  <tr  align="center">
	<td height="46">
	  <p>
		<input type="button" <%=mark%> onClick="window.open('/dzbj/zxbjmx/Crm_khbjdy4.jsp?khbh=<%=khbh%>')"  value="打印4项电子报价"   />
	  </p>
	  <p>
		<input type="button" <%=mark%> onClick="window.open('/dzbj/zxbjmx/Crm_khbjdy6.jsp?khbh=<%=khbh%>')"  value="打印6项电子报价"   />
	  </p>
	  <p>
		<input type="button" <%=mark%> onClick="window.open('/dzbj/zxbjmx/Crm_khbjdy7.jsp?khbh=<%=khbh%>')"  value="打印7项电子报价"   />
	  </p>
	  <p>
		<input type="button" <%=mark%> onClick="window.open('/dzbj/zxbjmx/Crm_khbjdy1.jsp?khbh=<%=khbh%>')"  value="打印1项电子报价"   />
	  </p>
	<p>
		<input type="button" onClick="window.open('/dzbj/zxbjmx/Bj_khbjmxDyLsBjList.jsp?khbh=<%=khbh%>')"  value="打印临时报价"   />
	  </p>
	</td>
  </tr>

</table>

</body>
</html>


