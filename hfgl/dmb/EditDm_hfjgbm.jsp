<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String hfjgbm=null;
String hfjgmc=null;

String wherehfjgbm=cf.GB2Uni(request.getParameter("hfjgbm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select hfjgbm,hfjgmc ";
	ls_sql+=" from  dm_hfjgbm";
	ls_sql+=" where  (hfjgbm='"+wherehfjgbm+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		hfjgbm=cf.fillNull(rs.getString("hfjgbm"));
		hfjgmc=cf.fillNull(rs.getString("hfjgmc"));
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

<form method="post" action="SaveEditDm_hfjgbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
              <td width="18%"> 
                <div align="right">回访结果编码</div>  </td>
              <td width="32%"> 
                <input type="text" name="hfjgbm" size="20" maxlength="2"  value="<%=hfjgbm%>" >  </td>
              <td width="18%"> 
                <div align="right">回访结果名称</div>  </td>
              <td width="32%"> 
                <input type="text" name="hfjgmc" size="20" maxlength="50"  value="<%=hfjgmc%>" >  </td>
</tr>

<input type="hidden" name="wherehfjgbm"  value="<%=wherehfjgbm%>" >
	    <tr> 
              <td height="2" colspan="4" align="center"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
              <input type="reset"  value="重输"></td>
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
	if(	javaTrim(FormName.hfjgbm)=="") {
		alert("请输入[回访结果编码]！");
		FormName.hfjgbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hfjgmc)=="") {
		alert("请输入[回访结果名称]！");
		FormName.hfjgmc.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
