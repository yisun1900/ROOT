<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"050271")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<%
String fgsbh=request.getParameter("fgsbh");
String khbh=request.getParameter("khbh");
String khbh2=request.getParameter("khbh2");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String hth=null;
	String dwbh=null;
	String sjsbh=null;
	String sjs=null;
	ls_sql="select hth,dwbh,sjsbh,sjs";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  fgsbh='"+fgsbh+"' and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth=rs.getString("hth");
		dwbh=rs.getString("dwbh");
		sjsbh=rs.getString("sjsbh");
		sjs=rs.getString("sjs");
	}
	else{
		rs.close();
		ps.close();

		out.println("���󣡱����ͻ���Ϣ������");
		return;
	}
	rs.close();
	ps.close();

	String hth2=null;
	ls_sql="select hth";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  fgsbh='"+fgsbh+"' and khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth2=rs.getString(1);
	}
	else{
		rs.close();
		ps.close();

		out.println("����ɾ���ͻ���Ϣ������");
		return;
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	//���¼��ɶ�����������������������������������������������������
	ls_sql="update jc_jcdd set fgsbh=?,qddm=?,jzsjs=?,khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.setString(4,khbh);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_mmydd set fgsbh=?,qddm=?,jzsjs=?,khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.setString(4,khbh);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_mmzjx set fgsbh=?,qddm=?,jzsjs=?,khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.setString(4,khbh);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update jc_cgdd set fgsbh=?,qddm=?,jzsjs=?,khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.setString(4,khbh);
	ps.executeUpdate();
	ps.close();
	ls_sql="update jc_cgzjx set fgsbh=?,qddm=?,jzsjs=?,khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.setString(4,khbh);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update jc_jjdd set fgsbh=?,qddm=?,jzsjs=?,khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.setString(4,khbh);
	ps.executeUpdate();
	ps.close();
	ls_sql="update jc_jjzjx set fgsbh=?,qddm=?,jzsjs=?,khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.setString(4,khbh);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update jc_zcdd set fgsbh=?,qddm=?,jzsjs=?,khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.setString(4,khbh);
	ps.executeUpdate();
	ps.close();
	ls_sql="update jc_zcddmx set fgsbh=?,qddm=?,jzsjs=?,khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.setString(4,khbh);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_zczjx set fgsbh=?,qddm=?,jzsjs=?,khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.setString(4,khbh);
	ps.executeUpdate();
	ps.close();
	//���¼��ɶ�������������������������������������������������������������������

	ls_sql="update crm_hthxx set sybz='N',khbh=null ";;
	ls_sql+=" where  hth='"+hth2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_khxxly ";;
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="delete from  crm_khxx ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//�������������������������������������������ʼ
	ls_sql="update crm_zjxdj set khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.executeUpdate();
	ps.close();

	double allzjxje=0;
	double alljzjje=0;
	double allzjxsuijin=0;
	double allzqguanlif=0;
	double allzhguanlif=0;
	double allkglf=0;
	double allkqtk=0;

	ls_sql="select sum(zjje),sum(jzjje),sum(zjxsuijin),sum(zqguanlif),sum(zhguanlif),sum(kglf),sum(kqtk)";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allzjxje=rs.getDouble(1);
		alljzjje=rs.getDouble(2);
		allzjxsuijin=rs.getDouble(3);
		allzqguanlif=rs.getDouble(4);
		allzhguanlif=rs.getDouble(5);
		allkglf=rs.getDouble(6);
		allkqtk=rs.getDouble(7);
	}
	rs.close();
	ps.close();

	ls_sql="update crm_khxx set zjxje=?,zhzjxje=?,zjxsuijin=?,zqzjxguanlif=?,zjxguanlif=?,kglf=?,kqtk=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,allzjxje);
	ps.setDouble(2,alljzjje);
	ps.setDouble(3,allzjxsuijin);
	ps.setDouble(4,allzqguanlif);
	ps.setDouble(5,allzhguanlif);
	ps.setDouble(6,allkglf);
	ps.setDouble(7,allkqtk);
	ps.executeUpdate();
	ps.close();
	//���������������������������������������
	
	//ɾ����ѯ�ͻ���Ϣ
	ls_sql="delete from crm_dmjdjl ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_sjsjdjl ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_zxkhfwjl ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_khxxly ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_zxkhxx ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_dzyhsq ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_dxdzyh ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_cxhdzk ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_cxhdyjxs ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//ɾ�����ӱ��ۣ�������������������������ʼ

	//���ӱ���--��Ŀ��ϸ
	ls_sql="delete from bj_bjxmmx ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//���ӱ���--���Ϸ�����
	ls_sql="delete from bj_khglfxb ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//���ӱ���--������Ϣ
	ls_sql="delete from bj_fjxx ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//���ӱ���--��������ϸ
	ls_sql="delete from bj_gclmx ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//���ӱ���--��������
	ls_sql="delete from bj_zcbjmx ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//���ӱ���--�����շ���Ŀ��ϸ
	ls_sql="delete from bj_sfxmmx ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//ɾ�����ӱ���========================���


	//ɾ����ʱ���ۣ�������������������������ʼ

	//��ʱ����--��Ŀ��ϸ
	ls_sql="delete from bj_mbbjxmmx ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//��ʱ����--���Ϸ�����
	ls_sql="delete from bj_mbglfxb ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//��ʱ����--������Ϣ
	ls_sql="delete from bj_mbfjxx ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//��ʱ����--��������ϸ
	ls_sql="delete from bj_mbgclmx ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//��ʱ����--��������
	ls_sql="delete from bj_mbzcyl ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//��ʱ����--�����շ���Ŀ��ϸ
	ls_sql="delete from bj_mbsfxmmx ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//ɾ����ʱ����========================���


	//�޸Ĳ�����Ϣ��������������������������������ʼ	
	ls_sql="update cw_khfkjl set fgsbh=?,dwbh=?,sjsbh=?,sjs=?,khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjsbh);
	ps.setString(4,sjs);
	ps.setString(5,khbh);
	ps.executeUpdate();
	ps.close();

	//��װ�����+++++++++++++++++++++++++++++++++++++++��ʼ
	double zjxssk=0;
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N' and fkcs in(8)";//8���������

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjxssk=rs.getDouble(1);//������ʵ�տ�
	}
	rs.close();
	ps.close();

	double getsfke=0;//
	java.sql.Date getjzkfksj=null;//��װ����տ�ʱ��
	java.sql.Date getjzkscsj=null;//�״θ���װ��ʱ��
	String getjzkfkxh=null;//��װ����տ����
	int getjzkfkcs=0;//��װ�տ�����
	ls_sql="select sum(fkje),max(sksj),min(sksj),max(fkxh),max(fkcs)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getsfke=rs.getDouble(1);//���չ��̿�
		getjzkfksj=rs.getDate(2);
		getjzkscsj=rs.getDate(3);
		getjzkfkxh=rs.getString(4);
		getjzkfkcs=rs.getInt(5);
	}
	rs.close();
	ps.close();


	//ȡ�����տ����
	double getcwsfke=0;//
	java.sql.Date getcwjzkfksj=null;//�����װ����տ�ʱ��
	java.sql.Date getcwjzkscsj=null;//�����״θ���װ��ʱ��
	String getcwjzkfkxh=null;//�����װ����տ����
	int getcwjzkfkcs=0;//�����װ�տ�����

	ls_sql="select sum(fkje),max(sjsj),min(sjsj),max(fkxh),max(fkcs)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N' ";
	ls_sql+=" and ( skdd='1' OR (skdd='2' and dsksjbz='Y') )";//1�������տ2���ǲ�����տ�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getcwsfke=rs.getDouble(1);//���չ��̿�
		getcwjzkfksj=rs.getDate(2);
		getcwjzkscsj=rs.getDate(3);
		getcwjzkfkxh=rs.getString(4);
		getcwjzkfkcs=rs.getInt(5);
	}
	rs.close();
	ps.close();



	if (getsfke<0)
	{
		out.println("<P>���棡���������տ���Ϊ����������ϸ����Ƿ��д���");
	}

	String setjzwkqs=null;
	int wkcount=0;
	ls_sql="select count(*)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N' and jzwkqs='Y'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wkcount=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (wkcount>0)
	{
		setjzwkqs="Y";
	}
	else{
		setjzwkqs="N";
	}

	ls_sql="update crm_khxx set sfke=?,jzkfkcs=?,jzkfkxh=?,jzkfksj=?,jzkscsj=?   ,cwsfke=?,cwjzkfkcs=?,cwjzkfkxh=?,cwjzkfksj=?,cwjzkscsj=?  ,zjxssk=?,jzwkqs=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,getsfke);
	ps.setInt(2,getjzkfkcs);
	ps.setString(3,getjzkfkxh);
	ps.setDate(4,getjzkfksj);
	ps.setDate(5,getjzkscsj);

	ps.setDouble(6,getcwsfke);
	ps.setInt(7,getcwjzkfkcs);
	ps.setString(8,getcwjzkfkxh);
	ps.setDate(9,getcwjzkfksj);
	ps.setDate(10,getcwjzkscsj);

	ps.setDouble(11,zjxssk);
	ps.setString(12,setjzwkqs);
	ps.executeUpdate();
	ps.close();

	//��װ�����--------------------------------------------���


	//���£����������־��������־����Ʒѱ�־

	double sfke=0;
	java.sql.Date jlfdjsj=null;
	String lfdjbz="N";
	ls_sql="select sum(fkje),min(sksj)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='52' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfke=rs.getDouble(1);//��������
		jlfdjsj=rs.getDate(2);//����������ʱ��
	}
	rs.close();
	ps.close();

	int tkjls=0;//�˿��¼��
	ls_sql="select count(*)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='52' and scbz='N'";
	ls_sql+=" and fkje<0 and zffs!='31'";//11:�ֽ�12��֧Ʊ��13�����ۣ�14�����п���15������ת�ʣ�16���ֽ�ȯ��31��ת����99������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tkjls=rs.getInt(1);//�˿��¼��
	}
	rs.close();
	ps.close();

	if (sfke>0)
	{
		lfdjbz="Y";//N��δ������Y���ѽ�����T�����˶���
	}
	else 
	{
		if (tkjls>0)
		{
			lfdjbz="T";
		}
		else{
			lfdjbz="N";
		}
	}

	ls_sql="update crm_zxkhxx set lfdjbz=?,lfdj=?,jlfdjsj=?";//��Ʒ��Ƿ��ת��
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,lfdjbz);
	ps.setDouble(2,sfke);
	ps.setDate(3,jlfdjsj);
	ps.executeUpdate();
	ps.close();

	//51�����������
	sfke=0;
	java.sql.Date jhddjsj=null;
	String hddjbz="N";
	ls_sql="select sum(fkje),min(sksj)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='51' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfke=rs.getDouble(1);//�����
		jhddjsj=rs.getDate(2);//�������ʱ��
	}
	rs.close();
	ps.close();

	tkjls=0;//�˿��¼��
	ls_sql="select count(*)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='51' and scbz='N'";
	ls_sql+=" and fkje<0 and zffs!='31'";//11:�ֽ�12��֧Ʊ��13�����ۣ�14�����п���15������ת�ʣ�16���ֽ�ȯ��31��ת����99������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tkjls=rs.getInt(1);//�˿��¼��
	}
	rs.close();
	ps.close();

	if (sfke>0)
	{
		hddjbz="Y";//N��δ������Y���ѽ�����T�����˶���
	}
	else 
	{
		if (tkjls>0)
		{
			hddjbz="T";
		}
		else{
			hddjbz="N";
		}
	}

	ls_sql="update crm_zxkhxx set hddjbz=?,hddj=?,jhddjsj=?";//��Ʒ��Ƿ��ת��
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hddjbz);
	ps.setDouble(2,sfke);
	ps.setDate(3,jhddjsj);
	ps.executeUpdate();
	ps.close();

	//53����Ʒ�
	sfke=0;
	java.sql.Date jsjfsj=null;
	String sjfbz="N";
	ls_sql="select sum(fkje),min(sksj)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='53' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfke=rs.getDouble(1);//��Ʒ�
		jsjfsj=rs.getDate(2);//����Ʒ�ʱ��
	}
	rs.close();
	ps.close();

	tkjls=0;//�˿��¼��
	ls_sql="select count(*)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='53' and scbz='N'";
	ls_sql+=" and fkje<0 and zffs!='31'";//11:�ֽ�12��֧Ʊ��13�����ۣ�14�����п���15������ת�ʣ�16���ֽ�ȯ��31��ת����99������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tkjls=rs.getInt(1);//�˿��¼��
	}
	rs.close();
	ps.close();

	if (sfke>0)
	{
		sjfbz="Y";//N��δ����Ʒѣ�Y���ѽ���Ʒѣ�T������Ʒ�
	}
	else 
	{
		if (tkjls>0)
		{
			sjfbz="T";
		}
		else{
			sjfbz="N";
		}
	}

	ls_sql="update crm_zxkhxx set sjfbz=?,sjf=?,jsjfsj=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sjfbz);
	ps.setDouble(2,sfke);
	ps.setDate(3,jsjfsj);
	ps.executeUpdate();
	ps.close();


	double getkhfkze=0;
	java.sql.Date minkhsksj=null;
	java.sql.Date maxkhsksj=null;
	ls_sql="select sum(fkje),min(sksj),max(sksj)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getkhfkze=rs.getDouble(1);
		minkhsksj=rs.getDate(2);
		maxkhsksj=rs.getDate(3);
	}
	rs.close();
	ps.close();

	ls_sql="update crm_zxkhxx set scfksj=?,zjfksj=?,fkze=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,minkhsksj);
	ps.setDate(2,maxkhsksj);
	ps.setDouble(3,getkhfkze);
	ps.executeUpdate();
	ps.close();
	//�޸Ĳ�����Ϣ========================���	

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("�ϲ��ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
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
