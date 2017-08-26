<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>参加活动店面</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));
String cxhdmc=cf.GB2Uni(request.getParameter("cxhdmc"));
String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">参加促销活动店面(<%=cxhdmc%>)</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="33%">参加活动店面</td>
              <td width="67%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:352PX" size="20" multiple>
          <%
	cf.mutilSelectItem(out,"select dwbh c1,dwmc c2 from sq_dwxx where ssfgs='"+fgsbh+"' and cxbz='N' and dwlx='F2' order by dwbh","select dwbh from jc_cxhddm where cxhdbm='"+cxhdbm+"'");
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td colspan="2" height="2"> 
                <div align="center"> 
				<input type="hidden" name="cxhdbm" value="<%=cxhdbm%>">
                  <input type="button"  value="保存" onClick="f_do(editform)">
                </div>
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
	if(	!selectChecked(FormName.dwbh)) {
		alert("请选择[参加活动店面]！");
		FormName.dwbh.focus();
		return false;
	}

	FormName.action="SaveInsertJc_cxhddm.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
