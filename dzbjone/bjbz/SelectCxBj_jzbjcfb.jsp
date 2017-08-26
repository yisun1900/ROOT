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
	String str1=cf.getItemData("select xmxlbm,xmxlmc,xmdlbm from bdm_xmxlbm order by xmdlbm,xmxlbm");
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
	String yhmc=(String)session.getAttribute("yhmc");
	String yhdlm=(String)session.getAttribute("yhdlm");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="Bj_jzbjcfbCxList.jsp" name="selectform">
<div align="center">拆分报价查询</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">报价版本号</td> 
  <td width="32%"><select name="bjbbh" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  </select></td>
  <td align="right" width="18%">饰面</td> 
  <td width="32%"><select name="bj_jzbjcfb_smbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select smbm,smmc  from bdm_smbm order by smbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">地区</td> 
  <td width="32%"><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  <td align="right" width="18%">报价级别</td> 
  <td width="32%"><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">项目大类</td>
  <td><select name="bj_jzbjcfb_xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(bj_jzbjcfb_xmdlbm,bj_jzbjcfb_xmxlbm,<%=str1%>)">
    <option value=""></option>
    <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm","");
%>
  </select>  </td>
  <td align="right">项目小类</td>
  <td><select name="bj_jzbjcfb_xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm order by xmdlbm,xmxlbm","");
%>
  </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">父项目编号</td>
  <td><input type="text" name="bj_jzbjcfb_fxmbh" size="20" maxlength="16" ></td>
  <td align="right">父项目名称</td>
  <td><input type="text" name="fxmmc" size="20" maxlength="100" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">项目编号</td> 
  <td width="32%"> 
    <input type="text" name="bj_jzbjcfb_xmbh" size="20" maxlength="16" >  </td>
  <td align="right" width="18%">项目名称</td> 
  <td width="32%"> 
    <input type="text" name="bj_jzbjcfb_xmmc" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从</td>
  <td><input type="text" name="bj_jzbjcfb_lrsj" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="bj_jzbjcfb_lrsj2" size="20" maxlength="10" ></td>
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
	if(!(isDatetime(FormName.bj_jzbjcfb_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.bj_jzbjcfb_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
