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
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Cl_djjCxtjList.jsp" name="selectform">
<div align="center">撤销提交</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">客户姓名</td>
      <td width="35%"> 
        <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
      </td>
      <td align="right" width="15%">房屋地址</td>
      <td width="35%"> 
        <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">联系方式</td>
      <td width="35%"> 
        <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >
      </td>
      <td align="right" width="15%">合同号</td>
      <td width="35%"> 
        <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">设计师</td>
      <td width="35%"> 
        <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
      </td>
      <td align="right" width="15%">质检</td>
      <td width="35%">
        <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="15%">签约日期 从</td>
      <td width="35%">
        <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" >
      </td>
      <td align="right" width="15%">到</td>
      <td width="35%">
        <input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">操作序号</td>
      <td width="35%">
        <input type="text" name="cl_djj_czxh" size="20" maxlength="9" >
      </td>
      <td align="right" width="15%">客户编号</td>
      <td width="35%">
        <input type="text" name="cl_djj_khbh" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">是否申请减免</td>
      <td width="35%"><%
	cf.radioToken(out, "cl_djj_sfjm","1+不申请&2+申请减免","");
%> </td>
      <td align="right" width="15%">减免审核状态</td>
      <td width="35%">
        <input type="radio" name="cl_djj_shzt" value="1">未审核
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">录入人</td>
      <td width="35%">
        <input type="text" name="cl_djj_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="15%">&nbsp;</td>
      <td width="35%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">录入时间 从</td>
      <td width="35%">
        <input type="text" name="cl_djj_lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="15%">到</td>
      <td width="35%"> 
        <input type="text" name="cl_djj_lrsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">分公司</td>
      <td width="35%"> 
<%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			out.println("        <select name=\"cl_djj_dwbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\"> ");
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
			out.println("        </select>");
		}
		else{
			out.println("        <select name=\"cl_djj_dwbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
			out.println("        </select>");
		}
%>
      </td>
      <td align="right" width="15%">操作状态</td>
      <td width="35%"> 
        <select name="cl_djj_czzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value="2">已提交</option>
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
	if(!(isDatetime(FormName.crm_khxx_qyrq, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq2, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.cl_djj_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cl_djj_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
