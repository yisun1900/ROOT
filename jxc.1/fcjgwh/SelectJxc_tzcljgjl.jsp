<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_tzcljgjlList.jsp" name="selectform">
<div align="center">预先调整价格－维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">材料编码</td> 
  <td width="32%"> 
    <input type="text" name="jxc_tzcljgjl_clbm" size="20" maxlength="13" >  </td>
  <td align="right" width="18%">地区</td> 
  <td width="32%"> 
    <select name="jxc_tzcljgjl_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
	}
%>
	</select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入时间 从</td> 
  <td width="32%"><input type="text" name="jxc_tzcljgjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="jxc_tzcljgjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td> 
  <td width="32%"> 
    <input type="text" name="jxc_tzcljgjl_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">录入部门</td> 
  <td width="32%"> 
    <select name="jxc_tzcljgjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">成本价</td> 
  <td width="32%"> 
    <input type="text" name="jxc_tzcljgjl_cbj" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">市场标价</td> 
  <td width="32%"> 
    <input type="text" name="jxc_tzcljgjl_lsj" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">销售价</td> 
  <td width="32%"> 
    <input type="text" name="jxc_tzcljgjl_xsj" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">对分公司价格</td> 
  <td width="32%"> 
    <input type="text" name="jxc_tzcljgjl_dfgsjg" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">对工长价格</td> 
  <td width="32%"> 
    <input type="text" name="jxc_tzcljgjl_dgzjg" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">新价格生效时间 从</td>
  <td><input type="text" name="jxc_tzcljgjl_sxsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="jxc_tzcljgjl_sxsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">修改状态</td>
  <td>
	<INPUT name="jxc_tzcljgjl_xgzt" type="radio" value="N" checked>
	未改</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">实际修改时间 从</td> 
  <td width="32%"><input type="text" name="jxc_tzcljgjl_xgsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="jxc_tzcljgjl_xgsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
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
	if(!(isDatetime(FormName.jxc_tzcljgjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_tzcljgjl_lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_tzcljgjl_cbj, "成本价"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_tzcljgjl_lsj, "市场标价"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_tzcljgjl_xsj, "销售价"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_tzcljgjl_dfgsjg, "对分公司价格"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_tzcljgjl_dgzjg, "对工长价格"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_tzcljgjl_sxsj, "生效时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_tzcljgjl_sxsj2, "生效时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_tzcljgjl_xgsj, "修改时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_tzcljgjl_xgsj2, "修改时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
