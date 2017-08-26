<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String shxmdlbm=null;
String shxmdlmc=null;
String whereshxmdlbm=cf.GB2Uni(request.getParameter("shxmdlbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select shxmdlbm,shxmdlmc ";
	ls_sql+=" from  dm_ysshxmdlbm";
	ls_sql+=" where  (shxmdlbm='"+whereshxmdlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		shxmdlbm=cf.fillNull(rs.getString("shxmdlbm"));
		shxmdlmc=cf.fillNull(rs.getString("shxmdlmc"));
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

<form method="post" action="SaveEditDm_shxmdlbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">审核项目大类编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="shxmdlbm" size="20" maxlength="1"  value="<%=shxmdlbm%>" >
  </td>
  <td width="15%"> 
    <div align="right">审核项目大类名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="shxmdlmc" size="20" maxlength="50"  value="<%=shxmdlmc%>" >
  </td>
</tr>
<input type="hidden" name="whereshxmdlbm"  value="<%=whereshxmdlbm%>" >
	    <tr> 
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                </div>
              </td>
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
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
	if(	javaTrim(FormName.shxmdlbm)=="") {
		alert("请输入[审核项目大类编码]！");
		FormName.shxmdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.shxmdlmc)=="") {
		alert("请输入[审核项目大类名称]！");
		FormName.shxmdlmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
