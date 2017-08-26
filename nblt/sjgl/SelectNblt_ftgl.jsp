<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Nblt_ftglList.jsp" name="selectform">
<div align="center">发帖维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">贴子编号</td> 
  <td width="32%"> 
    <input type="text" name="nblt_ftgl_tzbh" size="20" maxlength="11" >  </td>
  <td align="right" width="18%">发贴主题</td> 
  <td width="32%"><input type="text" name="nblt_ftgl_ftzt" size="20" maxlength="200" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">板块编号</td> 
  <td width="32%"> 
    <input type="text" name="nblt_ftgl_bkbh" size="20" maxlength="2" >  </td>
  <td align="right" width="18%">板块名称</td> 
  <td width="32%"><input type="text" name="nblt_bkgl_bkmc" size="20" maxlength="50" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">发帖时间从</td>
  <td><input type="text" name="nblt_ftgl_ftsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="nblt_ftgl_ftsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">最后修改时间从</td>
  <td><input type="text" name="nblt_ftgl_zhxgsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="nblt_ftgl_zhxgsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">点击次数从</td> 
  <td width="32%"><input type="text" name="nblt_ftgl_djcs" size="20" maxlength="8" ></td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="nblt_ftgl_djcs2" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">回复次数从</td>
  <td><input type="text" name="nblt_ftgl_hfcs" size="20" maxlength="8" ></td>
  <td align="right">到</td>
  <td><input type="text" name="nblt_ftgl_hfcs2" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否置顶</td> 
  <td width="32%">
	<INPUT type="radio" name="nblt_ftgl_sfzd" value="Y">置顶
	<INPUT type="radio" name="nblt_ftgl_sfzd" value="N">普通
  </td>
  <td align="right" width="18%">是否精华帖</td> 
  <td width="32%">
	<INPUT type="radio" name="nblt_ftgl_sfjht" value="Y">精华帖
	<INPUT type="radio" name="nblt_ftgl_sfjht" value="N">否
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否允许回复</td> 
  <td width="32%">
	<INPUT type="radio" name="nblt_ftgl_sfyxhf" value="Y">允许回复
	<INPUT type="radio" name="nblt_ftgl_sfyxhf" value="N">否
  </td>
  <td align="right" width="18%">发帖人</td> 
  <td width="32%"><input type="text" name="nblt_ftgl_ftr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">附件名称</td> 
  <td width="32%"> 
    <input type="text" name="nblt_ftgl_fjmc" size="20" maxlength="200" >  </td>
  <td align="right" width="18%">&nbsp;  </td>
  <td width="32%">&nbsp;  </td>
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

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.nblt_ftgl_ftsj, "发帖时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.nblt_ftgl_ftsj2, "发帖时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.nblt_ftgl_zhxgsj, "最后修改时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.nblt_ftgl_zhxgsj2, "最后修改时间"))) {
		return false;
	}
	if(!(isNumber(FormName.nblt_ftgl_djcs, "点击次数"))) {
		return false;
	}
	if(!(isNumber(FormName.nblt_ftgl_djcs2, "点击次数"))) {
		return false;
	}
	if(!(isNumber(FormName.nblt_ftgl_hfcs, "回复次数"))) {
		return false;
	}
	if(!(isNumber(FormName.nblt_ftgl_hfcs2, "回复次数"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
