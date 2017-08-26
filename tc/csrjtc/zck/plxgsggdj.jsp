<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>批量修改施工队单价</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String[] cpbm = request.getParameterValues("cpbm");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"><strong> 批量修改施工队单价</strong></div>    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
            <tr bgcolor="#FFFFFF"> 
              <td width="19%">&nbsp;</td>
              <td width="81%" colspan="3"> 
                <input type="radio" name="jgqz" value="Y">
                结果取整 
                <input type="radio" name="jgqz" value="N">
                结果不取整 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%">&nbsp;</td>
              <td colspan="3"> 
                <p>施工队单价＝原施工队单价×系数
                  <input name="xs" type="text" size="10" maxlength="10">
                </p>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
			  <%
			  for (int i=0;i<cpbm.length ;i++ )
			  {
				  %>
					<input type="hidden" name="cpbm" value="<%=cpbm[i]%>"  >              
				  <%
			  }
			  %>
                <input type="button" name="Button" value="开始修改" onClick="plxg(selectform)" >              
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
function plxg(FormName,lx)//参数FormName:Form的名称
{
	if(	!radioChecked(FormName.jgqz)) {
		alert("请选择[结果取整]！");
		FormName.jgqz[0].focus();
		return false;
	}

	if(	javaTrim(FormName.xs)=="") {
		alert("请输入[系数]！");
		FormName.xs.focus();
		return false;
	}
	if(!(isFloat(FormName.xs, "系数"))) {
		return false;
	}


	if (!confirm("确实要修改吗?") )	
	{
		return;
	}

	FormName.action="SavePlxgsggdj.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
