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
<form method="post" action="Yx_lqlpdjXgTlpList.jsp" name="selectform">
  <div align="center">退礼品－修改</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="18%"> 
        <div align="right">客户所属分公司</div>
      </td>
      <td width="32%"> 
		<select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
		<%
			if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
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
		</select>			  </td>
      <td width="19%"> 
        <div align="right">咨询店面</div>
      </td>
      <td width="31%"> 
        <select name="crm_zxkhxx_zxdm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">客户编号</td>
      <td width="32%"> 
        <input type="text" name="yx_lqlpdj_khbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">客户姓名</td>
      <td width="31%"> 
        <input type="text" name="crm_zxkhxx_khxm" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">房屋地址</td>
      <td width="32%"> 
        <input type="text" name="crm_zxkhxx_fwdz" size="20" maxlength="100" >
      </td>
      <td align="right" width="19%">联系方式</td>
      <td width="31%"> 
        <input type="text" name="crm_zxkhxx_lxfs" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">设计师</td>
      <td width="32%"> 
        <input type="text" name="crm_zxkhxx_sjs" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">&nbsp;</td>
      <td width="31%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">礼品名称</td>
      <td width="32%"> 
        <input type="text" name="yx_lqlpdj_lpmc" size="20" maxlength="50" >
      </td>
      <td align="right" width="19%">礼品数量</td>
      <td width="31%"> 
        <input type="text" name="yx_lqlpdj_lpsl" size="20" maxlength="8" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">领取时间 从</td>
      <td width="32%"> 
        <input type="text" name="yx_lqlpdj_lqsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">到</td>
      <td width="31%"> 
        <input type="text" name="yx_lqlpdj_lqsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">录入人</td>
      <td width="32%"> 
        <input type="text" name="yx_lqlpdj_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">&nbsp;</td>
      <td width="31%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">录入时间 从</td>
      <td width="32%"> 
        <input type="text" name="yx_lqlpdj_lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">到</td>
      <td width="31%"> 
        <input type="text" name="yx_lqlpdj_lrsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">是否退回</td>
      <td width="32%"> 
        <input type="radio" name="yx_lqlpdj_shth" value="2" checked>
        退回 </td>
      <td align="right" width="19%">退回登记人</td>
      <td width="31%"> 
        <input type="text" name="yx_lqlpdj_thdjr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">退回登记时间 从</td>
      <td width="32%"> 
        <input type="text" name="yx_lqlpdj_thdjsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">到 </td>
      <td width="31%"> 
        <input type="text" name="yx_lqlpdj_thdjsj2" size="20" maxlength="10" >
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
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	//启用Ajax
	cf.ajax(out);
%>

function changeFgs(FormName)
{
	FormName.crm_zxkhxx_zxdm.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1：授权单个分公司;2：授权多个分公司
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.crm_zxkhxx_zxdm,ajaxRetStr);
}
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.yx_lqlpdj_lpsl, "礼品数量"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_lqlpdj_lqsj, "领取时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_lqlpdj_lqsj2, "领取时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_lqlpdj_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_lqlpdj_lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_lqlpdj_thdjsj, "退回登记时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_lqlpdj_thdjsj2, "退回登记时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
