<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String[] xh=request.getParameterValues("xh");

double dj=0;
double sl=0;
String[] ls=null;
String[] oldjgwzmc=null;
String dqbm=null;
String xmbh=null;
String jgwzbm=null;
String xuhao=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String getzxzt=null;//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ��
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

	for (int i=0;i<xh.length ;i++ )
	{
		ls_sql="SELECT dqbm,xmbh";
		ls_sql+=" FROM bj_bjxmmx ";
		ls_sql+=" where khbh='"+khbh+"' and xh="+xh[i];
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			dqbm=rs.getString("dqbm");
			xmbh=rs.getString("xmbh");
		}
		else{
			rs.close();
			ps.close();

			conn.rollback();
			out.println("<BR>��Ŀ���Ϊ["+xmbh+"]����Ŀ�����ڣ������ѱ�ɾ��");
			return;
		}
		rs.close();
		ps.close();


		ls_sql="SELECT jgwzbm,bj_fjxx.xuhao";
		ls_sql+=" FROM bj_fjxx ";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" order by bj_fjxx.xuhao ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			xuhao=rs.getString("xuhao");
			jgwzbm=rs.getString("jgwzbm");

			ls=request.getParameterValues("C"+xuhao);
			oldjgwzmc=request.getParameterValues("CN"+xuhao);

			if (ls[i].trim().equals("") )
			{
				ls_sql="delete from bj_gclmx";
				ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"' and jgwzbm='"+jgwzbm+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();

				continue;
			}

			if (!cf.GB2Uni(oldjgwzmc[i]).equals(jgwzbm))
			{
				rs.close();
				ps.close();

				conn.rollback();
				out.println("<BR>����ʧ�ܣ��ṹλ��Ϊ["+cf.GB2Uni(oldjgwzmc[i])+"]�������ѷ����仯");
				return;
			}

			try{
				sl=java.lang.Double.parseDouble(ls[i].trim());
			}
			catch (Exception e){
				rs.close();
				ps.close();

				conn.rollback();
				out.println("<BR>����ʧ�ܣ���Ŀ���Ϊ["+xmbh+"]��[������]���벻��ȷ:"+ls[i].trim());
				return;
			}

			int count=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM bj_gclmx ";
			ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"' and jgwzbm='"+jgwzbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				count=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			if (count>0)
			{
				ls_sql="update bj_gclmx set sl="+sl;
				ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"' and jgwzbm='"+jgwzbm+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
			else{
				ls_sql="insert into bj_gclmx(khbh,dqbm,xmbh,jgwzbm,sl)";
				ls_sql+=" values('"+khbh+"','"+dqbm+"','"+xmbh+"','"+jgwzbm+"',"+sl+") ";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}


		}
		rs.close();
		ps.close();
	}

	//��ʼ��
	dzbj.Dzbj dzbj=new dzbj.Dzbj();

	//���±����ۿ�
	dzbj.updateBjZkl(conn,khbh,"yz");
	//���������շ���Ŀ�������շѰٷֱ�
	dzbj.updateSfxm(conn,khbh,"yz");
	//��ȡ���ӱ��۽��
	double dzbjze=dzbj.getAllBjje(conn,khbh,"yz");

	//�޸ģ����ӱ����ܶ�
	ls_sql="update crm_zxkhxx set dzbjze=?";
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
	out.print("sql: " + ls_sql);
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