<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String ztstr=cf.getItemData("select ztbm,ztmc||'  （'||DECODE(rs_ztbm.ztlx,'01','招聘','02','培训','03','变动','04','费用审批','06','二次入职','07','调休申请','08','加班申请','09','考勤卡修正单','10','请假单','11','出差申请','12','增设岗位申请','13','辞职申请','14','退回人员申请')||'）',ztlx from rs_ztbm order by ztlx,ztbm");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Rs_shztlcList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">状态类型</td>
      <td colspan="3"> 
        <select name="ztlx" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(ztlx,rs_shztlc_ztbm,<%=ztstr%>);selectItem(ztlx,rs_shztlc_xyztbm,<%=ztstr%>);">
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
        <select name="rs_shztlc_ztbm" style="FONT-SIZE:12PX;WIDTH:352PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ztbm,ztmc||'  （'||DECODE(rs_ztbm.ztlx,'01','招聘','02','培训','03','变动','04','费用审批','06','二次入职','07','调休申请','08','加班申请','09','考勤卡修正单','10','请假单','11','出差申请','12','增设岗位申请','13','辞职申请','14','退回人员申请')||'）' from rs_ztbm order by ztlx,ztbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">审核结论</td>
      <td colspan="3"> 
        <select name="rs_shztlc_shjl" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select shjl,shjlmc from rs_shjlbm order by shjl","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">下一状态</td>
      <td colspan="3"> 
        <select name="rs_shztlc_xyztbm" style="FONT-SIZE:12PX;WIDTH:352PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ztbm,ztmc||'  （'||DECODE(rs_ztbm.ztlx,'01','招聘','02','培训','03','变动','04','费用审批','06','二次入职','07','调休申请','08','加班申请','09','考勤卡修正单','10','请假单','11','出差申请','12','增设岗位申请','13','辞职申请','14','退回人员申请')||'）' from rs_ztbm order by ztlx,ztbm","");
%> 
        </select>
      </td>
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
