<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String yhdlm=(String)session.getAttribute("yhdlm");

String tzjlh=request.getParameter("tzjlh");
String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	double wdzgce=0;
	double cdzwjmje=0;
	double glfjmje=0;
	double sjjmje=0;
	int fwmj=0;
	ls_sql="select wdzgce,cdzwjmje,glfjmje,sjjmje,fwmj";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wdzgce=rs.getDouble("wdzgce");
		cdzwjmje=rs.getDouble("cdzwjmje");
		glfjmje=rs.getDouble("glfjmje");
		sjjmje=rs.getDouble("sjjmje");
		fwmj=rs.getInt("fwmj");
	}
	rs.close();
	ps.close();

	double yjjzcs=0;//ҵ����ֵ����
	ls_sql="SELECT yjjzcs";
	ls_sql+=" FROM crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yjjzcs=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	String kzdzfs="";
	double zdmll=0;
	double zdzkl=0;
	ls_sql="SELECT kzdzfs,zkl,zdmll";
	ls_sql+=" FROM sq_yhxx";
    ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kzdzfs=cf.fillNull(rs.getString("kzdzfs"));
		zdzkl=rs.getDouble("zkl");//����ۿ�
		zdmll=rs.getDouble("zdmll");//ǩ�����ë����
	}
	rs.close();
	ps.close();

	String zklx="";//1���������ۣ�2��������ۣ�3�����ַ��ô���
	double zdzk=0;
	double gcfqdzk=0;
	ls_sql="SELECT zklx,zdzk,gcfqdzk";
	ls_sql+=" FROM crm_tzzkjl";
    ls_sql+=" where tzjlh='"+tzjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zklx=cf.fillNull(rs.getString("zklx"));
		zdzk=rs.getDouble("zdzk");//�����ۿ�
		gcfqdzk=rs.getDouble("gcfqdzk");//���̷��ۿ�
	}
	rs.close();
	ps.close();

	String ysshbz="";
	String ssfgs="";
	ls_sql="select ysshbz,ssfgs";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ysshbz=cf.fillNull(rs.getString("ysshbz"));//�Ƿ�����Ԥ�����  N��δ���룻B��������ˣ�C���������룻Y�����ͨ����M�����δͨ����S���޸ķ�����Ȩ
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	String sfqyyssh="";
	String bjdysq="";
	ls_sql="SELECT sfqyyssh,bjdysq";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfqyyssh=cf.fillNull(rs.getString("sfqyyssh"));//�Ƿ�����Ԥ�����  Y�����ã�N��������
		bjdysq=cf.fillNull(rs.getString("bjdysq"));//���۴�ӡ�Ƿ�����Ȩ  1��������Ȩ��2��ֻ��һ����Ȩ��3��ÿ�δ�ӡ������Ȩ
	}
	rs.close();
	ps.close();

 
	conn.setAutoCommit(false);

	dzbj.Tzk tzk=new dzbj.Tzk();
	//�����޸ģ����¿ͻ��ۿ�
	tzk.updateTzZkl(conn,tzjlh,khbh,"yz");
	//���±����ۿ�
	tzk.updateBjZkl(conn,khbh,"yz");

	//���������շ���Ŀ�������շѰٷֱ�
	dzbj.NewDzbj newdzbj=new dzbj.NewDzbj();
	newdzbj.updateSfxm(conn,khbh,"yz");

	//��ȡ���ӱ��۽��
	dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();
	double dzbjze=dzbjje.getAllBjje(conn,khbh,"yz");


	//�޸ģ����ӱ����ܶ�
	ls_sql="update crm_zxkhxx set dzbjze=?,sfzdzbj='Y'";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.executeUpdate();
	ps.close();


	double htjz=dzbjje.getHtjz(conn,khbh,"yz");//��ͬ��ֵ�����̷ѣ�����ҵ�������ѣ��������м���������;�ֵ�����ʹ���ȯ
	if (htjz<0)
	{
		conn.rollback();
		out.println("���󣡺�ͬ��ֵΪ��ֵ��"+htjz);
		return;
	}

	double  sgcbj=dzbjje.getSgcbj(conn,khbh,"yz");//ʩ���ɱ��ۣ�������ʩ���ɱ��ۣ�������ʩ���ɱ�������������ѡ�˰��
	
	double  mle=cf.round(htjz-sgcbj,2);//ë����=��ͬ��ֵ��ʩ���ɱ���

	double mll=0;
	if (htjz==0)
	{
		mll=100;
	}
	else{
		mll=cf.round(mle/htjz*100,2);//ë���ʣ�ë����º�ͬ��ֵ
	}


	//�ɱ��ۣ�ʩ���ɱ��ۣ����������������ѡ�˰��
	//ë���ʣ�����ͬ��ֵ���ɱ��ۣ��º�ͬ��ֵ
	String clzt="2";//1��δ��ɣ�2��ֱ���޸��ۿ۳ɹ���3����������4������ͨ���Ѹ��ۿۣ�5������δͨ��

