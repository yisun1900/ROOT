<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	String getzxzt=null;//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ��
	String bjbbh=null;
	String ssfgs=null;
	String hxbm=null;
	String bjjb=null;
	ls_sql="SELECT zxzt,bjbbh,ssfgs,hxbm,bjjb";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
		bjbbh=rs.getString("bjbbh");
		ssfgs=rs.getString("ssfgs");
		hxbm=rs.getString("hxbm");
		bjjb=rs.getString("bjjb");
	}
	rs.close();
	ps.close();


	String lx="";
	ls_sql="select lx";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" where bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lx=rs.getString("lx");
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

	String dqbm=null;
	ls_sql="SELECT dqbm";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	//�ͻ�������ĿС��
	ls_sql="delete from bj_khzcxmxj";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (lx.equals("1"))//1�����ײͣ�2���ײ�
	{
	}
	else//�ײͣ���Ҫȡ���ײͱ�׼������Ŀ���ײͱ�׼������Ŀ
	{
		//���ӿͻ�������ĿС�ƣ���Դ���ײͱ�׼������Ŀ������������������������������ʼ
		ls_sql="insert into bj_khzcxmxj (khbh,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,bzsl,sfxzsl,ccbfjj,sjsl,sjjshsl,xjjsl,khbjjbbm,bjjbbm,sfyqxtpp) "; 
		ls_sql+=" select ?,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,bzsl,sfxzsl,ccbfjj,0,0,0,bjjbbm,bjjbbm,sfyqxtpp";
		ls_sql+=" from bj_tcbzzcxm";
		ls_sql+=" where bj_tcbzzcxm.dqbm='"+dqbm+"' and bj_tcbzzcxm.bjjbbm='"+bjjb+"' and bj_tcbzzcxm.bjbbh='"+bjbbh+"'";
		ls_sql+=" and bj_tcbzzcxm.hxbm='"+hxbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.executeUpdate();
		ps.close();

		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  bj_khzcxmxj";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count==0)
		{
			conn.rollback();
			out.println("���󣡡��ײͱ�׼������Ŀ��δ��ʼ��");
			return;
		}
		//���ӿͻ�������ĿС�ƣ���Դ���ײͱ�׼������Ŀ����������������������������������



		String jgwzbm=null;
		String cpbm=null;
		String tccplbbm=null;
		String clxlmc=null;
		ls_sql="select jgwzbm,cpbm,tccplbbm,clxlmc";
		ls_sql+=" from  bj_khzcxm,jxc_clxlbm";
		ls_sql+=" where bj_khzcxm.tccplbbm=jxc_clxlbm.clxlbm and bj_khzcxm.khbh='"+khbh+"'";
		ls_sql+=" order by jgwzbm,cpbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			jgwzbm=rs1.getString("jgwzbm");
			cpbm=rs1.getString("cpbm");
			tccplbbm=rs1.getString("tccplbbm");//�ײͲ�Ʒ������
			clxlmc=rs1.getString("clxlmc");
				
			String sfxzsl="";//�Ƿ���������
			double bzsl=0;//��׼����
			String tcsjflbm="";
			ls_sql="select sfxzsl,bzsl,tcsjflbm";
			ls_sql+=" FROM bj_khzcxmxj";
			ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
				tcsjflbm=cf.fillNull(rs.getString("tcsjflbm"));
				bzsl=rs.getDouble("bzsl");
			}
			rs.close();
			ps.close();

			String sfyqxtpp="";//�Ƿ�Ҫ����ͬƷ��
			ls_sql="select sfyqxtpp";
			ls_sql+=" FROM bj_khzcxmxj";
			ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sfyqxtpp=cf.fillNull(rs.getString("sfyqxtpp"));
			}
			rs.close();
			ps.close();
				
			if (sfyqxtpp.equals("Y"))//�Ƿ�Ҫ����ͬƷ�� :Y���ǣ�N����
			{
				int ppsl=0;
				ls_sql="select count(distinct ppmc)";
				ls_sql+=" FROM bj_khzcxm";
				ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					ppsl=rs.getInt(1);
				}
				rs.close();
				ps.close();

				if (ppsl>1)
				{
					conn.rollback();
					out.println("���󣡴����ֻ��ѡ��ͬһƷ������");
					return;
				}
			}

			double sjsl=0;
			double sjjshsl=0;
			double xjjsl=0;
			ls_sql="select sum(sl),sum(ROUND(sl*(100+sh)/100,2))";
			ls_sql+=" FROM bj_khzcxm";
			ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sjsl=rs.getDouble(1);
				sjjshsl=rs.getDouble(2);
			}
			rs.close();
			ps.close();

			if (sfxzsl.equals("1"))//�Ƿ���������  1�������2���������3��������
			{
				if (sjsl>bzsl)
				{
					xjjsl=sjsl-bzsl;
				}
			}
			else if (sfxzsl.equals("2"))//�Ƿ���������  1�������2���������3��������
			{
				if (sjsl>bzsl)
				{
					conn.rollback();
					out.println("���󣡲������ʵ������["+sjsl+"]���ܳ�����׼����["+bzsl+"]:"+jgwzbm+"��"+clxlmc);
					return;
				}
			}


			ls_sql="update bj_khzcxmxj set sjsl="+sjsl+",sjjshsl="+sjjshsl+",xjjsl="+xjjsl;
			ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			double tcslxz=0;//�ײ���������
			clxlmc="";
			String getsfxzsl="";//�Ƿ���������  1�������ƣ�2�����ܳ�����3���ɳ�����Ӽ�
			ls_sql="select tcslxz,clxlmc,sfxzsl";
			ls_sql+=" FROM jxc_clxlbm";
			ls_sql+=" where clxlbm='"+tccplbbm+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				tcslxz=rs.getDouble("tcslxz");
				clxlmc=cf.fillNull(rs.getString("clxlmc"));
				getsfxzsl=cf.fillNull(rs.getString("sfxzsl"));
			}
			rs.close();
			ps.close();

			double xlsjsl=0;
			double xlsjjshsl=0;
			ls_sql="select sum(sl),sum(ROUND(sl*(100+sh)/100,2))";
			ls_sql+=" FROM bj_khzcxm";
			ls_sql+=" where khbh='"+khbh+"' and tccplbbm='"+tccplbbm+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				xlsjsl=rs.getDouble(1);
				xlsjjshsl=rs.getDouble(2);
			}
			rs.close();
			ps.close();

			if (getsfxzsl.equals("2"))//1�������ƣ�2�����ܳ�����3���ɳ�����Ӽ�
			{
				if (xlsjsl>tcslxz)
				{
					conn.rollback();
					out.println("�������"+clxlmc+"��������������������["+xlsjsl+"]���ܳ�����������["+tcslxz+"]");
					return;
				}
			}

		}
		rs1.close();
		ps1.close();
	
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
	alert("ɾ���ɹ���");
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
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

