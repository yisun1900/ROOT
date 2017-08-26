<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>
<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_clpsdCxList.jsp" name="selectform">
<div align="center">材料单查询</div>
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
    <td align="right">工程进度</td>
    <td><select name="crm_khxx_gcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm","");
%>
    </select></td>
    <td align="right">完工标志</td>
    <td><select name="crm_khxx_wgbz" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <option value="1">未开工</option>
      <option value="2">已开工</option>
      <option value="3">已完工</option>
    </select></td>
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
    <td align="right">质检</td>
    <td><input type="text" name="zjxm" size="20" maxlength="20">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">在职施工队</td>
    <td><select name="zzsgd" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('zzsgd')">
        <option value=""></option>
      </select>    </td>
    <td align="right">离职施工队</td>
    <td><select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('sgd')">
        <option value=""></option>
      </select>    </td>
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
  <td align="right" width="18%">材料单号</td> 
  <td width="32%"> 
    <input type="text" name="psph" size="20" maxlength="13" >  </td>
  <td align="right" width="18%">材料单状态</td> 
  <td width="32%"> 
	<select name="psdzt" style="FONT-SIZE:12PX;WIDTH:152PX">
	<option value=""></option>
	<option value="0">等待提交</option>
	<option value="1">等待审核</option>
	<option value="2">等待出库</option>
	<option value="3">已出库</option>
	<option value="5">部分出库</option>
	<option value="6">驳回重新修改</option>
	<option value="7">作废</option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td> 
  <td width="32%"> 
    <input type="text" name="lrr" value="" size="20" maxlength="50">  </td>
  <td align="right" width="18%">配送方式</td> 
  <td width="32%">
    <input type="radio" name="psfs" value="1">配送
    <input type="radio" name="psfs" value="2">自提
    <input type="radio" name="psfs" value="9">其它  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入日期 从</td> 
  <td width="32%"><input type="text" name="lrrq" size="20" maxlength="10"  onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="lrrq2" size="20" maxlength="10"  onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">计划送货时间 从</td>
  <td><input name="jhshsj" type="text" id="jhshsj"  onDblClick="JSCalendar(this)" size="20" maxlength="10"></td>
  <td align="right">到</td>
  <td><input name="jhshsj2" type="text" id="jhshsj2"  onDblClick="JSCalendar(this)" size="20" maxlength="10"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">已出库数量 从 </td>
  <td><input name="ycksl" type="text" id="ycksl"  onDblClick="JSCalendar(this)" size="20" maxlength="10"></td>
  <td align="right">到</td>
  <td><input name="ycksl2" type="text" id="ycksl2"  onDblClick="JSCalendar(this)" size="20" maxlength="10"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">已出库金额 从 </td>
  <td><input name="yckje" type="text" id="yckje"  onDblClick="JSCalendar(this)" size="20" maxlength="10"></td>
  <td align="right">到</td>
  <td><input name="yckje2" type="text" id="yckje2"  onDblClick="JSCalendar(this)" size="20" maxlength="10"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">打印标志</td>
  <td><input type="radio" name="dybz" value="Y">
    打印
      <input type="radio" name="dybz" value="N">
      未打印</td>
  <td align="right">打印人</td>
  <td><input type="text" name="dyr" value="" size="20" maxlength="20"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">打印时间 从</td>
  <td><input name="dysj" type="text" onDblClick="JSCalendar(this)" size="20" maxlength="10"></td>
  <td align="right">到</td>
  <td><input name="dysj2" type="text" onDblClick="JSCalendar(this)" size="20" maxlength="10"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" >显示风格</td>
  <td colspan="3" ><input type="radio" name="xsfg" value="1" checked>
    网页
    <input type="radio" name="xsfg" value="2">
    EXCEL &nbsp;&nbsp;&nbsp;每页显示数量
    <input type="text" name="myxssl" size="7" maxlength="13" value="25">  </td>
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

var fieldName="";
var zzsgdMark=0;
var sgdMark=0;

function changeFgs(FormName) 
{
	FormName.dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	fieldName="dwbh";
	zzsgdMark=0;
	sgdMark=0;

	FormName.zzsgd.length=1;
	FormName.crm_khxx_sgd.length=1;

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

	if (fieldName=="dwbh")
	{
		strToSelect(selectform.dwbh,ajaxRetStr);
	}
	else if (fieldName=="zzsgd")
	{
		strToSelect(selectform.zzsgd,ajaxRetStr);
	}
	else if (fieldName=="sgd")
	{
		strToSelect(selectform.crm_khxx_sgd,ajaxRetStr);
	}
}


function getThis(lx)
{
	var sql;

	fieldName=lx;

	if (selectform.fgs.value=="")
	{
		selectform.fgs.focus();
		alert("请首先选择【分公司】");
		return;
	}

	if (lx=="zzsgd")
	{
		if (zzsgdMark==0)
		{
			sql="select sgd,sgdmc||'（'||DECODE(sq_sgd.sgdlx,'S0','非直属','S1','直属')||'）' from sq_sgd where ssfgs='"+selectform.fgs.value+"' and cxbz='N' order by sgdlx desc,sgdmc";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			zzsgdMark=1;
		}
		else{
			zzsgdMark=2;
		}
	}
	else if (lx=="sgd")
	{
		if (sgdMark==0)
		{
			sql="select sgd,sgdmc||'（'||DECODE(sq_sgd.sgdlx,'S0','非直属','S1','直属')||'）' from sq_sgd where ssfgs='"+selectform.fgs.value+"' and cxbz='Y' order by sgdlx desc,sgdmc";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			sgdMark=1;
		}
		else{
			sgdMark=2;
		}
	}

}



function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.lrrq, "录入日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrrq2, "录入日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.dysj, "打印时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.dysj2, "打印时间"))) {
		return false;
	}
	if(!(isFloat(FormName.ycksl, "已出库数量"))) {
		return false;
	}
	if(!(isFloat(FormName.ycksl2, "已出库数量"))) {
		return false;
	}
	if(!(isFloat(FormName.yckje, "已出库金额"))) {
		return false;
	}
	if(!(isFloat(FormName.yckje2, "已出库金额"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
