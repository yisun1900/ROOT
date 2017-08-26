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
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where cxbz='N' order by ssfgs,dwbh");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Xz_gdzcbTjList.jsp" name="selectform">
  <div align="center">固定资产统计</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">当前保管分公司</td>
      <td width="32%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"xz_gdzcb_fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(xz_gdzcb_fgsbh,xz_gdzcb_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
      <td align="right" width="19%">当前保管部门</td>
      <td width="31%"> 
        <select name="xz_gdzcb_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">固定资产编号</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcb_gsbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">固定资产名称</td>
      <td width="31%"> 
        <input type="text" name="xz_gdzcb_gdzcmc" size="20" maxlength="30" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">部门内部编号</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcb_bmbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">固定资产分类</td>
      <td width="31%"> 
        <select name="xz_gdzcb_gdzcflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select gdzcflbm,gdzcflmc from xz_gdzcflbm order by gdzcflbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">型号</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcb_xh" size="20" maxlength="30" >
      </td>
      <td align="right" width="19%">品牌</td>
      <td width="31%"> 
        <input type="text" name="xz_gdzcb_pp" size="20" maxlength="30" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">配置(CPU)</td>
      <td width="32%"> 
        <input type="text" name="pz1" value="" size="20" maxlength="50">
      </td>
      <td width="19%" align="right">配置(内存)</td>
      <td width="31%"> 
        <input type="text" name="pz2" value="" size="20" maxlength="50">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">配置(硬盘)</td>
      <td width="32%"> 
        <input type="text" name="pz3" value="" size="20" maxlength="50">
      </td>
      <td width="19%" align="right">配置(主板)</td>
      <td width="31%"> 
        <input type="text" name="pz4" value="" size="20" maxlength="50">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">配置(显卡)</td>
      <td width="32%"> 
        <input type="text" name="pz5" value="" size="20" maxlength="50">
      </td>
      <td width="19%" align="right">配置(显示器)</td>
      <td width="31%"> 
        <input type="text" name="pz6" value="" size="20" maxlength="50">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">购入时间 从</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcb_grsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">到</td>
      <td width="31%"> 
        <input type="text" name="xz_gdzcb_grsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">是否已报废</td>
      <td width="32%"> <%
	cf.radioToken(out, "xz_gdzcb_sfybf","Y+是&N+否","");
%> </td>
      <td align="right" width="19%">保管人</td>
      <td width="31%"> 
        <input type="text" name="xz_gdzcb_bgr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">移交时间 从</td>
      <td width="32%"> 
        <input type="text" name="yjsj" value="" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">到</td>
      <td width="31%"> 
        <input type="text" name="yjsj2" value="" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">录入时间 从</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcb_lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">到</td>
      <td width="31%">
        <input type="text" name="xz_gdzcb_lrsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">资产所属分公司</td>
      <td width="32%"> 
        <select name="ssfgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"' ","");
	}
