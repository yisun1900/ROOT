<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String[] xsph=request.getParameterValues("xsph");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);
	for (int i=0;i<xsph.length ;i++ )
	{
		String getxsdzt=null;
		ls_sql=" SELECT xsdzt ";
		ls_sql+=" FROM jxc_fcxsd ";
		ls_sql+=" where xsph='"+xsph[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getxsdzt=cf.fillNull(rs.getString("xsdzt"));
		}
		rs.close();
		ps.close();

		if (!getxsdzt.equals("1"))//0��δ�ύ��1���ȴ���ˣ�2���ȴ����⣻3���ѳ��⣻4�����ֳ��⣻9��ȡ��
		{
			conn.rollback();
			out.print("������������["+xsph[i]+"]״̬����ȷ��");
			return;
		}

		ls_sql="update jxc_fcxsd set shjl='N',shr='"+yhmc+"',shsj=TRUNC(SYSDATE),shsm='�������',xsdzt='9' ";
		ls_sql+=" where xsph='"+xsph[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	}

	conn.commit();
	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
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