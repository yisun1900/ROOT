<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String lrr=(String)session.getAttribute("yhdlm");
String dwlx=(String)session.getAttribute("dwlx");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
%>
<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入数据</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertQh_bjkgsdm.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">被监控公司编号</div>
  </td>
  <td width="35%"> 
    <input type="text" name="bjkgsbh" value="" size="20" maxlength="6" >
  </td>
  <td width="15%"> 
    <div align="right">被监控公司名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="bjkgsmc" value="" size="20" maxlength="30" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <p align="right">地区
  </td>
  <td width="35%"> 
 <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
 <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'","");
%> 
</select>  </td>
  <td width="15%"> 
    　
  </td>
  <td width="35%"> 
    　
  </td>
</tr>
            <tr align="center"> 
              <td colspan="4"> 
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
	if(	javaTrim(FormName.bjkgsbh)=="") {
		alert("请输入[被监控公司编号]！");
		FormName.bjkgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bjkgsmc)=="") {
		alert("请输入[被监控公司名称]！");
		FormName.bjkgsmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
