<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="commonFunction" scope="page" class="ybl.common.CommonFunction"/>


<html>
<head>
<title>生成新的DataWindow</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="./js/css.css">
</head>
<body bgcolor="#FFFFFF">

<table width="100%" border="0"  class="p5">
  <tr align="center"> 
    <td  > 
      <form method="post" action="NewChooseTableCol.jsp" name="selectTableForm">
          
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF" align="center"> 
            <td colspan="3" bgcolor="#CCCCFF" height="25"><b><font size="2">生成新的DataWindow->请选择数据表</font></b></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td align="center" width="43%">选择表<BR> 
              <select name="selectedTable" style="FONT-SIZE:12px;WIDTH:220px" size="18" multiple  ondblclick="moveItem(selectedTable,table_name)" >
                <%
		commonFunction.selectItem(out,"select table_name,table_name||'('||NVL(comments,'无说明')||')' from user_tab_comments ","");
%> 
              </select>
            </td>
            <td width="13%" align="center"> 
              <p>
                <input type="button"  value="&lt;===" onClick="moveItem(table_name,selectedTable)">
              </p>
              <p> 
                <input type="button"  value="===&gt;" onClick="moveItem(selectedTable,table_name)">
              </p>
            </td>
            <td width="44%" align="center"> 被选表名称<BR>
			  <select name="table_name" style="FONT-SIZE:12px;WIDTH:220px" size="18" multiple  ondblclick="moveItem(table_name,selectedTable)">
              </select>
            </td>
          </tr>
          <tr align="center"> 
            <td colspan="3" >
              <input type="button" value="选择列" onClick="f_xzl(selectTableForm)" name="button">
              <input type="reset" value="重选" name="reset">
            </td>
          </tr>
        </table>
      </form>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
    </td>
  </tr>
</table>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_xzl(FormName)//参数FormName:Form的名称
{
	selectAll(FormName.table_name);

	if(	!selectChecked(FormName.table_name)) 
	{
		alert("请选择[表名称]！");
		FormName.table_name.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
