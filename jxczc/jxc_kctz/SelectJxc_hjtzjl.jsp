<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

%>


<html>
<head>
<title>货架调整维护</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_hjtzjlList.jsp" name="selectform">
<div align="center">货架调整维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">调整批号</td> 
  <td width="32%"> 
    <input type="text" name="tzph" size="20" maxlength="11" >  </td>
  <td align="right" width="18%">所属分公司</td> 
  <td width="32%">
  <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
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
  <td align="right" width="18%">仓库</td> 
  <td width="32%"> 
   <select name="ckbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
		out.print("<option value=\"\"></option>");
	cf.selectItem(out,"select jxc_ckmc.ckbh,ckmc from jxc_ckmc,jxc_kgy where jxc_ckmc.ckbh=jxc_kgy.ckbh and  jxc_kgy.yhdlm='"+yhdlm+"' order by ckmc","");
%>
  </select>  </td>
  <td align="right" width="18%">录入人</td> 
  <td width="32%"><input type="text" name="lrr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入时间 从</td> 
  <td width="32%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="lrsj2" size="20" maxlength="10"  onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">处理状态</td>
  <td><input type="radio" name="clzt" value="0">
    未提交
    <input type="radio" name="clzt" value="9">
    提交 </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
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
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
