<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
  <div align="center">请录入家具配件报价</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">配件编号</td>
      <td width="35%"> 
        <input type="text" name="gtpjbh" value="" size="20" maxlength="4" >
      </td>
      <td align="right" width="15%">单价</td>
      <td width="35%"> 
        <input type="text" name="dj" value="" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">配件名称</td>
      <td colspan="3"> 
        <input type="text" name="gtpjmc" value="" size="73" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">配件分类</td>
      <td width="35%"> 
        <select name="jjpjflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select jjpjflbm,jjpjflmc from jdm_jjpjflbm order by jjpjflbm","");
%> 
        </select>
      </td>
      <td align="right" width="15%">计量单位</td>
      <td width="35%"> 
        <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">型号</td>
      <td colspan="3"> 
        <input type="text" name="xinghao" value="" size="73" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">规格</td>
      <td colspan="3"> 
        <input type="text" name="guige" value="" size="73" maxlength="50" >
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
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" onClick="f_drnewExcel(insertform)"  value="增加家具配件报价（Excel）" >      
		<P><A HREF="家具配件报价.xls"><B>点击右键另存为，下载Excel报价模板</B></A>
	  
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
	if(	javaTrim(FormName.gtpjbh)=="") {
		alert("请输入[配件编号]！");
		FormName.gtpjbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gtpjmc)=="") {
		alert("请输入[配件名称]！");
		FormName.gtpjmc.focus();
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
	if(	javaTrim(FormName.jjpjflbm)=="") {
		alert("请选择[配件分类]！");
		FormName.jjpjflbm.focus();
		return false;
	}

	FormName.action="SaveInsertJc_jjpjbj.jsp";
	FormName.submit();
	return true;
}

function f_drnewExcel(FormName)//参数FormName:Form的名称
{
	FormName.action="ImpAddDataJjpj.jsp";
	FormName.submit();
	return true;

}

//-->
</SCRIPT>
