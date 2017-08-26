<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String mmsmbbm=null;
String mmsmbmc=null;
String wheremmsmbbm=cf.GB2Uni(request.getParameter("mmsmbbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select mmsmbbm,mmsmbmc ";
	ls_sql+=" from  jdm_mmsmbbm";
	ls_sql+=" where  (mmsmbbm='"+wheremmsmbbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mmsmbbm=cf.fillNull(rs.getString("mmsmbbm"));
		mmsmbmc=cf.fillNull(rs.getString("mmsmbmc"));
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

<form method="post" action="SaveEditJdm_mmsmbbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">锁面板编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="mmsmbbm" size="20" maxlength="2"  value="<%=mmsmbbm%>" >
  </td>
  <td width="15%"> 
    <div align="right">锁面板名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="mmsmbmc" size="20" maxlength="50"  value="<%=mmsmbmc%>" >
  </td>
</tr>
<input type="hidden" name="wheremmsmbbm"  value="<%=wheremmsmbbm%>" >
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
	if(	javaTrim(FormName.mmsmbbm)=="") {
		alert("请输入[锁面板编码]！");
		FormName.mmsmbbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
