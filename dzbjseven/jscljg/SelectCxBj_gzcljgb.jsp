<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<head>
<%
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
%>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Bj_bjmbCxList.jsp" name="selectform">
  <div align="center">请输入查询条件</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" height="2" align="right">地区：</td>
      <td width="26%" height="2"> 
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
      <td align="right" width="19%" height="2">材料类别</td>
      <td width="38%" height="2"> 
        <select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:224PX" >
          <option value=""></option>
          <%
			cf.selectItem(out,"select cldlbm,cldlmc from bdm_cldlbm order by cldlmc","");
		  %> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" height="2" align="right">材料名称</td>
      <td width="26%" height="2"> 
        <input type="text" name="glmc" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%" height="2">结算材料编码</td>
      <td width="38%" height="2"> 
        <input type="text" name="wlbm" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" height="2" align="right">是否需到物流领料</td>
      <td width="26%" height="2"> 
        <input type="radio" name="wlllbz" value="Y">
        需要 
        <input type="radio" name="wlllbz" value="N">
        否 </td>
      <td align="right" width="19%" height="2">&nbsp;</td>
      <td width="38%" height="2">&nbsp;</td>
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
   if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
