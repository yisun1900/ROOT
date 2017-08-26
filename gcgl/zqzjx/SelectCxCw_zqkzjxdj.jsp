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
<form method="post" action="Cw_zqkzjxdjCxList.jsp" name="selectform">
<div align="center"><strong>中期款增减项登记-查询</strong></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td bgcolor="#FFFFCC"><div align="right">分公司</div></td>
    <td><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' and cxbz='N' order by ssdw,dwbh");

        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%>    </td>
    <td><div align="right">签约店面</div></td>
    <td><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%>
      </select>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">合同号</td>
    <td><input type="text" name="hth" size="20" maxlength="20" onKeyUp="keyGo(lxfs)">    </td>
    <td align="right">客户编号</td>
    <td><input type="text" name="khbh" size="20" maxlength="20" onKeyUp="keyGo(lxfs)">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">设计师</td>
    <td><input type="text" name="sjs" size="20" maxlength="20" >    </td>
    <td align="right">工程担当</td>
    <td><input type="text" name="zjxm" size="20" maxlength="20" >    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td><div align="right">客户姓名</div></td>
    <td><input type="text" name="khxm" size="20" maxlength="50" onKeyUp="keyGo(lxfs)">    </td>
    <td><div align="right">联系方式</div></td>
    <td><input type="text" name="lxfs" size="20" maxlength="50"  onkeyup="keyGo(fwdz)">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">客户姓名</td>
    <td><input type="text" name="khxm2" size="12" maxlength="50" >
      （模糊查询） </td>
    <td align="right">房屋地址</td>
    <td><input type="text" name="fwdz2" size="20" maxlength="50">
      （模糊查询） </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td><div align="right">房屋地址</div></td>
    <td colspan="3"><input type="text" name="fwdz" size="72" maxlength="100" onKeyUp="keyGo(butt)" >    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="29" colspan="4" align="right">&nbsp;</td>
    </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%">一期款实收金额</td> 
  <td width="32%"> 
    <input type="text" name="cw_zqkzjxdj_yqkje" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">二期款应收金额</td> 
  <td width="32%"> 
    <input type="text" name="cw_zqkzjxdj_eqkje" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">实际应收金额</td> 
  <td width="32%"> 
    <input type="text" name="cw_zqkzjxdj_sjysje" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td> 
  <td width="32%"> 
    <input type="text" name="cw_zqkzjxdj_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">录入部门</td> 
  <td width="32%"><select name="cw_zqkzjxdj_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx order by dwbh","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从</td>
  <td><input type="text" name="cw_zqkzjxdj_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="cw_zqkzjxdj_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">二期款应收时间 从</td> 
  <td width="32%"><input type="text" name="cw_zqkzjxdj_eqksj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">到 </td>
  <td width="32%"><input type="text" name="cw_zqkzjxdj_eqksj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">  </td>
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
	if(!(isFloat(FormName.cw_zqkzjxdj_yqkje, "一期款实收金额"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_zqkzjxdj_eqksj, "二期款应收时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_zqkzjxdj_eqksj2, "二期款应收时间"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_zqkzjxdj_eqkje, "二期款应收金额"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_zqkzjxdj_sjysje, "实际应收金额"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_zqkzjxdj_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_zqkzjxdj_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
