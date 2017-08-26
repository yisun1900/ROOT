<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String[] zcmc=request.getParameterValues("zcmc");
String[] jldwbm=request.getParameterValues("jldwbm");
String[] bz=request.getParameterValues("bz");
String[] djStr=request.getParameterValues("dj");
String[] slStr=request.getParameterValues("sl");
String[] jeStr=request.getParameterValues("je");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	int xh=0;
	ls_sql="select max(xh)";
	ls_sql+=" from  bj_zcbjmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	xh++;

	conn.setAutoCommit(false);


	for (int i=0;i<zcmc.length ;i++ )
	{
		if (zcmc[i].equals(""))
		{
			continue;
		}

		if (zcmc[i].equals(""))
		{
			conn.rollback();
			out.println("��["+(i+1)+"]�г���[��������]Ϊ��");
			return;
		}
		if (jldwbm[i].equals(""))
		{
			conn.rollback();
			out.println("��["+(i+1)+"]�г���[������λ]Ϊ��");
			return;
		}
		if (slStr[i].equals(""))
		{
			conn.rollback();
			out.println("��["+(i+1)+"]�г���[����]Ϊ��");
			return;
		}
		if (djStr[i].equals(""))
		{
			conn.rollback();
			out.println("��["+(i+1)+"]�г���[����]Ϊ��");
			return;
		}
		if (jeStr[i].equals(""))
		{
			conn.rollback();
			out.println("��["+(i+1)+"]�г���[���]Ϊ��");
			return;
		}
		if (bz[i].equals(""))
		{
			conn.rollback();
			out.println("��["+(i+1)+"]�г���[���/�ͺ�/Ʒ��]Ϊ��");
			return;
		}

		double dj=0;
		double sl=0;
		double je=0;

		try {
			sl=Double.parseDouble(slStr[i]);
		}
		catch (Exception e) {
			conn.rollback();
			out.println("��["+(i+1)+"]�г���[����]��������:"+slStr[i]);
			return;
		}
		try {
			dj=Double.parseDouble(djStr[i]);
		}
		catch (Exception e) {
			conn.rollback();
			out.println("��["+(i+1)+"]�г���[����]��������:"+djStr[i]);
			return;
		}
		try {
			je=Double.parseDouble(jeStr[i]);
		}
		catch (Exception e) {
			conn.rollback();
			out.println("��["+(i+1)+"]�г���[���]��������:"+jeStr[i]);
			return;
		}

		ls_sql="insert into bj_zcbjmx (xh,khbh,zcmc,jldwbm,dj,sl,je,bz) values("+(xh+i)+",'"+khbh+"','"+cf.GB2Uni(zcmc[i])+"','"+cf.GB2Uni(jldwbm[i])+"','"+dj+"','"+sl+"','"+je+"','"+cf.GB2Uni(bz[i])+"') ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	}


	//��ʼ��
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	//���������շ���Ŀ�������շѰٷֱ�
	dzbj.updateSfxm(conn,khbh,"hmy");
	//��ȡ���ӱ��۽��
	double dzbjze=dzbj.getAllBjje(conn,khbh,"hmy");


	//�޸ģ����ӱ����ܶ�
	ls_sql="update crm_zxkhxx set dzbjze=?,sfzdzbj='Y'";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.executeUpdate();
	ps.close();

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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>