<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String bjjb=request.getParameter("bjjb");
String ssfgs=request.getParameter("ssfgs");
String dqbm=request.getParameter("dqbm");
String czfs=request.getParameter("czfs");
String[] jgwzbm=request.getParameterValues("jgwzbm");
String[] xmbh=request.getParameterValues("xmbh");
String[] sl=request.getParameterValues("sl");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int count=0;

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

	if (czfs.equals("1"))//1:�滻ԭ����
	{
		ls_sql=" delete from bj_bjxmmx ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql=" delete from bj_fjxx ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql=" delete from bj_gclmx ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	//������Ϣ��������������������������������������ʼ
	int xuhao=0;
	ls_sql="select NVL(max(xuhao),0)";
	ls_sql+=" from  bj_fjxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xuhao=rs.getInt(1);
	}
	rs.close();
	ps.close();

	int js=0;
	for (int i=0;i<jgwzbm.length ;i++ )
	{
		count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  bj_fjxx";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)
		{
			js++;

			ls_sql="insert into bj_fjxx (khbh,jgwzbm,xuhao) ";
			ls_sql+=" values( '"+khbh+"','"+cf.GB2Uni(jgwzbm[i])+"',"+(xuhao+js)+")";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

	}
	//������Ϣ����������������������������������������������


	//������Ŀ��ϸ��������������������������������������ʼ
	long xh=0;
	ls_sql="select NVL(max(xh),0)";
	ls_sql+=" from  bj_bjxmmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getLong(1);
	}
	rs.close();
	ps.close();

	int xmpx=0;
	ls_sql="select NVL(max(xmpx),0)";
	ls_sql+=" from  bj_bjxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xmpx=rs.getInt(1);
	}
	rs.close();
	ps.close();

	js=0;
	for (int i=0;i<xmbh.length ;i++ )
	{
		count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_jzbjb";
		ls_sql+=" where xmbh='"+cf.GB2Uni(xmbh[i])+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)//��Ŀ��Ų�����
		{
			conn.rollback();
			out.println("<BR>��["+(i+1)+"]�д�����Ŀ���["+cf.GB2Uni(xmbh[i])+"]������");
			return;
		}

		count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  bj_bjxmmx";
		ls_sql+=" where khbh='"+khbh+"' and xmbh='"+cf.GB2Uni(xmbh[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)
		{
			js++;

			ls_sql="insert into bj_bjxmmx (xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,dj,gycl,dqbm,bjjb,bjlx,xmlx,cbenj,sgdbj,jzbz,ckxm,xmpx,sfxycl ) ";
			ls_sql+=" select "+(xh+js)+",'"+khbh+"',xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,bj,gycl,dqbm,bjjbbm,bjlx,'1',cbenj,sgdbj,'1',ckxm,"+(xmpx+js)+",'2'";//1����Ҫ��2������Ҫ
			ls_sql+=" from bj_jzbjb ";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and xmbh='"+cf.GB2Uni(xmbh[i])+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

	}
	//������Ŀ��ϸ������������������������������������������������


	//��������ϸ������������������������������������������������ʼ
	for (int i=0;i<sl.length ;i++ )
	{
		try{
			Double.parseDouble(sl[i]);
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>��["+(i+1)+"]�С���Ŀ���["+cf.GB2Uni(xmbh[i])+"]���󣡹�����["+cf.GB2Uni(sl[i])+"]��������");
			return;
		}

		count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  bj_gclmx";
		ls_sql+=" where khbh='"+khbh+"' and xmbh='"+cf.GB2Uni(xmbh[i])+"' and jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();


		if (count==0)
		{
			int fjnxh=0;
			ls_sql="select NVL(max(fjnxh),0)";
			ls_sql+=" from  bj_gclmx";
			ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				fjnxh=rs.getInt(1);
			}
			rs.close();
			ps.close();

			fjnxh++;

			ls_sql="insert into bj_gclmx (khbh,dqbm,xmbh,jgwzbm,sl,fjnxh)";
			ls_sql+=" values( '"+khbh+"','"+dqbm+"','"+cf.GB2Uni(xmbh[i])+"','"+cf.GB2Uni(jgwzbm[i])+"',"+sl[i]+","+sl[i]+",0,'N',"+fjnxh+")";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="update bj_gclmx set sl="+sl[i][i];
			ls_sql+=" where khbh='"+khbh+"' and xmbh='"+cf.GB2Uni(xmbh[i])+"' and jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

	}
	//��������ϸ��������������������������������������������������




	//��ʼ��
	dzbj.Dzbj dzbj=new dzbj.Dzbj();

	//���±����ۿ�
	dzbj.updateBjZkl(conn,khbh,"yz");
	//���������շ���Ŀ�������շѰٷֱ�
	dzbj.updateSfxm(conn,khbh,"yz");
	//��ȡ���ӱ��۽��
	double dzbjze=dzbj.getAllBjje(conn,khbh,"yz");


	//�޸ģ����ӱ����ܶ�
	ls_sql="update crm_zxkhxx set sfzdzbj='Y',dzbjze=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.executeUpdate();
	ps.close();

	double zcbjje=0;
	ls_sql="SELECT sum(je)";
	ls_sql+=" FROM bj_zcbjmx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcbjje=rs.getDouble(1);
	}
	rs.close();
	ps.close();
		
	//�޸ģ����ӱ����ܶ�
	ls_sql="update crm_zxkhxx set zcbjje=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zcbjje);
	ps.executeUpdate();
	ps.close();


	conn.commit();

	out.println("<BR>���̳ɹ���");

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