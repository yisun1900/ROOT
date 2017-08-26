<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>


<%
String dwbh=request.getParameter("dwbh");
%>

<html>
<head>
<title>无标题文档</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="fk_save.jsp">
  <table width="100%" border="0">
    <tr> 
      <td width="94%"> 
        <center>
          水质分析卡发放 
        </center>
      </td>
    </tr>
    <tr> 
      <td width="94%"> 
        <table width="100%" border="1" cellpadding="1" cellspacing="1" align="center" style="FONT-SIZE:12">
          <tr> 
            <td width="42%"> 
              <div align="right">收卡单位</div>
            </td>
            <td width="58%"> 
        <select name="dwbh" style="FONT-SIZE:12px;WIDTH:152px" >
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
        </select>
            </td>
          </tr>
          <tr> 
            <td width="42%" align="right">卡号前缀</td>
            <td width="58%"> 
              <input type="text" name="khqz" maxlength="10" value=""  size="20">
            </td>
          </tr>
          <tr>
            <td width="42%" align="right">卡号长度</td>
            <td width="58%">
              <input type="text" name="khcd" maxlength="10" size="20">
            </td>
          </tr>
          <tr> 
            <td width="42%"> 
              <div align="right">卡号起始值</div>
            </td>
            <td width="58%"> 
              <input type="text" name="qsh" maxLength="5">
            </td>
          </tr>
          <tr> 
            <td width="42%"> 
              <div align="right">卡号终止值</div>
            </td>
            <td width="58%"> 
              <input type="text" name="zzh" maxLength="5">
            </td>
          </tr>
          <tr> 
            <td width="42%"> 
              <div align="right">卡的类别</div>
            </td>
            <td width="58%"> 
              <select name="kdlb" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hyjbbh,hyjb from hy_hyjbb order by hyjbbh","");
%> 
              </select>
            </td>
          </tr>
          <tr> 
            <td width="42%"> 
              <div align="right">&nbsp;</div>
            </td>
            <td width="58%"> 
              <center>
                <input type="button" name="Submit" value="发卡" onClick="isValid(form1)">
              </center>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT LANGUAGE="JavaScript" src="/js/validate.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
<!--
function isValid(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khqz)=="") {
		alert("请输入[卡号前缀]！");
		FormName.khqz.focus();
		return false;
	}
	if(	javaTrim(FormName.khcd)=="") {
		alert("请输入[卡号长度]！");
		FormName.khcd.focus();
		return false;
	}
	if(!(isNumber(FormName.khcd, "卡号长度"))) {
		return false;
	}

	if(javaTrim(FormName.qsh)==""){
		alert("请输入[卡号起始值]！");
		FormName.qsh.focus();
		return false;
	}
	if(!(isNumber(FormName.qsh, "卡号起始值"))) {
		return false;
	}

	if(javaTrim(FormName.zzh)==""){
		alert("请输入[卡号终止值]！");
		FormName.zzh.focus();
		return false;
	}
	if(!(isNumber(FormName.zzh, "卡号终止值"))) {
		return false;
	}

	if(parseInt(FormName.qsh.value)>parseInt(FormName.zzh.value)){
		alert("起始号码不能大于终止号码");
		FormName.qsh.value="";
		FormName.zzh.value="";
		FormName.qsh.focus();
		return false;
	}
	if(javaTrim(FormName.kdlb)==""){
		alert("请输入[卡的类别]！");
		FormName.kdlb.focus();
		return false;
	}

	FormName.submit();
	return true;
}

//-->
</SCRIPT>