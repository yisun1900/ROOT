<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String dwstr=cf.getItemData("select cqbm,cqmc,dqbm from dm_cqbm order by dqbm,cqbm");
%>

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

<form method="post" action="Dm_xqbmCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">小区编码</div>
              </td>
              <td width="35%"> 
                <input type="text" name="dm_xqbm_xqbm" size="20" maxlength="7" >
              </td>
              <td width="15%"> 
                <div align="right">小区名称</div>
              </td>
              <td width="35%"> 
                <input type="text" name="dm_xqbm_xqmc" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">地区编码</div>
              </td>
              <td width="35%"> 
                <select name="dm_xqbm_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(dm_xqbm_dqbm,dm_xqbm_cqbm,<%=dwstr%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">城区编码</div>
              </td>
              <td width="35%"> 
                <select name="dm_xqbm_cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">开发商</div>
              </td>
              <td width="35%"> 
                <input type="text" name="dm_xqbm_kfs" size="20" maxlength="50" >
              </td>
              <td width="15%"> 
                <div align="right">售楼电话</div>
              </td>
              <td width="35%"> 
                <input type="text" name="dm_xqbm_sldh" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">每平米均价 从</td>
              <td width="35%"> 
                <input type="text" name="dm_xqbm_mpmjj" size="20" maxlength="8" >
              </td>
              <td width="15%" align="right">到</td>
              <td width="35%"> 
                <input type="text" name="dm_xqbm_mpmjj2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">入住时间 从</div>
              </td>
              <td width="35%"> 
                <input type="text" name="dm_xqbm_rzsj" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">到</div>
              </td>
              <td width="35%"> 
                <input type="text" name="dm_xqbm_rzsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">用户登陆名</div>
              </td>
              <td width="35%"> 
                <input type="text" name="dm_xqbm_yhdlm" size="20" maxlength="16" >
              </td>
              <td width="15%"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%">&nbsp; </td>
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
	if(!(isNumber(FormName.dm_xqbm_mpmjj, "每平米均价"))) {
		return false;
	}
	if(!(isNumber(FormName.dm_xqbm_mpmjj2, "每平米均价"))) {
		return false;
	}
	if(!(isDatetime(FormName.dm_xqbm_rzsj, "入住时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.dm_xqbm_rzsj2, "入住时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
