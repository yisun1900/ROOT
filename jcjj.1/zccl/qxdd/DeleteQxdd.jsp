<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] ddbh=request.getParameterValues("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String clzt=null;
	
	conn.setAutoCommit(false);

	for (int i=0;i<ddbh.length ;i++ )
	{
		String khbh=null;
		ls_sql =" select clzt,khbh";
		ls_sql+=" from jc_zcdd";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			clzt=rs.getString("clzt");
			khbh=rs.getString("khbh");
		}
		rs.close();
		ps.close();

		if (!clzt.equals("99"))
		{
			conn.rollback();
			out.println("<BR>����ɾ��ʧ�ܣ�������"+ddbh[i]+"��״̬����ȷ");
			return;
		}

		ls_sql="update jc_zcdd set clzt=lsclzt,lsclzt='',tdsj=null,tdblr=null,kclf=0,jctdyybm=null,tdsm=null";
		ls_sql+=" where  ddbh='"+ddbh[i]+"' and  clzt='99'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update jc_zczjx set clzt=clzt1";
		ls_sql+=" where  ddbh='"+ddbh[i]+"' and  clzt='99'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//���ɶ���
		ls_sql="delete from jc_jcdd ";
		ls_sql+=" where gjz='"+ddbh[i]+"' and lx='4' and czlx='3'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//ɾ��������Ϣ
		ls_sql="delete from cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and  bz='�˵��Զ�¼��'";
		ls_sql+=" and  fklxbm in('55','62')";
		ls_sql+=" and  zckx='23'";//55�����Ĵ���ȯ;62������Ԥ����;23:����
		ls_sql+=" and  zcddbh='"+ddbh[i]+"'";
		ls_sql+=" and scbz='N'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and  bz='�˵��Զ�¼��'";
		ls_sql+=" and  fklxbm='23'";//55�����Ĵ���ȯ;62������Ԥ����;23:����
		ls_sql+=" and  ddbh='"+ddbh[i]+"'";
		ls_sql+=" and  zckx in('55','62')";
		ls_sql+=" and scbz='N'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	}

	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("ɾ���˵��ɹ���");
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
