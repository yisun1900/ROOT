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
String yhmc=(String)session.getAttribute("yhmc");
String yhjs=(String)session.getAttribute("yhjs");
String dwbh=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
<div align="center">查询领取明细</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">申领分公司</td>
      <td width="31%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' order by ssfgs,dwbh");
        out.println("        <select name=\"oa_xcplqsq_fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(oa_xcplqsq_fgsbh,oa_xcplqsq_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"oa_xcplqsq_fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
      <td align="right" width="18%">申领单位</td>
      <td width="32%"> 
        <select name="oa_xcplqsq_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") )
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' order by ssfgs,dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' ","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">申请序号</td>
      <td width="31%"> 
        <input type="text" name="oa_xcplqsq_sqxh" size="20" maxlength="8" >
      </td>
      <td align="right" width="18%">申领人</td>
      <td width="32%"> 
        <input type="text" name="oa_xcplqsq_slr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">计划领取日期 从</td>
      <td width="31%"> 
        <input type="text" name="oa_xcplqsq_jhlqrq" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="oa_xcplqsq_jhlqrq2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">录入日期 从</td>
      <td width="31%"> 
        <input type="text" name="oa_xcplqsq_lrrq" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="oa_xcplqsq_lrrq2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">录入人</td>
      <td width="31%"> 
        <input type="text" name="oa_xcplqsq_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">是否需审批</td>
      <td width="32%"> <%
	cf.radioToken(out, "oa_xcplqsq_sfxsp","N+不需要&Y+需要","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">一级审批人</td>
      <td width="31%"> 
        <input type="text" name="oa_xcplqsq_yjspr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">一级审批结论</td>
      <td width="32%"> <%
	cf.radioToken(out, "oa_xcplqsq_yjspjl","1+同意&2+返回上级&3+撤销","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">一级审批时间 从</td>
      <td width="31%"> 
        <input type="text" name="oa_xcplqsq_yjspsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="oa_xcplqsq_yjspsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">二级审批人</td>
      <td width="31%"> 
        <input type="text" name="oa_xcplqsq_ejspr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">二级审批结论</td>
      <td width="32%"><%
	cf.radioToken(out, "oa_xcplqsq_ejspjl","1+同意&2+返回上级&3+撤销","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">二级审批时间 从</td>
      <td width="31%"> 
        <input type="text" name="oa_xcplqsq_ejspsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="oa_xcplqsq_ejspsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">三级审批人</td>
      <td width="31%"> 
        <input type="text" name="oa_xcplqsq_sjspr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">三级审批结论</td>
      <td width="32%"><%
	cf.radioToken(out, "oa_xcplqsq_sjspjl","1+同意&2+返回上级&3+撤销","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">三级审批时间 从</td>
      <td width="31%"> 
        <input type="text" name="oa_xcplqsq_sjspsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="oa_xcplqsq_sjspsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">领取时间 从</td>
      <td width="31%"> 
        <input type="text" name="oa_xcplqsq_lqsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="oa_xcplqsq_lqsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">办理人</td>
      <td width="31%"> 
        <input type="text" name="oa_xcplqsq_blr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">领取状态</td>
      <td width="32%"> 
        <select name="oa_xcplqsq_lqzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"1+未完成&2+完成申请&3+一级审批&4+二级审批&5+三级审批&6+已领取","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">印刷品编码（6位）</td>
      <td width="31%"> 
        <input type="text" name="xcpbm" value="" size="20" maxlength="6" >
      </td>
      <td align="right" width="18%">印刷品名称</td>
      <td width="32%"> 
        <input type="text" name="xcpmc" value="" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">印刷品分类</td>
      <td width="31%"> 
        <select name="xcpflbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <%
	cf.selectItem(out,"select xcpflbm,xcpflmc from oa_xcpflbm order by xcpflmc","");
%> 
        </select>
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="19%" align="right">查询结果排序</td>
      <td colspan="3"> 第一列 
        <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value="oa_xcplqsq.sqxh desc">申请序号</option>
          <option value="oa_xcplqsq.dwbh">申领单位</option>
          <option value="oa_xcplqsq.fgsbh">分公司</option>
          <option value="oa_xcplqsq.slr">申领人</option>
          <option value="oa_xcplqsq.jhlqrq">计划领取日期</option>
          <option value="oa_xcplqsq.lrr">录入人</option>
          <option value="oa_xcplqsq.lrrq">录入日期</option>
          <option value="oa_xcplqsq.sfxsp">是否需审批</option>
          <option value="oa_xcplqsq.lqzt">领取状态</option>
          <option value="oa_xcplqsq.blr">办理人</option>
          <option value="oa_xcplqsq.lqsj">领取时间</option>
          <option value="oa_xcplqmx.xcpbm">印刷品编码</option>
          <option value="oa_xcplqmx.xcpmc">印刷品名称</option>
          <option value="oa_xcplqmx.xcpflbm">印刷品分类</option>
        </select>
        第二列 
        <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="oa_xcplqsq.sqxh desc">申请序号</option>
          <option value="oa_xcplqsq.dwbh">申领单位</option>
          <option value="oa_xcplqsq.fgsbh">分公司</option>
          <option value="oa_xcplqsq.slr">申领人</option>
          <option value="oa_xcplqsq.jhlqrq">计划领取日期</option>
          <option value="oa_xcplqsq.lrr">录入人</option>
          <option value="oa_xcplqsq.lrrq">录入日期</option>
          <option value="oa_xcplqsq.sfxsp">是否需审批</option>
          <option value="oa_xcplqsq.lqzt">领取状态</option>
          <option value="oa_xcplqsq.blr">办理人</option>
          <option value="oa_xcplqsq.lqsj">领取时间</option>
          <option value="oa_xcplqmx.xcpbm">印刷品编码</option>
          <option value="oa_xcplqmx.xcpmc">印刷品名称</option>
          <option value="oa_xcplqmx.xcpflbm">印刷品分类</option>
        </select>
        第三列 
        <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="oa_xcplqsq.sqxh desc">申请序号</option>
          <option value="oa_xcplqsq.dwbh">申领单位</option>
          <option value="oa_xcplqsq.fgsbh">分公司</option>
          <option value="oa_xcplqsq.slr">申领人</option>
          <option value="oa_xcplqsq.jhlqrq">计划领取日期</option>
          <option value="oa_xcplqsq.lrr">录入人</option>
          <option value="oa_xcplqsq.lrrq">录入日期</option>
          <option value="oa_xcplqsq.sfxsp">是否需审批</option>
          <option value="oa_xcplqsq.lqzt">领取状态</option>
          <option value="oa_xcplqsq.blr">办理人</option>
          <option value="oa_xcplqsq.lqsj">领取时间</option>
          <option value="oa_xcplqmx.xcpbm">印刷品编码</option>
          <option value="oa_xcplqmx.xcpmc">印刷品名称</option>
          <option value="oa_xcplqmx.xcpflbm">印刷品分类</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="19%" align="right">显示风格</td>
      <td colspan="3"> 
        <input type="radio" name="xsfg" value="1" checked>
        网页 
        <input type="radio" name="xsfg" value="2">
        EXCEL &nbsp;&nbsp;&nbsp;每页显示数量 
        <input type="text" name="myxssl" size="7" maxlength="13" value="60">
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="查询" onClick="f_do(selectform,'cx')">
        <input type="reset"  value="重输">
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="19%" align="right">统计表</td>
      <td colspan="3"> 第一列 
        <input type="hidden" name="tj1name" value="">
        <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
          <option value=""></option>
          <option value="oa_xcplqmx.xcpbm">印刷品编码</option>
          <option value="oa_xcplqmx.xcpmc">印刷品名称</option>
          <option value="xcpflmc">印刷品分类</option>
          <option value="oa_xcplqsq.sqxh">申请序号</option>
          <option value="dwmc">申领单位</option>
          <option value="oa_xcplqsq.fgsbh">分公司</option>
          <option value="oa_xcplqsq.slr">申领人</option>
          <option value="oa_xcplqsq.jhlqrq">计划领取日期</option>
          <option value="oa_xcplqsq.lrr">录入人</option>
          <option value="oa_xcplqsq.lrrq">录入日期</option>
          <option value="oa_xcplqsq.sfxsp">是否需审批</option>
          <option value="DECODE(oa_xcplqsq.lqzt,'1','未完成','2','完成申请','3','一级审批','4','二级审批','5','三级审批','6','已领取')">领取状态</option>
          <option value="oa_xcplqsq.blr">办理人</option>
          <option value="oa_xcplqsq.lqsj">领取时间</option>
        </select>
        第二列 
        <input type="hidden" name="tj2name" value="">
        <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
          <option value=""></option>
          <option value="oa_xcplqmx.xcpbm">印刷品编码</option>
          <option value="oa_xcplqmx.xcpmc">印刷品名称</option>
          <option value="xcpflmc">印刷品分类</option>
          <option value="oa_xcplqsq.sqxh">申请序号</option>
          <option value="dwmc">申领单位</option>
          <option value="oa_xcplqsq.fgsbh">分公司</option>
          <option value="oa_xcplqsq.slr">申领人</option>
          <option value="oa_xcplqsq.jhlqrq">计划领取日期</option>
          <option value="oa_xcplqsq.lrr">录入人</option>
          <option value="oa_xcplqsq.lrrq">录入日期</option>
          <option value="oa_xcplqsq.sfxsp">是否需审批</option>
          <option value="DECODE(oa_xcplqsq.lqzt,'1','未完成','2','完成申请','3','一级审批','4','二级审批','5','三级审批','6','已领取')">领取状态</option>
          <option value="oa_xcplqsq.blr">办理人</option>
          <option value="oa_xcplqsq.lqsj">领取时间</option>
        </select>
        第三列 
        <input type="hidden" name="tj3name" value="">
        <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
          <option value=""></option>
          <option value="oa_xcplqmx.xcpbm">印刷品编码</option>
          <option value="oa_xcplqmx.xcpmc">印刷品名称</option>
          <option value="xcpflmc">印刷品分类</option>
          <option value="oa_xcplqsq.sqxh">申请序号</option>
          <option value="dwmc">申领单位</option>
          <option value="oa_xcplqsq.fgsbh">分公司</option>
          <option value="oa_xcplqsq.slr">申领人</option>
          <option value="oa_xcplqsq.jhlqrq">计划领取日期</option>
          <option value="oa_xcplqsq.lrr">录入人</option>
          <option value="oa_xcplqsq.lrrq">录入日期</option>
          <option value="oa_xcplqsq.sfxsp">是否需审批</option>
          <option value="DECODE(oa_xcplqsq.lqzt,'1','未完成','2','完成申请','3','一级审批','4','二级审批','5','三级审批','6','已领取')">领取状态</option>
          <option value="oa_xcplqsq.blr">办理人</option>
          <option value="oa_xcplqsq.lqsj">领取时间</option>
        </select>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="统计表" onClick="f_do(selectform,'tj')" name="button2">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.oa_xcplqsq_sqxh, "申请序号"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_jhlqrq, "计划领取日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_jhlqrq2, "计划领取日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_lrrq, "录入日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_lrrq2, "录入日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_yjspsj, "一级审批时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_yjspsj2, "一级审批时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_ejspsj, "二级审批时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_ejspsj2, "二级审批时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_sjspsj, "三级审批时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_sjspsj2, "三级审批时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_lqsj, "领取时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_lqsj2, "领取时间"))) {
		return false;
	}

	if (lx=="cx")
	{
		FormName.action="Oa_xcplqmxCxList.jsp"
	}
	else if (lx=="tj")
	{
		if(FormName.tj1.value=="" && FormName.tj2.value=="" && FormName.tj3.value=="") {
			alert("请选择[统计列]！");
			FormName.tj1.focus();
			return false;
		}
		FormName.action="Oa_xcplqmxTjb.jsp"
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
