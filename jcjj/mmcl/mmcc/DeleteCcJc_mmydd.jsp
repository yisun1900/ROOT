<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] yddbh=request.getParameterValues("yddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String oldclzt=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<yddbh.length ;i++ )
	{
		ls_sql="select clzt";
		ls_sql+=" from  jc_mmydd";
		ls_sql+=" where  yddbh='"+yddbh[i]+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			oldclzt=rs.getString("clzt");
		}
		rs.close();
		ps.close();
		if (!oldclzt.equals("03"))
		{
			conn.rollback();
			out.println("��ɾ��ʧ�ܣ�Ԥ����["+yddbh[i]+"]����״̬����ȷ��");
			return;
		}

		ls_sql="update jc_mmydd set clzt='02',sccsj=null,ccsm=null,mmcljs=null";
		ls_sql+=" where  yddbh='"+yddbh[i]+"' and clzt='03' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from jc_mmccd ";
		ls_sql+=" where  yddbh='"+yddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	
		ls_sql="update jc_mmzjx set mmcljs=null";
		ls_sql+=" where  yddbh='"+yddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("ɾ���ɹ���");
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>