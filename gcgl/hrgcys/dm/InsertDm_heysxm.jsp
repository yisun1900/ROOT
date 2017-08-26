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

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertDm_heysxm.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>验收版本号</td> 
  <td width="32%"> 
    <select name="gcysbbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gcysbbh,gcysbbmc from dm_hegcysbb order by gcysbbh","");
%>
    </select>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>验收项目编码</td>
  <td><input type="text" name="gcysxmbm" value="" size="20" maxlength="4" ></td>
  <td align="right"><span class="STYLE1">*</span>验收顺序</td>
  <td><input name="yssx" type="text" id="yssx" value="" size="20" maxlength="4" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>验收项目名称</td> 
  <td colspan="3"> 
    <input type="text" name="gcysxmmc" value="" size="73" maxlength="100" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>验收项目分类</td> 
  <td width="32%"><select name="ysxmflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select ysxmflbm,ysxmflmc from dm_ysxmflbm where ysxmflbm='05'","05");
%>
  </select></td>
  <td align="right" width="18%">对应工程进度</td> 
  <td width="32%"><select name="dygcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否关联施工进度表</td> 
  <td width="32%"><input type="radio" name="sfsgjdb"  value="Y">
    是
      <input type="radio" name="sfsgjdb"  value="N">
      否 </td>
  <td align="right" width="18%">施工进度进度节点</td> 
  <td width="32%"><select name="jdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select rwbm,rwmc from gdm_rwbm  order by rwbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>是否回访</td> 
  <td width="32%"><input type="radio" name="sfhf"  value="Y">
    设置
      <input type="radio" name="sfhf"  value="N">
      否 </td>
  <td align="right" width="18%">回访类型</td> 
  <td width="32%"><select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm order by hflxbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">验收子项数量</td> 
  <td width="32%"> 
    <input type="text" name="yszxsl" value="" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">必验项数量</td> 
  <td width="32%"> 
    <input type="text" name="byxsl" value="" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">非必验项最小数量</td> 
  <td width="32%"> 
    <input type="text" name="fbyxzxsl" value="" size="20" maxlength="8" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>累计家装收款百分比</td> 
  <td width="32%"><input type="text" name="ljskbfb" value="" size="20" maxlength="9" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>项目类型</td>
  <td><%
	cf.radioToken(out, "xmlx","1+验收项&2+状态项","");
%></td>
  <td align="right"><span class="STYLE1">*</span>是否选择甲供</td>
  <td><%
	cf.radioToken(out, "sfxzjg","Y+选择&N+否","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>品管验收奖金</td>
  <td><input type="text" name="ysjj" size="20" maxlength="16"  value="" ></td>
  <td align="right"><span class="STYLE1">*</span>主管验收奖金</td>
  <td><input type="text" name="zgysjj" size="20" maxlength="16"  value="" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">验收标准说明</td>
  <td colspan="3"><textarea name="ysbzsm" cols="72" rows="9"></textarea></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"></textarea>    </td>
  </tr>
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
	if(	javaTrim(FormName.gcysbbh)=="") {
		alert("请选择[验收版本号]！");
		FormName.gcysbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gcysxmbm)=="") {
		alert("请输入[验收项目编码]！");
		FormName.gcysxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.yssx)=="") {
		alert("请输入[验收顺序]！");
		FormName.yssx.focus();
		return false;
	}
	if(!(isNumber(FormName.yssx, "yssx"))) {
		return false;
	}
	if(	javaTrim(FormName.gcysxmmc)=="") {
		alert("请输入[验收项目名称]！");
		FormName.gcysxmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ysxmflbm)=="") {
		alert("请选择[验收项目分类]！");
		FormName.ysxmflbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfhf)) {
		alert("请选择[是否回访]！");
		FormName.sfhf[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.xmlx)) {
		alert("请选择[项目类型]！");
		FormName.xmlx[0].focus();
		return false;
	}

	if(!(isNumber(FormName.yszxsl, "验收子项数量"))) {
		return false;
	}
	if(!(isNumber(FormName.byxsl, "必验项数量"))) {
		return false;
	}
	if(!(isNumber(FormName.fbyxzxsl, "非必验项最小数量"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfxzjg)) {
		alert("请选择[是否选择甲供]！");
		FormName.sfxzjg[0].focus();
		return false;
	}
	if(	javaTrim(FormName.ljskbfb)=="") {
		alert("请选择[累计家装收款百分比]！");
		FormName.ljskbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.ljskbfb, "累计家装收款百分比"))) {
		return false;
	}

	if(	javaTrim(FormName.ysjj)=="") {
		alert("请选择[品管验收奖金]！");
		FormName.ysjj.focus();
		return false;
	}
	if(!(isFloat(FormName.ysjj, "品管验收奖金"))) {
		return false;
	}
	if(	javaTrim(FormName.zgysjj)=="") {
		alert("请选择[主管验收奖金]！");
		FormName.zgysjj.focus();
		return false;
	}
	if(!(isFloat(FormName.zgysjj, "主管验收奖金"))) {
		return false;
	}

	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
