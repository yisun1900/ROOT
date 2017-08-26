<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] yjfjlh = request.getParameterValues("yjfjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<yjfjlh.length ;i++ )
	{
		String khbh=null;
		String yxmjfzt=null;
		ls_sql="select khbh,yxmjfzt";
		ls_sql+=" from  crm_xmyjfjl";
		ls_sql+=" where yjfjlh='"+yjfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khbh=cf.fillNull(rs.getString("khbh"));
			yxmjfzt=cf.fillNull(rs.getString("yxmjfzt"));
		}
		rs.close();
		ps.close();

		String getyjfjlh="";
		ls_sql="select yjfjlh";
		ls_sql+=" from crm_xmyjfjl";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ls_sql+=" order by yjfjlh desc ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getyjfjlh=cf.fillNull(rs.getString("yjfjlh"));
		}
		rs.close();
		ps.close();

		if (!getyjfjlh.equals(yjfjlh[i]))
		{
			conn.rollback();
			out.println("����ֻ��ɾ�����µĽ�����¼��"+getyjfjlh);
			return;
		}

		String getxmjfzt=null;
		ls_sql="select xmjfzt";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getxmjfzt=cf.fillNull(rs.getString("xmjfzt"));
		}
		rs.close();
		ps.close();

		if (!getxmjfzt.equals("S"))//N��δ������S��Ԥ������Y���طóɹ���X���ط�ʧ�ܣ�C��ʧ���Ѵ���W����Ŀ����
		{
			conn.rollback();
			out.println("����״̬����ȷ:"+yjfjlh[i]);
			return;
		}


		ls_sql="delete from crm_xmyjfjl  ";
		ls_sql+=" where yjfjlh='"+yjfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

			
		ls_sql="update crm_khxx set xmjfzt=? ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,yxmjfzt);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>