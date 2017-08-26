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
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_clsgdShList.jsp" name="selectform">
<div align="center">申购单－审核</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">申购公司</td>
  <td><select name="jxc_clsgd_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  <td align="right">申购单状态</td>
  <td><select name="jxc_clsgd_sgdzt" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value="1">已提交</option>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">申购批号</td> 
  <td width="32%"><input type="text" name="jxc_clsgd_sgph" size="20" maxlength="13" ></td>
  <td align="right" width="18%">申购人</td> 
  <td width="32%"><input type="text" name="jxc_clsgd_sgr" size="20" maxlength="20" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">申购日期 从</td>
  <td><input type="text" name="jxc_clsgd_sgrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="jxc_clsgd_sgrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">申购总数量</td> 
  <td width="32%"> 
    <input type="text" name="jxc_clsgd_sgzsl" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">申购总金额</td> 
  <td width="32%"> 
    <input type="text" name="jxc_clsgd_sgzje" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">计划送货时间 从</td>
  <td><input type="text" name="jxc_clsgd_jhshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="jxc_clsgd_jhshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">配送方式</td>
  <td><INPUT type="radio" name="jxc_clsgd_psfs" value="1">
    配送
    <INPUT type="radio" name="jxc_clsgd_psfs" value="2">
    自取
    <INPUT type="radio" name="jxc_clsgd_psfs" value="9">
    其他 </td>
  <td align="right">审核人</td>
  <td><input type="text" name="jxc_clsgd_shr" size="20" maxlength="20" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">审核日期 从</td>
  <td><input type="text" name="jxc_clsgd_shrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="jxc_clsgd_shrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否收款</td> 
  <td width="32%"> 
    <INPUT type="radio" name="jxc_clsgd_sfsk" value="Y">已收款
    <INPUT type="radio" name="jxc_clsgd_sfsk" value="N">未收款  </td>
  <td align="right" width="18%">收款确认人</td> 
  <td width="32%"> 
    <input type="text" name="jxc_clsgd_skqrr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">收款确认时间 从</td>
  <td><input type="text" name="jxc_clsgd_skqrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="jxc_clsgd_skqrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否已转采购单</td> 
  <td width="32%"><input type="radio" name="jxc_clsgd_sfzcgd" value="Y">
    已转
      <input type="radio" name="jxc_clsgd_sfzcgd" value="N">
      未转 </td>
  <td align="right" width="18%">申购类别</td> 
  <td width="32%"><input type="radio" name="jxc_clsgd_sglb" value="0">
主材
  <input type="radio" name="jxc_clsgd_sglb" value="1">
辅材 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">出库批号</td> 
  <td width="32%"> 
    <input type="text" name="jxc_clsgd_ckph" size="20" maxlength="11" >  </td>
  <td align="right" width="18%">入库批号</td> 
  <td width="32%"> 
    <input type="text" name="jxc_clsgd_rkph" size="20" maxlength="11" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td> 
  <td width="32%"><input type="text" name="jxc_clsgd_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="18%">录入部门</td> 
  <td width="32%"><select name="jxc_clsgd_ssbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从</td>
  <td><input type="text" name="jxc_clsgd_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="jxc_clsgd_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
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
	if(!(isDatetime(FormName.jxc_clsgd_sgrq, "申购日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_clsgd_sgrq2, "申购日期"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_clsgd_sgzsl, "申购总数量"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_clsgd_sgzje, "申购总金额"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_clsgd_jhshsj, "计划送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_clsgd_jhshsj2, "计划送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_clsgd_shrq, "审核日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_clsgd_shrq2, "审核日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_clsgd_skqrsj, "收款确认时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_clsgd_skqrsj2, "收款确认时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_clsgd_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_clsgd_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
