<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
String ssfgs=(String)session.getAttribute("ssfgs");

String yhdlm=(String)session.getAttribute("yhdlm");
String sjs=cf.executeQuery("select yhmc from sq_yhxx where yhdlm='"+yhdlm+"' and zwbm='04'");
if (sjs==null)
{
	sjs="";
}

%>

<form method="post" action="Crm_khxxScWcList.jsp" name="selectform">
  <div align="center">重做报价－删除完成</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">所属分公司</td>
      <td width="31%"> 
		<select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
		</select>              
      </td>
      <td align="right" width="18%">签约店面</td>
      <td width="32%"> 
		<select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
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
      <td align="right" width="19%">客户编号</td>
      <td width="31%"> 
        <input type="text" name="cw_czbjsqjl_khbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">合同号</td>
      <td width="32%"> 
        <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">客户姓名</td>
      <td width="31%"> 
        <input type="text" name="cw_czbjsqjl_khxm" size="20" maxlength="50" >
      </td>
      <td align="right" width="18%">房屋地址</td>
      <td width="32%"> 
        <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">签约日期 从</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">设计师</td>
      <td width="31%"> 
	 <input type="text" name="crm_khxx_sjs" value="<%=sjs%>" size="20" maxlength="100" <% if (!sjs.equals("")) out.println("readonly");%>>
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">授权时间 从</td>
      <td width="31%"> 
        <input type="text" name="cw_czbjsqjl_sqsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="cw_czbjsqjl_sqsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">授权人</td>
      <td width="31%"> 
        <input type="text" name="cw_czbjsqjl_sqr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">完成人</td>
      <td width="32%"> 
        <input type="text" name="cw_czbjsqjl_wcr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">完成时间 从</td>
      <td width="31%"> 
        <input type="text" name="cw_czbjsqjl_wcsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="cw_czbjsqjl_wcsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">业绩结转时间 从</td>
      <td width="31%"> 
        <input type="text" name="cw_czbjsqjl_yjjzsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="cw_czbjsqjl_yjjzsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">是否需要业绩结转</td>
      <td width="31%">
		<INPUT type="radio" name="cw_czbjsqjl_sfxyjjz" value="Y">需要
		<INPUT type="radio" name="cw_czbjsqjl_sfxyjjz" value="N">不需要	  
      </td>
      <td align="right" width="18%">完成标志</td>
      <td width="32%"> 
        <select name="cw_czbjsqjl_wcbz" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectToken(out,"2+完成","2");
%> 
        </select>
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

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	//启用Ajax
	cf.ajax(out);
%>
function changeFgs(FormName) 
{
	FormName.dwbh.length=1;

	if (FormName.fgsbh.value=="")
	{
		return;
	}

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1：授权单个分公司;2：授权多个分公司
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgsbh.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgsbh.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
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
	if(!(isDatetime(FormName.cw_czbjsqjl_sqsj, "授权时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_czbjsqjl_sqsj2, "授权时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_czbjsqjl_wcsj, "完成时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_czbjsqjl_wcsj2, "完成时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_czbjsqjl_yjjzsj, "业绩结转时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_czbjsqjl_yjjzsj2, "业绩结转时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq2, "签约日期"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
