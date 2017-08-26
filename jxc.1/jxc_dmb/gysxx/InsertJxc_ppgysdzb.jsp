<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String gysbm=request.getParameter("gysbm");
	String count=cf.executeQuery("select count(*) from jxc_gyssqfgs where gysbm='"+gysbm+"'");
%>
<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJxc_ppgysdzb.jsp" name="insertform"  >

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">&nbsp;</td>
	<td  width="10%">供应商编码</td>
	<td  width="35%">供应商名称</td>
	<td  width="10%">子品牌编码</td>
	<td  width="35%">子品牌名称</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	ls_sql="SELECT jxc_ppgysdzb.gysbm,jxc_ppgysdzb.gysmc,jxc_ppgysdzb.ppbm,jxc_ppgysdzb.ppmc ";
	ls_sql+=" FROM jxc_ppgysdzb";
    ls_sql+=" where jxc_ppgysdzb.gysbm='"+gysbm+"'";
	ls_sql+=" order by jxc_ppgysdzb.ppbm";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","deleteJxc_ppgysdzb.jsp?gysbm="+gysbm);
	pageObj.setEditStr("删除");
//设置主键
	String[] keyName={"ppbm"};
	pageObj.setKey(keyName);

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%>
</table>

<div align="center">
  <p>请录入子品牌供应商对照表</p>
  <p class="STYLE1"><strong>请按顺序选择：分公司 -> 子品牌</strong></p>
</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>供应商</td>
    <td colspan="3"><select name="gysbm" style="FONT-SIZE:12PX;WIDTH:522PX">
        <%
	cf.selectItem(out,"select jxc_gysxx.gysbm,jxc_gysxx.gysmc||DECODE(jxc_gysxx.sfhz,'Y','（合作）','N','（不合作）') from jxc_gysxx where jxc_gysxx.gysbm='"+gysbm+"' order by sfhz desc,gysmc","");
%>
    </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>分公司</td> 
  <td width="32%"><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(insertform)">
    <%
		if (count.equals("1"))
		{
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from jxc_gyssqfgs where gysbm='"+gysbm+"') order by dwbh","");
		}
		else{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from jxc_gyssqfgs where gysbm='"+gysbm+"') order by dwbh","");
		}
%>
  </select></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>子品牌</td>
  <td colspan="3"><select name="ppbm" style="FONT-SIZE:12PX;WIDTH:522PX" >
    <option value=""></option>
    <%
	if (count.equals("1"))
	{
		cf.selectItem(out,"select jxc_ppxx.ppbm,jxc_ppxx.ppmc||DECODE(jxc_scsxx.scslb,'1','（主材）','2','（辅材）','3','（通用）') from jxc_ppxx,jxc_scsxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppxx.scsmc=jxc_scsxx.scsmc and jxc_ppgysdzb.ssfgs in(select ssfgs from jxc_gyssqfgs where gysbm='"+gysbm+"')   order by jxc_scsxx.scslb,ppmc","");
	}
%>
  </select></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset"></td>
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


function changeFgs(FormName) 
{
	if (FormName.ssfgs.value=="")
	{
		return;
	}

	FormName.ppbm.length=1;

	var sql;
	sql="select jxc_ppxx.ppbm,jxc_ppxx.ppmc||DECODE(jxc_scsxx.scslb,'1','（主材）','2','（辅材）','3','（通用）') from jxc_ppxx,jxc_scsxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppxx.scsmc=jxc_scsxx.scsmc and jxc_ppgysdzb.ssfgs='"+FormName.ssfgs.value+"'   order by jxc_scsxx.scslb,ppmc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;
//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(insertform.ppbm,ajaxRetStr);
}



function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请输入[分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.ppbm)=="") {
		alert("请输入[子品牌]！");
		FormName.ppbm.focus();
		return false;
	}
	if(!(isNumber(FormName.ppbm, "子品牌"))) {
		return false;
	}
	if(	javaTrim(FormName.gysbm)=="") {
		alert("请输入[供应商]！");
		FormName.gysbm.focus();
		return false;
	}
	if(!(isNumber(FormName.gysbm, "供应商"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
