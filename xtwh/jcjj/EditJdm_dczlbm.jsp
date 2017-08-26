<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dczlbm=null;
String dczlmc=null;
String dzhd=null;
String wheredczlbm=cf.GB2Uni(request.getParameter("dczlbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dczlbm,dczlmc,dzhd ";
	ls_sql+=" from  jdm_dczlbm";
	ls_sql+=" where  (dczlbm='"+wheredczlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dczlbm=cf.fillNull(rs.getString("dczlbm"));
		dczlmc=cf.fillNull(rs.getString("dczlmc"));
		dzhd=cf.fillNull(rs.getString("dzhd"));
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

<form method="post" action="SaveEditJdm_dczlbm.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">地材种类编码</div>
              </td>
              <td width="33%"> 
                <input type="text" name="dczlbm" size="20" maxlength="2"  value="<%=dczlbm%>" >
              </td>
              <td width="17%"> 
                <div align="right">地材种类名称</div>
              </td>
              <td width="33%"> 
                <input type="text" name="dczlmc" size="20" maxlength="50"  value="<%=dczlmc%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">地材厚度（mm）</td>
              <td width="33%"> 
                <input type="text" name="dzhd" value="<%=dzhd%>" size="20" maxlength="8" >
              </td>
              <td width="17%">&nbsp;</td>
              <td width="33%">&nbsp;</td>
            </tr>
            <input type="hidden" name="wheredczlbm"  value="<%=wheredczlbm%>" >
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
	if(	javaTrim(FormName.dczlbm)=="") {
		alert("请输入[地材种类编码]！");
		FormName.dczlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dczlmc)=="") {
		alert("请输入[地材种类名称]！");
		FormName.dczlmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dzhd)=="") {
		alert("请输入[地材厚度]！");
		FormName.dzhd.focus();
		return false;
	}
	if(!(isNumber(FormName.dzhd, "地材厚度"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
