<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Dm_gzrlList.jsp" name="selectform">
<div align="center">工作日历</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">日期 从</td>
  <td><input type="text" name="rq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="rq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">年</td> 
  <td width="32%"><input type="text" name="nian" size="20" maxlength="4" ></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">月</td> 
  <td width="32%"> 
    <input type="text" name="yue" size="20" maxlength="2" >  </td>
  <td align="right" width="18%">日</td> 
  <td width="32%"> 
    <input type="text" name="ri" size="20" maxlength="2" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">节假日标志</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "jjrbz","Y+是&N+否","");
%>  </td>
  <td align="right" width="18%">节假日类型</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "jjrlx","1+周六&2+周日&3+节日&8+其它","");
%>  </td>
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
	if(!(isDatetime(FormName.rq, "日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rq2, "日期"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
