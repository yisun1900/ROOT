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
String ddbh=request.getParameter("ddbh");
String zjxxh=request.getParameter("zjxxh");
String dqbm=cf.executeQuery("select dqbm from jc_jjdd,sq_dwxx where jc_jjdd.fgsbh=sq_dwxx.dwbh and jc_jjdd.ddbh='"+ddbh+"'");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJc_cpjjddmx.jsp" name="insertform" >
<div align="center">成品家具--增加新项（增减项序号：00163110201） </div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#FF0000">*</font>型号</td>
      <td width="34%"> 
        <input type="text" name="xh" value="" size="20" maxlength="50" onKeyUp="keyTo(gg)" onChange="getXh(insertform)">
      </td>
      <td align="right" width="19%"><font color="#FF0000">*</font>规格</td>
      <td width="31%"> 
        <select name="gg" style="FONT-SIZE:12PX;WIDTH:152PX"  onKeyUp="keyTo(cpjjcz)" onChange="getGg(insertform)">
          <option value=""></option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#FF0000">*</font>材质</td>
      <td width="34%"> 
        <select name="cpjjcz" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(cpjjhs)" onChange="getCpjjcz(insertform)">
          <option value=""></option>
        </select>
      </td>
      <td align="right" width="19%"><font color="#FF0000">*</font>花色纹理</td>
      <td width="31%"> 
        <select name="cpjjhs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#0000CC">名称</font></td>
      <td width="34%"> 
        <input type="text" name="cpjjmc" value="" size="20" maxlength="50" readonly>
      </td>
      <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000CC">单价</font></td>
      <td width="31%"> 
        <input type="text" name="bzdj" value="" size="20" maxlength="17" readonly onChange="f_jszj(insertform)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#0000CC">风格</font></td>
      <td width="34%"> 
        <input type="text" name="cpjjfg" value="" size="20" maxlength="50" readonly>
      </td>
      <td align="right" width="19%"><font color="#0000CC">系列名称</font></td>
      <td width="31%"> 
        <input type="text" name="cpjjxl" value="" size="20" maxlength="50" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#FF0000">*</font>数量</td>
      <td width="34%"> 
        <input type="text" name="sl" value="" size="20" maxlength="8" onchange="f_jszj(insertform)">
      </td>
      <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000CC">总价</font></td>
      <td width="31%"> 
        <input type="text" name="zj" value="" size="20" maxlength="17" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#0000CC">产品说明</font></td>
      <td colspan="3"> 
        <textarea name="cpsm" cols="74" rows="6"></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#0000CC">产品备注</font></td>
      <td colspan="3"> 
        <textarea name="cpbz" cols="74" rows="1"></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">订单备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="74" rows="3"></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="存盘" onClick="f_do(insertform)">
        <input type="reset"  value="重输" name="reset">
        <input type="hidden" name="ddbh" value="<%=ddbh%>" >
        <input type="hidden" name="dqbm" value="<%=dqbm%>" >
        <input type="hidden" name="zjxxh" value="<%=zjxxh%>" >
        <input type="hidden" name="cpjjbh" value="" size="20" maxlength="4" >
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function getXh(FormName)
{
	if(FormName.xh.value=="") 
	{
		alert("请输入[型号]！");
		FormName.xh.focus();
		return false;
	}

	FormName.gg.value="";
	FormName.cpjjcz.value="";
	FormName.cpjjhs.value="";
	FormName.bzdj.value="";
	FormName.zj.value="";

	var str="Jc_cpjjddmxCx.jsp?dqbm=<%=dqbm%>&xh="+escape(escape(FormName.xh.value));
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function getGg(FormName)
{
	if(FormName.xh.value=="") 
	{
		alert("请输入[型号]！");
		FormName.xh.focus();
		return false;
	}
	if(FormName.gg.value=="") 
	{
		alert("请输入[规格]！");
		FormName.gg.focus();
		return false;
	}

	FormName.cpjjcz.value="";
	FormName.cpjjhs.value="";
	FormName.bzdj.value="";
	FormName.zj.value="";

	var str="Jc_cpjjddmxCx.jsp?dqbm=<%=dqbm%>&xh="+escape(escape(FormName.xh.value))+"&gg="+escape(escape(FormName.gg.value));
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function getCpjjcz(FormName)
{
	if(FormName.xh.value=="") 
	{
		alert("请输入[型号]！");
		FormName.xh.focus();
		return false;
	}
	if(FormName.gg.value=="") 
	{
		alert("请输入[规格]！");
		FormName.gg.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjcz)=="") {
		alert("请选择[材质]！");
		FormName.cpjjcz.focus();
		return false;
	}

	FormName.cpjjhs.value="";
	FormName.bzdj.value="";
	FormName.zj.value="";

	var str="Jc_cpjjddmxCx.jsp?dqbm=<%=dqbm%>&xh="+escape(escape(FormName.xh.value))+"&gg="+escape(escape(FormName.gg.value))+"&cpjjcz="+escape(escape(FormName.cpjjcz.value));
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function addGg(str)
{
	strToItem1(insertform.gg,str);
}

function addCpjjcz(str)
{
	strToItem1(insertform.cpjjcz,str);
}

function addCpjjhs(str)
{
	strToItem1(insertform.cpjjhs,str);
}

function f_jszj(FormName)//参数FormName:Form的名称
{
	var je=FormName.bzdj.value*FormName.sl.value;
	je=round(je,2);
	FormName.zj.value=je;
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}
	if(FormName.xh.value=="") 
	{
		alert("请输入[型号]！");
		FormName.xh.focus();
		return false;
	}
	if(FormName.gg.value=="") 
	{
		alert("请输入[规格]！");
		FormName.gg.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjcz)=="") {
		alert("请选择[材质]！");
		FormName.cpjjcz.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjhs)=="") {
		alert("请选择[花色纹理]！");
		FormName.cpjjhs.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjfg)=="") {
		alert("请选择[风格]！");
		FormName.cpjjfg.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjmc)=="") {
		alert("请选择[名称]！");
		FormName.cpjjmc.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjbh)=="") {
		alert("请输入[成品家具编号（4位）]！");
		FormName.cpjjbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bzdj)=="") {
		alert("请输入[单价]！");
		FormName.bzdj.focus();
		return false;
	}
	if(!(isFloat(FormName.bzdj, "单价"))) {
		return false;
	}
	
	f_jszj(FormName);

	if(	javaTrim(FormName.sl)=="") {
		alert("请输入[数量]！");
		FormName.sl.focus();
		return false;
	}
	if(!(isNumber(FormName.sl, "数量"))) {
		return false;
	}

	if(	javaTrim(FormName.zj)=="") {
		alert("请输入[总价]！");
		FormName.zj.focus();
		return false;
	}
	if(!(isFloat(FormName.zj, "总价"))) {
		return false;
	}
	if (parseFloat(FormName.zj.value)<=0)
	{
		alert("[总价]不能为0！");
		FormName.zj.select();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
