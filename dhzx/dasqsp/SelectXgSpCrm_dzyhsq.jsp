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
String yhdlm=(String)session.getAttribute("yhdlm");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
String zkl=cf.executeQuery("select zkl from sq_yhxx where yhdlm='"+yhdlm+"'");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_dzyhsqXgSpList.jsp" name="selectform">
<div align="center">打折优惠申请--修改审批</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="18%"> 
        <div align="right">客户所属分公司</div>
      </td>
      <td width="32%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx='F2' and cxbz='N' order by ssfgs,dwbh");
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(ssfgs,crm_zxkhxx_zxdm,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
      <td width="16%"> 
        <div align="right">咨询店面</div>
      </td>
      <td width="34%"> 
        <select name="crm_zxkhxx_zxdm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
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
      <td align="right" width="18%">客户编号</td>
      <td width="32%"> 
        <input type="text" name="crm_dzyhsq_khbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="16%">客户姓名</td>
      <td width="34%"> 
        <input type="text" name="crm_zxkhxx_khxm" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">房屋地址</td>
      <td width="32%"> 
        <input type="text" name="crm_zxkhxx_fwdz" size="20" maxlength="100" >
      </td>
      <td align="right" width="16%">设计师</td>
      <td width="34%"> 
        <input type="text" name="crm_zxkhxx_sjs" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">申请时间 从</td>
      <td width="32%"> 
        <input type="text" name="crm_dzyhsq_sqsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="16%">到</td>
      <td width="34%"> 
        <input type="text" name="crm_dzyhsq_sqsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">申请人</td>
      <td width="32%"> 
        <input type="text" name="crm_dzyhsq_sqr" size="20" maxlength="20" >
      </td>
      <td align="right" width="16%">是否申请其它优惠</td>
      <td width="34%"><%
	cf.radioToken(out, "crm_dzyhsq_sfsqqtyh","Y+是&N+否","");
%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC"><b>申请折扣率 从</b></font></td>
      <td width="32%"> 
        <input type="text" name="sqzkl" size="20" maxlength="10" value="<%=zkl%>" readonly>
      </td>
      <td align="right" width="16%">到</td>
      <td width="34%"> 
        <input type="text" name="sqzkl2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">录入时间 从</td>
      <td width="32%"> 
        <input type="text" name="crm_dzyhsq_lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="16%">到</td>
      <td width="34%"> 
        <input type="text" name="crm_dzyhsq_lrsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">审批标志</td>
      <td width="32%"> 
        <input type="radio" name="crm_dzyhsq_spbz" value="2" checked>
        已审批 </td>
      <td align="right" width="16%">录入人</td>
      <td width="34%"> 
        <input type="text" name="crm_dzyhsq_lrr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">审批人</td>
      <td width="32%"> 
        <input type="text" name="crm_dzyhsq_spr" size="20" maxlength="20" >
      </td>
      <td align="right" width="16%">审批结果</td>
      <td width="34%"> 
        <input type="radio" name="crm_dzyhsq_spjg" value="1">
        同意 
        <input type="radio" name="crm_dzyhsq_spjg" value="2">
        不同意 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">审批时间 从</td>
      <td width="32%"> 
        <input type="text" name="crm_dzyhsq_spsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="16%">到</td>
      <td width="34%"> 
        <input type="text" name="crm_dzyhsq_spsj2" size="20" maxlength="10" >
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
	if(!(isDatetime(FormName.crm_dzyhsq_sqsj, "申请时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dzyhsq_sqsj2, "申请时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dzyhsq_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dzyhsq_lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dzyhsq_spsj, "审批时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dzyhsq_spsj2, "审批时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
