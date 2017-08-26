<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.util.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<%
	String ztlx=cf.GB2Uni(request.getParameter("ztlx"));
	String yhzbh=cf.GB2Uni(request.getParameter("yhzbh"));
%>
<form method="post" action="SaveInsertRs_shsq.jsp" name="insertform" target="_blank">
<div align="center">招聘审核授权</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
      <td align="right" width="14%" valign="top">用户组</td> 
      <td width="32%" valign="top"> 
        <select name="yhzbh" style="FONT-SIZE:12PX;WIDTH:230PX">
          <%
	cf.selectItem(out,"select yhzbh,yhzmc  from sq_yhz where yhzbh='"+yhzbh+"'",yhzbh);
	%> 
        </select>
      </td>    
      <td align="right" width="13%">审核状态</td> 
      <td width="41%"> 
        <select name="ztbm" style="FONT-SIZE:12PX;WIDTH:230PX" size="12" multiple>
          <option value=""></option>
          <%
	cf.mutilSelectItem(out,"select ztbm,ztmc||'  （'||DECODE(rs_ztbm.ztlx,'01','招聘','02','培训','03','变动','04','费用审批','06','二次入职','07','调休申请','08','加班申请','09','考勤卡修正单','10','请假单','11','出差申请','12','增设岗位申请','13','辞职申请','14','退回人员申请')||'）' from rs_ztbm where ztlx='"+ztlx+"' order by ztlx,ztbm","select ztbm from rs_shsq where yhzbh='"+yhzbh+"'");
	%> 
        </select>
      </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="ztlx" value="<%=ztlx%>">
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">
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
	if(	!selectChecked(FormName.ztbm)) {
		alert("请输入[审核状态]！");
		FormName.ztbm.focus();
		return false;
	}

	if(	javaTrim(FormName.yhzbh)=="") {
		alert("请选择[用户组]！");
		FormName.yhzbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
