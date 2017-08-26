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
<form method="post" action="Kp_pdkpjlRgdfList.jsp" name="selectform">
<div align="center">考评人工打分</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">分公司</td>
      <td width="34%"> 
        <select name="kp_pdkpjl_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0') order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
        </select>
      </td>
      <td align="right" width="17%">最新标志 </td>
      <td width="33%"> 
        <select name="kp_pdkpjl_zxbz" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"Y+最新&N+非最新","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">考评记录号</td>
      <td width="34%"> 
        <input type="text" name="kp_pdkpjl_kpjlh" size="20" maxlength="9" >
      </td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">考评起始时间</td>
      <td width="34%"> 
        <input type="text" name="kp_pdkpjl_qssj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="17%">考评截止时间</td>
      <td width="33%"> 
        <input type="text" name="kp_pdkpjl_jzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">录入人</td>
      <td width="34%"> 
        <input type="text" name="kp_pdkpjl_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="17%">录入时间</td>
      <td width="33%"> 
        <input type="text" name="kp_pdkpjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
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
	if(!(isDatetime(FormName.kp_pdkpjl_qssj, "考评起始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.kp_pdkpjl_jzsj, "考评截止时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.kp_pdkpjl_lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
