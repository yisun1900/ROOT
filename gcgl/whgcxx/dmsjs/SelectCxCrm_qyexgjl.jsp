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
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_qyexgjlCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">修改记录号</td>
      <td width="31%"> 
        <input type="text" name="xgjlh" size="20" maxlength="9" >
      </td>
      <td align="right" width="20%">客户编号</td>
      <td width="30%"> 
        <input type="text" name="khbh" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">合同号</td>
      <td width="31%"> 
        <input type="text" name="hth" size="20" maxlength="20" >
      </td>
      <td align="right" width="20%">客户姓名</td>
      <td width="30%"> 
        <input type="text" name="khxm" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">房屋地址</td>
      <td colspan="3"> 
        <input type="text" name="fwdz" size="74" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">修改前分公司</td>
      <td width="31%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' and cxbz='N' order by ssdw,dwbh");
        out.println("        <select name=\"xgqfgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(xgqfgsbh,xgqdwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh",ssfgs);
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"xgqfgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
      <td align="right" width="20%">修改后分公司</td>
      <td width="30%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' and cxbz='N' order by ssdw,dwbh");
        out.println("        <select name=\"xghfgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(xghfgsbh,xghdwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh",ssfgs);
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"xghfgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">修改前签约店面</td>
      <td width="31%"> 
        <select name="xgqdwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
%> 
        </select>
      </td>
      <td align="right" width="20%">修改后签约店面</td>
      <td width="30%"> 
        <select name="xghdwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">修改前设计师</td>
      <td width="31%"> 
        <input type="text" name="xgqsjs" size="20" maxlength="20" >
      </td>
      <td align="right" width="20%">修改后设计师</td>
      <td width="30%"> 
        <input type="text" name="xghsjs" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">修改前设计师工号</td>
      <td width="31%"> 
        <input type="text" name="xgqsjsgh" size="20" maxlength="20" >
      </td>
      <td align="right" width="20%">修改后设计师工号</td>
      <td width="30%"> 
        <input type="text" name="xghsjsgh" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">修改前工程原报价</td>
      <td width="31%"> 
        <input type="text" name="xgqwdzgce" size="20" maxlength="17" >
      </td>
      <td align="right" width="20%">修改后工程原报价</td>
      <td width="30%"> 
        <input type="text" name="xghwdzgce" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">修改前折扣率</td>
      <td width="31%"> 
        <input type="text" name="xgqzkl" size="20" maxlength="9" >
      </td>
      <td align="right" width="20%">修改后折扣率</td>
      <td width="30%"> 
        <input type="text" name="xghzkl" size="20" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">修改前签约额</td>
      <td width="31%"> 
        <input type="text" name="xgqqye" size="20" maxlength="17" >
      </td>
      <td align="right" width="20%">修改后签约额</td>
      <td width="30%"> 
        <input type="text" name="xghqye" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">修改前税金百分比</td>
      <td width="31%"> 
        <input type="text" name="xgqsuijinbfb" size="20" maxlength="9" >
      </td>
      <td align="right" width="20%">修改后税金百分比</td>
      <td width="30%"> 
        <input type="text" name="xghsuijinbfb" size="20" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">修改前税金</td>
      <td width="31%"> 
        <input type="text" name="xgqsuijin" size="20" maxlength="17" >
      </td>
      <td align="right" width="20%">修改后税金</td>
      <td width="30%"> 
        <input type="text" name="xghsuijin" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">修改前设计费</td>
      <td width="31%"> 
        <input type="text" name="xgqsjf" size="20" maxlength="17" >
      </td>
      <td align="right" width="20%">修改后设计费</td>
      <td width="30%"> 
        <input type="text" name="xghsjf" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">修改前管理费</td>
      <td width="31%"> 
        <input type="text" name="xgqglf" size="20" maxlength="17" >
      </td>
      <td align="right" width="20%">修改后管理费</td>
      <td width="30%"> 
        <input type="text" name="xghglf" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">修改前促销活动</td>
      <td width="31%"> 
        <select name="xgqcxhd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cxhdmc c1,cxhdmc||'（'||DECODE(jsbz,'N','未结束','Y','结束')||'）' c2 from jc_cxhd where fgsbh='"+ssfgs+"' order by jsbz,cxhdbm","");
%> 
        </select>
      </td>
      <td align="right" width="20%">修改后促销活动</td>
      <td width="30%"> 
        <select name="xghcxhd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cxhdmc c1,cxhdmc||'（'||DECODE(jsbz,'N','未结束','Y','结束')||'）' c2 from jc_cxhd where fgsbh='"+ssfgs+"' order by jsbz,cxhdbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="19%">修改前促销活动</td>
      <td width="31%">
        <input type="text" name="xgqcxhd2" size="20" maxlength="50" >
      </td>
      <td align="right" width="20%">修改后促销活动</td>
      <td width="30%">
        <input type="text" name="xghcxhd2" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">录入时间 从</td>
      <td width="31%"> 
        <input type="text" name="lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="20%">到</td>
      <td width="30%"> 
        <input type="text" name="lrsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">录入人</td>
      <td width="31%"> 
        <input type="text" name="lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="20%">录入部门</td>
      <td width="30%"> 
        <input type="text" name="lrbm" size="20" maxlength="5" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">删除标志</td>
      <td width="31%"><%
	cf.radioToken(out, "scbz","N+未删除&Y+删除","");
%> </td>
      <td align="right" width="20%">删除人</td>
      <td width="30%"> 
        <input type="text" name="scr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">删除时间 从</td>
      <td width="31%"> 
        <input type="text" name="scsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="20%">到</td>
      <td width="30%"> 
        <input type="text" name="scsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="查询" onClick="f_do(selectform)">
        <input type="reset"  value="重输">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isFloat(FormName.xgqwdzgce, "修改前工程原报价"))) {
		return false;
	}
	if(!(isFloat(FormName.xgqqye, "修改前签约额"))) {
		return false;
	}
	if(!(isFloat(FormName.xgqsuijin, "修改前税金"))) {
		return false;
	}
	if(!(isFloat(FormName.xgqsuijinbfb, "修改前税金百分比"))) {
		return false;
	}
	if(!(isFloat(FormName.xgqsjf, "修改前设计费"))) {
		return false;
	}
	if(!(isFloat(FormName.xgqglf, "修改前管理费"))) {
		return false;
	}
	if(!(isFloat(FormName.xgqzkl, "修改前折扣率"))) {
		return false;
	}
	if(!(isFloat(FormName.xghwdzgce, "修改后工程原报价"))) {
		return false;
	}
	if(!(isFloat(FormName.xghqye, "修改后签约额"))) {
		return false;
	}
	if(!(isFloat(FormName.xghsuijin, "修改后税金"))) {
		return false;
	}
	if(!(isFloat(FormName.xghsuijinbfb, "修改后税金百分比"))) {
		return false;
	}
	if(!(isFloat(FormName.xghsjf, "修改后设计费"))) {
		return false;
	}
	if(!(isFloat(FormName.xghglf, "修改后管理费"))) {
		return false;
	}
	if(!(isFloat(FormName.xghzkl, "修改后折扣率"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.scsj, "删除时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.scsj2, "删除时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
