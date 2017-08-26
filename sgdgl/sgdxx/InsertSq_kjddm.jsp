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
String sgd=cf.GB2Uni(request.getParameter("sgd"));
String ssfgs=cf.executeQuery("select ssfgs from sq_sgd where sgd='"+sgd+"'");
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入施工队可接单店面</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertSq_kjddm.jsp" name="insertform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr align="center"> 
	  <td colspan="2"> 
		<input type="button"  value="存盘" onClick="f_do(insertform)">
		<input type="reset"  value="重输" name="reset">              </td>
	</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">施工队</td>
  <td><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="47%" align="right">可接单店面</td>
  <td width="53%"><select name="dwbh" size="25" multiple style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.mutilSelectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","select dwbh from sq_kjddm where sgd='"+sgd+"'");
%>
  </select></td>
  </tr>
            <tr align="center"> 
              <td colspan="2"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">              </td>
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
	if(	javaTrim(FormName.sgd)=="") {
		alert("请选择[施工队]！");
		FormName.sgd.focus();
		return false;
	}
	if(	!selectChecked(FormName.dwbh)) {
		alert("请输入[店面]！");
		FormName.dwbh.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
