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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 客服考评 </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Kfkp.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">考评时间 从</div>
              </td>
              <td width="32%"> 
                <input type="text" name="qssj" size="20" maxlength="10"  value="<%=cf.firstDay()%>" onKeyUp="keyGo(jzsj)">
              </td>
              <td width="15%"> 
                <div align="right">到 </div>
              </td>
              <td width="35%"> 
                <input type="text" name="jzsj" size="20" maxlength="10" value="<%=cf.today()%>">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">显示风格</td>
              <td colspan="3"> 
                <input type="radio" name="xsfg" value="1" checked>
                网页 
                <input type="radio" name="xsfg" value="2">
                EXCEL </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="客服考评 " onClick="f_do(selectform)">
                <input type="reset"  value="重输">
              </td>
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
	if(	javaTrim(FormName.qssj)=="") {
		alert("请选择[统计日期]！");
		FormName.qssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qssj, "统计日期"))) {
		return false;
	}
	if(	javaTrim(FormName.jzsj)=="") {
		alert("请选择[统计日期]！");
		FormName.jzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jzsj, "统计日期"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
