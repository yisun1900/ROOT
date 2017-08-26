<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String sgph=request.getParameter("sgph");
String shyj=cf.GB2Uni(request.getParameter("shyj"));
String[] oldclbm=request.getParameterValues("clbm");
String[] shsl=request.getParameterValues("shsl");

if (oldclbm.length<0)
{
	out.print("û���ҵ�����!!!");
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
double sjshsl=0;
double sumshsl=0;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

/************************************************************
|		�����������,���״̬									|
*************************************************************/
	for (int i=0;i<oldclbm.length ; i++)
	{
		sjshsl = Double.parseDouble(shsl[i]);

		ls_sql=" update cl_clsgmx set shsl='"+sjshsl+"' ";
		ls_sql+=" where sgph='"+sgph+"' and clbm='"+oldclbm[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

/************************************************************
|		��ѯ��˺������										|
*************************************************************/
	ls_sql=" SELECT sum(shsl) ";
	ls_sql+=" FROM cl_clsgmx ";
    ls_sql+=" where sgph='"+sgph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sumshsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

/************************************************************
|		���²����깺���е�����									|
*************************************************************/
	ls_sql="update cl_clsgd set sgzt='5',sjshr='"+yhmc+"',sjshyj='"+shyj+"',sjshsj=sysdate,shzsl='"+sumshsl+"' ";
	ls_sql+=" where sgph='"+sgph+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("��˳ɹ�!");
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