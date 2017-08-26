<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String hfxmbm=null;
String hfxmmc=null;
String lx=null;
String wherehfxmbm=cf.GB2Uni(request.getParameter("hfxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select hfxmbm,hfxmmc,lx ";
	ls_sql+=" from  dm_zxhfxmbm";
	ls_sql+=" where  (hfxmbm='"+wherehfxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hfxmbm=cf.fillNull(rs.getString("hfxmbm"));
		hfxmmc=cf.fillNull(rs.getString("hfxmmc"));
		lx=cf.fillNull(rs.getString("lx"));
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
<form method="post" action="SaveEditDm_zxhfxmbm.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">回访项目编码</td> 
  <td width="35%"> 
    <input type="text" name="hfxmbm" size="20" maxlength="2"  value="<%=hfxmbm%>" >
  </td>
  <td align="right" width="15%">回访项目名称</td> 
  <td width="35%"> 
    <input type="text" name="hfxmmc" size="20" maxlength="50"  value="<%=hfxmmc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">类型</td> 
  <td width="35%"> 
    <select name="lx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+设计方案是否满意&2+设计师沟通能力&3+设计师服务&4+工程报价&5+其它人员服务&6+公司总体印象&7+希望改进方面",lx);
%>
    </select>
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wherehfxmbm"  value="<%=wherehfxmbm%>" >
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
	if(	javaTrim(FormName.hfxmbm)=="") {
		alert("请输入[回访项目编码]！");
		FormName.hfxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hfxmmc)=="") {
		alert("请输入[回访项目名称]！");
		FormName.hfxmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.lx)=="") {
		alert("请选择[类型]！");
		FormName.lx.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
