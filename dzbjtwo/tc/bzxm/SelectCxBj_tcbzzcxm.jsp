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
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="Bj_tcbzzcxmCxList.jsp" name="selectform">
<div align="center">套餐标准主材项目－查询</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">报价版本号</td> 
  <td colspan="3"> 
    <select name="bj_tcbzzcxm_bjbbh" style="FONT-SIZE:12PX;WIDTH:525PX">
<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select bjbbh c1,bjbbh||'（'||dqmc||'）（'||DECODE(bj_dzbjbb.sfzybb,'1','未启用','2','当前版','3','可用版','4','停用')||'）' c2 from bj_dzbjbb,dm_dqbm where bj_dzbjbb.dqbm=dm_dqbm.dqbm and bj_dzbjbb.sfzybb in('1','2','3') order by bj_dzbjbb.dqbm,bjbbh","");
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select bjbbh c1,bjbbh||'（'||dqmc||'）（'||DECODE(bj_dzbjbb.sfzybb,'1','未启用','2','当前版','3','可用版','4','停用')||'）' c2 from bj_dzbjbb,dm_dqbm where bj_dzbjbb.dqbm=dm_dqbm.dqbm and bj_dzbjbb.sfzybb in('1','2','3') and bj_dzbjbb.dqbm='"+dqbm+"' order by bj_dzbjbb.dqbm,bjbbh","");
	}
%>
    </select>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">地区</td>
  <td><select name="bj_tcbzzcxm_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  <td><select name="bj_tcbzzcxm_bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where lx='2' and  bjjbbm in(select sq_sjsbjjb.bjjbbm from sq_sjsbjjb,sq_yhxx where sq_sjsbjjb.ygbh=sq_yhxx.ygbh and sq_yhxx.yhdlm='"+yhdlm+"') order by bjjbbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">户型</td> 
  <td width="32%"><select name="bj_tcbzzcxm_hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%>
  </select></td>
  <td align="right" width="18%">结构位置</td> 
  <td width="32%"><select name="bj_tcbzzcxm_jgwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jgwzmc c1,jgwzmc cc from bdm_jgwzbm order by jgwzmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">产品类别</td> 
  <td width="32%"><select name="bj_tcbzzcxm_tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  <td><select name="tcsjflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select tcsjflbm,tcsjflmc from bj_tcsjflbm order by tcsjflmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否限制数量</td>
  <td><input type="radio" name="sfxzsl"  value="1">
    可增项
      <input type="radio" name="sfxzsl"  value="2">
      不可增项
      <input type="radio" name="sfxzsl"  value="3">
      不控制 </td>
  <td align="right">是否要求相同品牌</td>
  <td><input type="radio" name="sfyqxtpp"  value="Y">
是
  <input type="radio" name="sfyqxtpp"  value="N">
否 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从 </td>
  <td><input type="text" name="bj_tcbzzcxm_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到 </td>
  <td><input type="text" name="bj_tcbzzcxm_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td> 
  <td width="32%"><input type="text" name="bj_tcbzzcxm_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
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
	if(!(isDatetime(FormName.bj_tcbzzcxm_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.bj_tcbzzcxm_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
