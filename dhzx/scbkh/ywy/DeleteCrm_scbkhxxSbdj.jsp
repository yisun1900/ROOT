<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] scbkhbh = request.getParameterValues("scbkhbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<scbkhbh.length ;i++ )
	{

		String zt="";
		ls_sql="select zt";
		ls_sql+=" from  crm_scbkhxx";
		ls_sql+=" where  scbkhbh='"+scbkhbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zt=cf.fillNull(rs.getString(1));
		}
		rs.close();
		ps.close();

		if (!zt.equals("2"))//1�����٣�2��ʧ�ܣ�3���ƽ���4���ѽ��գ�5��׼���ƽ���6��׼��ʧ��
		{
			conn.rollback();
			out.println("����״̬����ȷ:"+scbkhbh[i]);
			return;
		}

		ls_sql="update crm_scbkhxx set zt='1',sbyybm=null,sbyysm=null,sbdjr=null,sbdjsj=null";
		ls_sql+=" where  scbkhbh='"+scbkhbh[i]+"'";
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>