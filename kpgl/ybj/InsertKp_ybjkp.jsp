<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
String yhdlm=(String)session.getAttribute("yhdlm");

%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 样板间考评</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">考评起始时间</div>
              </td>
              <td width="32%"> 
                <input type="text" name="qssj" value="2004-05-01" size="20" maxlength="10" >
              </td>
              <td width="18%"> 
                <div align="right">考评截止时间</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jzsj" value="<%=cf.today()%>" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">考评人</font></div>
              </td>
              <td width="32%">
                <input type="text" name="kpr" value="<%=yhdlm%>" size="20" maxlength="20" readonly>
              </td>
              <td width="18%"> 
                <div align="right"></div>
              </td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
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
	if(	javaTrim(FormName.qssj)=="") {
		alert("请输入[考评起始时间]！");
		FormName.qssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qssj, "考评起始时间"))) {
		return false;
	}
	if(	javaTrim(FormName.jzsj)=="") {
		alert("请输入[考评截止时间]！");
		FormName.jzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jzsj, "考评截止时间"))) {
		return false;
	}
	if(	javaTrim(FormName.kpr)=="") {
		alert("请输入[考评人]！");
		FormName.kpr.focus();
		return false;
	}

	FormName.action="SaveInsertKp_ybjkp.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
