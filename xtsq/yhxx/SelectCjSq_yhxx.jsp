<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
//20100904
String kfgssq=(String)session.getAttribute("kfgssq");
String ygbh=(String)session.getAttribute("ygbh");
String ssfgs=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");

%>
<body bgcolor="#FFFFFF">

<form method="post" action="Sq_yhxxCjList.jsp" name="selectform">
      <div align="center">用户授权</div>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right" bgcolor="#FFFFCC">所属公司</td>
              <td width="30%"> 
             <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
               <!--<option value=""></option>-->
                <%
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
//%> 
<%
	if (kfgssq.equals("2"))//2：授权多个分公司
	{
		out.println("<option value=\"\"></option>");
		//cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh",ssfgs);
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
	}
%> 
                </select>              </td>
              <td width="21%" align="right">所属部门</td>
              <td width="29%"> 
            <!--   <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeDwbh(selectform)">-->
				<select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <!--  <option value=""></option>-->
				                <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx in('F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	/*else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}*/
%> 
                </select>             </td>
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
              <td width="20%" align="right">IP地址限制标志</td>
              <td width="30%"> 
                <input type="radio" name="ipxzbz" value="Y">
                限制 
                <input type="radio" name="ipxzbz" value="N">
                不限制 </td>
              <td width="21%" align="right">IP地址</td>
              <td width="29%"> 
                <input type="text" name="ipdz" size="20" maxlength="20"  value="" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">网卡地址限制标志</td>
              <td width="30%"> 
                <input type="radio" name="wkxzbz" value="Y">
                限制 
                <input type="radio" name="wkxzbz" value="N">
                不限制 </td>
              <td width="21%" align="right">网卡地址</td>
              <td width="29%"> 
                <input type="text" name="wkdz" size="20" maxlength="20"  value="" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">提醒方式</td>
              <td colspan="3"><input type="radio" name="txfs"  value="1">
                系统
                <input type="radio" name="txfs"  value="2">
                电话
                <input type="radio" name="txfs"  value="3">
                传真
                <input type="radio" name="txfs"  value="4">
                短信
                <input type="radio" name="txfs"  value="9">
                全部 </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">提醒间隔 从</td>
              <td><input name="txjg" type="text" id="txjg" size="20" maxlength="10" ></td>
              <td align="right">到</td>
              <td><input name="txjg2" type="text" id="txjg2" size="20" maxlength="10" ></td>
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
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">查询结果排序</td>
              <td colspan="3"> 第一列 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value="sq_yhxx.dwbh">所属单位</option>
                  <option value="sq_yhxx.yhmc">员工名称</option>
                  <option value="sq_yhxx.bianhao">工号</option>
                  <option value="sq_yhxx.yhdlm">ERP用户名</option>
                  <option value="sq_yhxx.sjsjb">设计师职称</option>
                  <option value="sq_yhxx.bjjb">设计师报价级别</option>
                  <option value="sq_yhxx.ygbh">序号</option>
                  <option value="sq_yhxx.zwbm">工种</option>
                  <option value="sq_yhxx.kdlxtbz">可登陆</option>
                  <option value="sq_yhxx.yhjs">用户角色</option>
                  <option value="sq_yhxx.sfzszg">员工状态</option>
                </select>
                第二列 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="sq_yhxx.dwbh">所属单位</option>
                  <option value="sq_yhxx.yhmc">员工名称</option>
                  <option value="sq_yhxx.bianhao">工号</option>
                  <option value="sq_yhxx.yhdlm">ERP用户名</option>
                  <option value="sq_yhxx.sjsjb">设计师职称</option>
                  <option value="sq_yhxx.bjjb">设计师报价级别</option>
                  <option value="sq_yhxx.ygbh">序号</option>
                  <option value="sq_yhxx.zwbm">工种</option>
                  <option value="sq_yhxx.kdlxtbz">可登陆</option>
                  <option value="sq_yhxx.yhjs">用户角色</option>
                  <option value="sq_yhxx.sfzszg">员工状态</option>
                </select>
                第三列 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="sq_yhxx.dwbh">所属单位</option>
                  <option value="sq_yhxx.yhmc">员工名称</option>
                  <option value="sq_yhxx.bianhao">工号</option>
                  <option value="sq_yhxx.yhdlm">ERP用户名</option>
                  <option value="sq_yhxx.sjsjb">设计师职称</option>
                  <option value="sq_yhxx.bjjb">设计师报价级别</option>
                  <option value="sq_yhxx.ygbh">序号</option>
                  <option value="sq_yhxx.zwbm">工种</option>
                  <option value="sq_yhxx.kdlxtbz">可登陆</option>
                  <option value="sq_yhxx.yhjs">用户角色</option>
                  <option value="sq_yhxx.sfzszg">员工状态</option>
                </select>
                <br>
                第四列 
                <select name="jgpx4" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="sq_yhxx.dwbh">所属单位</option>
                  <option value="sq_yhxx.yhmc">员工名称</option>
                  <option value="sq_yhxx.bianhao">工号</option>
                  <option value="sq_yhxx.yhdlm">ERP用户名</option>
                  <option value="sq_yhxx.sjsjb">设计师职称</option>
                  <option value="sq_yhxx.bjjb">设计师报价级别</option>
                  <option value="sq_yhxx.ygbh">序号</option>
                  <option value="sq_yhxx.zwbm">工种</option>
                  <option value="sq_yhxx.kdlxtbz">可登陆</option>
                  <option value="sq_yhxx.yhjs">用户角色</option>
                  <option value="sq_yhxx.sfzszg">员工状态</option>
                </select>
                第五列 
                <select name="jgpx5" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="sq_yhxx.dwbh">所属单位</option>
                  <option value="sq_yhxx.yhmc">员工名称</option>
                  <option value="sq_yhxx.bianhao">工号</option>
                  <option value="sq_yhxx.yhdlm">ERP用户名</option>
                  <option value="sq_yhxx.sjsjb">设计师职称</option>
                  <option value="sq_yhxx.bjjb">设计师报价级别</option>
                  <option value="sq_yhxx.ygbh">序号</option>
                  <option value="sq_yhxx.zwbm">工种</option>
                  <option value="sq_yhxx.kdlxtbz">可登陆</option>
                  <option value="sq_yhxx.yhjs">用户角色</option>
                  <option value="sq_yhxx.sfzszg">员工状态</option>
                </select>
                第六列 
                <select name="jgpx6" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="sq_yhxx.dwbh">所属单位</option>
                  <option value="sq_yhxx.yhmc">员工名称</option>
                  <option value="sq_yhxx.bianhao">工号</option>
                  <option value="sq_yhxx.yhdlm">ERP用户名</option>
                  <option value="sq_yhxx.sjsjb">设计师职称</option>
                  <option value="sq_yhxx.bjjb">设计师报价级别</option>
                  <option value="sq_yhxx.ygbh">序号</option>
                  <option value="sq_yhxx.zwbm">工种</option>
                  <option value="sq_yhxx.kdlxtbz">可登陆</option>
                  <option value="sq_yhxx.yhjs">用户角色</option>
                  <option value="sq_yhxx.sfzszg">员工状态</option>
                </select>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">
                <input type="button" onClick="f_do1(selectform)"  value="批量设置设计师可操做报价级别">
                <input type="button" onClick="f_do2(selectform)"  value="批量设置登陆时间"></td>
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
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isNumber(FormName.txjg, "提醒间隔"))) {
		return false;
	}

	FormName.action="Sq_yhxxCjList.jsp";
	FormName.submit();
	return true;
}
function f_do1(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请输入[分公司]！");
		FormName.ssfgs.focus();
		return false;
	}

	if(!(isNumber(FormName.ygbh, "员工序号"))) {
		return false;
	}

	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}

	FormName.action="ChooseBjjb.jsp";
	FormName.submit();
	return true;
}

function f_do2(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请输入[分公司]！");
		FormName.ssfgs.focus();
		return false;
	}

	if(!(isNumber(FormName.ygbh, "员工序号"))) {
		return false;
	}

	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}

	FormName.action="EnterDlsj.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
