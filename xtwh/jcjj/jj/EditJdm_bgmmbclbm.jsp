<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String bgmmbclbm=null;
String bgmmbclmc=null;
String wherebgmmbclbm=cf.GB2Uni(request.getParameter("bgmmbclbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select bgmmbclbm,bgmmbclmc ";
	ls_sql+=" from  jdm_bgmmbclbm";
	ls_sql+=" where  (bgmmbclbm='"+wherebgmmbclbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bgmmbclbm=cf.fillNull(rs.getString("bgmmbclbm"));
		bgmmbclmc=cf.fillNull(rs.getString("bgmmbclmc"));
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

<form method="post" action="SaveEditJdm_bgmmbclbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">壁柜门面板材料编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="bgmmbclbm" size="20" maxlength="2"  value="<%=bgmmbclbm%>" >
  </td>
  <td width="15%"> 
    <div align="right">壁柜门面板材料名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="bgmmbclmc" size="20" maxlength="50"  value="<%=bgmmbclmc%>" >
  </td>
</tr>
<input type="hidden" name="wherebgmmbclbm"  value="<%=wherebgmmbclbm%>" >
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
	if(	javaTrim(FormName.bgmmbclbm)=="") {
		alert("请输入[壁柜门面板材料编码]！");
		FormName.bgmmbclbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bgmmbclmc)=="") {
		alert("请输入[壁柜门面板材料名称]！");
		FormName.bgmmbclmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
