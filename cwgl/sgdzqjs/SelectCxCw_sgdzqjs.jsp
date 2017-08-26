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
<form method="post" action="Cw_sgdzqjsCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">结算记录号</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdzqjs_jsjlh" size="20" maxlength="9" >  </td>
  <td align="right" width="18%">客户编号</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdzqjs_khbh" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">施工队</td> 
  <td width="32%"> 
    <select name="cw_sgdzqjs_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where cxbz='N' order by sgd","");
%>
    </select>  </td>
  <td align="right" width="18%">施工队</td> 
  <td width="32%"> 
    <input type="text" name="sq_sgd_sgdmc" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">现场负责人</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdzqjs_sgbz" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">类型</td>
  <td><select name="cw_sgdzqjs_lx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select gdjsjd,gdjsjdmc from dm_gdjsjd order by gdjsjd","");
%>
  </select></td>
  <td align="right">结算基数</td>
  <td><select name="cw_sgdzqjs_jsjs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectToken(out,"1+工程费&2+工程基础报价&3+施工成本价&4+成本价","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">结算日期 从</td>
  <td><input type="text" name="cw_sgdzqjs_jsrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到 </td>
  <td><input type="text" name="cw_sgdzqjs_jsrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">结算比例</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdzqjs_jsbl" size="20" maxlength="9" >  </td>
  <td align="right" width="18%">结算金额</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdzqjs_jsje" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">材料费</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdzqjs_clf" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">工地用品</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdzqjs_gdyp" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">实际拨款</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdzqjs_sjbk" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入时间 从</td> 
  <td width="32%"><input type="text" name="cw_sgdzqjs_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="cw_sgdzqjs_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入人</td>
  <td><input type="text" name="cw_sgdzqjs_lrr" size="20" maxlength="20" ></td>
  <td align="right">录入部门</td>
  <td><select name="cw_sgdzqjs_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
%>
  </select></td>
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
	if(!(isDatetime(FormName.cw_sgdzqjs_jsrq, "结算日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sgdzqjs_jsrq2, "结算日期"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdzqjs_jsbl, "结算比例"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdzqjs_jsje, "结算金额"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdzqjs_clf, "材料费"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdzqjs_gdyp, "工地用品"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdzqjs_sjbk, "实际拨款"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sgdzqjs_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sgdzqjs_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
