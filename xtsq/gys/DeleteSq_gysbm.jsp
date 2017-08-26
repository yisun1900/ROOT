<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] gysbm =request.getParameterValues("gysbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<gysbm.length ;i++ )
	{
		//ȡ�û���¼��
		String yhdlm=null;
		ls_sql="select yhdlm";
		ls_sql+=" from  sq_gysbm";
		ls_sql+=" where gysbm='"+gysbm[i]+"'";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yhdlm=rs.getString("yhdlm");
		}
		rs.close();
		ps.close();

		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  sq_gysxx";
		ls_sql+=" where gysbm='"+gysbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			conn.rollback();
			out.println("���󣡲���ɾ����[Ʒ�ƹ�Ӧ����Ϣ��]���ڴ˹�Ӧ�̣���Ӧ�̱�ţ�"+gysbm[i]);
			return;
		}

		//ɾ������Ӧ����ϵ��
		ls_sql="delete from sq_gyslxr ";
		ls_sql+=" where gysbm='"+gysbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//ɾ������Ӧ����Ϣ��
		ls_sql="delete from sq_gysbm ";
		ls_sql+=" where gysbm='"+gysbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from sq_gyssqfgs ";
		ls_sql+=" where gysbm='"+gysbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//���û���¼��
		if (yhdlm!=null)//Y���ѳ�����N��δ����
		{
			//ȡ���û�Ȩ��
			ls_sql="delete from sq_yhssz where yhdlm='"+yhdlm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="delete from  sq_yhewqx where yhdlm='"+yhdlm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

		}

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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>