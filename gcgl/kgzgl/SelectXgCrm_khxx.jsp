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
	String dwbh=(String)session.getAttribute("dwbh");
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%" height="430">
  <tr>
    <td width="100%"> 
      <div align="center">开工证管理</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">分公司</div>
              </td>
              <td width="31%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx='F2' and cxbz='N' order by ssfgs,dwbh");
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,crm_khxx_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
              <td width="17%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">签约日期 从</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" value="" ondblclick="JSCalendar(this)">
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" bgcolor="#E8E8FF" align="right">合同号</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">客户编号</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_khbh" size="20" maxlength="7" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
              </td>
              <td width="17%"> 
                <div align="right">房屋地址</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">设计师</div>
              </td>
              <td width="31%" bgcolor="#FFFFFF"> 
                <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
              </td>
              <td width="17%"> 
                <div align="right">工程担当</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">施工队</div>
              </td>
              <td width="31%"> 
                <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where cxbz='N' order by ssfgs,sgdmc","");
	}
	else{
		cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where ssfgs='"+ssfgs+"' and cxbz='N' order by sgdmc","");
	}
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">施工班组</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_sgbz" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">合同开工日期 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_kgrq" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="17%"> 
                <div align="right">到</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_kgrq2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">实际开工日期 从</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_sjkgrq" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_sjkgrq2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">合同竣工日期 从</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_jgrq" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_jgrq2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">工程进度</div>
              </td>
              <td width="31%" bgcolor="#FFFFCC"> 
                <select name="crm_khxx_gcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">在施工程标志</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_zsbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+未开工&2+在施工程&3+已完工","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">完工标志</td>
              <td width="31%"> 
                <select name="crm_khxx_wgbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+未完工&2+已完工","");
%> 
                </select>
              </td>
              <td width="17%" align="right">退单标志</td>
              <td width="33%"> 
                <select name="crm_khxx_zt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="2" >未退单</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#FFFFFF">出开工证标志</td>
              <td width="31%"> 
                <input type="radio" name="kgzbz" value="N" checked>
                未出开工证 
                <input type="radio" name="kgzbz" value="Y">
                已出开工证 </td>
              <td width="17%" align="right">施工队类型</td>
              <td width="33%">
                <input type="radio" name="sgdlx" value="S0">
                非直属队 
                <input type="radio" name="sgdlx" value="S1">
                直属队 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#FFFFFF">开工证出证日期 从</td>
              <td width="31%"> 
                <input type="text" name="kgzsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="kgzsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="19%" align="right">结果排序</td>
              <td colspan="3"> 
                <select name="pxzd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="crm_khxx.khbh desc">客户编号</option>
                  <option value="crm_khxx.khxm">客户姓名</option>
                  <option value="crm_khxx.lxfs">联系方式</option>
                  <option value="crm_khxx.fwdz">房屋地址</option>
                  <option value="crm_khxx.sjs">设计师</option>
                  <option value="crm_khxx.sgd">施工队</option>
                  <option value="sq_sgd.sgdlx">施工队类型</option>
                  <option value="crm_khxx.zjxm">工程担当</option>
                  <option value="crm_khxx.hth">合同号</option>
                  <option value="crm_khxx.qyrq">签约日期</option>
                  <option value="crm_khxx.dwbh">签约店面</option>
                </select>
                &nbsp;&nbsp;&nbsp;&nbsp;
				显示风格
				<input type="radio" name="xsfg" value="1" checked>
                网页 
                <input type="radio" name="xsfg" value="2">
                EXCEL </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="hidden" name="denglumark" value="true" >
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="button"  value="材料汇总明细表" onClick="f_tj(selectform)">
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.crm_khxx_qyrq, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq2, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_kgrq, "合同开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_kgrq2, "合同开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjkgrq, "实际开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjkgrq2, "实际开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jgrq, "合同竣工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jgrq2, "合同竣工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.kgzsj, "开工证出证日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.kgzsj2, "开工证出证日期"))) {
		return false;
	}


	FormName.action="Crm_khxxXgList.jsp";
	FormName.submit();
	return true;
}

function f_tj(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.crm_khxx_qyrq, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq2, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_kgrq, "合同开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_kgrq2, "合同开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjkgrq, "实际开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjkgrq2, "实际开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jgrq, "合同竣工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jgrq2, "合同竣工日期"))) {
		return false;
	}

	if(	javaTrim(FormName.fgs)=="") {
		alert("请输入[分公司]！");
		FormName.fgs.focus();
		return false;
	}
	if(	javaTrim(FormName.kgzsj)=="") {
		alert("请输入[开工证出证日期]！");
		FormName.kgzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.kgzsj, "开工证出证日期"))) {
		return false;
	}
	if(	javaTrim(FormName.kgzsj2)=="") {
		alert("请输入[开工证出证日期]！");
		FormName.kgzsj2.focus();
		return false;
	}
	if(!(isDatetime(FormName.kgzsj2, "开工证出证日期"))) {
		return false;
	}


	FormName.action="clhzmx.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>

