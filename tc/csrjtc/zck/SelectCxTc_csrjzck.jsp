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
<form method="post" action="Tc_csrjzckCxList.jsp" name="selectform">
<div align="center">套餐主材库－查询</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">产品编码</td> 
  <td width="32%"> 
    <input type="text" name="tc_csrjzck_cpbm" size="20" maxlength="13" >  </td>
  <td align="right" width="18%">地区</td> 
  <td width="32%"> 
    <select name="tc_csrjzck_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  <td align="right" width="18%">报价级别</td> 
  <td width="32%"> 
    <select name="tc_csrjzck_bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%>
    </select>  </td>
  <td align="right" width="18%">内部编码</td> 
  <td width="32%"> 
    <input type="text" name="tc_csrjzck_nbbm" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">产品大类</td> 
  <td width="32%"><select name="tc_csrjzck_tccpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cldlbm c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3') order by cldlmc","");
%>
  </select></td>
  <td align="right" width="18%">产品小类</td> 
  <td width="32%"><select name="tc_csrjzck_tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select clxlbm c1,clxlmc c2 from jxc_clxlbm order by clxlmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">编组名称</td>
  <td><input type="text" name="bzmc" value="" size="20" maxlength="50" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">产品名称</td> 
  <td width="32%"> 
    <input type="text" name="tc_csrjzck_cpmc" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">型号</td> 
  <td width="32%"> 
    <input type="text" name="tc_csrjzck_xh" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">规格</td> 
  <td width="32%"> 
    <input type="text" name="tc_csrjzck_gg" size="20" maxlength="100" >  </td>
  <td align="right" width="18%">品牌</td> 
  <td width="32%"> 
    <input type="text" name="tc_csrjzck_ppmc" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应商</td> 
  <td width="32%"> 
    <input type="text" name="tc_csrjzck_gysmc" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">计量单位</td> 
  <td width="32%"> 
    <select name="tc_csrjzck_jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">下单计量单位</td> 
  <td width="32%"> 
    <select name="tc_csrjzck_xdjldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
    </select>  </td>
  <td align="right" width="18%">下单比</td> 
  <td width="32%"> 
    <input type="text" name="tc_csrjzck_xdb" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">损耗</td> 
  <td width="32%"> 
    <input type="text" name="tc_csrjzck_sh" size="20" maxlength="9" >  </td>
  <td align="right" width="18%">是否需处理小数</td> 
  <td width="32%"> 
    <input type="text" name="tc_csrjzck_sfxclxs" size="20" maxlength="1" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">结算价</td> 
  <td width="32%"> 
    <input type="text" name="tc_csrjzck_jsj" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">客户销售单价</td> 
  <td width="32%"> 
    <input type="text" name="tc_csrjzck_khxsdj" size="20" maxlength="17" >  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">施工队单价</td> 
  <td width="32%"> 
    <input type="text" name="tc_csrjzck_sgddj" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td> 
  <td width="32%"> 
    <input type="text" name="tc_csrjzck_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">录入时间</td> 
  <td width="32%"> 
    <input type="text" name="tc_csrjzck_lrsj" size="20" maxlength="10" >  </td>
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isFloat(FormName.tc_csrjzck_xdb, "下单比"))) {
		return false;
	}
	if(!(isFloat(FormName.tc_csrjzck_sh, "损耗"))) {
		return false;
	}
	if(!(isFloat(FormName.tc_csrjzck_jsj, "结算价"))) {
		return false;
	}
	if(!(isFloat(FormName.tc_csrjzck_khxsdj, "客户销售单价"))) {
		return false;
	}
	if(!(isFloat(FormName.tc_csrjzck_sgddj, "施工队单价"))) {
		return false;
	}
	if(!(isDatetime(FormName.tc_csrjzck_lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
