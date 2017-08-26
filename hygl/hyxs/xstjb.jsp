<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String dwbh=(String) session.getAttribute("dwbh");
String yhjs=(String) session.getAttribute("yhjs");
%>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr> 
    <td width="93%"> 
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr> 
    <td width="93%" > 
      <div align="center"> 
        <form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td width="15%" align="right">销售单位</td>
              <td width="35%">
                <select name="dwbh" style="FONT-SIZE:12px;WIDTH:152px">
                  <%
	if (yhjs.equals("00"))//00：总公司
	{
//		out.println("<option value=''></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx not in('5','6') order by dwbh","");
	}
	else if (yhjs.equals("02"))//02：分公司
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('2','3') and ssdw='"+dwbh+"' or  dwbh='"+dwbh+"' order by dwbh","");
	}
	else if (yhjs.equals("01"))//01：专卖店
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where  dwbh='"+dwbh+"' ","");
	}
	else if (yhjs.equals("03"))//03：加盟商
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('4','8') and ssdw='"+dwbh+"' or  dwbh='"+dwbh+"' order by dwbh","");
	}
	else if (yhjs.equals("04"))//04：加盟专卖店
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where  dwbh='"+dwbh+"'","");
	}
%> 
                </select>
              </td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">会员编号</div>
              </td>
              <td width="35%">
                <input type="text" name="hybh" size="20" maxlength="50" >
              </td>
              <td width="15%"> 
                <div align="right">水质分析卡号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="hykh" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="15%" align="right">销售日期 从</td>
              <td width="35%"> 
                <input type="text" name="xsrq" size="20" maxlength="10"  onKeyUp="cpbmKey(selectform)">
              </td>
              <td width="15%" align="right">到</td>
              <td width="35%"> 
                <input type="text" name="xsrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4" height="2"> 
                <input type="button"  value="查询明细" onClick="f_mxb(selectform)">
                <input type="button"  value="打印明细" onClick="f_dymx(selectform)" >
                <input type="button"  value="销售统计" onClick="f_xstj(selectform)" >
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
function cpbmKey(FormName)
{
//	alert(event.keyCode);
	if (event.keyCode==13)	
	{
		FormName.xsrq2.select();
	}
}


function f_mxb(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xsrq)=="") {
		alert("请输入[销售日期]！");
		FormName.xsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq, "销售日期"))) {
		return false;
	}
	if(	javaTrim(FormName.xsrq2)=="") {
		alert("请输入[销售日期]！");
		FormName.xsrq2.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq2, "销售日期"))) {
		return false;
	}

	FormName.action="Dm_xsjlCxList.jsp";
	FormName.submit();
	return true;
}

function f_dymx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xsrq)=="") {
		alert("请输入[销售日期]！");
		FormName.xsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq, "销售日期"))) {
		return false;
	}
	if(	javaTrim(FormName.xsrq2)=="") {
		alert("请输入[销售日期]！");
		FormName.xsrq2.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq2, "销售日期"))) {
		return false;
	}


	FormName.action="Dm_xsjlDyList.jsp";
	FormName.submit();
	return true;
}

function f_xstj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xsrq)=="") {
		alert("请输入[销售日期]！");
		FormName.xsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq, "销售日期"))) {
		return false;
	}
	if(	javaTrim(FormName.xsrq2)=="") {
		alert("请输入[销售日期]！");
		FormName.xsrq2.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq2, "销售日期"))) {
		return false;
	}


	FormName.action="xstj.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
