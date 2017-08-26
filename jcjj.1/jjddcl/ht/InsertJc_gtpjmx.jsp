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
String gtxh=cf.GB2Uni(request.getParameter("gtxh"));
String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
String dwstr=cf.getItemData("select gtpjbh,gtpjmc||'（'||xinghao||'）'||'，价格:'||dj,jjpjflbm from jc_jjpjbj order by jjpjflbm,gtpjbh");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJc_gtpjmx.jsp" name="insertform">
  <div align="center">请录入柜体配件明细</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#0000CC">订单编号</font></td>
      <td width="35%"> 
        <input type="text" name="ddbh" value="<%=ddbh%>" size="20" maxlength="9" readonly>
      </td>
      <td align="right" width="15%"><font color="#0000CC">柜体序号</font></td>
      <td width="35%"> 
        <input type="text" name="gtxh" value="<%=gtxh%>" size="20" maxlength="11" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">配件分类</td>
      <td width="35%"> 
        <select name="jjpjflbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(jjpjflbm,gtpjbh,<%=dwstr%>);">
          <option value=""></option>
          <%
	cf.selectItem(out,"select jjpjflbm,jjpjflmc from jdm_jjpjflbm order by jjpjflbm","");
%> 
        </select>
      </td>
      <td align="right" width="15%">&nbsp;</td>
      <td width="35%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">配件名称</td>
      <td colspan="3"> 
        <select name="gtpjbh" style="FONT-SIZE:12PX;WIDTH:514PX" onChange="getDj(insertform)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select gtpjbh,gtpjmc||'（'||xinghao||'）'||'，价格:'||dj from jc_jjpjbj order by jjpjflbm,gtpjbh","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">计量单位</td>
      <td width="35%">
        <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwmc","");
%> 
        </select>
      </td>
      <td align="right" width="15%"><font color="#0000CC">标准单价</font></td>
      <td width="35%">
        <input type="text" name="bzdj" value="" size="20" maxlength="17" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">数量</td>
      <td width="35%">
        <input type="text" name="sl" value="" size="20" maxlength="8" onChange="f_wdzje(insertform)">
      </td>
      <td align="right" width="15%"><font color="#0000CC">金额</font></td>
      <td width="35%">
        <input type="text" name="je" value="" size="20" maxlength="17" readonly>
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
function getDj(FormName)
{
	FormName.bzdj.value="";
	FormName.je.value="";
	FormName.jldwbm.value="";

	var str="Jc_gtpjmxCx.jsp?gtpjbh="+FormName.gtpjbh.value;
//	alert(str);
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}


function f_wdzje(FormName)//参数FormName:Form的名称
{
	var je=0;
	je=FormName.bzdj.value*1.0*FormName.sl.value;
	je=round(je,2);
	FormName.je.value=je;
}
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gtxh)=="") {
		alert("请输入[柜体序号]！");
		FormName.gtxh.focus();
		return false;
	}
	if(	javaTrim(FormName.jjpjflbm)=="") {
		alert("请输入[配件分类]！");
		FormName.jjpjflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gtpjbh)=="") {
		alert("请输入[配件名称]！");
		FormName.gtpjbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bzdj)=="") {
		alert("请输入[标准单价]！");
		FormName.bzdj.focus();
		return false;
	}
	if(!(isFloat(FormName.bzdj, "标准单价"))) {
		return false;
	}
	if(	javaTrim(FormName.sl)=="") {
		alert("请输入[数量]！");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "数量"))) {
		return false;
	}
	if(	javaTrim(FormName.je)=="") {
		alert("请输入[金额]！");
		FormName.je.focus();
		return false;
	}
	if(!(isFloat(FormName.je, "金额"))) {
		return false;
	}
	if (FormName.je.value=="0")
	{
		alert("错误！[金额]不能为0");
		FormName.bzdj.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
