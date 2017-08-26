<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Jc_gysjsXgFkList.jsp" name="selectform">
<div align="center">结算单付款－修改</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td align="right"> 所属公司</td>
    <td><select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)" >
        <%
		if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
		{
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
		}
		else{
			out.println("错误！未进行客户资料授权，请联系系统管理员");
			return;
		}
%>
    </select></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">结算记录号</td> 
  <td width="32%"> 
    <input type="text" name="jsjlh" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">结算人</td> 
  <td width="32%"><input type="text" name="jsr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000CC"><b>子品牌</b></font></td>
  <td><select name="ppbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ppbm')">
    <option value=""></option>
  </select>  </td>
  <td align="right">子品牌</td>
  <td><input type="text" name="ppbm2" size="20" maxlength="50" >  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000CC"><b>供应商名称</b></font></td>
  <td><select name="gys" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('gys')">
    <option value=""></option>
  </select>  </td>
  <td align="right">供应商名称</td>
  <td><input type="text" name="gys2" size="20" maxlength="50" >  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">结算时间 从</td> 
  <td width="32%"><input type="text" name="jssj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="jssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">审核人</td>
  <td><input type="text" name="shr" size="20" maxlength="20" ></td>
  <td align="right">财务帐期</td>
  <td><input type="text" name="cwzq" value="" size="20" maxlength="20" /></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">审核时间 从</td>
  <td><input type="text" name="shsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="shsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">付款人</td>
  <td><input type="text" name="fkr" size="20" maxlength="20" ></td>
  <td align="right"><strong><font color="#0000FF">审核标志</font></strong></td>
  <td>
    <input type="radio" name="shbz" value="F" checked>结算付款
   </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">付款时间 从</td>
  <td><input type="text" name="fksj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="fksj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">  </td>
</tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	cf.ajax(out);//启用AJAX
%>

var gysMark=0;
var ppbmMark=0;

var fieldName="";

function changeFgs(FormName) 
{

	if (FormName.fgs.value=="")
	{
		return;
	}



	gysMark=0;
	ppbmMark=0;

	FormName.gys.length=1;
	FormName.ppbm.length=1;
}

function getThis(lx)
{

	var sql;

	fieldName=lx;

	if (selectform.fgs.value=="")
	{
		selectform.fgs.focus();
		alert("请首先选择【分公司】");
		return;
	}

	if (lx=="gys")
	{
		if (gysMark==0)
		{
			sql="select distinct jxc_gysxx.gysmc from jxc_gysxx,jxc_ppgysdzb where jxc_gysxx.gysbm=jxc_ppgysdzb.gysbm and jxc_ppgysdzb.ssfgs='"+selectform.fgs.value+"' order by jxc_gysxx.gysmc";

			var actionStr="/ajax/getstr.jsp?sql="+sql;

//			window.open(actionStr);

			openAjax(actionStr);
			gysMark=1;
		}
	}


	else if (lx=="ppbm")
	{
		if (ppbmMark==0)
		{

			sql="select distinct jxc_ppxx.ppmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs='"+selectform.fgs.value+"' order by jxc_ppxx.ppmc";
			
			var actionStr="/ajax/getstr.jsp?sql="+sql;

			openAjax(actionStr);
			ppbmMark=1;
		}
	}

}



function getAjax(ajaxRetStr) 
{
	if (fieldName=="gys")
	{
		strToItem2(selectform.gys,ajaxRetStr);
	}
	else if (fieldName=="ppbm")
	{
		strToItem2(selectform.ppbm,ajaxRetStr);
	}
}


function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.jsjlh, "结算记录号"))) {
		return false;
	}
	if(!(isDatetime(FormName.jssj, "结算时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jssj2, "结算时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.shsj, "审核时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.shsj2, "审核时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.fksj, "付款时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.fksj2, "付款时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
