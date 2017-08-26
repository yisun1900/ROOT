<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
%>
<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入数据</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertQh_lfcxdjb1.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">登记日期</div>
              </td>
              <td width="35%"> 
                <input type="text" name="djrq" value="<%=cf.today()%>" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">赠品内容</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zpnr" value="" size="30" maxlength="50" >
              </td>
              <td width="15%"> 
                <div align="right">经手人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="jsr" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%">
                <div align="right">备注</div>
              </td>
              <td colspan="3">
                <textarea name="bz" cols="81" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
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

	if(	javaTrim(FormName.khbh)=="") {
		alert("请选择[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zpnr)=="") {
		alert("请输入[赠品内容]！");
		FormName.zpnr.focus();
		return false;
	}
	if(	javaTrim(FormName.jsr)=="") {
		alert("请输入[经手人]！");
		FormName.jsr.focus();
		return false;
	}
	if(!(isDatetime(FormName.djrq, "登记日期"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
