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
  <B><font size="3">�ͻ�����ȯ(�ͻ���ţ�<%=khbh%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="" target="_blank">
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="15%">����ȯ���ͷ�ʽ</td>
	<td  width="15%">���ͻ���</td>
	<td  width="15%">���Ͱٷֱ�</td>
	<td  width="15%">���ͽ��</td>
</tr>
<%
try {
	conn=cf.getConnection();

	String djjzsfs=null;
	String zsjs=null;

	double khfqje=0;
	double khfqbfb=0;

	ls_sql="SELECT khfqje,khfqbfb,DECODE(djjzsfs,'1','�̶����','2','�ٷֱ�') djjzsfs,DECODE(zsjs,'1','��ǰ��ͬ��','2','�ۺ��ͬ��','3','��ǰ���̷�','4','�ۺ󹤳̷�','5','������') zsjs";
	ls_sql+=" FROM crm_khdjj  ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khfqje=rs.getDouble("khfqje");
		khfqbfb=rs.getDouble("khfqbfb");
		djjzsfs=cf.fillNull(rs.getString("djjzsfs"));
		zsjs=cf.fillNull(rs.getString("zsjs"));


		%>
		<tr align="center">
			<td><%=djjzsfs%></td>
			<td><%=zsjs%></td>
			<td><%=khfqbfb%>%</td>
			<td><%=khfqje%></td>
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
