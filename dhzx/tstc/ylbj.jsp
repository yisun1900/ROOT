<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>预览电子报价</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	color: #0000FF;
	font-weight: bold;
}
.STYLE3 {color: #FF0000; font-weight: bold; }
-->
</style>
</head>
<body bgcolor="#FFFFFF">

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String khbh=request.getParameter("khbh");
String dqbm=request.getParameter("dqbm");
String ssfgs=cf.executeQuery("select ssfgs from crm_zxkhxx where khbh='"+khbh+"'");
String zxdm=cf.executeQuery("select zxdm from crm_zxkhxx where khbh='"+khbh+"'");
String sjs=cf.executeQuery("select sjs from crm_zxkhxx where khbh='"+khbh+"'");
String xqbm=cf.executeQuery("select xqbm from crm_zxkhxx where khbh='"+khbh+"'");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String mbmc="";
String bjjbmc="";
int row=0;

try {
	conn=cf.getConnection();

%>
<form method="post" action="" name="editform" >
	<div align="center"><strong>预览电子报价</strong></div>
	<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr align="center" bgcolor="#FFFFCC"> 
      <td width="16%"><strong>报价名称</strong></td>
      <td width="11%"><strong>报价级别</strong></td>
      <td width="7%"><span class="STYLE3">折扣</span></td>
      <td width="11%"><strong>折前工程总价</strong></td>
      <td width="13%"><span class="STYLE1">折后工程总价</span></td>
      <td width="8%"><strong>折前其它收费</strong></td>
      <td width="11%"><strong>折前总价</strong></td>
      <td width="13%"><span class="STYLE1">折后总价</span></td>
      <td width="10%"><strong>预览报价</strong></td>
    </tr>
<%
	double zqgcze=0;
	double zqqtze=0;
	double zqhtze=0;
	ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.zqdj)";
	ls_sql+=" FROM bj_bjxmmx,bj_gclmx";
	ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
	ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		zqgcze=rs1.getDouble(1);
	}
	rs1.close();
	ps1.close();

	//其它收费项目明细
	ls_sql="SELECT sum(sfje)";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		zqqtze=rs1.getDouble(1);
	}
	rs1.close();
	ps1.close();

	zqhtze=zqgcze+zqqtze;
	zqhtze=cf.round(zqhtze,2);
	
	
	%>
	<tr bgcolor="#FFFFFF" align="center"> 
	  <td>当前报价</td>
	  <td><%=bjjbmc%></td>
	  <td>
		<input type="text" name="zkl" size="4" value="10" onChange="f_js(editform,<%=(row)%>)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
	  </td>
	  <td>
		<input type="text" name="zqgcze" size="9" value="<%=zqgcze%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid" >
	  </td>
	  <td>
		<input type="text" name="zhgcze" size="9" value="<%=zqgcze%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
	  </td>
	  <td>
		<input type="text" name="zqqtze" size="9" value="<%=zqqtze%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid" >
	  </td>
	  <td>
		<input type="text" name="zqhtze" size="9" value="<%=zqhtze%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid" >
	  </td>
	  <td>
		<input type="text" name="zhhtze" size="9" value="<%=zqhtze%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
	  </td>
	  <td><A HREF="/dhzx/viewlsbj/Crm_khbjdy7.jsp?khbh=<%=khbh%>" target="_blank">预览报价</A></td>
	</tr>
<% 
	row++;

	ls_sql="SELECT mbmc,bjjbmc";
	ls_sql+=" FROM bj_mbbjmc,bdm_bjjbbm";
	ls_sql+=" where bj_mbbjmc.bjjb=bdm_bjjbbm.bjjbbm and khbh='"+khbh+"'";
	ls_sql+=" order by mbmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		mbmc=cf.fillNull(rs.getString("mbmc"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));

		zqgcze=0;
		zqqtze=0;
		zqhtze=0;
		ls_sql="SELECT sum(bj_mbgclmx.sl*bj_mbbjxmmx.zqdj)";
		ls_sql+=" FROM bj_mbbjxmmx,bj_mbgclmx";
		ls_sql+=" where bj_mbbjxmmx.khbh='"+khbh+"'";
		ls_sql+=" and bj_mbbjxmmx.mbmc='"+mbmc+"'";
		ls_sql+=" and bj_mbgclmx.mbmc='"+mbmc+"' ";
		ls_sql+=" and bj_mbbjxmmx.khbh=bj_mbgclmx.khbh and bj_mbbjxmmx.dqbm=bj_mbgclmx.dqbm and bj_mbbjxmmx.xmbh=bj_mbgclmx.xmbh";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zqgcze=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		//其它收费项目明细
		ls_sql="SELECT sum(sfje)";
		ls_sql+=" FROM bj_mbsfxmmx";
		ls_sql+=" where bj_mbsfxmmx.khbh='"+khbh+"' and bj_mbsfxmmx.mbmc='"+mbmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zqqtze=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		zqhtze=zqgcze+zqqtze;
		zqhtze=cf.round(zqhtze,2);
		
		
		%>
		<tr bgcolor="#FFFFFF" align="center"> 
		  <td><%=mbmc%></td>
		  <td><%=bjjbmc%></td>
		  <td>
			<input type="text" name="zkl" size="4" value="10" onChange="f_js(editform,<%=(row)%>)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
		  </td>
		  <td>
			<input type="text" name="zqgcze" size="9" value="<%=zqgcze%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid" >
		  </td>
		  <td>
			<input type="text" name="zhgcze" size="9" value="<%=zqgcze%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
		  </td>
		  <td>
			<input type="text" name="zqqtze" size="9" value="<%=zqqtze%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid" >
		  </td>
		  <td>
			<input type="text" name="zqhtze" size="9" value="<%=zqhtze%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid" >
		  </td>
		  <td>
			<input type="text" name="zhhtze" size="9" value="<%=zqhtze%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
		  </td>
		  <td><A HREF="/dhzx/viewlsbj/ViewBj_lsbj.jsp?khbh=<%=khbh%>&mbmc=<%=mbmc%>" target="_blank">预览报价</A></td>
		</tr>
		<%

		row++;
	}
	rs.close();
	ps.close();
%>
  </table>
</form>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

function f_js(FormName,row)
{
	//折后工程总价
	var zhgcze=FormName.zqgcze[row].value*FormName.zkl[row].value/10.0;
	zhgcze=round(zhgcze,2);
	FormName.zhgcze[row].value=zhgcze;

	var zhhtze=FormName.zhgcze[row].value*1+FormName.zqqtze[row].value*1;
	zhhtze=round(zhhtze,2);
	FormName.zhhtze[row].value=zhhtze;
} 


//-->
</script>

