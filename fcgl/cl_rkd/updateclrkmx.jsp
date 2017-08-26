<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String rkph=request.getParameter("rkph");
String[] clbm=request.getParameterValues("clbm");
String[] rkdj=request.getParameterValues("rkdj");
String[] rksl=request.getParameterValues("rksl");
double rkje=0;
double sjrkdj=0;
double sjrksl=0;
double sumrksl=0;
double sumrkje=0;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

/************************************************************
|		�޸Ĳ����������										|
*************************************************************/
	for (int i=0;i<clbm.length ; i++)
	{
		try
			{
			sjrkdj = Double.parseDouble(rkdj[i]);
			}
		catch(Exception e){
			conn.rollback();
			out.print("[��ⵥ��]���ָ�ʽ����ȷ������ȷ��");
			return;
			}
		try
			{
			sjrksl = Double.parseDouble(rksl[i]);
			}
		catch(Exception e){
			conn.rollback();
			out.print("[�������]���ָ�ʽ����ȷ������ȷ��");
			return;
			}

		rkje=sjrkdj*sjrksl;

		ls_sql="update cl_rkmx set rkdj='"+sjrkdj+"',rksl='"+sjrksl+"',rkje='"+rkje+"' ";
		ls_sql+=" where rkph='"+rkph+"' and clbm='"+cf.GB2Uni(clbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		if (ps.executeUpdate()!=1)
		{
			conn.rollback();
			out.println("<BR>�����ڵĲ��ϱ���["+cf.GB2Uni(clbm[i])+"]");
			return;
		}
		ps.close();
	}

/************************************************************
|		��ѯɾ������������									|
*************************************************************/
	ls_sql=" SELECT sum(rksl),sum(rkje) ";
	ls_sql+=" FROM cl_rkmx ";
    ls_sql+=" where rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sumrksl=rs.getDouble(1);
		sumrkje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

/************************************************************
|		���²�����ⵥ�е�����									|
*************************************************************/
	ls_sql="update cl_rkd set rkzsl='"+sumrksl+"',rkzje='"+sumrkje+"' ";
	ls_sql+=" where rkph='"+rkph+"' ";
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