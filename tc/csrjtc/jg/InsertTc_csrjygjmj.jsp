<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertTc_csrjygjmj.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>地区</td> 
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
  <td align="right" width="18%"><font color="#FF0000">*</font>报价级别</td> 
  <td width="32%"> 
    <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>产品大类</td>
  <td><select name="tccpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cldlbm,cldlmc from jxc_cldlbm where cldllb in('1','3') order by cldlmc","");
%>
  </select></td>
  <td align="right"><font color="#FF0000">*</font>产品类别</td>
  <td><select name="tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm order by clxlmc","");
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>是否要求相同品牌</td> 
  <td width="32%"> 
    <input type="radio" name="sfyqxtpp"  value="Y">是
    <input type="radio" name="sfyqxtpp"  value="N">否  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font>计量单位</td> 
  <td width="32%"> 
    <select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
    </select>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>是否可减免</td> 
  <td width="32%"><input type="radio" name="sfkjm"  value="1">
    不可减免
      <input type="radio" name="sfkjm"  value="2">
      可减免 </td>
  <td align="right" width="18%">减免单价</td> 
  <td width="32%"><input type="text" name="jmdj" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>是否限制数量</td>
  <td colspan="3"><input type="radio" name="sfxzsl"  value="1">
    不限制
    <input type="radio" name="sfxzsl"  value="2">
    不许超量
    <input type="radio" name="sfxzsl"  value="3">
    超量单独收费</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>房间标准面积</td>
  <td><input type="text" name="fjbzmj" value="" size="20" maxlength="17" ></td>
  <td align="right"><font color="#FF0000">*</font>对应衣柜平米</td>
  <td><input type="text" name="dyygpm" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>每平米增加面积</td>
  <td><input type="text" name="pmzjmj" value="" size="20" maxlength="17" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>套餐内标志</td>
  <td><input type="radio" name="tcnbz"  value="Y">
    套餐内
    <input type="radio" name="tcnbz"  value="N">
    套餐外</td>
  <td align="right"><font color="#FF0000">*</font>是否必选项</td>
  <td><input type="radio" name="sfbxx"  value="Y">
    必选项
    <input type="radio" name="sfbxx"  value="N">
    否</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td>
  <td><input type="text" name="lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>  </td>
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td>
  <td><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>  </td>
</tr>

    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请选择[报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tccplbbm)=="") {
		alert("请选择[产品类别]！");
		FormName.tccplbbm.focus();
		return false;
	}
	if(!(isNumber(FormName.tccplbbm, "产品类别"))) {
		return false;
	}
	if(	javaTrim(FormName.tccpdlbm)=="") {
		alert("请选择[产品大类]！");
		FormName.tccpdlbm.focus();
		return false;
	}
	if(!(isNumber(FormName.tccpdlbm, "产品大类"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfyqxtpp)) {
		alert("请选择[是否要求相同品牌]！");
		FormName.sfyqxtpp[0].focus();
		return false;
	}
	if(	javaTrim(FormName.jldw)=="") {
		alert("请选择[计量单位]！");
		FormName.jldw.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkjm)) {
		alert("请选择[是否可减免]！");
		FormName.sfkjm[0].focus();
		return false;
	}
	if(	javaTrim(FormName.jmdj)=="") {
		alert("请输入[减免单价]！");
		FormName.jmdj.focus();
		return false;
	}
	if(!(isFloat(FormName.jmdj, "减免单价"))) {
		return false;
	}
	if(	javaTrim(FormName.fjbzmj)=="") {
		alert("请输入[房间标准面积]！");
		FormName.fjbzmj.focus();
		return false;
	}
	if(!(isFloat(FormName.fjbzmj, "房间标准面积"))) {
		return false;
	}
	if(	javaTrim(FormName.dyygpm)=="") {
		alert("请输入[对应衣柜平米]！");
		FormName.dyygpm.focus();
		return false;
	}
	if(!(isNumber(FormName.dyygpm, "对应衣柜平米"))) {
		return false;
	}
	if(	javaTrim(FormName.pmzjmj)=="") {
		alert("请输入[每平米增加面积]！");
		FormName.pmzjmj.focus();
		return false;
	}
	if(!(isFloat(FormName.pmzjmj, "每平米增加面积"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfxzsl)) {
		alert("请选择[是否限制数量]！");
		FormName.sfxzsl[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.tcnbz)) {
		alert("请选择[套餐内标志]！");
		FormName.tcnbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfbxx)) {
		alert("请选择[是否必选项]！");
		FormName.sfbxx[0].focus();
		return false;
	}
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
