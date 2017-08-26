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
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_gyshtxxList.jsp" name="selectform">
<div align="center">供应商合同－维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">合同编号</td> 
  <td width="32%"> 
    <input type="text" name="jxc_gyshtxx_htbh" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">所属地区</td> 
  <td width="32%"> 
    <select name="jxc_gyshtxx_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
	<%
		if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dm_dqbm.dqbm","");
		}
		else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dm_dqbm.dqbm","");
		}
		else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
		{
			cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh='"+ssfgs+"'",ssfgs);
		}
		else{
			out.println("错误！未进行客户资料授权，请联系系统管理员");
			return;
		}
	%> 
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应商名称</td> 
  <td colspan="3"> 
    <input type="text" name="jxc_gyshtxx_gysmc" size="73" maxlength="50" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应商负责人</td> 
  <td width="32%"> 
    <input type="text" name="jxc_gyshtxx_gysfzr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">供应商地址</td> 
  <td width="32%"><input type="text" name="jxc_gyshtxx_gysdz" size="20" maxlength="100" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应商电话</td> 
  <td width="32%"><input type="text" name="jxc_gyshtxx_gysdh" size="20" maxlength="50" ></td>
  <td align="right" width="18%">供应商传真</td> 
  <td width="32%"><input type="text" name="jxc_gyshtxx_gyscz" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">合同开始时间从</td>
  <td><input type="text" name="jxc_gyshtxx_kssj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="jxc_gyshtxx_kssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">合同结束时间从</td>
  <td><input type="text" name="jxc_gyshtxx_jssj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="jxc_gyshtxx_jssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入标志</td> 
  <td width="32%"><%
	cf.radioToken(out, "jxc_gyshtxx_lrbz","Y+录入&N+未录入","");
%></td>
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.jxc_gyshtxx_kssj, "合同开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_gyshtxx_kssj2, "合同开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_gyshtxx_jssj, "合同结束时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_gyshtxx_jssj2, "合同结束时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
