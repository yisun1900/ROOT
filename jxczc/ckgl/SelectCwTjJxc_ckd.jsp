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
<form method="post" action="" name="selectform">
<div align="center">出库单－财务统计</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  
  <tr bgcolor="#FFFFCC">
    <td width="18%" align="right"> 分公司 </td>
    <td width="32%"><select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX">
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
      </select>    </td>
    <td width="18%" align="right">&nbsp;</td>
    <td width="32%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">出库时间 从</td>
    <td><input type="text" name="cksj" size="20" maxlength="10" value="<%=cf.firstDay()%>" onDblClick="JSCalendar(this)"></td>
    <td align="right">到</td>
    <td><input type="text" name="cksj2" size="20" maxlength="10" value="<%=cf.lastDay()%>" onDblClick="JSCalendar(this)"></td>
  </tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button" onClick="f_do(selectform,'qbcltj')"  value="全部材料分类统计" >
    <input name="button" type="button" onClick="f_do(selectform,'fgscltj')"  value="分公司材料分类统计" >
    <input  type="button" onClick="f_do(selectform,'khtj')"  value="客户用量统计" >
    <input  type="button" onClick="f_do(selectform,'khtj1')"  value="客户标准用量统计" >
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

function f_do(FormName,lx)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.cksj)=="") {
		alert("请输入[出库时间]！");
		FormName.cksj.focus();
		return false;
	}
	if(!(isDatetime(FormName.cksj, "出库时间"))) {
		return false;
	}
	if(	javaTrim(FormName.cksj2)=="") {
		alert("请输入[出库时间]！");
		FormName.cksj2.focus();
		return false;
	}
	if(!(isDatetime(FormName.cksj2, "出库时间"))) {
		return false;
	}

	if (lx=="qbcltj")
	{

		FormName.action="Jxc_ckmxAllClTjList.jsp";
	}
	else if (lx=="fgscltj")
	{

		FormName.action="Jxc_ckmxFgsClTjList.jsp";
	}
	else if (lx=="khtj")
	{
		if(	javaTrim(FormName.fgs)=="") {
			alert("请输入[分公司]！");
			FormName.fgs.focus();
			return false;
		}

		FormName.action="Jxc_ckmxKhTjList.jsp";
	}
	else if (lx=="khtj1")
	{
		if(	javaTrim(FormName.fgs)=="") {
			alert("请输入[分公司]！");
			FormName.fgs.focus();
			return false;
		}

		FormName.action="Jxc_ckmxKhTjList1.jsp";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
