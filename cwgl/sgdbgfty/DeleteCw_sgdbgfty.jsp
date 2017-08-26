<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] jsjlh=request.getParameterValues("jsjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<jsjlh.length ;i++ )
	{
		String khbh="";
		String gdjsjd="";
		String ygdjsjd="";
		ls_sql="select khbh,gdjsjd,ygdjsjd";
		ls_sql+=" from  cw_sgdbgfty";
		ls_sql+=" where  jsjlh='"+jsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khbh=cf.fillNull(rs.getString("khbh"));
			gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
			ygdjsjd=cf.fillNull(rs.getString("ygdjsjd"));
		}
		else{
			rs.close();
			ps.close();

			conn.rollback();
			out.println("<BR>���������󣬲����Ѽ�¼�Ų�����");
			return;
		}
		rs.close();
		ps.close();

		String getgdjsjd="";
		ls_sql="select gdjsjd";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			getgdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		}
		rs.close();
		ps.close();

		if (!gdjsjd.equals(getgdjsjd))
		{
			conn.rollback();
			out.println("<BR>����������״̬����ȷ");
			return;
		}


		ls_sql="update crm_khxx set gdjsjd=?";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ygdjsjd);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from cw_sgdbgfty ";
		ls_sql+=" where  jsjlh='"+jsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update cw_gdyplyjl set jsbz='0',jsjlh=null";
		ls_sql+=" where  jsbz='1' and jsjlh='"+jsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		
	
		ls_sql =" update  cw_sgdjssqjl set zt='1',jsjlh=null";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and zt='2'";//1��δ�����ѣ�2���Ѳ�����
		ls_sql+=" and jsjlh='"+jsjlh[i]+"'";
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>