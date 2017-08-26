<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="98%">
  <tr>
    <td width="1%">&nbsp;</td>
    <td width="98%"> 
      <div align="center"> 请输入查询条件</div>
    </td>
    <td width="1%">&nbsp;</td>
  </tr>
  <tr>
    <td width="1%" height="64">&nbsp;</td>
    <td width="98%" height="64"> 
      <div align="center">

<form method="post" action="Sq_yhzList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">用户组编号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="yhzbh" size="24" maxlength="6" >
              </td>
              <td width="15%"> 
                <div align="right">用户组名称</div>
              </td>
              <td width="35%"> 
                <input type="text" name="yhzmc" size="24" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="15%" align="right">级别</td>
              <td colspan="3"><%
	cf.radioToken(out, "jb","1+普通&9+特殊&2+供应商","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" valign="top"> 
                <div align="right">用户组描述</div>
              </td>
              <td colspan="3"> 
                <textarea name="yhzms" cols="60" rows="5"></textarea>
              </td>
            </tr>
            <tr> 
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="查询" onClick="submit_onclick(selectform)">
                </div>
              </td>
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <input type="reset"  value="重输">
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
    <td width="1%" height="64">&nbsp;</td>
  </tr>
  <tr>
    <td width="1%">&nbsp;</td>
    <td width="98%">&nbsp;</td>
    <td width="1%">&nbsp;</td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function submit_onclick(FormName)//参数FormName:Form的名称
{
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
