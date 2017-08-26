<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String khbh=cf.GB2Uni(request.getParameter("khbh"));
	String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
	String dqbm=cf.executeQuery("select sq_dwxx.dqbm from jc_zcdd,crm_khxx,sq_dwxx where jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh and jc_zcdd.ddbh='"+ddbh+"'");

	String ppbm=cf.GB2Uni(request.getParameter("ppbm"));
	String cldlbm=cf.GB2Uni(request.getParameter("zcdlbm"));
	String bjbbh=cf.executeQuery("select bjbbh from crm_zxkhxx where khbh='"+khbh+"'");
	String bjjbbm=cf.executeQuery("select bjjb from crm_zxkhxx where khbh='"+khbh+"'");
 
	
	String clzt=cf.executeQuery("select clzt from jc_zcdd where ddbh='"+ddbh+"'");
	if (!clzt.equals("07"))
	{
		out.println("<BR>错误，不能再进行修改！合同已完成");
		return;
	}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Bj_tczcbjCxList.jsp" name="selectform">
<div align="center">套餐主材报价－查询</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">报价版本号</td> 
  <td colspan="3"> 
    <select name="bj_tczcbj_bjbbh" style="FONT-SIZE:12PX;WIDTH:525PX">
<%
		cf.selectItem(out,"select bjbbh c1,bjbbh c2 from bj_dzbjbb where bjbbh='"+bjbbh+"' ","");
%>
    </select>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">地区</td>
  <td><select name="bj_tczcbj_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
%>
  </select></td>
  <td align="right">报价级别</td>
  <td><select name="bj_tczcbj_bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"' ","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">产品编码</td> 
  <td width="32%"><input type="text" name="bj_tczcbj_cpbm" size="20" maxlength="13" ></td>
  <td align="right" width="18%">SKU号</td> 
  <td width="32%"><input type="text" name="bj_tczcbj_sku" size="20" maxlength="6" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">产品大类</td> 
  <td width="32%"><select name="bj_tczcjxc_cldlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeDl(selectform)">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3') order by cldlmc","");
%>
  </select></td>
  <td align="right" width="18%">产品类别</td> 
  <td width="32%"><select name="bj_tczcjxc_clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select clxlmc c1,clxlmc c2 from jxc_clxlbm where cldlmc='"+cldlbm+"' order by clxlmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">套餐升级分类</td>
  <td><select name="tcsjflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select tcsjflbm,tcsjflmc from bj_tcsjflbm order by tcsjflmc","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">产品名称</td> 
  <td width="32%"><input type="text" name="bj_tczcbj_cpmc" size="20" maxlength="50" ></td>
  <td align="right" width="18%">品牌</td> 
  <td width="32%"><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select ppmc c1,ppmc c2 from jxc_ppxx where ppmc='"+ppbm+"'",ppbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">供应商</td>
  <td colspan="3"><select name="gysmc" style="FONT-SIZE:12PX;WIDTH:523PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select gysmc c1,gysmc c2 from jxc_gysxx where cllx in('1','3') order by gysmc","");
	%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">型号</td> 
  <td width="32%"><input type="text" name="bj_tczcbj_xh" size="20" maxlength="50" ></td>
  <td align="right" width="18%">规格</td> 
  <td width="32%"><input type="text" name="bj_tczcbj_gg" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">计量单位</td> 
  <td width="32%"><select name="bj_tczcbj_jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
  </select></td>
  <td align="right" width="18%">是否超市产品</td> 
  <td width="32%">
	<INPUT type="radio" name="bj_tczcbj_sfcscp" value="Y">是
    <INPUT type="radio" name="bj_tczcbj_sfcscp" value="N">否  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否需处理小数</td>
  <td colspan="3"><input type="radio" name="sfxclxs"  value="1">
    向上取整
    <input type="radio" name="sfxclxs"  value="2">
    向下取整
    <input type="radio" name="sfxclxs"  value="3">
    4舍5入
    <input type="radio" name="sfxclxs"  value="4">
    不处理</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从</td>
  <td><input type="text" name="bj_tczcbj_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="bj_tczcbj_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td> 
  <td width="32%"> 
    <input type="text" name="bj_tczcbj_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">排序序号</td> 
  <td width="32%"><input type="text" name="bj_tczcbj_xuhao" size="20" maxlength="8" ></td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
	<input type="hidden" name="ddbh" value="<%=ddbh%>">        
	<input type="hidden" name="khbh" value="<%=khbh%>">        
	<input type="hidden" name="bjjbbm" value="<%=bjjbbm%>">        
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


function changeDl(FormName)
{
	FormName.bj_tczcjxc_clxlbm.length=1;

	if (FormName.bj_tczcjxc_cldlbm.value=="")
	{
		return;
	}

	var sql;
	sql="select clxlmc c1,clxlmc c2 from jxc_clxlbm where cldlmc='"+FormName.bj_tczcjxc_cldlbm.options[FormName.bj_tczcjxc_cldlbm.selectedIndex].text+"' order by clxlmc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);

	openAjax(actionStr);
}


function getAjax(ajaxRetStr) 
{
	strToItem(selectform.bj_tczcjxc_clxlbm,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.bj_tczcbj_xuhao, "排序序号"))) {
		return false;
	}
	if(!(isDatetime(FormName.bj_tczcbj_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.bj_tczcbj_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
