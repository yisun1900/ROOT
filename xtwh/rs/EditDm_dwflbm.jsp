<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dwflbm=null;
String dwflmc=null;
String dwtjflbm=null;
String dwdl=null;
String zzfw=null;
String wheredwflbm=cf.GB2Uni(request.getParameter("dwflbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dwflbm,dwflmc,dwtjflbm,dwdl,zzfw ";
	ls_sql+=" from  dm_dwflbm";
	ls_sql+=" where  (dwflbm='"+wheredwflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dwflbm=cf.fillNull(rs.getString("dwflbm"));
		dwflmc=cf.fillNull(rs.getString("dwflmc"));
		dwtjflbm=cf.fillNull(rs.getString("dwtjflbm"));
		dwdl=cf.fillNull(rs.getString("dwdl"));
		zzfw=cf.fillNull(rs.getString("zzfw"));
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
<form method="post" action="SaveEditDm_dwflbm.jsp" name="editform">
<div align="center">请修改信息</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">单位分类编码</td>
      <td width="35%"> 
        <input type="text" name="dwflbm" size="20" maxlength="2"  value="<%=dwflbm%>" >
      </td>
      <td align="right" width="15%">单位分类名称</td>
      <td width="35%"> 
        <input type="text" name="dwflmc" size="20" maxlength="50"  value="<%=dwflmc%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">单位大类</td>
      <td width="35%"> <%
	cf.radioToken(out, "dwdl","1+业绩部门&2+非业绩部门",dwdl);
%> </td>
      <td align="right" width="15%">统计分类</td>
      <td width="35%">
        <select name="dwtjflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwtjflbm,dwtjflmc from dm_dwtjflbm order by dwtjflbm",dwtjflbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">职责范围</td>
      <td colspan="3"> 
        <textarea name="zzfw" cols="72" rows="12"><%=zzfw%></textarea>
      </td>
    </tr>
    <input type="hidden" name="wheredwflbm"  value="<%=wheredwflbm%>" >
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
	if(	javaTrim(FormName.dwflbm)=="") {
		alert("请输入[单位分类编码]！");
		FormName.dwflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dwflmc)=="") {
		alert("请输入[单位分类名称]！");
		FormName.dwflmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.dwdl)) {
		alert("请选择[单位大类]！");
		FormName.dwdl[0].focus();
		return false;
	}
	if(	javaTrim(FormName.dwtjflbm)=="") {
		alert("请输入[统计分类]！");
		FormName.dwtjflbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
