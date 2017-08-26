<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">修改结案信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" bgcolor="#FFFFCC"> 
                <div align="right">分公司</div>
              </td>
              <td width="31%"> 
				<select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
			  </td>
              <td width="21%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="29%"> 
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
              <td width="19%" align="right">合同号</td>
              <td width="31%"> 
                <input type="text" name="hth" size="20" maxlength="20">
              </td>
              <td width="21%" align="right">客户编号</td>
              <td width="29%"> 
                <input type="text" name="khbh" size="20" maxlength="20">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">设计师</td>
              <td width="31%"> 
                <input type="text" name="sjs" size="20" maxlength="20">
              </td>
              <td width="21%" align="right">质检</td>
              <td width="29%"> 
                <input type="text" name="zjxm" size="20" maxlength="20">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC"><b>客户姓名</b></font></td>
              <td width="31%"> 
                <input type="text" name="khxm" size="20" maxlength="50">
              </td>
              <td width="21%" align="right">客户姓名</td>
              <td width="29%"> 
                <input type="text" name="khxm2" size="14" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right"><font color="#0000CC"><b>联系方式</b></font></div>
              </td>
              <td width="31%"> 
                <input type="text" name="lxfs" size="20" maxlength="50">
              </td>
              <td width="21%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="29%"> 
                <input type="text" name="lxfs2" size="14" maxlength="50">
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC"><b>房屋地址</b></font></td>
              <td colspan="3"> 
                <input type="text" name="fwdz" size="71" maxlength="100">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">房屋地址</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="fwdz2" size="65" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td colspan="4">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">相关责任部门处理情况</td>
              <td width="31%"> 
                <select name="zrbmclzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">未处理</option>
                  <option value="2">在处理</option>
                  <option value="3">已解决</option>
                </select>
              </td>
              <td width="21%"> 
                <div align="right"></div>
              </td>
              <td width="29%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">投诉报修记录号</td>
              <td width="31%"> 
                <input type="text" name="crm_tsjl_tsjlh" size="20" maxlength="10" >
              </td>
              <td width="21%"> 
                <div align="right">类型</div>
              </td>
              <td width="29%"> 
                <input type="radio" name="lx" value="1">
                投诉 
                <input type="radio" name="lx" value="2">
                报修 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">录入时间 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_tsjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="21%"> 
                <div align="right">到</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_tsjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">录入人</td>
              <td width="31%"> 
                <input type="text" name="crm_tsjl_lrr" size="20" maxlength="20" >
              </td>
              <td width="21%" align="right">客服受理人</td>
              <td width="29%"> 
                <input type="text" name="crm_tsjl_slr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">客服受理时间 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_tsjl_slsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="21%"> 
                <div align="right">到</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_tsjl_slsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">要求解决时间 从</td>
              <td width="31%"> 
                <input type="text" name="crm_tsjl_yqjjsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="21%" align="right">到</td>
              <td width="29%"> 
                <input type="text" name="crm_tsjl_yqjjsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">结案时间 从</td>
              <td width="31%"> 
                <input type="text" name="crm_tsjl_jasj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="21%" align="right">到</td>
              <td width="29%"> 
                <input type="text" name="crm_tsjl_jasj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
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
	if(!(isDatetime(FormName.crm_tsjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_lrsj2, "录入时间"))) {
		return false;
	}

	if(!(isDatetime(FormName.crm_tsjl_slsj, "客服受理时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_slsj2, "客服受理时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_yqjjsj, "要求解决时间 "))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_yqjjsj2, "要求解决时间 "))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_jasj, "结案时间 "))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_jasj2, "结案时间 "))) {
		return false;
	}


	FormName.action="Crm_tsjlXgJaList.jsp";

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
