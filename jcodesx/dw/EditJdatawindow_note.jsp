<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="txin.common.CommonFunction"/>

<%

String dw_name=null;
String dw_note=null;
String dw_sql=null;
String dw_fromsql=null;
String dw_wheresql=null;
String dw_ordersql=null;
String dw_pritable=null;
String wheredw_name=request.getParameter("dw_name");
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select dw_name,dw_note,dw_sql,dw_fromsql,dw_wheresql,dw_ordersql,dw_pritable ";
	ls_sql+=" from  jdatawindow_note";
	ls_sql+=" where  (dw_name='"+wheredw_name+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		dw_name=cf.fillNull(rs.getString("dw_name"));
		dw_note=cf.fillNull(rs.getString("dw_note"));
		dw_sql=cf.fillNull(rs.getString("dw_sql"));
		dw_fromsql=cf.fillNull(rs.getString("dw_fromsql"));
		dw_wheresql=cf.fillNull(rs.getString("dw_wheresql"));
		dw_ordersql=cf.fillNull(rs.getString("dw_ordersql"));
		dw_pritable=cf.fillNull(rs.getString("dw_pritable"));
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

<form method="post" action="SaveEditJdatawindow_note.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">DataWindow名称</div>
              </td>
              <td width="33%"> 
                <input type="text" name="dw_name" size="20" maxlength="40"  value="<%=dw_name%>" >
              </td>
              <td width="13%"> 
                <div align="right"><font color="#0000FF">主表</font></div>
              </td>
              <td width="37%"> 
                <input type="text" name="dw_pritable" size="20" readonly="true"  value="<%=dw_pritable%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">DataWindow说明</td>
              <td colspan="3"> 
                <input type="text" name="dw_note" size="60" maxlength="100"  value="<%=dw_note%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000FF">FromSQL</font></td>
              <td colspan="3"> <font color="#0000FF"><%=dw_fromsql%> </font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000FF">WhereSQL</font></td>
              <td colspan="3"> <font color="#0000FF"><%=dw_wheresql%> </font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000FF">OrderSQL</font></td>
              <td colspan="3"> <font color="#0000FF"><%=dw_ordersql%> </font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000FF">DataWindow SQL</font></td>
              <td colspan="3"> <font color="#0000FF"><%=dw_sql%> </font></td>
            </tr>
            <input type="hidden" name="wheredw_name"  value="<%=wheredw_name%>" >
            <tr align="center"> 
              <td colspan="4" height="2"> 
                <input type="button"  value="修改" onClick="submit_onclick(editform)">
                <input type="button"  value="修改数据窗口" onClick="f_xzb(editform)">
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
function submit_onclick(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dw_name)=="") {
		alert("请输入[DataWindow名称]！");
		FormName.dw_name.focus();
		return false;
	}
	FormName.action="SaveEditJdatawindow_note.jsp";
	FormName.submit();
	return true;
}
function f_xzb(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dw_name)=="") {
		alert("请输入[DataWindow名称]！");
		FormName.dw_name.focus();
		return false;
	}
	FormName.action="editChooseTable.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
