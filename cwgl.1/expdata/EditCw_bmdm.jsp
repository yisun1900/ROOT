<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<%

String bmdm=null;
String bmbh=null;
String dwbh=null;
String wherebmdm=cf.GB2Uni(request.getParameter("bmdm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select bmdm,bmbh,dwbh ";
	ls_sql+=" from  cw_bmdm";
	ls_sql+=" where  (bmdm='"+wherebmdm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bmdm=cf.fillNull(rs.getString("bmdm"));
		bmbh=cf.fillNull(rs.getString("bmbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
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

<form method="post" action="SaveEditCw_bmdm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">部门代码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="bmdm" size="20" maxlength="8"  value="<%=bmdm%>" >
  </td>
  <td width="15%"> 
    <div align="right">单位名称</div>
  </td>
  <td width="35%"> 
    <select name="bmbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('F1','F2') and ssdw='"+ssfgs+"' order by dwbh",bmbh);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">使用单位</div>
  </td>
  <td width="35%"> 
    <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx order by dwbh",dwbh);
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">&nbsp;</div>
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wherebmdm"  value="<%=wherebmdm%>" >
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
	if(	javaTrim(FormName.bmdm)=="") {
		alert("请输入[部门代码]！");
		FormName.bmdm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
