<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%//weblogic@ page session=true%>

<%

String yhzbh=null;
String yhzmc=null;
String yhzms=null;
String whereyhzbh=null;
whereyhzbh=request.getParameter("yhzbh");
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select yhzbh,yhzmc,yhzms ";
	ls_sql+=" from  sq_yhz";
	ls_sql+=" where  (yhzbh='"+whereyhzbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		yhzbh=cf.fillNull(rs.getString("yhzbh"));
		yhzmc=cf.fillNull(rs.getString("yhzmc"));
		yhzms=cf.fillNull(rs.getString("yhzms"));
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
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="98%">
  <tr>
    <td width="1%">&nbsp;</td>
    <td width="98%"> 
      <div align="center"> 查看信息</div>
    </td>
    <td width="1%">&nbsp;</td>
  </tr>
  <tr>
    <td width="1%" height="48">&nbsp;</td>
    <td width="98%" height="48"> 
      <div align="center">

        <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right">用户组编号</div>
            </td>
            <td width="35%"> <%=yhzbh%> </td>
            <td width="15%"> 
              <div align="right">用户组名称</div>
            </td>
            <td width="35%"> <%=yhzmc%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" height="17"> 
              <div align="right">用户组描述</div>
            </td>
            <td colspan="3" height="17">  
              <%=yhzms%>
            </td>
          </tr>
          <input type="hidden" name="whereyhzbh"  value="<%=yhzbh%>" >
        </table>

	  
	  </div>
    </td>
    <td width="1%" height="48">&nbsp;</td>
  </tr>
  <tr>
    <td width="1%">&nbsp;</td>
    <td width="98%">&nbsp;</td>
    <td width="1%">&nbsp;</td>
  </tr>
</table>
</body>
</html>
