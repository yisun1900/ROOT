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
<form method="post" action="Cw_sgdfkjlList.jsp" name="selectform">
<div align="center">施工队罚款－维护</div>
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
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">罚款记录号</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdfkjl_fkjlh" size="20" maxlength="9" >  </td>
  <td align="right" width="19%">施工队</td> 
  <td width="31%"> 
  <select name="cw_sgdfkjl_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','（已撤销）','N','') from sq_sgd where ssfgs='"+ssfgs+"' order by cxbz,sgdmc","");
%>	
  </select>	</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">罚款时间 从</td>
  <td><input type="text" name="cw_sgdfkjl_fksj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="cw_sgdfkjl_fksj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">罚款人</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdfkjl_fkr" size="20" maxlength="20" >  </td>
  <td align="right" width="19%">罚款金额</td> 
  <td width="31%"> 
    <input type="text" name="cw_sgdfkjl_fkje" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">审核人</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdfkjl_shr" size="20" maxlength="20" >  </td>
  <td align="right" width="19%">审核时间</td> 
  <td width="31%"> 
    <input type="text" name="cw_sgdfkjl_shsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">实扣款人</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdfkjl_skkr" size="20" maxlength="20" >  </td>
  <td align="right" width="19%">罚单编号</td> 
  <td width="31%"><input name="fdbh" type="text" id="fdbh" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">实扣款时间 从</td>
  <td><input type="text" name="cw_sgdfkjl_skksj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="cw_sgdfkjl_skksj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从</td>
  <td><input type="text" name="cw_sgdfkjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="cw_sgdfkjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td> 
  <td width="32%"><input type="text" name="cw_sgdfkjl_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="19%">录入部门</td> 
  <td width="31%"> 
    <select name="cw_sgdfkjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">删除标志</td> 
  <td width="32%"> 
    <INPUT name="cw_sgdfkjl_scbz" type="radio" value="N" checked>未删除</td>
  <td align="right" width="19%">状态</td> 
  <td width="31%"><input name="cw_sgdfkjl_zt" type="radio" value="1" checked>
    未审核</td>
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
	FormName.cw_sgdfkjl_sgd.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1：授权单个分公司;2：授权多个分公司
	{
		sql="select sgd,sgdmc from sq_sgd where  cxbz='N' and ssfgs='"+FormName.fgs.value+"' order by sgdmc";
	}
	else{
		sql="select sgd,sgdmc from sq_sgd where  cxbz='N' and ssfgs='"+FormName.fgs.value+"' order by sgdmc";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.cw_sgdfkjl_sgd,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.cw_sgdfkjl_fksj, "罚款时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sgdfkjl_fksj2, "罚款时间"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdfkjl_fkje, "罚款金额"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sgdfkjl_shsj, "审核时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sgdfkjl_skksj, "实扣款时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sgdfkjl_skksj2, "实扣款时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sgdfkjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sgdfkjl_lrsj2, "录入时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
