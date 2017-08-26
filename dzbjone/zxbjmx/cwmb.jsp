<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>维护模板</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
<%
	String yhdlm=(String)session.getAttribute("yhdlm");
	String khbh=request.getParameter("khbh");
	String fgsbh=cf.executeQuery("select ssfgs from crm_zxkhxx where khbh='"+khbh+"'");
%>
<body bgcolor="#FFFFFF">
<div align="center"></div>
<form method="post" action="" name="editform" target="_blank">
		<input name="fgsbh" type="hidden" value="<%=fgsbh%>">
		<input name="khbh" type="hidden" value="<%=khbh%>">
  <HR>
  <table width="100%" border="0" style="FONT-SIZE:16">
    <tr> 
      <td align="center" height="27" colspan="2"> 
        <p><b>1、保存为模板</b></p>
        </td>
    </tr>
    <tr>
      <td width="32%" height="57" align="right">&nbsp;</td>
      <td width="68%" height="57"> <b><font color="#FF0000">把【项目】和【房间】信息保存下来，但不保存工程量， 
        <BR>
        如：一居室、二居室、三居室都可做标准模板，以备再做其它报价时直接导入</font></b>
      </td>
    </tr>
    <tr> 
      <td width="32%" height="57" align="right">模板名称</td>
      <td width="68%" height="57"> 
        <input type="text" name="newmbmc" size="30" maxlength="40">
        <input type="button"  value="保存模板" onClick="f_bcmb(editform)">
      </td>
    </tr>
  </table>
  <HR>
  <table width="100%" border="0" style="FONT-SIZE:14">
    <tr> 
      <td height="29" colspan="2" align="center">
        <p><b>2、删除模板</b></p>
        <p><b>（<font color="#FF0000">把保存的模板删除</font>）</b></p>
      </td>
    </tr>
    <tr> 
      <td width="32%" height="60" align="right">模板名称</td>
      <td width="68%" height="60"> 
        <select name="mbmc" style="FONT-SIZE:12PX;WIDTH:224PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select distinct mbmc||'+'||yhdlm c1,mbmc||DECODE(bj_bjmbfjxx.mblx,'1','（公用模板）','2','（私人模板）') c2  from bj_bjmbfjxx where yhdlm='"+yhdlm+"' and mblx='2' order by c1","");
%> 
        </select>
        <input type="button"  value="删除模板" onClick="f_scmb(editform)">
        <input type="button"  value="查看模板" onClick="f_ckmb(editform)">
      </td>
    </tr>
  </table>
  <HR>
  <table width="100%" border="0" style="FONT-SIZE:14">
    <tr> 
      <td align="center" height="27" colspan="2">
        <p><b>3、保存为临时报价</b></p>
        <p><b>（<font color="#FF0000">把【报价项目】和【房间信息】【工程量】临时保存，以备客户从几种报价中做选择</font>）</b></p>
      </td>
    </tr>
    <tr> 
      <td width="32%" height="59" align="right">临时报价名称</td>
      <td width="68%" height="59"> 
        <input type="text" name="lsbjmc" size="30" maxlength="40">
        <input type="button"  value="保存临时报价" onClick="f_bclsbj(editform)" name="button">
      </td>
    </tr>
  </table>
  <HR>
  <table width="100%" border="0" style="FONT-SIZE:14">
    <tr> 
      <td height="29" colspan="2" align="center">
        <p><b>4、删除临时报价</b></p>
        <p><b>（<font color="#FF0000">把保存的临时报价删除</font>）</b></p>
      </td>
    </tr>
    <tr> 
      <td width="32%" height="58" align="right">临时报价名称</td>
      <td width="68%" height="58"> 
        <select name="sclsbjmc" style="FONT-SIZE:12PX;WIDTH:224PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select mbmc,mbmc||'（'||bjjbmc||'）'  from bj_mbbjmc,bdm_bjjbbm where bj_mbbjmc.bjjb=bdm_bjjbbm.bjjbbm and khbh='"+khbh+"' order by mbmc","");
%> 
        </select>
        <input type="button"  value="删除临时报价" onClick="f_sclsbj(editform)" name="button2">
        <input type="button"  value="查看临时报价" onClick="f_cklsbj(editform)" name="button22">
      </td>
    </tr>
  </table>
  <HR>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_bcmb(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.newmbmc)=="") {
		alert("请输入[新模板名称]！");
		FormName.newmbmc.focus();
		return false;
	}

	FormName.action="SaveCwmb.jsp";
	FormName.submit();
	return true;
}
function f_bclsbj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.lsbjmc)=="") {
		alert("请输入[临时报价名称]！");
		FormName.lsbjmc.focus();
		return false;
	}

	FormName.action="SaveLsbj.jsp";
	FormName.submit();
	return true;
}
function f_scmb(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.mbmc)=="") {
		alert("请选择要删除的[模板名称]！");
		FormName.mbmc.focus();
		return false;
	}

	if ( confirm("注意，删除后不可恢复，确实要删除吗？") )	{
		FormName.action="DeleteCwmb.jsp";
		FormName.submit();
		return true;
	}

}
function f_ckmb(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.mbmc)=="") {
		alert("请选择[模板名称]！");
		FormName.mbmc.focus();
		return false;
	}

	FormName.action="ViewBj_bjmb.jsp";
	FormName.submit();
	return true;
}
function f_sclsbj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sclsbjmc)=="") {
		alert("请选择要删除的[临时报价名称]！");
		FormName.sclsbjmc.focus();
		return false;
	}

	if ( confirm("注意，删除后不可恢复，确实要删除吗？") )	{
		FormName.action="DeleteLsbj.jsp";
		FormName.submit();
		return true;
	}

}
function f_cklsbj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sclsbjmc)=="") {
		alert("请选择[临时报价名称]！");
		FormName.sclsbjmc.focus();
		return false;
	}

	FormName.action="ViewBj_lsbj.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
