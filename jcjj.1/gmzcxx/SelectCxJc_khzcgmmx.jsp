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
<form method="post" action="" name="selectform">
<div align="center">主材购买明细－查询</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFCC">分公司 </td>
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
    </select></td>
    <td align="right"> 签约店面</td>
    <td><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
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
    <td align="right"><font color="#0000CC"><b>客户姓名</b></font></td>
    <td><input type="text" name="khxm" size="20" maxlength="50">    </td>
    <td align="right">客户姓名</td>
    <td><input type="text" name="khxm2" size="14" maxlength="50" >
      （模糊查询） </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC"><b>联系方式</b></font></td>
    <td><input type="text" name="lxfs" size="20" maxlength="50"></td>
    <td align="right">联系方式</td>
    <td><input type="text" name="lxfs2" size="14" maxlength="50">
      （模糊查询） </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC"><b>房屋地址</b></font></td>
    <td colspan="3"><input type="text" name="fwdz" size="71" maxlength="100">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">房屋地址</td>
    <td colspan="3"><input type="text" name="fwdz2" size="65" maxlength="50" >
      （模糊查询） </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td height="23" colspan="4" align="right">&nbsp;</td> 
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">主材大类</td> 
  <td width="32%"> 
    <select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeDl(selectform)">
    <option value=""></option>
<%
	cf.selectItem(out,"select zcdlmc c1,zcdlmc c2 from jdm_zcdlbm  order by zcdlmc","");
%>
    </select>  </td>
  <td align="right" width="19%">主材小类</td> 
  <td width="31%"> 
    <select name="zcxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeXl(selectform)">
    <option value=""></option>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">品牌供应商名称</td>
  <td colspan="3"><select name="ppgys" style="FONT-SIZE:12PX;WIDTH:531PX" onClick="getThis(selectform)">
    <option value=""></option>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">原价</td> 
  <td width="32%"> 
    <input type="text" name="jc_khzcgmmx_yj" size="20" maxlength="17" >  </td>
  <td align="right" width="19%">折后价</td> 
  <td width="31%"> 
    <input type="text" name="jc_khzcgmmx_zhj" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">订金</td> 
  <td width="32%"> 
    <input type="text" name="jc_khzcgmmx_dj" size="20" maxlength="17" >  </td>
  <td align="right" width="19%">实收款</td> 
  <td width="31%"> 
    <input type="text" name="jc_khzcgmmx_ssk" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">日期 从</td> 
  <td width="32%"><input type="text" name="jc_khzcgmmx_rq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="19%">到</td> 
  <td width="31%"><input type="text" name="jc_khzcgmmx_rq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right" bgcolor="#FFFFCC">查询结果排序</td>
  <td colspan="3"> 第一列
    <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
        <option value="zcdlbm">主材大类</option>
        <option value="zcxlbm">主材小类</option>
        <option value="ppgys" selected>品牌供应商</option>
        <option value="rq">日期</option>
        <option value="crm_khxx.khbh">客户编号</option>
        <option value="khxm">客户姓名</option>
        <option value="fwdz">房屋地址</option>
        <option value="sjs">家装设计师</option>
      </select>
    第二列
    <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
      <option value=""></option>
        <option value="zcdlbm">主材大类</option>
        <option value="zcxlbm">主材小类</option>
        <option value="ppgys">品牌供应商</option>
        <option value="rq">日期</option>
        <option value="crm_khxx.khbh">客户编号</option>
        <option value="khxm">客户姓名</option>
        <option value="fwdz">房屋地址</option>
        <option value="sjs">家装设计师</option>
    </select>
    第三列
    <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
      <option value=""></option>
        <option value="zcdlbm">主材大类</option>
        <option value="zcxlbm">主材小类</option>
        <option value="ppgys">品牌供应商</option>
        <option value="rq">日期</option>
        <option value="crm_khxx.khbh">客户编号</option>
        <option value="khxm">客户姓名</option>
        <option value="fwdz">房屋地址</option>
        <option value="sjs">家装设计师</option>
    </select>
    <BR>
    <BR>
    第四列
    <select name="jgpx4" style="FONT-SIZE:12PX;WIDTH:100PX">
      <option value=""></option>
        <option value="zcdlbm">主材大类</option>
        <option value="zcxlbm">主材小类</option>
        <option value="ppgys">品牌供应商</option>
        <option value="rq">日期</option>
        <option value="crm_khxx.khbh">客户编号</option>
        <option value="khxm">客户姓名</option>
        <option value="fwdz">房屋地址</option>
        <option value="sjs">家装设计师</option>
    </select>
    第五列
    <select name="jgpx5" style="FONT-SIZE:12PX;WIDTH:100PX">
      <option value=""></option>
        <option value="zcdlbm">主材大类</option>
        <option value="zcxlbm">主材小类</option>
        <option value="ppgys">品牌供应商</option>
        <option value="rq">日期</option>
        <option value="crm_khxx.khbh">客户编号</option>
        <option value="khxm">客户姓名</option>
        <option value="fwdz">房屋地址</option>
        <option value="sjs">家装设计师</option>
    </select>
    第六列
    <select name="jgpx6" style="FONT-SIZE:12PX;WIDTH:100PX">
      <option value=""></option>
        <option value="zcdlbm">主材大类</option>
        <option value="zcxlbm">主材小类</option>
        <option value="ppgys">品牌供应商</option>
        <option value="rq">日期</option>
        <option value="crm_khxx.khbh">客户编号</option>
        <option value="khxm">客户姓名</option>
        <option value="fwdz">房屋地址</option>
        <option value="sjs">家装设计师</option>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right" >显示风格</td>
  <td colspan="3" ><input type="radio" name="xsfg" value="1" checked>
    网页
    <input type="radio" name="xsfg" value="2">
    EXCEL &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;每页显示数量
    <input type="text" name="myxssl" size="7" maxlength="13" value="25">  </td>
