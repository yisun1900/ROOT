<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] zjxxh = request.getParameterValues("zjxxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<zjxxh.length ;i++ )
	{
		String ddbh=null;
		String clzt=null;
		ls_sql="select ddbh,clzt";
		ls_sql+=" from  jc_jjzjx";
		ls_sql+=" where zjxxh='"+zjxxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs= ps.executeQuery();
		if (rs.next())
		{
			ddbh=rs.getString("ddbh");
			clzt=rs.getString("clzt");
		}
		rs.close();
		ps.close();


		if (!clzt.equals("00"))//00��¼��δ���
		{
			conn.rollback();
			out.println("<BR>��������������ɣ�������ɾ��;���������="+zjxxh[i]);
			return;
		}



		//ɾ������
		ls_sql="delete from jc_jjgtmx ";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ls_sql+=" and gtxh in (select gtxh from jc_gtzjxmx where lx='2' and zjxxh='"+zjxxh[i]+"')";//1��������Ŀ��2��������Ŀ
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//ɾ���Ͳ���
		ls_sql="delete from jc_jjxcmmx ";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ls_sql+=" and xcmxh in (select xcmxh from jc_xcmzjxmx where lx='2' and zjxxh='"+zjxxh[i]+"')";//1��������Ŀ��2��������Ŀ
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//ɾ����Ʒ�Ҿ�
		ls_sql="delete from jc_cpjjddmx ";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ls_sql+=" and cpjjbh in (select cpjjbh from jc_cpjjzjxmx where lx='2' and zjxxh='"+zjxxh[i]+"')";//1��������Ŀ��2��������Ŀ
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//ɾ�����壭������
		ls_sql="delete from jc_gtzjxmx ";
		ls_sql+=" where  zjxxh='"+zjxxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//ɾ���Ͳ��ţ�������
		ls_sql="delete from jc_xcmzjxmx ";
		ls_sql+=" where  zjxxh='"+zjxxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//ɾ����Ʒ�Ҿߣ�������
		ls_sql="delete from jc_cpjjzjxmx ";
		ls_sql+=" where  zjxxh='"+zjxxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//ɾ��������
		ls_sql="delete from jc_jjzjx ";
		ls_sql+=" where zjxxh='"+zjxxh[i]+"'";
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
	out.print("����ʧ��,��������: " + e);
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