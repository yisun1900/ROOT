<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String cgbm=request.getParameter("cgbm");
String cgmc=cf.GB2Uni(request.getParameter("cgmc"));

%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入吊柜价格</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertJc_dgjgb.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">橱柜编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="cgbm" value="<%=cgbm%>" size="20" maxlength="5" readonly>
  </td>
  <td width="15%"> 
                <div align="right">橱柜名称</div>
  </td>
              <td width="35%">
                <input type="text" name="cgmc" value="<%=cgmc%>" size="20" maxlength="50" readonly>
              </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
                <div align="right">吊柜高度区间</div>
  </td>
              <td width="35%">
                <select name="dggdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dggdbm,dggdmc from jdm_dggdbm order by dggdbm","");
%> 
                </select>
              </td>
  <td width="15%"> 
                <div align="right">吊柜进深区间</div>
  </td>
              <td width="35%">
                <select name="dgjsbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dgjsbm,dgjsmc from jdm_dgjsbm order by dgjsbm","");
%> 
                </select>
              </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
                <div align="right">零售价</div>
  </td>
              <td width="35%">
                <input type="text" name="lsj" value="" size="20" maxlength="9" >
              </td>
  <td width="15%"> 
                <div align="right">优惠价</div>
  </td>
  <td width="35%">
                <input type="text" name="yhj" value="" size="20" maxlength="9" >
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
	if(	javaTrim(FormName.cgbm)=="") {
		alert("请输入[橱柜编码]！");
		FormName.cgbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dggdbm)=="") {
		alert("请选择[吊柜高度区间]！");
		FormName.dggdbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dgjsbm)=="") {
		alert("请选择[吊柜进深区间]！");
		FormName.dgjsbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lsj)=="") {
		alert("请输入[零售价]！");
		FormName.lsj.focus();
		return false;
	}
	if(!(isFloat(FormName.lsj, "零售价"))) {
		return false;
	}
	if(	javaTrim(FormName.yhj)=="") {
		alert("请输入[优惠价]！");
		FormName.yhj.focus();
		return false;
	}
	if(!(isFloat(FormName.yhj, "优惠价"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
