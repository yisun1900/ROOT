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
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Xz_gdzcbCxList.jsp" name="selectform">
  <div align="center">
    移交登记
    <BR>
    （<font color="#0000CC"><b>首先查询出需移交物品，然后进行登记</b></font>） </div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">当前保管分公司</td>
      <td width="30%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where cxbz='N' order by ssfgs,dwbh");
        out.println("        <select name=\"xz_gdzcb_fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(xz_gdzcb_fgsbh,xz_gdzcb_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"xz_gdzcb_fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
      <td align="right" width="21%">当前保管部门</td>
      <td width="29%"> 
        <select name="xz_gdzcb_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">固定资产编号</td>
      <td width="30%"> 
        <input type="text" name="xz_gdzcb_gsbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="21%">固定资产名称</td>
      <td width="29%"> 
        <input type="text" name="xz_gdzcb_gdzcmc" size="20" maxlength="30" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">部门内部编号</td>
      <td width="30%"> 
        <input type="text" name="xz_gdzcb_bmbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="21%">固定资产分类</td>
      <td width="29%"> 
        <select name="xz_gdzcb_gdzcflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select gdzcflbm,gdzcflmc from xz_gdzcflbm order by gdzcflbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">型号</td>
      <td width="30%"> 
        <input type="text" name="xz_gdzcb_xh" size="20" maxlength="30" >
      </td>
      <td align="right" width="21%">品牌</td>
      <td width="29%"> 
        <input type="text" name="xz_gdzcb_pp" size="20" maxlength="30" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">购入时间 从</td>
      <td width="30%"> 
        <input type="text" name="xz_gdzcb_grsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="21%">到</td>
      <td width="29%"> 
        <input type="text" name="xz_gdzcb_grsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">是否已报废</td>
      <td width="30%"> <%
	cf.radioToken(out, "xz_gdzcb_sfybf","Y+是&N+否","");
%> </td>
      <td align="right" width="21%">保管人</td>
      <td width="29%"> 
        <input type="text" name="xz_gdzcb_bgr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">移交时间 从</td>
      <td width="30%"> 
        <input type="text" name="yjsj" value="" size="20" maxlength="10" >
      </td>
      <td align="right" width="21%">到</td>
      <td width="29%"> 
        <input type="text" name="yjsj2" value="" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">录入时间</td>
      <td width="30%"> 
        <input type="text" name="xz_gdzcb_lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="21%">录入人 </td>
      <td width="29%"> 
        <input type="text" name="xz_gdzcb_lrr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="20%">查询结果排序</td>
      <td colspan="3">第一列 
        <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value="xz_gdzcb.gdzcflbm">固定资产分类</option>
          <option value="xz_gdzcb.gsbh">固定资产编号</option>
          <option value="xz_gdzcb.gdzcmc">固定资产名称</option>
          <option value="xz_gdzcb.bmbh">部门内部编号</option>
          <option value="xz_gdzcb.xh">型号</option>
          <option value="xz_gdzcb.pp">品牌</option>
          <option value="xz_gdzcb.sl">数量</option>
          <option value="xz_gdzcb.grsj">购入时间</option>
          <option value="xz_gdzcb.yjsj">移交时间</option>
          <option value="xz_gdzcb.grj">购入价</option>
          <option value="xz_gdzcb.bgr">保管人</option>
          <option value="xz_gdzcb.dwbh">当前保管部门</option>
          <option value="xz_gdzcb.sfybf">是否已报废</option>
        </select>
        第二列 
        <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="xz_gdzcb.gdzcflbm">固定资产分类</option>
          <option value="xz_gdzcb.gsbh">固定资产编号</option>
          <option value="xz_gdzcb.gdzcmc">固定资产名称</option>
          <option value="xz_gdzcb.bmbh">部门内部编号</option>
          <option value="xz_gdzcb.xh">型号</option>
          <option value="xz_gdzcb.pp">品牌</option>
          <option value="xz_gdzcb.sl">数量</option>
          <option value="xz_gdzcb.grsj">购入时间</option>
          <option value="xz_gdzcb.yjsj">移交时间</option>
          <option value="xz_gdzcb.grj">购入价</option>
          <option value="xz_gdzcb.bgr">保管人</option>
          <option value="xz_gdzcb.dwbh">当前保管部门</option>
          <option value="xz_gdzcb.sfybf">是否已报废</option>
        </select>
        第三列 
        <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="xz_gdzcb.gdzcflbm">固定资产分类</option>
          <option value="xz_gdzcb.gsbh">固定资产编号</option>
          <option value="xz_gdzcb.gdzcmc">固定资产名称</option>
          <option value="xz_gdzcb.bmbh">部门内部编号</option>
          <option value="xz_gdzcb.xh">型号</option>
          <option value="xz_gdzcb.pp">品牌</option>
          <option value="xz_gdzcb.sl">数量</option>
          <option value="xz_gdzcb.grsj">购入时间</option>
          <option value="xz_gdzcb.yjsj">移交时间</option>
          <option value="xz_gdzcb.grj">购入价</option>
          <option value="xz_gdzcb.bgr">保管人</option>
          <option value="xz_gdzcb.dwbh">当前保管部门</option>
          <option value="xz_gdzcb.sfybf">是否已报废</option>
        </select>
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
