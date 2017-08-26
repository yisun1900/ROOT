<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] khbh=request.getParameterValues("khbh");
if (khbh.length>1)
{
	out.println("����ÿ��ֻ��ɾ��һ��");
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String fjtcbz="";
	ls_sql="select fjtcbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fjtcbz=cf.fillNull(rs.getString("fjtcbz"));
	}
	rs.close();
	ps.close();

	if (!fjtcbz.equals("Y"))
	{
		out.println("����δ�ֽⶩ��");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_khxx set fjtcbz='N'";
	ls_sql+=" where  khbh='"+khbh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	String ddbh=null;
	String clzt=null;
	String sfjs=null;
	ls_sql="select ddbh,clzt,sfjs";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where khbh='"+khbh[0]+"' and ddlx in('5','6','7','8') ";
	//5����׼�ײͣ�6���Ҿ߽����ײͣ�7����ů�����ײͣ�8�������ײͣ�9���������ģ�A:����������B:��������շѡ�C:ѡ������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		ddbh=cf.fillNull(rs.getString("ddbh"));
		clzt=cf.fillNull(rs.getString("clzt"));
		sfjs=cf.fillNull(rs.getString("sfjs"));

		if (!clzt.equals("09") && !clzt.equals("07"))//00��¼��Ԥ������02��Ԥ�����ѽ��գ�03��������֪ͨ��05���Ѳ����� 25��֪ͨ���ߣ�26�����ߣ�07����ͬδ��ɣ�09����ͬ����ɣ�11����ͬ��ȷ�ϣ�13�������ѽ��գ�27����⣻15��ȷ���ͻ�ʱ�䣻17����֪ͨ�ͻ���18���ѳ��⣻19�����ͻ���21����֪ͨ�˲�����23�����˲�����30��������᣻98:ȡ��Ԥ������99���˵�
		{
			conn.rollback();
			out.println("<BR>����ɾ��ʧ�ܣ�������"+ddbh+"��״̬����ȷ");
			return;
		}

		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  jc_zczjx";
		ls_sql+=" where  ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count>0)
		{
			conn.rollback();
			out.println("��ɾ��ʧ�ܣ�����["+ddbh+"]������������Ҫɾ��������ɾ�������");
			return;
		}

		ls_sql="delete from jc_zcdd ";
		ls_sql+=" where  ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="delete from jc_zcddmx ";
		ls_sql+=" where  ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="delete from jc_jcdd ";
		ls_sql+=" where  gjz='"+ddbh+"' and lx='4' and czlx='1'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();

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
	out.print("����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>