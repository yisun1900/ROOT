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
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_yglkgsjlList.jsp" name="selectform">
<div align="center">离开公司申请－维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">所属公司</td>
  <td>
  <select name="crm_yglkgsjl_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
	<%
		if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
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
  </select>
  </td>
  <td align="right">人员类型</td>
  <td><select name="crm_yglkgsjl_rylx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select rylx c1,rylx c2 from dm_rylx order by rylx","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">记录号</td> 
  <td width="32%"> 
    <input type="text" name="crm_yglkgsjl_jlh" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">员工编号</td> 
  <td width="32%"> 
    <input type="text" name="crm_yglkgsjl_ygbh" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">员工名称</td> 
  <td width="32%"> 
    <input type="text" name="crm_yglkgsjl_yhmc" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">员工部门</td> 
  <td width="32%"> 
    <select name="crm_yglkgsjl_ygbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
%>
    </select>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">计划离开日期 从</td>
  <td><input type="text" name="crm_yglkgsjl_jhlkrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_yglkgsjl_jhlkrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">计划离开时间</td> 
  <td width="32%"> 
    <input type="text" name="crm_yglkgsjl_jhlksj" size="20" maxlength="9" >  </td>
  <td align="right" width="18%">计划返回时间</td> 
  <td width="32%"> 
    <input type="text" name="crm_yglkgsjl_jhfhsj" size="20" maxlength="9" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">离开公司目的</td> 
  <td width="32%"> 
    <select name="crm_yglkgsjl_lkgsmd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select lkgsmd c1,lkgsmd c2 from dm_lkgsmd order by lkgsmd","");
%>
    </select>  </td>
  <td align="right" width="18%">状态</td> 
  <td width="32%"> 
    <select name="crm_yglkgsjl_zt" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value="1">录入申请</option>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从</td>
  <td><input type="text" name="crm_yglkgsjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_yglkgsjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<%
if (yhjs.equals("A0"))
{
	%>
	<tr bgcolor="#FFFFFF">
	  <td align="right" width="18%">录入人</td> 
	  <td width="32%"> 
		<input type="text" name="crm_yglkgsjl_lrr" size="20" maxlength="20" value="">  </td>
	  <td align="right" width="18%">录入部门</td> 
	  <td width="32%">
	  <select name="crm_yglkgsjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
		<option value=""></option>
	  </select></td>
	</tr>
	<%
}
else {
	%>
	<tr bgcolor="#FFFFFF">
	  <td align="right" width="18%">录入人</td> 
	  <td width="32%"> 
		<input type="text" name="crm_yglkgsjl_lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>  </td>
	  <td align="right" width="18%">录入部门</td> 
	  <td width="32%">
	  <select name="crm_yglkgsjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
		<%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
	%>
	  </select></td>
	</tr>
	<%
}
%>
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
	if(!(isNumber(FormName.crm_yglkgsjl_jlh, "记录号"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_yglkgsjl_ygbh, "员工编号"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_yglkgsjl_jhlkrq, "计划离开日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_yglkgsjl_jhlkrq2, "计划离开日期"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_yglkgsjl_jhlksj, "计划离开时间"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_yglkgsjl_jhfhsj, "计划返回时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_yglkgsjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_yglkgsjl_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
