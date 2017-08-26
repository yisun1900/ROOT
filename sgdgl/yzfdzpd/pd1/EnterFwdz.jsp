<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String fwdz=null;
	fwdz=cf.GB2Uni(request.getParameter("fwdz"));
%>
<body bgcolor="#FFFFFF" >
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请输入客户信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="FwdzCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">房屋地址</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="fwdz" size="56" maxlength="100" value="<%=fwdz%>" onkeyup="keyGo(butt)" >
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="继续" name="butt" onClick="f_do(selectform)">
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
	if(javaTrim(FormName.fwdz)=="") {
		alert("请输入[房屋地址]！");
		FormName.khxm.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
