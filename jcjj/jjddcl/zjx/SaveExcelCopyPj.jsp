<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] gtpjbh=request.getParameterValues("gtpjbh");
String[] sl=request.getParameterValues("sl");
String[] bzdj=request.getParameterValues("bzdj");
String[] zqje=request.getParameterValues("zqje");
String[] bz=request.getParameterValues("bz");

String czfs=cf.GB2Uni(request.getParameter("czfs"));
String gtxh=cf.GB2Uni(request.getParameter("gtxh"));
String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
String zjxxh=request.getParameter("zjxxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int count=0;

try {
	conn=cf.getConnection();

	String fgsbh=null;
	String clzt=null;
	double jjzkl=0;
	ls_sql="select fgsbh,clzt,jjzkl";
	ls_sql+=" from  jc_jjzjx";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=rs.getString("fgsbh");
		clzt=rs.getString("clzt");
		jjzkl=rs.getDouble("jjzkl");
	}
	rs.close();
	ps.close();
	if (!clzt.equals("00"))//00��¼��δ���
	{
		out.println("��������������ɣ�������¼��");
		return;
	}


	//��ȡ����С������������������������������ʼ
	int jcddblxs=-100;//���ɶ�������С��  2��2λС����1��1λС����0��������λ��-1������ʮλ��-2��������λ��-3������ǧλ
	int jcddmxblxs=-100;//���ɶ�����ϸ����С��  2��2λС����1��1λС����0��������λ��-1������ʮλ��-2��������λ��-3������ǧλ
	ls_sql =" select NVL(jcddblxs,-100),NVL(jcddmxblxs,-100)";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jcddblxs=rs.getInt(1);
		jcddmxblxs=rs.getInt(2);
	}
	rs.close();
	ps.close();

	if (jcddblxs==-100)
	{
		out.println("<BR>����û�����á����ɶ�������С��λ����������ϵ����Ա");
		return;
	}

	if (jcddmxblxs==-100)
	{
		out.println("<BR>����û�����á����ɶ�����ϸ����С����������ϵ����Ա");
		return;
	}
	//��ȡ����С������������������������������������

	
	conn.setAutoCommit(false);

	if (czfs.equals("1"))//1:�滻ԭ����
	{
		ls_sql="delete from jc_gtpjmx ";
		ls_sql+=" where gtxh='"+gtxh+"' and ddbh='"+ddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	long pjxh=0;
	ls_sql="select NVL(max(pjxh),0)";
	ls_sql+=" from  jc_gtpjmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pjxh=rs.getLong(1);
	}
	rs.close();
	ps.close();

	pjxh++;

	for (int i=0;i<gtpjbh.length ;i++ )
	{
		double dj=java.lang.Double.parseDouble(bzdj[i].trim());
		double je=java.lang.Double.parseDouble(zqje[i].trim());

		ls_sql="insert into jc_gtpjmx ( pjxh,ddbh,gtxh,gtpjbh,gtpjmc,xinghao,guige,bzdj,khdj,sl,zqje,je,bz,jjpjflbm,jldwbm ) ";
		ls_sql+=" select ?,?,?,gtpjbh,gtpjmc,xinghao,guige,?,?,?,?,ROUND(?,"+jcddmxblxs+"),?,jjpjflbm,jldwbm";
		ls_sql+=" from  jc_jjpjbj";
		ls_sql+=" where gtpjbh='"+gtpjbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,pjxh);
		ps.setString(2,ddbh);
		ps.setString(3,gtxh);
		ps.setDouble(4,dj);
		ps.setDouble(5,dj*jjzkl/10);
		ps.setString(6,sl[i]);
		ps.setDouble(7,je);
		ps.setDouble(8,je*jjzkl/10);
		ps.setString(9,cf.GB2Uni(bz[i]));
		ps.executeUpdate();
		ps.close();

		pjxh++;
	}



	//������ֽ��
	double pjbfje=0;
	double zqpjbfje=0;
	ls_sql="select sum(je),sum(zqje)";
	ls_sql+=" from  jc_gtpjmx";
	ls_sql+=" where gtxh='"+gtxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pjbfje=rs.getDouble(1);
		zqpjbfje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="update jc_jjgtmx set pjbfje=ROUND(?,"+jcddmxblxs+"),zqpjbfje=?,zj=bcbfje+ROUND(?,"+jcddmxblxs+"),zqzj=zqbcbfje+? ";
	ls_sql+=" where gtxh='"+gtxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,pjbfje);
	ps.setDouble(2,zqpjbfje);
	ps.setDouble(3,pjbfje);
	ps.setDouble(4,zqpjbfje);
	ps.executeUpdate();
	ps.close();
	
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("�����ɹ���");
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>