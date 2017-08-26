<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String pjxmbm=null;
String pjxm=null;
String spjrybm=null;
String spjry=null;
String xmflbm=null;
String xmfl=null;
String xsfs=null;
String xh=null;
String wherepjxmbm=cf.GB2Uni(request.getParameter("pjxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select pjxmbm,pjxm,spjrybm,spjry,xmflbm,xmfl,xsfs,xh ";
	ls_sql+=" from  crm_pjxmbm";
	ls_sql+=" where  (pjxmbm='"+wherepjxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pjxmbm=cf.fillNull(rs.getString("pjxmbm"));
		pjxm=cf.fillNull(rs.getString("pjxm"));
		spjrybm=cf.fillNull(rs.getString("spjrybm"));
		spjry=cf.fillNull(rs.getString("spjry"));
		xmflbm=cf.fillNull(rs.getString("xmflbm"));
		xmfl=cf.fillNull(rs.getString("xmfl"));
		xsfs=cf.fillNull(rs.getString("xsfs"));
		xh=cf.fillNull(rs.getString("xh"));
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
<form method="post" action="SaveEditCrm_pjxmbm.jsp" name="editform">
<div align="center">请修改信息</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">受评价人员</td>
      <td width="31%"> 
        <select name="spjrybm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="pjxmbm.value=spjrybm.value+xmflbm.value" >
          <option value=""></option>
          <%
	cf.selectItem(out,"select spjrybm,spjry from crm_spjrybm order by spjrybm",spjrybm);
%> 
        </select>
      </td>
      <td align="right" width="17%">项目分类</td>
      <td width="33%"> 
        <select name="xmflbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="pjxmbm.value=spjrybm.value+xmflbm.value">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xmflbm,xmfl from crm_xmflbm order by xmflbm",xmflbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">评价项目编码(6位)</td>
      <td width="31%"> 
        <input type="text" name="pjxmbm" size="20" maxlength="6"  value="<%=pjxmbm%>" >
      </td>
      <td align="right" width="17%">序号</td>
      <td width="33%"> 
        <input type="text" name="xh" size="20" maxlength="8"  value="<%=xh%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">评价项目</td>
      <td colspan="3"> 
        <input type="text" name="pjxm" size="71" maxlength="40"  value="<%=pjxm%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">显示方式</td>
      <td colspan="3"> <%
	cf.radioToken(out, "xsfs","1+项目分类多选&2+项目分类单选",xsfs);
%> </td>
    </tr>
    <input type="hidden" name="wherepjxmbm"  value="<%=wherepjxmbm%>" >
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
	if(	javaTrim(FormName.spjrybm)=="") {
		alert("请选择[受评价人员]！");
		FormName.spjrybm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmflbm)=="") {
		alert("请选择[项目分类]！");
		FormName.xmflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.pjxmbm)=="") {
		alert("请输入[评价项目编码(6位)]！");
		FormName.pjxmbm.focus();
		return false;
	}
	if (FormName.pjxmbm.value.length!=6)
	{
		alert("[评价项目编码]应为6位！");
		FormName.pjxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.pjxm)=="") {
		alert("请输入[评价项目]！");
		FormName.pjxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xsfs)) {
		alert("请选择[显示方式]！");
		FormName.xsfs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.xh)=="") {
		alert("请输入[序号]！");
		FormName.xh.focus();
		return false;
	}
	if(!(isNumber(FormName.xh, "序号"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
