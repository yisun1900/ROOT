<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] jdjlh = request.getParameterValues("jdjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<jdjlh.length ;i++ )
	{
		String khbh=null;
		String clzt=null;
		ls_sql="select khbh,clzt";
		ls_sql+=" from  crm_yjdjl";
		ls_sql+=" where jdjlh='"+jdjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khbh=cf.fillNull(rs.getString("khbh"));
			clzt=cf.fillNull(rs.getString("clzt"));
		}
		else{
			rs.close();
			ps.close();
			conn.rollback();
			out.println("���󣡲�����ԤԤ��������:"+jdjlh[i]);
			return;
		}
		rs.close();
		ps.close();

		if (!clzt.equals("2"))//1�����룻2��������3����Ԥ����
		{
			out.print("���󣡴���״̬����ȷ");
			return;
		}

		ls_sql="update crm_yjdjl set zzqrjdrq=null,zzqrjdsj=null,fbr=null,fbsj=null,clzt='1' ";
		ls_sql+=" where jdjlh='"+jdjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_zxkhxx set xcjdbz='2',sgd=null,zjxm=null";
		ls_sql+=" where  khbh='"+khbh+"'";
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
	out.print("<BR>����ʧ��,��������: " + e);
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