</tr>
<tr align="center">
  <td colspan="4"><input type="button"  value="查询" onClick="f_do(selectform,'cx')">
      <input type="reset"  value="重输">  </td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right">统计表</td>
  <td colspan="3"> 第一列
    <input type="hidden" name="tj1name" value="">
      <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
        <option value=""></option>
        <option value="zcdlbm">主材大类</option>
        <option value="zcxlbm">主材小类</option>
        <option value="ppgys">品牌供应商</option>
        <option value="rq">日期</option>
        <option value="crm_khxx.khbh">客户编号</option>
        <option value="khxm">客户姓名</option>
        <option value="fwdz">房屋地址</option>
        <option value="sjs">家装设计师</option>
      </select>
    第二列
    <input type="hidden" name="tj2name" value="">
    <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
      <option value=""></option>
        <option value="zcdlbm">主材大类</option>
        <option value="zcxlbm">主材小类</option>
        <option value="ppgys">品牌供应商</option>
        <option value="rq">日期</option>
        <option value="crm_khxx.khbh">客户编号</option>
        <option value="khxm">客户姓名</option>
        <option value="fwdz">房屋地址</option>
        <option value="sjs">家装设计师</option>
    </select>
    第三列
    <input type="hidden" name="tj3name" value="">
    <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
      <option value=""></option>
        <option value="zcdlbm">主材大类</option>
        <option value="zcxlbm">主材小类</option>
        <option value="ppgys">品牌供应商</option>
        <option value="rq">日期</option>
        <option value="crm_khxx.khbh">客户编号</option>
        <option value="khxm">客户姓名</option>
        <option value="fwdz">房屋地址</option>
        <option value="sjs">家装设计师</option>
    </select>
    <BR>
    <BR>
    第四列
    <input type="hidden" name="tj4name" value="">
    <select name="tj4" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj4name.value=tj4.options[tj4.selectedIndex].text">
      <option value=""></option>
        <option value="zcdlbm">主材大类</option>
        <option value="zcxlbm">主材小类</option>
        <option value="ppgys">品牌供应商</option>
        <option value="rq">日期</option>
        <option value="crm_khxx.khbh">客户编号</option>
        <option value="khxm">客户姓名</option>
        <option value="fwdz">房屋地址</option>
        <option value="sjs">家装设计师</option>
    </select>
    第五列
    <input type="hidden" name="tj5name" value="">
    <select name="tj5" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj5name.value=tj5.options[tj5.selectedIndex].text">
      <option value=""></option>
        <option value="zcdlbm">主材大类</option>
        <option value="zcxlbm">主材小类</option>
        <option value="ppgys">品牌供应商</option>
        <option value="rq">日期</option>
        <option value="crm_khxx.khbh">客户编号</option>
        <option value="khxm">客户姓名</option>
        <option value="fwdz">房屋地址</option>
        <option value="sjs">家装设计师</option>
    </select>
    第六列
    <input type="hidden" name="tj6name" value="">
    <select name="tj6" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj6name.value=tj6.options[tj6.selectedIndex].text">
      <option value=""></option>
        <option value="zcdlbm">主材大类</option>
        <option value="zcxlbm">主材小类</option>
        <option value="ppgys">品牌供应商</option>
        <option value="rq">日期</option>
        <option value="crm_khxx.khbh">客户编号</option>
        <option value="khxm">客户姓名</option>
        <option value="fwdz">房屋地址</option>
        <option value="sjs">家装设计师</option>
    </select>  </td>
