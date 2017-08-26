<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] ckph = request.getParameterValues("ckph");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double rkzsl = 0;
double rkzje = 0;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<ckph.length ;i++ )
	{
		String cksj=null;
		String dwbh=null;
		ls_sql="select cksj,dwbh";
		ls_sql+="  from cl_ckd where ckph='"+ckph[i]+"'";  
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();
		if (rs.next())
		{
			cksj=rs.getString(1); 
			dwbh=rs.getString(2); 
		} 
		rs.close();
		ps.close();

		String jzph=dwbh+cksj.substring(0,4)+cksj.substring(5,7);

		int count=0;
		ls_sql="select count(*) ";
		ls_sql+="  from cl_ydjz where dwbh='"+dwbh+"' and  jzph='"+jzph+"' ";  
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1); 
		} 
		rs.close();
		ps.close();

		if (count>0)
		{
			conn.rollback();
			out.println("���󣡵����ѽ�ת�������ٽ��г��������������������ɾ����ת��¼��"+ckph[i]);
			return;
		}

		ls_sql="update cl_ckd set ckzt='1' ";
		ls_sql+=" where  (ckph='"+ckph[i]+"' and ckzt='2')  ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("�����ɹ���");
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
		if (ps!= null) ps.close(); 
		if (rs!= null) rs.close();
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>