<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%

String dwbh=(String)session.getAttribute("dwbh");

%>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 
        <p align="center"> 
      </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF" align="center"> 
              <td colspan="2" height="48">查询日期<font color="red">（注：以合同签约时间为准）</font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="42%" align="right">从</td>
              <td width="58%"> 
                <input type="text" name="cxrq" size="20" value="<%=cf.firstDay()%>" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="42%" align="right">到</td>
              <td width="58%"> 
                <input type="text" name="cxrq2" size="20" value="<%=cf.today()%>" maxlength="10" >
              </td>
            </tr>
			<tr bgcolor="#FFFFFF">
              <td width="19%" align="right">展厅家居顾问</td>
              <td width="31%"> 
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc,yhmc  from sq_yhxx where zwbm='08'","");
%> 
                </select>
              </td>
            </tr>

            <tr align="center"> 
              <td colspan="2" height="66"> 
                <input type="button"  value="项目专员统计" onClick="f_do(selectform)">
				<input type="button"  value="家居顾问" onClick="f_do1(selectform)">
				<input type="button"  value="家居顾问主材实收款" onClick="f_do2(selectform)">
				<input type="button"  value="主材完结额" onClick="f_do3(selectform)">
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
	if(!(isDatetime(FormName.cxrq, "查询日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.cxrq2, "查询日期"))) {
		return false;
	}
    FormName.action="Xm_zyjgCxlist.jsp";
	FormName.submit();
	return true;
}
function f_do1(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.cxrq, "查询日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.cxrq2, "查询日期"))) {
		return false;
	}
	FormName.action="jjgwList.jsp";
	FormName.submit();
	return true;
}
function f_do2(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.cxrq, "查询日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.cxrq2, "查询日期"))) {
		return false;
	}
	FormName.action="Jjzcssk.jsp";
	FormName.submit();
	return true;
}
function f_do3(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.cxrq, "查询日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.cxrq2, "查询日期"))) {
		return false;
	}
	FormName.action="Jjzcwjetj.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
