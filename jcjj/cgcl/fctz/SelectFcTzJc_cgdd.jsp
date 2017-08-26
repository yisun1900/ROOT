<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
.STYLE3 {font-weight: bold}
-->
</style>
</head>
<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">


<form method="post" action="Jc_cgddFcTzList.jsp" name="selectform">
<div align="center">橱柜订单处理--复测通知</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr bgcolor="#FFFFCC">
	  <td align="right">所属公司</td>
	  <td><%
		out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onchange=\"changeFgs(selectform)\">");

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

		out.println("        </select>");
%>              </td>
	  <td align="right">签约店面</td>
	  <td><select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
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
	<tr bgcolor="#FFFFFF">
	  <td align="right">客户编号</td>
	  <td><input type="text" name="jc_cgdd_khbh" size="20" maxlength="20" ></td>
	  <td align="right">合同号</td>
	  <td><input type="text" name="crm_khxx_hth" size="20" maxlength="20" >              </td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"><span class="STYLE3 STYLE1"><strong> 客户姓名 </strong></span></td>
	  <td><input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >              </td>
	  <td align="right">客户姓名</td>
	  <td><input type="text" name="crm_khxx_khxm2" size="14" maxlength="20" >
		（模糊查询）</td>
	</tr>
	<tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF"><span class="STYLE3 STYLE1">联系方式</span></td>
	  <td><input type="text" name="crm_khxx_lxfs" size="20" maxlength="20" ></td>
	  <td align="right">联系方式</td>
	  <td><input type="text" name="crm_khxx_lxfs2" size="14" maxlength="20" >
	    （模糊查询）</td>
    </tr>
	
	<tr bgcolor="#FFFFFF">
	  <td align="right"><span class="STYLE3 STYLE1"><strong> 房屋地址 </strong></span></td>
	  <td><input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >              </td>
	  <td align="right">房屋地址</td>
	  <td><input type="text" name="crm_khxx_fwdz2" size="14" maxlength="50" >
		（模糊查询）</td>
	</tr>
	<tr bgcolor="#FFFFCC">
      <td align="right">家装签约日期 从</td>
	  <td><input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
	  <td align="right">到</td>
	  <td><input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
    </tr>
	
	<tr bgcolor="#FFFFFF">
	  <td align="right">合同开工日期 从</td>
	  <td><input type="text" name="crm_khxx_kgrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	  <td align="right">到</td>
	  <td><input type="text" name="crm_khxx_kgrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	</tr>
	<tr bgcolor="#FFFFCC">
      <td align="right"> 合同竣工日期 从 </td>
	  <td><input type="text" name="crm_khxx_jgrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
	  <td align="right"> 到 </td>
	  <td><input type="text" name="crm_khxx_jgrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
	
	<tr bgcolor="#FFFFFF">
	  <td align="right">设计师</td>
	  <td><input type="text" name="crm_khxx_sjs" size="20" maxlength="20" ></td>
	  <td align="right"> 质检姓名 </td>
	  <td><input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >              </td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right">施工队</td>
	  <td><select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('sgd');">
		  <option value=""></option>
	  </select></td>
	  <td align="right">客户完结标志</td>
	  <td><input type="radio" name="crm_khxx_wjbz" value="1">
		未完结
		<input type="radio" name="crm_khxx_wjbz" value="2">
		已完结 </td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right">促销活动</td>
	  <td colspan="3"><select name="cxhdbm" style="FONT-SIZE:12PX;WIDTH:525PX" onclick="getThis('cxhdbm');">
		  <option value=""></option>
	  </select></td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td colspan="4" bgcolor="#CCCCCC">&nbsp;</td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"> 订单编号</td>
	  <td><input type="text" name="jc_cgdd_ddbh" size="20" maxlength="9" >              </td>
	  <td align="right">处理状态</td>
	  <td><select name="jc_cgdd_clzt" style="FONT-SIZE:12PX;WIDTH:152PX" >
				  <option value="07">已初测</option>
	  </select></td>
	</tr>
	

	<tr bgcolor="#FFFFFF"> 
	  <td align="right" width="19%">是否需派设计师</td>
	  <td width="31%"> 
		<input name="sfpsjs" type="radio" value="1" checked>
	  是</td>
	  <td align="right" width="19%">家居设计师</td>
	  <td width="31%"><select name="cgsjs" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('cgsjs')">
		  <option value=""></option>
		</select></td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right">驻店家居顾问</td>
	  <td><select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('clgw')">
		  <option value=""></option>
		</select>              </td>
	  <td align="right">展厅家居顾问</td>
	  <td><select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ztjjgw')">
		  <option value=""></option>
		</select>              </td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right" bgcolor="#FFFFFF">项目专员</td>
	  <td><select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('xmzy')">
		  <option value=""></option>
	  </select></td>
	  <td align="right">录入人</td>
	  <td><input type="text" name="jc_cgdd_lrr" size="20" maxlength="20" ></td>
	</tr>
	

	<tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right">派设计师时间 从</td>
	  <td width="31%"> 
	  <input type="text" name="jc_cgdd_pdsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	  <td width="19%" align="right">到</td>
	  <td width="31%"> 
	  <input type="text" name="jc_cgdd_pdsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	</tr>

	<tr bgcolor="#FFFFCC"> 
	  <td width="19%" align="right">计划初测时间 从</td>
	  <td width="31%"> 
		<input type="text" name="jc_cgdd_jhccsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	  <td width="19%" align="right">到</td>
	  <td width="31%"> 
		<input type="text" name="jc_cgdd_jhccsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	</tr>

	<tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right">实初测时间 从</td>
	  <td width="31%"> 
	  <input type="text" name="jc_cgdd_sccsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	  <td width="19%" align="right">到</td>
	  <td width="31%"> 
	  <input type="text" name="jc_cgdd_sccsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	</tr>
	

	
	<tr align="center"> 
	  <td colspan="4"> 
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
	cf.ajax(out);//启用AJAX
