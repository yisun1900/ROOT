<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String[] glbxh=request.getParameterValues("glbxh");
String[] xmbh=request.getParameterValues("xmbh");
String[] dqbm=request.getParameterValues("dqbm");
String[] glflbm=request.getParameterValues("glflbm");
String[] glmc=request.getParameterValues("glmc");
String[] jldwbm=request.getParameterValues("jldwbm");
String[] xhlstr=request.getParameterValues("xhl");
String[] djstr=request.getParameterValues("dj");
String[] pp=request.getParameterValues("pp");
String[] xhgg=request.getParameterValues("xhgg");
String[] bjjb=request.getParameterValues("bjjb");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double dj=0;
double xhl=0;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);


	for (int i=0;i<glbxh.length ;i++ )
	{
		//[���ۼ���]�Ƿ�Ϊ��
		if (bjjb[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ�[���ۼ���]Ϊ��");
			return;
		}
		//[���Ϸ���]�Ƿ�Ϊ��
		if (glflbm[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ�[���Ϸ���]Ϊ��");
			return;
		}
		//[��������]�Ƿ�Ϊ��
		if (glmc[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ�[��������]Ϊ��");
			return;
		}
		//[������λ]�Ƿ�Ϊ��
		if (jldwbm[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ�[������λ]Ϊ��");
			return;
		}
		//[������]�Ƿ�Ϊ��
		if (xhlstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ�[������]Ϊ��");
			return;
		}
		//[����]�Ƿ�Ϊ��
		if (djstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ�[����]Ϊ��");
			return;
		}

		xhl=0;
		try{
			xhl=java.lang.Double.parseDouble(xhlstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>����ʧ�ܣ���������Ϊ["+cf.GB2Uni(glmc[i])+"]��[����]���벻��ȷ:"+xhlstr[i].trim());
			return;
		}

		dj=0;
		try{
			dj=java.lang.Double.parseDouble(djstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>����ʧ�ܣ���������Ϊ["+cf.GB2Uni(glmc[i])+"]��[����]���벻��ȷ:"+djstr[i].trim());
			return;
		}
	

		//��װ���Ϸ�����
		ls_sql="update bj_gzglfxb set glflbm='"+glflbm[i]+"',glmc='"+cf.GB2Uni(glmc[i])+"',pp='"+cf.GB2Uni(pp[i])+"'";
		ls_sql+=" ,xhgg='"+cf.GB2Uni(xhgg[i])+"',jldwbm='"+jldwbm[i]+"',xhl="+xhl+",dj="+dj+",lrr='"+yhmc+"',lrsj=TRUNC(SYSDATE),bjjb='"+bjjb[i]+"' ";
		ls_sql+=" where glbxh="+glbxh[i];
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
	out.print("Exception: " + e);
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