<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String xmbm=cf.GB2Uni(request.getParameter("xmbm"));
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertGdm_gcxmcfbz.jsp" name="insertform" >
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">项目编码</td> 
  <td width="32%"> 
    <input type="text" name="xmbm" value="<%=xmbm%>" size="20" maxlength="5" readonly>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">违规级别</td>
  <td><select name="wgjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select wgjbbm,wgjbmc from gdm_wgjbbm order by wgjbbm","");
%>
  </select></td>
  <td align="right">整改要求</td>
  <td><select name="zgyq" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select zgyq c1,zgyq c2 from gdm_zgyq order by zgyq","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">处罚人员职务</td> 
  <td width="32%"> 
    <select name="xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select xzzwbm c1,xzzwbm c2 from gdm_cfry order by xzzwbm","");
%>
    </select>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">员工罚款金额</td>
  <td><input type="text" name="ygfkje" value="0" size="20" maxlength="17" ></td>
  <td align="right">员工扣分</td>
  <td><input type="text" name="ygkf" value="0" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">施工队罚款金额</td> 
  <td width="32%"><input type="text" name="sgdfkje" value="0" size="20" maxlength="17" ></td>
  <td align="right" width="18%">施工队扣分</td> 
  <td width="32%"><input type="text" name="sgdkf" value="0" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"></textarea>    </td>
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
	if(	javaTrim(FormName.xmbm)=="") {
		alert("请输入[项目编码]！");
		FormName.xmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.wgjbbm)=="") {
		alert("请选择[违规级别]！");
		FormName.wgjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xzzwbm)=="") {
		alert("请选择[处罚人员职务]！");
		FormName.xzzwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.sgdkf)=="") {
		alert("请输入[施工队扣分]！");
		FormName.sgdkf.focus();
		return false;
	}
	if(!(isNumber(FormName.sgdkf, "施工队扣分"))) {
		return false;
	}
	if(	javaTrim(FormName.sgdfkje)=="") {
		alert("请输入[施工队罚款金额]！");
		FormName.sgdfkje.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdfkje, "施工队罚款金额"))) {
		return false;
	}
	if(	javaTrim(FormName.ygkf)=="") {
		alert("请输入[员工扣分]！");
		FormName.ygkf.focus();
		return false;
	}
	if(!(isNumber(FormName.ygkf, "员工扣分"))) {
		return false;
	}
	if(	javaTrim(FormName.ygfkje)=="") {
		alert("请输入[员工罚款金额]！");
		FormName.ygfkje.focus();
		return false;
	}
	if(!(isFloat(FormName.ygfkje, "员工罚款金额"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
