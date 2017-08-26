<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String ztstr=cf.getItemData("select ztbm,ztmc||'  （'||DECODE(rs_ztbm.ztlx,'01','招聘','02','培训','03','变动','04','费用审批','06','二次入职','07','调休申请','08','加班申请','09','考勤卡修正单','10','请假单','11','出差申请','12','增设岗位申请','13','辞职申请','14','退回人员申请')||'）',ztlx from rs_ztbm order by ztlx,ztbm");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertRs_shztlc.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td align="right" width="15%">状态类型</td>
      <td colspan="3">
        <select name="ztlx" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(ztlx,ztbm,<%=ztstr%>);selectItem(ztlx,xyztbm,<%=ztstr%>);">
          <option value=""></option>
          <option value="01">招聘</option>
          <option value="02">培训</option>
          <option value="03">变动</option>
          <option value="04">费用审批</option>
          <option value="06">二次入职</option>
          <option value="07">调休申请</option>
          <option value="08">加班申请</option>
          <option value="09">考勤卡修正单</option>
          <option value="10">请假单</option>
          <option value="11">出差申请</option>
          <option value="12">增设岗位申请</option>
          <option value="13">辞职申请</option>
          <option value="14">退回人员申请</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">审核状态</td>
      <td colspan="3"> 
        <select name="ztbm" style="FONT-SIZE:12PX;WIDTH:352PX" >
          <option value=""></option>
          <%
//	cf.selectItem(out,"select ztbm,ztmc||'  （'||DECODE(rs_ztbm.ztlx,'01','招聘','02','培训','03','变动','04','费用审批','06','二次入职','07','调休申请','08','加班申请','09','考勤卡修正单','10','请假单','11','出差申请','12','增设岗位申请','13','辞职申请','14','退回人员申请')||'）' from rs_ztbm order by ztlx,ztbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">审核结论</td>
      <td colspan="3"> <%
	cf.radioItem(out,"select shjl,shjlmc from rs_shjlbm order by shjl","shjl","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">下一状态</td>
      <td colspan="3"> 
        <select name="xyztbm" style="FONT-SIZE:12PX;WIDTH:352PX">
          <option value=""></option>
          <%
//	cf.selectItem(out,"select ztbm,ztmc||'  （'||DECODE(rs_ztbm.ztlx,'01','招聘','02','培训','03','变动','04','费用审批','06','二次入职','07','调休申请','08','加班申请','09','考勤卡修正单','10','请假单','11','出差申请','12','增设岗位申请','13','辞职申请','14','退回人员申请')||'）' from rs_ztbm order by ztlx,ztbm","");
%> 
        </select>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
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
	if(	javaTrim(FormName.ztlx)=="") {
		alert("请选择[状态类型]！");
		FormName.ztlx.focus();
		return false;
	}
	if(	javaTrim(FormName.ztbm)=="") {
		alert("请选择[审核状态]！");
		FormName.ztbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.shjl)) {
		alert("请选择[审核结论]！");
		FormName.shjl[0].focus();
		return false;
	}
	if(	javaTrim(FormName.xyztbm)=="") {
		alert("请选择[下一状态]！");
		FormName.xyztbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
