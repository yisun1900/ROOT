<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String tckb_zck_dqbm=null;

	tckb_zck_dqbm=request.getParameter("tckb_zck_dqbm");
%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SavePlUpdateGys.jsp" name="editform">
<div align="center">套餐主材报价维护－批量修改供应商</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="21%" height="17" align="right"><font color="#FF0000">*</font>地区</td>
    <td width="79%"><select name="tckb_zck_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+tckb_zck_dqbm+"' order by dqbm","");
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="17" align="right"><font color="#FF0000">*</font>原供应商</td>
    <td><select name="oldgysmc" style="FONT-SIZE:12PX;WIDTH:523PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select gysmc c1,gysmc c2 from jxc_gysxx where cllx in('1','3') order by gysmc","");
	%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="17" align="right"><font color="#FF0000">*</font>新供应商</td>
    <td><select name="newgysmc" style="FONT-SIZE:12PX;WIDTH:523PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select gysmc c1,gysmc c2 from jxc_gysxx where cllx in('1','3') order by gysmc","");
	%>
    </select></td>
  </tr>


    <tr> 
      <td colspan="2" >
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.oldgysmc)=="") {
		alert("请输入[原供应商]！");
		FormName.oldgysmc.focus();
		return false;
	}
	if(	javaTrim(FormName.newgysmc)=="") {
		alert("请输入[新供应商]！");
		FormName.newgysmc.focus();
		return false;
	}
 
	if (!confirm("修改后不可恢复，不要改错了，确实要继续吗?") )	
	{
		return true;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
