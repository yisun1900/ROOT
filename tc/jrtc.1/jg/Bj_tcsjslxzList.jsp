<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>套餐升级数量限制－维护</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 16px;'>

<form method="post" action="SaveBj_tcsjslxzList.jsp" name="editform" >
<div align="center">套餐升级数量限制－维护</div>
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center"> 
		<td width="5%">序号</td>
		<td width="10%">分公司编号</td>
		<td width="10%">分公司</td>
		<td width="12%">促销类别数量限制</td>
	</tr>
<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	
	int row=0;
	String bgcolor=null;

	String dwbh=null;
	String dwmc=null;

	if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql="select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh";
	}
	else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql="select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh";
	}
	else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
	{
		ls_sql="select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'";
	}
	else{
		out.println("错误！未进行客户资料授权，请联系系统管理员");
		return;
	}
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));


		int sl=0;
		ls_sql="SELECT sl";
		ls_sql+=" FROM bj_tcsjslxz ";
		ls_sql+=" where fgsbh='"+dwbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();


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
			<td><%=row%></td>
			<td><%=dwbh%>
				<input name="dwbh" type="hidden" value="<%=dwbh%>">
			</td>
			<td><%=dwmc%></td>
			<td>
				<input type="text" name="sl" size="8" value="<%=sl%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sl[<%=row%>])">
			</td>
		</tr>
		<%

	}
	rs.close();
	ps.close();
%>
<tr> 
  <td colspan="8" > 
	<div align="center"> 
	  <input type="button"  value="保存" onClick="f_do(editform)" name="savebutton">
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
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
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

	FormName.submit();
	return true;
}

//-->
</SCRIPT>
