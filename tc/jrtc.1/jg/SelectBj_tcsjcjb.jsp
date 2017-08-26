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
<form method="post" action="Bj_tcsjcjbList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">报价版本号</td> 
  <td width="32%"> 
    <select name="bj_tcsjcjb_bjbbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjbbh c1,bjbbh c2 from bj_dzbjbb,dm_dqbm where bj_dzbjbb.dqbm=dm_dqbm.dqbm and bj_dzbjbb.sfzybb in('1','2','3') order by bj_dzbjbb.dqbm,bjbbh","");
%>
    </select>  </td>
  <td align="right" width="18%">地区</td> 
  <td width="32%"> 
    <select name="bj_tcsjcjb_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">原报价级别</td> 
  <td width="32%"> 
    <select name="bj_tcsjcjb_bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where lx='2' order by bjjbbm","");
%>
    </select>  </td>
  <td align="right" width="18%">升级报价级别</td> 
  <td width="32%"> 
    <select name="bj_tcsjcjb_bjjbbm1" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where lx='2' order by bjjbbm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">套餐升级分类</td> 
  <td width="32%"><select name="tcsjflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select tcsjflbm,tcsjflmc from bj_tcsjflbm order by tcsjflmc","");
%>
  </select></td>
  <td align="right" width="18%">计量单位</td> 
  <td width="32%"> 
    <select name="bj_tcsjcjb_jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">升级是否有促销</td>
  <td colspan="3"><%
	cf.radioToken(out, "sjsfycx","1+无促销&2+无数量限制促销&3+有数量限制促销","");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">促销开始时间 从</td>
  <td><input type="text" name="cxkssj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right">到</td>
  <td><input type="text" name="cxkssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">促销结束时间 从</td>
  <td><input type="text" name="cxjssj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right">到</td>
  <td><input type="text" name="cxjssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
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
	if(!(isDatetime(FormName.cxkssj, "促销开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cxkssj2, "促销开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cxjssj, "促销结束时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cxjssj2, "促销结束时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