/*
	if (kzdzfs.equals("1"))//1������ë���ʣ�2�������ۿ�
	{
		if (mll<zdmll || mll>100)
		{
			conn.rollback();

			clzt="3";
		}
		else{
			clzt="2";
		}
	}
	else if (kzdzfs.equals("2"))//1������ë���ʣ�2�������ۿ�
	{
		if (zklx.equals("1"))//1���������ۣ�2��������ۣ�3�����ַ��ô���
		{
			if (zdzk<zdzkl)
			{

				conn.rollback();
				clzt="3";
			}
			else{
				clzt="2";
			}
		}
		else{
			if (gcfqdzk<zdzkl)
			{
				conn.rollback();
				clzt="3";
			}
			else{
				clzt="2";
			}
		}
	}
*/
	//////////////////////////////ֱ�Ӹ��ۿ�



	ls_sql="update crm_tzzkjl set tzhmll=?,clzt=?";
	ls_sql+=" where khbh='"+khbh+"' and clzt not in('2','4','5')";//1��δ��ɣ�2��ֱ���޸��ۿ۳ɹ���3����������4������ͨ���Ѹ��ۿۣ�5������δͨ��
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,mll);
	ps.setString(2,clzt);
	ps.executeUpdate();
	ps.close();


	//�޸ĺ�ͬ��������������������������������������ʼ
	//ȡ���ӱ������ݣ�������������������ʼ
	double qye=0;
	double suijin=0;
	double guanlif=0;
	double zhgczjf=0;
	double zhqtsf=0;
	double zhwjrqyexm=0;
	double sjf=0;
	double zkl=0;

	double hdzsjz=0;
	double djjje=0;
	double djjbfb=0;
