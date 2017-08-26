<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Bj_gzglfxbCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">工料表序号</td>
      <td width="35%"> 
        <input type="text" name="bj_gzglfxb_glbxh" size="20" maxlength="8" >
      </td>
      <td align="right" width="15%">报价级别</td>
      <td width="35%"><%
	cf.radioItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","bjjb","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">地区</td>
      <td width="35%"> 
        <select name="bj_gzglfxb_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
        </select>
      </td>
      <td align="right" width="15%">项目编号</td>
      <td width="35%"> 
        <input type="text" name="bj_gzglfxb_xmbh" size="20" maxlength="16" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">项目名称</td>
      <td width="35%"> 
        <input type="text" name="bj_gzglfxb_xmmc" size="20" maxlength="100" >
      </td>
      <td align="right" width="15%">项目大类</td>
      <td width="35%"> 
        <select name="bj_gzglfxb_xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">项目小类</td>
      <td width="35%"> 
        <select name="bj_gzglfxb_xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm order by xmdlbm,xmxlbm","");
%> 
        </select>
      </td>
      <td align="right" width="15%">工料分类</td>
      <td width="35%"> 
        <select name="bj_gzglfxb_glflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select glflbm,glflmc from bdm_glflbm order by glflbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">工料名称</td>
      <td width="35%"> 
        <input type="text" name="bj_gzglfxb_glmc" size="20" maxlength="100" >
      </td>
      <td align="right" width="15%">品牌</td>
      <td width="35%"> 
        <input type="text" name="bj_gzglfxb_pp" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">型号规格</td>
      <td width="35%"> 
        <input type="text" name="bj_gzglfxb_xhgg" size="20" maxlength="100" >
      </td>
      <td align="right" width="15%">计量单位</td>
      <td width="35%"> 
        <input type="text" name="bj_gzglfxb_jldwbm" size="20" maxlength="2" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">消耗量</td>
      <td width="35%"> 
        <input type="text" name="bj_gzglfxb_xhl" size="20" maxlength="17" >
      </td>
      <td align="right" width="15%">单价</td>
      <td width="35%"> 
        <input type="text" name="bj_gzglfxb_dj" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">录入人</td>
      <td width="35%"> 
        <input type="text" name="bj_gzglfxb_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="15%">录入时间</td>
      <td width="35%"> 
        <input type="text" name="bj_gzglfxb_lrsj" size="20" maxlength="10" >
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="查询" onClick="f_do(selectform)">
        <input type="reset"  value="重输">
      </td>
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
	if(	javaTrim(FormName.bj_gzglfxb_dqbm)=="") {
		alert("请选择[地区]！");
		FormName.bj_gzglfxb_dqbm.focus();
		return false;
	}

	if(!(isNumber(FormName.bj_gzglfxb_glbxh, "工料表序号"))) {
		return false;
	}
	if(!(isFloat(FormName.bj_gzglfxb_xhl, "消耗量"))) {
		return false;
	}
	if(!(isFloat(FormName.bj_gzglfxb_dj, "单价"))) {
		return false;
	}
	if(!(isDatetime(FormName.bj_gzglfxb_lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
