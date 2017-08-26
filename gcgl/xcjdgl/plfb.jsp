<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String[] jdjlh=request.getParameterValues("jdjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<jdjlh.length ;i++ )
	{
		String khbh=null;
		String sfycp=null;
		String sfxtp=null;
		String clzt=null;
		String jdqrjg=null;
		String tpsftg=null;
		ls_sql=" SELECT khbh,sfycp,sfxtp,clzt,jdqrjg,tpsftg";
		ls_sql+=" FROM crm_xcjdjl ";
		ls_sql+=" where jdjlh='"+jdjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khbh=cf.fillNull(rs.getString("khbh"));
			sfycp=cf.fillNull(rs.getString("sfycp"));
			sfxtp=cf.fillNull(rs.getString("sfxtp"));
			clzt=cf.fillNull(rs.getString("clzt"));
			jdqrjg=cf.fillNull(rs.getString("jdqrjg"));
			tpsftg=cf.fillNull(rs.getString("tpsftg"));
		}
		rs.close();
		ps.close();

		if (clzt.equals("1"))//1�����룻2��ȷ�ϣ�3������ȷ�ϣ�4��������ɣ�5��������6���ѽ��ף�
		{
			if (!sfycp.equals("2") || !sfxtp.equals("N"))//1���в�Ʒ��2���޲�Ʒ
			{
				conn.rollback();
				out.println("����δȷ��:"+jdjlh[i]);
				return;
			}
		}
		else if (clzt.equals("2"))
		{
			if (!sfycp.equals("1") || !jdqrjg.equals("Y"))//1���в�Ʒ��2���޲�Ʒ
			{
				conn.rollback();
				out.println("����ȷ��δͨ��:"+jdjlh[i]);
				return;
			}
		}
		else if (clzt.equals("4"))
		{
			if (!sfycp.equals("2") || !sfxtp.equals("Y") || !tpsftg.equals("Y"))//1���в�Ʒ��2���޲�Ʒ
			{
				conn.rollback();
				out.println("����������δȷ�ϻ�����δͨ��:"+jdjlh[i]);
				return;
			}
		}
		else{
			conn.rollback();
			out.println("�����ѷ�����δȷ�����:"+jdjlh[i]);
			return;
		}


		ls_sql="update crm_xcjdjl set zzqrjdrq=jhjdrq,zzqrjdsj=jhjdsj,fbr='"+yhmc+"',fbsj=TRUNC(SYSDATE),clzt='5' ";
		ls_sql+=" where  jdjlh='"+jdjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		String setxcjdbz="8";//0��δ���룻1����ͨ���룻2���������룻3��ȷ��ͨ����4��ȷ��ʧ�ܣ�5������ȷ�ϣ�6������ͬ�⣻7��������ͬ�⣻8��������9�����׳ɹ���A������ʧ�ܣ�B��ʧ���ѳ�����

		
		ls_sql="update crm_khxx set xcjdbz='"+setxcjdbz+"' ";
		ls_sql+=" where khbh='"+khbh+"'";
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
	out.print("<BR>����:" + e);
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