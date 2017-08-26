<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #000099}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCall_init.jsp" name="insertform" target="_blank">
<div align="center">初始化参数－录入</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>所属分公司</td>
  <td>

    <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','A0') and cxbz='N' order by dwbh","");
%>
    </select> 
	
	</td>
  
  <td align="right"><span class="STYLE1">*</span>用户编码</td>
    
  <td><input type="text" name="yhbm" value="" size="20" maxlength="30" ></td>

</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>本机号码</td> 
  <td width="32%"> 
    <input type="text" name="bjhm" value="" size="20" maxlength="30" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>Mac地址</td> 
  <td width="32%"> 
    <input type="text" name="mac" value="" size="20" maxlength="30" >  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>录音文件目录</td>
  <td colspan="3"><input type="text" name="lywjml" value="" size="73" maxlength="100" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td> 
  <td width="32%"><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td> 
  <td width="32%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td> 
  <td width="32%"><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.bjhm)=="") {
		alert("请输入[本机号码]！");
		FormName.bjhm.focus();
		return false;
	}
	if(	javaTrim(FormName.mac)=="") {
		alert("请输入[Mac地址]！");
		FormName.mac.focus();
		return false;
	}
	if(	javaTrim(FormName.yhbm)=="") {
		alert("请输入[用户编码]！");
		FormName.yhbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请输入[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.lywjml)=="") {
		alert("请输入[录音文件目录]！");
		FormName.lywjml.focus();
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
