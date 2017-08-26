<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<%
String str1=cf.getItemData("select xmxlbm,xmxlmc,xmdlbm from bdm_xmxlbm order by xmdlbm,xmxlbm");
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
%>
<title>家装工料分析表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.style3 {
	color: #FF0000;
	font-size: 14px;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 16px'>
<div align="center">录入物流材料价格表</div>
<form method="post" action="InsertBj_cljg1.jsp" name="editform" >
  <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
    <tr> 
      <td width="28%" align="right">地区：</td>
      <td width="38%"> 
        <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td width="28%" align="right">材料类别：</td>
      <td width="38%"> 
        <select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:250PX"" >
          <option value=""></option>
          <%
	cf.selectItem(out,"select cldlbm,cldlmc from bdm_cldlbm order by cldlmc","");
					%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td width="28%" align="right">录入人：</td>
      <td width="38%"> 
        <input type="text" name="lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>
      </td>
    </tr>
    <tr> 
      <td width="28%" align="right">录入时间： </td>
      <td width="38%"> 
        <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" >
      </td>
    </tr>
    <tr> 
      <td width="28%" height="60">&nbsp;</td>
      <td width="38%" height="60"> 
        <input type="button"  value="录入" onClick="f_do(editform)" name="savebutton">
        <input type="reset"  value="重输" name="reset">
        &nbsp;&nbsp;&nbsp;&nbsp; 
        <input type="button"  value="导入材料价格" onClick="window.open('LoadCljg.jsp')" name="button" >
		&nbsp;&nbsp;&nbsp;
        <input type="button"  value="导出材料价格" onClick="f_exp(editform)">
      </td>
    </tr>
  </table>
  </form>

</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{  
     if(javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
     if(javaTrim(FormName.cldlbm)=="") {
		alert("请选择[材料类别]！");
		FormName.cldlbm.focus();
		return false;
	}

	FormName.action="InsertBj_cljg1.jsp";
	FormName.submit();
	return true;
}
function f_exp(FormName)//参数FormName:Form的名称
{  
     if(javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}

	FormName.action="Bj_bjmbExpList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
