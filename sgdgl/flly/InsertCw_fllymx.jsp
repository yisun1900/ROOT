<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>批量录入明细</title>
</head>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

String bgcolor="";

int row=0;

String jlh=cf.GB2Uni(request.getParameter("jlh"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));


try {
	conn=cf.getConnection();



%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">批量录入明细(记录号:<%=jlh%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="" target="_blank">
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px' >
<tr bgcolor="#FFFFFF"> 
	<td colspan="14" > 
		<input type=button value=' 存 盘 ' onClick="f_do(listform)" >
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" value=' 重 输 ' name="reset" >
	</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">辅料编码</td>
	<td  width="25%">辅料名称</td>
	<td  width="6%">计量单位</td>
	<td  width="6%">单价</td>
	<td  width="6%">数量</td>
	<td  width="6%">类型</td>
</tr>
<%
	String flbm=null;
	String flmc=null;
	String jldw=null;
	String lx=null;
	double dj=0;


	ls_sql="SELECT flbm,flmc,jldw,dj,DECODE(lx,'1','公司辅料','2','配送辅料') lx";
	ls_sql+=" FROM cw_flbm";
    ls_sql+=" where ssfgs='"+ssfgs+"'";
    ls_sql+=" order by flbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		flbm=cf.fillNull(rs.getString("flbm"));
		flmc=cf.fillHtml(rs.getString("flmc"));
		lx=cf.fillHtml(rs.getString("lx"));
		jldw=cf.fillHtml(rs.getString("jldw"));
		dj=rs.getDouble("dj");

		row++;

		double sl=0;
		String slstr=null;
		double je=0;
		ls_sql="SELECT sl,je";
		ls_sql+=" FROM cw_fllymx  ";
		ls_sql+=" where jlh='"+jlh+"' and flbm='"+flbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sl=rs1.getDouble("sl");
			je=rs1.getDouble("je");
		}
		rs1.close();
		ps1.close();

		if (sl==0)
		{
			slstr="";
		}
		else{
			slstr=""+sl;
		}

		if (row%2==0)
		{
			bgcolor="E8E8FF";
		}
		else{
			bgcolor="FFFFFF";
		}

		if (!slstr.equals(""))
		{
			bgcolor="#FFFF99";
		}

		%>
		<tr bgcolor="<%=bgcolor%>" align="center">
		<td><%=flbm%>
			<input type="hidden" name="flbm" value="<%=flbm%>">
		</td>
		<td><%=flmc%></td>
		<td><%=dj%></td>
		<td><%=jldw%></td>
		<td>
			<input type="text" name="sl" value="<%=slstr%>" size="8" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
		</td>
		<td><%=lx%></td>
		<%	
	}
	rs.close();
	ps.close();





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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<tr bgcolor="#FFFFFF"> 
	<td colspan="14" > 
		<input type="hidden" name="jlh" value="<%=jlh%>">
		<input type="hidden" name="ssfgs" value="<%=ssfgs%>">
		<input type=button value=' 存 盘 ' onClick="f_do(listform)" name="sl">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" value=' 重 输 ' name="reset" >
	</td>
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
	if (<%=row%><=1)
	{
		if(!(isFloat(FormName.sl, "数量"))) {
			return false;
		}

		if (parseFloat(FormName.sl.value)<=0)
		{
			alert("【数量】必须大于零！！！");
			FormName.sl.select();
			return false;
		}
	}
	else//如果只有一条记录不能通过数组的形式访问
	{
		for (i=0;i<<%=row%> ;i++ )
		{
			if(!(isFloat(FormName.sl[i], "数量"))) {
				return false;
			}

			if (parseFloat(FormName.sl[i].value)<=0)
			{
				alert("【数量】必须大于零！！！");
				FormName.sl[i].select();
				return false;
			}
		}
	}

	FormName.action="SaveInsertCw_fllymx.jsp";
	FormName.submit();
	return true;
} 

//-->
</script>

