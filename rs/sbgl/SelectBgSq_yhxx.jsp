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
<form method="post" action="Sq_yhxxBgList.jsp" name="selectform">
<div align="center">社保变更</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="19%" align="right">分公司</td>
	  <td width="31%">
		<select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
		</select>
	  </td>
      <td width="20%" align="right">所属部门</td>
      <td width="30%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <%
			if (kfgssq.equals("2") || kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
			}
			else if (kfgssq.equals("1") )
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+ssfgs+"' order by dwlx,dwbh","");
			}
			else if (kfgssq.equals("3") || kfgssq.equals("4"))
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwlx,dwbh","");
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
      <td align="right" width="19%">员工序号</td>
      <td width="31%"> 
        <input type="text" name="ygbh" size="20" maxlength="8" >
      </td>
      <td align="right" width="20%">工号</td>
      <td width="30%"> 
        <input type="text" name="bianhao" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">员工名称</td>
      <td width="31%"> 
        <input type="text" name="yhmc" size="20" maxlength="50" >
      </td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">身份证号</td>
      <td width="31%"> 
        <input type="text" name="sfzh" size="20" maxlength="20" >
      </td>
      <td align="right" width="20%">行政职务</td>
      <td width="30%"> 
        <select name="xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">是否参加保险</td>
      <td width="31%"><%
	cf.radioToken(out, "sfcjbx","Y+参保&N+未办理&T+停保&Z+转出","");
%></td>
      <td align="right" width="20%">是否缴纳医疗保险</td>
      <td width="30%"> 
        <input type="radio" name="ylbx" value="Y">
        是 
        <input type="radio" name="ylbx" value="N">
        否 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">是否缴纳养老保险</td>
      <td width="31%"> 
        <input type="radio" name="jylbx" value="Y">
        是 
        <input type="radio" name="jylbx" value="N">
        否 </td>
      <td align="right" width="20%">是否缴纳失业保险</td>
      <td width="30%"> 
        <input type="radio" name="sybx" value="Y">
        是 
        <input type="radio" name="sybx" value="N">
        否 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">是否缴纳工伤保险</td>
      <td width="31%"> 
        <input type="radio" name="gsby" value="Y">
        是 
        <input type="radio" name="gsby" value="N">
        否 </td>
      <td align="right" width="20%">是否缴纳生育保险</td>
      <td width="30%"> 
        <input type="radio" name="syx" value="Y">
        是 
        <input type="radio" name="syx" value="N">
        否 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">社会保险号</td>
      <td width="31%"> 
        <input type="text" name="shbxh" size="20" maxlength="20" >
      </td>
      <td align="right" width="20%">交纳基数</td>
      <td width="30%"> 
        <input type="text" name="yjsxe" size="20" maxlength="16" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">社保办理时间 从</td>
      <td width="31%"> 
        <input type="text" name="sbblsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="20%">到</td>
      <td width="30%"> 
        <input type="text" name="sbblsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">劳动合同编号</td>
      <td width="31%"> 
        <input type="text" name="ldhtbh" value="" size="20" maxlength="14">
      </td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">劳动合同类型</td>
      <td width="31%"> 
        <select name="ldhtlx" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ldhtlx c1,ldhtlx c2 from dm_ldhtlx order by ldhtlxbm","");
%> 
        </select>
      </td>
      <td align="right" width="20%"><font color="#000099"></font>劳动合同期限</td>
      <td width="30%"> 
        <select name="ldhtqx" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ldhtqx c1,ldhtqx c2  from dm_ldhtqx order by ldhtqxbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">合同开始日期 从</td>
      <td width="31%"> 
        <input type="text" name="htksrq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="20%">到</td>
      <td width="30%"> 
        <input type="text" name="htksrq2" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">合同到期日期 从</td>
      <td width="31%"> 
        <input type="text" name="htdqrq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="20%">到</td>
      <td width="30%"> 
        <input type="text" name="htdqrq2" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
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
	cf.ajax(out);//启用AJAX
%>


function changeFgs(FormName) 
{
	FormName.dwbh.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	var sql="select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' order by dwlx,dwbh";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.dwbh,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.ygbh, "员工序号"))) {
		return false;
	}
	if(!(isDatetime(FormName.htksrq, "合同开始日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.htksrq2, "合同开始日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.htdqrq, "合同到期日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.htdqrq2, "合同到期日期"))) {
		return false;
	}
	if(!(isFloat(FormName.yjsxe, "交纳基数"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
