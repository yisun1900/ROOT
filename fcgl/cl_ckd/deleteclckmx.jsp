<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ckph=request.getParameter("ckph");
String clbm=request.getParameter("clbm");
String leixing=request.getParameter("leixing");
String gdj=request.getParameter("gdj");

double sumcksl=0;
double sumckje=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

/************************************************************
|		ɾ��ѡ�еĲ���										|
*************************************************************/
	ls_sql="delete from cl_ckmx where ckph='"+ckph+"' and clbm='"+clbm+"' and leixing='"+leixing+"' and gdj='"+gdj+"'";
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
	ls_sql=" SELECT sum(cksl),sum(ckje) ";
	ls_sql+=" FROM cl_ckmx ";
    ls_sql+=" where ckph='"+ckph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sumcksl=rs.getDouble(1);
		sumckje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

/************************************************************
|		���²��ϳ��ⵥ�е�����									|
*************************************************************/
	ls_sql="update cl_ckd set ckzsl="+sumcksl+",ckzje="+sumckje;
	ls_sql+=" where ckph='"+ckph+"' ";
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