<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");
String ssfgs=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=request.getParameter("dqbm");
String[] lsh=request.getParameterValues("lsh");

%>
<html>
<head>
<title>仓库调拨</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveCkdb.jsp" name="insertform" >
<div align="center">仓库调拨</div>
<div align="center">
<a href="#" onClick="window.open('/jxc/bz/ckbh.jsp','center','width=400,height=350,top=300,left=350');" title="为何我的出库仓库不能显示？"></a></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="43%">调整仓库</td> 
  <td width="57%"> 
   <select name="ckbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeckbh(insertform)">
    <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.print("<option value=\"\"></option>");
		cf.selectItem(out,"select jxc_ckmc.ckbh,ckmc from jxc_ckmc where dqbm='"+dqbm+"'  order by ckmc","");
	}
	else
	{
		out.print("<option value=\"\"></option>");
		cf.selectItem(out,"select jxc_ckmc.ckbh,ckmc from jxc_ckmc,jxc_kgy where jxc_ckmc.ckbh=jxc_kgy.ckbh and  jxc_kgy.yhdlm='"+yhdlm+"' and dqbm='"+dqbm+"'  order by ckmc","");
	}
%>
  </select>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">货架</td>
  <td>
  
  <select name="hjbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
		out.print("<option value=\"\"></option>");
%>
  </select>
  </td>
</tr>

    <tr align="center"> 
      <td colspan="2"> 
    <input type="hidden" name="dqbm" value="<%=dqbm%>">  
<%
for (int i=0;i<lsh.length ;i++ )
{
	%>
    <input type="hidden" name="lsh" value="<%=lsh[i]%>">  
	<%
}

%>
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	//启用Ajax
	cf.ajax(out);
%>


function changeckbh(FormName) //改变下拉列表的值，触发Ajax
{
	FormName.hjbh.length=1;

	if (FormName.ckbh.value=="")
	{
		return;
	}

	var sql;
	sql="select hjbh,hjmc from jxc_hjmc where ckbh='"+FormName.ckbh.value+"' order by hjmc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(insertform.hjbh,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请输入[地区编码]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ckbh)=="") {
		alert("请输入[调整仓库]！");
		FormName.ckbh.focus();
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
