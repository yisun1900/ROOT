<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<style type="text/css">
<!--
.STYLE1 {color: #0000CC; font-weight: bold; }
-->
</style>
<%
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_khsmjlZjList.jsp" name="selectform">
<div align="center">维护上门情况</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFCC">所属分公司</td>
    <td bgcolor="#FFFFCC">
	<select name="crm_khsmjl_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
      </select>	  </td>
    <td align="right" bgcolor="#FFFFCC">接待人部门 </td>
    <td bgcolor="#FFFFCC">
	<select name="crm_khsmjl_jdrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeBm(selectform)">
        <%
		if (kfgssq.equals("2") || kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			out.println("<option value=\"\"></option>");
		}
		else if (kfgssq.equals("1") )
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx not in('F3','F4') and ssfgs='"+ssfgs+"' order by dwlx desc,dwbh","");
		}
		else if (kfgssq.equals("3"))
		{
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') ","");
		}
		else if (kfgssq.equals("4"))
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by dwlx desc,dwbh ","");
		}
		else{
			out.println("错误！未进行客户资料授权，请联系系统管理员");
			return;
		}
		%>
    </select>	</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">接待人</span></td>
    <td><select name="jdrbh" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
    </select></td>
    <td align="right">接待人</td>
    <td><input type="text" name="jdr" size="14" maxlength="20" >
    （模糊查询）</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">记录号</td> 
  <td width="32%"> 
    <input type="text" name="crm_khsmjl_jlh" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">客户编号</td> 
  <td width="32%"> 
    <input type="text" name="crm_khsmjl_khbh" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">客户姓名</span></td>
  <td><input type="text" name="khxm" size="20" maxlength="20" >  </td>
  <td align="right">客户姓名</td>
  <td><input type="text" name="khxm2" size="14" maxlength="20" >
    （模糊查询）</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">房屋地址 </span></td>
  <td><input type="text" name="fwdz" size="20" maxlength="100" ></td>
  <td align="right">房屋地址</td>
  <td><input type="text" name="fwdz2" size="14" maxlength="100" >
    （模糊查询）</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">联系方式 </span></td>
  <td><input type="text" name="lxfs" size="20" maxlength="50" ></td>
  <td align="right">联系方式</td>
  <td><input type="text" name="lxfs2" size="14" maxlength="50" >
    （模糊查询）</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">设计师</td> 
  <td width="32%"> 
    <input type="text" name="crm_zxkhxx_sjs" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">上门目的</td> 
  <td width="32%">
  <select name="crm_khsmjl_smmd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select smmd c1,smmd c2 from dm_smmd order by smmd","");
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">上门时间 从</td>
  <td><input type="text" name="crm_khsmjl_smsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_khsmjl_smsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<%
if (yhjs.equals("A0"))
{
	%>
	<tr bgcolor="#FFFFFF">
	  <td align="right">录入人</td>
	  <td><input type="text" name="crm_khsmjl_lrr" size="20" maxlength="20" value=""></td>
	  <td align="right">录入部门</td>
	  <td>
		<select name="crm_khsmjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
			<option value=""></option>
		</select>	  </td>
	</tr>
	<%
}
else {
	%>
	<tr bgcolor="#FFFFFF">
	  <td align="right">录入人</td>
	  <td><input type="text" name="crm_khsmjl_lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly></td>
	  <td align="right">录入部门</td>
	  <td>
		<select name="crm_khsmjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
			<%
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
			%>
		</select>	  </td>
	</tr>
	<%
}
%>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入时间 从</td> 
  <td width="32%"><input type="text" name="crm_khsmjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="crm_khsmjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">状态</td>
  <td><INPUT type="radio" name="crm_khsmjl_zt" value="2" checked>
    已录结果	</td>
  <td align="right">
  上门次数
  </td>
  <td><select name="lfcs" style="FONT-SIZE:12PX;WIDTH:152PX">
   <option value=""></option>
        <%
	cf.selectToken(out,"1+第一次&2+第二次&3+第三次&4+第四次&5+第五次&6+第六次&7+第七次&8+第八次&9+第九次","");
%> 
   </select></td>
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
<%
	cf.ajax(out);//启用AJAX
%>

var lx;

function changeFgs(FormName) 
{
	FormName.crm_khsmjl_jdrbm.length=1;

	if (FormName.crm_khsmjl_ssfgs.value=="")
	{
		return;
	}

	lx="1";

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1：授权单个分公司;2：授权多个分公司
	{
		sql="select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx not in('F3','F4') and ssfgs='"+FormName.crm_khsmjl_ssfgs.value+"' order by cxbz,dwlx desc,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx not in('F3','F4') and ssfgs='"+FormName.crm_khsmjl_ssfgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwlx desc,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function changeBm(FormName) 
{
	FormName.jdrbh.length=1;

	if (FormName.crm_khsmjl_jdrbm.value=="")
	{
		return;
	}

	lx="2";

	var sql;
	sql =" select sq_yhxx.ygbh,sq_yhxx.yhmc||'（'||xzzwbm||'）' c1";
	sql+=" from sq_yhxx ";
	sql+=" where sq_yhxx.dwbh='"+FormName.crm_khsmjl_jdrbm.value+"' ";
	sql+=" and sq_yhxx.sfzszg in('Y','N') ";

	sql+=" UNION ";

	sql+=" select sq_yhxx.ygbh,sq_yhxx.yhmc||'（'||xzzwbm||'）' c1";
	sql+=" from sq_yhxx,sq_sqbm ";
	sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+FormName.crm_khsmjl_jdrbm.value+"' ";
	sql+=" and sq_yhxx.sfzszg in('Y','N') ";

	sql+=" ORDER BY c1";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	if (lx=="1")
	{
		strToSelect(selectform.crm_khsmjl_jdrbm,ajaxRetStr);
	}
	else{
		strToSelect(selectform.jdrbh,ajaxRetStr);
	}
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.crm_khsmjl_smsj, "上门时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khsmjl_smsj2, "上门时间"))) {
		return false;
	}
	if(!(isNumber(FormName.jdrbh, "接待人编号"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khsmjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khsmjl_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
