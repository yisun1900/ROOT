<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
String lrr=(String)session.getAttribute("yhmc");

%>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 固定资产登记</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertXz_gdzcb.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right"><font color="#FF0000">*</font>固定资产编号</div>
              </td>
              <td width="30%"> 
                <input type="text" name="gsbh" value="" size="20" maxlength="20" >
              </td>
              <td width="20%"> 
                <div align="right">部门内部编号</div>
              </td>
              <td width="30%"> 
                <input type="text" name="bmbh" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>固定资产名称</td>
              <td colspan="3"> 
                <input type="text" name="gdzcmc" value="" size="73" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>固定资产分类</td>
              <td width="30%"> 
                <select name="gdzcflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
			cf.selectItem(out,"select gdzcflbm,gdzcflmc from xz_gdzcflbm order by gdzcflbm","");
%> 
                </select>
              </td>
              <td width="20%" align="right"><font color="#FF0000">*</font>是否已报废</td>
              <td width="30%"> 
                <select name="sfybf" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="Y">是</option>
                  <option selected value="N">否</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">配置(CPU)</td>
              <td width="30%"> 
                <input type="text" name="pz1" value="" size="20" maxlength="50">
              </td>
              <td width="20%" align="right">配置(内存)</td>
              <td width="30%"> 
                <input type="text" name="pz2" value="" size="20" maxlength="50">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">配置(硬盘)</td>
              <td width="30%"> 
                <input type="text" name="pz3" value="" size="20" maxlength="50">
              </td>
              <td width="20%" align="right">配置(主板)</td>
              <td width="30%"> 
                <input type="text" name="pz4" value="" size="20" maxlength="50">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">配置(显卡)</td>
              <td width="30%"> 
                <input type="text" name="pz5" value="" size="20" maxlength="50">
              </td>
              <td width="20%" align="right">配置(显示器)</td>
              <td width="30%">
                <input type="text" name="pz6" value="" size="20" maxlength="50">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right"><font color="#FF0000">*</font>品牌</div>
              </td>
              <td width="30%"> 
                <input type="text" name="pp" value="" size="20" maxlength="50" >
              </td>
              <td rowspan="6"> 
                <div align="right"><font color="#CC0000">*</font>资产所属分公司</div>
              </td>
              <td rowspan="6"> 
                <select name="ssfgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" size="11" multiple>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"' OR dwlx in('A0')","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">型号</td>
              <td width="30%"> 
                <input type="text" name="xh" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>数量</td>
              <td width="30%"> 
                <input type="text" name="sl" value="1" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">购入时间</td>
              <td width="30%"> 
                <input type="text" name="grsj" value="" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">购置地</div>
              </td>
              <td width="30%"> 
                <input type="text" name="gzd" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">购入价</td>
              <td width="30%"> 
                <input type="text" name="grj" value="" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right"><font color="#FF0000">*</font>当前保管分公司</div>
              </td>
              <td width="30%"> 
                <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changefgs(insertform)">
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
              <td width="20%"> 
                <div align="right"><font color="#FF0000">*</font>当前保管部门</div>
              </td>
              <td width="30%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changebm(insertform)">
                  <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where   dwlx in ('A0','A1','F0','F1','F2') and ssfgs='"+ssfgs+"' order by dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right"><font color="#FF0000">*</font>保管人</div>
              </td>
              <td width="30%"> 
                <select name="ygbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="bgr.value=ygbh.options[ygbh.selectedIndex].text">
                  <%
		out.println("<option value=\"\"></option>");
%> 
                </select>
              </td>
              <td width="20%"> 
                <div align="right"><font color="#FF0000">*</font>移交保管人时间</div>
              </td>
              <td width="30%"> 
                <input type="text" name="yjsj" value="" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></div>
              </td>
              <td width="30%"> 
                <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="30" readonly >
              </td>
              <td width="20%" align="right"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td>
              <td width="30%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0033">*</font><font color="#0000CC">录入部门</font></td>
              <td width="30%"> 
                <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
              <td width="20%" align="right">&nbsp;</td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">备注</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="72" rows="3"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="hidden" name="bgr" value="" >
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

//查询页面使用，增加下拉框内容
function addOption(field,str1,str2)
{
	var op1=document.createElement("OPTION");
	op1.value=str1;
	op1.text=str2;
	field.add(op1);
}

function changefgs(FormName)
{
	if(	javaTrim(FormName.fgsbh)=="") 
	{
		return false;
	}
	
	FormName.dwbh.length=1;
	FormName.ygbh.length=1;
	
	var str="InsertXz_gdzcbCx.jsp?fgsbh="+FormName.fgsbh.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function changebm(FormName)
{
	if(	javaTrim(FormName.dwbh)=="") 
	{
		return false;
	}

	
	FormName.ygbh.length=1;
	
	var str="InsertXz_gdzcbCx.jsp?dwbh="+FormName.dwbh.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.gsbh)=="") {
		alert("请输入[固定资产编号]！");
		FormName.gsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gdzcmc)=="") {
		alert("请输入[固定资产名称]！");
		FormName.gdzcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.gdzcflbm)=="") {
		alert("请输入[固定资产分类]！");
		FormName.gdzcflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.pp)=="") {
		alert("请输入[品牌]！");
		FormName.pp.focus();
		return false;
	}
	if(	javaTrim(FormName.sl)=="") {
		alert("请输入[数量]！");
		FormName.sl.focus();
		return false;
	}
	if(!(isNumber(FormName.sl, "数量"))) {
		return false;
	}
	if(!(isDatetime(FormName.grsj, "购入时间"))) {
		return false;
	}
	if(!(isFloat(FormName.grj, "购入价"))) {
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[当前保管分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[当前保管部门]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ygbh)=="") {
		alert("请输入[保管人]！");
		FormName.ygbh.focus();
		return false;
	}
	if(	javaTrim(FormName.yjsj)=="") {
		alert("请选择[移交保管人时间]！");
		FormName.yjsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yjsj, "移交保管人时间"))) {
		return false;
	}
	if(	javaTrim(FormName.sfybf)=="") {
		alert("请输入[是否已报废]！");
		FormName.sfybf.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请选择[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请选择[录入时间]！");
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
	if(	!selectChecked(FormName.ssfgsbh)) {
		alert("请输入[资产所属分公司]！");
		FormName.ssfgsbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