</tr>
<tr align="center">
  <td colspan="4"><input type="button"  value="统计表" onClick="f_do(selectform,'tj')" name="button2">  </td>
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

var czlx;
var gysMark=0;

function changeFgs(FormName)
{
	if (FormName.fgs.value=="")
	{
		return;
	}

	gysMark=0;
	FormName.ppgys.length=1;

	czlx=1;

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

function changeDl(FormName)
{
	czlx=2;

	FormName.zcxlbm.length=1;
	FormName.ppgys.length=1;

	var sql="select zcxlmc from jdm_zcxlbm where zcdlmc='"+FormName.zcdlbm.value+"' order by zcxlmc";
	var actionStr="/ajax/getstr.jsp?sql="+sql;
//	window.open(actionStr);

	openAjax(actionStr);
}

function changeXl(FormName)
{
	gysMark=0;
	FormName.ppgys.length=1;
}

function getThis(FormName)
{
	if (FormName.fgs.value=="")
	{
		selectform.fgs.focus();
		alert("请首先选择【分公司】");
		return;
	}

	czlx=3;

	if (gysMark==0)
	{
		FormName.ppgys.length=1;

		var sql="select sq_gysxx.gysmc c1,sq_gysxx.gysmc c2 from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='"+FormName.fgs.value+"' and sq_gysxx.gyslb='4' and sq_gysxx.zclb='"+FormName.zcxlbm.value+"' order by sq_gysxx.gysmc";
		var actionStr="/ajax/selectstr.jsp?sql="+sql;

		openAjax(actionStr);

		gysMark=1;
	}
}

function getAjax(ajaxRetStr) 
{
	if (czlx==1)
	{
		strToSelect(selectform.dwbh,ajaxRetStr);
	}
	else if (czlx==2)
	{
		strToItem2(selectform.zcxlbm,ajaxRetStr);
	}
	else if (czlx==3)
	{
		strToSelect(selectform.ppgys,ajaxRetStr);
	}
}


function f_do(FormName,lx)//参数FormName:Form的名称
{
	if(!(isFloat(FormName.jc_khzcgmmx_yj, "原价"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_khzcgmmx_zhj, "折后价"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_khzcgmmx_dj, "订金"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_khzcgmmx_ssk, "实收款"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_khzcgmmx_rq, "日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_khzcgmmx_rq2, "日期"))) {
		return false;
	}

	if (lx=="cx")
	{
		FormName.action="Jc_khzcgmmxCxList.jsp";
	}
	else if (lx=="tj")
	{
		if(FormName.tj1.value=="" && FormName.tj2.value=="" && FormName.tj3.value=="" && FormName.tj4.value=="" && FormName.tj5.value=="" && FormName.tj6.value=="")
		{
			alert("请选择[统计列]！");
			FormName.tj1.focus();
			return false;
		}

		FormName.action="Jc_khzcgmmxTjList.jsp";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
