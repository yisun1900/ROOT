<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String[] zjxxh = request.getParameterValues("zjxxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<zjxxh.length ;i++ )
	{
		String sfwc=null;
		ls_sql="select sfwc";
		ls_sql+=" from  crm_zjxdj";
		ls_sql+=" where zjxxh='"+zjxxh[i]+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sfwc=cf.fillNull(rs.getString("sfwc"));
		}
		rs.close();
		ps.close();

		if (!sfwc.equals("Y"))//N��δ��ɣ�Y������ɣ�K���ѿۿ�
		{
			conn.rollback();
			out.println("�������������״̬����ȷ:"+zjxxh[i]);
			return;
		}


		//��ש����
		double czkkje=0;
		ls_sql="SELECT sum(round(bj_zjxzcbgqd.xdsl*bj_zjxzcbgqd.jsj,2)) ";
		ls_sql+=" FROM bj_zjxzcbgqd  ";
		ls_sql+=" where bj_zjxzcbgqd.zjxxh='"+zjxxh[i]+"'";
		ls_sql+=" and bj_zjxzcbgqd.tclx='1'";//1���ײͣ�2�������ײ�
		ls_sql+=" and bj_zjxzcbgqd.tccpdlbm=3";//��ש��
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			czkkje=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql="update crm_zjxdj set sfwc='K',czkkr='"+yhmc+"',czkksj=SYSDATE,czkkje="+czkkje;
		ls_sql+=" where zjxxh='"+zjxxh[i]+"'  ";
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
	out.print("<BR>����ʧ��,��������: " + e);
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