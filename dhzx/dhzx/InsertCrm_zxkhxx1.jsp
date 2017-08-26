<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<html>
<head>
<title>咨询客户--登记</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css">
</head>
<body>
<div class="container" style="padding-top:25px;">
<div class="row">
<div class="col-sm-12">
<div class="panel panel-primary">
	<div class="panel-heading"><h5>装修咨询管理 -> 咨询登记 -> 咨询客户登记－选择店面</h5></div>
	<div class="panel-body">
<%
String ssfgs=request.getParameter("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
%>
<form method="post" action="" name="selectform">
<%
Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
String sql=null;
try {
	conn=cf.getConnection();   //得到连接

	if (kfgssq.equals("1") || kfgssq.equals("2"))//1：授权单个分公司；2：授权多个分公司
	{
		%>
		<div class="radio">
    		<label for="nostorefront">
    		<INPUT type="radio" name="dwbh" value="" id="nostorefront" onclick="f_do(selectform)"/>  
    		不选择任何店面</label>
		</div>
		<%
		String dwbh=null;
		String dwmc=null;
		sql="select dwbh,dwmc";
		sql+=" from sq_dwxx";
		sql+=" where dwlx='F2' and cxbz='N' and ssfgs='"+ssfgs+"'";
		sql+=" order by dwbh";
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while (rs.next())
		{
			dwbh=rs.getString("dwbh");
			dwmc=rs.getString("dwmc");

			%>
			<div class="radio">
    			<label for="<%=dwbh%>">
    			<INPUT type="radio" name="dwbh" value="<%=dwbh%>" id="<%=dwbh%>" onclick="f_do(selectform)"/>  <%=dwmc%></label>
			</div>
			<%
		}
		rs.close();
		ps.close();
	}
	else if (kfgssq.equals("4") || kfgssq.equals("5"))//4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		String dwbh=null;
		String dwmc=null;
		sql="select dwbh,dwmc";
		sql+=" from sq_dwxx";
		sql+=" where dwlx='F2' and ssfgs='"+ssfgs+"'";
		sql+=" and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		sql+=" order by dwbh";
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while (rs.next())
		{
			dwbh=rs.getString("dwbh");
			dwmc=rs.getString("dwmc");

			%>
			<div class="radio">
    			<label for="<%=dwbh%>">
    			<INPUT type="radio" name="dwbh" value="<%=dwbh%>" id="<%=dwbh%>" onclick="f_do(selectform)"/>  <%=dwmc%></label>
			</div>
			<%
		}
		rs.close();
		ps.close();
	}
	else if (kfgssq.equals("3"))//3：授权单个店面
	{
		String dwbh=null;
		sql="select dwbh";
		sql+=" from sq_sqbm";
		sql+=" where ygbh='"+ygbh+"'";
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			dwbh=rs.getString("dwbh");
		}
		rs.close();
		ps.close();

		response.sendRedirect("InsertCrm_zxkhxx2.jsp?ssfgs="+ssfgs+"&dwbh="+dwbh);
	}


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
</div>
</div>
</div>
</div>
</div>
</body>
</html>

<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	FormName.action="InsertCrm_zxkhxx2.jsp?ssfgs=<%=ssfgs%>";

	FormName.submit();
	return true;
}
//-->
</SCRIPT>

