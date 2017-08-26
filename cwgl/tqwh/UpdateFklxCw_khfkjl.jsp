<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<%

String[] fkxh=request.getParameterValues("fkxh");

%>

<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">把【支付方式】转换成【付款类型】</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveUpdateFklxCw_khfkjl.jsp" name="insertform"  >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

            <tr bgcolor="#FFFFFF"> 
              <td width="46%" align="right"><font color="#FF0000">*</font>付款类型</td>
              <td width="54%"> 
                <select name="fklxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
					 <OPTION  value=""></OPTION>
                  <%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm where fkdl not in('1','2') order by fklxbm","");
%> 
                </select>              </td>
            </tr>
            
            <tr> 
              <td colspan="2" height="2"> 
                <div align="center"> 
				  <%
				  for (int i=0;i<fkxh.length ;i++ )
				  {
					  %>
					  <input type="hidden" name="fkxh"  value="<%=fkxh[i]%>" >
					  <%
				  }
				  %>
                  <input type="button"  value="保存" onClick="f_do(insertform)">
                </div>              </td>
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

	if(	javaTrim(FormName.fklxbm)=="") {
		alert("请选择[付款类型]！");
		FormName.fklxbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
