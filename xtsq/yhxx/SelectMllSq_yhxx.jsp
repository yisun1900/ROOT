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

<form method="post" action="Sq_yhxxMllList.jsp" name="selectform">
      <div align="center">打折－授权</div>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right" bgcolor="#FFFFCC">所属公司</td>
              <td width="30%"> 
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
              <td width="21%" align="right">所属部门</td>
              <td width="29%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeDwbh(selectform)">
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
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" height="2" bgcolor="#FFFFCC"> 
                <div align="right">所属部门小组</div>              </td>
              <td width="30%" height="2"> 
                <select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                </select>              </td>
              <td width="21%" height="2">&nbsp;</td>
              <td width="29%" height="2">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">用户角色</td>
              <td width="30%"> 
                <select name="sq_yhxx_yhjs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="A0">总部</option>
                  <option value="A1">总部各部门</option>
                  <option value="F0">分公司</option>
                  <option value="F1">分公司各部门</option>
                  <option value="F2">店面</option>
                  <option value="F3">设计小组</option>
                  <option value="F4">市场小组</option>
                  <option value="F5">其它小组</option>
                </select>              </td>
              <td width="21%" align="right">客户资料授权范围</td>
              <td width="29%"> 
                <select name="kfgssq" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="0">不授权</option>
                  <option value="1">授权单个分公司</option>
                  <option value="2">授权多个分公司</option>
                  <option value="3">授权单个店面</option>
                  <option value="4">授权某一分公司多个店面</option>
                  <option value="5">授权多个分公司多个店面</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">职务</td>
              <td><select name="xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%>
              </select></td>
              <td align="right">工种</td>
              <td><select name="zwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select zwbm,zwmc from dm_zwbm order by zwbm","");
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">最低折扣 从</td>
              <td><input type="text" name="zkl" size="20" maxlength="17" >              </td>
              <td align="right">到</td>
              <td><input type="text" name="zkl2" size="20" maxlength="17" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">最低毛利率 从</td>
              <td><input type="text" name="zdmll" size="20" maxlength="17" >              </td>
              <td align="right">到</td>
              <td><input type="text" name="zdmll2" size="20" maxlength="17" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">每月申请特殊折扣次数 从</td>
              <td><input type="text" name="sqtszkcs" size="20" maxlength="17" >              </td>
              <td align="right">到</td>
              <td><input type="text" name="sqtszkcs2" size="20" maxlength="17" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">员工序号</td>
              <td width="30%"> 
                <input type="text" name="ygbh" size="20" maxlength="8" >              </td>
              <td width="21%" align="right">工号</td>
              <td width="29%"> 
                <input type="text" name="bianhao" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">用户登陆名</div>              </td>
              <td width="30%"> 
                <input type="text" name="sq_yhxx_yhdlm" size="20" maxlength="16" >              </td>
              <td width="21%" align="right">员工名称</td>
              <td width="29%"> 
                <input type="text" name="sq_yhxx_yhmc" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">设计师报价级别<br>
                （需同时能做几种报价）</td>
              <td width="30%"> 
                <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="5" multiple>
                  <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%> 
                </select>              </td>
              <td width="21%" align="right">设计师报价级别<br>
                （可做某一种报价即可）</td>
              <td width="29%"> 
                <select name="bjjbbm1" style="FONT-SIZE:12PX;WIDTH:152PX" size="5" multiple>
                  <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">是否可看工料分析</td>
              <td width="30%"><input type="radio" name="kkglfx" value="Y">
可看
  <input type="radio" name="kkglfx" value="N">
不可看 </td>
              <td width="21%"> 
                <div align="right">所属授权组</div>              </td>
              <td width="29%"> 
                <select name="yhzbh" style="FONT-SIZE:12px;WIDTH:152px" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhzbh,yhzmc from sq_yhz order by yhzmc","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">允许查看价格明细</td>
              <td width="30%"> 
                <input type="radio" name="ckjgbz"  value="Y">
                可看 
                <input type="radio" name="ckjgbz"  value="N">
                不可看 </td>
              <td width="21%" align="right">重点用户标志</td>
              <td width="29%"> 
                <input type="radio" name="zdyhbz"  value="Y">
                重点用户 
                <input type="radio" name="zdyhbz"  value="N">
                非重点用户 </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">可登陆系统标志</td>
              <td width="30%"> 
                <input type="radio" name="kdlxtbz"  value="Y">
                可登陆 
                <input type="radio" name="kdlxtbz"  value="N">
                不可登陆 </td>
              <td width="21%" align="right">是否授权</td>
              <td width="29%"> 
                <input type="radio" name="sfsq"  value="Y">
                已授权 
                <input type="radio" name="sfsq"  value="N">
                未授权 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">可拷贝标志</td>
              <td width="30%"> 
                <input type="radio" name="kkbbz" value="Y">
                可拷贝 
                <input type="radio" name="kkbbz" value="N">
                不可拷贝 </td>
              <td width="21%" align="right">&nbsp;</td>
              <td width="29%">&nbsp;</td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">时间限制标志</td>
              <td width="30%"> 
                <input type="radio" name="sjxzbz" value="Y">
                限制 
                <input type="radio" name="sjxzbz" value="N">
                不限制 </td>
              <td width="21%" align="right">查看客户电话标志</td>
              <td width="29%"> 
                <input type="radio" name="khdhbz" value="Y">
                可看 
                <input type="radio" name="khdhbz" value="N">
                不可看 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">上班时间</td>
              <td width="30%"> 
                <input type="text" name="sbsj" size="10" maxlength="8"  value="" >
                （24小时整数）</td>
              <td width="21%" align="right">下班时间</td>
              <td width="29%"> 
                <input type="text" name="xbsj" size="10" maxlength="8"  value="" >
                （24小时整数） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">录入时间 从</div>              </td>
              <td width="30%"> 
                <input type="text" name="lrsj" size="20" maxlength="10" >              </td>
              <td width="21%"> 
                <div align="right">到</div>              </td>
              <td width="29%"> 
                <input type="text" name="lrsj2" size="20" maxlength="10" >              </td>
            </tr>
            
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输"></td>
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

var czlx;

function changeFgs(FormName)
{
	czlx=1;

	FormName.dwbh.length=1;
	FormName.sjsbh.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	var sql="select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' order by dwbh";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function changeDwbh(FormName)
{
	czlx=2;

	FormName.sjsbh.length=1;

	if (FormName.dwbh.value=="")
	{
		return;
	}

	var sql="select dwbh,dwmc from sq_dwxx where dwlx='F3' and  cxbz='N' and ssdw='"+FormName.dwbh.value+"' order by dwbh";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	if (czlx==1)
	{
		strToSelect(selectform.dwbh,ajaxRetStr);
	}
	else if (czlx==2)
	{
		strToSelect(selectform.sjsbh,ajaxRetStr);
	}
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.ygbh, "员工序号"))) {
		return false;
	}
	if(!(isFloat(FormName.zkl, "最低折扣"))) {
		return false;
	}
	if(!(isFloat(FormName.zkl2, "最低折扣"))) {
		return false;
	}
	if(!(isFloat(FormName.zdmll, "最低毛利率"))) {
		return false;
	}
	if(!(isFloat(FormName.zdmll2, "最低毛利率"))) {
		return false;
	}
	if(!(isNumber(FormName.sqtszkcs, "每月申请特殊折扣次数"))) {
		return false;
	}
	if(!(isNumber(FormName.sqtszkcs2, "每月申请特殊折扣次数"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}

	FormName.action="Sq_yhxxMllList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
