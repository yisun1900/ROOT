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
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Gdm_gdjcjlCxList.jsp" name="selectform">
<div align="center">工地监察记录－查询</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td align="right"> 分公司 </td>
    <td><select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
    <td align="right"> 签约店面 </td>
    <td><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  >
        <%
					if (kfgssq.equals("2") || kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
					}
					else if (kfgssq.equals("1") )
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
					}
					else if (kfgssq.equals("3"))
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') ","");
					}
					else if (kfgssq.equals("4"))
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by dwbh ","");
					}
					else{
						out.println("错误！未进行客户资料授权，请联系系统管理员");
						return;
					}
					%>
      </select>    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">监察记录号</td> 
  <td width="32%"> 
    <input type="text" name="gdm_gdjcjl_jcjlh" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">客户编号</td> 
  <td width="32%"> 
    <input type="text" name="gdm_gdjcjl_khbh" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">施工队</td> 
  <td width="32%"> 
    <input type="text" name="gdm_gdjcjl_sgd" size="20" maxlength="5" >  </td>
  <td align="right" width="18%">客户姓名</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">房屋地址</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >  </td>
  <td align="right" width="18%">设计师</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">检查人</td> 
  <td width="32%"> 
    <input type="text" name="gdm_gdjcjl_xjr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">检查时间从</td>
  <td><input type="text" name="gdm_gdjcjl_xjsj" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="gdm_gdjcjl_xjsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">信息来源</td> 
  <td width="32%"> 
    <select name="gdm_gdjcjl_xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select xxlybm,xxlymc from gdm_xxlybm order by xxlybm","");
%>
    </select>  </td>
  <td align="right" width="18%">监察类型</td> 
  <td width="32%"> 
    <select name="gdm_gdjcjl_jclxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jclxbm,jclxmc from gdm_jclxbm order by jclxbm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">监察结果</td> 
  <td width="32%"> 
    <select name="gdm_gdjcjl_jcjgbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jcjgbm,jcjgmc from gdm_jcjgbm order by jcjgbm","");
%>
    </select>  </td>
  <td align="right" width="18%">问题分类</td> 
  <td width="32%"> 
    <select name="gdm_gdjcjl_jcwtflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jcwtflbm,jcwtflmc from gdm_jcwtflbm order by jcwtflbm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">罚款审批标志</td> 
  <td colspan="3"> 
<%
	cf.radioToken(out, "gdm_gdjcjl_cfspbz","1+不需审批&2+未审批&3+审批通过&4+审批未通过","");
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">罚款审批时间从</td>
  <td><input type="text" name="gdm_gdjcjl_spsj" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="gdm_gdjcjl_spsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">罚款审批人</td> 
  <td width="32%"><input type="text" name="gdm_gdjcjl_spr" size="20" maxlength="20" ></td>
  <td align="right" width="18%">是否发生整改</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "gdm_gdjcjl_sffszg","Y+发生&N+未发生","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">客户要求解决时间从</td>
  <td><input type="text" name="gdm_gdjcjl_yqjjsj" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="gdm_gdjcjl_yqjjsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">责任部门</td> 
  <td width="32%"><select name="gdm_gdjcjl_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
%>
  </select></td>
  <td align="right" width="18%">责任人</td> 
  <td width="32%"><input type="text" name="gdm_gdjcjl_zrr" size="20" maxlength="20" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否需领导处理</td> 
  <td colspan="3"> 
