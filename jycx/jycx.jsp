<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>

<title>简便查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
    <tr> 
      <td colspan="2" height="64"> 
        <div align="center">
          <h2><font face="宋体" color="#008080">简要查询</font></h2>
        </div>
      </td>
    </tr>
    <tr align="center"> 
      <td height="115" colspan="2"> 
        <p> 
          <input type="radio" name="radiobutton" value="1" checked>
          按设计师 
          <input type="radio" name="radiobutton" value="2">
          按施工队 
          <input type="radio" name="radiobutton" value="3">
          按小区 </p>
        <p> 
          <input type="button"  value="开始查询" onClick="f_do(selectform,radiobutton)" name="button">
        </p>
      </td>
    </tr>
  </table>
  <p>
  
  </p>
</form>
</body>
</html>
<SCRIPT language=javascript >

function f_do(FormName,radioName)//参数FormName:Form的名称
{
	
	
	if (radioName[0].checked)
	{
		FormName.action="SelectCxCrm_khxxSjs.jsp";
	}
	if (radioName[1].checked)
	{
		FormName.action="SelectCxCrm_khxxSgd.jsp";
	}
	if (radioName[2].checked)
	{
		FormName.action="SelectCxCrm_khxxXq.jsp";
	}
	
	FormName.submit();
	return true;
}



</SCRIPT>
