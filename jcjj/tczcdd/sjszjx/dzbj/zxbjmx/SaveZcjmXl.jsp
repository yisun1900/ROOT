<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;


String zjxxh=null;
String jgwzbm=null;
zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
String tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));

double sjjmsl=0;
ls=request.getParameter("sjjmsl");
try{
	if (!(ls.equals("")))  sjjmsl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjjmsl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
double sjjmje=0;
ls=request.getParameter("sjjmje");
try{
	if (!(ls.equals("")))  sjjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjjmje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�ʼ�����]����ת����������:"+e);
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sfwc="";
	ls_sql="select sfwc";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N��δ��ɣ�Y�����
	{
		out.println("��������������ɣ��������޸�");
		return;
	}


	String khbh=null;
	ls_sql="select khbh";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
	}
	rs.close();
	ps.close();

	double sjsl=0;//ʵ������
	ls_sql="select sjsl";
	ls_sql+=" FROM bj_khzcxmxjh";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
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
		out.println("������ѡ����������:"+sjsl+"�����ɼ��⣬����ɾ������");
		return;
	}

	conn.setAutoCommit(false);

	//ɾ����ѡ����
	ls_sql=" delete from  bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_khzcxmxjh set sjjmsl="+sjjmsl+",sjjmje="+sjjmje;
	ls_sql+=" ,sjsl=0,sjjshsl=0,sjsfsl=0,sjsfje=0";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	//��飺С���������ƣ���������������������������ʼ
	double getyxjmzdsl=0;//��������������
	String getsfkjm="";//�Ƿ����Ƽ�������  1�������ƣ�2������

	ls_sql="select sfkjm,yxjmzdsl";
	ls_sql+=" FROM bj_khclxlxz";
	ls_sql+=" where khbh='"+khbh+"' and clxlbm='"+tccplbbm+"'";
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
	ls_sql+=" FROM bj_khzcxmxjh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and tccplbbm='"+tccplbbm+"'";
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