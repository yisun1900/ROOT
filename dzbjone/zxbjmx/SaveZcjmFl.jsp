<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String khbh=request.getParameter("khbh");
String jmfl=cf.GB2Uni(request.getParameter("jmfl"));
String[] tccplbbm=request.getParameterValues("tccplbbm");
String[] jgwzbm=request.getParameterValues("jgwzbm");
String[] sjjmslStr=request.getParameterValues("sjjmsl");


 
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String getzxzt=null;//0��δ������棻1: ������棻2: �����˻ؿͻ���3����ǩԼ��4����˾ǩ��ʧ�ܣ�5�����·������
	ls_sql="SELECT zxzt";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
	}
	rs.close();
	ps.close();
	if (getzxzt.equals("3"))
	{
		int czbzsq=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM cw_czbjsqjl";
		ls_sql+=" where khbh='"+khbh+"' and wcbz='1'";//1��δ��ɣ�2����ɣ�3��ҵ����ת
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			czbzsq=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (czbzsq==0)
		{
			out.println("���󣡿ͻ���ǩ�����������޸ı���");
			return;
		}
	}
	else if (getzxzt.equals("2") || getzxzt.equals("4"))
	{
		out.println("���󣡿ͻ�ǩ��ʧ�ܣ��������޸ı���");
		return;
	}


	conn.setAutoCommit(false);

	for (int i=0;i<tccplbbm.length ;i++ )
	{
		double sjsl=0;//ʵ������
		ls_sql="select sum(sjsl) sjsl ";
		ls_sql+=" FROM bj_khzcxmxj";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"' and tccplbbm='"+tccplbbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sjsl=rs.getDouble("sjsl");
		}
		rs.close();
		ps.close();

		if (sjsl>0)
		{
			conn.rollback();
			out.println("������ѡ����������:"+sjsl+"�����ɼ��⣬����ɾ������");
			return;
		}

		double sjjmsl=0;
		try{
			sjjmsl=Double.parseDouble(sjjmslStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[��������]����ת����������:"+e);
			return;
		}

		if (sjjmsl<0)
		{
			conn.rollback();
			out.println("<BR>����![��������:"+sjjmsl+"]����С��0");
			return;
		}

		//ɾ����ѡ����
		ls_sql=" delete from  bj_khzcxm";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"' and tccplbbm='"+tccplbbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update bj_khzcxmxj set sjjmsl="+sjjmsl+",sjjmje=jmdj*"+sjjmsl;
		ls_sql+=" ,sjsl=0,sjjshsl=0,sjsfsl=0,sjsfje=0";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"' and tccplbbm='"+tccplbbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	
		//��飺С���������ƣ���������������������������ʼ
		double getyxjmzdsl=0;//��������������
		String getsfkjm="";//�Ƿ����Ƽ�������  1�������ƣ�2������

		ls_sql="select sfkjm,yxjmzdsl";
		ls_sql+=" FROM bj_khclxlxz";
		ls_sql+=" where khbh='"+khbh+"' and clxlbm='"+tccplbbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getyxjmzdsl=rs.getDouble("yxjmzdsl");
			getsfkjm=cf.fillNull(rs.getString("sfkjm"));
		}
		rs.close();
		ps.close();

		double xlsjjmsl=0;
		ls_sql="select sum(sjjmsl)";
		ls_sql+=" FROM bj_khzcxmxj";
		ls_sql+=" where khbh='"+khbh+"' and tccplbbm='"+tccplbbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xlsjjmsl=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		if (getsfkjm.equals("2"))//1�������ƣ�2������
		{
			if (xlsjjmsl>getyxjmzdsl)
			{
				conn.rollback();
				out.println("<P>����������Ƽ�����������������["+xlsjjmsl+"]���ܳ�����������["+getyxjmzdsl+"]");
				return;
			}
		}
		//��飺С���������ƣ�����������������������������
		

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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>