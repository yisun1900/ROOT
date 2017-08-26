<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Dm_tsyybmList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">投诉报修大类</div>
              </td>
              <td width="31%"> 
                <select name="dm_tsyybm_tslxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tslxbm,tslxmc from dm_tslxbm order by tslxbm","");
%> 
                </select>
              </td>
              <td width="20%"> 
                <div align="right">投诉报修小类</div>
              </td>
              <td width="30%"> 
                <select name="dm_tsyybm_tsxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tsxlbm,tsxlmc from dm_tsxlbm order by tsxlbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">投诉报修原因编码</div>
              </td>
              <td width="31%"> 
                <input type="text" name="dm_tsyybm_tsyybm" size="20" maxlength="6" >
              </td>
              <td width="20%"> 
                <div align="right">投诉报修原因名称</div>
              </td>
              <td width="30%"> 
                <input type="text" name="dm_tsyybm_tsyymc" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">显示顺序</div>
              </td>
              <td width="31%"> 
                <input type="text" name="dm_tsyybm_px" size="20" maxlength="8" >
              </td>
              <td width="20%"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="30%">&nbsp; </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">
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
	if(!(isNumber(FormName.dm_tsyybm_px, "显示顺序"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
