<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");

String dqbm=request.getParameter("dqbm");

String[] cldlbm=request.getParameterValues("cldlbm");
String[] wlllbz=request.getParameterValues("wlllbz");
String[] wlbm=request.getParameterValues("wlbm");
String[] glmc=request.getParameterValues("glmc");
String[] xhgg=request.getParameterValues("xhgg");
String[] pp=request.getParameterValues("pp");
String[] jldwbm=request.getParameterValues("jldwbm");
String[] djstr=request.getParameterValues("dj");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double dj=0;

try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);


	for (int i=0;i<wlbm.length ;i++ )
	{
		//[���Ϸ���]�Ƿ�Ϊ��
		if (cldlbm[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ�[���Ϸ���]Ϊ��");
			return;
		}
		//[���ϱ���]�Ƿ�Ϊ��
		if (wlllbz[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ����["+(i+1)+"]��[�赽��������]Ϊ��");
			return;
		}
		//[���ϱ���]�Ƿ�Ϊ��
		if (wlbm[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ����["+(i+1)+"]��[���ϱ���]Ϊ��");
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
		//[����]�Ƿ�Ϊ��
		if (djstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ�[����]Ϊ��");
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
		ls_sql="insert into bj_jscljgb(dqbm,cldlbm,wlbm,glmc,pp,xhgg,jldwbm,dj,lrr,lrsj,wlllbz)";
		ls_sql+=" values('"+dqbm+"','"+cldlbm[i]+"','"+cf.GB2Uni(wlbm[i])+"','"+cf.GB2Uni(glmc[i])+"','"+cf.GB2Uni(pp[i])+"','"+cf.GB2Uni(xhgg[i])+"','"+jldwbm[i]+"',"+dj+",'"+yhmc+"',TRUNC(SYSDATE),'"+wlllbz[i]+"')";
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