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
String dwbh=(String)session.getAttribute("dwbh");

String yhmc=(String)session.getAttribute("yhmc");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_scbkhgzjlJlCxList.jsp" name="selectform">
<div align="center">客户跟踪记录－经理查询</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFCC">
  <td align="right">所属分公司</td>
  <td>
		<select name="crm_scbkhxx_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
		<%
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
		%> 
		</select>			  </td>
  <td align="right">录入部门</td>
  <td><select name="crm_scbkhxx_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <%
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
			%> 
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">记录号</td> 
  <td width="32%"> 
    <input type="text" name="crm_scbkhgzjl_jlh" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">市场部客户编号</td> 
  <td width="32%"> 
    <input type="text" name="crm_scbkhgzjl_scbkhbh" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">客户姓名</td> 
  <td width="32%"> 
    <input type="text" name="crm_scbkhxx_khxm" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">房屋地址</td> 
  <td width="32%"> 
    <input type="text" name="crm_scbkhxx_fwdz" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">电话</td> 
  <td width="32%"> 
    <input type="text" name="crm_scbkhxx_lxfs" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">业务员</td> 
  <td width="32%"> 
    <input type="text" name="crm_scbkhxx_ywy" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">所属小组</td> 
  <td width="32%"> 
    <input type="text" name="ywyssxz" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">状态</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "crm_scbkhxx_zt","1+跟踪&2+失败&3+移交","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">跟踪录入人</td> 
  <td width="32%"> 
    <input type="text" name="crm_scbkhgzjl_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">跟踪录入时间 从</td> 
  <td width="32%"><input type="text" name="crm_scbkhgzjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">到 </td>
  <td width="32%"><input type="text" name="crm_scbkhgzjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
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
	//启用Ajax
	cf.ajax(out);
%>

function changeFgs(FormName)
{
	FormName.crm_scbkhgzjl_lrbm.length=1;

	if (FormName.crm_scbkhxx_ssfgs.value=="")
	{
		return;
	}


	var sql;
	sql="select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+FormName.crm_scbkhxx_ssfgs.value+"' order by cxbz,dwbh";


	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.crm_scbkhgzjl_lrbm,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.crm_scbkhgzjl_lrsj, "跟踪录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhgzjl_lrsj2, "跟踪录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
