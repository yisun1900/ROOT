<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�鿴�ͻ��绰</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<%
String scbkhbh=request.getParameter("scbkhbh");
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");
String ip=request.getRemoteHost();
String khdhbz=(String)session.getAttribute("khdhbz");
if (khdhbz==null)
{
	khdhbz="N";
}
if (!khdhbz.equals("Y"))
{
	out.println("��������Ȩ�鿴�绰");
	return;
}

Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
String sql=null;

String lxfs=null;
try {
	conn=cf.getConnection();   //�õ�����

	sql="select lxfs";
	sql+=" from crm_scbkhxx";
	sql+=" where scbkhbh='"+scbkhbh+"'";
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		lxfs=cf.fillHtml(rs.getString("lxfs"));
	}
	rs.close();
	ps.close();

	sql="insert into sq_ckdhrz ( ip,yhdlm,yhmc,cksj,khbh,lx ) ";
	sql+=" values ( ?,?,?,SYSDATE,?,'1') ";//1���г�����2����ѯ��3��ǩ��
	ps= conn.prepareStatement(sql);
	ps.setString(1,ip);
	ps.setString(2,cf.GB2Uni(yhdlm));
	ps.setString(3,yhmc);
	ps.setString(4,scbkhbh);
	ps.executeUpdate();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("sql: " + sql);
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
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>
<div align="center">���г����ͻ���ţ�<%=scbkhbh%>��<P>��ϵ��ʽ��<%=lxfs%></div>


</body>
</html>
