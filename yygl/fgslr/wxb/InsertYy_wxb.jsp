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
	String ssbm=(String)session.getAttribute("dwbh");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String zqs=cf.executeQuery("select zqs FROM yy_rqsd  order by yy_rqsd_bzs desc");
	
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<form method="post" action="InsertYy_wxb1.jsp" name="selectform">
<div align="center">网销部录入</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">所属分公司</td>
  <td><select name="yy_wxb_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
  <td align="right">所属部门</td>
  <td><select name="yy_wxb_ssbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
					if (kfgssq.equals("2") || kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
					}
					else if (kfgssq.equals("1") )
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwflbm='10' and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
					}
					else if (kfgssq.equals("3"))
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwflbm='10' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') ","");
					}
					else if (kfgssq.equals("4"))
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwflbm='10' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by dwbh ","");
					}
					else{
						out.println("错误！未进行客户资料授权，请联系系统管理员");
						return;
					}
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="44%">周期数</td> 
  <td width="56%"> 
	<select name="yy_wxb_zqs" style="FONT-SIZE:12PX;WIDTH:252PX" >
	<%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select zqs,'周期'||zqs||'（'||TO_CHAR(yy_rqsd_bzs,'YYYY-MM-DD')||'至'||TO_CHAR(yy_rqsd_bze,'YYYY-MM-DD')||'）' from YY_RQSD  order by yy_rqsd_bzs desc","");
		}
		else{
			cf.selectItem(out,"select zqs,'周期'||zqs||'（'||TO_CHAR(yy_rqsd_bzs,'YYYY-MM-DD')||'至'||TO_CHAR(yy_rqsd_bze,'YYYY-MM-DD')||'）' from YY_RQSD where zqs='"+zqs+"' order by yy_rqsd_bzs desc","");
		}
	%>
	</select>  </td>
  </tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="继续" onClick="f_do(selectform)">
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
<%
	cf.ajax(out);//启用AJAX
%>


function changeFgs(FormName) 
{
	FormName.yy_wxb_ssbm.length=1;

	if (FormName.yy_wxb_ssfgs.value=="")
	{
		return;
	}

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1：授权单个分公司;2：授权多个分公司
	{
		sql="select dwbh,dwmc from sq_dwxx where dwflbm='10' and  cxbz='N' and ssfgs='"+FormName.yy_wxb_ssfgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwflbm='10' and  cxbz='N' and ssfgs='"+FormName.yy_wxb_ssfgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.yy_wxb_ssbm,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yy_wxb_zqs)=="") {
		alert("请输入[周期数]！");
		FormName.yy_wxb_zqs.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_wxb_zqs, "周期数"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_wxb_ssfgs)=="") {
		alert("请输入[所属分公司]！");
		FormName.yy_wxb_ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.yy_wxb_ssbm)=="") {
		alert("请输入[所属部门]！");
		FormName.yy_wxb_ssbm.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
