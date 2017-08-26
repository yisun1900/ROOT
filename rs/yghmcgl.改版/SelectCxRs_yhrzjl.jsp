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
<form method="post" action="Rs_yhrzjlCxList.jsp" name="selectform">
  <div align="center">查询入职信息</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="20%" align="right">分公司</td>
      <td width="30%"><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where cxbz='N' order by ssfgs,dwbh");
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
%></td>
      <td width="19%" align="right">所属单位</td>
      <td width="31%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx in('F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">序号</td>
      <td width="30%"> 
        <input type="text" name="rs_yhrzjl_xh" size="20" maxlength="8" >
      </td>
      <td align="right" width="19%">员工序号</td>
      <td width="31%"> 
        <input type="text" name="rs_yhrzjl_ygbh" size="20" maxlength="8" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">员工名称</td>
      <td width="30%"> 
        <input type="text" name="rs_yhrzjl_yhmc" size="20" maxlength="50" >
      </td>
      <td align="right" width="19%">员工编号</td>
      <td width="31%"> 
        <input type="text" name="rs_yhrzjl_bianhao" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">身份证号</td>
      <td width="30%"> 
        <input type="text" name="rs_yhrzjl_sfzh" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">行政职务</td>
      <td width="31%"> 
        <input type="text" name="rs_yhrzjl_xzzwbm" size="20" maxlength="30" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">入职日期 从</td>
      <td width="30%"> 
        <input type="text" name="rs_yhrzjl_rzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="19%">到</td>
      <td width="31%"> 
        <input type="text" name="rs_yhrzjl_rzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">录入人</td>
      <td width="30%"> 
        <input type="text" name="rs_yhrzjl_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">入职次数</td>
      <td width="31%"> 
        <input type="text" name="rs_yhrzjl_rzcs" size="20" maxlength="8" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">录入时间 从</td>
      <td width="30%"> 
        <input type="text" name="rs_yhrzjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="19%">到</td>
      <td width="31%"> 
        <input type="text" name="rs_yhrzjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">入职类型</td>
      <td width="30%"> 
        <input type="radio" name="lx" value="1">新员工入职
        <input type="radio" name="lx" value="2">离职员工重新入职
      </td>
      <td align="right" width="19%">重新入职申请序号</td>
      <td width="31%"> 
        <input type="text" name="sqxh" size="20" maxlength="10" >
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.rs_yhrzjl_xh, "序号"))) {
		return false;
	}
	if(!(isNumber(FormName.rs_yhrzjl_ygbh, "员工序号"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yhrzjl_rzsj, "入职日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yhrzjl_rzsj2, "入职日期"))) {
		return false;
	}
	if(!(isNumber(FormName.rs_yhrzjl_rzcs, "入职次数"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yhrzjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yhrzjl_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
