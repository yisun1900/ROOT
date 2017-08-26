<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
double tcjrbl=0;
ls=request.getParameter("tcjrbl");
try{
	if (!(ls.equals("")))  tcjrbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tcjrbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Ʒ��ɼ������]����ת����������:"+e);
	return;
}
double tjptcjrbl=0;
ls=request.getParameter("tjptcjrbl");
try{
	if (!(ls.equals("")))  tjptcjrbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tjptcjrbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ؼ�Ʒ��ɼ������]����ת����������:"+e);
	return;
}


String[] ddbh=request.getParameterValues("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<ddbh.length ;i++ )
	{
		String sfjs="";
		ls_sql="select sfjs";
		ls_sql+=" from jc_zcdd ";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sfjs=cf.fillNull(rs.getString("sfjs"));
		}
		rs.close();
		ps.close();

		if (sfjs.equals("Y") || sfjs.equals("M") || sfjs.equals("F"))//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M����������ˣ�F�����㸶�P���������
		{
			conn.rollback();
			out.println("�����ѽ���:"+ddbh[i]);
			return;
		}

		ls_sql="update jc_zcdd set tcjrbl=?,tjptcjrbl=?,htyjjrje=round(zcpclf*?/100,2)+round(tjpclf*?/100,2)";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,tcjrbl);
		ps.setDouble(2,tjptcjrbl);
		ps.setDouble(3,tcjrbl);
		ps.setDouble(4,tjptcjrbl);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>