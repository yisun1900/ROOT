<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE2 {	color: #FF0000;
	font-weight: bold;
}
.STYLE3 {color: #0000FF}
.STYLE4 {
	color: #990000;
	font-weight: bold;
}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String jsjlh=null;

String bxkh="";
String jjwjbz="";
String gcjdbm="";
String fgsbh=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;
int fwmj=0;
String hyh=null;
String cxhdbm=null;

String pdr=null;
String pdsj=null;
String jlbz=null;
String sgd=null;
String sgbz=null;
String zjxm=null;

String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;

String sjkgrq=null;
String sjjgrq=null;
String sjwjrq=null;
String gj=null;
String dd=null;
String khjl=null;
String gdjsjd=null;
String zjxxh="";
String khjsbz="";
String hxmc="";
String bjjbmc="";

double sjhtje=0;
double sssjf=0;

double wdzgce=0;
double qye=0;



double zqguanlif=0;
double guanlif=0;
double zqsuijin=0;
double suijin=0;
double glfbfb=0;

double zhzjxje=0;
double zjxsuijin=0;
double zjxguanlif=0;

double cwsfke=0;
double yjzck=0;
double fxjzck=0;
double sfke=0;
double dj=0;

double jsze=0;

double yjwk=0;
double yhje=0;
double fqbl=0;
double fqje=0;
double shfqje=0;


double zqljzjx=0;
double zhljzjx=0;
double zqhj=0;
double zhhj=0;

double djfxje=0;
double yhze=0;
double dyq=0;
double pck=0;
double khbjk=0;


double zqgczjf=0;
double zhgczjf=0;
double zkl=0;

double zjxje=0;
double zqzjxguanlif=0;
double zqzjxsuijin=0;
double zqqtsf=0;
double suijinbfb=0;

double zqqtsfzjx=0;
double zqwjrqyexm=0;
double zqwjrzjx=0;

double zqsjf=0;
double zqsjfzjx=0;
double zqhtzcbj=0;


double zcddjezq=0;
double zcddjezh=0;

double dgzcjezq=0;
double dgzcyh=0;
double zcjsje=0;
double zctcze=0;

String fxgck="";//��������
double fxdj=0;
String qtsfsm="";
String wjrqyexmsm="";
String zklmc="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select bxkh,khjsbz,cxhdbm,hyh,fwmj,zjxxh,gdjsjd,khjl,gj,dd,fgsbh,khxm,lxfs,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,sjwjrq,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" ,wdzgce,qye,zqguanlif,guanlif,glfbfb,zqsuijin,suijin,zhzjxje,zjxsuijin,zjxguanlif,cwsfke,sfke";
	ls_sql+=" ,hxmc,bjjbmc,zqljzjx,zhljzjx,qtsfsm,wjrqyexmsm,crm_khxx.jjwjbz,crm_khxx.gcjdbm ";

	ls_sql+=" ,zqgczjf,zhgczjf,zjxje,zqzjxguanlif,zqzjxsuijin,zqqtsf,suijinbfb,zqqtsfzjx,zqwjrqyexm,zqwjrzjx,zqsjf,zqsjfzjx,zqhtzcbj";
	
	ls_sql+=" from  crm_khxx,sq_dwxx,dm_hxbm,bdm_bjjbbm";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ls_sql+=" and  crm_khxx.hxbm=dm_hxbm.hxbm(+)";
	ls_sql+=" and  crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bxkh=cf.fillNull(rs.getString("bxkh"));
		jjwjbz=cf.fillNull(rs.getString("jjwjbz"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		qtsfsm=cf.fillNull(rs.getString("qtsfsm"));
		wjrqyexmsm=cf.fillNull(rs.getString("wjrqyexmsm"));
		zqgczjf=rs.getDouble("zqgczjf");
		zhgczjf=rs.getDouble("zhgczjf");
		zjxje=rs.getDouble("zjxje");
		zqzjxguanlif=rs.getDouble("zqzjxguanlif");
		zqzjxsuijin=rs.getDouble("zqzjxsuijin");
		zqqtsf=rs.getDouble("zqqtsf");
		suijinbfb=rs.getDouble("suijinbfb");
		zqqtsfzjx=rs.getDouble("zqqtsfzjx");
		zqwjrqyexm=rs.getDouble("zqwjrqyexm");
		zqwjrzjx=rs.getDouble("zqwjrzjx");
		zqsjf=rs.getDouble("zqsjf");
		zqsjfzjx=rs.getDouble("zqsjfzjx");
		zqhtzcbj=rs.getDouble("zqhtzcbj");
	
		
		
		
		hxmc=cf.fillNull(rs.getString("hxmc"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));

		khjsbz=cf.fillNull(rs.getString("khjsbz"));
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		zqljzjx=rs.getDouble("zqljzjx");
		zhljzjx=rs.getDouble("zhljzjx");

		zqguanlif=rs.getDouble("zqguanlif");
		guanlif=rs.getDouble("guanlif");
		glfbfb=rs.getDouble("glfbfb");
		zqsuijin=rs.getDouble("zqsuijin");
		suijin=rs.getDouble("suijin");
		zhzjxje=rs.getDouble("zhzjxje");
		zjxsuijin=rs.getDouble("zjxsuijin");
		zjxguanlif=rs.getDouble("zjxguanlif");
		cwsfke=rs.getDouble("cwsfke");
		sfke=rs.getDouble("sfke");

		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		hyh=cf.fillNull(rs.getString("hyh"));
		fwmj=rs.getInt("fwmj");
		zjxxh=cf.fillNull(rs.getString("zjxxh"));
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		khjl=cf.fillNull(rs.getString("khjl"));
		gj=cf.fillNull(rs.getString("gj"));
		dd=cf.fillNull(rs.getString("dd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));

		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();

	if (!khjsbz.equals("N"))
	{
		out.println("���󣡿ͻ��ѽ���");
		return;
	}

	if (!gcjdbm.equals("5"))//1��δ������2�����̿�����6�����ι�����ɣ�3���������գ�4�������깤��5��������᣻7����ͬ�쳣��ֹ
	{
		out.println("���󣡿ͻ�����δ���");
//		return;
	}

	if (!jjwjbz.equals("Y"))//N��δ��᣻Y�����
	{
		out.println("���󣡿ͻ��Ҿ�δ���");
//		return;
	}


	String zklx="";
	double zdzk=0;
	double gcfqdzk=0;
	ls_sql="SELECT zklx,zdzk,gcfqdzk";
	ls_sql+=" FROM crm_khzk  ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zklx=cf.fillNull(rs.getString("zklx"));
		zdzk=rs.getDouble("zdzk");
		gcfqdzk=rs.getDouble("gcfqdzk");
	}
	rs.close();
	ps.close();
	
	if (zklx.equals("1"))//1���������ۣ�2��������ۣ�3�����ַ��ô���
	{
		zkl=zdzk;

		zklmc="�����ۿ�:"+zkl;
	}
	else {
		zkl=gcfqdzk;
		zklmc="���̷��ۿ�:"+zkl;
	}

	//��������
	ls_sql="SELECT fxgck";
	ls_sql+=" FROM jc_cxhd  ";
	ls_sql+=" where cxhdmc='"+cxhdbm+"' and fgsbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fxgck=cf.fillNull(rs.getString("fxgck"));//�౶���ֹ��̿�
	}
	rs.close();
	ps.close();

	double zdfxdj=0;//����ֶ���
	ls_sql="select jc_cxhddjfxbz.zdfxdj";
	ls_sql+=" from jc_cxhd,jc_cxhddjfxbz";
	ls_sql+=" where jc_cxhd.cxhdbm=jc_cxhddjfxbz.cxhdbm and jc_cxhd.fgsbh='"+fgsbh+"'";
	ls_sql+=" and jc_cxhd.hdlx in('1','2') and jc_cxhd.cxhdmc='"+cxhdbm+"'";
	ls_sql+=" and qd<"+wdzgce+" and "+wdzgce+"<=zd ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zdfxdj=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	//�ͻ������ֶ���
	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl ";
	ls_sql+=" where cw_khfkjl.fkje!=0";
	ls_sql+=" and  cw_khfkjl.scbz='N'";
	ls_sql+=" and  cw_khfkjl.fklxbm in('52')";//51�����������52����������53����Ʒ�
	ls_sql+=" and khbh ='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fxdj=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	if (fxdj>zdfxdj)
	{
		fxdj=zdfxdj;
	}
	

	//��ͬ��Ʒ�
	ls_sql="SELECT sjhtje";
	ls_sql+=" FROM crm_zxkhxx  ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjhtje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//ʵ����Ʒ�
	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl  ";
	ls_sql+=" where cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and cw_khfkjl.fklxbm='53'";//53����Ʒ�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sssjf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//����ת��װ��
	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl  ";
	ls_sql+=" where cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and cw_khfkjl.fklxbm='11'";//11����װ��
	ls_sql+=" and cw_khfkjl.zffs='31'";//31��ת������
	ls_sql+=" and cw_khfkjl.zckx in('52','51')";//51�����������,52����������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dj=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	ls_sql="SELECT djjje,zjxdjjje,djjbfb,djfxje";
	ls_sql+=" FROM crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fqje=rs.getDouble("djjje");
		fqbl=rs.getDouble("djjbfb");
		shfqje=rs.getDouble("zjxdjjje");
		djfxje=rs.getDouble("djfxje");
	}
	rs.close();
	ps.close();

	//���̺ϼƣ���ǰ
	zqhj=cf.round(wdzgce+zqljzjx,2);
	//���̺ϼƣ��ۺ�
	zhhj=cf.round(qye+zhljzjx,2);

	//����ʩ���ܶ�ۺ󹤳̺ϼ�
	jsze=zqhj;

	yjwk=jsze-cwsfke;//Ӧ��װ��β��=����ʩ���ܶ�-�ͻ��ѽ�װ�޿�
	yjwk=cf.round(yjwk,0);

	//�ۿ��Ż�
	yhje=(zqhj-zhhj)-djfxje;
	yhje=cf.round(yhje,2);

	//�Żݺϼƽ��=�ۿ��Ż�+���������Żݣ���ȯ�Żݣ�����ȯ
	yhze=yhje+djfxje-shfqje;
	yhze=cf.round(yhze,0);


	//�ֽ����Ŀ�	
	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl  ";
	ls_sql+=" where cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and cw_khfkjl.fklxbm in('62')";//62������Ԥ����
	ls_sql+=" and ";
	ls_sql+=" ( ";
	ls_sql+=" cw_khfkjl.zffs not in('16','31')";//16��ֽ�ʲ���ȯ,31��ת������
	ls_sql+=" OR ";
	ls_sql+=" (cw_khfkjl.zffs in('31') and cw_khfkjl.zckx not in('67','55'))";//67����ֵ��ֵ��,55����ɫ������ȯ��
	ls_sql+=" ) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yjzck=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl,jc_zcdd  ";
	ls_sql+=" where cw_khfkjl.khbh='"+khbh+"' and scbz='N' and cw_khfkjl.ddbh=jc_zcdd.ddbh";
	ls_sql+=" and cw_khfkjl.fklxbm in('23')";//23:����
//	ls_sql+=" and jc_zcdd.ddlx  in('1','3','4','6','7','8','9','B','C')";
	//1������Ʒ��3����¼��ͬ��4���п�涩����5����׼�ײͣ�6���Ҿ߽����ײͣ�7����ů�����ײͣ�8�������ײͣ�9���������ģ�A:����������B:��������շѡ�C:ѡ������

	ls_sql+=" and ";
	ls_sql+=" ( ";
	ls_sql+=" cw_khfkjl.zffs not in('16','31')";//16��ֽ�ʲ���ȯ,31��ת������
	ls_sql+=" OR ";
	ls_sql+=" (cw_khfkjl.zffs in('31') and cw_khfkjl.zckx not in('67','55'))";//67����ֵ��ֵ��,55����ɫ������ȯ��
	ls_sql+=" ) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yjzck+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	yjzck=cf.round(yjzck,2);

	//���ֽ����Ŀ�	
	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl  ";
	ls_sql+=" where cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and cw_khfkjl.fklxbm in('62')";//23:����
	ls_sql+=" and ";
	ls_sql+=" ( ";
	ls_sql+=" cw_khfkjl.zffs in('16')";//16��ֽ�ʲ���ȯ,31��ת������
	ls_sql+=" OR ";
	ls_sql+=" (cw_khfkjl.zffs in('31') and cw_khfkjl.zckx in('67','55'))";//67����ֵ��ֵ��,55����ɫ������ȯ��
	ls_sql+=" ) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fxjzck=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl  ";
	ls_sql+=" where cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and cw_khfkjl.fklxbm in('67')";//67����ֵ��ֵ��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fxjzck+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl  ";
	ls_sql+=" where cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and cw_khfkjl.fklxbm in('55')";//55����ɫ������ȯ��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fxjzck+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl,jc_zcdd  ";
	ls_sql+=" where cw_khfkjl.khbh='"+khbh+"' and scbz='N' and cw_khfkjl.ddbh=jc_zcdd.ddbh";
	ls_sql+=" and cw_khfkjl.fklxbm in('23')";//23:����
//	ls_sql+=" and jc_zcdd.ddlx  in('1','3','4','6','7','8','9','B','C')";
	//1������Ʒ��3����¼��ͬ��4���п�涩����5����׼�ײͣ�6���Ҿ߽����ײͣ�7����ů�����ײͣ�8�������ײͣ�9���������ģ�A:����������B:��������շѡ�C:ѡ������
	ls_sql+=" and ";
	ls_sql+=" ( ";
	ls_sql+=" cw_khfkjl.zffs in('16')";//16��ֽ�ʲ���ȯ,31��ת������
	ls_sql+=" OR ";
	ls_sql+=" (cw_khfkjl.zffs in('31') and cw_khfkjl.zckx in('67','55'))";//67����ֵ��ֵ��,55����ɫ������ȯ��
	ls_sql+=" ) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fxjzck+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	fxjzck=cf.round(fxjzck,2);


	//�����ײ�
	ls_sql="SELECT sum(wdzje+zqzjhze)";
	ls_sql+=" FROM jc_zcdd  ";
	ls_sql+=" where (jc_zcdd.khbh='"+khbh+"')";
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09����ͬ�����
	ls_sql+=" and ddlx in('6','7','8','B','C')";//1������Ʒ��B:��������շѡ�C:ѡ�����ģ�3����¼��ͬ��4���п�涩����5���ײͷֽⶩ����6���Ҿ߽����ײͣ�7����ů�����ײͣ�8�������ײͣ�9��tcmc��������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zctcze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//�������
	double jddxhtzq=0;
	double jddxzjxzq=0;
	double jddxhtzh=0;
	double jddxzjxzh=0;
	ls_sql="SELECT sum(wdzje),sum(hkze),sum(zqzjhze),sum(zjhze)";
	ls_sql+=" FROM jc_zcdd  ";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and clzt>='09' and clzt not in('98','99')";//09����ͬ�����
	ls_sql+=" and ddlx in('1','3','4')";//�Ƿ�����ͬ  Y�����룻N��������
	//1������Ʒ��3����¼��ͬ��4���п�涩����5���ײͷֽⶩ����6���Ҿ߽����ײͣ�7����ů�����ײͣ�8�������ײͣ�9��tcmc��������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jddxhtzq=rs.getDouble(1);
		jddxhtzh=rs.getDouble(2);
		jddxzjxzq=rs.getDouble(3);
		jddxzjxzh=rs.getDouble(4);
	}
	rs.close();
	ps.close();

	zcddjezq=cf.round(jddxhtzq+jddxzjxzq,2);
	zcddjezh=cf.round(jddxhtzh+jddxzjxzh,2);


	//��������
	ls_sql="SELECT sum(wdzje+zqzjhze),sum((wdzje+zqzjhze)*khfdbl/100)";
	ls_sql+=" FROM jc_zcdd  ";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and clzt>='09' and clzt not in('98','99')";//09����ͬ�����
	ls_sql+=" and ddlx='9'";//1������Ʒ��3����¼��ͬ��4���п�涩����5���ײͷֽⶩ����6���Ҿ߽����ײͣ�7����ů�����ײͣ�8�������ײͣ�9����������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dgzcjezq=rs.getDouble(1);
		dgzcyh=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	dgzcyh+=fxjzck;
	dgzcyh=cf.round(dgzcyh,2);

	//���Ľ����
	zcjsje=zcddjezh+zctcze+dgzcjezq-dgzcyh-yjzck;
	zcjsje=cf.round(zcjsje,2);

	//�ͻ�������
	khbjk=(sjhtje-sssjf)+(yjwk-yhze)+zcjsje-pck;
	khbjk=cf.round(khbjk,0);
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
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

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_jrkhjs.jsp" name="insertform" target="_blank">
<div align="center">���Ի��ͻ�����(<font color="#0000FF">�ͻ����:<%=khbh%></font>)</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right"><font color="#0000FF">�ͻ�����</font></td>
    <td width="32%"><%=khxm%></td>
    <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">��ϵ��ʽ</font></td>
    <td width="32%"><%=lxfs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���ݵ�ַ</font></td>
    <td><%=fwdz%></td>
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">���</font></td>
    <td><%=fwmj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF">���޿���</td>
    <td><input name="bxkh" type="text" size="20" maxlength="20" value="<%=bxkh%>"></td>
    <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">����</font></td>
    <td><%=hxmc%></td>
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">���ۼ���</font></td>
    <td><%=bjjbmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">��ͬ��</font></td>
    <td><%=hth%></td>
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">��Ա����</font></td>
    <td><%=hyh%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ǩԼ����</font></td>
    <td><%=qyrq%> </td>
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">��������</font></td>
    <td><%=kgrq%></td>
  </tr>
</table>
  
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td colspan="4" align="center"><span class="STYLE4">��Ʒ����</span></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">��ͬ��Ʒ�</font></td> 
  <td width="32%">
	<input type="text" name="htsjf" value="<%=sjhtje%>" size="20" maxlength="17" readonly></td>
  <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">ʵ����Ʒ�</font></td> 
  <td width="32%">
	<input type="text" name="sssjf" value="<%=sssjf%>" size="20" maxlength="17" readonly></td>
</tr>
</table>
  
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td colspan="4" align="center"><span class="STYLE4">���̷����</span></td>
  </tr>
<tr align="center" bgcolor="#FFFFFF">
  <td>&nbsp;</td>
  <td><strong>��ͬ</strong></td>
  <td><strong>������</strong></td>
  <td><strong>�ϼ�</strong></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><strong>����ֱ�ӷ�</strong></td>
  <td width="32%" align="center"><%=zqgczjf%></td>
  <td align="center" width="25%"><%=zjxje%></td>
  <td width="25%" align="center"><%=cf.formatDouble(zqgczjf+zjxje)%></td>
</tr>
<%
if (zqqtsf+zqqtsfzjx+zqwjrqyexm+zqwjrzjx!=0)
{
	%>
	<tr bgcolor="#FFFFFF">
	  <td align="right"><strong><%=qtsfsm%>��<%=wjrqyexmsm%></strong></td>
	  <td align="center"><%=cf.round(zqqtsf+zqwjrqyexm,2)%></td>
	  <td align="center"><%=cf.round(zqqtsfzjx+zqwjrzjx,2)%></td>
	  <td align="center"><%=cf.round(zqqtsf+zqqtsfzjx+zqwjrqyexm+zqwjrzjx,2)%></td>
	</tr>
	<%
}
%>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><strong>�����(<%=glfbfb%>%)</strong></td>
  <td width="32%" align="center"><%=zqguanlif%></td>
  <td align="center" width="25%"><%=zqzjxguanlif%></td>
  <td width="25%" align="center"><%=cf.formatDouble(zqguanlif+zqzjxguanlif)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><strong>˰��(<%=suijinbfb%>%)</strong></td>
  <td align="center"><%=zqsuijin%></td>
  <td align="center"><%=zqzjxsuijin%></td>
  <td align="center"><%=cf.formatDouble(zqsuijin+zqzjxsuijin)%></td>
</tr>




<tr bgcolor="#FFFFFF">
  <td align="right"><strong>
    С ��</strong></td>
  <td align="center"><strong><%=cf.formatDouble(wdzgce)%>
    <input name="button7" type="button" onClick="window.open('/dhzx/sjszxone/dybj.jsp?khbh=<%=khbh%>')" value="��ͬ����">
  </strong></td>
  <td align="center"><strong><%=cf.formatDouble(zqljzjx)%>
    <input name="button8" type="button" onClick="window.open('/khxx/ViewZjxxx.jsp?khbh=<%=khbh%>')" value="������">
  </strong></td>
  <td align="center"><strong><%=cf.formatDouble(wdzgce+zqljzjx)%>
    <input name="button9" type="button" onClick=window.open("/khxx/ViewZxbj.jsp?khbh=<%=khbh%>") value="�ϼƽ��">
  </strong></td>
</tr>
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">�ͻ��ѽ�װ�޿�</font></td>
  <td width="32%"><input type="text" name="yjzxk" value="<%=cwsfke%>" size="20" maxlength="17" readonly></td>
  <td colspan="2" bgcolor="#FFFFFF">���ж���ת��װ��:<%=dj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">Ӧ��װ��β��</font></td>
  <td><input type="text" name="yjwk" value="<%=yjwk%>" size="20" maxlength="17" readonly></td>
  <td colspan="2"><strong>
    <input name="button2" type="button" onclick=window.open("/cwgl/jrkhjs/Cw_khfkjlJzCxList.jsp?khbh=<%=khbh%>") value="������ϸ">
  </strong></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#FFFFCC"><span class="STYLE4">�Ż����</span></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">���������</font></td>
  <td colspan="3"><%=cxhdbm%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">��ȯ�Ż�</font></td>
  <td><%=fqje%>  </td>
  <td colspan="2">��ȯ����:<%=fqbl%>�� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">�ۿ��Ż�</font></td>
  <td>
    <input type="text" name="yhje" value="<%=yhje%>" size="20" maxlength="17" readonly>  </td>
  <td colspan="2"><%=zklmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">���������Ż�</font></td>
  <td>
    <input type="text" name="djfxje" value="<%=djfxje%>" size="20" maxlength="17" readonly>  </td>
  <td colspan="2"><%=fxgck%>���������֣��ͻ�������:<%=fxdj%>�����������Ż�=<%=fxdj%>*(<%=fxgck%>-1)��*<%=zkl%>��</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>����ȯ</td>
  <td><input type="text" name="dyq" value="<%=dyq%>" size="20" maxlength="17" onChange="calValue(insertform)"></td>
  <td colspan="2">    �˹�¼��</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�ջؼ��ȯ���</td>
  <td><input type="text" name="shfqje" value="<%=shfqje%>" size="20" maxlength="17" onChange="calValue(insertform)">  </td>
  <td colspan="2">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000FF">�Żݺϼƽ��</font></td>
  <td><input type="text" name="yhze" value="<%=yhze%>" size="20" maxlength="17" readonly>  </td>
  <td colspan="2">�Żݽ��ۿ��Ż�+���������Żݣ�����ȯ-�ջؼ��ȯ���</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center" bgcolor="#FFFFCC"><span class="STYLE4">�������</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000FF">���ֽ����Ŀ�</font></td>
  <td><input type="text" name="yjzck" value="<%=yjzck%>" size="20" maxlength="17" readonly>    <strong>
    <input type="button" onclick=window.open("/cwgl/jrkhjs/Cw_khfkjlZcCxList.jsp?khbh=<%=khbh%>") value="������ϸ">
    </strong></td>
  <td align="right"><font color="#0000FF">���ֽ����Ŀ�</font></td>
  <td><input type="text" name="fxjzck" value="<%=fxjzck%>" size="20" maxlength="17" readonly>
    <strong>
    <input type="button" onclick=window.open("/cwgl/jrkhjs/Cw_khfkjlFxjZcCxList.jsp?khbh=<%=khbh%>") value="������ϸ">
    </strong></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000FF">�ڻ������</font></td>
  <td><font color="#0000FF">
    <input name="zcddjezq" type="text" value="<%=zcddjezh%>" size="20" maxlength="17" readonly>
    <strong>
    <input name="button32" type="button" onClick=window.open("/cwgl/jrkhjs/Jc_zcddJddxCxList.jsp?khbh=<%=khbh%>") value="�������">
    </strong></font></td>
  <td align="right"><font color="#0000FF">�������ײ�</font></td>
  <td><font color="#0000FF">
    <input name="zctcze" type="text" value="<%=zctcze%>" size="20" maxlength="17" readonly>
    <strong>
    <input name="button5" type="button" onclick=window.open("/cwgl/jrkhjs/Jc_zcddZctcCxList.jsp?khbh=<%=khbh%>") value="�����ײ�">
    </strong></font></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE3"><font color="#0000FF">��</font>��������</span></td>
  <td><input name="dgzcjezq" type="text"  value="<%=dgzcjezq%>" size="20" maxlength="17" readonly>
    <strong>
    <input name="button4" type="button" onClick=window.open("/cwgl/jrkhjs/Jc_zcddDgzcCxList.jsp?khbh=<%=khbh%>") value="��������">
    </strong></td>
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE3"><font color="#0000FF">��</font>���������Ż�</span></td>
  <td bgcolor="#FFFFFF"><font color="#0000FF">
    <input name="dgzcyh" type="text" value="<%=dgzcyh%>" size="20" maxlength="17" readonly>
  </font></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF" class="STYLE3">���Ľ����</td>
  <td colspan="3"><span class="STYLE2">
    <input name="zcjsje" type="text"  value="<%=zcjsje%>" size="20" maxlength="17" readonly>
    <font color="#990033"><strong>���Ľ����ڣ��ۣ����ܣ��ݣ�����</strong></font></span></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�ͻ��⳥��</td>
  <td><input type="text" name="pck" value="0" size="20" maxlength="17" onChange="calValue(insertform)"></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE3">�ͻ�������</span></td>
  <td><input type="text" name="khbjk" value="<%=khbjk%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">������</font></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">����ʱ��</font></td>
  <td width="32%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">¼�벿��</font></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ע</td>
  <td colspan="3"><textarea name="bz" cols="71" rows="3"></textarea>  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	  <input type="hidden" name="khbh" value="<%=khbh%>">
	  <input type="hidden" name="wdzgce" value="<%=wdzgce%>">
	  <input type="hidden" name="qye" value="<%=qye%>">
	  <input type="hidden" name="zqljzjx" value="<%=zqljzjx%>">
	  <input type="hidden" name="zhljzjx" value="<%=zhljzjx%>">
	  <input type="hidden" name="zqhj" value="<%=zqhj%>">
	  <input type="hidden" name="zhhj" value="<%=zhhj%>">

	  <input type="hidden" name="jsze" value="<%=jsze%>">
      <input type="hidden" name="dj" value="<%=dj%>"  >

      <input type="hidden" name="fqje" value="<%=fqje%>">
	  <input type="hidden" name="fqbl" value="<%=fqbl%>">

	  <input type="hidden" name="zcddyh" value="0">

	  <input type="button"  value="����" onClick="f_do(insertform)">
	  <input name="button6" type="button" onClick="window.open('/cwgl/jrkhjs/ViewGxhCw_jrkhjs.jsp?khbh=<%=khbh%>')"  value="��ӡ">
	<input type="reset"  value="����" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function calValue(FormName)
{  
	//�Żݽ��
	var yhze=FormName.yhje.value*1.0+FormName.djfxje.value*1.0+FormName.dyq.value*1.0-FormName.shfqje.value*1.0;
	yhze=round(yhze,0);
	FormName.yhze.value=yhze;

	//�ͻ�������
	var khbjk=(FormName.htsjf.value*1.0-FormName.sssjf.value*1.0)+(FormName.yjwk.value*1.0-FormName.yhze.value*1.0)+FormName.zcjsje.value*1.0-FormName.pck.value*1.0;
	khbjk=round(khbjk,0);
	FormName.khbjk.value=khbjk;
}

function f_do(FormName)//����FormName:Form������
{
	calValue(FormName);

	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if(	javaTrim(FormName.htsjf)=="") {
		alert("������[��ͬ��Ʒ�]��");
		FormName.htsjf.focus();
		return false;
	}
	if(!(isFloat(FormName.htsjf, "��ͬ��Ʒ�"))) {
		return false;
	}
	if(	javaTrim(FormName.sssjf)=="") {
		alert("������[ʵ����Ʒ�]��");
		FormName.sssjf.focus();
		return false;
	}
	if(!(isFloat(FormName.sssjf, "ʵ����Ʒ�"))) {
		return false;
	}
	if(	javaTrim(FormName.wdzgce)=="") {
		alert("������[ǩԼ�ܶ��ǰ]��");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "ǩԼ�ܶ��ǰ"))) {
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("������[ǩԼ�ܶ�ۺ�]��");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "ǩԼ�ܶ�ۺ�"))) {
		return false;
	}
	if(	javaTrim(FormName.zqljzjx)=="") {
		alert("������[�������ܶ��ǰ]��");
		FormName.zqljzjx.focus();
		return false;
	}
	if(!(isFloat(FormName.zqljzjx, "�������ܶ��ǰ"))) {
		return false;
	}
	if(	javaTrim(FormName.zhljzjx)=="") {
		alert("������[�������ܶ�ۺ�]��");
		FormName.zhljzjx.focus();
		return false;
	}
	if(!(isFloat(FormName.zhljzjx, "�������ܶ�ۺ�"))) {
		return false;
	}
	if(	javaTrim(FormName.zqhj)=="") {
		alert("������[���̺ϼƣ���ǰ]��");
		FormName.zqhj.focus();
		return false;
	}
	if(!(isFloat(FormName.zqhj, "���̺ϼƣ���ǰ"))) {
		return false;
	}
	if(	javaTrim(FormName.zhhj)=="") {
		alert("������[���̺ϼƣ��ۺ�]��");
		FormName.zhhj.focus();
		return false;
	}
	if(!(isFloat(FormName.zhhj, "���̺ϼƣ��ۺ�"))) {
		return false;
	}
	if(	javaTrim(FormName.jsze)=="") {
		alert("������[����ʩ���ܶ�]��");
		FormName.jsze.focus();
		return false;
	}
	if(!(isFloat(FormName.jsze, "����ʩ���ܶ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yjzxk)=="") {
		alert("������[�ѽ�װ�޿�]��");
		FormName.yjzxk.focus();
		return false;
	}
	if(!(isFloat(FormName.yjzxk, "�ѽ�װ�޿�"))) {
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("������[����תװ�޿�]��");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "����תװ�޿�"))) {
		return false;
	}
	if(	javaTrim(FormName.yjwk)=="") {
		alert("������[Ӧ��β��]��");
		FormName.yjwk.focus();
		return false;
	}
	if(!(isFloat(FormName.yjwk, "Ӧ��β��"))) {
		return false;
	}
	if(	javaTrim(FormName.yhje)=="") {
		alert("������[�ۿ��Ż�]��");
		FormName.yhje.focus();
		return false;
	}
	if(!(isFloat(FormName.yhje, "�ۿ��Ż�"))) {
		return false;
	}
	if(	javaTrim(FormName.fqbl)=="") {
		alert("������[��ȯ����]��");
		FormName.fqbl.focus();
		return false;
	}
	if(!(isFloat(FormName.fqbl, "��ȯ����"))) {
		return false;
	}
	if(	javaTrim(FormName.fqje)=="") {
		alert("������[��ȯ�Ż�]��");
		FormName.fqje.focus();
		return false;
	}
	if(!(isFloat(FormName.fqje, "��ȯ�Ż�"))) {
		return false;
	}
	if(	javaTrim(FormName.djfxje)=="") {
		alert("������[���������Ż�]��");
		FormName.djfxje.focus();
		return false;
	}
	if(!(isFloat(FormName.djfxje, "���������Ż�"))) {
		return false;
	}
	if(	javaTrim(FormName.dyq)=="") {
		alert("������[����ȯ]��");
		FormName.dyq.focus();
		return false;
	}
	if(!(isFloat(FormName.dyq, "����ȯ"))) {
		return false;
	}
	if(	javaTrim(FormName.yhze)=="") {
		alert("������[�Ż��ܶ�]��");
		FormName.yhze.focus();
		return false;
	}
	if(!(isFloat(FormName.yhze, "�Ż��ܶ�"))) {
		return false;
	}
	if(	javaTrim(FormName.shfqje)=="") {
		alert("������[�ջط�ȯ���]��");
		FormName.shfqje.focus();
		return false;
	}
	if(!(isFloat(FormName.shfqje, "�ջط�ȯ���"))) {
		return false;
	}
	if(	javaTrim(FormName.yjzck)=="") {
		alert("������[�ֽ����Ŀ�]��");
		FormName.yjzck.focus();
		return false;
	}
	if(!(isFloat(FormName.yjzck, "�ֽ����Ŀ�"))) {
		return false;
	}
	if(	javaTrim(FormName.fxjzck)=="") {
		alert("������[���ֽ����Ŀ�]��");
		FormName.fxjzck.focus();
		return false;
	}
	if(!(isFloat(FormName.fxjzck, "���ֽ����Ŀ�"))) {
		return false;
	}
	if(	javaTrim(FormName.zctcze)=="") {
		alert("������[�����ײ�]��");
		FormName.zctcze.focus();
		return false;
	}
	if(!(isFloat(FormName.zctcze, "�����ײ�"))) {
		return false;
	}
	if(	javaTrim(FormName.zcddjezq)=="") {
		alert("������[�������]��");
		FormName.zcddjezq.focus();
		return false;
	}
	if(!(isFloat(FormName.zcddjezq, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.zcddyh)=="") {
		alert("������[��������Ż�]��");
		FormName.zcddyh.focus();
		return false;
	}
	if(!(isFloat(FormName.zcddyh, "��������Ż�"))) {
		return false;
	}

	if(	javaTrim(FormName.dgzcjezq)=="") {
		alert("������[��������]��");
		FormName.dgzcjezq.focus();
		return false;
	}
	if(!(isFloat(FormName.dgzcjezq, "��������"))) {
		return false;
	}

	if(	javaTrim(FormName.dgzcyh)=="") {
		alert("������[���������Ż�]��");
		FormName.dgzcyh.focus();
		return false;
	}
	if(!(isFloat(FormName.dgzcyh, "���������Ż�"))) {
		return false;
	}
	if(	javaTrim(FormName.zcjsje)=="") {
		alert("������[���Ľ����]��");
		FormName.zcjsje.focus();
		return false;
	}
	if(!(isFloat(FormName.zcjsje, "���Ľ����"))) {
		return false;
	}
	if(	javaTrim(FormName.pck)=="") {
		alert("������[�⳥�����ڷ�]��");
		FormName.pck.focus();
		return false;
	}
	if(!(isFloat(FormName.pck, "�⳥�����ڷ�"))) {
		return false;
	}
	if(	javaTrim(FormName.khbjk)=="") {
		alert("������[�ͻ�������]��");
		FormName.khbjk.focus();
		return false;
	}
	if(!(isFloat(FormName.khbjk, "�ͻ�������"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[������]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[����ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("������[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
