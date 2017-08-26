<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_khdcwtList.jsp" name="selectform">
<div align="center">客户调查问题－维护</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">问题编号</td>
      <td width="32%"> 
        <input type="text" name="wtbh" size="20" maxlength="8" >
      </td>
      <td align="right" width="18%">问题名称</td>
      <td width="32%"> 
        <input type="text" name="wtmc" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">是否可多选</td>
      <td width="32%"> <%
	cf.radioToken(out, "sfkdx","1+多选&2+单选&3+写说明","");
%> </td>
      <td align="right" width="18%">有效标志</td>
      <td width="32%"> <%
	cf.radioToken(out, "yxbz","Y+有效&N+无效","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%">发布时间 从</td>
      <td width="32%"> 
        <input type="text" name="fbsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="fbsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">发布人</td>
      <td width="32%"> 
        <input type="text" name="fbr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
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
	if(!(isNumber(FormName.wtbh, "问题编号"))) {
		return false;
	}
	if(!(isDatetime(FormName.fbsj, "发布时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.fbsj2, "发布时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
