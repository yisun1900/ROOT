<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String lrr=(String)session.getAttribute("yhmc");

String xqbh=cf.GB2Uni(request.getParameter("xqbh"));
String xqmc=cf.GB2Uni(request.getParameter("xqmc"));
%>
<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000FF}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">录入－－楼盘团购情况</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertYx_lptgqk.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><span class="STYLE1">小区编号</span></td>
              <td colspan="3"><input type="text" name="xqbh" value="<%=xqbh%>" size="20" maxlength="8" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#FFFFFF"> 
                <font color="#CC0000">*</font><span class="STYLE1">小区名称</span> </td>
              <td colspan="3"> 
                <input type="text" name="xqmc" value="<%=xqmc%>" size="70" maxlength="50" readonly>              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td colspan="4" align="center">团购单位 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">团购单位</td>
              <td colspan="3"> 
                <input type="text" name="ffdw" value="" size="70" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                单位地址              </td>
              <td colspan="3"> 
                <input type="text" name="dwdz" value="" size="70" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                单位电话              </td>
              <td width="31%"> 
                <input type="text" name="dwdh" value="" size="20" maxlength="40" >              </td>
              <td width="16%" align="right"> 
                联系人              </td>
              <td width="34%"> 
              <input type="text" name="lxr" value="" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">团购楼号</td>
              <td colspan="3"><input type="text" name="tglh" value="" size="70" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">团购套数</td>
              <td><input type="text" name="tgts" value="" size="20" maxlength="8" >              </td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><font color="#0000FF">录入人</font> </td>
              <td><input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>
              </td>
              <td align="right"><font color="#CC0000">*</font><font color="#0000FF">录入时间 </font></td>
              <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            

            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">              </td>
            </tr>
        </table>
</form>
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xqbh)=="") {
		alert("请输入[小区编号]！");
		FormName.xqbh.focus();
		return false;
	}
	if(!(isNumber(FormName.xqbh, "小区编号"))) {
		return false;
	}
	if(	javaTrim(FormName.xqmc)=="") {
		alert("请输入[小区名称]！");
		FormName.xqmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ffdw)=="") {
		alert("请输入[团购单位]！");
		FormName.ffdw.focus();
		return false;
	}
	if(	javaTrim(FormName.dwdz)=="") {
		alert("请输入[单位地址]！");
		FormName.dwdz.focus();
		return false;
	}
	if(	javaTrim(FormName.dwdh)=="") {
		alert("请输入[单位电话]！");
		FormName.dwdh.focus();
		return false;
	}
	if(	javaTrim(FormName.lxr)=="") {
		alert("请输入[单位联系人]！");
		FormName.lxr.focus();
		return false;
	}
	if(	javaTrim(FormName.tglh)=="") {
		alert("请输入[团购楼号]！");
		FormName.tglh.focus();
		return false;
	}
	if(	javaTrim(FormName.tgts)=="") {
		alert("请输入[团购套数]！");
		FormName.tgts.focus();
		return false;
	}
	if(!(isNumber(FormName.tgts, "团购套数"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
