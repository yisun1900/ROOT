<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String bclx=null;
String bcpp=null;
String bchd=null;
String dj=null;
String wherebclx=request.getParameter("bclx");
String wherebchd=request.getParameter("bchd");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select bcpp,bclx,bchd,dj ";
	ls_sql+=" from  jc_jjbjbj";
	ls_sql+=" where  (bclx='"+wherebclx+"') and  (bchd="+wherebchd+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bcpp=cf.fillNull(rs.getString("bcpp"));
		bclx=cf.fillNull(rs.getString("bclx"));
		bchd=cf.fillNull(rs.getString("bchd"));
		dj=cf.fillNull(rs.getString("dj"));
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
<form method="post" action="SaveEditJc_jjbjbj.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
      <td align="right" width="18%">板材品牌</td> 
      <td width="32%"> 
        <input type="text" name="bcpp" size="20" maxlength="50"  value="<%=bcpp%>" >
  </td>
      <td align="right" width="18%">板材类型</td>
      <td width="32%"> 
        <input type="text" name="bclx" value="<%=bclx%>" size="20" maxlength="50" >
      </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="18%">板材厚度（mm）</td>
      <td width="32%"> 
        <input type="text" name="bchd" size="20" maxlength="8"  value="<%=bchd%>" >
      </td>    
      <td align="right" width="18%">单价</td>
      <td width="32%"> 
        <input type="text" name="dj" size="20" maxlength="17"  value="<%=dj%>" >
      </td>
</tr>
<input type="hidden" name="wherebclx"  value="<%=wherebclx%>" >
<input type="hidden" name="wherebchd"  value="<%=wherebchd%>" >
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
	if(	javaTrim(FormName.bcpp)=="") {
		alert("请输入[板材品牌]！");
		FormName.bcpp.focus();
		return false;
	}
	if(	javaTrim(FormName.bclx)=="") {
		alert("请输入[板材类型]！");
		FormName.bclx.focus();
		return false;
	}
	if(	javaTrim(FormName.bchd)=="") {
		alert("请输入[板材厚度]！");
		FormName.bchd.focus();
		return false;
	}
	if(!(isNumber(FormName.bchd, "板材厚度"))) {
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "单价"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
