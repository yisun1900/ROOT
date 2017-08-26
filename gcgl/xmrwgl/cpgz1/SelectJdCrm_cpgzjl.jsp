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
<form method="post" action="Crm_cpgzjlJdList.jsp" name="selectform">
<div align="center">录入状态信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">  </td>
</tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"> 分公司 </td>
    <td><select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
        <%
					if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and  dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
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
    <td align="right">签约日期 从</td>
    <td><input type="text" name="qyrq" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)"></td>
    <td align="right">到</td>
    <td><input type="text" name="qyrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">合同号</td>
    <td><input type="text" name="hth" size="20" maxlength="20">    </td>
    <td align="right">客户编号</td>
    <td><input type="text" name="khbh" size="20" maxlength="20">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">设计师</td>
    <td><input type="text" name="sjs" size="20" maxlength="20">    </td>
    <td align="right">工程担当</td>
    <td><input type="text" name="zjxm" size="20" maxlength="20">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC"><b>客户姓名</b></font></td>
    <td><input type="text" name="khxm" size="20" maxlength="50">    </td>
    <td align="right">客户姓名</td>
    <td><input type="text" name="khxm2" size="14" maxlength="50" >
      （模糊查询） </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC"><b>联系方式</b></font> </td>
    <td><input type="text" name="lxfs" size="20" maxlength="50">    </td>
    <td align="right"> 联系方式 </td>
    <td><input type="text" name="lxfs2" size="14" maxlength="50">
      （模糊查询） </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC"><b>房屋地址</b></font></td>
    <td colspan="3"><input type="text" name="fwdz" size="71" maxlength="100">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> 房屋地址 </td>
    <td colspan="3"><input type="text" name="fwdz2" size="65" maxlength="50" >
      （模糊查询） </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
    </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="20%">产品分类</td> 
  <td width="30%"><select name="crm_cpgzjl_cpflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cpflbm,cpflmc from dm_cpflbm order by cpflbm","");
%>
  </select></td>
  <td align="right" width="20%">产品状态</td> 
  <td width="30%"><select name="crm_cpgzjl_cpztbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select cpztbm,cpztmc from dm_cpztbm order by cpztbm","");
%>
    </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">产品类型</td> 
  <td width="30%"> 
<%
	cf.radioToken(out, "crm_cpgzjl_cplx","1+定制品&2+成品","");
%>  </td>
  <td align="right" width="20%">产品安装类型</td> 
  <td width="30%"> 
