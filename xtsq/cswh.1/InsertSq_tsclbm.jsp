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
String dwbh=request.getParameter("dwbh");
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">可处理投诉部门</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertSq_tsclbm.jsp" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="43%" align="right">分公司</td>
              <td width="57%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="43%"> 
                <div align="right">可处理投诉部门</div>
              </td>
              <td width="57%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:252PX" size="37" multiple>
                  <%
	cf.mutilSelectItem(out,"select a.dwbh,a.dwmc||'（'||b.dwmc||'）' from sq_dwxx a,sq_dwxx b where a.ssfgs=b.dwbh and a.cxbz='N' order by a.ssfgs,a.dwlx,a.dwbh","select dwbh from sq_tsclbm where ssfgs='"+dwbh+"'");
%> 
                </select>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="2"> 
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	!selectChecked(FormName.dwbh)) {
		alert("请输入[处理投诉部门]！");
		FormName.dwbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
