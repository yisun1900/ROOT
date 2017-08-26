<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String yhdlm=(String)session.getAttribute("yhdlm");
%>

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

<form method="post" action="SaveInsertCrm_zjsjk.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">专家库类型</div>
              </td>
              <td width="35%">
                <select name="zjlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zjlxbm,zjlxmc from dm_zjlxbm order by zjlxbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right"></div>
              </td>
              <td width="35%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">录入日期</div>
              </td>
              <td width="35%"> 
                <input type="text" name="lrrq" value="<%=cf.today()%>" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">录入人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="yhdlm" value="<%=yhdlm%>" size="20" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="15%" align="right">标题</td>
              <td colspan="3">
                <input type="text" name="bt" value="" size="57" maxlength="40" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">内容</td>
              <td colspan="3"> 
                <textarea name="nr" cols="55" rows="3"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
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
	if(	javaTrim(FormName.zjlxbm)=="") {
		alert("请选择[专家库类型]！");
		FormName.zjlxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bt)=="") {
		alert("请输入[标题]！");
		FormName.bt.focus();
		return false;
	}
	if(	javaTrim(FormName.nr)=="") {
		alert("请输入[内容]！");
		FormName.nr.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrrq, "录入日期"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
