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
<form method="post" action="Bj_clckdList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="17%"> 
        <div align="right">分公司</div>
      </td>
      <td width="33%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' and cxbz='N' order by ssdw,dwbh");

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
      <td width="16%"> 
        <div align="right">签约店面</div>
      </td>
      <td width="34%"> 
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
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
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
      <td align="right" width="17%">出库单号</td>
      <td width="33%"> 
        <input type="text" name="bj_clckd_ckdh" size="20" maxlength="9" >
      </td>
      <td align="right" width="16%">客户编号</td>
      <td width="34%"> 
        <input type="text" name="bj_clckd_khbh" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">客户姓名</td>
      <td width="33%"> 
        <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
      </td>
      <td align="right" width="16%">房屋地址</td>
      <td width="34%"> 
        <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">联系方式</td>
      <td width="33%"> 
        <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >
      </td>
      <td align="right" width="16%">合同号</td>
      <td width="34%"> 
        <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">设计师</td>
      <td width="33%"> 
        <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
      </td>
      <td align="right" width="16%">签约日期</td>
      <td width="34%"> 
        <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">施工队</td>
      <td width="33%"> 
        <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select sgd,sgdmc from sq_sgd where cxbz='N' order by ssfgs,sgdmc","");
	}
	else{
		cf.selectItem(out,"select sgd,sgdmc from sq_sgd where cxbz='N' and ssfgs='"+ssfgs+"' order by sgdmc","");
	}
%> 
        </select>
      </td>
      <td align="right" width="16%">质检</td>
      <td width="34%"> 
        <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">出库总数量</td>
      <td width="33%"> 
        <input type="text" name="bj_clckd_ckzsl" size="20" maxlength="17" >
      </td>
      <td align="right" width="16%">出库总金额</td>
      <td width="34%"> 
        <input type="text" name="bj_clckd_ckzje" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">出库人</td>
      <td width="33%"> 
        <input type="text" name="bj_clckd_lrr2" size="20" maxlength="20" >
      </td>
      <td align="right" width="16%">录入人</td>
      <td width="34%"> 
        <input type="text" name="bj_clckd_lrr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">出库时间 从</td>
      <td width="33%"> 
        <input type="text" name="cksj" size="11" maxlength="10" ondblclick="JSCalendar(this)">
        --&gt; 
        <input type="text" name="cksj2" size="11" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="16%">录入时间 从</td>
      <td width="34%"> 
        <input type="text" name="bj_clckd_lrsj" size="11" maxlength="10" ondblclick="JSCalendar(this)">
        --&gt; 
        <input type="text" name="bj_clckd_lrsj2" size="11" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">处理状态</td>
      <td width="33%"> <%
	cf.radioToken(out, "bj_clckd_clzt","1+未审核&2+已审核","");
%> </td>
      <td align="right" width="16%">&nbsp;</td>
      <td width="34%">&nbsp; </td>
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
	if(!(isDatetime(FormName.crm_khxx_qyrq, "签约日期"))) {
		return false;
	}
	if(!(isFloat(FormName.bj_clckd_ckzsl, "出库总数量"))) {
		return false;
	}
	if(!(isFloat(FormName.bj_clckd_ckzje, "出库总金额"))) {
		return false;
	}
	if(!(isDatetime(FormName.cksj, "出库时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cksj2, "出库时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.bj_clckd_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.bj_clckd_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
