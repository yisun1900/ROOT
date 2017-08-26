<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
-->
</style>
</head>
<%
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String bgcolor=null;

int row=0;

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String fgsbh=null;
String khxm=null;

String clbm=null;
String clmc=null;
String clgg=null;
String fgsdj=null;
double sl=0;
String slstr=null;
double gdj=0;
String cldlmc=null;
String jldwmc=null;
String bz=null;

try {
	conn=cf.getConnection();

	ls_sql="SELECT fgsbh,khxm";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=rs.getString("fgsbh");
		khxm=rs.getString("khxm");
	}
	rs.close();
	ps.close();

	int clbmsl=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM cl_clbm,cl_jgmx  ";
    ls_sql+=" where cl_clbm.clbm=cl_jgmx.clbm(+) ";
	ls_sql+=" and cl_jgmx.dwbh='"+fgsbh+"' and cl_clbm.lx='1' ";
	ls_sql+=" order by  cl_clbm.paixu,cl_clbm.clbm ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clbmsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	double[] allsl=new double[clbmsl];
	for (int i=0;i<clbmsl ;i++ )
	{
		allsl[i]=0;
	}
%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">录入－材料使用数量(姓名:<%=khxm%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="" target="_blank">

<table border="1" cellspacing="0" cellpadding="1" width="<%=(30+30+240+clbmsl*80)%>px" style='FONT-SIZE: 13px' >
<tr bgcolor="#FFFFFF"> 
      <td colspan="11" > 
	  <input type=button value=' 存 盘 ' onClick="f_do(listform)">
      </td>
    </tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td width="30px">序号</td>
	<td width="40px">&nbsp</td>
	<td width="240px">材料用处名称</td>
<%
	ls_sql="SELECT cl_clbm.clbm,clmc,gdj,jldwmc";
	ls_sql+=" FROM cl_clbm,cl_jgmx  ";
    ls_sql+=" where cl_clbm.clbm=cl_jgmx.clbm(+) ";
	ls_sql+=" and cl_jgmx.dwbh='"+fgsbh+"' and cl_clbm.lx='1' ";
	ls_sql+=" order by  cl_clbm.paixu,cl_clbm.clbm ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		gdj=rs.getDouble("gdj");
		jldwmc=cf.fillNull(rs.getString("jldwmc"));

		%>
			<td  width="80px"><%=clmc%><BR>（<%=gdj%>/<%=jldwmc%>）
				<input type="hidden" name="clbm" value="<%=clbm%>" >
			</td>
		<%
	}
	rs.close();
	ps.close();
%>
</tr>



<%
	String clycmc=null;
	ls_sql="SELECT clycmc";
	ls_sql+=" FROM cl_clycmc";
    ls_sql+=" where khbh='"+khbh+"' ";
	ls_sql+=" order by xh";
	ps2= conn.prepareStatement(ls_sql);
	rs2=ps2.executeQuery();
	while (rs2.next())
	{
		clycmc=cf.fillNull(rs2.getString("clycmc"));

		row++;

		if (row%2==1)
		{
			bgcolor="E8E8FF";
		}
		else{
			bgcolor="FFFFFF";
		}


		%>
		<tr bgcolor="<%=bgcolor%>" align="center">
			<td><%=row%></td>
			<td><A HREF="DeleteCl_clsymx.jsp?khbh=<%=khbh%>&clycmc=<%=clycmc%>">删除</A></td>
			<td>
				<input type="text" name="clycmc<%=row%>" value="<%=clycmc%>" size="30" maxlength="50" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			</td>
		<%

		int xh=0;
		ls_sql="SELECT cl_clbm.clbm";
		ls_sql+=" FROM cl_clbm,cl_jgmx  ";
		ls_sql+=" where cl_clbm.clbm=cl_jgmx.clbm(+) ";
		ls_sql+=" and cl_jgmx.dwbh='"+fgsbh+"' and cl_clbm.lx='1' ";
		ls_sql+=" order by  cl_clbm.paixu,cl_clbm.clbm ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			clbm=cf.fillNull(rs.getString("clbm"));


			sl=0;
			ls_sql="SELECT sl";
			ls_sql+=" FROM cl_clsymx";
			ls_sql+=" where khbh='"+khbh+"' and clycmc='"+clycmc+"' and clbm='"+clbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				sl=rs1.getDouble("sl");
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

			allsl[xh]+=sl;
			xh++;

			%>
			<td>
				<input type="text" name="clycmc<%=row%>" value="<%=slstr%>" size="6" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			</td>
			<%	
		}
		rs.close();
		ps.close();

		%>
		</tr>
		<%
	}
	rs2.close();
	ps2.close();

	%>
	<tr bgcolor="<%=bgcolor%>" align="center">
		<td colspan="3" height="28" ><span class="STYLE1">合 计</span></td>
		<%
		for (int i=0;i<clbmsl ;i++ )
		{
			%>
			<td><span class="STYLE1"><%=cf.formatDouble(allsl[i])%></span></td>
			<%
		}
		%>
	</tr>
	<%

	
	//不足50个加空行
	for (int i=row;i<50 ;i++ )
	{
		row++;

		if (row%2==1)
		{
			bgcolor="E8E8FF";
		}
		else{
			bgcolor="FFFFFF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>" align="center">
			<td><%=row%></td>
			<td>&nbsp;</td>
			<td>
				<input type="text" name="clycmc<%=row%>" value="" size="30" maxlength="50" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			</td>
		<%
			ls_sql="SELECT cl_clbm.clbm";
			ls_sql+=" FROM cl_clbm,cl_jgmx  ";
			ls_sql+=" where cl_clbm.clbm=cl_jgmx.clbm(+) ";
			ls_sql+=" and cl_jgmx.dwbh='"+fgsbh+"' and cl_clbm.lx='1' ";
			ls_sql+=" order by  cl_clbm.paixu,cl_clbm.clbm ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				clbm=cf.fillNull(rs.getString("clbm"));

				%>
					<td>
						<input type="text" name="clycmc<%=row%>" value="" size="6" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
					</td>
				<%
			}
			rs.close();
			ps.close();
		%>
		</tr>

		<%
	}


}
catch (Exception e) {
	out.print("发生意外: " + e);
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
      <td colspan="11" > 
	<input type="hidden" name="khbh" value="<%=khbh%>">
	<input type="hidden" name="fgsbh" value="<%=fgsbh%>">
	  <input type=button value=' 存 盘 ' onClick="f_do(listform)">
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
	FormName.action="SaveInsertCl_clsymx.jsp";
	FormName.submit();
	return true;
} 

//-->
</script>