%>
var sgdMark=0;
var cxhdbmMark=0;

var cgsjsMark=0;
var clgwMark=0;
var ztjjgwMark=0;
var xmzyMark=0;

var fieldName="";

function changeFgs(FormName) 
{
	FormName.crm_khxx_dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	fieldName="dwbh";

	sgdMark=0;
	cxhdbmMark=0;
	cgsjsMark=0;
	clgwMark=0;
	ztjjgwMark=0;
	xmzyMark=0;

	FormName.crm_khxx_sgd.length=1;
	FormName.cxhdbm.length=1;

	FormName.cgsjs.length=1;
	FormName.clgw.length=1;
	FormName.ztjjgw.length=1;
	FormName.xmzy.length=1;


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

	if (lx=="cgsjs")
	{
		if (cgsjsMark==0)
		{
			sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqfgs ";
			sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='12' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" UNION ALL ";

			sql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqbm ";
			sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='12' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" ORDER BY sfzszg desc,c2 ";

			var actionStr="/ajax/selectstr.jsp?sql="+sql;

//			window.open(actionStr);
			openAjax(actionStr);
			cgsjsMark=1;
		}
	}
	else if (lx=="clgw")
	{
		if (clgwMark==0)
		{
			sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqfgs ";
			sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" UNION ALL ";

			sql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqbm ";
			sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" ORDER BY sfzszg desc,c2 ";

			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			clgwMark=1;
		}
	}
	else if (lx=="ztjjgw")
	{
		if (ztjjgwMark==0)
		{
			sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqfgs ";
			sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" UNION ALL ";

			sql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqbm ";
			sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" ORDER BY sfzszg desc,c2 ";

			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			ztjjgwMark=1;
		}
	}
	else if (lx=="xmzy")
	{
		if (xmzyMark==0)
		{
			sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqfgs ";
			sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='10' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" UNION ALL ";

			sql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqbm ";
			sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='10' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" ORDER BY sfzszg desc,c2 ";

			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			xmzyMark=1;
		}
	}
	else if (lx=="sgd")
	{
		if (sgdMark==0)
		{
			var sql="select sgd,sgdmc from sq_sgd where cxbz='N' and ssfgs='"+selectform.fgs.value+"' order by sgdmc";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			sgdMark=1;
		}
	}
	else if (lx=="cxhdbm")
	{
		if (cxhdbmMark==0)
		{
			var sql="select cxhdmc from jc_cxhd where fgsbh='"+selectform.fgs.value+"' order by jsbz,cxhdbm";
			var actionStr="/ajax/getstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			cxhdbmMark=1;
		}
	}
}

function getAjax(ajaxRetStr) 
{
	if (fieldName=="dwbh")
	{
		strToSelect(selectform.crm_khxx_dwbh,ajaxRetStr);
	}
	else if (fieldName=="cgsjs")
	{
		strToSelect(selectform.cgsjs,ajaxRetStr);
	}
	else if (fieldName=="clgw")
	{
		strToSelect(selectform.clgw,ajaxRetStr);
	}
	else if (fieldName=="ztjjgw")
	{
		strToSelect(selectform.ztjjgw,ajaxRetStr);
	}
	else if (fieldName=="xmzy")
	{
		strToSelect(selectform.xmzy,ajaxRetStr);
	}
	else if (fieldName=="sgd")
	{
		strToItem(selectform.crm_khxx_sgd,ajaxRetStr);
	}
	else if (fieldName=="cxhdbm")
	{
		strToItem2(selectform.cxhdbm,ajaxRetStr);
	}

}

function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.crm_khxx_kgrq, "合同开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_kgrq2, "合同开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jgrq, "合同竣工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jgrq2, "合同竣工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq2, "签约日期"))) {
		return false;
	}

	if(!(isDatetime(FormName.jc_cgdd_pdsj, "派设计师时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_pdsj2, "派设计师时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_jhccsj, "计划初测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_jhccsj2, "计划初测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sccsj, "实初测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sccsj2, "实初测时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
