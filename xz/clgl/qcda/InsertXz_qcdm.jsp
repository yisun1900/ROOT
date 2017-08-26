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
<form method="post" action="SaveInsertXz_qcdm.jsp" name="insertform" target="_blank">
  <div align="center">请录入汽车档案</div>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">汽车牌号</td>
      <td width="35%"> 
        <input type="text" name="qcph" value="" size="20" maxlength="20" >
      </td>
      <td align="right" width="15%">司机姓名</td>
      <td width="35%"> 
        <input type="text" name="sjxm" value="" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">汽车型号</td>
      <td colspan="3">
        <input type="text" name="qcxh" value="" size="73" maxlength="40" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">购车时间</td>
      <td width="35%"> 
        <input type="text" name="gcsj" value="" size="20" maxlength="10" >
      </td>
      <td align="right" width="15%">年检日期</td>
      <td width="35%"> 
        <input type="text" name="njrq" value="" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">所属分公司</td>
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
      <td align="right" width="15%">已行使公里数</td>
      <td width="35%"> 
        <input type="text" name="yxsgls" value="" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">录入人</td>
      <td width="35%"> 
        <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>
      </td>
      <td align="right" width="15%">录入时间</td>
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
        <input type="button"  value="存盘" onClick="f_do(insertform)">
        <input type="reset"  value="重输" name="reset">
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
	if(	javaTrim(FormName.qcph)=="") {
		alert("请输入[汽车牌号]！");
		FormName.qcph.focus();
		return false;
	}
	if(	javaTrim(FormName.qcxh)=="") {
		alert("请输入[汽车型号]！");
		FormName.qcxh.focus();
		return false;
	}
	if(!(isDatetime(FormName.gcsj, "购车时间"))) {
		return false;
	}
	if(	javaTrim(FormName.njrq)=="") {
		alert("请输入[年检日期]！");
		FormName.njrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.njrq, "年检日期"))) {
		return false;
	}
	if(!(isFloat(FormName.yxsgls, "已行使公里数"))) {
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
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
