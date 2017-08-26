<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String hxwzbm=null;
String hxwz=null;
String dqbm=null;
String wherehxwzbm=cf.GB2Uni(request.getParameter("hxwzbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select hxwzbm,hxwz,dqbm ";
	ls_sql+=" from  dm_hxwzbm";
	ls_sql+=" where  (hxwzbm='"+wherehxwzbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hxwzbm=cf.fillNull(rs.getString("hxwzbm"));
		hxwz=cf.fillNull(rs.getString("hxwz"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditDm_hxwzbm.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">环线位置编码</td> 
  <td width="35%"> 
    <input type="text" name="hxwzbm" size="20" maxlength="4"  value="<%=hxwzbm%>" >
  </td>
  <td align="right" width="15%">环线位置</td> 
  <td width="35%"> 
    <input type="text" name="hxwz" size="20" maxlength="50"  value="<%=hxwz%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">地区编码</td> 
  <td width="35%"> 
    <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm);
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
<input type="hidden" name="wherehxwzbm"  value="<%=wherehxwzbm%>" >
    <tr> 
      <td colspan="4" height="2"> &nbsp; 
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
	if(	javaTrim(FormName.hxwzbm)=="") {
		alert("请输入[环线位置编码]！");
		FormName.hxwzbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hxwz)=="") {
		alert("请输入[环线位置]！");
		FormName.hxwz.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