<%
	cf.radioToken(out, "gdm_gdjcjl_sfxldcl","Y+需要未处理&N+不需要&C+已处理","");
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">领导要求解决时间从</td>
  <td><input type="text" name="gdm_gdjcjl_ldyqjjsj" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="gdm_gdjcjl_ldyqjjsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">领导处理人</td> 
  <td width="32%"> 
    <input type="text" name="gdm_gdjcjl_ldclr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">领导处理时间从</td>
  <td><input type="text" name="gdm_gdjcjl_ldclsj" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="gdm_gdjcjl_ldclsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">接收时间从</td>
  <td><input type="text" name="gdm_gdjcjl_jssj" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="gdm_gdjcjl_jssj2" size="20" maxlength="10" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">计划出方案时间从</td>
  <td><input type="text" name="gdm_gdjcjl_jhcfasj" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="gdm_gdjcjl_jhcfasj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">接收人</td> 
  <td width="32%"><input type="text" name="gdm_gdjcjl_jsr" size="20" maxlength="20" ></td>
  <td align="right" width="18%">出方案记录号</td> 
  <td width="32%"> 
    <input type="text" name="gdm_gdjcjl_cfajlh" size="20" maxlength="13" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">实际出方案时间从</td>
  <td><input type="text" name="gdm_gdjcjl_sjcfasj" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="gdm_gdjcjl_sjcfasj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">实际出方案人</td> 
  <td width="32%"><input type="text" name="gdm_gdjcjl_sjcfar" size="20" maxlength="20" ></td>
  <td align="right" width="18%">方案审核人</td> 
  <td width="32%"><input type="text" name="gdm_gdjcjl_shr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">计划解决时间从</td> 
  <td width="32%"> 
    <input type="text" name="gdm_gdjcjl_jhjjsj" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">从</td> 
  <td width="32%"><input type="text" name="gdm_gdjcjl_jhjjsj2" size="20" maxlength="10" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">方案审核时间从</td>
  <td><input type="text" name="gdm_gdjcjl_shsj" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="gdm_gdjcjl_shsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">最新处理时间从</td>
  <td><input type="text" name="gdm_gdjcjl_clsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="gdm_gdjcjl_clsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">处理记录号</td> 
  <td width="32%"> 
    <input type="text" name="gdm_gdjcjl_cljlh" size="20" maxlength="13" >  </td>
  <td align="right" width="18%">最新处理人</td> 
  <td width="32%"><input type="text" name="gdm_gdjcjl_clr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">处理状态</td> 
  <td colspan="3"><%
	cf.radioToken(out, "gdm_gdjcjl_clzt","1+未接收&2+已接收等待出方案&D+已接收不需出方案&7+已出方案等待审核&8+已出方案不需审核&9+方案审核通过&A+方案审核未通过&3+已解决&B+在处理","");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">考评标志</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "gdm_gdjcjl_kpbz","N+未考评&Y+已考评","");
%>  </td>
  <td align="right" width="18%">考评记录号</td> 
  <td width="32%"> 
    <input type="text" name="gdm_gdjcjl_kpjlh" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">结算标志</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "gdm_gdjcjl_jsbz","N+未结算&Y+已结算","");
%>  </td>
  <td align="right" width="18%">结算记录号</td> 
  <td width="32%"> 
    <input type="text" name="gdm_gdjcjl_jsjlh" size="20" maxlength="9" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入时间从</td>
  <td><input type="text" name="gdm_gdjcjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="gdm_gdjcjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td> 
  <td width="32%"> 
    <input type="text" name="gdm_gdjcjl_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
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


function changeFgs(FormName) 
{
	FormName.dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1：授权单个分公司;2：授权多个分公司
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.dwbh,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.gdm_gdjcjl_xjsj, "检查时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_xjsj2, "检查时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_spsj, "罚款审批时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_spsj2, "罚款审批时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_yqjjsj, "客户要求解决时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_yqjjsj2, "客户要求解决时间"))) {
		return false;
	}

	if(!(isDatetime(FormName.gdm_gdjcjl_ldyqjjsj, "领导要求解决时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_ldyqjjsj2, "领导要求解决时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_ldclsj, "领导处理时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_ldclsj2, "领导处理时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_jssj, "接收时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_jssj2, "接收时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_jhcfasj, "计划出方案时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_jhcfasj2, "计划出方案时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_sjcfasj, "实际出方案时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_sjcfasj2, "实际出方案时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_jhjjsj, "计划解决时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_shsj, "方案审核时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_shsj2, "方案审核时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_clsj, "最新处理时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_clsj2, "最新处理时间"))) {
		return false;
	}
	if(!(isNumber(FormName.gdm_gdjcjl_kpjlh, "考评记录号"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
