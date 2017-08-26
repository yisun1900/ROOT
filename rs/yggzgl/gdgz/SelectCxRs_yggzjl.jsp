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
	String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx in('A0','A1','F0','F1') order by ssfgs,dwbh");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Rs_yggzjlCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">发薪公司</div>              </td>
              <td width="32%">
<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"rs_yggzjl_ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(rs_yggzjl_ssfgs,rs_yggzjl_lrbm,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"rs_yggzjl_ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%>              </td>
              <td width="20%"> 
                <div align="right">序号</div>              </td>
              <td width="30%"> 
                <input type="text" name="rs_yggzjl_xh" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="18%" align="right">发薪日期 从</td>
              <td width="32%"> 
                <input type="text" name="rs_yggzjl_fxrq" size="20" maxlength="10" >              </td>
              <td width="20%" align="right">到</td>
              <td width="30%"> 
                <input type="text" name="rs_yggzjl_fxrq2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">工资开始日期</div>              </td>
              <td width="32%"> 
                <input type="text" name="rs_yggzjl_ksrq" size="20" maxlength="10" >              </td>
              <td width="20%"> 
                <div align="right">工资终止日期</div>              </td>
              <td width="30%"> 
                <input type="text" name="rs_yggzjl_zzrq" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">录入人</div>              </td>
              <td width="32%"> 
                <input type="text" name="rs_yggzjl_lrr" size="20" maxlength="20" >              </td>
              <td width="20%"> 
                <div align="right">录入部门</div>              </td>
              <td width="30%"> 
                <select name="rs_yggzjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1') order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1') and dwbh='"+ssfgs+"' order by dwbh","");
	}
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">录入时间 从</div>              </td>
              <td width="32%"> 
                <input type="text" name="rs_yggzjl_lrsj" size="20" maxlength="10" >              </td>
              <td width="20%"> 
                <div align="right">到</div>              </td>
              <td width="30%"> 
                <input type="text" name="rs_yggzjl_lrsj2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">工资类型</td>
              <td><input name="lx" type="radio" value="1" checked>
                固定工资</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.rs_yggzjl_fxrq, "发薪日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yggzjl_fxrq2, "发薪日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yggzjl_ksrq, "工资开始日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yggzjl_zzrq, "工资终止日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yggzjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yggzjl_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
