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
	String yhdlm=(String)session.getAttribute("yhdlm");
	String ygbh=cf.executeQuery("select ygbh from sq_yhxx where yhdlm='"+yhdlm+"'");
	String yhmc=cf.executeQuery("select yhmc from sq_yhxx where yhdlm='"+yhdlm+"'");
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx in('A0','A1','F0','F1') order by ssfgs,dwbh");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">员工查询工资</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Rs_yggzbCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">发薪公司</div>
              </td>
              <td width="35%"><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"rs_yggzjl_ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(rs_yggzjl_ssfgs,rs_yggzb_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"rs_yggzjl_ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
              <td width="15%"> 
                <div align="right">所属部门&nbsp;</div>
              </td>
              <td width="35%"> 
                <select name="rs_yggzb_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">发薪日期 从</div>
              </td>
              <td width="35%"> 
                <input type="text" name="rs_yggzjl_fxrq" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">到</div>
              </td>
              <td width="35%"> 
                <input type="text" name="rs_yggzjl_fxrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">工号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="rs_yggzb_bianhao" size="20" maxlength="20" >
              </td>
              <td width="15%"> 
                <div align="right">员工姓名</div>
              </td>
              <td width="35%"> 
                <input type="text" name="rs_yggzb_yhmc" size="20" maxlength="50" value="<%=yhmc%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">序号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="rs_yggzb_xh" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">员工序号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="rs_yggzb_ygbh" size="20" maxlength="8" value="<%=ygbh%>" readonly>
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
	if(!(isNumber(FormName.rs_yggzb_ygbh, "员工序号"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yggzjl_fxrq, "发薪日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yggzjl_fxrq2, "发薪日期"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
