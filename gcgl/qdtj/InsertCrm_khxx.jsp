<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String khbh=request.getParameter("khbh");



String yhmc=(String)session.getAttribute("yhmc");
String zdyhbz=(String)session.getAttribute("zdyhbz");

String ssfgs=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String zxdm="";
String khxm="";
String xb="";
String cqbm="";
String fwdz="";
String lxfs="";
String sjs="";
String xjf="";
String clgw="";

String cxhdbm="";
String nlqjbm="";
String zybm="";
String ysrbm="";
String fjfwbm="";
String xqbm="";
String khlxbm="";
String hxbm="";
String fwmj="";
String fgyqbm="";
String bjjb="";
String ywy="";
String hdbz="";
String cgdz="";
String hdr="";
String jzbz="";
String louhao="";
String shbz="";
String sfyckh="";


double wdzgce=0;
double qye=0;
double glf=0;
double glfbfb=0;
double zqguanlif=0;
double guanlif=0;
double suijinbfb=0;
double zqsuijin=0;
double suijin=0;
double zqhtzcbj=0;
double zhhtzcbj=0;

double zqwjrqyexm=0;
double zhwjrqyexm=0;
String wjrqyexmsm="";


String hth="";
String sfjczjz="";
String cxhdbmxq=null;
String cxhdbmzh=null;
String email=null;
String khjl="";
String xxlysm="";
String xxly="";

String dzbjjc="";//1���˹�¼��[�ۿ��ʡ�����ԭ����]������[�ۿ��ʡ�����ԭ����]�Զ�����[ǩԼ��]��2���˹�¼��[ǩԼ�����ԭ����]������[ǩԼ�����ԭ����]�Զ�����[�ۿ���] ��3��ȫ���˹�¼��[�ۿ��ʡ�ǩԼ�����ԭ����]�����Զ�����4�����������ӱ��ۣ�[����ԭ����]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]�����ɸģ�5�����������ӱ��ۣ�[����ԭ����]ȡ�Ե��ӱ��۲��ɸģ��˹�¼��[�ۿ���]���Զ�����[ǩԼ��]

String shdzbjjc="";//1���˹�¼��[�ۿ��ʡ�����ԭ����]������[�ۿ��ʡ�����ԭ����]�Զ�����[ǩԼ��]��2���˹�¼��[ǩԼ�����ԭ����]������[ǩԼ�����ԭ����]�Զ�����[�ۿ���] ��3��ȫ���˹�¼��[�ۿ��ʡ�ǩԼ�����ԭ����]�����Զ�����4�����������ӱ��ۣ�[����ԭ����]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]�����ɸģ�5�����������ӱ��ۣ�[����ԭ����]ȡ�Ե��ӱ��۲��ɸģ��˹�¼��[�ۿ���]���Զ�����[ǩԼ��]

double sjjryjbfb=0;
double sjf=0;
double sssjf=0;


String qtsjs="";
String yxtxdz="";
String hyh=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String jiedao=null;

String sjsbh=null;
String ysy=null;
String pdqybm=null;

double zqqyze=0;
double zhqyze=0;
int fkfssl=0;

double hdzsjz=0;
double htjz=0;
double mll=0;
double cbj=0;
double sgcbj=0;
double gcjcbj=0;

double zqsjf=0;
String qtsfsm="";
double zqgczjf=0;
double zhgczjf=0;
double zqqtsf=0;
double zhqtsf=0;

double mle=0;
double yjjzcs=0;
double yjjz=0;
double djjje=0;
double djjbfb=10;

double zkl=10;

double gcfqdzk=10;
double glfzk=10;
double sjzk=10;
double sjfzk=10;

double cdzwjmje=0;
double glfjmje=0;
double sjjmje=0;

double oldzhgczjf=0;
double oldguanlif=0;
double oldsuijin=0;
double oldhtjz=0;

double djfxje=0;//�����ֽ��
double zjjmje=0;//ֱ�Ӽ�����

double tcbzjg=0;
double tcmjzjje=0;
double tczcsjcj=0;
double tczccljj=0;
double tcxsfzc=0;
double tczcjm=0;
double tcdpsj=0;
double tcdpdlsf=0;
double tcxpx=0;
double tcwsgzj=0;
double tcwgccljj=0;
double tcwzjzc=0;
double tcsgze=0;
double tcqtsf=0;
double zctcje=0;
double wntcje=0;
double jytcje=0;
double sctcje=0;
double jktcje=0;
double sjhtsjf=0;

String ywybm=null;
String ywyssxz=null;
String dianz=null;
String scbjl=null;
String weny=null;
String cqhtbz=null;
String fjtcbz="";

