<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">模版编码</td> 
  <td width="32%"> 
    <select name="mbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select mbbm,mbmc from gdm_sgjdmb order by mbbm","");
%>
    </select>
  </td>
  <td align="right" width="18%">模版名称</td> 
  <td width="32%"> 
    <input type="text" name="mbmc" size="20" maxlength="100" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">任务编码</td> 
  <td width="32%"> 
    <select name="rwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select rwbm,rwmc from gdm_rwbm order by rwbm","");
%>
    </select>
  </td>
  <td align="right" width="18%">任务名称</td> 
  <td width="32%"> 
    <input type="text" name="rwmc" size="20" maxlength="100" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">任务发生时间</td> 
  <td width="32%"> 
    <input type="text" name="rwsfsj" size="20" maxlength="8" >
  </td>
  <td align="right" width="18%">任务序号</td> 
  <td width="32%"> 
    <input type="text" name="rwxh" size="20" maxlength="8" >
  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">

  <input type="button" onClick="loadData(selectform)"  value="导入模版时间节点">
  <input type="button" onClick="exp(selectform)"  value="导出模版">
	<P> 
	<A HREF="模版时间节点.xls"><B>下载模板</B></A>
  </td>
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
	if(!(isNumber(FormName.rwsfsj, "任务发生时间"))) {
		return false;
	}
	if(!(isNumber(FormName.rwxh, "任务序号"))) {
		return false;
	}

	FormName.action="Gdm_mbsjjdList.jsp";
	FormName.submit();
	return true;
}


function loadData(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.mbbm)=="") {
		alert("请选择[模版编码]！");
		FormName.mbbm.focus();
		return false;
	}

	FormName.action="LoadData.jsp";
	FormName.submit();
	return true;
}


function exp(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.mbbm)=="") {
		alert("请选择[模版编码]！");
		FormName.mbbm.focus();
		return false;
	}

	FormName.action="Gdm_mbsjjdExpList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
