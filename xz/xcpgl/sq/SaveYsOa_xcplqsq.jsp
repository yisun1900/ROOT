<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String yjspr=null;
java.sql.Date yjspsj=null;
String yjspjl=null;
String yjspsm=null;

yjspr=cf.GB2Uni(request.getParameter("yjspr"));
ls=request.getParameter("yjspsj");
try{
	if (!(ls.equals("")))  yjspsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yjspsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
yjspjl=cf.GB2Uni(request.getParameter("yjspjl"));
yjspsm=cf.GB2Uni(request.getParameter("yjspsm"));

String sqxh=cf.GB2Uni(request.getParameter("sqxh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String lqzt=null;
	String ejspjl=null;
	ls_sql=" SELECT lqzt,ejspjl";
	ls_sql+=" FROM oa_xcplqsq ";
    ls_sql+=" where sqxh="+sqxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lqzt=cf.fillNull(rs.getString("lqzt"));
		ejspjl=cf.fillNull(rs.getString("ejspjl"));
	}
	rs.close();
	ps.close();

	if ( lqzt.equals("2") || (  lqzt.equals("4") && ejspjl.equals("2")  ) )//1��δ��ɣ�2��������룻3��һ��������4������������5������������6������ȡ
	{
	}
	else{
		out.println("��������״̬����ȷ");
		return;
	}


	ls_sql="update oa_xcplqsq set lqzt='3',yjspr=?,yjspsj=?,yjspjl=?,yjspsm=? ";
    ls_sql+=" where sqxh="+sqxh+" and ( lqzt='2' OR (oa_xcplqsq.lqzt='4' and oa_xcplqsq.ejspjl='2') )";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,yjspr);
	ps.setDate(2,yjspsj);
	ps.setString(3,yjspjl);
	ps.setString(4,yjspsm);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("���̳ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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