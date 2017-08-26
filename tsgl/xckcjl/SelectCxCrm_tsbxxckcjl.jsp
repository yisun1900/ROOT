<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_tsbxxckcjlCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="17%"> 
        <div align="right">分公司</div>
      </td>
      <td width="33%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
      <td width="17%"> 
        <div align="right">签约店面</div>
      </td>
      <td width="33%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" align="right">合同号</td>
      <td width="33%"> 
        <input type="text" name="hth" size="20" maxlength="20">
      </td>
      <td width="17%" align="right">客户编号</td>
      <td width="33%"> 
        <input type="text" name="khbh" size="20" maxlength="20">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" align="right">设计师</td>
      <td width="33%"> 
        <input type="text" name="sjs" size="20" maxlength="20">
      </td>
      <td width="17%" align="right">质检</td>
      <td width="33%"> 
        <input type="text" name="zjxm" size="20" maxlength="20">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" align="right"><font color="#0000CC"><b>客户姓名</b></font></td>
      <td width="33%"> 
        <input type="text" name="khxm" size="20" maxlength="50">
      </td>
      <td width="17%" align="right">客户姓名</td>
      <td width="33%"> 
        <input type="text" name="khxm2" size="14" maxlength="50" >
        （模糊查询） </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"> 
        <div align="right"><font color="#0000CC"><b>联系方式</b></font></div>
      </td>
      <td width="33%"> 
        <input type="text" name="lxfs" size="20" maxlength="50">
      </td>
      <td width="17%"> 
        <div align="right">联系方式</div>
      </td>
      <td width="33%"> 
        <input type="text" name="lxfs2" size="14" maxlength="50">
        （模糊查询） </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" align="right"><font color="#0000CC"><b>房屋地址</b></font></td>
      <td colspan="3"> 
        <input type="text" name="fwdz" size="71" maxlength="100">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"> 
        <div align="right">房屋地址</div>
      </td>
      <td colspan="3"> 
        <input type="text" name="fwdz2" size="65" maxlength="50" >
        （模糊查询） </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">类型</td>
      <td width="33%"><%
	cf.radioToken(out, "crm_tsjl_lx","1+投诉&2+报修","");
%></td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">投诉报修记录号</td>
      <td width="33%"> 
        <input type="text" name="crm_tsbxxckcjl_tsjlh" size="20" maxlength="9" >
      </td>
      <td align="right" width="17%">投诉来源</td>
      <td width="33%"> 
        <select name="crm_tsjl_slfsbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select slfsbm,slfsmc from dm_slfsbm order by slfsbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">客服受理时间 从</td>
      <td width="33%"> 
        <input type="text" name="crm_tsjl_slsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="17%">到</td>
      <td width="33%"> 
        <input type="text" name="crm_tsjl_slsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">投诉严重程度</td>
      <td width="33%"> 
        <select name="crm_tsjl_yzcdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select yzcdbm,yzcdmc from dm_yzcdbm order by yzcdbm","");
%> 
        </select>
      </td>
      <td align="right" width="17%">结案状态</td>
      <td width="33%"> 
        <select name="crm_tsjl_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="0">未受理</option>
          <option value="1">已受理</option>
          <option value="2">在处理</option>
          <option value="3">结案</option>
          <option value="9">不立案</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">客服受理人</td>
      <td width="33%"> 
        <input type="text" name="crm_tsjl_slr" size="20" maxlength="16" >
      </td>
      <td align="right" width="17%">勘查记录号</td>
      <td width="33%"> 
        <input type="text" name="crm_tsbxxckcjl_kcjlh" size="20" maxlength="11" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">结案时间 从</td>
      <td width="33%"> 
        <input type="text" name="crm_tsjl_jasj" size="20" maxlength="10" >
      </td>
      <td align="right" width="17%">到</td>
      <td width="33%"> 
        <input type="text" name="crm_tsjl_jasj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">勘查时间 从</td>
      <td width="33%"> 
        <input type="text" name="crm_tsbxxckcjl_kcsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="17%">到</td>
      <td width="33%"> 
        <input type="text" name="crm_tsbxxckcjl_kcsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">勘查人</td>
      <td width="33%"> 
        <input type="text" name="crm_tsbxxckcjl_kcr" size="20" maxlength="20" >
      </td>
      <td align="right" width="17%">录入人</td>
      <td width="33%"> 
        <input type="text" name="crm_tsbxxckcjl_lrr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">录入时间 从</td>
      <td width="33%"> 
        <input type="text" name="crm_tsbxxckcjl_lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="17%">到</td>
      <td width="33%"> 
        <input type="text" name="crm_tsbxxckcjl_lrsj2" size="20" maxlength="10" >
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
	if(!(isDatetime(FormName.crm_tsjl_slsj, "客服受理时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_slsj2, "客服受理时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_jasj, "结案时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_jasj2, "结案时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsbxxckcjl_kcsj, "勘查时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsbxxckcjl_kcsj2, "勘查时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsbxxckcjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsbxxckcjl_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
