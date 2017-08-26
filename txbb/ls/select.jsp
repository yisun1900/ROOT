<%@ page contentType="text/html;charset=GBK" %>

<html>
<head>
<title>日期格式</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<!-- 时间控件 -->
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<LINK HREF='/js/JSCalendar.css' REL='stylesheet' TYPE='text/css'>
</head>

<body bgcolor="#FFFFFF">
<table width="30%" align="center">
  <tr>
    <td width="30%" height="18"> 
    </td>
  </tr>
  <tr>
    <td width="30%" height="94" > 
      <div align="center">

<form method="post" action="xxtlist.jsp" name="selectform">
<center>按天统计销售（双击可选择时间）<br></center>
<p>
报表样式:<select name="xsfs" style="FONT-SIZE:12px;WIDTH:152px">
<option value="1">线图</option>
<option value="2">柱图</option>
</select>
</p>
<p>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> <div align="right">开始日期</div></td>
              <td width="35%"> <input name="time1" id="time1" ondblclick="JSCalendar(this)" size="15" maxlength="10">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> <div align="right">截至日期</div></td>
              <td width="35%"> <input name="time2" id="time2" ondblclick="JSCalendar(this)" size="15" maxlength="10">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> <div align="right"> 
                  <input name="button" type="button"  value="生成报表" onClick="f_do(selectform)">
                </div></td>
              <td width="35%"><input name="reset" type="reset"  value=" 重 输 "> </td>
            </tr>
          </table>
		  </form>  
	  </div>
    </td>
  </tr>
</table>
</p>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
function f_do(FormName)
{
	if(	javaTrim(FormName.time1)=="") {
			alert("请输入[开始日期]！");
			FormName.time1.focus();
			return false;
	}
	if(	javaTrim(FormName.time2)=="") {
		alert("请输入[截至日期]！");
		FormName.time2.focus();
		return false;
	}
	if(!(isDatetime(FormName.time1, "开始日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.time2, "截至日期"))) {
		return false;
	}
	FormName.submit();
	return true;
}
</SCRIPT>