<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String bllxbm=null;
String bllxmc=null;
String wherebllxbm=cf.GB2Uni(request.getParameter("bllxbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select bllxbm,bllxmc ";
	ls_sql+=" from  jdm_bllxbm";
	ls_sql+=" where  (bllxbm='"+wherebllxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bllxbm=cf.fillNull(rs.getString("bllxbm"));
		bllxmc=cf.fillNull(rs.getString("bllxmc"));
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

<form method="post" action="SaveEditJdm_bllxbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">玻璃类型编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="bllxbm" size="20" maxlength="2"  value="<%=bllxbm%>" >
  </td>
  <td width="15%"> 
    <div align="right">玻璃类型名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="bllxmc" size="20" maxlength="50"  value="<%=bllxmc%>" >
  </td>
</tr>
<input type="hidden" name="wherebllxbm"  value="<%=wherebllxbm%>" >
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
	if(	javaTrim(FormName.bllxbm)=="") {
		alert("请输入[玻璃类型编码]！");
		FormName.bllxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bllxmc)=="") {
		alert("请输入[玻璃类型名称]！");
		FormName.bllxmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
