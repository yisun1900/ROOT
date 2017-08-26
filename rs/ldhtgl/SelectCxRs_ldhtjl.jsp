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
<form method="post" action="Rs_ldhtjlCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="17%">所属分公司</td>
      <td width="33%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' order by ssfgs,dwbh");
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(ssfgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
      <td align="right" width="18%">所属部门</td>
      <td width="32%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by ssfgs,dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">劳动合同编号</td>
      <td width="33%"> 
        <input type="text" name="rs_ldhtjl_ldhtbh" size="20" maxlength="14" >
      </td>
      <td align="right" width="18%">员工序号</td>
      <td width="32%"> 
        <input type="text" name="rs_ldhtjl_ygbh" size="20" maxlength="8" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">员工名称</td>
      <td width="33%"> 
        <input type="text" name="rs_ldhtjl_yhmc" size="20" maxlength="50" >
      </td>
      <td align="right" width="18%">员工编号</td>
      <td width="32%"> 
        <input type="text" name="rs_ldhtjl_bianhao" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">身份证号</td>
      <td width="33%"> 
        <input type="text" name="rs_ldhtjl_sfzh" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">行政职务</td>
      <td width="32%"> 
        <select name="rs_ldhtjl_xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">入职日期 从</td>
      <td width="33%"> 
        <input type="text" name="rs_ldhtjl_rzsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="rs_ldhtjl_rzsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">劳动合同类型</td>
      <td width="33%"> 
        <select name="rs_ldhtjl_ldhtlx" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ldhtlx c1,ldhtlx c2 from dm_ldhtlx order by ldhtlx","");
%> 
        </select>
      </td>
      <td align="right" width="18%">劳动合同期限</td>
      <td width="32%"> 
        <select name="rs_ldhtjl_ldhtqx" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ldhtqx c1,ldhtqx c2  from dm_ldhtqx order by ldhtqx","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">合同开始日期 从</td>
      <td width="33%"> 
        <input type="text" name="rs_ldhtjl_htksrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="rs_ldhtjl_htksrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">合同到期日期 从</td>
      <td width="33%"> 
        <input type="text" name="rs_ldhtjl_htdqrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="rs_ldhtjl_htdqrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">录入人</td>
      <td width="33%"> 
        <input type="text" name="rs_ldhtjl_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">录入部门</td>
      <td width="32%"> 
        <select name="rs_ldhtjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">录入时间 从</td>
      <td width="33%"> 
        <input type="text" name="rs_ldhtjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="rs_ldhtjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">类型</td>
      <td width="33%"> 
        <input type="radio" name="lx" value="1">
        新签 
        <input type="radio" name="lx" value="2">
        续签 </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.rs_ldhtjl_ygbh, "员工序号"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_ldhtjl_rzsj, "入职日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_ldhtjl_rzsj2, "入职日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_ldhtjl_htksrq, "合同开始日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_ldhtjl_htksrq2, "合同开始日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_ldhtjl_htdqrq, "合同到期日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_ldhtjl_htdqrq2, "合同到期日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_ldhtjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_ldhtjl_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
