<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Yx_xxqmdCxList.jsp" name="selectform">
<div align="center">新小区名单－查询</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right">分公司</td>
    <td><select name="yx_xxqmd_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
		<%
			if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
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
    </select></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">小区名称</td> 
  <td width="32%"> 
    <input type="text" name="yx_xxqmd_xqmc" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">第一个客户地址</td> 
  <td width="32%"> 
    <input type="text" name="yx_xxqmd_dz" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">状态</td> 
  <td width="32%"> 
    <INPUT type="radio" name="yx_xxqmd_zt" value="1">未确认
    <INPUT type="radio" name="yx_xxqmd_zt" value="2">已确认
  </td>
  <td align="right" width="18%">录入人</td> 
  <td width="32%"> 
    <input type="text" name="yx_xxqmd_lrr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入时间 从</td> 
  <td width="32%"><input type="text" name="yx_xxqmd_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="yx_xxqmd_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">  </td>
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
	if(!(isDatetime(FormName.yx_xxqmd_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_xxqmd_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
