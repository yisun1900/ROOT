<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>后续任务</title>
<style type="text/css">
<!--
.STYLE2 {
	font-size: 24px;
	font-weight: bold;
	font-family: "隶书";
}
-->
</style>
</head>


<%
String rwbm=request.getParameter("rwbm");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String rwmc=null;
try {
	conn=cf.getConnection();

	ls_sql="select rwmc ";
	ls_sql+=" from  gdm_rwbm";
	ls_sql+=" where rwbm='"+rwbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		rwmc=cf.fillNull(rs.getString("rwmc"));
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>


<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<form method="POST" name="listform" action="">
<input type="hidden" name="rwbm" value="<%=rwbm%>" >
<center>
    <span class="STYLE2">后续任务（<%=rwmc%>）</span>
  <table border="1" cellspacing="0" cellpadding="1" width="50%" style='FONT-SIZE: 12px' >
    <tr bgcolor="#FFFFFF"> 
      <td height="34" colspan="3" align="center" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type=button value='存盘' onClick="cf_submit(listform)" name="sl"></td>
    </tr>
    


		<tr align="center"> 
		<td><select name="hxrwbm" style="FONT-SIZE:12PX;WIDTH:523PX" size="37" multiple>
				<option value=""></option>
          <%
	cf.mutilSelectItem(out,"select rwbm,rwxh||'：'||rwmc from gdm_rwbm where rwbm!='"+rwbm+"' order by rwxh","select hxrwbm from gdm_rwljgx where rwbm='"+rwbm+"'");
%>
        </select></td>
		</tr>

  </table>
  </center>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

function cf_submit(formName)
{
	formName.action="SaveInsertGdm_rwljgx.jsp";
	formName.submit();
	return true;
} 
//-->
</script>

