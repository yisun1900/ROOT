<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] lrxh = request.getParameterValues("lrxh");
String gdjsjlh=request.getParameter("gdjsjlh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

String ls_sql=null;

if (lrxh==null)
{
	out.println("������ѡ������¼");
	return;
}

try {
	conn=cf.getConnection();

	String jsbz=null;
	double allfy=0;

	conn.setAutoCommit(false);

	for (int i=0;i<lrxh.length ;i++ )
	{
		ls_sql="select jsbz,zrfcdfy";
		ls_sql+=" from  crm_wxfmx";
		ls_sql+=" where lrxh='"+lrxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			jsbz=rs.getString("jsbz");
			allfy+=rs.getDouble("zrfcdfy");
		}
		else{
			conn.rollback();
			out.println("�������["+lrxh[i]+"]������");
			return;
		}
		rs.close();
		ps.close();

		if (!jsbz.equals("Y"))
		{
			conn.rollback();
			out.println("���󣡲���δ���㣺"+lrxh[i]);
			return;
		}

		//��ά�޷�
		ls_sql=" update crm_wxfmx set jsbz='N',jsjlh=null";
		ls_sql+=" where jsbz='Y' and lrxh='"+lrxh[i]+"'";
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