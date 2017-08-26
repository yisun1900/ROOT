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
<form method="post" action="Tc_csrjlkbjmjList.jsp" name="selectform">
<div align="center">套餐铝扣板减免价－维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">地区</td> 
  <td width="32%"> 
    <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  <td align="right" width="18%">报价级别</td> 
  <td width="32%"> 
    <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">产品类别</td> 
  <td width="32%"> 
    <select name="tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm order by clxlmc","");
%>
    </select>  </td>
  <td align="right" width="18%">产品大类</td> 
  <td width="32%"> 
    <select name="tccpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select cldlbm,cldlmc from jxc_cldlbm where cldllb in('1','3') order by cldlmc","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否要求相同品牌</td> 
  <td width="32%">
    <INPUT type="radio" name="sfyqxtpp" value="Y">是
    <INPUT type="radio" name="sfyqxtpp" value="N">否
  </td>
  <td align="right" width="18%">计量单位</td> 
  <td width="32%"> 
    <select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
    </select>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否可减免</td> 
  <td width="32%">
	<INPUT type="radio" name="sfkjm" value="1">不可减免
	<INPUT type="radio" name="sfkjm" value="2">可减免
  </td>
  <td align="right" width="18%">减免单价</td> 
  <td width="32%"><input type="text" name="jmdj" size="20" maxlength="17" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td> 
  <td width="32%"> 
    <input type="text" name="lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">录入时间</td> 
  <td width="32%"> 
    <input type="text" name="lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
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
	if(!(isNumber(FormName.tccplbbm, "产品类别"))) {
		return false;
	}
	if(!(isNumber(FormName.tccpdlbm, "产品大类"))) {
		return false;
	}
	if(!(isFloat(FormName.jmdj, "减免单价"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
