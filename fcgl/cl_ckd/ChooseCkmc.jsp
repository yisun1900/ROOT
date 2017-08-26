<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
</head>
<%
String ckph=request.getParameter("ckph");
String khbh=request.getParameter("khbh");
%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<div align="center"><font size="3"><b>选择出库仓库（出库批号：<%=ckph%>）</b></font> 
<form method="post" action="" name="insertform" target="_blank">
  <table border="1" cellspacing="0" cellpadding="1" width="80%" style='FONT-SIZE: 15px' >
    <tr > 
      <td  height="58" width="32%" align="right">仓库：</td>
      <td  height="58" width="68%"> 
          <select name="ckmc" style="FONT-SIZE:12PX;WIDTH:252PX" multiple size="10">
            <%
	cf.selectItem(out,"select distinct cl_djjmx.ckmc c1,ckmc c2 FROM cl_djjmx,cl_djj where cl_djjmx.czxh=cl_djj.czxh and cl_djj.khbh='"+khbh+"'","");
%> 
          </select>
      </td>
    </tr>
    <tr > 
      <td  height="47" colspan="2" align="center"> 
        <input type="hidden" name="ckph" value="<%=ckph%>" >
        <input type="hidden" name="khbh" value="<%=khbh%>" >
         <input type="button"  value="出库" onClick="f_do(insertform)">
      </td>
    </tr>
  </table>
</form>
</div>
</body>

</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!selectChecked(FormName.ckmc)) {
		alert("请选择出库仓库！");
		FormName.ckmc.focus();
		return false;
	}

	FormName.action="SaveDjjCk.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
