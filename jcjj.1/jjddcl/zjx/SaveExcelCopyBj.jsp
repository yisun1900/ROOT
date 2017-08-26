<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] bclx=request.getParameterValues("bclx");
String[] bjmc=request.getParameterValues("bjmc");
String[] bchd=request.getParameterValues("bchd");
String[] cd=request.getParameterValues("cd");
String[] kd=request.getParameterValues("kd");
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
		ls_sql="delete from jc_gtbjmx ";
		ls_sql+=" where gtxh='"+gtxh+"' and ddbh='"+ddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	long maxbjxh=0;
	ls_sql="select NVL(max(bjxh),0)";
	ls_sql+=" from  jc_gtbjmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		maxbjxh=rs.getLong(1);
	}
	rs.close();
	ps.close();

	maxbjxh++;

	for (int i=0;i<bjmc.length ;i++ )
	{
		double dj=java.lang.Double.parseDouble(bzdj[i].trim());
		double je=java.lang.Double.parseDouble(zqje[i].trim());

		ls_sql="insert into jc_gtbjmx ( bjxh,gtxh,ddbh,bjmc,bcpp,bchd,bzdj,khdj,cd,kd,sl,zqje,je,bz,pxxh ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,ROUND(?,"+jcddmxblxs+"),?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,maxbjxh);
		ps.setString(2,gtxh);
		ps.setString(3,ddbh);
		ps.setString(4,cf.GB2Uni(bjmc[i]));
		ps.setString(5,cf.GB2Uni(bclx[i]));
		ps.setString(6,bchd[i]);
		ps.setDouble(7,dj);
		ps.setDouble(8,dj*jjzkl/10);
		ps.setString(9,cd[i]);
		ps.setString(10,kd[i]);
		ps.setString(11,sl[i]);
		ps.setDouble(12,je);
		ps.setDouble(13,je*jjzkl/10);
		ps.setString(14,cf.GB2Uni(bz[i]));
		ps.setInt(15,(i+1));
		ps.executeUpdate();
		ps.close();

		maxbjxh++;
	}



	//��Ĳ��ֽ��
	double bcbfje=0;
	double zqbcbfje=0;
	ls_sql="select sum(je),sum(zqje)";
	ls_sql+=" from  jc_gtbjmx";
	ls_sql+=" where gtxh='"+gtxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bcbfje=rs.getDouble(1);
		zqbcbfje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="update jc_jjgtmx set bcbfje=ROUND(?,"+jcddmxblxs+"),zqbcbfje=?,zj=pjbfje+ROUND(?,"+jcddmxblxs+"),zqzj=zqpjbfje+? ";
	ls_sql+=" where gtxh='"+gtxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,bcbfje);
	ps.setDouble(2,zqbcbfje);
	ps.setDouble(3,bcbfje);
	ps.setDouble(4,zqbcbfje);
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