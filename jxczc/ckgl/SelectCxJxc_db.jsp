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
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_dbCxList.jsp" name="selectform">
<div align="center">调拨单－出库</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right">调出地区</td>
    <td><select name="jxc_db_dcdq" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
    </select></td>
    <td align="right">调出公司</td>
    <td><select name="jxc_db_dcgs" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">调入地区</td>
    <td><select name="jxc_db_drdq" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
      </select>    </td>
    <td align="right">调入公司</td>
    <td><select name="jxc_db_drgs" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and cxbz='N' order by dwbh","");
%>
      </select>    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">调拨批号</td> 
  <td width="32%"> 
    <input type="text" name="jxc_db_dbph" size="20" maxlength="13" >  </td>
  <td align="right" width="18%">调拨单状态</td> 
  <td width="32%"><select name="jxc_db_dbdzt" style="FONT-SIZE:12PX;WIDTH:152PX">
		<option value="2">审核通过等待出库</option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">调拨原因</td> 
  <td width="32%"> 
    <select name="jxc_db_dbyy" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="0">集团调货</option>
    <option value="1">退货调拨</option>
    </select>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否经过总部中央库</td> 
  <td width="32%"> 
    <INPUT type="radio" name="jxc_db_jgzyk" value="N">不经过
    <INPUT type="radio" name="jxc_db_jgzyk" value="Y">经过	</td>
  <td align="right" width="18%">调经仓库</td> 
  <td width="32%"> 
    <select name="jxc_db_djck" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select ckbh,ckmc from jxc_ckmc order by ckbh","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">审核人</td> 
  <td width="32%"> 
    <input type="text" name="jxc_db_shr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">审核日期 从</td>
  <td><input type="text" name="jxc_db_shrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="jxc_db_shrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">录入人</td>
  <td><input type="text" name="jxc_db_lrr" size="20" maxlength="20" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入时间 从</td> 
  <td width="32%"><input type="text" name="jxc_db_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="jxc_db_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
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
	if(!(isDatetime(FormName.jxc_db_shrq, "审核日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_db_shrq2, "审核日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_db_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_db_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
