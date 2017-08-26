<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
double fdbl=0;
ls=request.getParameter("fdbl");
try{
	if (!(ls.equals("")))  fdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Ʒ���̽������]����ת����������:"+e);
	return;
}
double tjpfdbl=0;
ls=request.getParameter("tjpfdbl");
try{
	if (!(ls.equals("")))  tjpfdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tjpfdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ؼ�Ʒ���̽������]����ת����������:"+e);
	return;
}
double azfjsbl=0;
ls=request.getParameter("azfjsbl");
try{
	if (!(ls.equals("")))  azfjsbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����azfjsbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[��װ�ѽ������]����ת����������:"+e);
	return;
}
double ycfjsbl=0;
ls=request.getParameter("ycfjsbl");
try{
	if (!(ls.equals("")))  ycfjsbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ycfjsbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[Զ�̷ѽ������]����ת����������:"+e);
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

		ls_sql="update jc_zcdd set fdbl=?,tjpfdbl=?,cbze=round(zcpclf*?/100+tjpclf*?/100,2),azfjsbl=?,ycfjsbl=?";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,fdbl);
		ps.setDouble(2,tjpfdbl);
		ps.setDouble(3,fdbl);
		ps.setDouble(4,tjpfdbl);
		ps.setDouble(5,azfjsbl);
		ps.setDouble(6,ycfjsbl);
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