<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String jglxbm=null;
String jglxmc=null;
String wherejglxbm=cf.GB2Uni(request.getParameter("jglxbm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select jglxbm,jglxmc ";
	ls_sql+=" from  dm_jglxbm";
	ls_sql+=" where  (jglxbm='"+wherejglxbm+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		jglxbm=cf.fillNull(rs.getString("jglxbm"));
		jglxmc=cf.fillNull(rs.getString("jglxmc"));
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
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

<form method="post" action="SaveEditDm_jglxbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
              <td width="18%"> 
                <div align="right">工程回访问题编码</div>
  </td>
              <td width="32%"> 
                <input type="text" name="jglxbm" size="20" maxlength="1"  value="<%=jglxbm%>" >
  </td>
              <td width="18%"> 
                <div align="right">工程回访问题名称</div>
  </td>
              <td width="32%"> 
                <input type="text" name="jglxmc" size="20" maxlength="50"  value="<%=jglxmc%>" >
  </td>
</tr>
<input type="hidden" name="wherejglxbm"  value="<%=wherejglxbm%>" >
	    <tr> 
              <td width="18%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="32%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                </div>
              </td>
              <td width="18%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="32%" height="2"> 
                <input type="reset"  value="重输">
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
	if(	javaTrim(FormName.jglxbm)=="") {
		alert("请输入[工程回访问题编码]！");
		FormName.jglxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jglxmc)=="") {
		alert("请输入[工程回访问题名称]！");
		FormName.jglxmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