<%
	cf.radioToken(out, "crm_cpgzjl_cpazlx","1+施工类&2+安装类","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">供货方</td> 
  <td width="30%"> 
<%
	cf.radioToken(out, "crm_cpgzjl_ghf","甲供+甲供&公司供+公司供&未确认+未确认","");
%>  </td>
  <td align="right" width="20%">甲供品牌</td> 
  <td width="30%"> 
    <input type="text" name="crm_cpgzjl_jgpp" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">供货方获知时间</td> 
  <td width="30%"> 
    <input type="text" name="crm_cpgzjl_ghfhzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="20%">是否交底后新订单</td> 
  <td width="30%"> 
<%
	cf.radioToken(out, "crm_cpgzjl_sfxdd","Y+是&N+否","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">是否需后续管理</td> 
  <td width="30%"> 
<%
	cf.radioToken(out, "crm_cpgzjl_sfxhxgl","Y+是&N+否","");
%>  </td>
  <td align="right" width="20%">选型是否完成</td> 
  <td width="30%"> 
<%
	cf.radioToken(out, "crm_cpgzjl_zxsfwz","Y+是&N+否","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">是否需返补</td> 
  <td colspan="3">
	<INPUT type="radio" name="crm_cpgzjl_sfxfb" value="N">无返补
	<INPUT type="radio" name="crm_cpgzjl_sfxfb" value="Y">等待返补
	<INPUT type="radio" name="crm_cpgzjl_sfxfb" value="W">返补成功
	<INPUT type="radio" name="crm_cpgzjl_sfxfb" value="S">返补失败  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">是否有异常</td> 
  <td colspan="3">
	<INPUT type="radio" name="crm_cpgzjl_sfyyc" value="N">无异常
	<INPUT type="radio" name="crm_cpgzjl_sfyyc" value="Y">等待处理
	<INPUT type="radio" name="crm_cpgzjl_sfyyc" value="W">异常解决成功
	<INPUT type="radio" name="crm_cpgzjl_sfyyc" value="S">异常解决失败  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">返补单编号</td>
  <td><input type="text" name="crm_cpgzjl_fbdbh" size="20" maxlength="10" ></td>
  <td align="right">异常单编号</td>
  <td><input type="text" name="crm_cpgzjl_ycdbh" size="20" maxlength="10" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">提醒日期</td> 
  <td width="30%"><input type="text" name="crm_cpgzjl_txrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="20%">到</td> 
  <td width="30%"><input type="text" name="crm_cpgzjl_txrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">是否需提醒</td> 
  <td width="30%"><%
	cf.radioToken(out, "crm_cpgzjl_sfxtx","Y+需提醒&N+否","");
%></td>
  <td align="right" width="20%">产品设计师</td> 
  <td width="30%"><input type="text" name="crm_cpgzjl_cpsjs" size="20" maxlength="30" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">录入时间 从 </td> 
  <td width="30%"><input type="text" name="crm_cpgzjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="20%">到</td> 
  <td width="30%"><input type="text" name="crm_cpgzjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入人</td>
  <td><input type="text" name="crm_cpgzjl_lrr" size="20" maxlength="20" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC">最晚应进场日期 从</td>
  <td bgcolor="#FFFFCC"><input type="text" name="crm_cpgzjl_zwyjcrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" bgcolor="#FFFFCC">到</td>
  <td bgcolor="#FFFFCC"><input type="text" name="crm_cpgzjl_zwyjcrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">计划入库时间 从</td>
  <td><input type="text" name="crm_cpgzjl_jhrksj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_cpgzjl_jhrksj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC">计划送货时间 从      </td>
  <td bgcolor="#FFFFCC"><input type="text" name="crm_cpgzjl_jhshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" bgcolor="#FFFFCC">到</td>
  <td bgcolor="#FFFFCC"><input type="text" name="crm_cpgzjl_jhshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">计划安装时间 从</td>
  <td><input type="text" name="crm_cpgzjl_jhazsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_cpgzjl_jhazsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC">状态发生时间 从</td>
  <td bgcolor="#FFFFCC"><input type="text" name="crm_cpgzjl_ztfssj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" bgcolor="#FFFFCC"> 到</td>
  <td bgcolor="#FFFFCC"><input type="text" name="crm_cpgzjl_ztfssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">实入库时间 从</td>
  <td><input type="text" name="crm_cpgzjl_srksj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_cpgzjl_srksj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC">实送货时间 从</td>
  <td bgcolor="#FFFFCC"><input type="text" name="crm_cpgzjl_sshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" bgcolor="#FFFFCC">到</td>
  <td bgcolor="#FFFFCC"><input type="text" name="crm_cpgzjl_sshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">首次上门安装时间 从</td>
  <td><input type="text" name="crm_cpgzjl_scazsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_cpgzjl_scazsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC">安装完成时间 从</td>
  <td bgcolor="#FFFFCC"><input type="text" name="crm_cpgzjl_azwcsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" bgcolor="#FFFFCC">到</td>
  <td bgcolor="#FFFFCC"><input type="text" name="crm_cpgzjl_azwcsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
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
	if(!(isDatetime(FormName.crm_cpgzjl_ghfhzsj, "供货方获知时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_txrq, "提醒日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_txrq2, "提醒日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_lrsj2, "录入时间"))) {
		return false;
	}

	
	if(!(isDatetime(FormName.crm_cpgzjl_zwyjcrq, "最晚应进场日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_zwyjcrq2, "最晚应进场日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_jhrksj, "计划入库时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_jhrksj2, "计划入库时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_jhshsj, "计划送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_jhshsj2, "计划送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_jhazsj, "计划安装时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_jhazsj2, "计划安装时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_ztfssj, "状态发生时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_ztfssj2, "状态发生时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_srksj, "实入库时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_srksj2, "实入库时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_sshsj, "实送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_sshsj2, "实送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_scazsj, "首次上门安装时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_scazsj2, "首次上门安装时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_azwcsj, "安装完成时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpgzjl_azwcsj2, "安装完成时间"))) {
		return false;
	}
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
