<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ztbm=null;
String shjl=null;
String xyztbm=null;
String ztlx=null;
String whereztbm=cf.GB2Uni(request.getParameter("ztbm"));
String whereshjl=cf.GB2Uni(request.getParameter("shjl"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select rs_shztlc.ztbm,shjl,xyztbm,rs_ztbm.ztlx ";
	ls_sql+=" from  rs_shztlc,rs_ztbm";
	ls_sql+=" where  rs_shztlc.ztbm=rs_ztbm.ztbm and rs_shztlc.ztbm='"+whereztbm+"' and  rs_shztlc.shjl='"+whereshjl+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ztbm=cf.fillNull(rs.getString("ztbm"));
		shjl=cf.fillNull(rs.getString("shjl"));
		xyztbm=cf.fillNull(rs.getString("xyztbm"));
		ztlx=cf.fillNull(rs.getString("ztlx"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditRs_shztlc.jsp" name="editform">
<div align="center">请修改信息</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">审核状态</td>
      <td colspan="3" width="81%"> 
        <select name="ztbm" style="FONT-SIZE:12PX;WIDTH:352PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ztbm,ztmc||'  （'||DECODE(rs_ztbm.ztlx,'01','招聘','02','培训','03','变动','04','费用审批','06','二次入职','07','调休申请','08','加班申请','09','考勤卡修正单','10','请假单','11','出差申请','12','增设岗位申请','13','辞职申请','14','退回人员申请')||'）' from  rs_ztbm where ztlx='"+ztlx+"' order by ztlx,ztbm",ztbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">审核结论</td>
      <td colspan="3" width="81%"> 
        <select name="shjl" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select shjl,shjlmc from rs_shjlbm order by shjl",shjl);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">下一状态</td>
      <td colspan="3" width="81%"> 
        <select name="xyztbm" style="FONT-SIZE:12PX;WIDTH:352PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ztbm,ztmc||'  （'||DECODE(rs_ztbm.ztlx,'01','招聘','02','培训','03','变动','04','费用审批','06','二次入职','07','调休申请','08','加班申请','09','考勤卡修正单','10','请假单','11','出差申请','12','增设岗位申请','13','辞职申请','14','退回人员申请')||'）' from rs_ztbm where ztlx='"+ztlx+"' order by ztlx,ztbm",xyztbm);
%> 
        </select>
      </td>
    </tr>
    <input type="hidden" name="whereztbm"  value="<%=whereztbm%>" >
    <input type="hidden" name="whereshjl"  value="<%=whereshjl%>" >
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="button"  value="保存" onClick="f_do(editform)">
          <input type="reset"  value="重输">
        </div>
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
	if(	javaTrim(FormName.ztbm)=="") {
		alert("请选择[审核状态]！");
		FormName.ztbm.focus();
		return false;
	}
	if(	javaTrim(FormName.shjl)=="") {
		alert("请选择[审核结论]！");
		FormName.shjl.focus();
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
