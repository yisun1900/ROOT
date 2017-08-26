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
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_zxkhywyxhjlCxList.jsp" name="selectform">
<div align="center">查询修改记录</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
      <td align="right" width="18%">客户编号</td> 
      <td width="32%"> 
        <input type="text" name="crm_zxkhywyxhjl_khbh" size="20" maxlength="20" >
  </td>
      <td align="right" width="17%">所属分公司</td> 
      <td width="33%"> 
        <select name="crm_zxkhywyxhjl_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
		<%
			if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
			}
			else{
				out.println("错误！未进行客户资料授权，请联系系统管理员");
				return;
			}
		%> 
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="18%">客户姓名</td> 
      <td width="32%"> 
        <input type="text" name="crm_zxkhywyxhjl_khxm" size="20" maxlength="50" >
  </td>
      <td align="right" width="17%">原业务员</td> 
      <td width="33%"> 
        <input type="text" name="crm_zxkhywyxhjl_oldywy" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="18%">新业务员</td> 
      <td width="32%"> 
        <input type="text" name="crm_zxkhywyxhjl_newywy" size="20" maxlength="20" >
  </td>
      <td align="right" width="17%">修改人</td> 
      <td width="33%"> 
        <input type="text" name="crm_zxkhywyxhjl_xgr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="18%">修改时间 从</td>
      <td width="32%"> 
        <input type="text" name="crm_zxkhywyxhjl_xgsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="17%">到</td>
      <td width="33%"> 
        <input type="text" name="crm_zxkhywyxhjl_xgsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
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
	if(!(isDatetime(FormName.crm_zxkhywyxhjl_xgsj, "修改时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhywyxhjl_xgsj2, "修改时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
