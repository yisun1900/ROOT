<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] jlh = request.getParameterValues("jlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<jlh.length ;i++ )
	{
		String zt=null;
		ls_sql="select zt";
		ls_sql+=" from  crm_yglkgsjl";
		ls_sql+=" where jlh="+jlh[i] ;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zt=cf.fillNull(rs.getString("zt"));
		}
		else{
			conn.rollback();
			out.println("���󣡼�¼�����ڣ�"+jlh[i]);
			return;
		}
		rs.close();
		ps.close();
		if (!zt.equals("3"))//1��¼�����룻2���뿪��˾��3�����ع�˾��4�������
		{
			conn.rollback();
			out.println("����״̬����ȷ");
			return;
		}

		ls_sql="update crm_yglkgsjl set zt='2',sjfhsj=null,fhlrr=null,fhlrsj=null ";
		ls_sql+=" where jlh="+jlh[i] ;
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
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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