<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String kpdlbm=null;
String kpdlmc=null;
String wherekpdlbm=cf.GB2Uni(request.getParameter("kpdlbm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select kpdlbm,kpdlmc ";
	ls_sql+=" from  kp_kpdlbm";
	ls_sql+=" where  (kpdlbm='"+wherekpdlbm+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		kpdlbm=cf.fillNull(rs.getString("kpdlbm"));
		kpdlmc=cf.fillNull(rs.getString("kpdlmc"));
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

<form method="post" action="SaveEditKp_kpdlbm.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">违规大类编码</td>
              <td width="33%"> 
                <input type="text" name="kpdlbm" size="20" maxlength="2"  value="<%=kpdlbm%>" >
              </td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">违规大类名称</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="kpdlmc" size="57" maxlength="50"  value="<%=kpdlmc%>" >
              </td>
            </tr>
            <input type="hidden" name="wherekpdlbm"  value="<%=wherekpdlbm%>" >
            <tr> 
              <td width="17%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="33%" height="2"> 
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
	if(	javaTrim(FormName.kpdlbm)=="") {
		alert("请输入[违规大类编码]！");
		FormName.kpdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kpdlmc)=="") {
		alert("请输入[违规大类名称]！");
		FormName.kpdlmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
