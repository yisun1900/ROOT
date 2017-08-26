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
.STYLE1 {color: #0000CC}
.STYLE3 {font-weight: bold}
-->
</style>
</head>
<%
String yhjs=(String)session.getAttribute("yhjs");

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">

<form method="post" action="Jc_cgddCxList.jsp" name="selectform">
<div align="center">橱柜订单－查询</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr align="center"> 
	  <td colspan="4"> 
		<input type="button"  value="查询" onClick="f_do(selectform)">
		<input type="reset"  value="重输">              </td>
	</tr>
	<tr bgcolor="#FFFFCC">
	  <td align="right">所属公司</td>
	  <td><%
		if (yhjs.equals("G0"))
		{
			out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select distinct sq_dwxx.dwbh,sq_dwxx.dwmc from jxc_ppgysdzb,sq_dwxx where jxc_ppgysdzb.ssfgs=sq_dwxx.dwbh and jxc_ppgysdzb.gysbm='"+ygbh+"' order by sq_dwxx.dwbh","");
			out.println("        </select>");
		}
		else
		{
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
		}
%>              </td>
	  <td align="right">签约店面</td>
	  <td><select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <%
		if (yhjs.equals("G0"))
		{
			out.println("<option value=\"\"></option>");
		}
		else
		{
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
	  <td align="right"><font color="#0000CC"><b>联系方式</b></font></td>
	  <td><input type="text" name="crm_khxx_lxfs" size="20" maxlength="50"></td>
	  <td align="right">联系方式</td>
	  <td><input type="text" name="crm_khxx_lxfs2" size="14" maxlength="50">
      （模糊查询）</td>
    </tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"><span class="STYLE3 STYLE1"><strong> 房屋地址 </strong></span></td>
	  <td><input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >              </td>
	  <td align="right">房屋地址</td>
	  <td><input type="text" name="crm_khxx_fwdz2" size="14" maxlength="50" >
		（模糊查询）</td>
	</tr>
	
	<tr bgcolor="#FFFFFF">
	  <td align="right" bgcolor="#FFFFCC">合同开工日期 从</td>
	  <td bgcolor="#FFFFCC"><input type="text" name="crm_khxx_kgrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	  <td align="right" bgcolor="#FFFFCC">到</td>
	  <td bgcolor="#FFFFCC"><input type="text" name="crm_khxx_kgrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
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
	  <td colspan="3"><select name="cxhdbm" style="FONT-SIZE:12PX;WIDTH:522PX" onclick="getThis('cxhdbm');">
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
	  <td><select name="jc_cgdd_clzt" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('clzt')">
		  <option value=""></option>
	  </select></td>
	</tr>
	

	<tr bgcolor="#FFFFFF"> 
	  <td align="right" width="19%">是否需派设计师</td>
	  <td width="31%"> 
		<input type="radio" name="sfpsjs" value="1">
		是 
		<input type="radio" name="sfpsjs" value="2">
		否 </td>
	  <td align="right" width="19%">家居设计师</td>
	  <td width="31%">
	  <select name="cgsjs" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('cgsjs')">
		  <option value=""></option>
		</select>		</td>
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
	  <td align="right">项目专员</td>
	  <td><select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('xmzy')">
		  <option value=""></option>
	  </select></td>
	  <td align="right">退单原因</td>
	  <td><select name="jctdyybm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('jctdyybm')">
		<option value=""></option>
	  </select></td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"><span class="STYLE1"><strong>派单工厂</strong></span></td>
	  <td><select name="pdgcmc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('pdgcmc')">
		  <option value=""></option>
		</select>              </td>
	  <td align="right">派单工厂</td>
	  <td><input name="pdgcmc2" type="text" size="14" maxlength="50" >
		（模糊查询） </td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"><span class="STYLE1"><strong>品牌名称</strong></span></td>
	  <td><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ppmc')">
		  <option value=""></option>
	  </select></td>
	  <td align="right">品牌名称</td>
	  <td><input type="text" name="ppmc2" size="14" maxlength="50" >
		（模糊查询） </td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"><span class="STYLE1"><strong>供应商名称</strong></span></td>
	  <td><select name="gys" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('gys')">
		  <%
if (yhjs.equals("G0"))
{
cf.selectItem(out,"select gys c1,gys c2 from sq_gysbm where gysbm='"+ygbh+"' order by gys","");
}
%>
	  </select></td>
	  <td align="right">供应商名称</td>
	  <td><input type="text" name="gys2" size="14" maxlength="50" >
		（模糊查询） </td>
	</tr>
	
	<tr bgcolor="#E8E8FF"> 
	  <td width="19%" align="right"><font color="#0000CC">派工厂时间 从</font></td>
	  <td width="31%"> 
	  <input type="text" name="pgcsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	  <td width="19%" align="right">到</td>
	  <td width="31%">
	  <input type="text" name="pgcsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	</tr>
	<tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">派设计师时间 从</font></td>
	  <td><input name="pdsj" type="text" onDblClick="JSCalendar(this)" size="20" maxlength="10">      </td>
	  <td align="right">到</td>
	  <td><input name="pdsj2" type="text" onDblClick="JSCalendar(this)" size="20" maxlength="10">      </td>
    </tr>
	<tr bgcolor="#E8E8FF"> 
	  <td width="19%" align="right"> 计划初测时间 从</td>
	  <td width="31%"> 
	  <input type="text" name="jc_cgdd_jhccsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	  <td width="19%" align="right"> 到</td>
	  <td width="31%"> 
	  <input type="text" name="jc_cgdd_jhccsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right"> 实初测时间 从</td>
	  <td width="31%"> 
	  <input type="text" name="jc_cgdd_sccsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	  <td width="19%" align="right"> 到</td>
	  <td width="31%"> 
	  <input type="text" name="jc_cgdd_sccsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	</tr>
	<tr bgcolor="#E8E8FF"> 
	  <td width="19%" align="right">计划复测时间 从</td>
	  <td width="31%"> 
	  <input type="text" name="jc_cgdd_jhfcsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	  <td width="19%" align="right">到</td>
	  <td width="31%"> 
	  <input type="text" name="jc_cgdd_jhfcsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right">实复测时间 从</td>
	  <td width="31%"> 
	  <input type="text" name="jc_cgdd_sfcsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	  <td width="19%" align="right">到</td>
	  <td width="31%"> 
	  <input type="text" name="jc_cgdd_sfcsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	</tr>
	<tr bgcolor="#E8E8FF"> 
	  <td width="19%" align="right">签合同时间 从</td>
	  <td width="31%"> 
	  <input type="text" name="jc_cgdd_qhtsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	  <td width="19%" align="right"> 到</td>
	  <td width="31%"> 
	  <input type="text" name="jc_cgdd_qhtsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right">计划安装日期 从</td>
	  <td width="31%"> 
	  <input type="text" name="jc_cgdd_jhazrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	  <td width="19%" align="right">到</td>
	  <td width="31%"> 
	  <input type="text" name="jc_cgdd_jhazrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	</tr>
	<tr bgcolor="#E8E8FF"> 
	  <td width="19%" align="right"> 实安装日期 从</td>
	  <td width="31%"> 
	  <input type="text" name="jc_cgdd_sazrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	  <td width="19%" align="right"> 到</td>
	  <td width="31%"> 
	  <input type="text" name="jc_cgdd_sazrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right">录入时间 从</td>
	  <td width="31%"> 
		<input type="text" name="jc_cgdd_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	  <td width="19%" align="right">到</td>
	  <td width="31%"> 
		<input type="text" name="jc_cgdd_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	</tr>
	<tr bgcolor="#E8E8FF"> 
	  <td width="19%" align="right">退单时间 从</td>
	  <td width="31%"> 
	  <input type="text" name="jc_cgdd_tdsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	  <td width="19%" align="right">到</td>
	  <td width="31%"> 
	  <input type="text" name="jc_cgdd_tdsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right"> 录入人</td>
	  <td width="31%"> 
		<input type="text" name="jc_cgdd_lrr" size="20" maxlength="20" >              </td>
	  <td width="19%" align="right">录入部门</td>
	  <td width="31%"><select name="jc_cgdd_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('lrbm')">
		  <option value=""></option>
	  </select></td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right" bgcolor="#FFFFFF">橱柜款式</td>
	  <td width="31%"> 
		<input type="text" name="sdks" size="20" maxlength="50">              </td>
	  <td width="19%" align="right">橱柜花色</td>
	  <td width="31%"><input type="text" name="cghs" size="20" maxlength="50"></td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right" bgcolor="#FFFFFF">箱体板材</td>
	  <td><input type="text" name="xtbc" size="20" maxlength="50"></td>
	  <td align="right">&nbsp;</td>
	  <td>&nbsp;</td>
	</tr>
	
	<tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right" bgcolor="#FFFFFF">台面品牌</td>
	  <td width="31%"><input type="text" name="tmpp" size="20" maxlength="50"></td>
	  <td width="19%" align="right">台面花色</td>
	  <td width="31%"> 
		<input type="text" name="tmhs" size="20" maxlength="50">              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right" bgcolor="#FFFFFF">玻璃材质</td>
	  <td width="31%"> 
		<input type="text" name="blcz" size="20" maxlength="50">              </td>
	  <td width="19%" align="right">铰链</td>
	  <td width="31%"> 
		<input type="text" name="jiaolian" size="20" maxlength="50">              </td>
	</tr>
	<tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF">延迟处理状态</td>
	  <td colspan="3">
	  <input type="radio" name="ycclzt" value="0">未延迟
	  <input type="radio" name="ycclzt" value="1">延迟未核实
      <input type="radio" name="ycclzt" value="2">
      延迟原因属实
      <input type="radio" name="ycclzt" value="3">
      延迟原因不属实</td>
    </tr>
	<tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF">延迟原因</td>
	  <td><select name="ycyybm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('ycyybm')">
          <option value=""></option>
      </select></td>
	  <td align="right">真实延迟原因</td>
	  <td><select name="zsycyybm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('zsycyybm')">
          <option value=""></option>
      </select></td>
    </tr>
	
	<tr bgcolor="#CCFFFF"> 
	  <td width="19%" align="right">结果排序</td>
	  <td colspan="3" bgcolor="#CCFFFF"> 第一列 
		<select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
		  <option value="jc_cgdd.lrsj desc">录入时间</option>
		  <option value="jc_cgdd.qhtsj desc">签合同时间</option>
		  <option value="jc_cgdd.pgcsj desc">派工厂时间</option>
		  <option value="jc_cgdd.pdsj desc">派设计师时间</option>
		  <option value="jc_cgdd.jhccsj desc">计划初测时间</option>
		  <option value="jc_cgdd.sccsj desc">实初测时间</option>
		  <option value="jc_cgdd.jhfcsj desc">计划复测时间</option>
		  <option value="jc_cgdd.sfcsj desc">实复测时间</option>
		  <option value="jc_cgdd.jhazrq desc">计划安装日期</option>
		  <option value="jc_cgdd.sazrq desc">实安装日期</option>
		  <option value="jc_cgdd.tdsj desc">退单时间</option>
		  <option value="crm_khxx.khbh ">客户编号</option>
		  <option value="crm_khxx.khxm">客户姓名</option>
		  <option value="crm_khxx.lxfs">联系方式</option>
		  <option value="crm_khxx.fwdz">房屋地址</option>
		  <option value="crm_khxx.sjs">家装设计师</option>
		  <option value="crm_khxx.sgd">施工队</option>
		  <option value="crm_khxx.zjxm">质检员</option>
		  <option value="crm_khxx.hth">合同号</option>
		  <option value="crm_khxx.gcjdbm">工程进度</option>
		  <option value="jc_cgdd.xmzy">项目专员</option>
		  <option value="jc_cgdd.clgw">驻店家居顾问</option>
		  <option value="jc_cgdd.ztjjgw">展厅家居顾问</option>
		  <option value="jc_cgdd.cgsjs">橱柜设计师</option>
		  <option value="jc_cgdd.pdgcmc">派单工厂</option>
		  <option value="jc_cgdd.clzt">订单状态</option>
		  <option value="jc_cgdd.sdks">橱柜款式</option>
		  <option value="jc_cgdd.xtbc">箱体板材</option>
		  <option value="jc_cgdd.cghs">橱柜花色</option>
		  <option value="jc_cgdd.tmpp">台面品牌</option>
		  <option value="jc_cgdd.tmhs">台面花色</option>
		  <option value="jc_cgdd.blcz">玻璃材质</option>
		  <option value="jc_cgdd.jiaolian">铰链</option>
		</select>
		第二列 
		<select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
		  <option value=""></option>
		  <option value="jc_cgdd.lrsj desc">录入时间</option>
		  <option value="jc_cgdd.qhtsj desc">签合同时间</option>
		  <option value="jc_cgdd.pgcsj desc">派工厂时间</option>
		  <option value="jc_cgdd.pdsj desc">派设计师时间</option>
		  <option value="jc_cgdd.jhccsj desc">计划初测时间</option>
		  <option value="jc_cgdd.sccsj desc">实初测时间</option>
		  <option value="jc_cgdd.jhfcsj desc">计划复测时间</option>
		  <option value="jc_cgdd.sfcsj desc">实复测时间</option>
		  <option value="jc_cgdd.jhazrq desc">计划安装日期</option>
		  <option value="jc_cgdd.sazrq desc">实安装日期</option>
		  <option value="jc_cgdd.tdsj desc">退单时间</option>
		  <option value="crm_khxx.khbh ">客户编号</option>
		  <option value="crm_khxx.khxm">客户姓名</option>
		  <option value="crm_khxx.lxfs">联系方式</option>
		  <option value="crm_khxx.fwdz">房屋地址</option>
		  <option value="crm_khxx.sjs">家装设计师</option>
		  <option value="crm_khxx.sgd">施工队</option>
		  <option value="crm_khxx.zjxm">质检员</option>
		  <option value="crm_khxx.hth">合同号</option>
		  <option value="crm_khxx.gcjdbm">工程进度</option>
		  <option value="jc_cgdd.xmzy">项目专员</option>
		  <option value="jc_cgdd.clgw">驻店家居顾问</option>
		  <option value="jc_cgdd.ztjjgw">展厅家居顾问</option>
		  <option value="jc_cgdd.cgsjs">橱柜设计师</option>
		  <option value="jc_cgdd.pdgcmc">派单工厂</option>
		  <option value="jc_cgdd.clzt">订单状态</option>
		  <option value="jc_cgdd.sdks">橱柜款式</option>
		  <option value="jc_cgdd.xtbc">箱体板材</option>
		  <option value="jc_cgdd.cghs">橱柜花色</option>
		  <option value="jc_cgdd.tmpp">台面品牌</option>
		  <option value="jc_cgdd.tmhs">台面花色</option>
		  <option value="jc_cgdd.blcz">玻璃材质</option>
		  <option value="jc_cgdd.jiaolian">铰链</option>
		</select>
		第三列 
		<select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
		  <option value=""></option>
		  <option value="jc_cgdd.lrsj desc">录入时间</option>
		  <option value="jc_cgdd.qhtsj desc">签合同时间</option>
		  <option value="jc_cgdd.pgcsj desc">派工厂时间</option>
		  <option value="jc_cgdd.pdsj desc">派设计师时间</option>
		  <option value="jc_cgdd.jhccsj desc">计划初测时间</option>
		  <option value="jc_cgdd.sccsj desc">实初测时间</option>
		  <option value="jc_cgdd.jhfcsj desc">计划复测时间</option>
		  <option value="jc_cgdd.sfcsj desc">实复测时间</option>
		  <option value="jc_cgdd.jhazrq desc">计划安装日期</option>
		  <option value="jc_cgdd.sazrq desc">实安装日期</option>
		  <option value="jc_cgdd.tdsj desc">退单时间</option>
		  <option value="crm_khxx.khbh ">客户编号</option>
		  <option value="crm_khxx.khxm">客户姓名</option>
		  <option value="crm_khxx.lxfs">联系方式</option>
		  <option value="crm_khxx.fwdz">房屋地址</option>
		  <option value="crm_khxx.sjs">家装设计师</option>
		  <option value="crm_khxx.sgd">施工队</option>
		  <option value="crm_khxx.zjxm">质检员</option>
		  <option value="crm_khxx.hth">合同号</option>
		  <option value="crm_khxx.gcjdbm">工程进度</option>
		  <option value="jc_cgdd.xmzy">项目专员</option>
		  <option value="jc_cgdd.clgw">驻店家居顾问</option>
		  <option value="jc_cgdd.ztjjgw">展厅家居顾问</option>
		  <option value="jc_cgdd.cgsjs">橱柜设计师</option>
		  <option value="jc_cgdd.pdgcmc">派单工厂</option>
		  <option value="jc_cgdd.clzt">订单状态</option>
		  <option value="jc_cgdd.sdks">橱柜款式</option>
		  <option value="jc_cgdd.xtbc">箱体板材</option>
		  <option value="jc_cgdd.cghs">橱柜花色</option>
		  <option value="jc_cgdd.tmpp">台面品牌</option>
		  <option value="jc_cgdd.tmhs">台面花色</option>
		  <option value="jc_cgdd.blcz">玻璃材质</option>
		  <option value="jc_cgdd.jiaolian">铰链</option>
		</select>              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td align="right" width="19%" >显示风格</td>
	  <td colspan="3" > 
		<input type="radio" name="xsfg" value="1" checked>
		网页 
		<input type="radio" name="xsfg" value="2">
		EXCEL &nbsp;&nbsp;&nbsp;每页显示数量 
		<input type="text" name="myxssl" size="7" maxlength="13" value="30">              </td>
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

var gysMark=0;
var pdgcmcMark=0;
var ppmcMark=0;

var lrbmMark=0;

var ycyybmMark=0;
var zsycyybmMark=0;
var clztMark=0;
var jctdyybmMark=0;

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

	gysMark=0;
	pdgcmcMark=0;
	ppmcMark=0;

	lrbmMark=0;

	FormName.crm_khxx_sgd.length=1;
	FormName.cxhdbm.length=1;

	FormName.cgsjs.length=1;
	FormName.clgw.length=1;
	FormName.ztjjgw.length=1;
	FormName.xmzy.length=1;

	FormName.gys.length=1;
	FormName.pdgcmc.length=1;
	FormName.ppmc.length=1;

	FormName.jc_cgdd_dwbh.length=1;


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
	if ("<%=yhjs%>"=="G0")
	{
		return;
	}

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
	else if (lx=="gys")
	{
		if (gysMark==0)
		{
			sql="select distinct sq_gysxx.gys from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='"+selectform.fgs.value+"' and sq_gysxx.gyslb='2' order by sq_gysxx.gys";

			var actionStr="/ajax/getstr.jsp?sql="+sql;

//			window.open(actionStr);

			openAjax(actionStr);
			gysMark=1;
		}
	}
	else if (lx=="pdgcmc")
	{
		if (pdgcmcMark==0)
		{

			sql="select sq_gysxx.gysmc from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='"+selectform.fgs.value+"' and sq_gysxx.gyslb='2' order by sq_gysxx.gysmc";
			
			var actionStr="/ajax/getstr.jsp?sql="+sql;

			openAjax(actionStr);
			pdgcmcMark=1;
		}
	}
	else if (lx=="ppmc")
	{
		if (ppmcMark==0)
		{
			sql="select distinct sq_gysxx.ppmc from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='"+selectform.fgs.value+"' and sq_gysxx.gyslb='2' order by sq_gysxx.ppmc";

			var actionStr="/ajax/getstr.jsp?sql="+sql;

			openAjax(actionStr);
			ppmcMark=1;
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
	else if (lx=="lrbm")
	{
		if (lrbmMark==0)
		{
			var sql="select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and ssfgs='"+selectform.fgs.value+"' and  cxbz='N' order by dwbh";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			lrbmMark=1;
		}
	}

}


function getThisOne(lx)
{
	var sql;

	fieldName=lx;

	if (lx=="clzt")
	{
		if (clztMark==0)
		{
			var sql="select clzt,clztmc from jdm_cgddzt order by clzt";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			clztMark=1;
		}
	}
	else if (lx=="ycyybm")
	{
		if (ycyybmMark==0)
		{
			var sql="select mmycyybm,mmycyymc from jdm_mmycyybm order by mmycyybm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			ycyybmMark=1;
		}
	}
	else if (lx=="zsycyybm")
	{
		if (zsycyybmMark==0)
		{
			var sql="select mmycyybm,mmycyymc from jdm_mmycyybm order by mmycyybm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			zsycyybmMark=1;
		}
	}
	else if (lx=="jctdyybm")
	{
		if (jctdyybmMark==0)
		{
			var sql="select jctdyybm,jctdyymc from jdm_jctdyybm order by jctdyybm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			jctdyybmMark=1;
		}
	}
}


function getAjax(ajaxRetStr) 
{
	if (fieldName=="dwbh")
	{
		strToSelect(selectform.crm_khxx_dwbh,ajaxRetStr);
	}
	else if (fieldName=="lrbm")
	{
		strToSelect(selectform.jc_cgdd_dwbh,ajaxRetStr);
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
	else if (fieldName=="gys")
	{
		strToItem2(selectform.gys,ajaxRetStr);
	}
	else if (fieldName=="pdgcmc")
	{
		strToItem2(selectform.pdgcmc,ajaxRetStr);
	}
	else if (fieldName=="ppmc")
	{
		strToItem2(selectform.ppmc,ajaxRetStr);
	}
	else if (fieldName=="sgd")
	{
		strToItem(selectform.crm_khxx_sgd,ajaxRetStr);
	}
	else if (fieldName=="cxhdbm")
	{
		strToItem2(selectform.cxhdbm,ajaxRetStr);
	}
	else if (fieldName=="clzt")
	{
		strToSelect(selectform.jc_cgdd_clzt,ajaxRetStr);
	}
	else if (fieldName=="ycyybm")
	{
		strToSelect(selectform.ycyybm,ajaxRetStr);
	}
	else if (fieldName=="zsycyybm")
	{
		strToSelect(selectform.zsycyybm,ajaxRetStr);
	}
	else if (fieldName=="jctdyybm")
	{
		strToSelect(selectform.jctdyybm,ajaxRetStr);
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

	if(!(isDatetime(FormName.pgcsj, "派工厂时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.pgcsj2, "派工厂时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.pdsj, "派设计师时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.pdsj2, "派设计师时间"))) {
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
	if(!(isDatetime(FormName.jc_cgdd_jhfcsj, "计划复测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_jhfcsj2, "计划复测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sfcsj, "实复测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sfcsj2, "实复测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_qhtsj, "签合同时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_qhtsj2, "签合同时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_jhazrq, "计划安装日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_jhazrq2, "计划安装日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sazrq, "实安装日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sazrq2, "实安装日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_tdsj, "退单时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_tdsj2, "退单时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