//	double htjz=0;
//	double sgcbj=0;
//	double mle=0;
//	double mll=0;
	double yjjz=0;
	double cbj=0;
	double gcjcbj=0;

	qye=dzbjje.getZhBjje(conn,khbh,"sxyd")-sjjmje-glfjmje-cdzwjmje;//��ȡ���ۺ󡻵��ӱ��۽�ֱ�ӷѣ������շ�

	suijin=dzbjje.getZhSuijinJe(conn,khbh,"yz");//��ȡ�ۺ�˰���

	guanlif=dzbjje.getZhGlfJe(conn,khbh,"yz")-glfjmje;//��ȡ�ۺ󡺹���ѽ�

	zhgczjf=dzbjje.getZhGczjf(conn,khbh,"yz")-cdzwjmje;//����ֱ�ӷѣ��ۺ�

	zhqtsf=dzbjje.getZhJrQtsf(conn,khbh,"yz");//����ҵ�������ѣ��ۺ󣬲�����˰�𡢹���ѡ���Ʒ�

	zhwjrqyexm=dzbjje.getZhWjrJe(conn,khbh,"yz");//��ȡ�ۺ󡺲�����ҵ�������ѡ���������˰�𡢹���ѡ���Ʒ�

	sjf=dzbjje.getZhSjf(conn,khbh);//��ȡ�ۺ���Ʒѡ�


	if (wdzgce!=0)
	{
		zkl=cf.round(qye*10/wdzgce,2);
	}
	else{
		zkl=10;
	}


	hdzsjz=dzbjje.getZsjz(conn,khbh);//����;�ֵ+��Ȩ���;�ֵ


	djjje=dzbjje.getHtDjj(conn,khbh,"yz");//����ȯ���
	djjbfb=dzbjje.getDjjbfb(conn,khbh,"yz");//����ȯ�ٷֱ�


	htjz=dzbjje.getHtjz(conn,khbh,"yz");//��ͬ��ֵ�����̷ѣ�����ҵ�������ѣ��������м���������;�ֵ�����ʹ���ȯ

	sgcbj=dzbjje.getSgcbj(conn,khbh,"yz");//ʩ���ɱ��ۣ�������ʩ���ɱ��ۣ�������ʩ���ɱ�������������ѡ�˰��
	
	mle=cf.round(htjz-sgcbj,2);//ë����=��ͬ��ֵ��ʩ���ɱ���
	mll=cf.round(mle/htjz*100,2);//ë���ʣ�ë����º�ͬ��ֵ

	yjjz=cf.round((mle-zhwjrqyexm)*100/yjjzcs,2);//ҵ����ֵ=ë����º��㾻ֵ����

	cbj=dzbjje.getCbj(conn,khbh,"yz");//�ɱ��ۣ�������ɱ��ۣ�������ɱ�������������ѡ�˰��
	gcjcbj=dzbjje.getGcjcbj(conn,khbh,"yz");//���̻������ۣ�������̻������ۣ�������̻������ۣ�����������ѡ�˰��

	//ȡ���ӱ�������===============����



	String zxjwbm=null;
	ls_sql="select zxjwbm";
	ls_sql+=" from  dm_zxjwbm";
	ls_sql+=" where  qd<"+qye+" and "+qye+"<=zd";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zxjwbm=rs.getString("zxjwbm");
	}
	rs.close();
	ps.close();

	int pmjj=0;
	if (fwmj==0)
	{
		pmjj=0;
	}
	else{
		pmjj=(int)qye/fwmj;
	}

	//���£��ͻ���Ϣ
	ls_sql="update crm_khxx ";
	ls_sql+=" set zkl=?,qye=?,zhgczjf=?,guanlif=?,suijin=?,sjf=?,zhwjrqyexm=?,zhqtsf=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zkl);
	ps.setDouble(2,qye);
	ps.setDouble(3,zhgczjf);
	ps.setDouble(4,guanlif);
	ps.setDouble(5,suijin);
	ps.setDouble(6,sjf);
	ps.setDouble(7,zhwjrqyexm);
	ps.setDouble(8,zhqtsf);
	ps.executeUpdate();
	ps.close();

	
	ls_sql=" update crm_khqye set hdzsjz=?,djjje=?,djjbfb=?,htjz=?,sgcbj=?,mle=?,mll=?,yjjz=?,cbj=?,gcjcbj=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setDouble(1,hdzsjz);
	ps.setDouble(2,djjje);
	ps.setDouble(3,djjbfb);
	ps.setDouble(4,htjz);
	ps.setDouble(5,sgcbj);
	ps.setDouble(6,mle);
	ps.setDouble(7,mll);
	ps.setDouble(8,yjjz);
	ps.setDouble(9,cbj);
	ps.setDouble(10,gcjcbj);
	ps.executeUpdate();
	ps.close();

	//�޸ĺ�ͬ����������������������������������������



	//�޸��������������������������������������ʼ

	String zjxxh=null;
	String lx=null;
	double gczxzq=0;
	double gcjxzq=0;
	double zjje=0;
	double zqsdlzjx=0;
	double zqqtsf=0;
	double zqwjrqyexm=0;
	double zqsjf=0;
	double zqguanlif=0;
	double zqzjxsuijin=0;
	double zjxrzf=0;
	double zjxdjjje=0;
	double kglf=0;
	double kqtk=0;

	double zxcbj=cbj;
	double zxgcjcbj=gcjcbj;
	double zxsgcbj=sgcbj;

	double zxhtjz=htjz;
	double zxmle=mle;
	double zxmll=mll;
	double zxyjjz=yjjz;

	ls_sql="select zjxxh,lx";
	ls_sql+=" ,gczxzq,gcjxzq,zjje,zqsdlzjx,zqqtsf,zqwjrqyexm,zqsjf,zqguanlif,zqzjxsuijin,zjxrzf,zjxdjjje,kglf,kqtk";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by zjxxh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		zjxxh=rs1.getString("zjxxh");
		lx=cf.fillNull(rs1.getString("lx"));
		gczxzq=rs1.getDouble("gczxzq");
		gcjxzq=rs1.getDouble("gcjxzq");
		zjje=rs1.getDouble("zjje");
		zqsdlzjx=rs1.getDouble("zqsdlzjx");
		zqqtsf=rs1.getDouble("zqqtsf");
		zqwjrqyexm=rs1.getDouble("zqwjrqyexm");
		zqsjf=rs1.getDouble("zqsjf");
		zqguanlif=rs1.getDouble("zqguanlif");
		zqzjxsuijin=rs1.getDouble("zqzjxsuijin");
		zjxrzf=rs1.getDouble("zjxrzf");
		zjxdjjje=rs1.getDouble("zjxdjjje");
		kglf=rs1.getDouble("kglf");
		kqtk=rs1.getDouble("kqtk");

		if (lx.equals("2"))//1�����������2����������������ϸ��3���ײ��˲�����4���ײ͵�����Ʒ
		{
			//�ͻ��ۿ�
			zklx="";//�ۿ�����  1���������ۣ�2��������ۣ�3�����ַ��ô���
			zdzk=10;//�����ۿ�
			gcfqdzk=10;//���̷�ǩ���ۿ�
			double glfzk=10;//������ۿ�
			double sjzk=10;//˰���ۿ�
			double sjfzk=10;//��Ʒ��ۿ�
			double qtsfxmzk=10;//�����շ���Ŀ�ۿ�
			String zjxzklx="";//�������ۿ� 1��ͬ��ͬ��2�������ۿ�

			//�ͻ��������ۿ�
			double gczjxfzk=10;
			double glfzjxzk=10;
			double sjzjxzk=10;
			double sjfzjxzk=10;
			double qtsfxmzjxzk=10;

			ls_sql="select zklx,zdzk,gcfqdzk,glfzk,sjzk,sjfzk,qtsfxmzk,zjxzklx";
			ls_sql+=" from crm_khzk";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zklx=cf.fillNull(rs.getString("zklx"));
				zdzk=rs.getDouble("zdzk");
				gcfqdzk=rs.getDouble("gcfqdzk");
				glfzk=rs.getDouble("glfzk");
				sjzk=rs.getDouble("sjzk");
				sjfzk=rs.getDouble("sjfzk");
				qtsfxmzk=rs.getDouble("qtsfxmzk");
				zjxzklx=cf.fillNull(rs.getString("zjxzklx"));
			}
			rs.close();
			ps.close();


			if (zjxzklx.equals("1"))//�������ۿ� 1��ͬ��ͬ��2�������ۿ�
			{
				if (zklx.equals("1"))//�ۿ�����  1���������ۣ�2��������ۣ�3�����ַ��ô���
				{
					gczjxfzk=zdzk;//�����ۿ�
					glfzjxzk=zdzk;
					sjzjxzk=zdzk;
					sjfzjxzk=zdzk;
					qtsfxmzjxzk=zdzk;
				}
				else{//�ۿ����� 2��������ۣ�3�����ַ��ô���

					gczjxfzk=gcfqdzk;//���̷�ǩ���ۿ�
					glfzjxzk=glfzk;//������ۿ�
					sjzjxzk=sjzk;//˰���ۿ�
					sjfzjxzk=sjfzk;//��Ʒ��ۿ�
					qtsfxmzjxzk=qtsfxmzk;//�����շ���Ŀ�ۿ�
				}
			}
			else{//�������ۿ�  2�������ۿ�
				ls_sql="select gczjxfzk,glfzjxzk,sjzjxzk,sjfzjxzk,qtsfxmzjxzk ";
				ls_sql+=" from crm_khzjxzk";
				ls_sql+=" where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					gczjxfzk=rs.getDouble("gczjxfzk");
					glfzjxzk=rs.getDouble("glfzjxzk");
					sjzjxzk=rs.getDouble("sjzjxzk");
					sjfzjxzk=rs.getDouble("sjfzjxzk");
					qtsfxmzjxzk=rs.getDouble("qtsfxmzjxzk");
				}
				rs.close();
				ps.close();
			}


			
			double gczxzh=gczxzq*gczjxfzk/10;//��������ۺ�
			double gcjxzh=gcjxzq*gczjxfzk/10;//���̼���ۺ�
			double jzjje=zjje*gczjxfzk/10;//�������̷ѣ��ۺ�
			double zhsdlzjx=zqsdlzjx*gczjxfzk/10;//ˮ��·������ۺ�
			zhqtsf=zqqtsf*qtsfxmzjxzk/10;//����ҵ�������ѣ��ۺ󣬲�����˰�𡢹���ѡ���Ʒ�
			zhwjrqyexm=zqwjrqyexm*qtsfxmzjxzk/10;//������ҵ�������ѣ��ۺ󣬲�����˰�𡢹���ѡ���Ʒ�
			double zhsjf=zqsjf*sjfzjxzk/10;//��Ʒѣ��ۺ�
			double zhguanlif=zqguanlif*glfzjxzk/10;//�ۺ�-����������
			double zjxsuijin=zqzjxsuijin*sjzjxzk/10;  //�ۺ�-������˰��

			double zhzjze=0;//�����ܶ�ۺ�
			zhzjze=jzjje+zhguanlif+zjxsuijin+zhsjf  +zhqtsf+zhwjrqyexm+zjxrzf+zjxdjjje+kglf+kqtk;
			

			//���������
			ls_sql="update crm_zjxdj set jzjje=?,zhguanlif=?,zjxsuijin=?";
			ls_sql+=" ,gczxzh=?,gcjxzh=?,zjxdjjje=?";
			ls_sql+=" ,zhzjze=?  ,zhqtsf=?  ,zhwjrqyexm=?,zhsjf=?";
			ls_sql+=" where  zjxxh='"+zjxxh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,jzjje);
			ps.setDouble(2,zhguanlif);
			ps.setDouble(3,zjxsuijin);
			ps.setDouble(4,gczxzh);
			ps.setDouble(5,gcjxzh);
			ps.setDouble(6,zjxdjjje);
			ps.setDouble(7,zhzjze);
			ps.setDouble(8,zhqtsf);
			ps.setDouble(9,zhwjrqyexm);
			ps.setDouble(10,zhsjf);
			ps.executeUpdate();
			ps.close();
		}
		else
		{
			//��ʼ��
			dzbj.Zjx zjx=new dzbj.Zjx();
			//���±��ǰ�����ۿ�
			zjx.updateZjxBjZklZjxQ(conn,khbh,zjxxh,"yz");
			//���±��ǰ�����շ���Ŀ�������շѰٷֱ�
			zjx.updateZjxSfxmZjxQ(conn,khbh,zjxxh,"yz");

			//���±���󱨼��ۿ�
			zjx.updateZjxBjZkl(conn,khbh,zjxxh,"yz");
			//���±���������շ���Ŀ�������շѰٷֱ�
			zjx.updateZjxSfxm(conn,khbh,zjxxh,"yz");


			double gczxzh=zjx.getZhGcZx(conn,khbh,zjxxh,"yz");//��������ۺ�

			double gcjxzh=zjx.getZhGcJx(conn,khbh,zjxxh,"yz");//���̼���ۺ�

			double jzjje=zjx.getZhZjxGcf(conn,khbh,zjxxh,"yz");//�������̷ѣ��ۺ�

			double zhsdlzjx=zjx.getZhSdlZjx(conn,khbh,zjxxh,"yz");//ˮ��·������ۺ�

	//		double zhwjrqyexm=0;//������ҵ�������ѣ��ۺ�

			zhqtsf=zjx.getZjxZhJrQtsf(conn,khbh,zjxxh,"yz");//����ҵ�������ѣ��ۺ󣬲�����˰�𡢹���ѡ���Ʒ�

			zhwjrqyexm=zjx.getZjxZhWjrJe(conn,khbh,zjxxh,"yz");//������ҵ�������ѣ��ۺ󣬲�����˰�𡢹���ѡ���Ʒ�

			double zhsjf=zjx.getZhZJxSjf(conn,khbh,zjxxh,"yz");//��Ʒѣ��ۺ�

			double zhguanlif=zjx.getZjxZhGlf(conn,khbh,zjxxh,"yz");//�ۺ�-����������

			double zjxsuijin=zjx.getZjxZhSuijin(conn,khbh,zjxxh,"yz");  //�ۺ�-������˰��

			kglf=zjx.getKglf(conn,khbh,zjxxh,"yz");//����۹����=��ǰ���̼���Ǿ����*����۹���Ѱٷֱȣ�sq_dwxx���ã�
			zjxrzf=zjx.getZjxRzf(conn,khbh,zjxxh,"yz");//��������֤��=�ۺ󹤳̼���Ǿ����*��֤�Ѱٷֱȣ�ǩ���Ǽ�¼�룩
			zjxdjjje=zjx.getZjxDjjje(conn,khbh,zjxxh,"yz");//�������������ȯ����ǰ������*����ȯ�ٷֱȣ�ǩ���Ǽ�¼�룩



			double zhzjze=0;//�����ܶ�ۺ�
			zhzjze=jzjje+zhguanlif+zjxsuijin+zhsjf  +zhqtsf+zhwjrqyexm+zjxrzf+zjxdjjje+kglf+kqtk;

			zxcbj=zjx.getCbj(conn,khbh,zjxxh,"yz");//�ɱ��ۣ�������ɱ��ۣ�������ɱ�������������ѡ�˰��
			zxgcjcbj=zjx.getGcjcbj(conn,khbh,zjxxh,"yz");//���̻������ۣ�������̻������ۣ�������̻������ۣ�����������ѡ�˰��

			zxhtjz=zjx.getHtjz(conn,khbh,zjxxh,"yz");//��ͬ��ֵ�����̷ѣ�����ҵ�������ѣ��������м���������;�ֵ�����ʹ���ȯ
			zxsgcbj=zjx.getSgcbj(conn,khbh,zjxxh,"yz");//ʩ���ɱ��ۣ�������ʩ���ɱ��ۣ�������ʩ���ɱ�������������ѡ�˰��
			zxmle=cf.round(zxhtjz-zxsgcbj,2);//ë����=��ͬ��ֵ��ʩ���ɱ���
			zxmll=cf.round(zxmle/zxhtjz*100,2);//ë���ʣ�ë����º�ͬ��ֵ
			
			double wjryjje=0;//δ����ҵ����Ŀ
			ls_sql="SELECT sum(sfje)";
			ls_sql+=" FROM bj_sfxmmxh";
			ls_sql+=" where zjxxh='"+zjxxh+"' and sfjrqye='2'";
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				wjryjje=rs.getDouble(1);
			}
			rs.close();
			ps.close();
			

			yjjzcs=0;//ҵ����ֵ����
			mll=0;//��ͬë����
			ls_sql="SELECT yjjzcs,mll";
			ls_sql+=" FROM crm_khqye";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				yjjzcs=rs.getDouble(1);
				mll=rs.getDouble(2);
			}
			rs.close();
			ps.close();


		
			zxyjjz=zjx.getYjjz(conn,khbh,zjxxh,"yz");//ҵ����ֵ
			zxyjjz=cf.round(zxyjjz*100/yjjzcs,2);//ҵ����ֵ=ë����º��㾻ֵ����

			//���������
			ls_sql="update crm_zjxdj set jzjje=?,zhguanlif=?,zjxsuijin=?";
			ls_sql+=" ,gczxzh=?,gcjxzh=?,kglf=?,zjxrzf=?,zjxdjjje=?";
			ls_sql+=" ,zhzjze=?  ,zhqtsf=?  ,zhwjrqyexm=?,zhsjf=?";
			ls_sql+=" where  zjxxh='"+zjxxh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,jzjje);
			ps.setDouble(2,zhguanlif);
			ps.setDouble(3,zjxsuijin);
			ps.setDouble(4,gczxzh);
			ps.setDouble(5,gcjxzh);
			ps.setDouble(6,kglf);
			ps.setDouble(7,zjxrzf);
			ps.setDouble(8,zjxdjjje);
			ps.setDouble(9,zhzjze);
			ps.setDouble(10,zhqtsf);
			ps.setDouble(11,zhwjrqyexm);
			ps.setDouble(12,zhsjf);
			ps.executeUpdate();
			ps.close();
		}

	}
	rs1.close();
	ps1.close();
	
	//���������������Ϣ����������������������������������ʼ
	double allzjxje=0;
	double alljzjje=0;
	double allzqzjxsuijin=0;
	double allzjxsuijin=0;
	double allzqguanlif=0;
	double allzhguanlif=0;
	double allkglf=0;
	double allkqtk=0;
	double allzjxrzf=0;
	double allzjxdjjje=0;

	double zqljzjx=0;
	double zhljzjx=0;
	double zqqtsfzjx=0;
	double zhqtsfzjx=0;
	double zqwjrzjx=0;
	double zhwjrzjx=0;
	double zqsjfzjx=0;
	double zhsjfzjx=0;
	
	ls_sql="select sum(zjje),sum(jzjje),sum(zqzjxsuijin),sum(zjxsuijin),sum(zqguanlif),sum(zhguanlif),sum(kglf),sum(kqtk),sum(zjxrzf)";
	ls_sql+=" ,sum(zqzjze),sum(zhzjze),sum(zqqtsf),sum(zhqtsf),sum(zqwjrqyexm),sum(zhwjrqyexm),sum(zqsjf),sum(zhsjf),sum(zjxdjjje)";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and sfwc='Y'";//N��δ��ɣ�Y�������
	ls_sql+=" and (shbz='Y' OR shbz='M') ";//N��δ��ˣ�Y�����ͨ����S�����δͨ����M��������� 
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allzjxje=rs.getDouble(1);
		alljzjje=rs.getDouble(2);
		allzqzjxsuijin=rs.getDouble(3);
		allzjxsuijin=rs.getDouble(4);
		allzqguanlif=rs.getDouble(5);
		allzhguanlif=rs.getDouble(6);
		allkglf=rs.getDouble(7);
		allkqtk=rs.getDouble(8);
		allzjxrzf=rs.getDouble(9);

		zqljzjx=rs.getDouble(10);
		zhljzjx=rs.getDouble(11);
		zqqtsfzjx=rs.getDouble(12);
		zhqtsfzjx=rs.getDouble(13);
		zqwjrzjx=rs.getDouble(14);
		zhwjrzjx=rs.getDouble(15);
	
		zqsjfzjx=rs.getDouble(16);
		zhsjfzjx=rs.getDouble(17);
		allzjxdjjje=rs.getDouble(18);
	
	}
	rs.close();
	ps.close();


	ls_sql="update crm_khxx set zjxje=?,zhzjxje=?,zqzjxsuijin=?,zjxsuijin=?,zqzjxguanlif=?,zjxguanlif=?,kglf=?,kqtk=?";
	ls_sql+=" ,zqljzjx=?,zhljzjx=?,zqqtsfzjx=?,zhqtsfzjx=?,zqwjrzjx=?,zhwjrzjx=?,zqsjfzjx=?,zhsjfzjx=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,allzjxje);
	ps.setDouble(2,alljzjje);
	ps.setDouble(3,allzqzjxsuijin);
	ps.setDouble(4,allzjxsuijin);
	ps.setDouble(5,allzqguanlif);
	ps.setDouble(6,allzhguanlif);
	ps.setDouble(7,allkglf);
	ps.setDouble(8,allkqtk);

	ps.setDouble(9,zqljzjx);
	ps.setDouble(10,zhljzjx);
	ps.setDouble(11,zqqtsfzjx);
	ps.setDouble(12,zhqtsfzjx);
	ps.setDouble(13,zqwjrzjx);
	ps.setDouble(14,zhwjrzjx);
	ps.setDouble(15,zqsjfzjx);
	ps.setDouble(16,zhsjfzjx);

	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_khqye set zjxrzf=?,zjxdjjje=?,zxcbj=?,zxgcjcbj=?,zxsgcbj=?,zxhtjz=?,zxmle=?,zxmll=?,zxyjjz=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,allzjxrzf);
	ps.setDouble(2,allzjxdjjje);
	ps.setDouble(3,zxcbj);
	ps.setDouble(4,zxgcjcbj);
	ps.setDouble(5,zxsgcbj);
	ps.setDouble(6,zxhtjz);
	ps.setDouble(7,zxmle);
	ps.setDouble(8,zxmll);
	ps.setDouble(9,zxyjjz);
	ps.executeUpdate();
	ps.close();


	ls_sql=" update cw_qmjzmx set qye=?,guanlif=?,suijin=?,zhwjrqyexm=? ,zhzjxje=?,zjxsuijin=?,zjxguanlif=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setDouble(1,qye);
	ps.setDouble(2,guanlif);
	ps.setDouble(3,suijin);
	ps.setDouble(4,zhwjrqyexm);
	ps.setDouble(5,alljzjje);
	ps.setDouble(6,allzjxsuijin);
	ps.setDouble(7,allzhguanlif);
	ps.executeUpdate();
	ps.close();
	//�޸����������������������������������������

	
	conn.commit();

	if (clzt.equals("3"))
	{
		out.println("ֱ���޸��ۿ�ʧ�ܣ�������");
	}
	else{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("�޸��ۿ۳ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<%
	}

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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>