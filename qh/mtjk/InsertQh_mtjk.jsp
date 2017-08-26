<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=(String)session.getAttribute("dqbm");
String dwbh=(String)session.getAttribute("dwbh");

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

<form method="post" action="SaveInsertQh_mtjk.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="font-size: 12" bgcolor="#999999" cellpadding="2" cellspacing="2" height="72">
<tr bgcolor="#FFFFFF">
  
  <td width="15%" height="25"> 
    <div align="right">被监控公司名称</div>
  </td>
  <td width="35%" height="25"> 
    <select name="bjkgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjkgsbh,bjkgsmc from qh_bjkgsdm where dqbm='"+dqbm+"'  order by bjkgsbh","");
%>
    </select>
  </td>
   <td width="15%" height="25"> 
    <div align="right">填表单位名称</div>
  </td>
   <td width="35%" height="25"> 
    <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" height="25"> 
    <div align="right">广告形式</div>
  </td>
  <td width="35%" height="25"> 
    <select name="xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select xxlybm,xxlymc from dm_xxlybm order by xxlybm","");
%>
    </select>
  </td>
  <td width="15%" height="25"> 
    <div align="right">播出时间</div>
  </td>
  <td width="35%" height="25"> 
    <input type="text" name="bcsj" value=<%=cf.today()%> size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" height="25"> 
    <div align="right">监播人</div>
  </td>
  <td width="35%" height="25"> 
    <input type="text" name="gggs" value="" size="20" maxlength="30" >
  </td>
  <td width="15%" height="25"> 
    <div align="right">预计价格</div>
  </td>
  <td width="35%" height="25"> 
    <input type="text" name="yjjg" value="" size="20" maxlength="9" >元
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" height="25"> 
    <div align="right">备注</div>
  </td>
  <td width="85%" height="25" bgcolor="#FFFFFF" colspan="3"> 
    <textarea name="bz" cols="72" rows="10"></textarea>
  </td>

 
</tr>
            <tr align="center"> 
              <td colspan="4" height="27"> 
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
		alert("请输入[被监控公司名称]！");
		FormName.bjkgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xxlybm)=="") {
		alert("请选择[广告形式]！");
		FormName.xxlybm.focus();
		return false;
	}
	if(!(isDatetime(FormName.bcsj, "播出时间"))) {
		return false;
	}
	if(!(isFloat(FormName.yjjg, "预计价格"))) {
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[单位编号]！");
		FormName.dwbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
