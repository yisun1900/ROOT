<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String ydqbm=request.getParameter("dqbm");
	String[] clbm = request.getParameterValues("clbm");
%>

<html>
<head>
<title>地区材料初始化</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {
	color: #FF0000;
	font-weight: bold;
	font-size: 18px;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">
        <p>地区材料初始化</p>
        <p class="STYLE1">注意：系统初始化地区材料，同时复制价格信息（如：销售价、结算价等）</p>
      </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="44%" align="right">所属地区</td>
              <td width="56%">
			<select name="dqbm" size="25" multiple style="FONT-SIZE:12PX;WIDTH:152PX" >
			<%
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
			%>
              </select>			  
			  </td>
            </tr>
            <tr> 
              <td height="2" colspan="2" align="center">
 <%
	for (int i=0;i<clbm.length ;i++ )
	{
		out.println("<input type=\"hidden\" name=\"clbm\"  value=\""+clbm[i]+"\">");
	}
%> 
					<input type="hidden" name="ydqbm"  value="<%=ydqbm%>">
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	!selectChecked(FormName.dqbm)) {
		alert("请选择[所属地区]！");
		FormName.dqbm.focus();
		return false;
	}
	
	FormName.action="SaveChooseDqbm.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
