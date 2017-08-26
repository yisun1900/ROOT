<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
</head>
<%
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String bg1="E8E8FF";
String bg2="FFFFFF";
int i=0;
int row=0;
String wheresgph=request.getParameter("sgph");
String dwbh=request.getParameter("dwbh");
String clbm=null;
String clmc=null;
String clgg=null;
String fgsdj=null;
String sgsl=null;
String shsl=null;
String jldwmc=null;
String cldlmc=null;
if (wheresgph.equals(""))
{
	return;
}
try {
	conn=cf.getConnection();
	ls_sql="SELECT sgph,cl_clsgmx.clbm clbm,cl_clsgmx.clmc,cl_clsgmx.clgg,sgsl,shsl,jldwmc,cl_clsgmx.cldlmc ";
	ls_sql+=" FROM cl_clsgmx,cl_clbm ";
	ls_sql+=" where  sgph='"+wheresgph+"' ";
	ls_sql+=" and cl_clsgmx.clbm=cl_clbm.clbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">修改申购单明细(申购批号:<%=wheresgph%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="">
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 15px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">序号</td>
	<td  width="14%">材料名称</td>
	<td  width="14%">材料规格</td>
	<td  width="14%">材料大类</td>
	<td  width="15%">申购数量</td>
	<td  width="15%">审核数量</td>
	<td  width="15%">计量单位</td>
</tr>
<%
	while (rs.next())
	{
		i++;
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		clgg=cf.fillNull(rs.getString("clgg"));
		sgsl=cf.fillNull(rs.getString("sgsl"));
		shsl=cf.fillNull(rs.getString("shsl"));
		jldwmc=cf.fillNull(rs.getString("jldwmc"));
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
%>
		<tr bgcolor="<%if (i%2==0){out.print(bg1);}else {out.print(bg2);}%>">
		<td> 
			<div align="center"><%=i%>&nbsp;
			<input type="hidden" name="clbm" value="<%=clbm%>">
			</div>
		</td>
		<td> 
			<div align="center"><%=clmc%>&nbsp;<input type="hidden" name="clmc" value="<%=clmc%>"></div>
		</td>
		<td> 
			<div align="center"><%=clgg%>&nbsp;</div>
		</td>
		<td> 
			<div align="center"><%=cldlmc%>&nbsp;</div>
		</td>
		<td> 
			<div align="center"><%=sgsl%>&nbsp;</div>
		</td>
		<td> 
			<div align="center"><%=shsl%>&nbsp;</div>
		</td>
		<td> 
			<div align="center"><%=jldwmc%>&nbsp;</div>
		</td>
		</tr>
<%
	row++;
	}
	rs.close();
	ps.close();
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
</table>
</form>
</body>

</html>


