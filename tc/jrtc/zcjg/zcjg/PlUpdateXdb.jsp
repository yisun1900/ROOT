<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String bj_tczcbj_dqbm=null;
	String bj_tczcbj_bjjbbm=null;
	String bj_tczcjxc_clxlbm=null;

	bj_tczcbj_dqbm=request.getParameter("bj_tczcbj_dqbm");
	bj_tczcbj_bjjbbm=request.getParameter("bj_tczcbj_bjjbbm");
	bj_tczcjxc_clxlbm=request.getParameter("bj_tczcjxc_clxlbm");
%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SavePlUpdateXdb.jsp" name="editform" target="_blank">
<div align="center">套餐主材报价维护－批量修改【下单比】</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td height="17" align="right"><font color="#FF0000">*</font>地区</td>
    <td><select name="bj_tczcbj_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+bj_tczcbj_dqbm+"' order by dqbm","");
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="17" align="right"><font color="#FF0000">*</font>报价级别</td>
    <td><select name="bj_tczcbj_bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bj_tczcbj_bjjbbm+"'","");
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="17" align="right"><font color="#FF0000">*</font>产品类别</td>
    <td><select name="bj_tczcjxc_clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm where clxlbm="+bj_tczcjxc_clxlbm,"");
%>
    </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="48%" height="69" align="right"><font color="#FF0000">*</font>下单比</td>
  <td width="52%"><input type="text" name="xdb" size="8" maxlength="9" >
    报价计量单位/下单计量单位</td>
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
	if(	javaTrim(FormName.xdb)=="") {
		alert("请输入[下单比]！");
		FormName.xdb.focus();
		return false;
	}
	if(!(isFloat(FormName.xdb, "下单比"))) {
		return false;
	}
	if (parseFloat(FormName.xdb.value)==0)
	{
		alert("错误！[下单比]不能为0");
		FormName.xdb.select();
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
