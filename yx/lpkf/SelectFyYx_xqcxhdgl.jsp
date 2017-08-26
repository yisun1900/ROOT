<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=request.getParameter("ssfgs");
%>

<form method="post" action="Yx_xqcxhdglFyList.jsp" name="selectform">
<div align="center">录入－活动费用</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">公司</td>
      <td width="33%"> 
        <select name="yx_xqcxhdgl_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
	}
	else 
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
        </select>
      </td>
      <td align="right" width="17%">审批状态</td>
      <td width="33%"> 
        <select name="yx_xqcxhdgl_spzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value="2">审批</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">小区名称</td>
      <td width="33%"> 
        <select name="yx_xqcxhdgl_xqmc" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xqmc c1,xqmc c2 from yx_lsdcb order by xqmc","");
%> 
        </select>
      </td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">地区</td>
      <td width="33%"> 
        <select name="yx_lsdcb_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%> 
        </select>
      </td>
      <td align="right" width="17%">城区</td>
      <td width="33%"> 
        <select name="yx_lsdcb_cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">审批结论</td>
      <td width="33%"> 
        <select name="yx_xqcxhdgl_spjl" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value="Y">同意</option>
        </select>
      </td>
      <td align="right" width="17%">审批人</td>
      <td width="33%"> 
        <input type="text" name="yx_xqcxhdgl_spr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">审批时间</td>
      <td width="33%"> 
        <input type="text" name="yx_xqcxhdgl_spsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="17%">录入人</td>
      <td width="33%"> 
        <input type="text" name="yx_xqcxhdgl_lrr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">录入时间 从</td>
      <td width="33%"> 
        <input type="text" name="yx_xqcxhdgl_lrsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="17%">到</td>
      <td width="33%"> 
        <input type="text" name="yx_xqcxhdgl_lrsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
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

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.yx_xqcxhdgl_spsj, "审批时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_xqcxhdgl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_xqcxhdgl_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
