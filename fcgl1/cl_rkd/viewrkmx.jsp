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
String whererkph=request.getParameter("rkph");
String dwbh=(String)session.getAttribute("ssfgs");
String clbm=null;
String clmc=null;
String clgg=null;
String fgsdj=null;
String rksl=null;
String rkdj=null;
String rkje=null;
String jldwmc=null;
String cldlmc=null;
if (whererkph.equals(""))
{
	return;
}
try {
	conn=cf.getConnection();
	ls_sql="SELECT cl_rkmx.clbm clbm,cl_rkmx.clmc clmc,cl_rkmx.clgg clgg,jldwmc,rkdj,rksl,rkje,cldlmc ";
	ls_sql+=" FROM cl_rkmx ";
	ls_sql+=" where rkph='"+whererkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">入库单明细(入库批号:<%=whererkph%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="">
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 15px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">序号</td>
	<td  width="14%">材料名称</td>
	<td  width="14%">材料规格</td>
	<td  width="14%">材料大类</td>
	<td  width="15%">入库单价</td>
	<td  width="15%">入库数量</td>
	<td  width="15%">入库金额</td>
</tr>
<%
	while (rs.next())
	{
		i++;
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		clgg=cf.fillNull(rs.getString("clgg"));
		rkdj=cf.fillNull(rs.getString("rkdj"));
		rksl=cf.fillNull(rs.getString("rksl"));
		rkje=cf.fillNull(rs.getString("rkje"));
		jldwmc=cf.fillNull(rs.getString("jldwmc"));
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
%>
		<tr bgcolor="<%if (i%2==0){out.print(bg1);}else {out.print(bg2);}%>">
		<td> 
			<div align="center"><%=i%>&nbsp;
			</div>
		</td>
		<td> 
			<div align="center"><%=clmc%>&nbsp;</div>
		</td>
		<td> 
			<div align="center"><%=clgg%>&nbsp;</div>
		</td>
		<td> 
			<div align="center"><%=cldlmc%>&nbsp;</div>
		</td>
		<td> 
		<div align="center"><%=rkdj%>&nbsp;</div>
		</td>
		<td> 
		<div align="center"><%=rksl%>&nbsp;<%=jldwmc%>&nbsp;</div>
		</td>
		<td> 
		<div align="center"><%=rkje%>&nbsp;</div>
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
