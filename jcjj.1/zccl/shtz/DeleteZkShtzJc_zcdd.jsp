<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String[] ddbh=request.getParameterValues("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String khbh=null;
	String clzt=null;
	String ppbm=null;
	
	conn.setAutoCommit(false);

	for (int i=0;i<ddbh.length ;i++ )
	{
		ls_sql =" select khbh,clzt,ppbm";
		ls_sql+=" from jc_zcdd";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			khbh=rs.getString("khbh");
			clzt=rs.getString("clzt");
			ppbm=rs.getString("ppbm");
		}
		rs.close();
		ps.close();

		if (!clzt.equals("17"))
		{
			conn.rollback();
			out.println("<BR>����ɾ��ʧ�ܣ�������"+ddbh[i]+"��״̬����ȷ");
			return;
		}

		int dzbz=0;
		ls_sql =" select count(*)";
		ls_sql+=" from cw_khfkjl";//1��δ������2������ƾ֤��3��ƾ֤����
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='23' and ddbh='"+ddbh[i]+"' and czlx='2' and gljlbz='N' and bz='�����ͻ�֪ͨ�Զ�ת��'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			dzbz=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (dzbz>0)
		{
			conn.rollback();
			out.println("<BR>����ɾ��ʧ�ܣ�������"+ddbh[i]+"��ת���Ѷ���");
			return;
		}

		ls_sql="update jc_zcdd set tzshr=null,tzshsj=null,ddshbz='2',clzt='15'";
		ls_sql+=" where ddbh='"+ddbh[i]+"' and  clzt='17' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//ɾ���ͻ������¼
		ls_sql="update cw_khfkjl set scbz='Y',scsj=SYSDATE,scr='"+yhmc+"'";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='23' and ddbh='"+ddbh[i]+"' and gljlbz='N' and bz='�����ͻ�֪ͨ�Զ�ת��'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//ɾ���ͻ������¼������
		ls_sql="update cw_khfkjl set scbz='Y',scsj=SYSDATE,scr='"+yhmc+"'";
		ls_sql+=" where khbh='"+khbh+"' and zckx='23' and zcddbh='"+ddbh[i]+"' and gljlbz='Y' and bz='�����ͻ�֪ͨ�Զ�ת��'";
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
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>