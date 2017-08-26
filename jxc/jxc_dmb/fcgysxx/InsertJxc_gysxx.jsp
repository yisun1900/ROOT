<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<%
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJxc_gysxx.jsp" name="insertform" target="_blank">
<div align="center">辅材－供应商录入</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>供应商名称</td> 
  <td colspan="3"><input type="text" name="gysmc" value="" size="73" maxlength="50" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>是否合作</td> 
  <td><%
	cf.radioToken(out,"sfhz","Y+合作&N+不合作","");
%></td>
  <td align="right"><span class="STYLE1">*</span>供应材料类型</td>
  <td><%
	cf.radioToken(out,"cllx","2+辅材","2");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>所属地区</td>
  <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  <td align="right"><span class="STYLE1">*</span>供应商类型</td>
  <td><select name="gyslx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
	<option value="0">代销品供货商</option>
	<option value="1">库存供货商</option>
	<option value="2">共用供货商</option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应商负责人</td> 
  <td width="32%"><input type="text" name="gysfzr" value="" size="20" maxlength="20" ></td>
  <td align="right" width="18%">供应商电话</td> 
  <td width="32%"><input type="text" name="gysdh" value="" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应商地址</td> 
  <td colspan="3"><input type="text" name="gysdz" value="" size="73" maxlength="100" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">财务代码</td>
  <td><input type="text" name="cwdm" value="" size="20" maxlength="20" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应商传真</td> 
  <td width="32%"> 
    <input type="text" name="gyscz" value="" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">E-Mail</td> 
  <td width="32%"> 
    <input type="text" name="email" value="" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">备注</td>
  <td colspan="3"><textarea name="bz" cols="72" rows="2"></textarea>  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">
	<input type="button"  value="录入联系人" onClick="f_lr(editform)" name="lr" >
    <input type="button"  value="查看联系人" onClick="f_ck(editform)" name="ck" ></td>
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
	if(	javaTrim(FormName.gysmc)=="") {
		alert("请输入[供应商名称]！");
		FormName.gysmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfhz)) {
		alert("请选择[是否合作]！");
		FormName.sfhz[0].focus();
		return false;
	}
	if(	javaTrim(FormName.cllx)=="") {
		alert("请输入[供应材料类型]！");
		FormName.cllx.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请输入[所属地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gyslx)=="") {
		alert("请输入[供应商类型]！");
		FormName.gyslx.focus();
		return false;
	}

	FormName.submit();
	FormName.sq.disabled=false;
	return true;
}
//-->
</SCRIPT>
