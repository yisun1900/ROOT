<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ssfgs=request.getParameter("ssfgs");
%>

<html>
<head>
<title>批量修改套餐供应商</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">批量修改套餐供应商</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right" height="54">原供应商</td>
              <td height="54">
				  <input type="text" name="gysmcold" size="41" maxlength="80">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="37%" align="right" height="54"><strong>新供应商</strong></td>
              <td width="63%" height="54"> 
                <select name="gysmcnew" style="FONT-SIZE:12PX;WIDTH:300PX">
                  <option value=""></option>
<%
	cf.selectItem(out,"select distinct jxc_gysxx.gysmc c1,jxc_gysxx.gysmc c2 from jxc_ppgysdzb,jxc_ppxx,jxc_gysxx where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm and jxc_ppxx.pplb='1' and jxc_gysxx.cllx='1' and jxc_ppgysdzb.ssfgs='"+ssfgs+"' order by jxc_gysxx.gysmc","");
%> 
                </select>              </td>
            </tr>
            <tr> 
              <td colspan="2" height="2"> 
                <div align="center"> 
				  <input type="hidden" name="ssfgs" value="<%=ssfgs%>" >
                  <input type="button"  value="批量修改供应商" onClick="f_do(editform)">
                </div>              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.gysmcold)=="") {
		alert("请输入[原供应商]！");
		FormName.gysmcold.focus();
		return false;
	}
	if(	javaTrim(FormName.gysmcnew)=="") {
		alert("请输入[新供应商]！");
		FormName.gysmcnew.focus();
		return false;
	}

	if (FormName.gysmcold.value==FormName.gysmcnew.value)
	{
		alert("错误！[原供应商]与[新供应商]不能相同！");
		FormName.gysmcnew.focus();
		return false;
	}


	FormName.action="SaveEditTcGys.jsp";
	FormName.submit();
	return true;
}

</SCRIPT>
