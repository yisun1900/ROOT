<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dqbm=(String)session.getAttribute("dqbm");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center">请录入成品家具报价</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>地区</td>
      <td width="31%"> 
        <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
	}
%> 
        </select>
      </td>
      <td align="right" width="21%"><font color="#CC0000">*</font>风格</td>
      <td width="29%"> 
        <select name="cpjjfg" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cpjjfg c1,cpjjfg c2 from jdm_cpjjfg order by cpjjfg","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>成品家具编号（4位）</td>
      <td width="31%"> 
        <input type="text" name="cpjjbh" value="" size="20" maxlength="4" >
      </td>
      <td align="right" width="21%"><font color="#CC0000">*</font>名称</td>
      <td width="29%"> 
        <select name="cpjjmc" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cpjjmc c1,cpjjmc c2 from jdm_cpjjmc order by cpjjmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>型号</td>
      <td width="31%"> 
        <input type="text" name="xh" value="" size="20" maxlength="50" >
      </td>
      <td align="right" width="21%"><font color="#CC0000">*</font>规格</td>
      <td width="29%"> 
        <input type="text" name="gg" value="" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>系列名称</td>
      <td width="31%"> 
        <select name="cpjjxl" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cpjjxl c1,cpjjxl c2 from jdm_cpjjxl order by cpjjxl","");
%> 
        </select>
      </td>
      <td align="right" width="21%"><font color="#CC0000">*</font>材质</td>
      <td width="29%"> 
        <select name="cpjjcz" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cpjjcz c1,cpjjcz c2 from jdm_cpjjcz order by cpjjcz","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>单价</td>
      <td width="31%">
        <input type="text" name="dj" value="" size="20" maxlength="17" >
      </td>
      <td align="right" width="21%">&nbsp;</td>
      <td width="29%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">参考图片</td>
      <td width="31%"> 
        <input type="text" name="cktp" value="" size="20" maxlength="50" >
      </td>
      <td align="right" width="21%">产品图片</td>
      <td width="29%"> 
        <input type="text" name="cptp" value="" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">产品说明</td>
      <td colspan="3"> 
        <textarea name="cpsm" cols="74" rows="7"></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="74" rows="3"></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="存盘" onClick="f_do(insertform)">
        <input type="reset"  value="重输" name="reset">
        <input type="button"  value="上传照片" onClick="f_do1(insertform)" >
        <input type="button"  value="查看照片" onClick="f_do2(insertform)" >
        <input type="button"  value="增加新的报价" onClick="f_do3(insertform)" >
        <input type="button"  value="导出报价" onClick="f_do4(insertform)" >
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjfg)=="") {
		alert("请选择[风格]！");
		FormName.cpjjfg.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjbh)=="") {
		alert("请输入[成品家具编号（4位）]！");
		FormName.cpjjbh.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjmc)=="") {
		alert("请选择[名称]！");
		FormName.cpjjmc.focus();
		return false;
	}
	if(	javaTrim(FormName.xh)=="") {
		alert("请输入[型号]！");
		FormName.xh.focus();
		return false;
	}
	if(	javaTrim(FormName.gg)=="") {
		alert("请输入[规格]！");
		FormName.gg.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjcz)=="") {
		alert("请选择[材质]！");
		FormName.cpjjcz.focus();
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

	FormName.action="SaveInsertJc_cpjjbj.jsp";
	FormName.submit();
	return true;
}

function f_do1(FormName)//参数FormName:Form的名称
{
	FormName.action="loadPhoto.jsp";
	FormName.submit();
	return true;
}

function f_do2(FormName)//参数FormName:Form的名称
{
	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}

function f_do3(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}

	FormName.action="ImpAddData.jsp";
	FormName.submit();
	return true;
}

function f_do4(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}

	FormName.action="ExpData.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
