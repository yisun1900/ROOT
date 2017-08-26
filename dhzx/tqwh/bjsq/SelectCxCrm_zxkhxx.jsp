<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE3 {color: #0000CC; font-weight: bold; }
-->
</style>
</head>


<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">

<form method="post" action="Crm_zxkhxxCxList.jsp" name="selectform">
<div align="center">导出报价授权</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr bgcolor="#FFFFCC"> 
	  <td width="19%" align="right" bgcolor="#FFFFCC"> 
		客户所属分公司              </td>
	  <td width="31%">
		<select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
		</select>			  </td>
	  <td width="18%" align="right"> 
		咨询店面              </td>
	  <td width="32%"> 
		<select name="zxdm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="sjsbhMark=0;sjsbh.length=1;">
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
		</select>              </td>
	</tr>
	<tr bgcolor="#FFFFCC"> 
	  <td width="19%" align="right">部门小组</td>
	  <td width="31%"> 
		<select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('sjsbh')">
		  <option value=""></option>
		</select>              </td>
	  <td width="18%" align="right">信息审核标志</td>
	  <td width="32%"> 
		<input type="radio" name="shbz" value="Y">
		已审核 
		<input type="radio" name="shbz" value="N">
		未审核 </td>
	</tr>
	<tr bgcolor="#FFFFCC"> 
	  <td width="19%" align="right">是否做电子报价</td>
	  <td width="31%"> 
		<input type="radio" name="sfzdzbj" value="N">
		未做报价 
		<input type="radio" name="sfzdzbj" value="Y">
		已做 </td>
	  <td width="18%" align="right">家装标志</td>
	  <td width="32%"> 
		<input type="radio" name="jzbz" value="1">
		家装 
		<input type="radio" name="jzbz" value="2">
		公装 </td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right">有效信息标志</td>
	  <td><input type="radio" name="yzxxbz" value="Y">
		有效信息
		  <input type="radio" name="yzxxbz" value="N">
	  无效信息</td>
	  <td align="right">付量房订金标志</td>
	  <td><select name="lfdjbz" style="FONT-SIZE:12PX;WIDTH:152PX">
		<option value=""></option>
		<option value="0">未交量房订金</option>
		<option value="1">已交量房订金</option>
		<option value="2">已退订金</option>
	  </select></td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right"> 
		客户编号              </td>
	  <td width="31%"> 
		<input type="text" name="crm_zxkhxx_khbh" size="20" maxlength="7" >              </td>
	  <td width="18%" align="right">预算审核标志</td>
	  <td width="32%"><INPUT type="radio" name="ysshbz" value="N">
	    未审核
	    <INPUT type="radio" name="ysshbz" value="Y">
审核通过
<INPUT type="radio" name="ysshbz" value="M">
未通过</td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right"><span class="STYLE3">客户姓名</span></td>
	  <td width="31%"> 
		<input type="text" name="khxm" size="20" maxlength="20" >              </td>
	  <td width="18%" align="right">客户姓名</td>
	  <td width="32%"> 
		<input type="text" name="khxm2" size="14" maxlength="20" >
		（模糊查询）</td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"><span class="STYLE3">房屋地址 </span></td>
	  <td><input type="text" name="fwdz" size="20" maxlength="100" ></td>
	  <td align="right">房屋地址</td>
	  <td><input type="text" name="fwdz2" size="14" maxlength="100" >
	  （模糊查询）</td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"><span class="STYLE3">联系方式 </span></td>
	  <td><input type="text" name="lxfs" size="20" maxlength="50" ></td>
	  <td align="right">联系方式</td>
	  <td> <input type="text" name="lxfs2" size="14" maxlength="50" >
	  （模糊查询）</td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right">设计师</td>
	  <td><input type="text" name="sjs" value="" size="20" maxlength="20">              </td>
	  <td align="right">业务员</td>
	  <td><input type="text" name="ywy" value="" size="20" maxlength="20">              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right">参加促销活动</td>
	  <td colspan="3"><select name="cxhdbm" style="FONT-SIZE:12PX;WIDTH:516PX" onclick="getThis('cxhdbm')">
		<option value=""></option>
	  </select></td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right">咨询状态</td>
	  <td width="31%"> 
		<select name="crm_zxkhxx_zxzt" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value=""></option>
		  <option value="0">未分配店面</option>
		  <option value="1">分配店面</option>
		  <option value="2">设计师提交飞单</option>
		  <option value="5">飞单审核未通过</option>
		</select>              </td>
	  <td width="18%" align="right">小区</td>
	  <td width="32%"><input type="text" name="xqbm" value="" size="20" maxlength="50" ></td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"> 录入时间 从 </td>
	  <td><input type="text" name="crm_zxkhxx_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	  <td align="right"> 到 </td>
	  <td><input type="text" name="crm_zxkhxx_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right">信息录入人</td>
	  <td width="31%"><input type="text" name="crm_zxkhxx_lrr" size="20" maxlength="20" value="" ></td>
	  <td width="18%" align="right">关系客户</td>
	  <td width="32%"><select name="crm_zxkhxx_khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('khlxbm');">
		<option value=""></option>
	  </select></td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right"> 
		是否需回访              </td>
	  <td width="31%">
		<INPUT type="radio" name="crm_zxkhxx_sfxhf" value="Y">需回访
		<INPUT type="radio" name="crm_zxkhxx_sfxhf" value="N">不需回访			  </td>
	  <td width="18%" align="right"> 
		最新回访时间              </td>
	  <td width="32%"> 
		<input type="text" name="crm_zxkhxx_zxhfsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right">回访日期 从</td>
	  <td width="31%"> 
		<input type="text" name="crm_zxkhxx_hfrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	  <td width="18%" align="right">到</td>
	  <td width="32%"> 
		<input type="text" name="crm_zxkhxx_hfrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right"> 
		回单标志              </td>
	  <td width="31%"> 
		<select name="crm_zxkhxx_hdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value=""></option>
		  <option value="1">非回单</option>
		  <option value="3">施工队回单</option>
		  <option value="2">设计师回单</option>
		  <option value="4">老客户回单</option>
		  <option value="5">员工回单</option>
		  <option value="6">班长回单</option>
		  <option value="7">售楼处</option>
		  <option value="8">材料商</option>
		  <option value="9">其他</option>
		</select>              </td>
	  <td width="18%" align="right"> 
		回单人              </td>
	  <td width="32%"> 
		<input name="hdr" type="text" value="" maxlength="20" size="20">              </td>
	</tr>
	
	<tr bgcolor="#FFFFCC"> 
	  <td width="19%" align="right">查询结果排序</td>
	  <td colspan="3"> 第一列 
		<select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
		  <option value="crm_zxkhxx.khbh desc">客户编号</option>
		  <option value="crm_zxkhxx.lrsj desc">录入时间</option>
		  <option value="crm_zxkhxx.khxm">客户姓名</option>
		  <option value="crm_zxkhxx.fwdz">房屋地址</option>
		  <option value="crm_zxkhxx.lxfs">联系方式</option>
		  <option value="crm_zxkhxx.nlqjbm">年龄区间</option>
		  <option value="crm_zxkhxx.ysrbm">月收入</option>
		  <option value="crm_zxkhxx.zybm">职业</option>
		  <option value="crm_zxkhxx.sjs">设计师</option>
		  <option value="crm_zxkhxx.jhjfsj">计划交房时间</option>
		  <option value="crm_zxkhxx.yjzxsj">预计装修时间</option>
		  <option value="crm_zxkhxx.zxzt">咨询状态</option>
		  <option value="crm_zxkhxx.zxdm">咨询店面</option>
		  <option value="crm_zxkhxx.sbyybm">失败原因</option>
		  <option value="crm_zxkhxx.ywy">业务员</option>
		  <option value="crm_zxkhxx.cqbm">所属城区</option>
		  <option value="crm_zxkhxx.xqbm">小区</option>
		  <option value="crm_zxkhxx.rddqbm">热点地区</option>
		  <option value="crm_zxkhxx.hxwzbm">环线位置</option>
		  <option value="crm_zxkhxx.cxhdbm">参加促销活动</option>
		</select>
		第二列 
		<select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
		  <option value=""></option>
		  <option value="crm_zxkhxx.khbh desc">客户编号</option>
		  <option value="crm_zxkhxx.lrsj desc">录入时间</option>
		  <option value="crm_zxkhxx.khxm">客户姓名</option>
		  <option value="crm_zxkhxx.fwdz">房屋地址</option>
		  <option value="crm_zxkhxx.lxfs">联系方式</option>
		  <option value="crm_zxkhxx.nlqjbm">年龄区间</option>
		  <option value="crm_zxkhxx.ysrbm">月收入</option>
		  <option value="crm_zxkhxx.zybm">职业</option>
		  <option value="crm_zxkhxx.sjs">设计师</option>
		  <option value="crm_zxkhxx.jhjfsj">计划交房时间</option>
		  <option value="crm_zxkhxx.yjzxsj">预计装修时间</option>
		  <option value="crm_zxkhxx.zxzt">咨询状态</option>
		  <option value="crm_zxkhxx.zxdm">咨询店面</option>
		  <option value="crm_zxkhxx.sbyybm">失败原因</option>
		  <option value="crm_zxkhxx.ywy">业务员</option>
		  <option value="crm_zxkhxx.cqbm">所属城区</option>
		  <option value="crm_zxkhxx.xqbm">小区</option>
		  <option value="crm_zxkhxx.rddqbm">热点地区</option>
		  <option value="crm_zxkhxx.hxwzbm">环线位置</option>
		  <option value="crm_zxkhxx.cxhdbm">参加促销活动</option>
		</select>
		第三列 
		<select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
		  <option value=""></option>
		  <option value="crm_zxkhxx.khbh desc">客户编号</option>
		  <option value="crm_zxkhxx.lrsj desc">录入时间</option>
		  <option value="crm_zxkhxx.khxm">客户姓名</option>
		  <option value="crm_zxkhxx.fwdz">房屋地址</option>
		  <option value="crm_zxkhxx.lxfs">联系方式</option>
		  <option value="crm_zxkhxx.nlqjbm">年龄区间</option>
		  <option value="crm_zxkhxx.ysrbm">月收入</option>
		  <option value="crm_zxkhxx.zybm">职业</option>
		  <option value="crm_zxkhxx.sjs">设计师</option>
		  <option value="crm_zxkhxx.jhjfsj">计划交房时间</option>
		  <option value="crm_zxkhxx.yjzxsj">预计装修时间</option>
		  <option value="crm_zxkhxx.zxzt">咨询状态</option>
		  <option value="crm_zxkhxx.zxdm">咨询店面</option>
		  <option value="crm_zxkhxx.sbyybm">失败原因</option>
		  <option value="crm_zxkhxx.ywy">业务员</option>
		  <option value="crm_zxkhxx.cqbm">所属城区</option>
		  <option value="crm_zxkhxx.xqbm">小区</option>
		  <option value="crm_zxkhxx.rddqbm">热点地区</option>
		  <option value="crm_zxkhxx.hxwzbm">环线位置</option>
		  <option value="crm_zxkhxx.cxhdbm">参加促销活动</option>
		</select>              </td>
	</tr>
	<tr> 
	  <td colspan="4" align="center"> 
		<input type="button"  value="查询" onClick="f_do(selectform)">
		<input type="reset"  value="重输">              </td>
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

var sjsbhMark=0;
var cxhdbmMark=0;
var khlxbmMark=0;

var fieldName="";

function changeFgs(FormName)
{
	FormName.zxdm.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	fieldName="dwbh";

	sjsbhMark=0;
	cxhdbmMark=0;
	FormName.sjsbh.length=1;
	FormName.cxhdbm.length=1;

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1：授权单个分公司;2：授权多个分公司
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getThis(lx)
{
	var sql;

	fieldName=lx;

	if (selectform.ssfgs.value=="")
	{
		selectform.ssfgs.focus();
		alert("请首先选择【分公司】");
		return;
	}

	if (lx=="sjsbh")
	{
		if (sjsbhMark==0)
		{
			if (selectform.zxdm.value=="")
			{
				sjsbhMark=0;
				selectform.zxdm.focus();
				alert("请首先选择【咨询店面】");
				return;
			}

			var sql="select dwbh,dwmc from sq_dwxx where dwlx='F3' and  cxbz='N' and ssdw='"+selectform.zxdm.value+"' order by dwbh";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			sjsbhMark=1;
		}
		else{
			sjsbhMark=2;
		}
	}
	else if (lx=="cxhdbm")
	{
		if (cxhdbmMark==0)
		{
			sql="select cxhdmc c1,cxhdmc||DECODE(jsbz,'N','','Y','（结束）') c2 from jc_cxhd where fgsbh='"+selectform.ssfgs.value+"' order by jsbz,cxhdbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			cxhdbmMark=1;
		}
		else{
			cxhdbmMark=2;
		}
	}
}

function getThisOne(lx)
{
	var sql;

	fieldName=lx;

	if (lx=="khlxbm")
	{
		if (khlxbmMark==0)
		{
			var sql="select khlxbm,khlxmc from dm_khlxbm order by khlxbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			khlxbmMark=1;
		}
	}
}

function getAjax(ajaxRetStr) 
{
	if (fieldName=="dwbh")
	{
		strToSelect(selectform.zxdm,ajaxRetStr);
	}
	else if (fieldName=="sjsbh")
	{
		strToSelect(selectform.sjsbh,ajaxRetStr);
	}
	else if (fieldName=="cxhdbm")
	{
		strToSelect(selectform.cxhdbm,ajaxRetStr);
	}
	else if (fieldName=="khlxbm")
	{
		strToSelect(selectform.crm_zxkhxx_khlxbm,ajaxRetStr);
	}
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.crm_zxkhxx_zxhfsj, "最新回访时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_hfrq, "回访日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_hfrq2, "回访日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
