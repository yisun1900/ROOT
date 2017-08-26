<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Tc_zckCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">地区</td>
  <td><select name="tc_zck_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
  </select></td>
  <td align="right">报价级别</td>
  <td><select name="tc_zck_bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">产品编码</td> 
  <td width="32%"><input type="text" name="tc_zck_cpbm" size="20" maxlength="13" ></td>
  <td align="right" width="18%">内部编码</td> 
  <td width="32%"> 
    <input type="text" name="tc_zck_nbbm" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">产品大类</td> 
  <td width="32%"> 
    <select name="cldl" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeDl(selectform)">
    <option value=""></option>
<%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3') order by cldlmc","");
%>
    </select>  </td>
  <td align="right" width="18%">产品小类</td> 
  <td width="32%"> 
    <select name="clxl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
//	cf.selectItem(out,"select clxlmc c1,clxlmc c2 from jxc_clxlbm order by clxlmc","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">产品名称</td> 
  <td width="32%"> 
    <input type="text" name="tc_zck_cpmc" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">型号</td> 
  <td width="32%"> 
    <input type="text" name="tc_zck_xh" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">规格</td> 
  <td width="32%"> 
    <input type="text" name="tc_zck_gg" size="20" maxlength="100" >  </td>
  <td align="right" width="18%">品牌</td> 
  <td width="32%"> 
    <select name="tc_zck_ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select ppmc c1,ppmc c2 from jxc_ppxx where pplb in('1','3') order by ppmc","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应商</td> 
  <td colspan="3"> 
    <select name="tc_zck_gysmc" style="FONT-SIZE:12PX;WIDTH:522PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gysmc c1,gysmc c2 from jxc_gysxx where cllx in('1','3') order by gysmc","");
%>
    </select>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">计量单位</td> 
  <td width="32%"><select name="tc_zck_jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
  </select></td>
  <td align="right" width="18%">下单计量单位</td> 
  <td width="32%"><select name="tc_zck_xdjldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否需处理小数</td>
  <td colspan="3"><%
	cf.radioToken(out, "tc_zck_sfxclxs","1+向上取整&2+向下取整&3+4舍5入&4+不处理","");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">类型</td> 
  <td colspan="3"> 
<%
	cf.radioToken(out, "tc_zck_lx","1+套餐项&2+促销项&3+礼包项&4+套餐外","");
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">礼包项目编码</td> 
  <td width="32%"><input type="text" name="tc_zck_lbxmbm" size="20" maxlength="6" ></td>
  <td align="right" width="18%">促销项目编码</td> 
  <td width="32%"><input type="text" name="tc_zck_cxxmbm" size="20" maxlength="6" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否有效</td>
  <td colspan="3"><%
	cf.radioToken(out, "tc_zck_sfyx","1+正在销售&2+停止销售&3+阶段销售&4+售前核实","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">有效开始时间 从</td> 
  <td width="32%"><input type="text" name="tc_zck_yxkssj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="tc_zck_yxkssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">有效结束时间 从</td>
  <td><input type="text" name="tc_zck_yxjzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="tc_zck_yxjzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从</td>
  <td><input type="text" name="tc_zck_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="tc_zck_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td> 
  <td width="32%"> 
    <input type="text" name="tc_zck_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
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
	//启用Ajax
	cf.ajax(out);
%>

function changeDl(FormName)
{
	FormName.clxl.length=1;

	if (FormName.cldl.value=="")
	{
		return;
	}

	var sql;
	sql="select clxlmc c1,clxlmc c2 from jxc_clxlbm where cldlmc='"+FormName.cldl.value+"' order by clxlmc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.clxl,ajaxRetStr);
}
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.tc_zck_yxkssj, "有效开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.tc_zck_yxkssj2, "有效开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.tc_zck_yxjzsj, "有效结束时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.tc_zck_yxjzsj2, "有效结束时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.tc_zck_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.tc_zck_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
