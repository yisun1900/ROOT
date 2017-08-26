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
	String yhmc=(String)session.getAttribute("yhmc");
	String dwbh=(String)session.getAttribute("dwbh");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="Crm_scbkhgzjlList.jsp" name="selectform">
<div align="center">客户跟踪记录－维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">记录号</td> 
  <td width="31%"> 
    <input type="text" name="crm_scbkhgzjl_jlh" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">市场部客户编号</td> 
  <td width="32%"> 
    <input type="text" name="crm_scbkhgzjl_scbkhbh" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">客户姓名</td> 
  <td width="31%"> 
    <input type="text" name="crm_scbkhxx_khxm" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">房屋地址</td> 
  <td width="32%"> 
    <input type="text" name="crm_scbkhxx_fwdz" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">电话</td> 
  <td width="31%"> 
    <input type="text" name="crm_scbkhxx_lxfs" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">业务员</td> 
  <td width="32%"> 
    <input type="text" name="crm_scbkhxx_ywy" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">所属小组</td> 
  <td width="31%"> 
    <input type="text" name="ywyssxz" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">状态</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "crm_scbkhxx_zt","1+跟踪&2+失败&3+移交","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">跟踪录入人</td> 
  <td width="31%"> 
    <input type="text" name="crm_scbkhgzjl_lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>  </td>
  <td align="right" width="18%">跟踪录入部门</td> 
  <td width="32%"><select name="crm_scbkhgzjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">跟踪录入时间 从</td> 
  <td width="31%"><input type="text" name="crm_scbkhgzjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">到 </td>
  <td width="32%"><input type="text" name="crm_scbkhgzjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
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
	if(!(isDatetime(FormName.crm_scbkhgzjl_lrsj, "跟踪录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhgzjl_lrsj2, "跟踪录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
