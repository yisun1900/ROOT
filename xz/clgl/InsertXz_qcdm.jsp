<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String lrr=(String)session.getAttribute("yhdlm");
String dwlx=(String)session.getAttribute("dwlx");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
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

<form method="post" action="SaveInsertXz_qcdm.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">汽车代码</div>
              </td>
              <td width="35%"> 
                <input type="text" name="qcdm" value="" size="20" maxlength="6" >
              </td>
              <td width="15%"> 
                <div align="right">汽车牌号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="qcph" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">汽车型号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="qcxh" value="" size="20" maxlength="30" >
              </td>
              <td width="15%"> 
                <div align="right">购车时间</div>
              </td>
              <td width="35%"> 
                <input type="text" name="gcsj" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">已行使公里数</div>
              </td>
              <td width="35%"> 
                <input type="text" name="yxsgls" value="" size="20" maxlength="7" >
              </td>
              <td width="15%"> 
                <div align="right">司机姓名</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sjxm" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">备注</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="72" rows="3"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="15%"> 
                <div align="right">所属分公司</div>
              </td>
              <td width="35%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
%>
                </select>
              </td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
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
	if(	javaTrim(FormName.qcdm)=="") {
		alert("请输入[汽车代码]！");
		FormName.qcdm.focus();
		return false;
	}
	if(	javaTrim(FormName.qcph)=="") {
		alert("请输入[汽车牌号]！");
		FormName.qcph.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(!(isDatetime(FormName.gcsj, "购车时间"))) {
	return false;
}
	if(!(isFloat(FormName.yxsgls, "行使公里数"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
