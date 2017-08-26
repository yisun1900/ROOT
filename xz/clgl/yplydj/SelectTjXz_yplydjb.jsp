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
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
String lrr=(String)session.getAttribute("yhmc");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="Xz_yplydjbTjList.jsp" name="selectform">
  <div align="center">车辆加油统计</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">汽车牌号</td>
      <td width="31%"> 
        <select name="xz_yplydjb_qcph" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select qcph c1,qcph||'：'||qcxh c2 from xz_qcdm order by qcph","");
	}
	else{
		cf.selectItem(out,"select qcph c1,qcph||'：'||qcxh c2 from xz_qcdm where ssfgs='"+ssfgs+"' order by qcph","");
	}
%> 
        </select>
      </td>
      <td align="right" width="17%">油标号</td>
      <td width="33%"> 
        <select name="xz_yplydjb_ybh" style="FONT-SIZE:12PX;WIDTH:152PX">
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
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">加油日期 从</td>
      <td width="31%"> 
        <input type="text" name="xz_yplydjb_lyrq" size="20" maxlength="10" >
      </td>
      <td align="right" width="17%">到</td>
      <td width="33%"> 
        <input type="text" name="xz_yplydjb_lyrq2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">加油数量 从</td>
      <td width="31%"> 
        <input type="text" name="xz_yplydjb_lysl" size="20" maxlength="9" >
      </td>
      <td align="right" width="17%">到</td>
      <td width="33%"> 
        <input type="text" name="xz_yplydjb_lysl2" size="20" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">加油人</td>
      <td width="31%"> 
        <input type="text" name="xz_yplydjb_lyr" size="20" maxlength="20" >
      </td>
      <td align="right" width="17%">所属分公司</td>
      <td width="33%"> 
        <select name="xz_yplydjb_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
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
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">录入人</td>
      <td width="31%"> 
        <input type="text" name="xz_yplydjb_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="17%">录入时间</td>
      <td width="33%"> 
        <input type="text" name="xz_yplydjb_lrsj" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="19%">车辆加油统计</td>
      <td colspan="3"> 第一列 
        <input type="hidden" name="tj1name" value="">
        <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
          <option value=""></option>
          <option value="dwmc">所属分公司</option>
          <option value="qcph">汽车牌号</option>
          <option value="lyrq">加油日期</option>
          <option value="lyr">加油人</option>
          <option value="ybh">油标号</option>
        </select>
        第二列 
        <input type="hidden" name="tj2name" value="">
        <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
          <option value=""></option>
          <option value="dwmc">所属分公司</option>
          <option value="qcph">汽车牌号</option>
          <option value="lyrq">加油日期</option>
          <option value="lyr">加油人</option>
          <option value="ybh">油标号</option>
        </select>
        第三列 
        <input type="hidden" name="tj3name" value="">
        <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
          <option value=""></option>
          <option value="dwmc">所属分公司</option>
          <option value="qcph">汽车牌号</option>
          <option value="lyrq">加油日期</option>
          <option value="lyr">加油人</option>
          <option value="ybh">油标号</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="19%">显示风格</td>
      <td colspan="3"> 
        <input type="radio" name="xsfg" value="1" checked>
        网页 
        <input type="radio" name="xsfg" value="2">
        EXCEL </td>
    </tr>
    <tr> 
      <td colspan="4" align="center"> 
        <input type="button"  value="查询" onClick="f_do(selectform)">
        <input type="reset"  value="重输">
      </td>
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
	if(!(isFloat(FormName.xz_yplydjb_lysl, "加油数量"))) {
		return false;
	}
	if(!(isFloat(FormName.xz_yplydjb_lysl2, "加油数量"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_yplydjb_lyrq, "加油日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_yplydjb_lyrq2, "加油日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_yplydjb_lrsj, "录入时间"))) {
		return false;
	}
	if(FormName.tj1.value=="" && FormName.tj2.value=="" && FormName.tj3.value=="") {
		alert("请选择[统计列]！");
		FormName.tj1.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
