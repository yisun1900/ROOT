<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String fgsbh=(String)session.getAttribute("ssfgs");
%>

<form method="post" action="Cw_czbjsqjlCxList.jsp" name="selectform">
  <div align="center">重做报价－查询</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">所属分公司</td>
      <td width="31%"> 
<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx='F2' order by ssfgs,dwbh");
        out.println("        <select name=\"cw_czbjsqjl_fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(cw_czbjsqjl_fgsbh,crm_khxx_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"cw_czbjsqjl_fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'","");
        out.println("        </select>");
	}
%>
      </td>
      <td align="right" width="18%">签约店面</td>
      <td width="32%"> 
        <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+fgsbh+"' order by dwbh","");
	}
	else {
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh='"+dwbh+"' ","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">客户编号</td>
      <td width="31%"> 
        <input type="text" name="cw_czbjsqjl_khbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">合同号</td>
      <td width="32%"> 
        <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">客户姓名</td>
      <td width="31%"> 
        <input type="text" name="cw_czbjsqjl_khxm" size="20" maxlength="50" >
      </td>
      <td align="right" width="18%">房屋地址</td>
      <td width="32%"> 
        <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">签约日期 从</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">设计师</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">授权时间 从</td>
      <td width="31%"> 
        <input type="text" name="cw_czbjsqjl_sqsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="cw_czbjsqjl_sqsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">授权人</td>
      <td width="31%"> 
        <input type="text" name="cw_czbjsqjl_sqr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">完成人</td>
      <td width="32%"> 
        <input type="text" name="cw_czbjsqjl_wcr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">完成时间 从</td>
      <td width="31%"> 
        <input type="text" name="cw_czbjsqjl_wcsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="cw_czbjsqjl_wcsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">业绩结转时间 从</td>
      <td width="31%"> 
        <input type="text" name="cw_czbjsqjl_yjjzsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="cw_czbjsqjl_yjjzsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">是否需要业绩结转</td>
      <td width="31%">
		<INPUT type="radio" name="cw_czbjsqjl_sfxyjjz" value="Y">需要
		<INPUT type="radio" name="cw_czbjsqjl_sfxyjjz" value="N">不需要	  
      </td>
      <td align="right" width="18%">完成标志</td>
      <td width="32%"> 
        <select name="cw_czbjsqjl_wcbz" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"1+未完成&2+完成&3+业绩结转","");
%> 
        </select>
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
	if(!(isDatetime(FormName.cw_czbjsqjl_sqsj, "授权时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_czbjsqjl_sqsj2, "授权时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_czbjsqjl_wcsj, "完成时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_czbjsqjl_wcsj2, "完成时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_czbjsqjl_yjjzsj, "业绩结转时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_czbjsqjl_yjjzsj2, "业绩结转时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq2, "签约日期"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
