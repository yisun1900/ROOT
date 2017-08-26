<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String dwstr=cf.getItemData("select sfxmbm,sfxmmc,dqbm from bdm_sfxmbm where sflx in('1','3','5','6','7','8','9','B','C','D','E') order by dqbm,sfxmbm");

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入数据</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertBj_sfbl.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right">地区名称</td>
  <td width="35%">
  <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(dqbm,sfxmbm,<%=dwstr%>)">
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
  </select></td>
  <td width="15%" align="right">&nbsp;</td>
  <td width="35%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">收费项目</td>
  <td><select name="sfxmbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
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
			cf.selectItem(out,"select sfxmbm,sfxmmc,dqbm from bdm_sfxmbm where sflx in('1','3','5','6','7','8','9','B','C','D','E') and dqbm in(select dqbm from sq_dwxx where dwbh='"+ssfgs+"') order by sfxmbm","");
		}
		else{
			out.println("错误！未进行客户资料授权，请联系系统管理员");
			return;
		}
	%> 

  
  </select></td>
  <td align="right">收费百分比</td>
  <td><input type="text" name="sfbfb" value="" size="10" maxlength="17" >
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right"> 
    起始值>  </td>
  <td width="35%"><input type="text" name="qsz" value="" size="20" maxlength="17" ></td>
  <td width="15%" align="right"> 
    截止值<=  </td>
  <td width="35%"><input type="text" name="jzz" value="" size="20" maxlength="17" ></td>
</tr>

            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">              </td>
            </tr>
        </table>
</form>
	  
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
	if(	javaTrim(FormName.sfxmbm)=="") {
		alert("请选择[收费项目]！");
		FormName.sfxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.sfbfb)=="") {
		alert("请输入[收费百分比]！");
		FormName.sfbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.sfbfb, "收费百分比"))) {
		return false;
	}
	if(	javaTrim(FormName.qsz)=="") {
		alert("请输入[起始值>]！");
		FormName.qsz.focus();
		return false;
	}
	if(!(isFloat(FormName.qsz, "起始值>"))) {
		return false;
	}
	if(	javaTrim(FormName.jzz)=="") {
		alert("请输入[截止值<=]！");
		FormName.jzz.focus();
		return false;
	}
	if(!(isFloat(FormName.jzz, "截止值<="))) {
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区名称]！");
		FormName.dqbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
