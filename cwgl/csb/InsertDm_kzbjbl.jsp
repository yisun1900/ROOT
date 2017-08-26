<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
</head>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String bgcolor="";

int row=0;

String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String bfcs=cf.GB2Uni(request.getParameter("bfcs"));

String hth=null;
String khxm=null;
String fwdz=null;
String sgdmc=null;
double qye=0;

try {
	conn=cf.getConnection();

	String sfkzbj="";
	ls_sql=" select sfkzbj";
    ls_sql+=" from dm_sgdjscsb";
	ls_sql+=" where fgsbh='"+fgsbh+"' and bfcs='"+bfcs+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfkzbj=cf.fillNull(rs.getString("sfkzbj"));
	}
	rs.close();
	ps.close();
	if (sfkzbj.equals("N"))
	{
		out.println("错误！不需扣质保金");
		return;
	}

%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">扣质保金比例－－设置<font color="#FF0000">（可根据不同的质保金，选择不同的比例）</font></font></B>
</CENTER>


<form method="POST" name="listform" action=""  >
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">质保金起点</td>
	<td  width="7%">质保金终点</td>
	<td  width="11%">扣质保金比例</td>
</tr>
<%
	String zbjqd=null;
	String zbjzd=null;
	double kzbjbl=0;

	ls_sql="SELECT zbjqd,zbjzd,kzbjbl ";
	ls_sql+=" FROM dm_kzbjbl ";
	ls_sql+=" where fgsbh='"+fgsbh+"' and bfcs='"+bfcs+"' ";
    ls_sql+=" order by zbjqd";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zbjqd=rs.getString("zbjqd");
		zbjzd=rs.getString("zbjzd");
		kzbjbl=rs.getDouble("kzbjbl");

		row++;


		if (row%2==0)
		{
			bgcolor="E8E8FF";
		}
		else{
			bgcolor="FFFFFF";
		}


		%>
		<tr bgcolor="<%=bgcolor%>" align="center">
			<td>
				<input type="text" name="zbjqd" value="<%=zbjqd%>" size="12" maxlength="12" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td>
				<input type="text" name="zbjzd" value="<%=zbjzd%>" size="12" maxlength="12" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td>
				<input type="text" name="kzbjbl" value="<%=kzbjbl%>" size="8" maxlength="12" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >%
			</td>
		</tr>

		<%	

	
	}
	rs.close();
	ps.close();

	for (int i=row;i<10 ;i++ )
	{
		%>
		<tr bgcolor="<%=bgcolor%>" align="center">
			<td>
				<input type="text" name="zbjqd" value="" size="12" maxlength="12" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td>
				<input type="text" name="zbjzd" value="" size="12" maxlength="12" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td>
				<input type="text" name="kzbjbl" value="" size="8" maxlength="12" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >%
			</td>
		</tr>

		<%	
	}




}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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
		if (conn != null) cf.close(conn); 
	}
}
%>
<tr bgcolor="#FFFFFF"> 
	<td colspan="14" align="center" > 
		<input type="hidden" name="fgsbh" value="<%=fgsbh%>">
		<input type="hidden" name="bfcs" value="<%=bfcs%>">
		<input type=button value=' 存 盘 ' onClick="f_do(listform)" name="sl">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" value=' 重 输 ' name="reset" >	</td>
</tr>
</table>
</form>
</body>

</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

function f_do(FormName)
{
	FormName.action="SaveInsertDm_kzbjbl.jsp";
	FormName.submit();
	return true;
} 

//-->
</script>

