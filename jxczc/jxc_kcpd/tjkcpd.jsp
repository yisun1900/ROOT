<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String pdph=request.getParameter("pdph");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	
	String pdzt="";
	ls_sql=" select pdzt";
	ls_sql+=" from jxc_kcpdjl ";
	ls_sql+=" where pdph='"+pdph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		pdzt=rs.getString("pdzt");
	}
	rs.close();
	ps.close();

	if (pdzt.equals("2"))//1�������̵㣻2���̵����
	{
		out.println("�����̵��ѽ���");
		return;
	}


	//����Ƿ�¼��������
	int count=0;
	ls_sql=" select count(*)";
	ls_sql+=" from jxc_kcpdmx ";
	ls_sql+=" where pdph='"+pdph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count<=0)
	{
		out.print("����û��¼�����ݣ������ύ������");
		return;
	}


	//�޸��̵�����״̬
	ls_sql="update jxc_kcpdjl set pdzt='2' ";
	ls_sql+=" where pdph='"+pdph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close(); 


	%>
	<SCRIPT language=javascript >
	<!--
		alert("���̳ɹ�����");
		window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
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