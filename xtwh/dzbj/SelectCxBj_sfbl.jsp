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
	String dwstr=cf.getItemData("select sfxmbm,sfxmmc,dqbm from bdm_sfxmbm where sflx in('1','3','5','6','7','8') order by dqbm,sfxmbm");
%>
<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">收费比率－查询</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Bj_sfblCxList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">序号</div>
  </td>
  <td width="35%"> 
    <input type="text" name="bj_sfbl_xh" size="20" maxlength="8" >
  </td>
  <td width="15%"> 
    <div align="right">收费项目</div>
  </td>
  <td width="35%"> 
    <select name="bj_sfbl_sfxmbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
	<%
		if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{

		}
		else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{

		}
		else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
		{
			cf.selectItem(out,"select sfxmbm,sfxmmc,dqbm from bdm_sfxmbm where sflx in('1','3','5','6','7','8','9') and dqbm in(select dqbm from sq_dwxx where dwbh='"+ssfgs+"') order by sfxmbm","");
		}
		else{
			out.println("错误！未进行客户资料授权，请联系系统管理员");
			return;
		}
	%> 
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">收费百分比</div>
  </td>
  <td width="35%"> 
    <input type="text" name="bj_sfbl_sfbfb" size="20" maxlength="17" >
  </td>
  <td width="15%"> 
    <div align="right">起始值></div>
  </td>
  <td width="35%"> 
    <input type="text" name="bj_sfbl_qsz" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">截止值<=</div>
  </td>
  <td width="35%"> 
    <input type="text" name="bj_sfbl_jzz" size="20" maxlength="17" >
  </td>
  <td width="15%"> 
    <div align="right">地区名称</div>
  </td>
  <td width="35%"> 
    <select name="bj_sfbl_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(bj_sfbl_dqbm,bj_sfbl_sfxmbm,<%=dwstr%>)">
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
    </select>
  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">
  </td>
</tr>
</table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.bj_sfbl_xh, "序号"))) {
		return false;
	}
	if(!(isFloat(FormName.bj_sfbl_sfbfb, "收费百分比"))) {
		return false;
	}
	if(!(isFloat(FormName.bj_sfbl_qsz, "起始值>"))) {
		return false;
	}
	if(!(isFloat(FormName.bj_sfbl_jzz, "截止值<="))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
