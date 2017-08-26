<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010205")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<%
String[] ygbh = request.getParameterValues("ygbh");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr> 
    <td width="93%" height="2"> 
      <div align="center"> 
        <form method="post" action="" name="selectform" >
<%
	for (int i=0;i<ygbh.length ;i++ )
	{
		%>
		<input type="hidden" name="ygbh"  value="<%=ygbh[i]%>" >
		<%
	}

%>
		 打折－授权 
          <table width="50%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
            <tr bgcolor="#FFFFFF">
              <td width="42%" align="right"><span class="STYLE1">*</span>控制打折方式</td>
              <td width="58%"><%
	cf.radioToken(out, "kzdzfs","1+控制毛利率&2+控制折扣","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">签单最低毛利率</td>
              <td><input name="zdmll" type="text" size="10" maxlength="10" >
              （>0且<=100）</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">签单最低折扣</td>
              <td><input name="zkl" type="text" size="10" maxlength="10"  >
              （>0且<=10）</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE1">*</span>每月申请特殊折扣次数</td>
              <td><input name="sqtszkcs" type="text" size="10" maxlength="10"  ></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td colspan="2" align="center"><input type="button"  value="存盘" onClick="f_do(selectform)" >              </td>
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
	if(	!radioChecked(FormName.kzdzfs)) {
		alert("请选择[控制打折方式]！");
		FormName.kzdzfs[0].focus();
		return false;
	}

	if (FormName.kzdzfs[0].checked)
	{
		if(	javaTrim(FormName.zdmll)=="") {
			alert("请输入[签单最低毛利率]！");
			FormName.zdmll.focus();
			return false;
		}
		if(!(isFloat(FormName.zdmll, "签单最低毛利率"))) {
			return false;
		}
		if (parseFloat(FormName.zdmll.value) <=0 || parseFloat(FormName.zdmll.value) >100)
		{
			alert("错误！[签单最低毛利率]应该在0和100之间！");
			FormName.zdmll.select();
			return false;
		}
	}
	else
	{
		if(	javaTrim(FormName.zkl)=="") {
			alert("请输入[签单最低折扣]！");
			FormName.zkl.focus();
			return false;
		}
		if(!(isFloat(FormName.zkl, "签单最低折扣"))) {
			return false;
		}
		if (parseFloat(FormName.zkl.value) <=0 || parseFloat(FormName.zkl.value) >10)
		{
			alert("错误！[签单最低折扣]应该在0和10之间！");
			FormName.zkl.select();
			return false;
		}
	}

	if(	javaTrim(FormName.sqtszkcs)=="") {
		alert("请输入[每月申请特殊折扣次数]！");
		FormName.sqtszkcs.focus();
		return false;
	}
	if(!(isInt(FormName.sqtszkcs, "每月申请特殊折扣次数"))) {
		return false;
	}


	FormName.action="SavePlsz.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
