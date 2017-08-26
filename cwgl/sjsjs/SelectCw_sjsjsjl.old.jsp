<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Cw_sjsjsjlList.jsp" name="selectform">
<div align="center">设计师结算---修改</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="17%">分公司</td>
      <td width="33%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
      <td align="right" width="16%">签约店面</td>
      <td width="34%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
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
      <td width="17%" align="right">合同号</td>
      <td width="33%"> 
        <input type="text" name="hth" size="20" maxlength="20">
      </td>
      <td width="16%" align="right">客户编号</td>
      <td width="34%"> 
        <input type="text" name="khbh" size="20" maxlength="20">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"> 
        <div align="right">客户姓名</div>
      </td>
      <td width="33%"> 
        <input type="text" name="khxm" size="20" maxlength="50">
      </td>
      <td width="16%"> 
        <div align="right">联系方式</div>
      </td>
      <td width="34%"> 
        <input type="text" name="lxfs" size="20" maxlength="50">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" align="right">房屋地址</td>
      <td width="33%"> 
        <input type="text" name="fwdz" size="20" maxlength="100">
      </td>
      <td width="16%" align="right">施工队</td>
      <td width="34%">
        <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where ssfgs='"+ssfgs+"' and cxbz='N' order by sgdmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%"> 
        <div align="right">设计师</div>
      </td>
      <td width="33%"> 
        <input type="text" name="sjs" size="20" maxlength="50">
      </td>
      <td width="16%"> 
        <div align="right">质检</div>
      </td>
      <td width="34%"> 
        <input type="text" name="zjxm" size="20" maxlength="50">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp; </td>
      <td align="right" width="16%">&nbsp;</td>
      <td width="34%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">结算记录号</td>
      <td width="33%">
        <input type="text" name="cw_sjsjsjl_jsjlh" size="20" maxlength="9" >
      </td>
      <td align="right" width="16%">录入人</td>
      <td width="34%">
        <input type="text" name="cw_sjsjsjl_lrr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">录入时间从</td>
      <td width="33%"> 
        <input type="text" name="cw_sjsjsjl_lrsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="16%">到</td>
      <td width="34%"> 
        <input type="text" name="cw_sjsjsjl_lrsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">结算状态</td>
      <td width="33%"> 
        <select name="cw_sjsjsjl_spbz" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="1">开始结算</option>
          <option value="2">结算完成</option>
        </select>
      </td>
      <td align="right" width="16%">&nbsp;</td>
      <td width="34%">&nbsp; </td>
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
	if(!(isDatetime(FormName.cw_sjsjsjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sjsjsjl_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
