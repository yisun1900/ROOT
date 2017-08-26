<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");

String[] khbh=request.getParameterValues("khbh");
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	stmt = conn.createStatement();

	int count=0;
	ls_sql="select count(distinct ssfgs)";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where "+cf.arrayToInSQL(khbh,"khbh");
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	if (count>1)
	{
		out.println("错误！只能同一个公司的客户，才能批量替换");
		return;
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
<title>分配分公司</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

        <form method="post" action="SavePlGhfgs.jsp" name="editform">
		  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC" align="center"> 
              <td height="48" colspan="2"><b><font color="#000066">批量分配分公司</font></b></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="47%" height="108" align="right"><font color="#FF0000">*</font>选择分公司</td>
              <td width="53%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
		<%
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and cxbz='N' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
		%> 
                </select>              </td>
            </tr>
            <tr> 
              <td height="2" colspan="2" align="center"> 
			  <%
			  for (int i=0;i<khbh.length ;i++ )
			  {
				%>
				<input type="hidden" name="khbh"  value="<%=khbh[i]%>" >
				<%
			  }
			  %>
				<input type="button"  value="保存" onClick="f_do(editform)">
			</td>
            </tr>
          </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[分公司]！");
		FormName.ssfgs.focus();
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
