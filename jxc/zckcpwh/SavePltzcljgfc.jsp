<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");

String[] clbm =request.getParameterValues("clbm");
String dqbm =request.getParameter("dqbm");

String gs = request.getParameter("gs");			//���۹�ʽ
String jgmc = request.getParameter("jgmc");		//Ҫ�����ļ۸�����
String xsws = request.getParameter("xsws");		//��Ҫ������С��λ��
if (jgmc!=null)
	{
		if (jgmc.equals("")) 
		{
		out.println("��ѡ����Ҫ�����ļ۸񣡣���");
		return;
		}
	}
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
double cpbqj=0;

try {
	conn=cf.getConnection();    //�õ�����

	conn.setAutoCommit(false);
//=======================================������ѡ�������±�ǩ��=======================================
	for (int i=0;i<clbm.length ;i++ )
	{
		ls_sql = " update jxc_cljgb set "+jgmc+"=ROUND("+gs+","+xsws+"),lrr='"+yhmc+"',lrbm='"+lrbm+"',ssfgs='"+ssfgs+"',lrsj=SYSDATE ";
		ls_sql+= " where dqbm='"+dqbm+"' and clbm='"+clbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
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
	out.print("��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn);
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>
