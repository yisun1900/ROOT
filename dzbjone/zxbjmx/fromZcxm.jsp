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

	String getzxzt=null;//0��δ������棻1: ������棻2: �����˻ؿͻ���3����ǩԼ��4����˾ǩ��ʧ�ܣ�5�����·������
	String bjbbh=null;
	String ssfgs=null;
	String bjjb=null;
	String hxbm=null;
	ls_sql="SELECT zxzt,bjbbh,ssfgs,bjjb,hxbm";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
		bjbbh=rs.getString("bjbbh");
		ssfgs=rs.getString("ssfgs");
		bjjb=rs.getString("bjjb");
		hxbm=rs.getString("hxbm");
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

	//�ײͣ���Ҫȡ���ײͱ�׼������Ŀ���ײͱ�׼������Ŀ
	if (lx.equals("2"))//1�����ײͣ�2���ײ�
	{
		//�ͻ��ײͼ۸��bj_khtcjgb��
		ls_sql="delete from bj_khtcjgb "; 
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_khtcjgb (khbh,bjbbh,dqbm,bjjbbm,hxbm,tcmc,fwmj,tcjg,pmzjdj,tlgbzjj)"; 
		ls_sql+=" select ?,bjbbh,dqbm,bjjbbm,hxbm,tcmc,fwmj,tcjg,pmzjdj,tlgbzjj";
		ls_sql+=" from bj_tcjgb";
		ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and hxbm='"+hxbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.executeUpdate();
		ps.close();

		//�ͻ�����С����������
		ls_sql="delete from bj_khclxlxz "; 
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_khclxlxz (khbh,clxlbm,clxlmc,sfxzsl,tcslxz,ccbfjj,sfkjm,yxjmzdsl)"; 
		ls_sql+=" select ?,clxlbm,clxlmc,sfxzsl,tcslxz,ccbfjj,sfkjm,yxjmzdsl";
		ls_sql+=" from jxc_clxlbm";
		ls_sql+=" where sfxzsl!='1' OR sfkjm!='1'";//1�������ƣ�2�����ܳ�����3���ɳ�����Ӽ� ;  1�������ƣ�2������
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.executeUpdate();
		ps.close();

		//���ӿͻ�������ĿС�ƣ���Դ���ײͱ�׼������Ŀ������������������������������ʼ

		ls_sql="insert into bj_khzcxmxj (khbh,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,jldw,sfxzsl,bzsl,sfkjm,jmfl,jmjldw,yxjmzdsl,jmdj,sfkgh,khzdsl,ghzj,sfyqxtpp,sjsl,sjjshsl,sjjmsl,sjjmje,khbjjbbm,bjjbbm,sjsfycx,sjsfsl,sjcj,sjsfje)"; 
		ls_sql+=" select                 ?   ,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,jldw,sfxzsl,bzsl,sfkjm,jmfl,jmjldw,yxjmzdsl,jmdj,sfkgh,khzdsl,ghzj,sfyqxtpp,0   ,0      ,0     ,0     ,bjjbbm  ,bjjbbm,'1'    ,0     ,0   ,0";//1���޴�����2�����������ƴ�����3�����������ƴ���
		ls_sql+=" from bj_tcbzzcxm";
		ls_sql+=" where bj_tcbzzcxm.dqbm='"+dqbm+"' and bj_tcbzzcxm.bjjbbm='"+bjjb+"'";
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


		//ɾ������Χ���ģ�������������������������ʼ
		//������䲻��������
		ls_sql="delete from bj_khzcxm ";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm not in(select distinct jgwzbm from bj_khzcxmxj where khbh='"+khbh+"')";
		ls_sql+=" and zclx in('1','2')";//1���ײ��ڣ�2���ײ��⣻3��������ꣻ4�������
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//������䣺��𲻴�������
		String jgwzbm=null;
		ls_sql="select distinct jgwzbm";
		ls_sql+=" FROM bj_khzcxmxj";
		ls_sql+=" where  khbh='"+khbh+"'";
		ls_sql+=" order by jgwzbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			jgwzbm=rs1.getString("jgwzbm");

			ls_sql="delete from bj_khzcxm ";
			ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
			ls_sql+=" and tccplbbm not in(select distinct tccplbbm from bj_khzcxmxj where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"')";
			ls_sql+=" and zclx in('1','2')";//1���ײ��ڣ�2���ײ��⣻3��������ꣻ4�������
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		rs1.close();
		ps1.close();
		//ɾ������Χ���ģ���������������������������


		//��飺�Ƿ�Ҫ����ͬƷ�ƣ�������������������������ʼ
		String tcsjflbm="";
		String sfyqxtpp="";//�Ƿ�Ҫ����ͬƷ��
		ls_sql="select distinct jgwzbm,tcsjflbm,sfyqxtpp";
		ls_sql+=" FROM bj_khzcxmxj";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" order by jgwzbm,tcsjflbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			jgwzbm=rs1.getString("jgwzbm");
			tcsjflbm=cf.fillNull(rs1.getString("tcsjflbm"));
			sfyqxtpp=cf.fillNull(rs1.getString("sfyqxtpp"));

				
			if (sfyqxtpp.equals("Y"))//�Ƿ�Ҫ����ͬƷ�� :Y���ǣ�N����
			{
				int ppsl=0;
				ls_sql="select count(distinct ppmc)";
				ls_sql+=" FROM bj_khzcxm";
				ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm in (select tccplbbm from bj_khzcxmxj where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"' and sfyqxtpp='Y')";
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
		}
		rs1.close();
		ps1.close();
		//��飺�Ƿ�Ҫ����ͬƷ�ƣ���������������������������


		//��飺С���������ܣ�������������������������ʼ
		String tccplbbm=null;
		String clxlmc=null;
		String sfxzsl="";//�Ƿ���������
		double bzsl=0;//��׼����
		ls_sql="select jgwzbm,bj_khzcxmxj.tccplbbm,clxlmc,bj_khzcxmxj.sfxzsl,bj_khzcxmxj.bzsl";
		ls_sql+=" FROM bj_khzcxmxj,jxc_clxlbm";
		ls_sql+=" where bj_khzcxmxj.tccplbbm=jxc_clxlbm.clxlbm and khbh='"+khbh+"'";
		ls_sql+=" order by jgwzbm,bj_khzcxmxj.tccplbbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			jgwzbm=rs1.getString("jgwzbm");
			tccplbbm=rs1.getString("tccplbbm");//�ײͲ�Ʒ������
			clxlmc=rs1.getString("clxlmc");

			sfxzsl=cf.fillNull(rs1.getString("sfxzsl"));
			bzsl=rs1.getDouble("bzsl");

				
			//����С�೬����飺��������������������������ʼ
			double sjsl=0;//ʵ������
			double sjjshsl=0;//ʵ�ʼ��������
			ls_sql="select sum(sl),sum(ROUND(sl*(100+sh)/100,2))";
			ls_sql+=" FROM bj_khzcxm";
			ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1���ײ��ڣ�2���ײ��⣻3��������ꣻ4�������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sjsl=rs.getDouble(1);
				sjjshsl=rs.getDouble(2);
			}
			rs.close();
			ps.close();

			if (sfxzsl.equals("2"))//1:������Ӽ�;2:���ɳ���;3:����������
			{
				if (sjsl>bzsl)
				{
					conn.rollback();
					out.println("���󣡲��ɳ�����["+jgwzbm+"]["+clxlmc+"]ʵ������["+sjsl+"]���ܳ�����׼����["+bzsl+"]");
					return;
				}
			}
			//����С�೬����飺����������������������������

			//�ͻ�����С�ƻ��ܣ���������������������������ʼ
			double sjsfsl=sjsl;//�����շ�����

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

			ls_sql="update bj_khzcxmxj set sjsl="+sjsl+",sjjshsl="+sjjshsl;
			ls_sql+=" ,sjsfsl="+sjsfsl+",sjsfje=sjcj*"+sjsfsl;
			ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			//�ͻ�����С�ƻ��ܣ�����������������������������

			//��飺С���������ƣ���������������������������ʼ
			double tcslxz=0;//�ײ���������
			clxlmc="";
			String getsfxzsl="";//�Ƿ���������  1�������ƣ�2�����ܳ�����3���ɳ�����Ӽ�
			ls_sql="select tcslxz,clxlmc,sfxzsl";
			ls_sql+=" FROM bj_khclxlxz";
			ls_sql+=" where khbh='"+khbh+"' and clxlbm='"+tccplbbm+"'";
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
			ls_sql+=" where khbh='"+khbh+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1���ײ��ڣ�2���ײ����շѣ�3�����
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
					out.println("<P>���"+clxlmc+"����Ʒѡ�����£�");
					String getjgwzbm=null;
					String getcpmc=null;
					String getxh=null;
					double getsl=0;
					ls_sql="select jgwzbm,cpmc,xh,sl";
					ls_sql+=" FROM bj_khzcxm";
					ls_sql+=" where khbh='"+khbh+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1���ײ��ڣ�2���ײ����շѣ�3�����
					ps= conn.prepareStatement(ls_sql);
					rs =ps.executeQuery();
					while (rs.next())
					{
						getjgwzbm=rs.getString("jgwzbm");
						getcpmc=rs.getString("cpmc");
						getxh=rs.getString("xh");
						getsl=rs.getDouble("sl");

						out.println("<BR>λ��:"+getjgwzbm+"����Ʒ����:"+getcpmc+"���ͺ�:"+getxh+"������:"+getsl);
					}
					rs.close();
					ps.close();

					conn.rollback();
					out.println("<P>�������"+clxlmc+"��������������������["+xlsjsl+"]���ܳ�����������["+tcslxz+"]");
					return;
				}
			}
			//��飺С���������ƣ�����������������������������
	
		}
		rs1.close();
		ps1.close();
		//��飺С���������ܣ���������������������������
	
	}


	//����ɾ�������
	ls_sql="delete from bj_gclmx ";
	ls_sql+=" where  khbh='"+khbh+"' and xmbh not in(select xmbh from bj_bjxmmx where khbh='"+khbh+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_gclmx ";
	ls_sql+=" where  khbh='"+khbh+"' and jgwzbm not in(select jgwzbm from bj_fjxx where khbh='"+khbh+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//��ʼ��
	dzbj.Tzk tzk=new dzbj.Tzk();
	//���±����ۿ�
	tzk.updateBjZkl(conn,khbh,"yz");

	//���������շ���Ŀ�������շѰٷֱ�
	dzbj.NewDzbj dzbj=new dzbj.NewDzbj();
	dzbj.updateSfxm(conn,khbh,"yz");

	//��ȡ���ӱ��۽��
	dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();
	double dzbjze=dzbjje.getAllBjje(conn,khbh,"yz");


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
	alert("�����ײͱ�׼������Ŀ�ɹ���");
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

