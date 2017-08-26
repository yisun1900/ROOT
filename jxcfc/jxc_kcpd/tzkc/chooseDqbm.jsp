<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=(String)session.getAttribute("dqbm");
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>


<html>
<head>
<title>人工调整库存</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
<div align="center">人工调整库存</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td height="42" align="right"><span class="STYLE1">*</span>地区</td>
  <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changedqbm(selectform)">
    <%
	if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm in(select sq_dwxx.dqbm from sq_sqfgs,sq_dwxx where sq_sqfgs.ssfgs=sq_dwxx.dwbh and sq_sqfgs.ygbh='"+ygbh+"') order by dqbm","");
	}
	else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm in(select sq_dwxx.dqbm from sq_sqbm,sq_dwxx where sq_sqbm.ssfgs=sq_dwxx.dwbh and sq_sqbm.ygbh='"+ygbh+"') order by dqbm","");
	}
	else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
	{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm in(select dqbm from sq_dwxx where dwbh='"+ssfgs+"') order by dqbm","");
	}
	else{
		out.println("错误！未进行客户资料授权，请联系系统管理员");
		return;
	}

%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="50%" height="40" align="right"><span class="STYLE1">*</span>仓库</td>
  <td width="50%"><select name="ckbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <%
	out.print("<option value=\"\"></option>");
	cf.selectItem(out,"select ckbh,ckmc from jxc_ckmc where dqbm='"+dqbm+"'  order by ckmc","");
%>
  </select></td>
  </tr>
<tr align="center"> 
  <td colspan="2"> 
   <input type="button"  value="继续" onClick="f_do(selectform)">
   &nbsp;&nbsp;
    <input type="reset"  value="重输">  </td>
</tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	cf.ajax(out);//启用AJAX
%>


function changedqbm(FormName) 
{
	FormName.ckbh.length=1;

	if (FormName.dqbm.value=="")
	{
		return;
	}

	var sql;
	sql="select ckbh,ckmc from jxc_ckmc where dqbm='"+FormName.dqbm.value+"' order by ckbh";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.ckbh,ajaxRetStr);
}


function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ckbh)=="") {
		alert("请选择[仓库]！");
		FormName.ckbh.focus();
		return false;
	}

	FormName.action="enterBm.jsp";
	FormName.submit();
	return true;

}
//-->
</SCRIPT>
