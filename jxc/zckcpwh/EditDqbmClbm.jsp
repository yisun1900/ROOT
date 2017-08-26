<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<%
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
String ppmc=(String)session.getAttribute("ppmc");
%>

<body bgcolor="#FFFFFF">
      <div align="center">维护地区材料</div>

<form method="post" action="" name="selectform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" rowspan="10" align="right"><font color="#0000CC">所属地区</font></td>
              <td width="32%" rowspan="10"><select name="dqbm" size="22" multiple style="FONT-SIZE:12PX;WIDTH:152PX" >
                <%
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
			%>
              </select></td>
              <td width="16%" align="right">主材大类</td>
              <td width="34%"><select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="clxlbmMark=0;clxlbm.length=1;gysMark=0;gysmc.length=1;ppmcMark=0;ppmc.length=1;">
                <option value=""></option>
                <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3')  order by cldlmc","");
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">主材小类</td>
              <td><select name="clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('clxlbm');" onChange="gysMark=0;gysmc.length=1;">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000CC"><b>子品牌</b></font></td>
              <td><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ppmc')">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">子品牌</td>
              <td><input type="text" name="ppmc2" size="14" maxlength="50" >
（模糊查询）</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000CC"><b>品牌名称</b></font></td>
              <td><select name="scsmc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('scsmc')">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">品牌名称</td>
              <td><input type="text" name="scsmc2" size="14" maxlength="50" >
（模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000CC"><b>供应商名称</b></font></td>
              <td><select name="gysmc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('gysmc')">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">供应商名称</td>
              <td><input type="text" name="gysmc2" size="14" maxlength="50" >
（模糊查询）</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">采购类别</td>
              <td><input type="radio" name="cglb" value="J">
集团采购
  <input type="radio" name="cglb" value="D">
地方采购</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">是否有货</td>
              <td><input type="radio" name="sfyh" value="Y">
有货
  <input type="radio" name="sfyh" value="N">
无货</td>
            </tr>
            
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button" onClick="f_del(selectform)"  value="删除地区材料(价格信息)">
                <input type="button" onClick="f_del1(selectform)"  value="删除地区材料(编码及价格信息)"></td>
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

var gysMark=0;
var scsmcMark=0;
var ppmcMark=0;
var clxlbmMark=0;

var fieldName="";

function changeDq(FormName) 
{
	gysMark=0;
	ppmcMark=0;
	ppmcMark=0;
	scsmcMark=0;

	FormName.gysmc.length=1;
	FormName.ppmc.length=1;
	FormName.scsmc.length=1;
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
				sql="select jxc_gysxx.gysmc from jxc_ppxx,jxc_ppgysdzb,jxc_gysxx where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm and jxc_ppgysdzb.ssfgs in(select dwbh from sq_dwxx where dqbm='"+selectform.dqbm.value+"') and jxc_ppxx.clxl='"+selectform.clxlbm.value+"' order by jxc_gysxx.gysmc";
			}
			else if (selectform.cldlbm.value!="")
			{
				sql="select jxc_gysxx.gysmc from jxc_ppxx,jxc_ppgysdzb,jxc_gysxx where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm and jxc_ppgysdzb.ssfgs in(select dwbh from sq_dwxx where dqbm='"+selectform.dqbm.value+"') and jxc_ppxx.clxl in(select clxlmc from jxc_clxlbm where cldlmc='"+selectform.cldlbm.value+"') order by jxc_gysxx.gysmc";
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
		if (scsmcMark==0)
		{

			if (selectform.clxlbm.value!="")
			{
				sql="select distinct jxc_ppxx.scsmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs in(select dwbh from sq_dwxx where dqbm='"+selectform.dqbm.value+"') and jxc_ppxx.clxl='"+selectform.clxlbm.value+"' order by jxc_ppxx.scsmc";
			}
			else if (selectform.cldlbm.value!="")
			{
				sql="select distinct jxc_ppxx.scsmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs in(select dwbh from sq_dwxx where dqbm='"+selectform.dqbm.value+"') and jxc_ppxx.clxl in(select clxlmc from jxc_clxlbm where cldlmc='"+selectform.cldlbm.value+"') order by jxc_ppxx.scsmc";
			}
			else
			{
				sql="select distinct jxc_ppxx.scsmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs in(select dwbh from sq_dwxx where dqbm='"+selectform.dqbm.value+"') order by jxc_ppxx.scsmc";
			}
			
			var actionStr="/ajax/getstr.jsp?sql="+sql;

//			window.open(actionStr);
			openAjax(actionStr);
			scsmcMark=1;
		}
	}
	else if (lx=="ppmc")
	{
		if (ppmcMark==0)
		{
			if (selectform.cldlbm.value!="")
			{
				sql="select distinct jxc_ppxx.ppmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.pplb in('1','3') and jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs in(select dwbh from sq_dwxx where dwlx in('A0','F0') and cxbz='N' and dqbm='"+selectform.dqbm.value+"') and jxc_ppxx.cldl='"+selectform.cldlbm.value+"' order by jxc_ppxx.ppmc";
			}
			else
			{
				sql="select distinct jxc_ppxx.ppmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.pplb in('1','3') and jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs in(select dwbh from sq_dwxx where dwlx in('A0','F0') and cxbz='N' and dqbm='"+selectform.dqbm.value+"') order by jxc_ppxx.ppmc";
			}


			var actionStr="/ajax/getstr.jsp?sql="+sql;
//			window.open(actionStr);

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


function f_del(FormName)//参数FormName:Form的名称
{
	if(	!selectChecked(FormName.dqbm)) {
		alert("请选择[所属地区]！");
		FormName.dqbm.focus();
		return false;
	}

	if ( confirm("确实要删除吗?") )	
	{

		FormName.action="SaveEditDqbmClbm.jsp";
		FormName.submit();
		return true;
	}
}

function f_del1(FormName)//参数FormName:Form的名称
{
	if(	!selectChecked(FormName.dqbm)) {
		alert("请选择[所属地区]！");
		FormName.dqbm.focus();
		return false;
	}

	if ( confirm("确实要删除吗?") )	
	{

		FormName.action="SaveEditDqbmClbm1.jsp";
		FormName.submit();
		return true;
	}
}

//-->
</SCRIPT>
