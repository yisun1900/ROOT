<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
<div align="center">型材门报价－维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">型材门编码（6位）</td> 
  <td width="32%"> 
    <input type="text" name="xcmbm" size="20" maxlength="6" >  </td>
  <td align="right" width="15%">型材门类型</td> 
  <td width="35%"> 
    <select name="xcmlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select xcmlxbm,xcmlxmc from jdm_xcmlxbm order by xcmlxbm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><strong>推拉门</strong>：边框型号<BR>
	  <strong>吸塑</strong>：刀型<BR>
	  <strong>包覆</strong>：刀型<BR>
	  <strong>板材铝门</strong>：门型</td> 
  <td colspan="3"> 
    <input type="text" name="bklxxh" size="70" maxlength="50" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><strong>推拉门</strong>：材料<br>
    <strong>吸塑</strong>：花色<br>
    <strong>包覆</strong>：花色<br>
    <strong>板材铝门</strong>：材料</td>
  <td colspan="3"><input type="text" name="mbcl" size="70" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">芯板配置</td> 
  <td colspan="3"> 
    <input type="text" name="xbpz" size="70" maxlength="50" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">装饰线条</td>
  <td colspan="3"><input type="text" name="zsxt" size="70" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">计价方式</td> 
  <td colspan="3"> 
<%
	cf.radioToken(out, "jjfs","1+平米单价&2+平米单价＋封边延米单价","");
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">平米单价</td> 
  <td width="32%"><input type="text" name="pmdj" size="20" maxlength="17" ></td>
  <td align="right" width="15%">延米单价</td> 
  <td width="35%"><input type="text" name="ymdj" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入人</td>
  <td><input type="text" name="lrr" size="20" maxlength="20" ></td>
  <td align="right">照片名称</td>
  <td><input type="text" name="zpmc" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入时间 从</td> 
  <td width="32%"><input type="text" name="lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="15%">到</td> 
  <td width="35%"><input type="text" name="lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">
    <input name="button" type="button" onClick="f_dc(selectform)"  value="导出报价">  
	</td>
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
	if(!(isFloat(FormName.pmdj, "平米单价"))) {
		return false;
	}
	if(!(isFloat(FormName.ymdj, "延米单价"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}

	FormName.target="";
	FormName.action="Jc_bgmbjList.jsp";
	FormName.submit();
	return true;
}

function f_dc(FormName)//参数FormName:Form的名称
{
	if(!(isFloat(FormName.pmdj, "平米单价"))) {
		return false;
	}
	if(!(isFloat(FormName.ymdj, "延米单价"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}

	FormName.target="_blank";
	FormName.action="Jc_bgmbjDcList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
