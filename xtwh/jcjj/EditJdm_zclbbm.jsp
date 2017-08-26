<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zclbbm=null;
String zclbmc=null;
String ppbm=null;
String wherezclbbm=cf.GB2Uni(request.getParameter("zclbbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zclbbm,zclbmc,ppbm ";
	ls_sql+=" from  jdm_zclbbm";
	ls_sql+=" where  (zclbbm='"+wherezclbbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zclbbm=cf.fillNull(rs.getString("zclbbm"));
		zclbmc=cf.fillNull(rs.getString("zclbmc"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
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

<form method="post" action="SaveEditJdm_zclbbm.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">品牌名称</div>
              </td>
              <td width="35%"> 
                <select name="ppbm" style="FONT-SIZE:12PX;WIDTH:152PX" onchange="getItemValue(ppbm,zclbbm)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ppbm,ppmc from jdm_ppbm order by ppbm",ppbm);
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">类别系列编码</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zclbbm" size="20" maxlength="4"  value="<%=zclbbm%>" >
              </td>
              <td width="15%"> 
                <div align="right">类别系列名称</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zclbmc" size="20" maxlength="50"  value="<%=zclbmc%>" >
              </td>
            </tr>
            <input type="hidden" name="wherezclbbm"  value="<%=wherezclbbm%>" >
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
	if(	javaTrim(FormName.zclbbm)=="") {
		alert("请输入[类别系列编码]！");
		FormName.zclbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zclbmc)=="") {
		alert("请输入[类别系列名称]！");
		FormName.zclbmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ppbm)=="") {
		alert("请选择[品牌名称]！");
		FormName.ppbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
