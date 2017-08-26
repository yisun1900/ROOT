<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>月报表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform" target='_blank'>
  <table width="100%" border="1" cellpadding="1" cellspacing="0">
    <tr> 
      <td colspan="2" height="64"> 
        <div align="center">退单统计表</div>
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="39">分公司</td>
      <td width="58%" height="39"> 
        <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,dwbh,<%=dwstr%>)">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="39">签约店面</td>
      <td width="58%" height="39"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
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
    <tr> 
      <td align="right" width="42%" height="39">退单时间 从</td>
      <td width="58%" height="39"> 
        <input type="text" name="sjfw" size="20" maxlength="10" value="<%=cf.firstDay()%>">
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="40">到</td>
      <td width="58%" height="40"> 
        <input type="text" name="sjfw2" size="20" maxlength="10"  value="<%=cf.lastDay()%>">
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="37">显示风格</td>
      <td width="58%" height="37"> 
        <input type="radio" name="xsfg" value="1" checked>
        网页 
        <input type="radio" name="xsfg" value="2">
        EXCEL </td>
    </tr>
    <tr align="center"> 
      <td height="209" colspan="2"> 
        <p> 
          <input type="button"  value="店面退单统计" onClick="f_do(selectform,'dmtdje')">
          <input type="button"  value="店面退单明细" onClick="f_do(selectform,'dmtdjemx')">
        </p>
        <p> 
          <input type="button"  value="施工队退单统计" onClick="f_do(selectform,'sgdtd')">
          <input type="button"  value="施工队退单明细" onClick="f_do(selectform,'sgdtdmx')">
        </p>
        <p> 
          <input type="button"  value="设计师退单统计" onClick="f_do(selectform,'sjstd')">
          <input type="button"  value="设计师退单明细" onClick="f_do(selectform,'sjstdmx')">
        </p>
        <p> 
          <input type="button"  value="退单原因分析" onClick="f_do(selectform,'tdyy')">
        </p>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sjfw)=="") {
		alert("请输入[时间范围 ]！");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "时间范围 "))) {
		return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("请输入[时间范围 ]！");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "时间范围 "))) {
		return false;
	}

	if (lx=="dmtdje")
	{
		FormName.action="DmTdjeTjb.jsp";
	}
	else if (lx=="dmtdjemx")
	{
		FormName.action="DmTdjeTjbMx.jsp";
	}
	else if (lx=="tdyy")
	{
		FormName.action="tdyytjb.jsp";
	}
	else if (lx=="tdyymx")
	{
		FormName.action="tdyytjbmx.jsp";
	}
	else if (lx=="sgdtd")
	{
		FormName.action="sgdtjb.jsp";
	}
	else if (lx=="sgdtdmx")
	{
		FormName.action="sgdtjbmx.jsp";
	}
	else if (lx=="sjstd")
	{
		FormName.action="sjstjb.jsp";
	}
	else if (lx=="sjstdmx")
	{
		FormName.action="sjstjbmx.jsp";
	}

	FormName.submit();
	return true;
}

//-->
</SCRIPT>
