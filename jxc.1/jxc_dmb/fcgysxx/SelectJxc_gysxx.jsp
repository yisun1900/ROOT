<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_gysxxList.jsp" name="selectform">
<div align="center">供应商信息维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">所属地区</td>
  <td ><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where  dqbm='"+dqbm+"'","");
	}
%>
  </select></td>
  <td align="right">是否合作</td>
  <td ><input type="radio" name="sfhz" value="Y">
    合作
      <input type="radio" name="sfhz" value="N">
      不合作 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">供应商编码</td>
  <td ><input type="text" name="gysbm" size="20" maxlength="8" ></td>
   <td align="right">供应商名称</td>
  <td width="32%"><input type="text" name="gysmc" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">供应商类型</td>
  <td colspan="3"><input type="radio" name="gyslx" value="0">
    代销品供货商
      <input type="radio" name="gyslx" value="1">
      库存供货商
      <input type="radio" name="gyslx" value="2">
      共用供货商 </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应材料类型</td> 
  <td width="32%">
    <input type="radio" name="cllx" value="2" checked>辅材
  <td align="right" width="18%">供应商地址</td> 
  <td width="32%"><input type="text" name="gysdz" size="20" maxlength="100" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应商负责人</td> 
  <td width="32%"> 
    <input type="text" name="gysfzr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">供应商电话</td> 
  <td width="32%"> 
    <input type="text" name="gysdh" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应商传真</td> 
  <td width="32%"> 
    <input type="text" name="gyscz" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">E-Mail</td> 
  <td width="32%"> 
    <input type="text" name="email" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">财务代码</td>
  <td><input type="text" name="cwdm" size="20" maxlength="20" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">  </td>
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
	if(!(isNumber(FormName.gysbm, "供应商编码"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
