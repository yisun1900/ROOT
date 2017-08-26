<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xmxlbm=null;
String xmxlmc=null;
String xmdlbm=null;
String wherexmxlbm=cf.GB2Uni(request.getParameter("xmxlbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xmxlbm,xmxlmc,xmdlbm ";
	ls_sql+=" from  bdm_xmxlbm";
	ls_sql+=" where  (xmxlbm='"+wherexmxlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xmxlbm=cf.fillNull(rs.getString("xmxlbm"));
		xmxlmc=cf.fillNull(rs.getString("xmxlmc"));
		xmdlbm=cf.fillNull(rs.getString("xmdlbm"));
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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请修改信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditBdm_xmxlbm.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">项目大类</div>
              </td>
              <td width="35%"> 
                <select name="xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getItemValue(xmdlbm,xmxlbm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm",xmdlbm);
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">项目小类编码</div>
              </td>
              <td width="35%"> 
                <input type="text" name="xmxlbm" size="20" maxlength="4"  value="<%=xmxlbm%>" >
              </td>
              <td width="15%"> 
                <div align="right">项目小类名称</div>
              </td>
              <td width="35%"> 
                <input type="text" name="xmxlmc" size="20" maxlength="50"  value="<%=xmxlmc%>" >
              </td>
            </tr>
            <input type="hidden" name="wherexmxlbm"  value="<%=wherexmxlbm%>" >
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

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xmdlbm)=="") {
		alert("请选择[项目大类编码]！");
		FormName.xmdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmxlbm)=="") {
		alert("请输入[项目小类编码]！");
		FormName.xmxlbm.focus();
		return false;
	}
	if (FormName.xmxlbm.value.length!=4)
	{
		alert("[项目小类编码]长度应为4位！");
		FormName.xmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmxlmc)=="") {
		alert("请输入[项目小类名称]！");
		FormName.xmxlmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
