<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>选择合并客户</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String ssfgs=request.getParameter("ssfgs");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF" align="center"> 
      <td colspan="4" height="68">
        <b><font size="4">请输入合并客户信息</font></b>
        <BR><b><font color="#FF0000" size="4">（建议删除集成客户，保留家装客户）</font></b>
      </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" height="37" bgcolor="#CCCCFF"><b>删除客户</b></td>
    <td colspan="2" align="center" height="37" bgcolor="#CCFFCC"><b>保留客户</b></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right" bgcolor="#CCCCFF">合同号</td>
    <td width="33%" bgcolor="#CCCCFF"> 
      <input type="text" name="hth1" size="20" maxlength="20">
    </td>
    <td width="17%" align="right" bgcolor="#CCFFCC">合同号</td>
    <td width="33%" bgcolor="#CCFFCC"> 
      <input type="text" name="hth2" size="20" maxlength="20">
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right" bgcolor="#CCCCFF">客户编号</td>
    <td width="33%" bgcolor="#CCCCFF"> 
      <input type="text" name="khbh1" size="20" maxlength="20">
    </td>
    <td width="17%" align="right" bgcolor="#CCFFCC">客户编号</td>
    <td width="33%" bgcolor="#CCFFCC"> 
      <input type="text" name="khbh2" size="20" maxlength="20">
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right" bgcolor="#CCCCFF">客户姓名</td>
    <td width="33%" bgcolor="#CCCCFF"> 
      <input type="text" name="khxm1" size="20" maxlength="50">
    </td>
    <td width="17%" align="right" bgcolor="#CCFFCC">客户姓名</td>
    <td width="33%" bgcolor="#CCFFCC"> 
      <input type="text" name="khxm2" size="20" maxlength="50">
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right" bgcolor="#CCCCFF">房屋地址</td>
    <td width="33%" bgcolor="#CCCCFF"> 
      <input type="text" name="fwdz1" size="20" maxlength="100">
    </td>
    <td width="17%" align="right" bgcolor="#CCFFCC">房屋地址</td>
    <td width="33%" bgcolor="#CCFFCC"> 
      <input type="text" name="fwdz2" size="20" maxlength="100">
    </td>
  </tr>
  <tr bgcolor="#FFFFFF" align="center"> 
    <td colspan="4" bgcolor="#FFFFFF" height="55"> 
		<input type="hidden" name="ssfgs" value="<%=ssfgs%>">
      <input type="button"  value="继续" onClick="f_do(selectform)" name="button">
      <input type="reset"  value="重输" name="reset">
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
	if(	javaTrim(FormName.hth1)=="" && javaTrim(FormName.khbh1)=="" && javaTrim(FormName.khxm1)=="" && javaTrim(FormName.fwdz1)=="" ) 
	{
		alert("请输入[删除客户条件]！");
		FormName.khxm1.select();
		return false;
	}

	if(	javaTrim(FormName.hth2)=="" && javaTrim(FormName.khbh2)=="" && javaTrim(FormName.khxm2)=="" && javaTrim(FormName.fwdz2)=="" ) 
	{
		alert("请输入[保留客户条件]！");
		FormName.khxm2.select();
		return false;
	}

	FormName.action="XsKhxxList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
