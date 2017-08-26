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
String jzbm=(String)session.getAttribute("jzbm");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");

String nian=request.getParameter("nian");
String yue=request.getParameter("yue");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
    <tr> 
      <td colspan="4" height="64"> 
        <div align="center">店面结转业绩统计</div>
      </td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="42">大区</td>
      <td height="42" colspan="3" width="70%"> 
        <select name="ssdqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select ssdqbm,ssdqmc from sq_ssdqbm order by ssdqbm","");
%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="42">分公司</td>
      <td height="42" colspan="3" width="70%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc||DECODE(cxbz,'N','','Y','（撤销）'),ssdw from sq_dwxx where dwlx='F2' order by ssdw,cxbz,dwbh");
        out.println("        <select name=\"fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgsbh,dwbh,"+dwstr+");\">");
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
    </tr>
    <tr> 
      <td align="right" width="30%" height="44">签约店面</td>
      <td height="44" colspan="3" width="70%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc||DECODE(cxbz,'N','','Y','（撤销）') from sq_dwxx where dwlx='F2' order by ssdw,cxbz,dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc||DECODE(cxbz,'N','','Y','（撤销）') from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by cxbz,dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where (dwbh='"+dwbh+"' OR dwbh='"+jzbm+"')","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="43"> 统计时间</td>
      <td height="43" colspan="3" width="70%"> 从 
        <input type="text" name="sjfw" size="11" maxlength="10" value='<%=cf.firstDay(nian,yue)%>' ondblclick="JSCalendar(this)">
        ----&gt; 到 
        <input type="text" name="sjfw2" size="11" maxlength="10"  value='<%=cf.lastDay(nian,yue)%>' ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="46"><font color="#FF0000">*</font>业绩范围</td>
      <td height="46" colspan="3" width="70%"> 
        <input type="radio" name="jzbz" value="0" checked>
        全部 
        <input type="radio" name="jzbz" value="1">
        家装 
        <input type="radio" name="jzbz" value="2">
        公装 </td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="46">显示风格</td>
      <td height="46" colspan="3" width="70%"> 
        <input type="radio" name="xsfg" value="1" checked>
        网页 
        <input type="radio" name="xsfg" value="2">
        EXCEL </td>
    </tr>
    <tr align="center"> 
      <td height="71" colspan="4"> 
        <input type="hidden" name="nian" value="<%=nian%>">
        <input type="hidden" name="yue" value="<%=yue%>">
        <input type="button"  value="业绩统计" onClick="f_do(selectform,'jz')" name="jzcz">
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
function f_do(FormName,lx)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sjfw)=="") {
		alert("请输入[签约时间 ]！");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "签约时间 "))) {
		return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("请输入[签约时间 ]！");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "签约时间 "))) {
		return false;
	}

	FormName.action="dmjzyjtjb.jsp";
	FormName.target="";
	FormName.submit();
	FormName.jzcz.disabled=true;
	return true;
}


//-->
</SCRIPT>
