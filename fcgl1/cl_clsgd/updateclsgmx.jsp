<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String sgph=request.getParameter("sgph");
String[] clbm=request.getParameterValues("clbm");
String[] sgsl=request.getParameterValues("sgsl");
double sumsgsl=0;
double sjsgsl=0;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);
/************************************************************
|		�޸Ĳ����깺����										|
*************************************************************/
	for (int i=0;i<clbm.length ; i++)
	{
		sjsgsl = Double.parseDouble(sgsl[i]);

		ls_sql="update cl_clsgmx set sgsl='"+sjsgsl+"' ";
		ls_sql+=" where sgph='"+sgph+"' and clbm='"+cf.GB2Uni(clbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.executeUpdate();
		ps.close();
	}
/************************************************************
|		��ѯɾ�����깺������									|
*************************************************************/
	ls_sql=" SELECT sum(sgsl) ";
	ls_sql+=" FROM cl_clsgmx ";
    ls_sql+=" where sgph='"+sgph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sumsgsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

/************************************************************
|		���²����깺���е�����									|
*************************************************************/
	ls_sql="update cl_clsgd set sgzsl='"+sumsgsl+"' ";
	ls_sql+=" where sgph='"+sgph+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("�޸ĳɹ���");
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