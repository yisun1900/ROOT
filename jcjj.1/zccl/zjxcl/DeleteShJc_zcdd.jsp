<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] zjxbh = request.getParameterValues("zjxbh");

String ddbh=null;
String zjxxh=null;
String clzt=null;
String zjxbz=null;
String sfjs=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<zjxbh.length ;i++ )
	{
		ls_sql =" select ddbh,clzt,sfjs";
		ls_sql+=" from jc_zczjx";
		ls_sql+=" where zjxbh='"+zjxbh[i]+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		while (rs1.next())
		{
			ddbh=rs1.getString("ddbh");
			clzt=rs1.getString("clzt");
			sfjs=rs1.getString("sfjs");

			if (!clzt.equals("03"))
			{
				conn.rollback();
				out.println("<BR>����[�������ţ�"+zjxbh[i]+"]״̬����ȷ");
				return;
			}

			if (!sfjs.equals("N") && !sfjs.equals("C"))//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M�����������
			{
				conn.rollback();
				out.println("<BR>����ɾ��ʧ�ܣ�[�������ţ�"+zjxbh[i]+"]�ѽ���");
				return;
			}

			ls_sql="update jc_zczjx set shr=null,sshsj=null,clzt='04'";
			ls_sql+=" where zjxbh='"+zjxbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

		}
		rs1.close();
		ps1.close();

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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>