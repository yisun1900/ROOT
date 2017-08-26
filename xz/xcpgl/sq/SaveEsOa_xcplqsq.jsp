<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ejspr=null;
java.sql.Date ejspsj=null;
String ejspjl=null;
String ejspsm=null;

ejspr=cf.GB2Uni(request.getParameter("ejspr"));
ls=request.getParameter("ejspsj");
try{
	if (!(ls.equals("")))  ejspsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ejspsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
ejspjl=cf.GB2Uni(request.getParameter("ejspjl"));
ejspsm=cf.GB2Uni(request.getParameter("ejspsm"));

String sqxh=cf.GB2Uni(request.getParameter("sqxh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String lqzt=null;
	String yjspjl=null;
	String sjspjl=null;
	ls_sql=" SELECT lqzt,yjspjl,sjspjl";
	ls_sql+=" FROM oa_xcplqsq ";
    ls_sql+=" where sqxh="+sqxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lqzt=cf.fillNull(rs.getString("lqzt"));
		yjspjl=cf.fillNull(rs.getString("yjspjl"));
		sjspjl=cf.fillNull(rs.getString("sjspjl"));
	}
	rs.close();
	ps.close();

	if ( (lqzt.equals("3") && yjspjl.equals("1")) || (lqzt.equals("5") && sjspjl.equals("2")) )//1��δ��ɣ�2��������룻3��һ��������4������������5������������6������ȡ
	{
	}
	else{
		out.println("��������״̬����ȷ");
		return;
	}


	ls_sql="update oa_xcplqsq set lqzt='4',ejspr=?,ejspsj=?,ejspjl=?,ejspsm=? ";
    ls_sql+=" where sqxh="+sqxh+" and ((oa_xcplqsq.lqzt='3' and oa_xcplqsq.yjspjl='1')  OR  (oa_xcplqsq.lqzt='5' and oa_xcplqsq.sjspjl='2') )";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ejspr);
	ps.setDate(2,ejspsj);
	ps.setString(3,ejspjl);
	ps.setString(4,ejspsm);
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