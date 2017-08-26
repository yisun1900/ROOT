<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<%
String rkph=request.getParameter("rkph");
String dqbm=request.getParameter("dqbm");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_cljgbCxList.jsp" name="selectform">
<div align="center">入库选择材料（入库批号：<%=rkph%>）</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right">所属地区</td>
    <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'  order by dqmc","");
%>
      </select>    </td>
    <td align="right">是否常用</td>
    <td><input type="radio" name="sfcy" value="Y">常用
      <input type="radio" name="sfcy" value="N">非常用    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">销售方式</td>
    <td colspan="3">
		<input type="radio" name="xsfs" value="1">代销品（无库存）
		<input type="radio" name="xsfs" value="2">现货下单，现货出库 
		<input type="radio" name="xsfs" value="3">库存无货可下单，现货出库 	
		<input type="radio" name="xsfs" value="4">允许负库存	
	</td>
    </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right">材料大类</td>
  <td><select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="clxlbmMark=0;clxlbm.length=1;gysMark=0;gysmc.length=1;ppmcMark=0;ppmc.length=1;ppmcMark=0;ppmc.length=1;">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3')  order by cldlmc","");
%>
  </select></td>
  <td align="right">材料小类</td>
  <td><select name="clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('clxlbm');" onChange="gysMark=0;gysmc.length=1;ppmcMark=0;ppmc.length=1;ppmcMark=0;ppmc.length=1;">
    <option value=""></option>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">品牌</td>
  <td><select name="scsmc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('scsmc')">
    <option value=""></option>
  </select></td>
  <td align="right">子品牌</td>
  <td><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ppmc')">
    <option value=""></option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">材料编码</td> 
  <td width="32%"> 
    <input type="text" name="clbm" size="20" maxlength="13" >  </td>
  <td align="right" width="18%">内部编码</td> 
  <td width="32%"><input type="text" name="nbbm" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">材料名称</td>
  <td><input type="text" name="clmc" size="20" maxlength="50" >（模糊）</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">型号</td> 
  <td width="32%"><input type="text" name="xh" size="20" maxlength="100" ></td>
  <td align="right" width="18%">规格</td> 
  <td width="32%"><input type="text" name="gg" size="20" maxlength="100" ></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right">每页显示数量</td>
  <td><input type="text" name="myxssl" size="20" value="100"></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
	  <input type="hidden" name="rkph" value="<%=rkph%>" >
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
var ppmcMark=0;
var ppmcMark=0;
var clxlbmMark=0;

var fieldName="";

function changeDq(FormName) 
{
	gysMark=0;
	ppmcMark=0;
	ppmcMark=0;

	FormName.gysmc.length=1;
	FormName.ppmc.length=1;
	FormName.ppmc.length=1;
}

