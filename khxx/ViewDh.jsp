<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>查看客户电话</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%
String khbh=request.getParameter("khbh");
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
	out.println("错误！您无权查看电话");
	return;
}

Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
String sql=null;

String lxfs=null;
String qtdh=null;
String email=null;
try {
	conn=cf.getConnection();   //得到连接

	sql="select lxfs,qtdh,email";
	sql+=" from crm_khxx";
	sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		qtdh=cf.fillHtml(rs.getString("qtdh"));
		email=cf.fillHtml(rs.getString("email"));
	}
	rs.close();
	ps.close();

	sql="insert into sq_ckdhrz ( ip,yhdlm,yhmc,cksj,khbh,lx ) ";
	sql+=" values ( ?,?,?,SYSDATE,?,'3') ";
	ps= conn.prepareStatement(sql);
	ps.setString(1,ip);
	ps.setString(2,cf.GB2Uni(yhdlm));
	ps.setString(3,yhmc);
	ps.setString(4,khbh);
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
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>
<div align="center">（客户编号：<%=khbh%>）<P>手机：<%=lxfs%><P>其它电话：<%=qtdh%><P>E-Mail：<%=email%> </div>


</body>
</html>
