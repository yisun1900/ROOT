<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] dqbm = request.getParameterValues("dqbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//���ϵͳ��ʼ������

	conn.setAutoCommit(false);

	for (int i=0;i<dqbm.length ;i++ )
	{
		ls_sql=" delete from jxc_cljgb ";
		ls_sql+=" where dqbm='"+dqbm[i]+"'";
		ls_sql+=" and xsfs in('2','3')";//1������Ʒ��2���ֻ����ۣ�3���ڻ����ۣ�4����������
		ls_sql+=" and clbm in(select clbm from jxc_clbm where cllb='2')";//0������Ʒ���ģ�1�����ģ�2�����Ʒ����)";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}



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