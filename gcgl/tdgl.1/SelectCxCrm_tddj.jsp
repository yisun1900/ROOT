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
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_tddjCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">退单序号</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_tddj_tdxh" size="20" maxlength="9" >
              </td>
              <td width="17%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_tddj_khbh" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_tddj_khxm" size="20" maxlength="20" >
              </td>
              <td width="17%"> 
                <div align="right">房屋地址</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_tddj_fwdz" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">电话</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_tddj_dh" size="20" maxlength="100" >
              </td>
              <td width="17%"> 
                <div align="right">设计师</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_tddj_sjs" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">工程担当</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_tddj_zjxm" size="20" maxlength="20" >
              </td>
              <td width="17%"> 
                <div align="right"></div>
              </td>
              <td width="33%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">施工队</div>
              </td>
              <td width="31%"> 
                <select name="crm_tddj_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgdmc","");
	}
	else 
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select sgd,sgdmc from sq_sgd where ssdw='"+ssfgs+"' order by sgdmc","");
	}

%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">施工班组</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_tddj_sgbz" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">分公司</div>
              </td>
              <td width="31%"> 
                <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,crm_tddj_dwbh,<%=dwstr%>)">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="33%"> 
                <select name="crm_tddj_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
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
              <td width="19%"> 
                <div align="right">退单原因</div>
              </td>
              <td width="31%"> 
                <select name="crm_tddj_tdyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tdyybm,tdyymc from dm_tdyybm order by tdyybm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">退单原因说明</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_tddj_tdyysm" size="20" value="">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">是否返券</div>
              </td>
              <td width="31%"> 
                <select name="crm_tddj_sffj" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+是&N+否","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">是否已认证</div>
              </td>
              <td width="33%"> 
                <select name="crm_tddj_sfyrz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+是&N+否","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">应退金额</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_tddj_ytje" size="20" maxlength="17" >
              </td>
              <td width="17%"> 
                <div align="right">实退金额</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_tddj_stje" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">录入单位</div>
              </td>
              <td width="31%"> 
                <select name="crm_tddj_lrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and dwbh='"+dwbh+"'","");
	}
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">录入人</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_tddj_lrr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">录入时间 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_tddj_lrsj" size="20" maxlength="10" >
              </td>
              <td width="17%"> 
                <div align="right">到</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_tddj_lrsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">是否退回全部礼品</td>
              <td width="31%"> 
                <input type="radio" name="sfthlp" value="Y">
                退回 
                <input type="radio" name="sfthlp" value="N">
                未退回 
                <input type="radio" name="sfthlp" value="W">
                未领礼品 </td>
              <td width="17%">&nbsp;</td>
              <td width="33%">&nbsp;</td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isFloat(FormName.crm_tddj_ytje, "应退金额"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_tddj_stje, "实退金额"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tddj_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tddj_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
