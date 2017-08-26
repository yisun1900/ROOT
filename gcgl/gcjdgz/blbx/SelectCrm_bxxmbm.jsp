<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>保修项目</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 16px'>
<form method="post" action="" name="editform" target="_blank">
  <div align="center">保修项目维护</div>
  <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="button"  value="保存" onClick="f_do(editform)" name="savebutton">
          &nbsp;&nbsp;&nbsp;&nbsp; 
          <input type="reset"  value="重输">
        </div>
      </td>
    </tr>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td width="5%">序号</td>
      <td width="40%">保修项目</td>
      <td width="55%">项目说明</td>
    </tr>
    <%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String bgcolor=null;

int row=0;

try {
	conn=cf.getConnection();

	String bxxm=null;
	String xmsm=null;


	ls_sql="SELECT bxxm,xmsm";
	ls_sql+=" FROM crm_bxxmbm";
	ls_sql+=" order by xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bxxm=rs.getString("bxxm");
		xmsm=rs.getString("xmsm");

		row++;

		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%> 
		<tr bgcolor="<%=bgcolor%>"  align="center"> 
		  <td><%=row%> </td>
		  <td> 
			<input type="text" name="bxxm" value="<%=bxxm%>" size="40" maxlength="40" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td> 
			<input type="text" name="xmsm" value="<%=xmsm%>" size="56" maxlength="200" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	for (;row<40 ;row++ )
	{
		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%> 
		<tr bgcolor="<%=bgcolor%>"  align="center"> 
		  <td><%=(row+1)%> </td>
		  <td> 
			<input type="text" name="bxxm" value="" size="40" maxlength="40" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td> 
			<input type="text" name="xmsm" value="" size="56" maxlength="200" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		</tr>
		<%
	}
%> 
    <tr> 
      <td colspan="9" > 
        <div align="center"> 
          <input type="button"  value="保存" onClick="f_do(editform)" name="savebutton">
          &nbsp;&nbsp;&nbsp;&nbsp; 
          <input type="reset"  value="重输">
        </div>
      </td>
    </tr>
  </table>
</form>

</body>
</html>


<%
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


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{

	FormName.action="SaveEditCrm_bxxmbm.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
