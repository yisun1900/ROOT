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
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
String lrr=(String)session.getAttribute("yhmc");
%>


<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertXz_yplydjb.jsp" name="insertform" target="_blank">
  <div align="center">车辆加油登记</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#FF0000">*</font>所属分公司</td>
      <td width="35%">
        <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
        </select>
      </td>
      <td align="right" width="15%"><font color="#FF0000">*</font>汽车牌号</td>
      <td width="35%"> 
        <select name="qcph" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select qcph c1,qcph||'：'||qcxh c2 from xz_qcdm order by ssfgs,qcph","");
	}
	else{
		cf.selectItem(out,"select qcph c1,qcph||'：'||qcxh c2 from xz_qcdm where ssfgs='"+ssfgs+"' order by ssfgs,qcph","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#FF0000">*</font>油标号</td>
      <td width="35%"> 
        <select name="ybh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="90#">90#</option>
          <option value="91#">91#</option>
          <option value="92#">92#</option>
          <option value="93#">93#</option>
          <option value="94#">94#</option>
          <option value="95#">95#</option>
          <option value="96#">96#</option>
          <option value="97#">97#</option>
          <option value="98#">98#</option>
          <option value="99#">99#</option>
          <option value="柴油">柴油</option>
        </select>
      </td>
      <td align="right" width="15%"><font color="#FF0000">*</font>单价</td>
      <td width="35%">
        <input type="text" name="dj" value="" size="20" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#FF0000">*</font>加油数量</td>
      <td width="35%">
        <input type="text" name="lysl" value="" size="20" maxlength="9" >
      </td>
      <td align="right" width="15%">车辆里程数</td>
      <td width="35%">
        <input type="text" name="cllcs" value="" size="20" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#FF0000">*</font>加油人</td>
      <td width="35%"> 
        <input type="text" name="lyr" value="" size="20" maxlength="20" >
      </td>
      <td align="right" width="15%"><font color="#FF0000">*</font>加油日期</td>
      <td width="35%">
        <input type="text" name="lyrq" value="<%=cf.today()%>" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#FF0000">*</font><font color="#0000FF">录入人</font></td>
      <td width="35%"> 
        <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>
      </td>
      <td align="right" width="15%"><font color="#FF0000">*</font><font color="#0000FF">录入时间</font></td>
      <td width="35%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="71" rows="3"></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button" name="bc" value="存盘" onClick="f_do(insertform)">
        <input type="reset"  value="重输" name="reset">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.qcph)=="") {
		alert("请选择[汽车牌号]！");
		FormName.qcph.focus();
		return false;
	}
	if(	javaTrim(FormName.ybh)=="") {
		alert("请选择[油标号]！");
		FormName.ybh.focus();
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "单价"))) {
		return false;
	}
	if(	javaTrim(FormName.lysl)=="") {
		alert("请输入[加油数量]！");
		FormName.lysl.focus();
		return false;
	}
	if(!(isFloat(FormName.lysl, "加油数量"))) {
		return false;
	}
/*
	if(	javaTrim(FormName.cllcs)=="") {
		alert("请输入[车辆里程数]！");
		FormName.cllcs.focus();
		return false;
	}
*/
	if(!(isFloat(FormName.cllcs, "车辆里程数"))) {
		return false;
	}
	if(	javaTrim(FormName.lyrq)=="") {
		alert("请输入[加油日期]！");
		FormName.lyrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.lyrq, "加油日期"))) {
		return false;
	}
	if(	javaTrim(FormName.lyr)=="") {
		alert("请输入[加油人]！");
		FormName.lyr.focus();
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
	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>
