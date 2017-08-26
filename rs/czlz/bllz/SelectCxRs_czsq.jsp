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
<form method="post" action="Rs_czsqCxList.jsp" name="selectform">
  <div align="center">办理离职</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="17%">所属分公司</td>
      <td width="33%"> 
        <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onchange="changeFgs(selectform)">
<%
	if (kfgssq.equals("2"))//2：授权多个分公司
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh",ssfgs);
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
	}
%> 
        </select>
      </td>
      <td align="right" width="18%">所属部门</td>
      <td width="32%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <%
	if (!kfgssq.equals("2"))//2：授权多个分公司
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">员工序号</td>
      <td width="33%"> 
        <input type="text" name="rs_czsq_ygbh" size="20" maxlength="8" >
      </td>
      <td align="right" width="18%">员工名称</td>
      <td width="32%"> 
        <input type="text" name="rs_czsq_yhmc" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">性别</td>
      <td width="33%"> <%
	cf.radioToken(out, "rs_czsq_xb","M+男&W+女","");
%> </td>
      <td align="right" width="18%">职务</td>
      <td width="32%"> 
        <select name="rs_czsq_xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" colspan="4" height="31">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">辞职申请序号</td>
      <td width="33%"> 
        <input type="text" name="rs_czsq_sqxh" size="20" maxlength="10" >
      </td>
      <td align="right" width="18%">离职原因分类</td>
      <td width="32%">
        <select name="lzyyflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select lzyyflbm,lzyyflmc from dm_lzyyflbm order by lzyyflbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">录入人</td>
      <td width="33%"> 
        <input type="text" name="rs_czsq_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">录入部门</td>
      <td width="32%"> 
        <select name="rs_czsq_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select a.dwbh,a.dwmc||'（'||b.dwmc||'）' from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh  and a.dwlx in('A0','A1','F0','F1','F2') and  a.cxbz='N' and a.ssfgs='"+ssfgs+"' order by a.ssfgs,a.dwlx,a.dwbh","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">录入时间 从</td>
      <td width="33%"> 
        <input type="text" name="rs_czsq_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="rs_czsq_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">申请日期 从</td>
      <td width="33%"> 
        <input type="text" name="sqrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="sqrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" colspan="4" height="32">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">处理状态</td>
      <td width="33%"> 
        <select name="rs_czsq_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="00">不需审批</option>
          <option value="03">审批通过</option>
        </select>
      </td>
      <td align="right" width="18%">审批状态</td>
      <td width="32%"> 
        <select name="rs_czsq_ztbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ztbm,ztmc from rs_ztbm where ztlx='13' order by ztbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">审批序号</td>
      <td width="33%"> 
        <input type="text" name="rs_czsq_spxh" size="20" maxlength="16" >
      </td>
      <td align="right" width="18%">审核结论</td>
      <td width="32%"> 
        <select name="rs_czsq_shjl" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select shjl,shjlmc from rs_shjlbm order by shjl","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">审核时间 从</td>
      <td width="33%"> 
        <input type="text" name="rs_czsq_shsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="rs_czsq_shsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">审核人</td>
      <td width="33%"> 
        <input type="text" name="rs_czsq_shr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="查询" onClick="f_do(selectform)">
        <input type="reset"  value="重输">
      </td>
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
	//启用Ajax
	cf.ajax(out);
%>

var czlx;

function changeFgs(FormName)
{
	FormName.dwbh.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	var sql="select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' order by dwbh";
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请输入[所属公司]！");
		FormName.ssfgs.focus();
		return false;
	}

	if(!(isNumber(FormName.rs_czsq_ygbh, "员工序号"))) {
		return false;
	}

	if(!(isDatetime(FormName.rs_czsq_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_czsq_lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sqrq, "申请日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.sqrq2, "申请日期"))) {
		return false;
	}
	if(!(isNumber(FormName.rs_czsq_spxh, "审批序号"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_czsq_shsj, "审核时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_czsq_shsj2, "审核时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
