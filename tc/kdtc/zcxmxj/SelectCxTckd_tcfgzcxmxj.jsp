<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="Tckd_tcfgzcxmxjCxList.jsp" name="selectform">
<div align="center">套餐风格主材项目小计－查询</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td align="right">地区</td>
  <td><select name="tckd_tcfgzcxmxj_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  </select></td>
  <td align="right">报价级别</td>
  <td><select name="tckd_tcfgzcxmxj_bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where lx='2' and  bjjbbm in(select sq_sjsbjjb.bjjbbm from sq_sjsbjjb,sq_yhxx where sq_sjsbjjb.ygbh=sq_yhxx.ygbh and sq_yhxx.yhdlm='"+yhdlm+"') order by bjjbbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">风格名称</td>
  <td><select name="fgmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
		out.println("<option value=\"\"></option>");

		if (yhjs.equals("A0"))
		{
			cf.selectItem(out,"select distinct tcmc c1,tcmc c2,dqbm from tckd_tcjgb order by dqbm,tcmc","");
		}
		else{
			cf.selectItem(out,"select distinct tcmc c1,tcmc c2 from tckd_tcjgb where dqbm='"+dqbm+"' order by tcmc","");
		}
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="16%">户型</td> 
  <td width="34%"><select name="tckd_tcfgzcxmxj_hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%>
  </select></td>
  <td align="right" width="18%">结构位置</td> 
  <td width="32%"><select name="tckd_tcfgzcxmxj_jgwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jgwzmc c1,jgwzmc cc from bdm_jgwzbm order by jgwzmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="16%">产品类别</td> 
  <td width="34%"><select name="tckd_tcfgzcxmxj_tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm order by clxlmc","");
%>
  </select></td>
  <td align="right" width="18%">是否必选项</td> 
  <td width="32%"><input type="radio" name="sfbxx"  value="Y">
是
  <input type="radio" name="sfbxx"  value="N">
否 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">升级是否收费</td>
  <td><input type="radio" name="sfyxsj"  value="Y">
    是
    <input type="radio" name="sfyxsj"  value="N">
    否 </td>
  <td align="right">套餐升级分类</td>
  <td><input name="sjfl" type="text" id="sjfl" value="" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否限制数量</td>
  <td>
	  <input type="radio" name="sfxzsl"  value="1">超量需加价
	  <input type="radio" name="sfxzsl"  value="2">不可超量 
	  <input type="radio" name="sfxzsl"  value="3">无数量限制  </td>
  <td align="right">是否要求相同品牌</td>
  <td><input type="radio" name="sfyqxtpp"  value="Y">
是
  <input type="radio" name="sfyqxtpp"  value="N">
否 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">是否可减免</td>
  <td><input type="radio" name="sfkjm"  value="1">
    不可减免
    <input type="radio" name="sfkjm"  value="2">
    可减免 </td>
  <td align="right">减免分类</td>
  <td><input name="jmfl2" type="text" id="jmfl2" value="" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">允许减免最大量 从 </td>
  <td><input type="text" name="yxjmzdsl" value="" size="20" maxlength="17" ></td>
  <td align="right">到</td>
  <td><input type="text" name="yxjmzdsl2" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从 </td>
  <td><input type="text" name="tckd_tcfgzcxmxj_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到 </td>
  <td><input type="text" name="tckd_tcfgzcxmxj_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="16%">录入人</td> 
  <td width="34%"><input type="text" name="tckd_tcfgzcxmxj_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="18%">升级计价方式</td> 
  <td width="32%"><input type="radio" name="sjjjfs"  value="1">
    按套
      <input type="radio" name="sjjjfs"  value="2">
      按数量 </td>
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
	if(!(isFloat(FormName.yxjmzdsl, "允许减免最大数量"))) {
		return false;
	}
	if(!(isFloat(FormName.yxjmzdsl2, "允许减免最大数量"))) {
		return false;
	}

	if(!(isDatetime(FormName.tckd_tcfgzcxmxj_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.tckd_tcfgzcxmxj_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
