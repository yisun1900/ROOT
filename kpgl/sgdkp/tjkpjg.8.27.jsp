<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String kpjlh=request.getParameter("kpjlh");
String qssj=request.getParameter("qssj");
String jzsj=request.getParameter("jzsj");
String fgs=cf.GB2Uni(request.getParameter("fgs"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String khbh=null;
String sgd=null;

int hfgdcs=0;
int khpjdf=0;
int ybtscs=0;
int yztscs=0;
int tskf=0;
int wxcs=0;
int wxkf=0;

double gcbfsxs=0; //���̲������������ϵ��
double gcbjexs=0; //���̲������ɵ�����ϵ��
double fgsfcxs=0; //�ֹ�˾�ܾ����������ϵ��
double fgsjexs=0; //�ֹ�˾�ܾ����ɵ�����ϵ��
double zbjxs=0; //�ʱ���ϵ��
double ddjdxs=0; //�󵥽ӵ�ϵ��
double firstjdexs=0; //��һ���ӵ���ϵ��
double lastjdexs=0;//���һ���ӵ���ϵ��

double dddedy=0;
double dddexy=0;
double zddedy=0;
double zddexy=0;
double xddedy=0;
double xddexy=0;
String sgdmc=null;
int bzs=0;
int zbj=0;

double ddhdje=0;//�󵥻ص����
double zdhdje=0;//�е��ص����
double xdhdje=0;//С���ص����

double sqsyddje=0;//����ʣ��󵥽��
double sqsyzdje=0;//����ʣ���е����
double sqsyxdje=0;//����ʣ��С�����

int tsdf=0;
int wxdf=0;
double gdjdexs=0;//���ӽӵ���ϵ��

try {
	conn=cf.getConnection();
	
	//ɾ����ʩ�������ֱ�kp_sgdpfb��
	ls_sql=" delete from kp_yzfsgdpfb";
	ls_sql+=" where kpjlh="+kpjlh;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	ls_sql=" delete from kp_yzfsgdkpjg";
	ls_sql+=" where kpjlh="+kpjlh;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//�ɵ�������

	ls_sql=" select csz";
	ls_sql+=" from  kp_pdcsb";
	ls_sql+=" where fgsbh='"+fgs+"' and csmc='gcbfsxs'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		gcbfsxs=rs1.getDouble(1);
	}
	rs1.close();
	ps1.close();

	ls_sql=" select csz";
	ls_sql+=" from  kp_pdcsb";
	ls_sql+=" where fgsbh='"+fgs+"' and csmc='gcbjexs'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		gcbjexs=rs1.getDouble(1);
	}
	rs1.close();
	ps1.close();

	ls_sql=" select csz";
	ls_sql+=" from  kp_pdcsb";
	ls_sql+=" where fgsbh='"+fgs+"' and csmc='fgsfcxs'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		fgsfcxs=rs1.getDouble(1);
	}
	rs1.close();
	ps1.close();


	ls_sql=" select csz";
	ls_sql+=" from  kp_pdcsb";
	ls_sql+=" where fgsbh='"+fgs+"' and csmc='fgsjexs'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		fgsjexs=rs1.getDouble(1);
	}
	rs1.close();
	ps1.close();

	ls_sql=" select csz";
	ls_sql+=" from  kp_pdcsb";
	ls_sql+=" where fgsbh='"+fgs+"' and csmc='zbjxs'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		zbjxs=rs1.getDouble(1);
	}
	rs1.close();
	ps1.close();

	ls_sql=" select csz";
	ls_sql+=" from  kp_pdcsb";
	ls_sql+=" where fgsbh='"+fgs+"' and csmc='ddjdxs'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		ddjdxs=rs1.getDouble(1);
	}
	rs1.close();
	ps1.close();

	ls_sql=" select csz";
	ls_sql+=" from  kp_pdcsb";
	ls_sql+=" where fgsbh='"+fgs+"' and csmc='firstjdexs'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		firstjdexs=rs1.getDouble(1);
	}
	rs1.close();
	ps1.close();

	ls_sql=" select csz";
	ls_sql+=" from  kp_pdcsb";
	ls_sql+=" where fgsbh='"+fgs+"' and csmc='lastjdexs'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		lastjdexs=rs1.getDouble(1);
	}
	rs1.close();
	ps1.close();

	ls_sql=" select dedy,dexy from kp_dxdbm ";
	ls_sql+=" where fgsbh='"+fgs+"' and deflbm='1'";//1���󵥣�2���е���3��С��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dddedy=rs.getInt(1);
		dddexy=rs.getInt(2);
	}
	rs.close();
	ps.close();

	ls_sql=" select dedy,dexy from kp_dxdbm ";
	ls_sql+=" where fgsbh='"+fgs+"' and deflbm='2'";//1���󵥣�2���е���3��С��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zddedy=rs.getInt(1);
		zddexy=rs.getInt(2);
	}
	rs.close();
	ps.close();

	ls_sql=" select dedy,dexy from kp_dxdbm ";
	ls_sql+=" where fgsbh='"+fgs+"' and deflbm='3'";//1���󵥣�2���е���3��С��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xddedy=rs.getInt(1);
		xddexy=rs.getInt(2);
	}
	rs.close();
	ps.close();

	double sqpjqde=0;//����ƽ��ǩ����
	int allqys=0;
	double allqye=0;
	ls_sql=" select count(*),sum(qye)";
	ls_sql+=" from crm_khxx ";
	ls_sql+=" where fgsbh='"+fgs+"' and zt='2'";//1���󵥣�2���е���3��С��
	ls_sql+=" and qyrq>=ADD_MONTHS(TO_DATE('"+qssj+"','YYYY-MM-DD'),-6)";
	ls_sql+=" and qyrq<=TO_DATE('"+qssj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		allqys=rs.getInt(1);
		allqye=rs.getDouble(2);

		if (allqys==0)
		{
			sqpjqde=0;
		}
		else{
			sqpjqde=allqye/allqys;
		}
	}
	rs.close();
	ps.close();

	double gsddbl=0;//��˾����ռ����
	int qys=0;
	ls_sql=" select count(*)";
	ls_sql+=" from crm_khxx ";
	ls_sql+=" where fgsbh='"+fgs+"' and zt='2'";//1���󵥣�2���е���3��С��
	ls_sql+=" and qyrq>=ADD_MONTHS(TO_DATE('"+qssj+"','YYYY-MM-DD'),-6)";
	ls_sql+=" and qyrq<=TO_DATE('"+qssj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and qye>="+dddedy+" and qye<"+dddexy;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		qys=rs.getInt(1);

		if (allqys==0)
		{
			gsddbl=0;
		}
		else{
			gsddbl=qys*1.0/allqys;
		}
	}
	rs.close();
	ps.close();


	double gszdbl=0;//��˾�е���ռ����
	qys=0;
	ls_sql=" select count(*)";
	ls_sql+=" from crm_khxx ";
	ls_sql+=" where fgsbh='"+fgs+"' and zt='2'";//1���󵥣�2���е���3��С��
	ls_sql+=" and qyrq>=ADD_MONTHS(TO_DATE('"+qssj+"','YYYY-MM-DD'),-6)";
	ls_sql+=" and qyrq<=TO_DATE('"+qssj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and qye>="+zddedy+" and qye<"+zddexy;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		qys=rs.getInt(1);

		if (allqys==0)
		{
			gszdbl=0;
		}
		else{
			gszdbl=qys*1.0/allqys;
		}
	}
	rs.close();
	ps.close();

	double gsxdbl=0;//��˾С����ռ����
	qys=0;
	ls_sql=" select count(*)";
	ls_sql+=" from crm_khxx ";
	ls_sql+=" where fgsbh='"+fgs+"' and zt='2'";//1���󵥣�2���е���3��С��
	ls_sql+=" and qyrq>=ADD_MONTHS(TO_DATE('"+qssj+"','YYYY-MM-DD'),-6)";
	ls_sql+=" and qyrq<=TO_DATE('"+qssj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and qye>="+xddedy+" and qye<"+xddexy;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		qys=rs.getInt(1);

		if (allqys==0)
		{
			gsxdbl=0;
		}
		else{
			gsxdbl=qys*1.0/allqys;
		}
	}
	rs.close();
	ps.close();

	int sgdsl=0;//
	ls_sql=" select count(*)";
	ls_sql+=" from  sq_sgd";
	ls_sql+=" where ssfgs='"+fgs+"' and cxbz='N'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	if (rs1.next())
	{
		sgdsl=rs1.getInt(1);
	}
	rs.close();
	ps.close();


	ls_sql=" select sgd";
	ls_sql+=" from  sq_sgd";
	ls_sql+=" where ssfgs='"+fgs+"' and cxbz='N'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		sgd=rs1.getString("sgd");

		//�깤�طõ÷�
		hfgdcs=0;
		khpjdf=0;
		ybtscs=0;
		yztscs=0;
		tskf=0;
		wxcs=0;
		wxkf=0;

		ls_sql=" select count(*),sum(DECODE(fwsz,'21',10,'22',5,'23',0)+DECODE(sgzl,'21',10,'22',5,'23',0)+DECODE(grsz,'21',10,'22',5,'23',0))";
		ls_sql+=" from  crm_hfjl,crm_khxx";
		ls_sql+=" where crm_hfjl.khbh=crm_khxx.khbh and crm_khxx.sgd='"+sgd+"' and crm_hfjl.hflxbm='24'";//24���깤�ط�
		ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
		ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			hfgdcs=rs.getInt(1);
			khpjdf=rs.getInt(2);

		}
		else{
			khpjdf=0;
			hfgdcs=0;
		}
		rs.close();
		ps.close();
		if (hfgdcs==0)
		{
			khpjdf=0;
		}
		else{
			khpjdf=khpjdf/hfgdcs;
		}

		ls_sql=" select count(distinct crm_tsjl.tsjlh)";
		ls_sql+=" from  crm_tsjl,crm_khxx,crm_tsbm";
		ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh";
		ls_sql+=" and slsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
		ls_sql+=" and slsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and sgd='"+sgd+"' and lx='1' and yzcdbm in('01','02') and tsxlbm='2101'";//02:����Υ��
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			ybtscs=rs.getInt(1);//һ��Ͷ�ߴ���
		}
		rs.close();
		ps.close();

		ls_sql=" select count(distinct crm_tsjl.tsjlh)";
		ls_sql+=" from  crm_tsjl,crm_khxx,crm_tsbm";
		ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh";
		ls_sql+=" and slsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
		ls_sql+=" and slsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and sgd='"+sgd+"' and lx='1' and yzcdbm='03' and tsxlbm='2101'";//02:����Υ��
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			yztscs=rs.getInt(1);//����Ͷ�ߴ���
		}
		rs.close();
		ps.close();

		tskf=ybtscs*-20+yztscs*-40;

		//ά�޴���
		ls_sql=" select count(distinct crm_tsjl.tsjlh)";
		ls_sql+=" from  crm_tsjl,crm_khxx,crm_tsbm";
		ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh";
		ls_sql+=" and slsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
		ls_sql+=" and slsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and sgd='"+sgd+"' and lx='2' and tslxbm='11'";//11:���̱���
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			wxcs=rs.getInt(1);
		}
		rs.close();
		ps.close();

		//ά�޿۷�
		ls_sql=" select sum(dm_tsyybm.zjkf)";
		ls_sql+=" from  crm_tsjl,crm_khxx,crm_tsbm,dm_tsyybm";
		ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tsyybm=dm_tsyybm.tsyybm";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.sgd='"+sgd+"' and crm_tsjl.lx='2' and crm_tsbm.tslxbm='11'";//11:���̱���
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			wxkf=rs.getInt(1);
		}
		rs.close();
		ps.close();

		wxkf=-1*wxkf;


		//����÷�
		ls_sql=" insert into kp_yzfsgdpfb (kpjlh,sgd,hfgdcs,khpjdf,ybtscs,yztscs,tskf,wxcs,wxkf)";
		ls_sql+=" values(?,?,?,?,?,?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,kpjlh);
		ps.setString(2,sgd);
		ps.setInt(3,hfgdcs);
		ps.setInt(4,khpjdf);
		ps.setInt(5,ybtscs);
		ps.setInt(6,yztscs);
		ps.setInt(7,tskf);
		ps.setInt(8,wxcs);
		ps.setInt(9,wxkf);
		ps.executeUpdate();
		ps.close();
	}
	rs1.close();
	ps1.close();


	int sqpm=0;//��������
	int sqzf=0;//�����ܷ�

	
	//����ʵ�ʵ÷�++++++++++++
	//ȡ�����Сֵ

	int maxkhpjdf=0;
	int maxtskf=0;
	int maxwxkf=0;

	int minkhpjdf=0;
	int mintskf=0;
	int minwxkf=0;

	ls_sql=" select max(khpjdf),max(tskf),max(wxkf)";
	ls_sql+=" ,min(khpjdf),min(tskf),min(wxkf)";
	ls_sql+=" from  kp_yzfsgdpfb";
	ls_sql+=" where kpjlh='"+kpjlh+"'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	if (rs1.next())
	{
		maxkhpjdf=rs1.getInt(1);
		maxtskf=rs1.getInt(2);
		maxwxkf=rs1.getInt(3);
		minkhpjdf=rs1.getInt(4);
		mintskf=rs1.getInt(5);
		minwxkf=rs1.getInt(6);
	}
	rs1.close();
	ps1.close();


	ls_sql=" select kp_yzfsgdpfb.sgd,sgdmc,hfgdcs,khpjdf,ybtscs,yztscs,tskf,wxcs,wxkf   ,sq_sgd.bzs,sq_sgd.zbj";
	ls_sql+=" from  kp_yzfsgdpfb,sq_sgd";
	ls_sql+=" where kp_yzfsgdpfb.sgd=sq_sgd.sgd and kp_yzfsgdpfb.kpjlh='"+kpjlh+"'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		sgd=rs1.getString("sgd");
		sgdmc=rs1.getString("sgdmc");
		hfgdcs=rs1.getInt("hfgdcs");
		khpjdf=rs1.getInt("khpjdf");
		ybtscs=rs1.getInt("ybtscs");
		yztscs=rs1.getInt("yztscs");
		tskf=rs1.getInt("tskf");
		wxcs=rs1.getInt("wxcs");
		wxkf=rs1.getInt("wxkf");
		bzs=rs1.getInt("bzs");
		zbj=rs1.getInt("zbj");

		//�ͻ����۵÷�
		if (maxkhpjdf-minkhpjdf==0)
		{
			khpjdf=0;
		}
		else{
			khpjdf=(int)java.lang.Math.round((khpjdf-minkhpjdf)*20.0/(maxkhpjdf-minkhpjdf));
		}

		//Ͷ����÷�
		if (maxtskf-mintskf==0)
		{
			tsdf=0;
		}
		else{
			tsdf=(int)java.lang.Math.round((tskf-mintskf)*40.0/(maxtskf-mintskf));
		}

		//ά����÷�
		if (maxwxkf-minwxkf==0)
		{
			wxdf=0;
		}
		else{
			wxdf=(int)java.lang.Math.round((wxkf-minwxkf)*40.0/(maxwxkf-minwxkf));
		}

		ls_sql=" select sum(qye)";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where qyrq>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and hdr='"+sgdmc+"' and hdbz='3' and zt='2'";//3��ʩ���ӻص�
		ls_sql+=" and qye>="+dddedy+" and qye<"+dddexy;
		ls_sql+=" and crm_khxx.fgsbh='"+fgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			ddhdje=rs.getInt(1);
		}
		rs.close();
		ps.close();

		ls_sql=" select sum(qye)";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where qyrq>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and hdr='"+sgdmc+"' and hdbz='3' and zt='2'";//3��ʩ���ӻص�
		ls_sql+=" and qye>="+zddedy+" and qye<"+zddexy;
		ls_sql+=" and crm_khxx.fgsbh='"+fgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			zdhdje=rs.getInt(1);
		}
		rs.close();
		ps.close();

		ls_sql=" select sum(qye)";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where qyrq>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and hdr='"+sgdmc+"' and hdbz='3' and zt='2'";//3��ʩ���ӻص�
		ls_sql+=" and qye>="+xddedy+" and qye<"+xddexy;
		ls_sql+=" and crm_khxx.fgsbh='"+fgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xdhdje=rs.getInt(1);
		}
		rs.close();
		ps.close();

		//��������
		int oldkpjlh=0;
		ls_sql=" select max(kpjlh)";
		ls_sql+=" from  kp_kpjl";
		ls_sql+=" where fgs='"+fgs+"' and kpjlh<"+kpjlh;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			oldkpjlh=rs.getInt(1);
		}
		rs.close();
		ps.close();

		//��������
		if (oldkpjlh==0)//��������������
		{
			sqpm=0;
			sqsyddje=0;
			sqsyzdje=0;
			sqsyxdje=0;
		}
		else{
			ls_sql=" select bqpm,syddje,syzdje,syxdje";
			ls_sql+=" from  kp_yzfsgdkpjg";
			ls_sql+=" where sgd='"+sgd+"' and kpjlh="+oldkpjlh;
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				sqpm=rs.getInt("bqpm");
				sqsyddje=rs.getInt("syddje");
				sqsyzdje=rs.getInt("syzdje");
				sqsyxdje=rs.getInt("syxdje");
			}
			rs.close();
			ps.close();

		}

		ls_sql=" insert into kp_yzfsgdkpjg (kpjlh,sgd,zbj,zbjxs,bzs,khpjdf,tsdf,wxdf,kpdf,fdfs ";
		ls_sql+=" ,bqzf,bqpm,sqpm,sqsyddje,sqsyzdje,sqsyxdje,sqpjqde,gdjdexs,bqbzjdze,gsddbl ";
		ls_sql+=" ,gdddbl,ddbzjde,gszdbl,gdzdbl,zdbzjde,gsxdbl,gdxdbl,xdbzjde,ddhdje,zdhdje ";
		ls_sql+=" ,xdhdje,zdtscs,tskddje,tskzdje,tskxdje,tsjcdd,tsjczd,tsjcxd,kjddze,kjzdze";
		ls_sql+=" ,kjxdze,kjdze,yjddje,yjzdje,yjxdje,syddje,syzdje,syxdje,djbz)";
		ls_sql+=" values(?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,kpjlh);
		ps.setString(2,sgd);
		ps.setInt(3,zbj);
		ps.setDouble(4,zbjxs);
		ps.setInt(5,bzs);
		ps.setInt(6,khpjdf);
		ps.setInt(7,tsdf);
		ps.setInt(8,wxdf);
		ps.setInt(9,khpjdf+tsdf+wxdf);
		ps.setInt(10,0);

		ps.setInt(11,khpjdf+tsdf+wxdf);
		ps.setInt(12,0);
		ps.setInt(13,sqpm);
		ps.setDouble(14,sqsyddje);
		ps.setDouble(15,sqsyzdje);
		ps.setDouble(16,sqsyxdje);
		ps.setDouble(17,sqpjqde);
		ps.setDouble(18,0);
		ps.setDouble(19,0);//����׼�ӽӵ��ܶ�
		ps.setDouble(20,gsddbl);

		ps.setDouble(21,0);
		ps.setDouble(22,0);
		ps.setDouble(23,gszdbl);
		ps.setDouble(24,gszdbl);
		ps.setDouble(25,0);
		ps.setDouble(26,gsxdbl);
		ps.setDouble(27,0);
		ps.setDouble(28,0);
		ps.setDouble(29,ddhdje);
		ps.setDouble(30,zdhdje);
		
		ps.setDouble(31,xdhdje);
		ps.setInt(32,yztscs);
		ps.setDouble(33,0);
		ps.setDouble(34,0);
		ps.setDouble(35,0);
		ps.setDouble(36,0);
		ps.setDouble(37,0);
		ps.setDouble(38,0);
		ps.setDouble(39,0);
		ps.setDouble(40,0);

		ps.setDouble(41,0);
		ps.setDouble(42,0);
		ps.setDouble(43,0);
		ps.setDouble(44,0);
		ps.setDouble(45,0);
		ps.setDouble(46,0);
		ps.setDouble(47,0);
		ps.setDouble(48,0);
		ps.setString(49,"N");

		ps.executeUpdate();
		ps.close();
		
	}
	rs1.close();
	ps1.close();

	//�ܷ�����

	int bqpm=0;//��������
	double bqbzjdze=0;//����׼�ӽӵ��ܶ�
	double bqzf=0;
	double oldbqzf=0;
	int jsq=0;
	ls_sql=" select sgd,sqpjqde,bzs,bqzf";
	ls_sql+=" from  kp_yzfsgdkpjg";
	ls_sql+=" where kpjlh="+kpjlh;
	ls_sql+=" order by bqzf desc,sqpm desc";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		sgd=rs1.getString("sgd");
		sqpjqde=rs1.getDouble("sqpjqde");
		bzs=rs1.getInt("bzs");
		bqzf=rs1.getDouble("bqzf");

		jsq++;

		if (bqzf!=oldbqzf)
		{
			bqpm=jsq;
			oldbqzf=bqzf;
		}


		gdjdexs=(sgdsl-bqpm)*(firstjdexs-lastjdexs)/sgdsl+lastjdexs;//���ӽӵ���ϵ��
		bqbzjdze=sqpjqde*bzs*gdjdexs;//����׼�ӽӵ��ܶ�


		//�����ܷ�����
		ls_sql=" update kp_yzfsgdkpjg set bqpm=?,gdjdexs=?,bqbzjdze=?";
		ls_sql+=" where sgd='"+sgd+"' and kpjlh="+kpjlh;
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,bqpm);
		ps.setDouble(2,gdjdexs);
		ps.setDouble(3,bqbzjdze);
		ps.executeUpdate();
		ps.close();
	}
	rs1.close();
	ps1.close();


	double pdze=0;//�ɵ��ܶ�
	double pdhze=0;//
	ls_sql=" select sum(bqbzjdze),sum(bqbzjdze*("+sgdsl+"-bqpm))";
	ls_sql+=" from  kp_yzfsgdkpjg";
	ls_sql+=" where kpjlh="+kpjlh;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		pdze=rs1.getDouble(1);
		pdhze=rs1.getDouble(2);
	}
	rs1.close();
	ps1.close();

	double gdcs=0;//�󵥹̶�����
	if (pdhze==0)
	{
		gdcs=0;
	}
	else{
		gdcs=(pdze*gsddbl)*(1-ddjdxs*gsddbl)/pdhze;
	}


	ls_sql=" update kp_yzfsgdkpjg set gdddbl=("+sgdsl+"-bqpm)*"+gdcs+"+"+ddjdxs*gsddbl;
	ls_sql+=" where kpjlh="+kpjlh;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update kp_yzfsgdkpjg set ddbzjde=bqbzjdze*gsddbl,zdbzjde=bqbzjdze*gdzdbl";
	ls_sql+=" where kpjlh="+kpjlh;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update kp_yzfsgdkpjg set zdbzjde=bqbzjdze-ddbzjde";
	ls_sql+=" where kpjlh="+kpjlh+" and bqbzjdze<ddbzjde+zdbzjde";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update kp_yzfsgdkpjg set xdbzjde=bqbzjdze-ddbzjde-zdbzjde";
	ls_sql+=" where kpjlh="+kpjlh;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//���ڿɽӵ��ܶ�
	ls_sql=" update kp_yzfsgdkpjg set kjddze=ddbzjde+ddhdje,kjzdze=zdbzjde+zdhdje+zbj*zbjxs,kjxdze=xdbzjde+xdhdje";
	ls_sql+=" where kpjlh="+kpjlh;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update kp_yzfsgdkpjg set kjdze=kjddze+kjzdze+kjxdze,syddje=kjddze,syzdje=kjzdze,syxdje=kjxdze";
	ls_sql+=" where kpjlh="+kpjlh;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


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
	out.print("����ʧ��,��������: " + e);
	out.print("<BR>SQL: " + ls_sql);
	return;
}
finally 
{
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