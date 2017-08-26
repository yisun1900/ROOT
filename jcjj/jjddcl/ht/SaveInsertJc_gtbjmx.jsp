<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String gtxh=cf.GB2Uni(request.getParameter("gtxh"));
String ddbh=cf.GB2Uni(request.getParameter("ddbh"));

String[] bjxh=request.getParameterValues("bjxh");
String[] bcpp=request.getParameterValues("bcpp");
String[] bjmc=request.getParameterValues("bjmc");
String[] bchdstr=request.getParameterValues("bchd");
String[] cdstr=request.getParameterValues("cd");
String[] kdstr=request.getParameterValues("kd");
String[] slstr=request.getParameterValues("sl");
String[] bzdjstr=request.getParameterValues("bzdj");
String[] jestr=request.getParameterValues("je");
String[] bz=request.getParameterValues("bz");

int bchd=0;
double bzdj=0;
int cd=0;
int kd=0;
int sl=0;
double je=0;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double dj=0;
double xhl=0;

try {
	conn=cf.getConnection();

	String fgsbh=null;
	String clzt=null;
	double jjzkl=0;
	ls_sql="select fgsbh,clzt,jjzkl";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
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
	if (!clzt.equals("13"))
	{
		out.println("�����󣬴���״̬����ȷ");
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

	String insql="";
	for (int i=0;i<bjxh.length ;i++ )
	{
		if (!bjxh[i].equals(""))
		{
			insql+=",'"+bjxh[i]+"'";
		}
	}

	if (!insql.equals(""))
	{
		insql=insql.substring(1);
	}

	conn.setAutoCommit(false);

	//ִ��ɾ��
	if (insql.equals(""))
	{
		ls_sql="delete from jc_gtbjmx ";
		ls_sql+=" where gtxh='"+gtxh+"' and ddbh='"+ddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql="delete from jc_gtbjmx ";
		ls_sql+=" where gtxh='"+gtxh+"' and ddbh='"+ddbh+"'";
		ls_sql+=" and bjxh not in ("+insql+")";
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
		if (bjmc[i].equals(""))
		{
			continue;
		}

		//[�������]
		if (bcpp[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ����["+(i+1)+"]��[�������]Ϊ��");
			return;
		}
		//[��ĺ��]
		if (bchdstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ����["+(i+1)+"]��[��ĺ��]Ϊ��");
			return;
		}
		try{
			bchd=java.lang.Integer.parseInt(bchdstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>����ʧ�ܣ����["+(i+1)+"]��[��ĺ��]���벻��ȷ:"+bchdstr[i].trim());
			return;
		}

		//[����]
		if (cdstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ����["+(i+1)+"]��[����]Ϊ��");
			return;
		}
		try{
			cd=java.lang.Integer.parseInt(cdstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>����ʧ�ܣ����["+(i+1)+"]��[����]���벻��ȷ:"+cdstr[i].trim());
			return;
		}

		//[���]
		if (kdstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ����["+(i+1)+"]��[���]Ϊ��");
			return;
		}
		try{
			kd=java.lang.Integer.parseInt(kdstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>����ʧ�ܣ����["+(i+1)+"]��[���]���벻��ȷ:"+kdstr[i].trim());
			return;
		}

		//[����]
		if (slstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ����["+(i+1)+"]��[����]Ϊ��");
			return;
		}
		try{
			sl=java.lang.Integer.parseInt(slstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>����ʧ�ܣ����["+(i+1)+"]��[����]���벻��ȷ:"+slstr[i].trim());
			return;
		}

		//[����]
		if (bzdjstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ����["+(i+1)+"]��[����]Ϊ��");
			return;
		}
		try{
			bzdj=java.lang.Double.parseDouble(bzdjstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>����ʧ�ܣ����["+(i+1)+"]��[����]���벻��ȷ:"+bzdjstr[i].trim());
			return;
		}

		//[���]
		if (jestr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ����["+(i+1)+"]��[���]Ϊ��");
			return;
		}
		try{
			je=java.lang.Double.parseDouble(jestr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>����ʧ�ܣ����["+(i+1)+"]��[���]���벻��ȷ:"+jestr[i].trim());
			return;
		}

		int count=0;
		if (!bjxh[i].equals(""))
		{
			ls_sql="select count(*)";
			ls_sql+=" from  jc_gtbjmx";
			ls_sql+=" where bjxh="+bjxh[i];
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();
		}

		if (count>0)//
		{
			ls_sql="update jc_gtbjmx set bjmc=?,bcpp=?,bchd=?,bzdj=?,khdj=?,cd=?,kd=?,sl=?,zqje=?,je=ROUND(?,"+jcddmxblxs+"),bz=?,pxxh=? ";
			ls_sql+=" where bjxh="+bjxh[i];
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,cf.GB2Uni(bjmc[i]));
			ps.setString(2,cf.GB2Uni(bcpp[i]));
			ps.setInt(3,bchd);
			ps.setDouble(4,bzdj);
			ps.setDouble(5,bzdj*jjzkl/10);
			ps.setInt(6,cd);
			ps.setInt(7,kd);
			ps.setInt(8,sl);
			ps.setDouble(9,je);
			ps.setDouble(10,je*jjzkl/10);
			ps.setString(11,cf.GB2Uni(bz[i]));
			ps.setInt(12,(i+1));
			ps.executeUpdate();
			ps.close();

		}
		else{
			ls_sql="insert into jc_gtbjmx ( bjxh,gtxh,ddbh,bjmc,bcpp,bchd,bzdj,khdj,cd,kd,sl,zqje,je,bz,pxxh ) ";
			ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,ROUND(?,"+jcddmxblxs+"),?,? ) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,maxbjxh);
			ps.setString(2,gtxh);
			ps.setString(3,ddbh);
			ps.setString(4,cf.GB2Uni(bjmc[i]));
			ps.setString(5,cf.GB2Uni(bcpp[i]));
			ps.setInt(6,bchd);
			ps.setDouble(7,bzdj);
			ps.setDouble(8,bzdj*jjzkl/10);
			ps.setInt(9,cd);
			ps.setInt(10,kd);
			ps.setInt(11,sl);
			ps.setDouble(12,je);
			ps.setDouble(13,je*jjzkl/10);
			ps.setString(14,cf.GB2Uni(bz[i]));
			ps.setInt(15,(i+1));
			ps.executeUpdate();
			ps.close();

			maxbjxh++;
		}

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
	
	
	//�������ܼƣ�������������������������������ʼ

	double jjje=0;
	double cpjjje=0;
	double xcmje=0;
	double htze=0;

	double zqjjje=0;
	double zqcpjjje=0;
	double zqxcmje=0;
	double wdzje=0;

	//�Ҿߺ�ͬ���
	ls_sql="select sum(zj),sum(zqzj)";
	ls_sql+=" from  jc_jjgtmx";
	ls_sql+=" where ddbh='"+ddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jjje=rs.getDouble(1);
		zqjjje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	//��Ʒ�Ҿߺ�ͬ���
	ls_sql="select sum(zj),sum(zqzj)";
	ls_sql+=" from  jc_cpjjddmx";
	ls_sql+=" where ddbh='"+ddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cpjjje=rs.getDouble(1);
		zqcpjjje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	//�Ͳ��ź�ͬ���
	ls_sql="select sum(zj),sum(zqzj)";
	ls_sql+=" from  jc_jjxcmmx";
	ls_sql+=" where ddbh='"+ddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xcmje=rs.getDouble(1);
		zqxcmje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	//��ͬ�ܶ�
	htze=jjje+xcmje+cpjjje;
	wdzje=zqjjje+zqxcmje+zqcpjjje;

	ls_sql="update jc_jjdd set jjje=ROUND(?,"+jcddmxblxs+"),xcmje=ROUND(?,"+jcddmxblxs+"),cpjjje=ROUND(?,"+jcddmxblxs+"),htze=ROUND(?,"+jcddblxs+")   ,zqjjje=?,zqxcmje=?,zqcpjjje=?,wdzje=? ";
	ls_sql+="          ,jjzjje=ROUND(?,"+jcddmxblxs+"),xcmzjje=ROUND(?,"+jcddmxblxs+"),cpjjzjje=ROUND(?,"+jcddmxblxs+"),zjhze=ROUND(?,"+jcddblxs+")   ,zqjjzjje=?,zqxcmzjje=?,zqcpjjzjje=?,zqzjhze=?";
    ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,jjje);
	ps.setDouble(2,xcmje);
	ps.setDouble(3,cpjjje);
	ps.setDouble(4,htze);

	ps.setDouble(5,zqjjje);
	ps.setDouble(6,zqxcmje);
	ps.setDouble(7,zqcpjjje);
	ps.setDouble(8,wdzje);

	ps.setDouble(9,jjje);
	ps.setDouble(10,xcmje);
	ps.setDouble(11,cpjjje);
	ps.setDouble(12,htze);

	ps.setDouble(13,zqjjje);
	ps.setDouble(14,zqxcmje);
	ps.setDouble(15,zqcpjjje);
	ps.setDouble(16,wdzje);

	ps.executeUpdate();
	ps.close();

	//���ɶ���
	ls_sql="update jc_jcdd set zqje=?,zhje=ROUND(?,"+jcddblxs+")";
	ls_sql+=" where ddbh='"+ddbh+"' and lx='3' and czlx='1'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,wdzje);
	ps.setDouble(2,htze);
	ps.executeUpdate();
	ps.close();

	//�������ܼƣ���������������������������������


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
	out.print("Exception: " + e);
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