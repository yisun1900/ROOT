<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String mytbm=null;
String myt=null;
String wheremytbm=cf.GB2Uni(request.getParameter("mytbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select mytbm,myt ";
	ls_sql+=" from  jdm_mytbm";
	ls_sql+=" where  (mytbm='"+wheremytbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mytbm=cf.fillNull(rs.getString("mytbm"));
		myt=cf.fillNull(rs.getString("myt"));
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

<form method="post" action="SaveEditJdm_mytbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">门用途编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="mytbm" size="20" maxlength="2"  value="<%=mytbm%>" >
  </td>
  <td width="15%"> 
    <div align="right">门用途</div>
  </td>
  <td width="35%"> 
    <input type="text" name="myt" size="20" maxlength="50"  value="<%=myt%>" >
  </td>
</tr>
<input type="hidden" name="wheremytbm"  value="<%=wheremytbm%>" >
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
	if(	javaTrim(FormName.mytbm)=="") {
		alert("请输入[门用途编码]！");
		FormName.mytbm.focus();
		return false;
	}
	if(	javaTrim(FormName.myt)=="") {
		alert("请输入[门用途]！");
		FormName.myt.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
