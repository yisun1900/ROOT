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
<form method="post" action="Cw_fllyjlList.jsp" name="selectform">
<div align="center">辅料领用－修改</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">记录号</td> 
  <td width="32%"> 
    <input type="text" name="cw_fllyjl_jlh" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">施工队</td> 
  <td width="32%"> 
    <select name="cw_fllyjl_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where cxbz='N' order by sgd","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">施工队</td> 
  <td width="32%"> 
    <input type="text" name="sq_sgd_sgdmc" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">数量</td> 
  <td width="32%"><input type="text" name="cw_fllyjl_sl" size="20" maxlength="17" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">金额</td> 
  <td width="32%"> 
    <input type="text" name="cw_fllyjl_je" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">办理人</td> 
  <td width="32%"> 
    <input type="text" name="cw_fllyjl_jkblr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">办理时间</td> 
  <td width="32%"> 
    <input type="text" name="cw_fllyjl_jkblsj" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">录入人</td> 
  <td width="32%"> 
    <input type="text" name="cw_fllyjl_lrr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入时间</td> 
  <td width="32%"> 
    <input type="text" name="cw_fllyjl_lrsj" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">录入部门</td> 
  <td width="32%"> 
    <select name="cw_fllyjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">结算标志</td> 
  <td width="32%"> 
    <INPUT name="cw_fllyjl_jsbz" type="radio" value="0" checked>
    未结算</td>
  <td align="right" width="18%">结算记录号</td> 
  <td width="32%"> 
    <input type="text" name="cw_fllyjl_jsjlh" size="20" maxlength="9" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">删除标志</td> 
  <td width="32%"> 
    <INPUT name="cw_fllyjl_scbz" type="radio" value="N" checked>
    未删除</td>
  <td align="right" width="18%">删除人</td> 
  <td width="32%"> 
    <input type="text" name="cw_fllyjl_scr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">删除时间</td> 
  <td width="32%"> 
    <input type="text" name="cw_fllyjl_scsj" size="20" maxlength="10" >  </td>
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isFloat(FormName.cw_fllyjl_sl, "数量"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_fllyjl_je, "金额"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_fllyjl_jkblsj, "办理时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_fllyjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_fllyjl_scsj, "删除时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
