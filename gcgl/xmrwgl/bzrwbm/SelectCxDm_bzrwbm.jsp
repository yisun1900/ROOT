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
<form method="post" action="Dm_bzrwbmCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right">任务分类</td>
    <td><select name="dm_bzrwbm_rwflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select rwflbm,rwflmc from dm_rwflbm order by rwflbm","");
%>
      </select>    </td>
    <td align="right">摘要任务</td>
    <td><select name="zyrwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select zyrwbm,zyrwmc from dm_zyrwbm order by zyrwbm","");
%>
    </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">任务编码</td> 
  <td width="32%"> 
    <input type="text" name="dm_bzrwbm_rwbm" size="20" maxlength="4" >  </td>
  <td align="right" width="18%">任务名称</td> 
  <td width="32%"> 
    <input type="text" name="dm_bzrwbm_rwmc" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">报警类别</td> 
  <td colspan="3"> 
    <INPUT type="radio" name="dm_bzrwbm_bjlb" value="1">事前报警
    <INPUT type="radio" name="dm_bzrwbm_bjlb" value="2">事后提醒
    <INPUT type="radio" name="dm_bzrwbm_bjlb" value="3">事前事后都提醒
    <INPUT type="radio" name="dm_bzrwbm_bjlb" value="9">一般记录  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">事前提醒天数 从</td>
  <td><input type="text" name="dm_bzrwbm_sqtxts" size="20" maxlength="8" ></td>
  <td align="right">到</td>
  <td><input type="text" name="dm_bzrwbm_sqtxts2" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">事后提醒天数 从 </td>
  <td><input type="text" name="dm_bzrwbm_shtxts" size="20" maxlength="8" ></td>
  <td align="right">到</td>
  <td><input type="text" name="dm_bzrwbm_shtxts2" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否影响后续工期</td> 
  <td width="32%"><input type="radio" name="dm_bzrwbm_sfyxhxgq" value="Y">
    是
      <input type="radio" name="dm_bzrwbm_sfyxhxgq" value="N">
      否 </td>
  <td align="right" width="18%">是否影响复尺</td> 
  <td width="32%"><input type="radio" name="dm_bzrwbm_sfyxfc" value="Y">
    是
      <input type="radio" name="dm_bzrwbm_sfyxfc" value="N">
      否 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否需验收</td> 
  <td width="32%"><input type="radio" name="dm_bzrwbm_sfxys" value="Y">
    是
      <input type="radio" name="dm_bzrwbm_sfxys" value="N">
      否 </td>
  <td align="right" width="18%">重点监控任务</td> 
  <td width="32%"><input type="radio" name="dm_bzrwbm_zdjkrw" value="1">
    重点监控
      <input type="radio" name="dm_bzrwbm_zdjkrw" value="2">
      非重点监控 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否为里程碑</td>
  <td><input type="radio" name="sfwlcb"  value="Y">
是
  <input type="radio" name="sfwlcb"  value="N">
否 </td>
  <td align="right">是否涉及产品信息</td>
  <td><input type="radio" name="sjcpxx"  value="Y">
是
  <input type="radio" name="sjcpxx"  value="N">
否 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">任务序号</td>
  <td><input name="rwxh" type="text" value="" size="20" maxlength="8" ></td>
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
	if(!(isNumber(FormName.dm_bzrwbm_sqtxts, "事前提醒天数"))) {
		return false;
	}
	if(!(isNumber(FormName.dm_bzrwbm_sqtxts2, "事前提醒天数"))) {
		return false;
	}
	if(!(isNumber(FormName.dm_bzrwbm_shtxts, "事后提醒天数"))) {
		return false;
	}
	if(!(isNumber(FormName.dm_bzrwbm_shtxts2, "事后提醒天数"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
