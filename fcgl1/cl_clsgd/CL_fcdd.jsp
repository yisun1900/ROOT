<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>辅材订单</title>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 26px;
	font-family: "楷体_GB2312";
}
.STYLE2 {
	font-family: "楷体_GB2312";
	font-size: 20px;
}
.STYLE3 {
	font-family: "楷体_GB2312";
	font-weight: bold;
	font-size: 20px;
}
.STYLE4 {
	font-family: "楷体_GB2312";
	font-size: 16px;
}

-->
</style>
</head>
<%
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String sgph=request.getParameter("sgph");

String dwbh=null;
String dwmc=null;
String lrsj=null;
String bz=null;
int row=1;

String clmc=null;
String clgg=null;
String cldlmc=null;
String jldwmc=null;
double shsl=0;

try {
	conn=cf.getConnection();

	ls_sql="SELECT cl_clsgd.dwbh,dwmc,cl_clsgd.lrsj lrsj,cl_clsgd.bz bz";
	ls_sql+=" FROM cl_clsgd,sq_dwxx ";
	ls_sql+=" where cl_clsgd.dwbh=sq_dwxx.dwbh and sgph='"+sgph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillHtml(rs.getString("bz"));
	}
	rs.close();
	ps.close();
%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<p align="center"><span class="STYLE1"><strong>松下亿达有限公司 </strong><br />
<strong>辅材订单 </strong></span></p>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#000000" cellpadding="0" cellspacing="0">
  <tr>
    <td>
		<table  width="100%" border="0" style="FONT-SIZE:12" bgcolor="#FFFFFF" cellpadding="1" cellspacing="5">
		  <tr width="100%">
			<td width="20%"><div align="left" class="STYLE2">分公司名称：</div></td>
			<td width="80%"><span class="STYLE2"><%=dwmc%></span></td>
		  </tr>
		  <tr>
			<td width="20%"><div align="left" class="STYLE2">订货日期：</div></td>
			<td width="80%"><span class="STYLE2"><%=lrsj%></span></td>
		  </tr>
	  </table>	</td>
  </tr>
  <tr>
    <td>
		<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#FFFFFF" cellpadding="1" cellspacing="1">
		  <tr>
			<td width="20%" class="STYLE2"><div align="left">订货明细：</div></td>
			<td width="80%">&nbsp;</td>
		  </tr>
		  <tr>
			<td>&nbsp;</td>
		  </tr>
		  <tr>
			<td>&nbsp;</td>
		  </tr>
		  <tr>
			<td>&nbsp;</td>
		  </tr>
		  <tr>
			<td>&nbsp;</td>
		  </tr>

		  <tr>
			<td colspan="2">
				<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#FFFFFF" cellpadding="1" cellspacing="1">
				  <%
					ls_sql="SELECT clmc,clgg,cldlmc,jldwmc,shsl ";
					ls_sql+=" FROM cl_clsgmx ";
					ls_sql+=" where  sgph='"+sgph+"'";
					ps= conn.prepareStatement(ls_sql);
					rs =ps.executeQuery();
					while (rs.next())
					{
						clmc=cf.fillNull(rs.getString("clmc"));
						clgg=cf.fillNull(rs.getString("clgg"));
						cldlmc=cf.fillNull(rs.getString("cldlmc"));
						jldwmc=cf.fillNull(rs.getString("jldwmc"));
						shsl=rs.getDouble("shsl");
				%> 
			  <tr>
				<td class="STYLE4"><%=row%></td>
				<td class="STYLE4"><%=clmc%></td>
				<td class="STYLE4"><%=clgg%></td>
				<td class="STYLE4"><%=cldlmc%></td>
				<td class="STYLE4"><%=shsl%></td>
				<td class="STYLE4"><%=jldwmc%></td>

			  </tr>

			   <%
						row++;
					}
					rs.close();
					ps.close();
				%>
				</table>	
			</td>
		  </tr>
		  <tr>
			<td>&nbsp;</td>
		  </tr>
		  <tr>
			<td>&nbsp;</td>
		  </tr>
		  <tr>
			<td>&nbsp;</td>
		  </tr>
		  <tr>
			<td>&nbsp;</td>
		  </tr>

		</table>	
	</td>
  </tr>
  <tr>
    <td><table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#FFFFFF" cellpadding="1" cellspacing="1">
      <tr>
        <td width="8%" height="51" class="STYLE2"><div align="left">备注：</div></td>
        <td width="92%" class="STYLE4"><%=bz%></td>
      </tr>
      
    </table></td>
  </tr>
  <tr>
    <td height="76"><table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#FFFFFF" cellpadding="1" cellspacing="1">
      <tr>
        <td width="31%" height="120" class="STYLE2"><div align="left">集团辅材管理中心审批：</div></td>
        </tr>
    </table></td>
  </tr>
</table>
<p align="right"><span class="STYLE1"><strong>集团辅材管理中心</strong></span> </p>
<p align="center">&nbsp;</p>
</body>
</html>
  <%
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
