<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.util.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
String yhdlm=(String)session.getAttribute("yhdlm");
String  ls_sql=null;
		ls_sql =" select rs_shsq.ztbm,ztmc ";
		ls_sql+=" from rs_shsq,sq_yhssz,rs_ztbm ";
		ls_sql+=" where rs_shsq.yhzbh=sq_yhssz.yhzbh and sq_yhssz.yhdlm='"+yhdlm+"'";
		ls_sql+=" and rs_ztbm.ztlx='03' and rs_ztbm.ztbm=rs_shsq.ztbm";
		ls_sql+=" order by rs_shsq.ztbm";
%>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Rs_ygbdsqbSpList.jsp" name="selectform">
<div align="center">人事变动－审批</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="35%">可审核状态</td> 
  <td width="65%"> 
        <select name="ztbm" style="FONT-SIZE:14px;WIDTH:224px" size="6">
          <option value=""></option>
          <%
	cf.selectItem(out,ls_sql,"");
%> 
        </select>
  </td>
</tr>
<tr align="center"> 
  <td colspan="2"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
  </td>
</tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