try {
	conn=cf.getConnection();

	String getjgwzbm =null;
	String getcpbm =null;
	String getcpmc =null;
	int gqsl=0;
	ls_sql="SELECT jgwzbm,cpbm,cpmc";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and ((sfyx='2') OR (sfyx='3' and (yxkssj>TRUNC(SYSDATE) OR yxjzsj<TRUNC(SYSDATE))))";
	ls_sql+=" order by jgwzbm,cpbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getjgwzbm=rs.getString("jgwzbm");
		getcpbm=rs.getString("cpbm");
		getcpmc=rs.getString("cpmc");

		gqsl++;

		out.println("<BR>�������ġ�"+getjgwzbm+"��"+getcpmc+"���ѹ������ڣ�������ѡ��");
	}
	rs.close();
	ps.close();

	if (gqsl>0)
	{
		return;
	}

	//���������շ���Ŀ�������շѰٷֱ�
	dzbj.NewDzbj dzbj=new dzbj.NewDzbj();
	dzbj.updateSfxm(conn,khbh,"yz");

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


	String mlspbz="";
	ls_sql="select mlspbz,sfyckh,ysy,pdqybm,sjsbh,sjf,email,cxhdbmxq,cxhdbmzh,dzbjjc,sfjczjz,cxhdbm,shbz,louhao,ysrbm,zxdm,jzbz,ywy,khxm,xb,cqbm,fwdz,lxfs,sjs,nlqjbm,zybm,fjfwbm,xqbm,khlxbm,hxbm,fwmj,fgyqbm,bjjb,hdbz,cgdz,hdr,ssfgs";
	ls_sql+=" ,khjl,xxlysm,yxtxdz,hyh,sgd,sgbz,zjxm,hth,jiedao,xjf,clgw,cqhtbz,weny,sjhtje";
	ls_sql+=" ,crm_zxkhxx.ywybm,crm_zxkhxx.ywyssxz,crm_zxkhxx.dianz,crm_zxkhxx.scbjl";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		mlspbz=cf.fillNull(rs.getString("mlspbz"));
		dianz=cf.fillNull(rs.getString("dianz"));
		scbjl=cf.fillNull(rs.getString("scbjl"));
		ywyssxz=cf.fillNull(rs.getString("ywyssxz"));
		ywybm=cf.fillNull(rs.getString("ywybm"));

		sjhtsjf=rs.getDouble("sjhtje");
		cqhtbz=cf.fillNull(rs.getString("cqhtbz"));
		weny=cf.fillNull(rs.getString("weny"));
		xjf=cf.fillNull(rs.getString("xjf"));
		clgw=cf.fillNull(rs.getString("clgw"));
		sfyckh=cf.fillNull(rs.getString("sfyckh"));
		ysy=cf.fillNull(rs.getString("ysy"));
		pdqybm=cf.fillNull(rs.getString("pdqybm"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		jiedao=cf.fillNull(rs.getString("jiedao"));
		hth=cf.fillNull(rs.getString("hth"));
		hyh=cf.fillNull(rs.getString("hyh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		yxtxdz=cf.fillNull(rs.getString("yxtxdz"));
		khjl=cf.fillNull(rs.getString("khjl"));
		xxlysm=cf.fillNull(rs.getString("xxlysm"));
		sssjf=rs.getDouble("sjf");
		email=cf.fillNull(rs.getString("email"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		shdzbjjc=cf.fillNull(rs.getString("dzbjjc"));//���õ��ӱ��ۼ��

		sfjczjz=cf.fillNull(rs.getString("sfjczjz"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		shbz=cf.fillNull(rs.getString("shbz"));
		louhao=cf.fillNull(rs.getString("louhao"));
		ysrbm=cf.fillNull(rs.getString("ysrbm"));
		zxdm=cf.fillNull(rs.getString("zxdm"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		ywy=cf.fillNull(rs.getString("ywy"));
		khxm=rs.getString("khxm");
		xb=cf.fillNull(rs.getString("xb"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		fwdz=rs.getString("fwdz");
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		nlqjbm=cf.fillNull(rs.getString("nlqjbm"));
		zybm=cf.fillNull(rs.getString("zybm"));
		fjfwbm=cf.fillNull(rs.getString("fjfwbm"));
		xqbm=cf.fillNull(rs.getString("xqbm"));
		khlxbm=rs.getString("khlxbm");
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fwmj=rs.getString("fwmj");
		fgyqbm=cf.fillNull(rs.getString("fgyqbm"));
		bjjb=cf.fillNull(rs.getString("bjjb"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdr=cf.fillNull(rs.getString("hdr"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	if (cqhtbz.equals(""))
	{
		cqhtbz="N";
	}



	ls_sql="SELECT yhmc";
	ls_sql+=" FROM sq_yhxx";
    ls_sql+=" where dwbh='"+zxdm+"' and xzzwbm='������Ա' and sfzszg in('Y','N')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		weny=cf.fillNull(rs.getString("yhmc"));
	}
	rs.close();
	ps.close();

	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		qtsjs+=rs.getString("sjs")+"��";
	}
	rs.close();
	ps.close();

	ls_sql="select xxlymc ";
	ls_sql+=" from  crm_khxxly,dm_xxlybm";
	ls_sql+=" where  crm_khxxly.xxlybm=dm_xxlybm.xxlybm and crm_khxxly.khbh='"+khbh+"' and crm_khxxly.khlx='2'";
	ls_sql+=" order by crm_khxxly.xxlybm ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xxly+=rs.getString("xxlymc")+"��";
	}
	rs.close();
	ps.close();

	ls_sql="SELECT gcfqdzk,glfzk,sjzk,sjfzk";
	ls_sql+=" FROM crm_khzk";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gcfqdzk=rs.getDouble("gcfqdzk");
		glfzk=rs.getDouble("glfzk");
		sjzk=rs.getDouble("sjzk");
		sjfzk=rs.getDouble("sjfzk");
	}
	rs.close();
	ps.close();


	ls_sql="SELECT dzbjjc,sjjryjbfb,yjjzcs";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dzbjjc=cf.fillNull(rs.getString("dzbjjc"));//���õ��ӱ��ۼ��
		sjjryjbfb=rs.getDouble("sjjryjbfb");//��ƿͻ�����ҵ���տ���� 
		yjjzcs=rs.getDouble("yjjzcs");
	}
	rs.close();
	ps.close();



	if (yjjzcs==0)
	{
		out.println("����δ�衾ҵ����ֵ������");
		return;
	}

	if (shbz.equals("Y"))//��Ϣ��˱�־
	{
		dzbjjc=shdzbjjc;
	}


	//ȡ��ͬ��
	if (hth.equals(""))
	{
		ls_sql="select hth";
		ls_sql+=" from  crm_hthxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			hth=cf.fillNull(rs.getString("hth"));
		}
		rs.close();
		ps.close();

		if (hth.equals(""))
		{
			out.println("<P>���ѣ�����������������������ѡΪ�ÿͻ����["+khbh+"]�����ͬ��");
			return;
		}
	}

	//ǩ��ǰ��飫��������������������������ʼ
	qddj.Qddj qddj=new qddj.Qddj();
	String ret="";

	//[�ͻ�����]���
	ret=qddj.checkKhxm(khxm,"yz");
	if (ret!=null && !ret.equals(""))
	{
		out.println(ret);
		return;
	}
	//[���ݵ�ַ]���
	ret=qddj.checkFwdz(conn,khbh,fwdz,"yz");
	if (ret!=null && !ret.equals(""))
	{
		out.println(ret);
		return;
	}

	//��[�����]�����
	ret=qddj.checkCxhd(conn,ssfgs,cxhdbm,cxhdbmxq,cxhdbmzh,"yz");
	if (ret!=null && !ret.equals(""))
	{
		out.println(ret);
		return;
	}

	//���[�Ƿ�����ǩ���Ǽ�]
	ret=qddj.checkYxQddj(conn,khbh,"yz");
	if (ret!=null && !ret.equals(""))
	{
		out.println(ret);
		return;
	}
 
	//���[���ӱ��۴���]
	ret=qddj.checkDzbj(conn,khbh,"yz");
	if (ret!=null && !ret.equals(""))
	{
		out.println(ret);
//		return;
	}
	//ǩ��ǰ��飽����������������������������



	//ȡ���ӱ������ݣ�������������������ʼ

  


	wdzgce=dzbjje.getZqBjje(conn,khbh,"yz");//��ȡ����ǰ�����ӱ��۽�ֱ�ӷѣ������շ�
	qye=dzbjje.getZhBjje(conn,khbh,"sxyd");//��ȡ���ۺ󡻵��ӱ��۽�ֱ�ӷѣ������շ�

	suijinbfb=dzbjje.getSuijinBfb(conn,khbh,"yz");//˰��ٷֱ�
	suijin=dzbjje.getZhSuijinJe(conn,khbh,"yz");//��ȡ�ۺ�˰���
	zqsuijin=dzbjje.getZqSuijinJe(conn,khbh,"yz");//��ȡ��ǰ��˰���

	glfbfb=dzbjje.getGlfBl(conn,khbh,"yz");//����Ѱٷֱ�
	zqguanlif=dzbjje.getZqGlfJe(conn,khbh,"yz");//����ǰ�������
	guanlif=dzbjje.getZhGlfJe(conn,khbh,"yz");//��ȡ�ۺ󡺹���ѽ�

	zqgczjf=dzbjje.getZqGczjf(conn,khbh,"yz");//����ֱ�ӷѣ���ǰ
	zhgczjf=dzbjje.getZhGczjf(conn,khbh,"yz");//����ֱ�ӷѣ��ۺ�

	zqqtsf=dzbjje.getZqJrQtsf(conn,khbh,"yz");//����ҵ�������ѣ���ǰ��������˰�𡢹���ѡ���Ʒ�
	zhqtsf=dzbjje.getZhJrQtsf(conn,khbh,"yz");//����ҵ�������ѣ��ۺ󣬲�����˰�𡢹���ѡ���Ʒ�
	qtsfsm=dzbjje.getJrQtsfsm(conn,khbh,"yz");//����ҵ����������Ŀ��������˰�𡢹���ѡ���Ʒ�

	zqwjrqyexm=dzbjje.getZqWjrJe(conn,khbh,"yz");//��ȡ��ǰ��������ҵ�������ѡ���������˰�𡢹���ѡ���Ʒ�
	zhwjrqyexm=dzbjje.getZhWjrJe(conn,khbh,"yz");//��ȡ�ۺ󡺲�����ҵ�������ѡ���������˰�𡢹���ѡ���Ʒ�
	wjrqyexmsm=dzbjje.getWjrJeMc(conn,khbh,"yz");//��ȡ�������շ���Ŀ���ơ���������˰�𡢹���ѡ���Ʒ�

	zqsjf=dzbjje.getZqSjf(conn,khbh);//��ȡ��ǰ����Ʒѡ�
	sjf=dzbjje.getZhSjf(conn,khbh);//��ȡ�ۺ���Ʒѡ�

	zqhtzcbj=dzbjje.getZqZcbj(conn,khbh,"yz");//��ͬ���ı��ۣ���ǰ
	zhhtzcbj=dzbjje.getZhZcbj(conn,khbh,"yz");//��ͬ���ı��ۣ��ۺ�

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

	if (lx.equals("2"))//1�����ײͣ�2���ײ�
	{
		dzbj.Tc tc=new dzbj.Tc();

		tcbzjg=tc.getBzjg(conn,khbh,"yz");//��ȡ:�ײͱ�׼�۸�
		tcmjzjje=tc.getMjzjje(conn,khbh,"yz");//��ȡ:������ӽ��
		tczcsjcj=tc.getZcsjcj(conn,khbh,"yz");//��ȡ:�����������
		tczccljj=tc.getZccljj(conn,khbh,"yz");//��ȡ:���ĳ����Ӽ�
		tcxsfzc=tc.getXsfzc(conn,khbh,"yz");//��ȡ:���շ�����
		tczcjm=tc.getZcjm(conn,khbh,"yz");//��ȡ:���ļ���
		tcdpsj=tc.getDpsj(conn,khbh,"yz");//��ȡ:��������
		tcdpdlsf=tc.getDpdlsf(conn,khbh,"yz");//��ȡ:��������շ�
		tcxpx=tc.getXpx(conn,khbh,"yz");//��ȡ:ѡ����
		tcwsgzj=tc.getSgzj(conn,khbh,"yz");//��ȡ:�ײ���ʩ�������
		tcwgccljj=tc.getGccljj(conn,khbh,"yz");//��ȡ:���̳����Ӽ�
		tcwzjzc=tc.getZjzc(conn,khbh,"yz");//��ȡ:�ײ�����������
		tcsgze=tc.getSgze(conn,khbh,"yz");//��ȡ:ʩ���ܶ�
		tcqtsf=tc.getTcqtsf(conn,khbh,"yz");//��ȡ:�ײͣ������շ�
		zctcje=tc.getZctcje(conn,khbh,"yz");//��ȡ:�����ײͽ��
		wntcje=tc.getWntcje(conn,khbh,"yz");//��ȡ:��ů�ײͽ��
		jytcje=tc.getJytcje(conn,khbh,"yz");//��ȡ:�����ײͽ��
		sctcje=tc.getSctcje(conn,khbh,"yz");//��ȡ:ɫ���ײͽ��
		jktcje=tc.getJktcje(conn,khbh,"yz");//��ȡ:�����ײͽ��
	}

	if (wdzgce!=0)
	{
		zkl=cf.round(qye*10/wdzgce,2);
	}
	else{
		zkl=10;
	}


	djfxje=dzbjje.getDjfxje(conn,khbh,"sxyd");//�����ֽ��
	zjjmje=dzbjje.getZjjmje(conn,khbh,"yz");//ֱ�Ӽ�����
	hdzsjz=dzbjje.getZsjz(conn,khbh);//����;�ֵ+��Ȩ���;�ֵ


	djjje=dzbjje.getHtDjj(conn,khbh,"yz");//����ȯ���
	djjbfb=dzbjje.getDjjbfb(conn,khbh,"yz");//����ȯ�ٷֱ�


	htjz=dzbjje.getHtjz(conn,khbh,"yz");//��ͬ��ֵ�����̷ѣ�����ҵ�������ѣ��������м���������;�ֵ�����ʹ���ȯ

	sgcbj=dzbjje.getSgcbj(conn,khbh,"yz");//ʩ���ɱ��ۣ�������ʩ���ɱ��ۣ�������ʩ���ɱ�������������ѡ�˰��
	
	mle=cf.round(htjz-sgcbj,2);//ë����=��ͬ��ֵ��ʩ���ɱ���
	mll=cf.round(mle/htjz*100,2);//ë���ʣ�ë����º�ͬ��ֵ

	yjjz=dzbjje.getYjjz(conn,khbh,"yz");//��ȡҵ����ֵ
	yjjz=cf.round(yjjz*100/yjjzcs,2);//ҵ����ֵ=ë����º��㾻ֵ����

	cbj=dzbjje.getCbj(conn,khbh,"yz");//�ɱ��ۣ�������ɱ��ۣ�������ɱ�������������ѡ�˰��
	gcjcbj=dzbjje.getGcjcbj(conn,khbh,"yz");//���̻������ۣ�������̻������ۣ�������̻������ۣ�����������ѡ�˰��

	oldzhgczjf=zhgczjf;
	oldguanlif=guanlif;
	oldsuijin=suijin;
	oldhtjz=htjz;

	//ȡ���ӱ�������===============����


	// ���ë����������������������������ʼ
	int spjl=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_tzzkjl";
    ls_sql+=" where khbh='"+khbh+"' and clzt in('2','4')";//1��δ���ۿۣ�2��ֱ���޸��ۿ۳ɹ���3����������4������ͨ���Ѹ��ۿۣ�5������δͨ��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		spjl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (!mlspbz.equals("Y") && spjl==0)
	{
		String kzdzfs="";
		double zdmll=0;
		double zdzkl=0;
		ls_sql="SELECT kzdzfs,zkl,zdmll";
		ls_sql+=" FROM sq_yhxx";
		ls_sql+=" where ssfgs='"+ssfgs+"' and yhmc='"+sjs+"' and zwbm in('23','04') and sfzszg in('Y','N')";
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

		//���Ľ�����
		double zcxse=0;
		double zccb=0;
		ls_sql="SELECT sum(hkze+zjhze),sum(cbze+zjxcbze)";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09����ͬ�����
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if(rs.next())
		{
			zcxse=rs.getDouble(1);//�������۶�
			zccb=rs.getInt(2);//���ĳɱ���
		}
		rs.close();
		ps.close();

		double khmll=0;//�ͻ�ë����
		if ((zcxse+htjz)!=0)
		{
			khmll=cf.round((zcxse-zccb+mle)*100/(zcxse+htjz),2);
		}


		if (kzdzfs.equals("1"))//1������ë���ʣ�2�������ۿ�
		{
			if (khmll<zdmll || khmll>100)
			{
				out.println("��������ë����ȨΪ��"+zdmll+"������Ҫ����ë��");
				return;
			}
		}
	}

	
	// ���ë������������������������������
}
catch (Exception e) {
	out.print("<P>��������: " + e);
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
<body bgcolor="#CCCCFF"  style="FONT-SIZE:14">

<form method="post" action="" name="insertform" target='_blank'>
          
  <div align="center"> ��¼��ͻ���Ϣ��<font color="#FF0033">*</font>Ϊ�����ֶΣ����ͻ���ţ�<%=khbh%>��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000FF">��ͬ��</font></td>
      <td width="29%"> 
      <input type="text" name="hth" value="<%=hth%>" size="20" maxlength="20" onKeyUp="keyGo(smhtbh)" readonly>      </td>
      <td width="21%" align="right">�����ͬ���</td>
      <td width="29%"><input type="text" name="smhtbh" value="" size="20" maxlength="20" onKeyUp="keyTo(khlxbm)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000FF">�ͻ�����</font>      </td>
      <td width="29%"> 
        <input type="hidden" name="khbh" value="<%=khbh%>" >
      <input type="text" name="khxm" value="<%=khxm%>" size="20" maxlength="50" readonly>      </td>
      <td width="21%" align="right"> 
        <font color="#FF0033">*</font>�Ա�      </td>
      <td width="29%"> 
        <input type="radio" name="xb"  value="M" <% if (xb.equals("M")) out.print("checked");%> onKeyUp="keyGo(lxfs)">
        �� 
        <input type="radio" name="xb"  value="W" <% if (xb.equals("W")) out.print("checked");%> onKeyUp="keyGo(lxfs)">
      Ů </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000FF">��ϵ��ʽ</font></td>
      <td colspan="3"> 
        <input type="text" name="lxfs" value="<%=lxfs%>" size="73" maxlength="100" readonly></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#0000FF">�����ʼ�</font></td>
      <td width="29%">
      <input type="text" name="email" value="<%=email%>" size="20" maxlength="50">      </td>
      <td width="21%" align="right"><font color="#FF0033">*</font>ҵ�����֤����</td>
      <td width="29%"> 
      <input type="text" name="sfzhm" value="" size="20" maxlength="18" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right" bgcolor="#FFFFFF"> 
        <font color="#FF0033">*</font><font color="#0000FF">���ݵ�ַ</font>      </td>
      <td colspan="3"> 
		<input type="hidden" name="cqbm" value="<%=cqbm%>" >
		<input type="hidden" name="jiedao" value="<%=jiedao%>" >
		<input type="hidden" name="xqbm" value="<%=xqbm%>" >
		<input type="hidden" name="louhao" value="<%=louhao%>">
        <input type="text" name="fwdz" value="<%=fwdz%>" size="73" maxlength="100" readonly>      </td>
    </tr>
     <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">��Чͨ�ŵ�ַ</font></td>
      <td colspan="3"><input name="yxtxdz" type="text" value="<%=yxtxdz%>" size="73" maxlength="100" readonly></td>
    </tr>
   <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">�μӹ�˾�����</font></td>
      <td colspan="3"><A HREF="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbm%>" target="_blank"><%=cxhdbm%></A>
          <input type="hidden" name="cxhdbm" value="<%=cxhdbm%>" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">�μ�С�������</font></td>
      <td colspan="3"><A HREF="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbmxq%>" target="_blank"><%=cxhdbmxq%></A>
          <input type="hidden" name="cxhdbmxq" value="<%=cxhdbmxq%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">�μ�չ������</font></td>
      <td colspan="3"><A HREF="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbmzh%>" target="_blank"><%=cxhdbmzh%></A>
          <input type="hidden" name="cxhdbmzh" value="<%=cxhdbmzh%>"  >
      </td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right">��������</td>
      <td width="29%"> 
        <select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(zybm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm",nlqjbm);
%> 
      </select>      </td>
      <td width="21%" align="right">ְҵ</td>
      <td width="29%"> 
        <select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(ysrbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm",zybm);
%> 
      </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right">������</td>
      <td width="29%"> 
        <select name="ysrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(fjfwbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm order by ysrbm",ysrbm);
%> 
      </select>      </td>
      <td width="21%" align="right">���Ϲ���</td>
      <td width="29%"> <input type="text" name="clgw" value="<%=clgw%>" size="20" maxlength="20" readonly>         </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">���ʦ</font></td>
      <td><input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="20" readonly></td>
      <td align="right"><font color="#0000FF">�������ʦ</font></td>
      <td><%=qtsjs%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>�곤</td>
      <td><input name="dianz" type="text"  value="<%=dianz%>" size="20" maxlength="20" ></td>
      <td align="right">������Ա</td>
      <td><input name="weny" type="text" id="weny" value="<%=weny%>" size="20" maxlength="20" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right">�г�������</td>
      <td width="29%"><input name="scbjl" type="text"  value="<%=scbjl%>" size="20" maxlength="20" ></td>
      <td width="21%" align="right"> 
        <font color="#0000FF">ҵ��Ա</font>      </td>
      <td width="29%"> 
      <input type="text" name="ywy" value="<%=ywy%>" size="20" maxlength="20" readonly>      </td>
    </tr>
		<tr bgcolor="#FFFFFF">
		  <td align="right">&nbsp;</td>
		  <td>&nbsp;</td>
		  <td align="right"><font color="#0000FF">��ǩ��ͬ��־</font></td>
		  <td><%
	cf.radioToken(out,"Y+��ǩ��ͬ&N+��",cqhtbz,true);
%></td>
		</tr>
	
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">�ͻ�����</font></td>
      <td> 
      <input type="text" name="khjl" value="<%=khjl%>" size="20" maxlength="20" readonly></td>
      <td align="right"><font color="#FF0033">*</font>�����</td>
      <td><select name="fkfabm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	if (fkfssl==1)
	{
		cf.selectItem(out,"select cw_fkfabm.fkfabm,cw_fkfabm.fkfamc from cw_fkfabm,cw_fgsfkfa where cw_fkfabm.fkfabm=cw_fgsfkfa.fkfabm and cw_fgsfkfa.fgsbh='"+ssfgs+"' order by cw_fkfabm.fkfabm","");
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select cw_fkfabm.fkfabm,cw_fkfabm.fkfamc from cw_fkfabm,cw_fgsfkfa where cw_fkfabm.fkfabm=cw_fgsfkfa.fkfabm and cw_fgsfkfa.fgsbh='"+ssfgs+"' order by cw_fkfabm.fkfabm","");
	}
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"> 
        <font color="#FF0033">*</font>�������      </td>
      <td width="29%"> 
        <input type="text" name="fwmj" value="<%=fwmj%>" size="20" maxlength="20"  onChange="calValue(insertform)" onKeyUp="keyGo(bjjb[0])">
      <input type="hidden" name="pmjj" value="" >      </td>
      <td width="21%" align="right"><font color="#FF0033">*</font>���ۼ���</td>
      <td width="29%"><%
	if (bjjb.equals(""))
	{
		cf.radioItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","bjjb","");
	}
	else 
	{
		cf.radioItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjb+"'","bjjb",bjjb);
	}

%></td>
    </tr>
  </TABLE>


<BR>  
<%
	if (dzbjjc.equals("1"))//1���˹�¼��[�ۿ��ʡ�����ԭ����]������[�ۿ��ʡ�����ԭ����]�Զ�����[ǩԼ��]
	{
		%>
		<%@ include file="dzbjjc1.jsp" %>
		<%
	}
	else if (dzbjjc.equals("2"))//2���˹�¼��[ǩԼ�����ԭ����]������[ǩԼ�����ԭ����]�Զ�����[�ۿ���]
	{
		%>
		<%@ include file="dzbjjc2.jsp" %>
		<%
	}
	//6��ȫ���˹�¼��[�ۿ��ʡ�ǩԼ���ͬԭ����] �����Զ����㣬��¼����
	else if (dzbjjc.equals("3") || dzbjjc.equals("6"))//3��ȫ���˹�¼��[�ۿ��ʡ�ǩԼ���ͬԭ����]�����Զ����㣬����¼����
	{
		%>
		<%@ include file="dzbjjc3.jsp" %>
		<%
	}
	//4�����������ӱ��ۣ�[����ԭ����]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]�����ɸ�
	//7�����������ӱ��ۣ�[��ͬԭ����]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]�����ɸģ����޸������Ż�
	else if (dzbjjc.equals("4") || dzbjjc.equals("7"))
	{
		%>
		<%@ include file="dzbjjc4.jsp" %>
		<%
	}
	else if (dzbjjc.equals("5"))//5�����������ӱ��ۣ�[����ԭ����]ȡ�Ե��ӱ��۲��ɸģ��˹�¼��[�ۿ���]���Զ�����[ǩԼ��]
	{
		%>
		<%@ include file="dzbjjc5.jsp" %>
		<%
	}
	else{
		out.println("�����õ��ӱ��ۼ�须����"+dzbjjc);
		return;
	}
%> 


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
   <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font>�Ƿ�ȯ</td>
      <td width="29%"> 
        <input type="radio" name="sffj"  value="Y" onKeyUp="keyGo(fjje)">
        �� 
        <input type="radio" name="sffj"  value="N" onKeyUp="keyGo(sfyrz[0])" checked>
      �� </td>
      <td width="21%" align="right">��ȯ����</td>
      <td width="29%"><input name="fqkh" type="text" id="fqkh" onKeyUp="keyGo(sfyrz[0])" value="" size="20" maxlength="20"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right">��ȯ�ܽ��</td>
      <td width="29%"> 
        <input type="text" name="fjje" value="" size="20" maxlength="20" onKeyUp="keyGo(gsfje)">      </td>
      <td width="21%" align="right">��˾�е������</td>
      <td width="29%"> 
        <input type="text" name="gsfje" value="" size="20" maxlength="20" onKeyUp="keyGo(sfyrz[0])">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�Ƿ�����֤</td>
      <td><input type="radio" name="sfyrz"  value="Y">
��
  <input type="radio" name="sfyrz"  value="N" checked >
�� </td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right">��֤�г�</td>
      <td width="29%"><select name="rzsc" style="FONT-SIZE:12PX;WIDTH:152PX" >
        <option value=""></option>
        <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' and cxbz='N' order by dwbh","");
%>
      </select></td>
      <td width="21%" align="right">��֤�Ѱٷֱ�</td>
      <td width="29%"><input type="text" name="rzfbfb" value="" size="10" maxlength="20"  >
%</td>
    </tr>
  </TABLE>



<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td width="21%" align="right"><font color="#FF0033">*</font>��װ��־</td>
      <td width="29%"><%
	cf.radioToken(out, "jzbz","1+��װ&2+��װ",jzbz);
%></td>
      <td width="21%" align="right"><font color="#0000CC">��Ϣ��Դ</font></td>
      <td width="29%"><%=xxly%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">��Ϣ��Դ˵��</td>
      <td colspan="3"><input name="xxlysm" type="text" value="<%=xxlysm%>" size="73" maxlength="100"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>����</td>
      <td><select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onkeyup="keyTo(fgflbm)">
        <option value=""></option>
        <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm);
%>
      </select></td>
      <td align="right"><font color="#FF0033">*</font>���</td>
      <td><select name="fgflbm" style="FONT-SIZE:12PX;WIDTH:152PX" onkeyup="keyTo(ysbm)">
        <option value=""></option>
        <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm",fgyqbm);
%>
      </select></td>
    </tr>
</TABLE>



<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right">����ʱ��</td>
      <td width="29%"> 
        <input type="radio" name="kgsjqd" value="Y" checked>
        ��ȷ�� 
        <input type="radio" name="kgsjqd" value="N">
      δȷ��</td>
      <td width="21%" align="right"><font color="#FF0033">*</font>��������</td>
      <td width="29%">
      <input type="text" name="gqts" size="20" maxlength="10" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font>���齻������</td>
      <td width="29%"> 
      <input type="text" name="jyjdrq" value="" size="20" maxlength="10" onKeyUp="keyGo(qyrq)"  ondblclick="JSCalendar(this)">      </td>
      <td width="21%" align="right"><font color="#FF0033">*</font>ǩԼ����</td>
      <td width="29%"> 
      <input type="text" name="qyrq" value="<%=cf.today()%>" size="20" maxlength="10" onKeyUp="keyGo(kgrq)"  ondblclick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font>��ͬ��������</td>
      <td width="29%"> 
      <input type="text" name="kgrq" value="" size="20" maxlength="10" onKeyUp="keyGo(jgrq)"  ondblclick="JSCalendar(this)">      </td>
      <td width="21%" align="right"><font color="#FF0033">*</font>��ͬ��������</td>
      <td width="29%"> 
      <input type="text" name="jgrq" size="20" maxlength="10" onKeyUp="keyTo(hdbz)"  ondblclick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font>�ص���־</td>
      <td width="29%"> 
        <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="cf_hdbz(insertform)" onKeyUp="keyGo(bz)">
          <%
	cf.selectItem(out,"select hdlxbm,hdlxmc from dm_hdlxbm order by hdlxbm",hdbz);
%> 
      </select>      </td>
      <td width="21%" align="right">�ص���</td>
      <td width="29%"> 
      <input type="text" name="hdr" value="<%=hdr%>" size="20" maxlength="20"  >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�ص����ضӳ�</td>
      <td><input type="text" name="hdsgd" value="" size="20" maxlength="20"  ></td>
      <td align="right">�ص����ذ೤</td>
      <td><input type="text" name="hdsgbz" value="" size="20" maxlength="20"  ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right">�ص�����</td>
      <td colspan="3"> 
        <input type="text" name="cgdz" value="<%=cgdz%>" size="73" maxlength="100" onKeyUp="keyGo(bz)" >      </td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right">ˮ�ʷ���������</td>
      <td width="29%"> 
        <input type="radio" name="sffk" value="Y">
        ���� 
        <input type="radio" name="sffk" value="N" checked>
      δ���� </td>
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000CC">��ϵ�ͻ�</font></td>
      <td width="29%"><select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onkeyup="keyGo(khxm)">
        <%
		cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm where khlxbm='"+khlxbm+"'",khlxbm);
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right">�Ǽǿ���</td>
      <td width="29%"> 
      <input type="text" name="djkh" value="" size="20" maxlength="20" >      </td>
      <td width="21%" align="right">��������</td>
      <td width="29%"> 
      <input type="text" name="fkrq" value="" size="20" maxlength="10"  ondblclick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000CC">ǩԼ����</font></td>
      <td width="29%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zxdm+"'","");
%> 
      </select>      </td>
      <td width="21%" align="right"><font color="#FF0033">*</font><font color="#0000CC">�����ֹ�˾</font></td>
      <td width="29%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
%> 
      </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000CC">¼��ʱ��</font>      </td>
      <td width="29%"> 
      <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly onKeyUp="keyGo(lrr)">      </td>
      <td width="21%" align="right"> 
        <font color="#FF0033">*</font><font color="#0000CC">��Ϣ¼����</font>     </td>
      <td width="29%"> 
      <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly onKeyUp="keyGo(bz)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"> 
        ��ע      </td>
      <td colspan="3"> 
        <textarea name="bz" cols="75" rows="2" onKeyUp="keyTo(savebutton)"></textarea>      </td>
    </tr>
    <tr> 
      <td colspan="4" align="center"> 
        <input type="button"  value="����" onClick="f_do(insertform)" name="savebutton">
		<input type="button"  value="һ���Ը����ͬ��ӡԤ��" onClick="f_dyht1(insertform)" name="dyht1" disabled >
		<input type="button"  value="���ڸ����ͬ��ӡԤ��" onClick="f_dyht2(insertform)" name="dyht2" disabled >
		<input type="button"  value="����Э���ӡԤ��" onClick="f_cxxydy11(insertform)" name="cxxydy11" >
		<input type="button"  value="���ڸ����ӡ" onClick="f_dyht3(insertform)" name="dyht3" disabled >
		<input type="button"  value="�ͻ�װ����֪" onClick="f_zxxzdy(insertform)" name="zxxzdy" >
		<input type="button" onClick="window.open('/dhzx/sjszxone/dybj.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="Ԥ������">
 		<input name="button" type="button" onClick="window.open('/dhzx/dhzx/ViewCrm_khzsxx.jsp?khbh=<%=khbh%>')" value="������Ϣ">   
		
        <input type="hidden" name="sfcjq" value="1" >
        <input type="hidden" name="sffby" value="1" >
        <input type="hidden" name="hyklxbm" value="" >
        <input type="hidden" name="hykh" value="" >
        <input type="hidden" name="yxsjs" value="" >
        <input type="hidden" name="yxsjz" value="" >
        <input type="hidden" name="sjsbh" value="<%=sjsbh%>"  >
        <input type="hidden" name="ywyssxz" value="<%=ywyssxz%>"  >
        <input type="hidden" name="ywybm" value="<%=ywybm%>"  >
        <input type="hidden" name="pdqybm" value="<%=pdqybm%>"  >
        <input type="hidden" name="ysy" value="<%=ysy%>"  >
      <input type="hidden" name="dzbjjc" value="<%=dzbjjc%>">
      <input type="hidden" name="hyh" value="<%=hyh%>">
      <input type="hidden" name="sgd" value="<%=sgd%>">
      <input type="hidden" name="sgbz" value="<%=sgbz%>">
      <input type="hidden" name="zjxm" value="<%=zjxm%>">
      <input type="hidden" name="sfyckh" value="<%=sfyckh%>">
        <input type="hidden" name="cqhtbz" value="<%=cqhtbz%>"  >

      <input type="hidden" name="xjf" value="<%=xjf%>">

	  <input type="hidden" name="glf" value="0" >
      <input type="hidden" name="tcbzjg" value="<%=tcbzjg%>">
      <input type="hidden" name="tcmjzjje" value="<%=tcmjzjje%>">
      <input type="hidden" name="tczcsjcj" value="<%=tczcsjcj%>">
      <input type="hidden" name="tczccljj" value="<%=tczccljj%>">
      <input type="hidden" name="tcxsfzc" value="<%=tcxsfzc%>">
      <input type="hidden" name="tczcjm" value="<%=tczcjm%>">
      <input type="hidden" name="tcdpsj" value="<%=tcdpsj%>">

      <input type="hidden" name="tcdpdlsf" value="<%=tcdpdlsf%>">
      <input type="hidden" name="tcxpx" value="<%=tcxpx%>">
      <input type="hidden" name="tcwsgzj" value="<%=tcwsgzj%>">

      <input type="hidden" name="tcwgccljj" value="<%=tcwgccljj%>">
      <input type="hidden" name="tcwzjzc" value="<%=tcwzjzc%>">
      <input type="hidden" name="tcsgze" value="<%=tcsgze%>">
      <input type="hidden" name="tcqtsf" value="<%=tcqtsf%>">
      <input type="hidden" name="zctcje" value="<%=zctcje%>">
      <input type="hidden" name="wntcje" value="<%=wntcje%>">
      <input type="hidden" name="jytcje" value="<%=jytcje%>">
      <input type="hidden" name="sctcje" value="<%=sctcje%>">
      <input type="hidden" name="jktcje" value="<%=jktcje%>">
      <input type="hidden" name="sjhtsjf" value="<%=sjhtsjf%>">
	  </td>
    </tr>
  </table>
</form>

</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function calValue(FormName)
{  
	<%
	if (dzbjjc.equals("1"))//1���˹�¼��[�ۿ��ʡ�����ԭ����]������[�ۿ��ʡ�����ԭ����]�Զ�����[ǩԼ��]
	{
		%>
		//����ֱ�ӷѣ��ۺ�
		var zhgczjf=FormName.zqgczjf.value/10.0*FormName.gcfqdzk.value-FormName.cdzwjmje.value;
		zhgczjf=round(zhgczjf,2);
		FormName.zhgczjf.value=zhgczjf;

		//��Ʒѣ��ۺ�
		var sjf=FormName.zqsjf.value/10.0*FormName.sjfzk.value;
		sjf=round(sjf,2);
		FormName.sjf.value=sjf;

		//����ѣ���ǰ
		var glfjs=FormName.zqgczjf.value*1.0+FormName.zqqtsf.value*1.0+FormName.zqwjrqyexm.value*1.0+FormName.zqsjf.value*1.0;//����ѻ���
		var zqguanlif=glfjs*FormName.glfbfb.value/100.0;
		FormName.zqguanlif.value=round(zqguanlif,2);  

		//����ѣ��ۺ�
		var guanlif=FormName.zqguanlif.value*FormName.glfzk.value/10.0-FormName.glfjmje.value;
		guanlif=round(guanlif,2);
		FormName.guanlif.value=guanlif;      

		//��ǰ˰��
		var sjjs=glfjs+FormName.zqguanlif.value*1;//˰�����
		var zqsuijin=sjjs*FormName.suijinbfb.value/100.0 ;
		zqsuijin=round(zqsuijin,2);
		FormName.zqsuijin.value=zqsuijin;     

		//�ۺ�˰��
		var suijin=FormName.zqsuijin.value*FormName.sjzk.value/10.0-FormName.sjjmje.value;
		suijin=round(suijin,2);
		FormName.suijin.value=suijin;     

		//��ǰ��ͬ�ܶ�=��ǰ����ֱ�ӷѣ���ǰ����ѣ���ǰ˰����ǰ����ҵ�������ѣ���ǰ����ҵ�������ѣ���ǰ��Ʒ�
		var wdzgce=FormName.zqgczjf.value*1.0+FormName.zqguanlif.value*1.0+FormName.zqsuijin.value*1.0+FormName.zqqtsf.value*1.0+FormName.zqwjrqyexm.value*1.0+FormName.zqsjf.value*1.0;
		wdzgce=round(wdzgce,2);
		FormName.wdzgce.value=wdzgce;     

		//�ۺ��ͬ�ܶ�=�ۺ󹤳�ֱ�ӷѣ��ۺ����ѣ��ۺ�˰���ۺ����ҵ�������ѣ��ۺ󲻼�ҵ�������ѣ��ۺ���Ʒ�
		var qye=FormName.zhgczjf.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhqtsf.value*1.0+FormName.zhwjrqyexm.value*1.0+FormName.sjf.value*1.0-FormName.djfxje.value*1.0-FormName.zjjmje.value*1.0;
		qye=round(qye,2);
		FormName.qye.value=qye;    

		//�ۺ��ۿ�
		var zkl=0;
		if (FormName.wdzgce.value*1!=0)
		{
			zkl=FormName.qye.value*10.0/FormName.wdzgce.value;
		}
		else{
			zkl=10;
		}
		zkl=round(zkl,2);
		FormName.zkl.value=zkl;    
		
		//��ͬ��ֵ=�ۺ��ͬ�ܶ˰���ۺ�-���;�ֵ-���ʹ���ȯ�����̷Ѽ�������Ѽ���˰������
		var htjz=FormName.qye.value*1.0-FormName.suijin.value*1.0-FormName.hdzsjz.value*1.0-FormName.djjje.value*1.0-FormName.cdzwjmje.value*1.0-FormName.glfjmje.value*1.0-FormName.sjjmje.value*1.0;
		htjz=round(htjz,2);
		FormName.htjz.value=htjz;    

		//ë����=��ͬ��ֵ��ʩ���ɱ���
		var mle=(FormName.htjz.value*1.0-FormName.sgcbj.value*1.0);
		mle=round(mle,2);
		FormName.mle.value=mle;    

		//ë����=ë����º�ͬ��ֵ
		var mll=FormName.mle.value*1.0/FormName.htjz.value*1.0*100;
		mll=round(mll,2);
		FormName.mll.value=mll;    

		//ҵ����ֵ=ë�����ҵ����ֵ����
		var yjjz=FormName.mle.value*100/FormName.yjjzcs.value;
		yjjz=round(yjjz,2);
		FormName.yjjz.value=yjjz;    

		<%
	}
	else if (dzbjjc.equals("2"))//2���˹�¼��[ǩԼ�����ԭ����]������[ǩԼ�����ԭ����]�Զ�����[�ۿ���]
	{
		%>
		//���̷�ǩ���ۿ�
		var gcfqdzk=FormName.zhgczjf.value*10.0/FormName.zqgczjf.value;
		gcfqdzk=round(gcfqdzk,2);
		FormName.gcfqdzk.value=gcfqdzk;
		if (FormName.zqgczjf.value==0)
		{
			FormName.gcfqdzk.value=10;
		}

		//��Ʒ��ۿ�
		var sjfzk=FormName.sjf.value*10.0/FormName.zqsjf.value;
		sjfzk=round(sjfzk,2);
		FormName.sjfzk.value=sjfzk;
		if (FormName.zqsjf.value==0)
		{
			FormName.sjfzk.value=10;
		}

		//����ѣ���ǰ
		var zqglfjs=FormName.zqgczjf.value*1.0+FormName.zqqtsf.value*1.0+FormName.zqwjrqyexm.value*1.0+FormName.zqsjf.value*1.0;//����ѻ���
		var zqguanlif=zqglfjs*FormName.glfbfb.value/100.0;
		FormName.zqguanlif.value=round(zqguanlif,2);  

		//����ѣ��ۺ�
		var zhglfjs=FormName.zhgczjf.value*1.0+FormName.zhqtsf.value*1.0+FormName.zhwjrqyexm.value*1.0+FormName.sjf.value*1.0;//����ѻ���
		var guanlif=zhglfjs*FormName.glfbfb.value/100.0;
		guanlif=round(guanlif,2);
		FormName.guanlif.value=guanlif;      

		//������ۿ�
		var glfzk=FormName.guanlif.value*10.0/FormName.zqguanlif.value;
		glfzk=round(glfzk,2);
		FormName.glfzk.value=glfzk;
		if (FormName.zqguanlif.value==0)
		{
			FormName.glfzk.value=10;
		}

		//��ǰ˰��
		var zqsjjs=zqglfjs+FormName.zqguanlif.value*1;//˰�����
		var zqsuijin=zqsjjs*FormName.suijinbfb.value/100.0 ;
		zqsuijin=round(zqsuijin,2);
		FormName.zqsuijin.value=zqsuijin;     

		//�ۺ�˰��
		var zhsjjs=zhglfjs+FormName.guanlif.value*1;//˰�����
		var suijin=zhsjjs*FormName.suijinbfb.value/100.0 ;
		suijin=round(suijin,2);
		FormName.suijin.value=suijin;     

		//˰���ۿ�
		var sjzk=FormName.suijin.value*10.0/FormName.zqsuijin.value;
		sjzk=round(sjzk,2);
		FormName.sjzk.value=sjzk;
		if (FormName.zqsuijin.value==0)
		{
			FormName.sjzk.value=10;
		}

		//��ǰ��ͬ�ܶ�=��ǰ����ֱ�ӷѣ���ǰ����ѣ���ǰ˰����ǰ����ҵ�������ѣ���ǰ����ҵ�������ѣ���ǰ��Ʒ�
		var wdzgce=FormName.zqgczjf.value*1.0+FormName.zqguanlif.value*1.0+FormName.zqsuijin.value*1.0+FormName.zqqtsf.value*1.0+FormName.zqwjrqyexm.value*1.0+FormName.zqsjf.value*1.0;
		wdzgce=round(wdzgce,2);
		FormName.wdzgce.value=wdzgce;     

		//�ۺ��ͬ�ܶ�=�ۺ󹤳�ֱ�ӷѣ��ۺ����ѣ��ۺ�˰���ۺ����ҵ�������ѣ��ۺ󲻼�ҵ�������ѣ��ۺ���Ʒ�
		var qye=FormName.zhgczjf.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhqtsf.value*1.0+FormName.zhwjrqyexm.value*1.0+FormName.sjf.value*1.0-FormName.djfxje.value*1.0-FormName.zjjmje.value*1.0;
		qye=round(qye,2);
		FormName.qye.value=qye;    

		//�ۺ��ۿ�
		var zkl=0;
		if (FormName.wdzgce.value*1!=0)
		{
			zkl=FormName.qye.value*10.0/FormName.wdzgce.value;
		}
		else{
			zkl=10;
		}
		zkl=round(zkl,2);
		FormName.zkl.value=zkl;    
		
		//��ͬ��ֵ=�ۺ��ͬ�ܶ˰���ۺ�-���;�ֵ-���ʹ���ȯ�����̷Ѽ�������Ѽ���˰������
		var htjz=FormName.qye.value*1.0-FormName.suijin.value*1.0-FormName.hdzsjz.value*1.0-FormName.djjje.value*1.0-FormName.cdzwjmje.value*1.0-FormName.glfjmje.value*1.0-FormName.sjjmje.value*1.0;
		htjz=round(htjz,2);
		FormName.htjz.value=htjz;    

		//ë����=��ͬ��ֵ��ʩ���ɱ���
		var mle=(FormName.htjz.value*1.0-FormName.sgcbj.value*1.0);
		mle=round(mle,2);
		FormName.mle.value=mle;    

		//ë����=ë����º�ͬ��ֵ
		var mll=FormName.mle.value*1.0/FormName.htjz.value*1.0*100;
		mll=round(mll,2);
		FormName.mll.value=mll;    

		//ҵ����ֵ=ë�����ҵ����ֵ����
		var yjjz=FormName.mle.value*100/FormName.yjjzcs.value;
		yjjz=round(yjjz,2);
		FormName.yjjz.value=yjjz;    

		<%
	}
	else if (dzbjjc.equals("3"))//3��ȫ���˹�¼��[�ۿ��ʡ�ǩԼ���ͬԭ����]�����Զ����㣬����¼����
	{
	}
	else if (dzbjjc.equals("6"))//6��ȫ���˹�¼��[�ۿ��ʡ�ǩԼ���ͬԭ����] �����Զ����㣬��¼����
	{
	}
	//4�����������ӱ��ۣ�[����ԭ����]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]�����ɸ�
	//7�����������ӱ��ۣ�[��ͬԭ����]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]�����ɸģ����޸������Ż�
	else if (dzbjjc.equals("4") || dzbjjc.equals("7"))
	{
		%>
		//���̷Ѽ����
		var zhgczjf=<%=oldzhgczjf%>-FormName.cdzwjmje.value*1.0;
		zhgczjf=round(zhgczjf,2);
		FormName.zhgczjf.value=zhgczjf;

		//����Ѽ����
		var guanlif=<%=oldguanlif%>-FormName.glfjmje.value*1.0;
		guanlif=round(guanlif,2);
		FormName.guanlif.value=guanlif;

		//˰������
		var suijin=<%=oldsuijin%>-FormName.sjjmje.value*1.0;
		suijin=round(suijin,2);
		FormName.suijin.value=suijin;


		//�ۺ��ͬ�ܶ�=�ۺ󹤳�ֱ�ӷѣ��ۺ����ѣ��ۺ�˰���ۺ����ҵ�������ѣ��ۺ󲻼�ҵ�������ѣ��ۺ���Ʒ�
		var qye=FormName.zhgczjf.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhqtsf.value*1.0+FormName.zhwjrqyexm.value*1.0+FormName.sjf.value*1.0-FormName.djfxje.value*1.0-FormName.zjjmje.value*1.0;
		qye=round(qye,2);
		FormName.qye.value=qye;    

		//�ۺ��ۿ�
		var zkl=0;
		if (FormName.wdzgce.value*1!=0)
		{
			zkl=FormName.qye.value*10.0/FormName.wdzgce.value;
		}
		else{
			zkl=10;
		}
		zkl=round(zkl,2);
		FormName.zkl.value=zkl;    
		
		//��ͬ��ֵ=��ͬ��ֵ�����̷Ѽ�������Ѽ���˰������
		var htjz=<%=oldhtjz%>-FormName.cdzwjmje.value*1.0-FormName.glfjmje.value*1.0-FormName.sjjmje.value*1.0;
		htjz=round(htjz,2);
		FormName.htjz.value=htjz;    

		//ë����=��ͬ��ֵ��ʩ���ɱ���
		var mle=(FormName.htjz.value*1.0-FormName.sgcbj.value*1.0);
		mle=round(mle,2);
		FormName.mle.value=mle;    

		//ë����=ë����º�ͬ��ֵ
		var mll=FormName.mle.value*1.0/FormName.htjz.value*1.0*100;
		mll=round(mll,2);
		FormName.mll.value=mll;    

		//ҵ����ֵ=ë�����ҵ����ֵ����
		var yjjz=FormName.mle.value*100/FormName.yjjzcs.value;
		yjjz=round(yjjz,2);
		FormName.yjjz.value=yjjz;    
		<%
	}
	else if (dzbjjc.equals("5"))//5�����������ӱ��ۣ�[����ԭ����]ȡ�Ե��ӱ��۲��ɸģ��˹�¼��[�ۿ���]���Զ�����[ǩԼ��]
	{
		%>
		//����ֱ�ӷѣ��ۺ�
		var zhgczjf=FormName.zqgczjf.value/10.0*FormName.gcfqdzk.value-FormName.cdzwjmje.value;
		zhgczjf=round(zhgczjf,2);
		FormName.zhgczjf.value=zhgczjf;

		//��Ʒѣ��ۺ�
		var sjf=FormName.zqsjf.value/10.0*FormName.sjfzk.value;
		sjf=round(sjf,2);
		FormName.sjf.value=sjf;

		//����ѣ��ۺ�
		var guanlif=FormName.zqguanlif.value*FormName.glfzk.value/10.0-FormName.glfjmje.value;
		guanlif=round(guanlif,2);
		FormName.guanlif.value=guanlif;      

		//�ۺ�˰��
		var suijin=FormName.zqsuijin.value*FormName.sjzk.value/10.0-FormName.sjjmje.value;
		suijin=round(suijin,2);
		FormName.suijin.value=suijin;     

		//�ۺ��ͬ�ܶ�=�ۺ󹤳�ֱ�ӷѣ��ۺ����ѣ��ۺ�˰���ۺ����ҵ�������ѣ��ۺ󲻼�ҵ�������ѣ��ۺ���Ʒ�
		var qye=FormName.zhgczjf.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhqtsf.value*1.0+FormName.zhwjrqyexm.value*1.0+FormName.sjf.value*1.0-FormName.djfxje.value*1.0-FormName.zjjmje.value*1.0;
		qye=round(qye,2);
		FormName.qye.value=qye;    

		//�ۺ��ۿ�
		var zkl=0;
		if (FormName.wdzgce.value*1!=0)
		{
			zkl=FormName.qye.value*10.0/FormName.wdzgce.value;
		}
		else{
			zkl=10;
		}
		zkl=round(zkl,2);
		FormName.zkl.value=zkl;    
		
		//��ͬ��ֵ=�ۺ��ͬ�ܶ˰���ۺ�-���;�ֵ-���ʹ���ȯ�����̷Ѽ�������Ѽ���˰������
		var htjz=FormName.qye.value*1.0-FormName.suijin.value*1.0-FormName.hdzsjz.value*1.0-FormName.djjje.value*1.0-FormName.cdzwjmje.value*1.0-FormName.glfjmje.value*1.0-FormName.sjjmje.value*1.0;
		htjz=round(htjz,2);
		FormName.htjz.value=htjz;    

		//ë����=��ͬ��ֵ��ʩ���ɱ���
		var mle=(FormName.htjz.value*1.0-FormName.sgcbj.value*1.0);
		mle=round(mle,2);
		FormName.mle.value=mle;    

		//ë����=ë����º�ͬ��ֵ
		var mll=FormName.mle.value*1.0/FormName.htjz.value*1.0*100;
		mll=round(mll,2);
		FormName.mll.value=mll;    

		//ҵ����ֵ=ë�����ҵ����ֵ����
		var yjjz=FormName.mle.value*100/FormName.yjjzcs.value;
		yjjz=round(yjjz,2);
		FormName.yjjz.value=yjjz;    
		<%
	}
	%>
	
	
	FormName.pmjj.value=parseInt(FormName.qye.value/FormName.fwmj.value);      
}    


function cf_hdbz(FormName){  
	if(FormName.hdbz.value=="1") {//1���ǻص��� 2�����ʦ�ص���3��ʩ���ӻص���4���Ͽͻ��ص�;5��Ա���ص�
		FormName.cgdz.value="";
		FormName.hdr.value="";

		FormName.cgdz.disabled=true;
		FormName.hdr.disabled=true;
	}
	else {
		FormName.cgdz.disabled=false;
		FormName.hdr.disabled=false;
	}
}      

function f_do(FormName)//����FormName:Form������
{
	calValue(FormName);


	if(	javaTrim(FormName.fkfabm)=="") {
		alert("������[�����]��");
		FormName.fkfabm.focus();
		return false;
	}

	if(	javaTrim(FormName.hth)=="") {
		alert("������[��ͬ��]��");
		FormName.hth.focus();
		return false;
	}
/*
	if(	javaTrim(FormName.smhtbh)=="") {
		alert("������[�����ͬ���]��");
		FormName.smhtbh.focus();
		return false;
	}
*/
	<%
	if (bjjb.equals(""))
	{
		%>
		if(	!radioChecked(FormName.bjjb)) {
			alert("��ѡ��[���ۼ���]��");
			FormName.bjjb[0].focus();
			return false;
		}
		<%
	}
	else 
	{
		%>
		if(!FormName.bjjb.checked) {
			alert("������[���ۼ���]��");
			FormName.bjjb.focus();
			return false;
		}
		<%
	}
	%>

	if(	javaTrim(FormName.khxm)=="") {
		alert("������[�ͻ�����]��");
		FormName.khxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xb)) {
		alert("��ѡ��[�Ա�]��");
		FormName.xb[0].focus();
		return false;
	}
	if(	javaTrim(FormName.clgw)=="") {
//		alert("������[���Ϲ���]��");
//		FormName.clgw.focus();
//		return false;
	}
	if(FormName.lxfs.value=="") {
		alert("������[��ϵ��ʽ]��");
		FormName.lxfs.focus();
		return false;
	}

	if(!(isEmail(FormName.email, "�����ʼ�"))) {
		return false;
	}

	if(	javaTrim(FormName.cqbm)=="") {
		alert("������[��������]��");
		FormName.cqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xqbm)=="") {
		alert("������[С��/�ֵ�]��");
		FormName.xqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.louhao)=="") {
		alert("������[¥��/���ƺ�]��");
		FormName.louhao.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("������[���ݵ�ַ]��");
		FormName.fwdz.focus();
		return false;
	}
		if(	javaTrim(FormName.sfzhm)=="") {
			alert("������[���֤����]��");
			FormName.sfzhm.focus();
			return false;
		}
		if(!(isSfzhm(FormName.sfzhm, "���֤����"))) {
			return false;
		}

<%
	if (ssfgs.equals("FBJ00"))
	{
		%>
		if(	!radioChecked(FormName.sffk)) {
			alert("��ѡ��[ˮ�ʷ������Ƿ񷢷�]��");
			FormName.sffk[0].focus();
			return false;
		}
		if (FormName.sffk[0].checked)
		{
			if(	javaTrim(FormName.djkh)=="") {
				alert("������[�Ǽǿ���]��");
				FormName.djkh.focus();
				return false;
			}
			if(	javaTrim(FormName.fkrq)=="") {
				alert("������[��������]��");
				FormName.fkrq.focus();
				return false;
			}
			if(!(isDatetime(FormName.fkrq, "��������"))) {
				return false;
			}
		}
		else{
			FormName.djkh.value="";
			FormName.fkrq.value="";
		}
		<%
	}
%>
	
	if(	javaTrim(FormName.dianz)=="") {
		alert("������[�곤]��");
		FormName.dianz.focus();
		return false;
	}
	if(	javaTrim(FormName.sjs)=="") {
		alert("������[���ʦ]��");
		FormName.sjs.focus();
		return false;
	}
	if(	javaTrim(FormName.khlxbm)=="") {
		alert("��ѡ��[��ϵ�ͻ�]��");
		FormName.khlxbm.focus();
		return false;
	}

	if(	javaTrim(FormName.hxbm)=="") {
		alert("������[����]��");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fgflbm)=="") {
		alert("������[������]��");
		FormName.fgflbm.focus();
		return false;
	}

	if(	javaTrim(FormName.fwmj)=="") {
		alert("������[���]��");
		FormName.fwmj.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "���"))) {
		return false;
	}
	if (parseInt(FormName.fwmj.value)==0)
	{
		alert("[���]����Ϊ0��");
		FormName.fwmj.select();
		return false;
	}


	if(	javaTrim(FormName.wdzgce)=="") {
		alert("������[��ͬ�ܶ��ǰ]��");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "����ԭ����"))) {
		return false;
	}
	if (parseFloat(FormName.wdzgce.value)==0)
	{
		alert("[��ͬ�ܶ��ǰ]����Ϊ0��");
		FormName.wdzgce.select();
		return false;
	}
	if (parseFloat(FormName.wdzgce.value)<parseFloat(FormName.qye.value))
	{
		alert("[��ͬ�ܶ��ǰ]����С��[��ͬ�ܶ�ۺ�]��");
		FormName.qye.select();
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("������[��ͬ�ܶ�ۺ�]��");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "��ͬ�ܶ�ۺ�"))) {
		return false;
	}
	if (parseFloat(FormName.qye.value)<=0)
	{
		alert("[��ͬ�ܶ�ۺ�]����С<=0��");
		FormName.qye.select();
		return false;
	}
	if(	javaTrim(FormName.zkl)=="") {
		alert("������[�ۺ��ۿ���]��");
		FormName.zkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zkl, "�ۺ��ۿ���"))) {
		return false;
	}
	if (FormName.zkl.value<0 || FormName.zkl.value>10)
	{
		alert("����[�ۺ��ۿ���]Ӧ����0��10֮�䣡");
		FormName.zkl.select();
		return false;
	}

	if(	javaTrim(FormName.cdzwjmje)=="") {
		alert("������[��]��");
		FormName.cdzwjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.cdzwjmje, "���̷Ѽ����"))) {
		return false;
	}
	if (  parseFloat(FormName.cdzwjmje.value)<-100 || parseFloat(FormName.cdzwjmje.value)>100)
	{
		alert("����[���̷Ѽ����]Ӧ����-100��100֮�䣡");
		FormName.cdzwjmje.select();
		return false;
	}
	if(	javaTrim(FormName.glfjmje)=="") {
		alert("������[����Ѽ����]��");
		FormName.glfjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.glfjmje, "����Ѽ����"))) {
		return false;
	}
	if ( parseFloat(FormName.glfjmje.value)<-100 || parseFloat(FormName.glfjmje.value)>100)
	{
		alert("����[����Ѽ����]Ӧ����-100��100֮�䣡");
		FormName.glfjmje.select();
		return false;
	}
	if(	javaTrim(FormName.sjjmje)=="") {
		alert("������[˰������]��");
		FormName.sjjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.sjjmje, "˰������"))) {
		return false;
	}
	if (  parseFloat(FormName.sjjmje.value)<-100 || parseFloat(FormName.sjjmje.value)>100)
	{
		alert("����[˰������]Ӧ����-100��100֮�䣡");
		FormName.sjjmje.select();
		return false;
	}



	
	if(	javaTrim(FormName.zqsjf)=="") {
		alert("������[��Ʒѣ���ǰ]��");
		FormName.zqsjf.focus();
		return false;
	}
	if(!(isFloat(FormName.zqsjf, "��Ʒѣ���ǰ"))) {
		return false;
	}
	if(	javaTrim(FormName.sjf)=="") {
		alert("������[��Ʒѣ��ۺ�]��");
		FormName.sjf.focus();
		return false;
	}
	if(!(isFloat(FormName.sjf, "��Ʒѣ��ۺ�"))) {
		return false;
	}
	if(	javaTrim(FormName.zqhtzcbj)=="") {
		alert("������[��ͬ���ı��ۣ���ǰ]��");
		FormName.zqhtzcbj.focus();
		return false;
	}
	if(!(isFloat(FormName.zqhtzcbj, "��ͬ���ı��ۣ���ǰ"))) {
		return false;
	}
	if(	javaTrim(FormName.zhhtzcbj)=="") {
		alert("������[��ͬ���ı��ۣ��ۺ�]��");
		FormName.zhhtzcbj.focus();
		return false;
	}
	if(!(isFloat(FormName.zhhtzcbj, "��ͬ���ı��ۣ��ۺ�"))) {
		return false;
	}
	if(	javaTrim(FormName.djfxje)=="") {
		alert("������[�����ֽ��]��");
		FormName.djfxje.focus();
		return false;
	}
	if(!(isFloat(FormName.djfxje, "�����ֽ��"))) {
		return false;
	}

	
	
	if(	javaTrim(FormName.suijinbfb)=="") {
		alert("������[˰��ٷֱ�]��");
		FormName.suijinbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.suijinbfb, "˰��ٷֱ�"))) {
		return false;
	}
	if (FormName.suijinbfb.value<0 || FormName.suijinbfb.value>100)
	{
		alert("����[˰��ٷֱ�]Ӧ����0��100֮�䣡");
		FormName.suijinbfb.select();
		return false;
	}
	if(	javaTrim(FormName.zqsuijin)=="") {
		alert("������[��ǰ˰��]��");
		FormName.zqsuijin.select();
		return false;
	}
	if(!(isFloat(FormName.zqsuijin, "��ǰ˰��"))) {
		return false;
	}
	if(	javaTrim(FormName.suijin)=="") {
		alert("������[˰��]��");
		FormName.suijin.select();
		return false;
	}
	if(!(isFloat(FormName.suijin, "˰��"))) {
		return false;
	}
	if (parseFloat(FormName.suijin.value)<0)
	{
		alert("[˰��]����<0��");
		FormName.suijin.select();
		return false;
	}
	if(	javaTrim(FormName.glf)=="") {
		alert("������[�����]��");
		FormName.select.focus();
		return false;
	}
	if(!(isFloat(FormName.glf, "�����"))) {
		return false;
	}

	if(	javaTrim(FormName.glfbfb)=="") {
		alert("������[����Ѱٷֱ�]��");
		FormName.glfbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.glfbfb, "����Ѱٷֱ�"))) {
		return false;
	}
	if (FormName.glfbfb.value<0 || FormName.glfbfb.value>100)
	{
		alert("����[����Ѱٷֱ�]Ӧ����0��100֮�䣡");
		FormName.glfbfb.select();
		return false;
	}
	if(	javaTrim(FormName.zqguanlif)=="") {
		alert("������[��ǰ�����]��");
		FormName.zqguanlif.select();
		return false;
	}
	if(!(isFloat(FormName.zqguanlif, "��ǰ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.guanlif)=="") {
		alert("������[�ۺ�����]��");
		FormName.guanlif.select();
		return false;
	}
	if(!(isFloat(FormName.guanlif, "�ۺ�����"))) {
		return false;
	}
	if (parseFloat(FormName.guanlif.value)<0)
	{
		alert("[�ۺ�����]����<0��");
		FormName.guanlif.select();
		return false;
	}


	if(	javaTrim(FormName.djjbfb)=="") {
		alert("������[����ȯ�ٷֱ�]��");
		FormName.djjbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.djjbfb, "����ȯ�ٷֱ�"))) {
		return false;
	}
	if (FormName.djjbfb.value<0 || FormName.djjbfb.value>100)
	{
		alert("����[����ȯ�ٷֱ�]Ӧ����0��100֮�䣡");
		FormName.djjbfb.select();
		return false;
	}
	if(	javaTrim(FormName.djjje)=="") {
		alert("������[���ʹ���ȯ]��");
		FormName.djjje.select();
		return false;
	}
	if(!(isFloat(FormName.djjje, "���ʹ���ȯ"))) {
		return false;
	}
	if(	javaTrim(FormName.hdzsjz)=="") {
		alert("������[���;�ֵ]��");
		FormName.hdzsjz.select();
		return false;
	}
	if(!(isFloat(FormName.hdzsjz, "���;�ֵ"))) {
		return false;
	}
	if(	javaTrim(FormName.sgcbj)=="") {
		alert("������[ʩ���ɱ���]��");
		FormName.sgcbj.select();
		return false;
	}
	if(!(isFloat(FormName.sgcbj, "ʩ���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.gcjcbj)=="") {
		alert("������[���̻�������]��");
		FormName.gcjcbj.select();
		return false;
	}
	if(!(isFloat(FormName.gcjcbj, "���̻�������"))) {
		return false;
	}
	if(	javaTrim(FormName.htjz)=="") {
		alert("������[��ͬ��ֵ]��");
		FormName.htjz.select();
		return false;
	}
	if(!(isFloat(FormName.htjz, "��ͬ��ֵ"))) {
		return false;
	}
	if (parseFloat(FormName.htjz.value)<0)
	{
		alert("[��ͬ��ֵ]����<0��");
		FormName.htjz.select();
		return false;
	}
	if(	javaTrim(FormName.mll)=="") {
		alert("������[ë����]��");
		FormName.mll.select();
		return false;
	}
	if(!(isFloat(FormName.mll, "ë����"))) {
		return false;
	}
	if (parseFloat(FormName.mll.value)>100)
	{
		alert("[ë����]����>100��");
		FormName.mll.select();
		return false;
	}

	if(	javaTrim(FormName.zqgczjf)=="") {
		alert("������[����ֱ�ӷѣ���ǰ]��");
		FormName.zqgczjf.select();
		return false;
	}
	if(!(isFloat(FormName.zqgczjf, "����ֱ�ӷѣ���ǰ"))) {
		return false;
	}
	if(	javaTrim(FormName.zhgczjf)=="") {
		alert("������[����ֱ�ӷѣ��ۺ�]��");
		FormName.zhgczjf.select();
		return false;
	}
	if(!(isFloat(FormName.zhgczjf, "����ֱ�ӷѣ��ۺ�"))) {
		return false;
	}


	if(	javaTrim(FormName.zqqtsf)=="") {
		alert("������[����ҵ�������ѣ���ǰ]��");
		FormName.zqqtsf.select();
		return false;
	}
	if(!(isFloat(FormName.zqqtsf, "����ҵ�������ѣ���ǰ"))) {
		return false;
	}
	if(	javaTrim(FormName.zhqtsf)=="") {
		alert("������[����ҵ�������ѣ��ۺ�]��");
		FormName.zhqtsf.select();
		return false;
	}
	if(!(isFloat(FormName.zhqtsf, "����ҵ�������ѣ��ۺ�"))) {
		return false;
	}

	if (FormName.zqqtsf.value!=0)
	{
		if(	javaTrim(FormName.qtsfsm)=="") {
			alert("������[����ҵ����������Ŀ]��");
			FormName.qtsfsm.select();
			return false;
		}
	}

	if(	javaTrim(FormName.zqwjrqyexm)=="") {
		alert("������[����ҵ�������ѣ���ǰ]��");
		FormName.zqwjrqyexm.select();
		return false;
	}
	if(!(isFloat(FormName.zqwjrqyexm, "����ҵ�������ѣ���ǰ"))) {
		return false;
	}
	if(	javaTrim(FormName.zhwjrqyexm)=="") {
		alert("������[����ҵ�������ѣ��ۺ�]��");
		FormName.zhwjrqyexm.select();
		return false;
	}
	if(!(isFloat(FormName.zhwjrqyexm, "����ҵ�������ѣ��ۺ�"))) {
		return false;
	}

	if (FormName.zqwjrqyexm.value!=0)
	{
		if(	javaTrim(FormName.wjrqyexmsm)=="") {
			alert("������[��ҵ����������Ŀ]��");
			FormName.wjrqyexmsm.select();
			return false;
		}
	}


	if(	javaTrim(FormName.pmjj)=="") {
		alert("������[ÿƽ�׾���]��");
		FormName.pmjj.focus();
		return false;
	}
	if(!(isNumber(FormName.pmjj, "ÿƽ�׾���"))) {
		return false;
	}






	if(	!radioChecked(FormName.sffj)) {
		alert("��ѡ��[�Ƿ�ȯ]��");
		FormName.sffj[0].focus();
		return false;
	}

	if (FormName.sffj[0].checked)
	{
		if(	javaTrim(FormName.fjje)=="") {
			alert("������[�����ܽ��]��");
			FormName.fjje.focus();
			return false;
		}
		if(!(isFloat(FormName.fjje, "�����ܽ��"))) {
			return false;
		}
		if(	javaTrim(FormName.gsfje)=="") {
			alert("������[��˾�е������]��");
			FormName.gsfje.focus();
			return false;
		}
		if(!(isFloat(FormName.gsfje, "��˾�е������"))) {
			return false;
		}
		if (parseFloat(FormName.fjje.value)<parseFloat(FormName.gsfje.value))
		{
			alert("[�����ܽ��]����С��[��˾�е������]��");
			FormName.gsfje.select();
			return false;
		}
	}
	else{
		FormName.fjje.value="";
		FormName.gsfje.value="";
	}


	if(	!radioChecked(FormName.sfyrz)) {
		alert("��ѡ��[�Ƿ�����֤]��");
		FormName.sfyrz[0].focus();
		return false;
	}

	if (FormName.sfyrz[0].checked)
	{
		if(	javaTrim(FormName.rzsc)=="") {
			alert("������[��֤�г�]��");
			FormName.rzsc.focus();
			return false;
		}
		if(	javaTrim(FormName.rzfbfb)=="") {
			alert("������[��֤�Ѱٷֱ�]��");
			FormName.rzfbfb.focus();
			return false;
		}
		if(!(isFloat(FormName.rzfbfb, "��֤�Ѱٷֱ�"))) {
			return false;
		}
		if (FormName.rzfbfb.value<0 || FormName.rzfbfb.value>100)
		{
			alert("����[��֤�Ѱٷֱ�]Ӧ����0��100֮�䣡");
			FormName.rzfbfb.select();
			return false;
		}
	}
	else{
		FormName.rzsc.value="";
		FormName.rzfbfb.value="";
	}

	if(	javaTrim(FormName.qyrq)=="") {
		alert("������[ǩԼ����]��");
		FormName.qyrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.qyrq, "ǩԼ����"))) {
		return false;
	}
	if (FormName.qyrq.value>"<%=cf.today()%>")
	{
		alert("[ǩԼ����]���ܴ���[����]��");
		FormName.qyrq.select();
		return false;
	}

	if (FormName.kgsjqd[0].checked)
	{
		if(	javaTrim(FormName.jyjdrq)=="") {
			alert("������[���齻������]��");
			FormName.jyjdrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.jyjdrq, "���齻������"))) {
			return false;
		}
		if(	javaTrim(FormName.kgrq)=="") {
			alert("������[��ͬ��������]��");
			FormName.kgrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.kgrq, "��ͬ��������"))) {
			return false;
		}
		if(	javaTrim(FormName.jgrq)=="") {
			alert("������[��ͬ��������]��");
			FormName.jgrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.jgrq, "��ͬ��������"))) {
			return false;
		}
		if (FormName.qyrq.value>FormName.jyjdrq.value)
		{
			alert("[���齻������]Ӧ����[ǩԼ����]��");
			FormName.jyjdrq.select();
			return false;
		}

		if (FormName.jyjdrq.value>FormName.kgrq.value)
		{
			alert("[��ͬ��������]Ӧ����[���齻������]��");
			FormName.kgrq.select();
			return false;
		}

		if (FormName.kgrq.value>=FormName.jgrq.value)
		{
			alert("[��ͬ��������]Ӧ����[��ͬ��������]��");
			FormName.jgrq.select();
			return false;
		}
		var num=days(FormName.jgrq.value,FormName.kgrq.value);
		if (num<45)
		{
			alert("�������ںͿ�������ʱ��������С��45�죬ĿǰΪ:"+num);
			FormName.jgrq.select();
			return false;
		}
	}
	else{
		if (FormName.jyjdrq.value!="")
		{
			alert("[����ʱ��]δȷ��������¼��[���齻������]��");
			FormName.jyjdrq.select();
			return false;
		}
		if (FormName.kgrq.value!="")
		{
			alert("[����ʱ��]δȷ��������¼��[��ͬ��������]��");
			FormName.kgrq.select();
			return false;
		}
		if (FormName.jgrq.value!="")
		{
			alert("[����ʱ��]δȷ��������¼��[��ͬ��������]��");
			FormName.jgrq.select();
			return false;
		}
	}



	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}


	if(	javaTrim(FormName.hdbz)=="") {
		alert("��ѡ��[�ص���־]��");
		FormName.hdbz.focus();
		return false;
	}

	if(FormName.hdbz.value=="1") {//1���ǻص��� 2�����ʦ�ص���3��ʩ���ӻص���4���Ͽͻ��ص�
		FormName.cgdz.value="";
		FormName.hdr.value="";
		FormName.hdsgd.value="";
		FormName.hdsgbz.value="";

		FormName.cgdz.disabled=true;
		FormName.hdr.disabled=true;
		FormName.hdsgd.disabled=true;
		FormName.hdsgbz.disabled=true;
	}
	else {
		if(	javaTrim(FormName.cgdz)=="") {
			alert("������[�ص�װ�޵�ַ]��");
			FormName.cgdz.focus();
			return false;
		}
		if(	javaTrim(FormName.hdr)=="") {
			alert("������[�ص���]��");
			FormName.hdr.focus();
			return false;
		}
		if(	javaTrim(FormName.hdsgd)=="") {
			alert("������[�ص����ضӳ�]��");
			FormName.hdsgd.focus();
			return false;
		}
		if(	javaTrim(FormName.hdsgbz)=="") {
			alert("������[�ص����ذ೤]��");
			FormName.hdsgbz.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.lrr)=="") {
		alert("������[��Ϣ¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[ǩԼ����]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("������[�����ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(!(isDatetime(FormName.yxsjs, "��Ա��Чʱ��ʼ"))) {
		return false;
	}
	if(!(isDatetime(FormName.yxsjz, "��Ա��Чʱ��ֹ"))) {
		return false;
	}
	if(	!radioChecked(FormName.jzbz)) {
		alert("��ѡ��[��װ��־]��");
		FormName.jzbz[0].focus();
		return false;
	}


	if(	javaTrim(FormName.gqts)=="") {
		alert("��ѡ��[��������]��");
		FormName.gqts.focus();
		return false;
	}
	if(!(isNumber(FormName.gqts, "��������"))) {
		return false;
	}

	FormName.action="SaveInsertCrm_khxx.jsp";
	FormName.submit();
	FormName.dyht1.disabled=false;
	FormName.dyht2.disabled=false;
	FormName.dyht3.disabled=false;

	return true;
}

function f_ck(FormName)//����FormName:Form������
{

	FormName.action="/dzbj/zxbjmx/Bj_khbjmxDyList.jsp";
	FormName.submit();
	return true;
}
function f_lrfkjh(FormName)//����FormName:Form������
{

	FormName.action="/cwgl/fkjh/InsertCw_jzfkjh.jsp";
	FormName.submit();
	FormName.ckfkjh.disabled=false;
	return true;
}

function f_dyht1(FormName)//����FormName:Form�����ƴ�ӡ��ͬԤ����ť
{

	FormName.action="/dyht/dyht1.jsp";
	FormName.submit();
	FormName.dyht.disabled=false;
	return true;
}
function f_dyht3(FormName)//����FormName:Form�����ƴ�ӡ��ͬԤ����ť
{

	FormName.action="/dyht/dyht3.jsp";
	FormName.submit();
	FormName.dyht.disabled=false;
	return true;
}
function f_zxxzdy(FormName)//����FormName:Form�����ƴ�ӡ��ͬԤ����ť
{

	FormName.action="/dyht/zxxzdy.jsp";
	FormName.submit();
	FormName.dyht.disabled=false;
	return true;
}
function f_dyht2(FormName)//����FormName:Form�����ƴ�ӡ��ͬԤ����ť
{

	if(FormName.bjjb.value=="B"||FormName.bjjb.value=="D"||FormName.bjjb.value=="E"||FormName.bjjb.value=="F")
	{
	FormName.action="/dyht/dyht2_tc.jsp";
	FormName.submit();
	FormName.dyht.disabled=false;
	return true;
	}
    else{
    FormName.action="/dyht/dyht2.jsp";
	FormName.submit();
	FormName.dyht.disabled=false;
	return true;
	}
	
	
}

function f_cxxydy11(FormName)//����FormName:Form�����ƴ�ӡ��ͬԤ����ť
{
    
    if(FormName.bjjb.value=="B"||FormName.bjjb.value=="D"||FormName.bjjb.value=="E"||FormName.bjjb.value=="F")
	{
		FormName.action="/cxxydy/cxxydy11_tc.jsp";
		FormName.submit();
	}
    else{
		FormName.action="/cxxydy/cxxydy11.jsp";
		FormName.submit();
		return true;
	}
}


//-->
</SCRIPT>
