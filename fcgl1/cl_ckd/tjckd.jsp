<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ckph=cf.GB2Uni(request.getParameter("ckph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double ckzsl = 0;
double ckzje = 0;
String ckzt="3";
String shzt="0";
try {
	conn=cf.getConnection();

	ls_sql=" SELECT sum(cksl),sum(ckje) FROM cl_ckmx where (ckph='"+ckph+"')";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ckzsl = rs.getDouble(1);
		ckzje = rs.getDouble(2);
	}
	rs.close();
	ps.close();


/*******************************************************************************\
|		�ύʱ��ʼ�����������������н��Ϊ�����������������ܽ��						|
\*******************************************************************************/
	ls_sql="update cl_ckd set ckzt='2',ckzsl="+ckzsl+",ckzje="+ckzje;
	ls_sql+=" where  (ckph='"+ckph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("���ⵥ�ύ�ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (rs!= null) rs.close();
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>