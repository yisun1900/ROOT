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
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_ppgysdzbList.jsp" name="selectform">
<div align="center">主材－对照表维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">分公司</td>
  <td width="32%"><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
  </select></td>
  <td width="18%" align="right">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">子品牌</td> 
  <td><select name="ppbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changePp(selectform)">
    <option value=""></option>
    <%
		cf.selectItem(out,"select jxc_ppxx.ppbm,jxc_ppxx.ppmc from jxc_ppxx where jxc_ppxx.pplb='1' order by ppmc","");
%>
  </select></td>
  <td align="right">子品牌</td>
  <td><input name="ppmc" type="text"  value="" size="20" maxlength="50"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应商</td> 
  <td><select name="gysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
  </select></td>
  <td align="right">供应商</td>
  <td><input name="gysmc" type="text"  value="" size="20" maxlength="50"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">用户登录名</td>
  <td><input type="text" name="yhdlm" size="20" maxlength="16" >  </td>
  <td align="right">用户口令</td>
  <td><input type="text" name="yhkl" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">用户名称</td>
  <td><input type="text" name="yhmc" size="20" maxlength="20" >  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">可登陆系统标志</td>
  <td><input type="radio" name="kdlxtbz" value="Y">
    可登陆
    <input type="radio" name="kdlxtbz" value="N">
    不可登陆 </td>
  <td align="right">是否锁定</td>
  <td><input type="radio" name="sfsd" value="Y">
    锁定
    <input type="radio" name="sfsd" value="N">
    未锁定 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">已经登陆失败次数</td>
  <td><input type="text" name="lxdlsbcs" size="20" maxlength="8" ></td>
  <td align="right">到</td>
  <td><input type="text" name="lxdlsbcs2" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">密码修改时间</td>
  <td><input type="text" name="mmxgsj" size="20" maxlength="10" >  </td>
  <td align="right">到</td>
  <td><input type="text" name="mmxgsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">密码使用周期</td>
  <td><input type="text" name="mmsyzq" size="20" maxlength="8" >
    天 </td>
  <td align="right">到</td>
  <td><input type="text" name="mmsyzq2" size="20" maxlength="8" >
    天 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">允许登陆失败次数</td>
  <td><input type="text" name="yxdlsbcs" size="20" maxlength="8" >  </td>
  <td align="right">到</td>
  <td><input type="text" name="yxdlsbcs2" size="20" maxlength="8" ></td>
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


<%
	cf.ajax(out);//启用AJAX
%>


function changeFgs(FormName) 
{
	if (FormName.ssfgs.value=="")
	{
		return;
	}

	FormName.gysbm.length=1;

	var sql;
	sql="select jxc_gysxx.gysbm,jxc_gysxx.gysmc||DECODE(jxc_gysxx.sfhz,'Y','（合作）','N','（不合作）') from jxc_gysxx where jxc_gysxx.cllx='1'  and dqbm in(select dqbm from sq_dwxx where dwbh='"+FormName.ssfgs.value+"') order by sfhz desc,gysmc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;


//	window.open(actionStr);
	openAjax(actionStr);
}


function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.gysbm,ajaxRetStr);
}


function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.ppbm, "子品牌编码"))) {
		return false;
	}
	if(!(isNumber(FormName.gysbm, "供应商编码"))) {
		return false;
	}
	if(!(isNumber(FormName.lxdlsbcs, "已经登陆失败次数"))) {
		return false;
	}
	if(!(isDatetime(FormName.mmxgsj, "密码修改时间"))) {
		return false;
	}
	if(!(isNumber(FormName.mmsyzq, "密码使用周期"))) {
		return false;
	}
	if(!(isNumber(FormName.yxdlsbcs, "允许登陆失败次数"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
