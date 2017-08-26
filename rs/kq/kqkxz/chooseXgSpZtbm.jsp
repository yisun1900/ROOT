<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>选择需要审核的状态</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String  ls_sql=null;
		ls_sql =" select rs_shsq.ztbm,ztmc ";
		ls_sql+=" from rs_shsq,sq_yhssz,rs_ztbm ";
		ls_sql+=" where rs_shsq.yhzbh=sq_yhssz.yhzbh and sq_yhssz.yhdlm='"+yhdlm+"'";
		ls_sql+=" and rs_ztbm.ztlx='09' and rs_ztbm.ztbm=rs_shsq.ztbm";

%>

<body bgcolor="#FFFFFF" text="#000000">
<FORM method="post" action="Rs_kqksqdXgSpList.jsp" name="insertform">
<table width="100%" border="0">
  <tr>
      <td align="center" height="39">选择－需修改的审批状态</td>
  </tr>
  <tr>
    <td align="center" height="54"> 
        <select name="ztbm" style="FONT-SIZE:14px;WIDTH:224px" size="6">
          <option value=""></option>
          <%
	cf.selectItem(out,ls_sql,"");
%> 
        </select>
    </td>
  </tr>
  <tr>
    <td align="center" height="75"> 
      <input type="button"  value="继续" onClick="save_onclick(insertform)">
    </td>
  </tr>
</table>
</FORM>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function save_onclick(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ztbm)=="") {
		alert("请选择[需修改的审批状态]！");
		FormName.ztbm.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
