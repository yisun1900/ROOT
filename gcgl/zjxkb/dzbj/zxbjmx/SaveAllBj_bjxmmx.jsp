<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");
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

	conn.setAutoCommit(false);

	for (int i=0;i<xh.length ;i++ )
	{
		ls_sql="SELECT dqbm,xmbh";
		ls_sql+=" FROM bj_bjxmmxh ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xh="+xh[i];
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


		ls_sql="SELECT jgwzbm,bj_fjxxh.xuhao";
		ls_sql+=" FROM bj_fjxxh ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"'";
		ls_sql+=" order by bj_fjxxh.xuhao ";
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
				ls_sql="delete from bj_gclmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xmbh='"+xmbh+"' and jgwzbm='"+jgwzbm+"'";
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
			ls_sql+=" FROM bj_gclmxh ";
			ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xmbh='"+xmbh+"' and jgwzbm='"+jgwzbm+"'";
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
				ls_sql="update bj_gclmxh set sl="+sl+",sl="+sl;
				ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xmbh='"+xmbh+"' and jgwzbm='"+jgwzbm+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
			else{
				ls_sql="insert into bj_gclmxh(zjxxh,khbh,dqbm,xmbh,jgwzbm,sl,sl,wcl,bjbz)";
				ls_sql+=" values('"+zjxxh+"','"+khbh+"','"+dqbm+"','"+xmbh+"','"+jgwzbm+"',"+sl+","+sl+",0,'N') ";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}


		}
		rs.close();
		ps.close();
	}

/*
	//��ʼ��
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
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
*/

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