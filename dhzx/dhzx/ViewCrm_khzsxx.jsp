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
	color: #FF0000;
	font-weight: bold;
}
.STYLE3 {color: #0000CC; font-weight: bold; }
-->
</style>
</head>
<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ѡ��������Ŀ������(�μӻ��<%=khbh%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="" target="_blank">
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">����</td>
	<td  width="20%">������Ŀ</td>
	<td  width="6%">������λ</td>
	<td  width="8%">�г�����</td>
	<td  width="6%">������������</td>
	<td  width="6%">������������</td>
	<td  width="8%">��������</td>
	<td  width="33%">��ע</td>
</tr>
<%
double allzsjz=0;

try {
	conn=cf.getConnection();

	String lxmc=null;
	String zsxm=null;
	String jldw=null;
	double cbdj=0;
	double scdj=0;
	String zsslsx=null;
	String zsslxx=null;
	String bz=null;
	String sjsl=null;
	double zsjz=0;

	int row=0;

	ls_sql="SELECT DECODE(lx,'1','��ѡ','2','��ѡ','3','��Ȩ') lxmc,zsxm,jldw,cbdj,scdj,zsslsx,zsslxx,bz,sjsl,zsjz";
	ls_sql+=" FROM crm_khzsxx  ";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by  zsxm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		lxmc=cf.fillNull(rs.getString("lxmc"));
		zsxm=cf.fillNull(rs.getString("zsxm"));
		jldw=cf.fillNull(rs.getString("jldw"));
		cbdj=rs.getDouble("cbdj");
		scdj=rs.getDouble("scdj");
		zsslsx=cf.fillNull(rs.getString("zsslsx"));
		zsslxx=cf.fillNull(rs.getString("zsslxx"));
		bz=cf.fillHtml(rs.getString("bz"));
		sjsl=cf.fillHtml(rs.getString("sjsl"));
		zsjz=rs.getDouble("zsjz");

		allzsjz+=zsjz;

		row++;


		%>
		<tr align="center">
			<td><%=lxmc%></td>
			<td><%=zsxm%>
			</td>
			<td><%=jldw%></td>
			<td><%=scdj%></td>
			<td><%=zsslsx%></td>
			<td><%=zsslxx%></td>
			<td><%=sjsl%></td>
			<td><%=bz%></td>
		</tr>
		<%

	}
	rs.close();
	ps.close();


}
catch (Exception e) {
	out.print("��������: " + e);
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
