<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String psdh=request.getParameter("psdh");
String clbm=request.getParameter("clbm");

double sumpssl=0;
double sumpsje=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String pszt=null;
	ls_sql=" SELECT pszt ";
	ls_sql+=" FROM cl_psd ";
    ls_sql+=" where psdh='"+psdh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pszt=cf.fillNull(rs.getString("pszt"));
	}
	rs.close();
	ps.close();

	if (!pszt.equals("1"))//1��δ�ύ��2�����ύ��3��������
	{
		out.print("�������ύ���������޸�");
		return;
	}

	conn.setAutoCommit(false);

/************************************************************
|		ɾ��ѡ�еĲ���										|
*************************************************************/
	ls_sql="delete from cl_psdmx where psdh='"+psdh+"' and clbm='"+clbm+"'";
	ps= conn.prepareStatement(ls_sql);
	if (ps.executeUpdate()!=1)
	{
		conn.rollback();
		out.println("<BR>ɾ��ʧ�ܣ������ڵĲ��ϱ���["+clbm+"]");
		return;
	}
	ps.close();

/************************************************************
|		��ѯɾ������������									|
*************************************************************/
	ls_sql=" SELECT sum(pssl),sum(psje) ";
	ls_sql+=" FROM cl_psdmx ";
    ls_sql+=" where psdh='"+psdh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sumpssl=rs.getDouble(1);
		sumpsje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

/************************************************************
|		���²��ϳ��ⵥ�е�����									|
*************************************************************/
	ls_sql="update cl_psd set pszsl="+sumpssl+",pszje="+sumpsje;
	ls_sql+=" where psdh='"+psdh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

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
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>