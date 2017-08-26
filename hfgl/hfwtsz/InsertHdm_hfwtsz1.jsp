<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
-->
</style>
</head>
<%
 String hflxbm=cf.GB2Uni(request.getParameter("hflxbm"));
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertHdm_hfwtsz.jsp" name="insertform" target="_blank">
<div align="center">回访问题设置</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">回访类型</td> 
  <td width="32%"> 
    <select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hflxbm='"+hflxbm+"' order by hflxbm","");
%>
    </select>  </td>
  <td align="right" width="15%">&nbsp;</td> 
  <td width="35%">&nbsp;</td>
</tr>
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#E8E8FF" align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="6%">编号</td>
	<td  width="44%">问题名称</td>
	<td  width="6%">可多选</td>
	<td  width="6%">允许填写说明</td>
	<td  width="20%">填写说明提示</td>
	<td  width="6%">发布人</td>
	<td  width="12%">发布时间</td>
</tr>
<%

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
PreparedStatement ps3=null;
ResultSet rs3=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String wtbh=null;
	String wtmc=null;
	String sfkdx=null;
	String sftxsm=null;
	String txsmts=null;
	String fbr=null;
	String fbsj=null;

	ls_sql="SELECT wtbh,wtmc,DECODE(sfkdx,'1','多选','2','单选','3','写说明') sfkdx, DECODE(sftxsm,'Y','允许','N','不允许') sftxsm,txsmts,fbr,fbsj  ";
	ls_sql+=" FROM hdm_hfwt  ";
    ls_sql+=" where yxbz='Y'";
    ls_sql+=" order by wtbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		wtbh=cf.fillNull(rs.getString("wtbh"));
		wtmc=cf.fillNull(rs.getString("wtmc"));
		sfkdx=cf.fillNull(rs.getString("sfkdx"));
		sftxsm=cf.fillNull(rs.getString("sftxsm"));
		txsmts=cf.fillNull(rs.getString("txsmts"));
		fbr=cf.fillNull(rs.getString("fbr"));
		fbsj=cf.fillNull(rs.getDate("fbsj"));

		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from hdm_hfwtsz";
		ls_sql+=" where hflxbm='"+hflxbm+"' and wtbh='"+wtbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		String mark="";
		if (count>0)
		{
			mark="checked='true'";
		}


		%>
		<tr bgcolor="#FFFFFF" align="center">
		  <td>
			<input name="wtbh" type="checkbox" value="<%=wtbh%>" <%=mark%>>		  </td>
		  <td><%=wtbh%></td>
		  <td  align="left"><%=wtmc%></td>
		  <td><%=sfkdx%></td>
		  <td><%=sftxsm%></td>
		  <td align="left"><%=txsmts%></td>
		  <td><%=fbr%></td>
		  <td><%=fbsj%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2 != null) ps2.close(); 
		if (rs3 != null) rs3.close(); 
		if (ps3 != null) ps3.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
    </tr>
</table>


</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.hflxbm)=="") {
		alert("请选择[回访类型]！");
		FormName.hflxbm.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