function getThis(lx)
{
	if(	javaTrim(selectform.dqbm)=="") {
		alert("请选择[所属地区]！");
		selectform.dqbm.focus();
		return false;
	}

	var sql;
	fieldName=lx;

	if (lx=="gysmc")
	{
		if (gysMark==0)
		{
			if (selectform.clxlbm.value!="")
			{
				sql="select jxc_gysxx.gysmc from jxc_ppxx,jxc_ppgysdzb,jxc_gysxx where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm and jxc_ppgysdzb.dqbm='"+selectform.dqbm.value+"' and jxc_ppxx.clxl='"+selectform.clxlbm.value+"' order by jxc_gysxx.gysmc";
			}
			else if (selectform.cldlbm.value!="")
			{
				sql="select jxc_gysxx.gysmc from jxc_ppxx,jxc_ppgysdzb,jxc_gysxx where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm and jxc_ppgysdzb.dqbm='"+selectform.dqbm.value+"' and jxc_ppxx.clxl in(select clxlmc from jxc_clxlbm where cldlmc='"+selectform.cldlbm.value+"') order by jxc_gysxx.gysmc";
			}
			else
			{
				sql="select jxc_gysxx.gysmc from jxc_gysxx where jxc_gysxx.dqbm='"+selectform.dqbm.value+"' order by jxc_gysxx.gysmc";
			}

			var actionStr="/ajax/getstr.jsp?sql="+sql;

//			window.open(actionStr);

			openAjax(actionStr);
			gysMark=1;
		}
	}
	else if (lx=="scsmc")
	{
		if (ppmcMark==0)
		{

			if (selectform.clxlbm.value!="")
			{
				sql="select distinct jxc_ppxx.scsmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.dqbm='"+selectform.dqbm.value+"' and jxc_ppxx.clxl='"+selectform.clxlbm.value+"' order by jxc_ppxx.scsmc";
			}
			else if (selectform.cldlbm.value!="")
			{
				sql="select distinct jxc_ppxx.scsmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.dqbm='"+selectform.dqbm.value+"' and jxc_ppxx.clxl in(select clxlmc from jxc_clxlbm where cldlmc='"+selectform.cldlbm.value+"') order by jxc_ppxx.scsmc";
			}
			else
			{
				sql="select distinct jxc_ppxx.scsmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.dqbm='"+selectform.dqbm.value+"' order by jxc_ppxx.scsmc";
			}
			
			var actionStr="/ajax/getstr.jsp?sql="+sql;

//			window.open(actionStr);
			openAjax(actionStr);
			ppmcMark=1;
		}
	}
	else if (lx=="ppmc")
	{
		if (ppmcMark==0)
		{
			if (selectform.clxlbm.value!="")
			{
				sql="select distinct jxc_ppxx.ppmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.dqbm='"+selectform.dqbm.value+"' and jxc_ppxx.clxl='"+selectform.clxlbm.value+"' order by jxc_ppxx.ppmc";
			}
			else if (selectform.cldlbm.value!="")
			{
				sql="select distinct jxc_ppxx.ppmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.dqbm='"+selectform.dqbm.value+"' and jxc_ppxx.clxl in(select clxlmc from jxc_clxlbm where cldlmc='"+selectform.cldlbm.value+"') order by jxc_ppxx.ppmc";
			}
			else
			{
				sql="select distinct jxc_ppxx.ppmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.dqbm='"+selectform.dqbm.value+"' order by jxc_ppxx.ppmc";
			}

			var actionStr="/ajax/getstr.jsp?sql="+sql;

			openAjax(actionStr);
			ppmcMark=1;
		}
	}

}


function getThisOne(lx)
{
	var sql;

	fieldName=lx;

	if (lx=="clxlbm")
	{
		if (clxlbmMark==0)
		{
			if (selectform.cldlbm.value=="")
			{
				clxlbmMark=0;
				selectform.cldlbm.focus();
				alert("请选择【主材大类】");
				return;
			}

			sql =" select clxlmc from jxc_clxlbm where cldlmc='"+selectform.cldlbm.value+"' order by clxlmc";

			var actionStr="/ajax/getstr.jsp?sql="+sql;

//			window.open(actionStr);
			openAjax(actionStr);
			clxlbmMark=1;
		}
	}
}


function getAjax(ajaxRetStr) 
{
	if (fieldName=="gysmc")
	{
		strToItem2(selectform.gysmc,ajaxRetStr);
	}
	else if (fieldName=="scsmc")
	{
		strToItem2(selectform.scsmc,ajaxRetStr);
	}
	else if (fieldName=="ppmc")
	{
		strToItem2(selectform.ppmc,ajaxRetStr);
	}
	else if (fieldName=="clxlbm")
	{
		strToItem2(selectform.clxlbm,ajaxRetStr);
	}
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[所属地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.myxssl)=="") {
		alert("请选择[每页显示数量]！");
		FormName.myxssl.focus();
		return false;
	}
	if(!(isNumber(FormName.myxssl, "每页显示数量"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
