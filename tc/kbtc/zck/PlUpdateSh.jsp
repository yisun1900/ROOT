<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String tckb_zck_dqbm=null;
	String tckb_zck_bjjbbm=null;
	String clxlbm=null;

	tckb_zck_dqbm=request.getParameter("tckb_zck_dqbm");
	tckb_zck_bjjbbm=request.getParameter("tckb_zck_bjjbbm");
	clxlbm=request.getParameter("clxlbm");
%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SavePlUpdateSh.jsp" name="editform">
<div align="center">套餐主材报价维护－批量修改【损耗】</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td height="17" align="right"><font color="#FF0000">*</font>地区</td>
  <td><select name="tckb_zck_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+tckb_zck_dqbm+"' order by dqbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td height="17" align="right"><font color="#FF0000">*</font>报价级别</td>
  <td><select name="tckb_zck_bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+tckb_zck_bjjbbm+"'","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td height="17" align="right"><font color="#FF0000">*</font>产品小类</td>
  <td><select name="cpxl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm where clxlbm="+clxlbm,"");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="48%" height="69" align="right"><font color="#FF0000">*</font>损耗</td>
  <td width="52%"><input type="text" name="sh" value="" size="8" maxlength="9" >
%（0～100）</td>
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
	if(	javaTrim(FormName.sh)=="") {
		alert("请输入[损耗]！");
		FormName.sh.focus();
		return false;
	}
	if(!(isFloat(FormName.sh, "损耗"))) {
		return false;
	}
	if (parseFloat(FormName.sh.value)<0 || parseFloat(FormName.sh.value)>100)
	{
		alert("错误！[损耗]只能在0到100之间");
		FormName.sh.select();
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
