<%@ page contentType="text/html;charset=GBK" %>
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
	String dwstr=cf.getItemData("select cqbm,cqmc,dqbm from dm_cqbm order by dqbm,cqbm");
%>

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

<form method="post" action="SaveInsertDm_xqbm.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">地区编码</div>
              </td>
              <td width="35%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(dqbm,cqbm,<%=dwstr%>)">
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
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">小区名称</td>
              <td colspan="3"> 
                <input type="text" name="xqmc" value="" size="73" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">开发商</td>
              <td colspan="3"> 
                <input type="text" name="kfs" value="" size="73" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">售楼电话</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sldh" value="" size="20" maxlength="50" >
              </td>
              <td width="15%"> 
                <div align="right">每平米均价</div>
              </td>
              <td width="35%"> 
                <input type="text" name="mpmjj" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">入住时间</div>
              </td>
              <td width="35%"> 
                <input type="text" name="rzsj" value="" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">用户登陆名</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="yhdlm" value="<%=yhdlm%>" size="20" maxlength="16" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区编码]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cqbm)=="") {
		alert("请选择[城区编码]！");
		FormName.cqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xqmc)=="") {
		alert("请输入[小区名称]！");
		FormName.xqmc.focus();
		return false;
	}
	if(	javaTrim(FormName.yhdlm)=="") {
		alert("请输入[用户登陆名]！");
		FormName.yhdlm.focus();
		return false;
	}
	if(!(isNumber(FormName.mpmjj, "每平米均价"))) {
		return false;
	}
	if(!(isDatetime(FormName.rzsj, "入住时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
