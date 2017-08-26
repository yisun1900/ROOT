<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>材料配送单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<div align="center">
 

<form method="post" action="" name="selectform">

    <table width="37%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="2">
      <tr bgcolor="#FFFFCC">
        <td width="59%" height="25" >
          <div align="center">材料配送单</div>
        </td>
      </tr>

<%
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
if (yhjs.equals("A0") || yhjs.equals("A1"))
{
}
else{
	response.sendRedirect("SelectCxCrm_khxx.jsp?ssfgs="+ssfgs);
}

Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
String sql=null;
try {
	conn=cf.getConnection();   //得到连接

	String dwbh=null;
	String dwmc=null;
	sql="select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh";
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		dwbh=rs.getString("dwbh");
		dwmc=rs.getString("dwmc");

		%> 
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="ssfgs" value="<%=dwbh%>" onclick="f_do(selectform)">
          <%=dwmc%> </td>
      </tr>
      <%
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}

%> 
    </table>

</form>
</div>

</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	FormName.action="SelectCxCrm_khxx.jsp";

	FormName.submit();
	return true;
}
//-->
</SCRIPT>

