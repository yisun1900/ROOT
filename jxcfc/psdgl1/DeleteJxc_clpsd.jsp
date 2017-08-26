<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] psph=request.getParameterValues("psph");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<psph.length ;i++ )
	{
		String psdzt=null;
		ls_sql=" SELECT jxc_clpsd.psdzt ";
		ls_sql+=" FROM jxc_clpsd";
		ls_sql+=" where psph='"+psph[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			psdzt=cf.fillNull(rs.getString("psdzt"));
		}
		else{
			rs.close();
			ps.close();

			conn.rollback();
			out.print("�������͵�["+psph[i]+"]������");
			return;
		}
		rs.close();
		ps.close();

		if (!psdzt.equals("0"))//0���ȴ��ύ��2���ȴ����⣻3���ѳ��⣻5�����ֳ���
		{
			conn.rollback();
			out.print("�������͵�["+psph[i]+"]���ύ����ֱ��ɾ������ɾ���ύ״̬");
			return;
		}

		ls_sql="delete from jxc_clpsmx ";
		ls_sql+=" where psph='"+psph[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from jxc_clpsd ";
		ls_sql+=" where psph='"+psph[i]+"'";
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