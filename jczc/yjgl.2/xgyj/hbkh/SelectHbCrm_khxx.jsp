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
          <div align="center">客户合并</div>
        </td>
      </tr>

      <%

//检查是否做期末结转
//返回： -1:出错;0:已全部结转；1:只是最近一月未结转;2:至少最近两月未结转
int count=cf.checkYjQmjz("cw_qmjz");

if (count==1)
{
	out.println("错误！最近一月未结转！");
	return;
}
else if (count==2)
{
	out.println("至少最近两月未结转！");
	return;
}
else if (count==-1)
{
	out.println("出错！");
	return;
}

String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
if (yhjs.equals("A0") || yhjs.equals("A1"))
{
}
else{
	response.sendRedirect("ChooseHbKh.jsp?ssfgs="+ssfgs);
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
	FormName.action="ChooseHbKh.jsp";

	FormName.submit();
	return true;
}
//-->
</SCRIPT>

