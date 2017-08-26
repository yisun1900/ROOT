<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Cw_jrsgdjsList.jsp" name="selectform">
<div align="center">拨工费－修改</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">结算记录号</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrbgf_jsjlh" size="20" maxlength="9" >  </td>
  <td align="right" width="18%">客户编号</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrbgf_khbh" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">客户姓名</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">房屋地址</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">合同号</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">施工队</td> 
  <td width="32%"> 
    <select name="cw_jrbgf_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','（已撤销）','N','') from sq_sgd","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">施工班长</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrbgf_sgbz" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">拨付日期 从</td>
  <td><input type="text" name="cw_jrbgf_jsrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="cw_jrbgf_jsrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">类型</td> 
  <td colspan="3"><%
	cf.radioToken(out, "cw_jrbgf_lx","2+一次拨工费&5+二次拨工费&8+完工结算","2");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">处理状态</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "cw_jrbgf_clzt","1+结算&2+审批同意&3+审批不同意","");
%>  </td>
  <td align="right" width="18%">审批人</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrbgf_spr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">审批时间 从</td>
  <td><input type="text" name="cw_jrbgf_spsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="cw_jrbgf_spsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td> 
  <td width="32%"><input type="text" name="cw_jrbgf_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="18%">录入部门</td> 
  <td width="32%"><select name="cw_jrbgf_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入时间从</td> 
  <td width="32%"><input type="text" name="cw_jrbgf_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="cw_jrbgf_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.cw_jrbgf_jsrq, "拨付日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_jrbgf_jsrq2, "拨付日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_jrbgf_spsj, "审批时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_jrbgf_spsj2, "审批时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_jrbgf_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_jrbgf_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