%> 
        </select>
      </td>
      <td align="right" width="19%">录入人</td>
      <td width="31%">
        <input type="text" name="xz_gdzcb_lrr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="18%">固定资产统计表</td>
      <td colspan="3"> 第一列 
        <input type="hidden" name="tj1name" value="">
        <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
          <option value=""></option>
          <option value="gdzcflmc">固定资产分类</option>
          <option value="xz_gdzcb.gsbh">固定资产编号</option>
          <option value="xz_gdzcb.gdzcmc">固定资产名称</option>
          <option value="xz_gdzcb.bmbh">部门内部编号</option>
          <option value="xz_gdzcb.xh">型号</option>
          <option value="xz_gdzcb.pp">品牌</option>
          <option value="xz_gdzcb.sl">数量</option>
          <option value="xz_gdzcb.grsj">购入时间</option>
          <option value="xz_gdzcb.lrsj">录入时间</option>
          <option value="xz_gdzcb.grj">购入价</option>
          <option value="xz_gdzcb.bgr">保管人</option>
          <option value="dwmc">当前保管部门</option>
          <option value="DECODE(xz_gdzcb.sfybf,'Y','是','N','否')">是否已报废</option>
          <option value="xz_gdzcb.pz1">配置(CPU)</option>
          <option value="xz_gdzcb.pz2">配置(内存)</option>
          <option value="xz_gdzcb.pz3">配置(硬盘)</option>
          <option value="xz_gdzcb.pz4">配置(主板)</option>
          <option value="xz_gdzcb.pz5">配置(显卡)</option>
          <option value="xz_gdzcb.pz6">配置(显示器)</option>
        </select>
        第二列 
        <input type="hidden" name="tj2name" value="">
        <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
          <option value=""></option>
          <option value="gdzcflmc">固定资产分类</option>
          <option value="xz_gdzcb.gsbh">固定资产编号</option>
          <option value="xz_gdzcb.gdzcmc">固定资产名称</option>
          <option value="xz_gdzcb.bmbh">部门内部编号</option>
          <option value="xz_gdzcb.xh">型号</option>
          <option value="xz_gdzcb.pp">品牌</option>
          <option value="xz_gdzcb.sl">数量</option>
          <option value="xz_gdzcb.grsj">购入时间</option>
          <option value="xz_gdzcb.lrsj">录入时间</option>
          <option value="xz_gdzcb.grj">购入价</option>
          <option value="xz_gdzcb.bgr">保管人</option>
          <option value="dwmc">当前保管部门</option>
          <option value="DECODE(xz_gdzcb.sfybf,'Y','是','N','否')">是否已报废</option>
          <option value="xz_gdzcb.pz1">配置(CPU)</option>
          <option value="xz_gdzcb.pz2">配置(内存)</option>
          <option value="xz_gdzcb.pz3">配置(硬盘)</option>
          <option value="xz_gdzcb.pz4">配置(主板)</option>
          <option value="xz_gdzcb.pz5">配置(显卡)</option>
          <option value="xz_gdzcb.pz6">配置(显示器)</option>
        </select>
        第三列 
        <input type="hidden" name="tj3name" value="">
        <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
          <option value=""></option>
          <option value="gdzcflmc">固定资产分类</option>
          <option value="xz_gdzcb.gsbh">固定资产编号</option>
          <option value="xz_gdzcb.gdzcmc">固定资产名称</option>
          <option value="xz_gdzcb.bmbh">部门内部编号</option>
          <option value="xz_gdzcb.xh">型号</option>
          <option value="xz_gdzcb.pp">品牌</option>
          <option value="xz_gdzcb.sl">数量</option>
          <option value="xz_gdzcb.grsj">购入时间</option>
          <option value="xz_gdzcb.lrsj">录入时间</option>
          <option value="xz_gdzcb.grj">购入价</option>
          <option value="xz_gdzcb.bgr">保管人</option>
          <option value="dwmc">当前保管部门</option>
          <option value="DECODE(xz_gdzcb.sfybf,'Y','是','N','否')">是否已报废</option>
          <option value="xz_gdzcb.pz1">配置(CPU)</option>
          <option value="xz_gdzcb.pz2">配置(内存)</option>
          <option value="xz_gdzcb.pz3">配置(硬盘)</option>
          <option value="xz_gdzcb.pz4">配置(主板)</option>
          <option value="xz_gdzcb.pz5">配置(显卡)</option>
          <option value="xz_gdzcb.pz6">配置(显示器)</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="18%">显示风格</td>
      <td colspan="3"> 
        <input type="radio" name="xsfg" value="1" checked>
        网页 
        <input type="radio" name="xsfg" value="2">
        EXCEL </td>
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
	if(!(isDatetime(FormName.xz_gdzcb_grsj, "购入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_gdzcb_grsj2, "购入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yjsj, "移交时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yjsj2, "移交时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_gdzcb_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_gdzcb_lrsj2, "录入时间"))) {
		return false;
	}
	if(FormName.tj1.value=="" && FormName.tj2.value=="" && FormName.tj3.value=="") {
		alert("请选择[统计列]！");
		FormName.tj1.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
