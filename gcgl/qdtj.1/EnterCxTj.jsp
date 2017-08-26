<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


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
          <div align="center">签单客户--查询</div>
        </td>
      </tr>

      <%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
String sql=null;
try {
	conn=cf.getConnection();   //得到连接

	if (kfgssq.equals("2") || kfgssq.equals("5"))//2：授权多个分公司；5：授权多个分公司多个店面
	{
		String dwbh=null;
		String dwmc=null;
		sql="select dwbh,dwmc";
		sql+=" from sq_dwxx";
		sql+=" where ( dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"')";
		sql+="      OR dwbh in(select ssfgs from sq_sqbm  where ygbh='"+ygbh+"') )";
		sql+=" order by dwbh";
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while (rs.next())
		{
			dwbh=rs.getString("dwbh");
			dwmc=rs.getString("dwmc");

			%> 
			<tr bgcolor="#FFFFCC"> 
			<td width="59%" height="25" >
				<INPUT type="radio" name="ssfgs" value="<%=dwbh%>" id="<%=dwbh%>" onclick="<%=dwbh%>.disabled=true;f_do('<%=dwbh%>');">
				<label for="<%=dwbh%>"><%=dwmc%></label>  
			</td>
			</tr>
			<%
		}
		rs.close();
		ps.close();
	}
	else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))//1：授权单个分公司；3：授权单个店面；4：授权某一分公司多个店面
	{
		String dwbh=null;
		sql="select dwbh";
		sql+=" from sq_dwxx";
		sql+=" where ( dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"')";
		sql+="      OR dwbh in(select ssfgs from sq_sqbm  where ygbh='"+ygbh+"') )";
		sql+=" order by dwbh";
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			dwbh=rs.getString("dwbh");
		}
		rs.close();
		ps.close();

		response.sendRedirect("SelectJyCrm_khxx.jsp?ssfgs="+dwbh);
	}
	else{
		out.println("错误！未进行客户资料授权，请联系系统管理员");
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

<SCRIPT language=javascript >
<!--
function f_do(ssfgs)//参数FormName:Form的名称
{
	selectform.action="SelectJyCrm_khxx.jsp?ssfgs="+ssfgs;

	selectform.submit();
	return true;
}
//-->
</SCRIPT>

