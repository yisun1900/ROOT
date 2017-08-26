<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<div align="center">
 

<form method="post" action="" name="selectform">

    <table width="37%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="2">
      <tr bgcolor="#FFFFCC">
        <td width="59%" height="25" >
          <div align="center">选择地区</div>
        </td>
      </tr>

      <%
String yhjs=(String)session.getAttribute("yhjs");
String lrdqbm=(String)session.getAttribute("dqbm");
if (yhjs.equals("A0") || yhjs.equals("A1"))
{
}
else{
	response.sendRedirect("InsertJc_mmbjb1.jsp?dqbm="+lrdqbm);
}

Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
String sql=null;
try {
	conn=cf.getConnection();   //得到连接

	String dqbm=null;
	String dqmc=null;
	sql="select dqbm,dqmc from dm_dqbm order by dqbm";
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		dqbm=rs.getString("dqbm");
		dqmc=rs.getString("dqmc");

		%> 
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="dqbm" value="<%=dqbm%>" onclick="f_do(selectform)">
          <%=dqmc%> </td>
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
	FormName.action="InsertJc_mmbjb1.jsp";

	FormName.submit();
	return true;
}
//-->
</SCRIPT>

