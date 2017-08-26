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
String wzclolr1="red";
String wzclolr2="blue";
String wzclolr3="black";
int i=0;
int row=0;
String whereckph=request.getParameter("ckph");
String clbm=null;
String clmc=null;
String clgg=null;
String gdj=null;
double cksl=0;
double ckje=0;
double allcksl=0;
double allckje=0;
String cldlmc=null;
if (whereckph.equals(""))
{
	return;
}
try {
	conn=cf.getConnection();
	ls_sql="SELECT cl_ckmx.clbm clbm,ckph,cl_ckmx.clmc,cl_ckmx.clgg,cl_ckmx.gdj,cksl,ckje,cldlmc  ";
	ls_sql+=" FROM cl_ckmx ";
	ls_sql+=" where ckph='"+whereckph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
//	out.print(ls_sql);
%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查看出库单明细(出库批号:<%=whereckph%>)</font></B>
</CENTER>
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 15px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">序号</td>
	<td  width="15%">材料名称</td>
	<td  width="15%">材料规格</td>
	<td  width="15%">材料大类</td>
	<td  width="10%">出库单价</td>
	<td  width="10%">出库数量</td>
	<td  width="15%">出库金额</td>
</tr>
<%
	while (rs.next())
	{
		i++;
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		clgg=cf.fillNull(rs.getString("clgg"));
		gdj=cf.fillNull(rs.getString("gdj"));
		cksl=rs.getDouble("cksl");
		ckje=rs.getDouble("ckje");
		cldlmc=cf.fillNull(rs.getString("cldlmc"));

		allcksl+=cksl;
		allckje+=ckje;
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
			<div align="center"><%=gdj%>&nbsp;</div>
		</td>
		<td> <div align="center"><%=cksl%>&nbsp;</div></td>
		<td> <div align="center"><%=ckje%>&nbsp;</div></td>
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
		<tr <div align="center">
		<td colspan="3">合 计</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=cf.formatDouble(allcksl)%>&nbsp;</div></td>
		<td><%=cf.formatDouble(allckje)%></div></td>
		</tr>
</table>
</body>

</html>

