<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] gdjkjlh = request.getParameterValues("gdjkjlh");
String gdjsjlh=request.getParameter("gdjsjlh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

String ls_sql=null;
if (gdjkjlh==null)
{
	out.println("������ѡ������¼");
	return;
}

try {
	conn=cf.getConnection();

	String gdjsjd=null;
	double allfy=0;

	conn.setAutoCommit(false);

	for (int i=0;i<gdjkjlh.length ;i++ )
	{
		ls_sql="select gdjsjd,jkje";
		ls_sql+=" from  cw_gdjkjl";
		ls_sql+=" where gdjkjlh='"+gdjkjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			gdjsjd=rs.getString("gdjsjd");
			allfy+=rs.getDouble("jkje");
		}
		else{
			conn.rollback();
			out.println("���󣡽���¼��["+gdjkjlh[i]+"]������");
			return;
		}
		rs.close();
		ps.close();

		if (!gdjsjd.equals("1"))
		{
			conn.rollback();
			out.println("���󣡲���δ���㣺"+gdjkjlh[i]);
			return;
		}

		//��ά�޷�
		ls_sql=" update cw_gdjkjl set gdjsjd='0',gdjsjlh=null";
		ls_sql+=" where gdjsjd='1' and gdjkjlh='"+gdjkjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();
		
	%>
	<SCRIPT language=javascript >
	<!--
	alert("ɾ���ɹ����ܽ�<%=allfy%>");
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