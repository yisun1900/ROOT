<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String jjgtmcbm=null;
String jjgtmc=null;
String jjlbbm=null;
String wherejjgtmcbm=cf.GB2Uni(request.getParameter("jjgtmcbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select jjgtmcbm,jjgtmc,jjlbbm ";
	ls_sql+=" from  jdm_jjgtmcbm";
	ls_sql+=" where  (jjgtmcbm='"+wherejjgtmcbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jjgtmcbm=cf.fillNull(rs.getString("jjgtmcbm"));
		jjgtmc=cf.fillNull(rs.getString("jjgtmc"));
		jjlbbm=cf.fillNull(rs.getString("jjlbbm"));
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

<form method="post" action="SaveEditJdm_jjgtmcbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">家具柜体名称编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jjgtmcbm" size="20" maxlength="2"  value="<%=jjgtmcbm%>" >
  </td>
  <td width="15%"> 
    <div align="right">家具柜体名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jjgtmc" size="20" maxlength="50"  value="<%=jjgtmc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">家具类别</div>
  </td>
  <td width="35%"> 
    <select name="jjlbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jjlbbm,jjlbmc from jdm_jjlbbm order by jjlbbm",jjlbbm);
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">&nbsp;</div>
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wherejjgtmcbm"  value="<%=wherejjgtmcbm%>" >
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
	if(	javaTrim(FormName.jjgtmcbm)=="") {
		alert("请输入[家具柜体名称编码]！");
		FormName.jjgtmcbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jjgtmc)=="") {
		alert("请输入[家具柜体名称]！");
		FormName.jjgtmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
