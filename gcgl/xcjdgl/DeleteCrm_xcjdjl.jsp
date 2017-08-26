<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] jdjlh=request.getParameterValues("jdjlh");

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
		String clzt="";
		ls_sql=" SELECT khbh,clzt";
		ls_sql+=" FROM crm_xcjdjl ";
		ls_sql+=" where jdjlh='"+jdjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khbh=cf.fillNull(rs.getString("khbh"));
			clzt=cf.fillNull(rs.getString("clzt"));
		}
		else{
			conn.rollback();
			out.print("���󣡲����ڽ��׼�¼:"+jdjlh[i]);
			return;
		}
		rs.close();
		ps.close();

		if (!clzt.equals("1"))//1�����룻2��ȷ�ϣ�3������ȷ�ϣ�4��������ɣ�5��������6���ѽ���
		{
			conn.rollback();
			out.print("������ȷ��:"+jdjlh[i]);
			return;
		}



		ls_sql="delete from crm_jdsjxgjl";
		ls_sql+=" where  jdjlh='"+jdjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from crm_jdjg";
		ls_sql+=" where  jdjlh='"+jdjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from crm_jdqrjl";
		ls_sql+=" where  jdjlh='"+jdjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from crm_jdxmmx";
		ls_sql+=" where  jdjlh='"+jdjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from crm_xcjdjl";
		ls_sql+=" where  jdjlh='"+jdjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	
		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  crm_xcjdjl";
		ls_sql+=" where khbh='"+khbh+"' and jdsfcg in('N','M') ";//Y���ɹ���N��ʧ�ܣ�M��ʧ���ѳ�����
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		String setxcjdbz="";
		if (count>0)//0��δ���룻1����ͨ���룻2���������룻3��ȷ��ͨ����4��ȷ��ʧ�ܣ�5������ȷ�ϣ�6������ͬ�⣻7��������ͬ�⣻8��������9�����׳ɹ���A������ʧ�ܣ�B��ʧ���ѳ�����
		{
			setxcjdbz="A";
		}
		else{
			setxcjdbz="0";
		}

		ls_sql="update crm_khxx set xcjdbz='"+setxcjdbz+"' ";
		ls_sql+=" where khbh='"+khbh+"'";
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