<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE3 {color: #0000FF}
.STYLE4 {
	color: #990000;
	font-weight: bold;
}
.STYLE5 {color: #FF0000}
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

double zqguanlif=0;
double guanlif=0;
double zqsuijin=0;
double suijin=0;
double glfbfb=0;

double zhzjxje=0;
double zjxsuijin=0;
double zjxguanlif=0;

double cwsfke=0;

double sfke=0;

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


double zcddjezh=0;

double zctcze=0;

String fxgck="";//��������
double fxdj=0;
String qtsfsm="";
String wjrqyexmsm="";
String zklmc="";

//��������
String sftzk=null;//���������ۿ�
String sfyjsgcyh=null;
String sfyfq=null;
String sfydjfx=null;

String sfydyq=null;
String sfyzcfk=null;
String sfxmbm1=null;
String sfxmbm2=null;
String sfxmbm3=null;

String sfydxpzc=null;
String sfydxpzcyh=null;
String sfydgzc=null;
String sfydgzcyh=null;
String sfyjszcyh=null;

String sfykhpc=null;
String sfyyqf=null;

String sfyqtx1=null;
String qtx1mc=null;
String sfyqtx2=null;
String qtx2mc=null;
String sfyqtx3=null;
String qtx3mc=null;
String sfxsp=null;
String sfxsq=null;
///
String sftzkStyle="";

String sfyjsgcyhStyle="";

String sfyfqStyle=null;

String sfydjfxStyle=null;
String sfydjfxRead="";

String sfydyqStyle=null;
String sfydyqRead=null;

String sfyzcfkStyle=null;
String sfyzcfkRead=null;

String sfxmbm1Style=null;
String sfxmbm2Style=null;
String sfxmbm3Style=null;

String sfydxpzcStyle=null;
String sfydxpzcRead=null;
String sfydxpzcyhStyle=null;
String sfydxpzcyhRead=null;

String sfydgzcStyle=null;
String sfydgzcRead=null;
String sfydgzcyhStyle=null;
String sfydgzcyhRead=null;

String sfyjszcyhStyle=null;
String sfyjszcyhRead=null;

String sfykhpcStyle=null;
String sfykhpcRead=null;
String sfyyqfStyle=null;
String sfyyqfRead=null;

String sfyqtx1Style=null;
String sfyqtx1Read=null;
String sfyqtx2Style=null;
String sfyqtx2Read=null;
String sfyqtx3Style=null;
String sfyqtx3Read=null;
////////////////
double htsjf =0;//��ͬ��Ʒ�
double sssjf=0;//ʵ����Ʒ�

double wdzgce=0;//��ǰǩԼ�ܶ�
double qye=0;//�ۺ�ǩԼ�ܶ�

double zqljzjx=0;//��ǰ�������ܶ�
double zhljzjx=0;//�ۺ��������ܶ�

double zqgchj=0;//��ǰ���̺ϼ�
double zhgchj=0;//�ۺ󹤳̺ϼ�

double gcjsze=0;//���̽����ܶ�
double yjgck=0;//�ͻ��ѽ�װ�޿�
double yjgcwk=0;//Ӧ������β��
double djzgck=0;//����ת���̿�

double gczkyh=0;//�����ۿ��Ż�

double zxzkl=0;//���¿ͻ��ۿ�
double tzkxzyh=0;//���ۿ������Ż�
double zxqye=0;//�����ۺ�ǩԼ�ܶ�
double zxzhljzjx=0;//�����ۺ��������ܶ�

double jsgcyh=0;//���㹤���Ż�

double fqbl=0;//��ȯ����
double fqje=0;//��ȯ�Ż�
double shfqje=0;//�ջؼ��ȯ���
double shsgfq=0;//�ջ�ʩ����ȯ
double shzcfq=0;//�ջ����ķ�ȯ

double djfxje=0;//�������Ż�

double dyq=0;//����ȯ

double zcfkje=0;//���ķ�����

double sfxmbm1je=0;//�����շ���Ŀ1���
double sfxmbm2je=0;//�����շ���Ŀ2���
double sfxmbm3je=0;//�����շ���Ŀ3���

double gcyhze=0;//�����Ż���

double dxpzcje=0;//����Ʒ���Ľ��
double dxpzcyh=0;//����Ʒ�����Ż�
double dgzcje=0;//�������Ľ��
double dgzcyh=0;//���������Ż�

double jszcyh=0;//���������Ż�
double zcjsze=0;//���Ľ����ܶ�

double xjjzck=0;//�ֽ����Ŀ�
double fxjjzck=0;//���ֽ����Ŀ�

double ybjzck=0;//Ӧ�������Ŀ�

double khpck=0;//�ͻ��⳥��
double yqf=0;//���ڷ�
double sgdyqf=0;//ʩ���ӳе����ڷ�
double sjsyqf=0;//���ʦ�е����ڷ�
double csyqf=0;//���̳е����ڷ�

double qtx1je=0;//������1���
double qtx2je=0;//������2���
double qtx3je=0;//������3���

double khbjk=0;//�ͻ�������




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



	ls_sql="select sfydxpzcyh,sfydgzcyh,sfyjszcyh,sftzk,sfyfq,sfydjfx,sfydyq,sfydxpzc,sfydgzc,sfyzcfk,sfykhpc,sfyjsgcyh,sfyyqf,sfxmbm1,sfxmbm2,sfxmbm3,sfyqtx1,qtx1mc,sfyqtx2,qtx2mc,sfyqtx3,qtx3mc,sfxsp,sfxsq ";
	ls_sql+=" from  dm_khjscsb";
	ls_sql+=" where  (fgsbh='"+fgsbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sfydxpzcyh=cf.fillNull(rs.getString("sfydxpzcyh"));
		sfydgzcyh=cf.fillNull(rs.getString("sfydgzcyh"));
		sfyjszcyh=cf.fillNull(rs.getString("sfyjszcyh"));
		sftzk=cf.fillNull(rs.getString("sftzk"));
		sfyfq=cf.fillNull(rs.getString("sfyfq"));
		sfydjfx=cf.fillNull(rs.getString("sfydjfx"));
		sfydyq=cf.fillNull(rs.getString("sfydyq"));
		sfydxpzc=cf.fillNull(rs.getString("sfydxpzc"));
		sfydgzc=cf.fillNull(rs.getString("sfydgzc"));
		sfyzcfk=cf.fillNull(rs.getString("sfyzcfk"));
		sfykhpc=cf.fillNull(rs.getString("sfykhpc"));
		sfyjsgcyh=cf.fillNull(rs.getString("sfyjsgcyh"));
		sfyyqf=cf.fillNull(rs.getString("sfyyqf"));
		sfxmbm1=cf.fillNull(rs.getString("sfxmbm1"));
		sfxmbm2=cf.fillNull(rs.getString("sfxmbm2"));
		sfxmbm3=cf.fillNull(rs.getString("sfxmbm3"));
		sfyqtx1=cf.fillNull(rs.getString("sfyqtx1"));
		qtx1mc=cf.fillNull(rs.getString("qtx1mc"));
		sfyqtx2=cf.fillNull(rs.getString("sfyqtx2"));
		qtx2mc=cf.fillNull(rs.getString("qtx2mc"));
		sfyqtx3=cf.fillNull(rs.getString("sfyqtx3"));
		qtx3mc=cf.fillNull(rs.getString("qtx3mc"));
		sfxsp=cf.fillNull(rs.getString("sfxsp"));
		sfxsq=cf.fillNull(rs.getString("sfxsq"));
	}
	rs.close();
	ps.close();

	//���ݽ����������ȷ�����Ƿ���ʾ������������������������������ʼ

	if (sftzk.equals("1"))//1���ǣ�3����
	{
		sftzkStyle="block";
	}
	else
	{
		sftzkStyle="none";
	}

	if (sfyjsgcyh.equals("1"))//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfyjsgcyhStyle="block";
	}
	else if (sfyjsgcyh.equals("2"))//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfyjsgcyhStyle="block";
	}
	else//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfyjsgcyhStyle="none";
	}

	if (sfyfq.equals("1"))//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfyfqStyle="block";
	}
	else if (sfyfq.equals("2"))//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfyfqStyle="block";
	}
	else//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfyfqStyle="none";
	}

	if (sfydjfx.equals("1"))//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfydjfxStyle="block";
		sfydjfxRead="";
	}
	else if (sfydjfx.equals("2"))//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfydjfxStyle="block";
		sfydjfxRead="readonly";
	}
	else//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfydjfxStyle="none";
		sfydjfxRead="readonly";
	}

	if (sfydyq.equals("1"))//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfydyqStyle="block";
		sfydyqRead="";
	}
	else if (sfydyq.equals("2"))//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfydyqStyle="block";
		sfydyqRead="readonly";
	}
	else//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfydyqStyle="none";
		sfydyqRead="readonly";
	}

	if (sfyzcfk.equals("1"))//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfyzcfkStyle="block";
		sfyzcfkRead="";
	}
	else if (sfyzcfk.equals("2"))//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfyzcfkStyle="block";
		sfyzcfkRead="readonly";
	}
	else//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfyzcfkStyle="none";
		sfyzcfkRead="readonly";
	}

	if (sfxmbm1.equals(""))
	{
		sfxmbm1Style="none";
	}
	else{
		sfxmbm1Style="block";
	}
	if (sfxmbm2.equals(""))
	{
		sfxmbm2Style="none";
	}
	else{
		sfxmbm2Style="block";
	}
	if (sfxmbm3.equals(""))
	{
		sfxmbm3Style="none";
	}
	else{
		sfxmbm3Style="block";
	}

	
	if (sfydxpzc.equals("1"))//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfydxpzcStyle="block";
		sfydxpzcRead="";

		if (sfydxpzcyh.equals("1"))//1���ֹ�¼�룻2���Զ���ȡ��3����
		{
			sfydxpzcyhStyle="block";
			sfydxpzcyhRead="";
		}
		else if (sfydxpzcyh.equals("2"))//1���ֹ�¼�룻2���Զ���ȡ��3����
		{
			sfydxpzcyhStyle="block";
			sfydxpzcyhRead="readonly";
		}
		else{
			sfydxpzcyhStyle="none";
			sfydxpzcyhRead="readonly";
		}
	}
	else if (sfydxpzc.equals("2"))//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfydxpzcStyle="block";
		sfydxpzcRead="readonly";

		if (sfydxpzcyh.equals("1"))//1���ֹ�¼�룻2���Զ���ȡ��3����
		{
			sfydxpzcyhStyle="block";
			sfydxpzcyhRead="";
		}
		else if (sfydxpzcyh.equals("2"))//1���ֹ�¼�룻2���Զ���ȡ��3����
		{
			sfydxpzcyhStyle="block";
			sfydxpzcyhRead="readonly";
		}
		else{
			sfydxpzcyhStyle="none";
			sfydxpzcyhRead="readonly";
		}
	}
	else//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfydxpzcStyle="none";
		sfydxpzcRead="readonly";
		sfydxpzcyhStyle="none";
		sfydxpzcyhRead="readonly";
	}
	

	
	if (sfydgzc.equals("1"))//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfydgzcStyle="block";
		sfydgzcRead="";

		if (sfydgzcyh.equals("1"))//1���ֹ�¼�룻2���Զ���ȡ��3����
		{
			sfydgzcyhStyle="block";
			sfydgzcyhRead="";
		}
		else if (sfydgzcyh.equals("2"))//1���ֹ�¼�룻2���Զ���ȡ��3����
		{
			sfydgzcyhStyle="block";
			sfydgzcyhRead="readonly";
		}
		else{
			sfydgzcyhStyle="none";
			sfydgzcyhRead="readonly";
		}
	}
	else if (sfydgzc.equals("2"))//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfydgzcStyle="block";
		sfydgzcRead="readonly";

		if (sfydgzcyh.equals("1"))//1���ֹ�¼�룻2���Զ���ȡ��3����
		{
			sfydgzcyhStyle="block";
			sfydgzcyhRead="";
		}
		else if (sfydgzcyh.equals("2"))//1���ֹ�¼�룻2���Զ���ȡ��3����
		{
			sfydgzcyhStyle="block";
			sfydgzcyhRead="readonly";
		}
		else{
			sfydgzcyhStyle="none";
			sfydgzcyhRead="readonly";
		}
	}
	else//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfydgzcStyle="none";
		sfydgzcRead="readonly";
		sfydgzcyhStyle="none";
		sfydgzcyhRead="readonly";
	}
	
	if (sfyjszcyh.equals("1"))//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfyjszcyhStyle="block";
		sfyjszcyhRead="";
	}
	else if (sfyjszcyh.equals("2"))//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfyjszcyhStyle="block";
		sfyjszcyhRead="readonly";
	}
	else//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfyjszcyhStyle="none";
		sfyjszcyhRead="readonly";
	}


	if (sfykhpc.equals("1"))//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfykhpcStyle="block";
		sfykhpcRead="";
	}
	else if (sfykhpc.equals("2"))//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfykhpcStyle="block";
		sfykhpcRead="readonly";
	}
	else//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfykhpcStyle="none";
		sfykhpcRead="readonly";
	}

	if (sfyyqf.equals("1"))//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfyyqfStyle="block";
		sfyyqfRead="";
	}
	else if (sfyyqf.equals("2"))//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfyyqfStyle="block";
		sfyyqfRead="readonly";
	}
	else//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfyyqfStyle="none";
		sfyyqfRead="readonly";
	}

	if (sfyqtx1.equals("1"))//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfyqtx1Style="block";
		sfyqtx1Read="";
	}
	else if (sfyqtx1.equals("2"))//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfyqtx1Style="block";
		sfyqtx1Read="readonly";
	}
	else//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfyqtx1Style="none";
		sfyqtx1Read="readonly";
	}

	if (sfyqtx2.equals("1"))//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfyqtx2Style="block";
		sfyqtx2Read="";
	}
	else if (sfyqtx2.equals("2"))//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfyqtx2Style="block";
		sfyqtx2Read="readonly";
	}
	else//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfyqtx2Style="none";
		sfyqtx2Read="readonly";
	}

	if (sfyqtx3.equals("1"))//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfyqtx3Style="block";
		sfyqtx3Read="";
	}
	else if (sfyqtx3.equals("2"))//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfyqtx3Style="block";
		sfyqtx3Read="readonly";
	}
	else//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		sfyqtx3Style="none";
		sfyqtx3Read="readonly";
	}
/*
String sfyqtx1Style=null;
String sfyqtx1Read=null;
String sfyqtx2Style=null;
String sfyqtx2Read=null;
String sfyqtx3Style=null;
String sfyqtx3Read=null;
*/	
	//���ݽ����������ȷ�����Ƿ���ʾ������������������������������ʼ


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
		htsjf =rs.getDouble(1);
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
		djzgck=rs.getDouble(1);
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

	yjgck=cwsfke;//�ͻ��ѽ����̿�

	zxzkl=zkl;//���¿ͻ��ۿ�

	zxzhljzjx=zhljzjx;//�����ۺ�ǩԼ�ܶ�
	zxqye=qye;//�����ۺ��������ܶ�

	//���̺ϼƣ���ǰ
	zqgchj=cf.round(wdzgce+zqljzjx,2);
	//���̺ϼƣ��ۺ�
	zhgchj=cf.round(qye+zhljzjx,2);

	//����ʩ���ܶ�ۺ󹤳̺ϼ�
	gcjsze=zqgchj;

	yjgcwk=gcjsze-cwsfke;//Ӧ��װ��β��=����ʩ���ܶ�-�ͻ��ѽ�װ�޿�
	yjgcwk=cf.round(yjgcwk,0);

	//�ۿ��Ż�
	gczkyh=(zqgchj-zhgchj)-djfxje;
	gczkyh=cf.round(gczkyh,2);

	//�����Ż��ܶ����������������������������ʼ
	gcyhze=gczkyh;//�����ۿ��Ż�
	if (sftzk.equals("1"))//1���ǣ�3����
	{
		gcyhze=gcyhze+tzkxzyh;
	}
	if (!sfyjsgcyh.equals("3"))//���������ۿ�  1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		gcyhze=gcyhze+jsgcyh;//���ۿ������Ż�
	}

	if (!sfyfq.equals("3"))//�Ƿ��з�ȯ  1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		gcyhze=gcyhze+fqje-shfqje;
	}
	if (!sfydjfx.equals("3"))//�Ƿ��ж�����  1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		gcyhze=gcyhze+djfxje;
	}
	if (!sfydyq.equals("3"))//�Ƿ��е���ȯ  1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		gcyhze=gcyhze+dyq;
	}
	if (!sfyzcfk.equals("3"))//�Ƿ������ķ���  1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		gcyhze=gcyhze+zcfkje;
	}
	if (!sfxmbm1.equals(""))//�����շ���Ŀ1
	{
		gcyhze=gcyhze+sfxmbm1je;
	}
	if (!sfxmbm2.equals(""))//�����շ���Ŀ2
	{
		gcyhze=gcyhze+sfxmbm2je;
	}
	if (!sfxmbm3.equals(""))//�����շ���Ŀ3
	{
		gcyhze=gcyhze+sfxmbm3je;
	}

	gcyhze=cf.round(gcyhze,0);
	//�����Ż��ܶ������������������������������


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
		xjjzck=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl,jc_zcdd  ";
	ls_sql+=" where cw_khfkjl.khbh='"+khbh+"' and scbz='N' and cw_khfkjl.ddbh=jc_zcdd.ddbh";
	ls_sql+=" and cw_khfkjl.fklxbm in('23')";//23:����
//	ls_sql+=" and jc_zcdd.ddlx  in('1','3','4','6','7','8','9','B','C')";
	//1������Ʒ���ģ�3����¼��ͬ��4���п�涩����5����׼�ײͣ�6���Ҿ߽����ײͣ�7����ů�����ײͣ�8�������ײͣ�9���������ģ�A:����������B:��������շѡ�C:ѡ������

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
		xjjzck+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	xjjzck=cf.round(xjjzck,2);

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
		fxjjzck=rs.getDouble(1);
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
		fxjjzck+=rs.getDouble(1);
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
		fxjjzck+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl,jc_zcdd  ";
	ls_sql+=" where cw_khfkjl.khbh='"+khbh+"' and scbz='N' and cw_khfkjl.ddbh=jc_zcdd.ddbh";
	ls_sql+=" and cw_khfkjl.fklxbm in('23')";//23:����
//	ls_sql+=" and jc_zcdd.ddlx  in('1','3','4','6','7','8','9','B','C')";
	//1������Ʒ���ģ�3����¼��ͬ��4���п�涩����5����׼�ײͣ�6���Ҿ߽����ײͣ�7����ů�����ײͣ�8�������ײͣ�9���������ģ�A:����������B:��������շѡ�C:ѡ������
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
		fxjjzck+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	fxjjzck=cf.round(fxjjzck,2);


	//�����ײ�
	ls_sql="SELECT sum(wdzje+zqzjhze)";
	ls_sql+=" FROM jc_zcdd  ";
	ls_sql+=" where (jc_zcdd.khbh='"+khbh+"')";
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09����ͬ�����
	ls_sql+=" and ddlx in('6','7','8','B','C')";//1������Ʒ���ġ�B:��������շѡ�C:ѡ�����ģ�3����¼��ͬ��4���п�涩����5���ײͷֽⶩ����6���Ҿ߽����ײͣ�7����ů�����ײͣ�8�������ײͣ�9��tcmc��������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zctcze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//����Ʒ����
	double jddxhtzq=0;
	double jddxzjxzq=0;
	double jddxhtzh=0;
	double jddxzjxzh=0;
	ls_sql="SELECT sum(wdzje),sum(hkze),sum(zqzjhze),sum(zjhze)";
	ls_sql+=" FROM jc_zcdd  ";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and clzt>='09' and clzt not in('98','99')";//09����ͬ�����
	ls_sql+=" and ddlx in('1','3','4')";//�Ƿ�����ͬ  Y�����룻N��������
	//1������Ʒ���ģ�3����¼��ͬ��4���п�涩����5���ײͷֽⶩ����6���Ҿ߽����ײͣ�7����ů�����ײͣ�8�������ײͣ�9��tcmc��������
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

	if (sfydxpzcyh.equals("3"))//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		dxpzcje=cf.round(jddxhtzh+jddxzjxzh,2);
		dxpzcyh=0;
	}
	else{
		dxpzcje=cf.round(jddxhtzq+jddxzjxzq,2);//����Ʒ���Ľ��
		dxpzcyh=cf.round(cf.round(jddxhtzq+jddxzjxzq,2)-cf.round(jddxhtzh+jddxzjxzh,2),2);
	}



	//��������
	double dgzcjezq=0;
	double dgzcyhje=0;
	ls_sql="SELECT sum(wdzje+zqzjhze),sum((wdzje+zqzjhze)*khfdbl/100)";
	ls_sql+=" FROM jc_zcdd  ";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and clzt>='09' and clzt not in('98','99')";//09����ͬ�����
	ls_sql+=" and ddlx='9'";//1������Ʒ���ģ�3����¼��ͬ��4���п�涩����5���ײͷֽⶩ����6���Ҿ߽����ײͣ�7����ů�����ײͣ�8�������ײͣ�9����������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dgzcjezq=rs.getDouble(1);
		dgzcyhje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	if (sfydgzcyh.equals("3"))//1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		dgzcje=cf.round(dgzcjezq-dgzcyhje,2);
		dgzcyh=0;
	}
	else{
		dgzcje=dgzcjezq;
		dgzcyh=dgzcyhje;

		dgzcyh+=fxjjzck;
		dgzcyh=cf.round(dgzcyh,2);
	}


	//���Ľ����ܶ��������������������ʼ
	zcjsze=0;
	if (!sfydxpzc.equals("3"))//�Ƿ��д���Ʒ����  1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		zcjsze=zcjsze+dxpzcje;
	}
	if (!sfydxpzcyh.equals("3"))//�Ƿ��д���Ʒ�����Ż�  1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		zcjsze=zcjsze-dxpzcyh;
	}
	if (!sfydgzc.equals("3"))//�Ƿ��д�������   1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		zcjsze=zcjsze+dgzcje;
	}
	if (!sfydgzcyh.equals("3"))//�Ƿ��д��������Ż�  1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		zcjsze=zcjsze-dgzcyh;
	}
	if (!sfyjszcyh.equals("3"))//�Ƿ��н��������Ż�  1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		zcjsze=zcjsze-jszcyh;
	}

	zcjsze=cf.round(zcjsze,0);

	//Ӧ�������Ŀ�
	ybjzck=zcjsze-xjjzck-fxjjzck;
	ybjzck=cf.round(ybjzck,0);
	//���Ľ����ܶ����������������������


	//�ͻ����������������������������������ʼ
	khbjk=(htsjf -sssjf)+(yjgcwk-gcyhze)+ybjzck;
	if (!sfykhpc.equals("3"))//�Ƿ��пͻ��⳥��  1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		khbjk=khbjk-khpck;
	}
	if (!sfyyqf.equals("3"))//�Ƿ������ڷ�  1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		khbjk=khbjk-yqf;
	}
	if (!sfyqtx1.equals("3"))//�Ƿ���������1  1���ǣ�3����
	{
		khbjk=khbjk+qtx1je;
	}
	if (!sfyqtx2.equals("3"))//�Ƿ���������2  1���ǣ�3����
	{
		khbjk=khbjk+qtx2je;
	}
	if (!sfyqtx3.equals("3"))//�Ƿ���������3  1���ǣ�3����
	{
		khbjk=khbjk+qtx3je;
	}

	khbjk=cf.round(khbjk,0);
	//�ͻ������������������������������������
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
<form method="post" action="SaveInsertCw_khjsty.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">�ͻ�����</font></td>
    <td><%=khxm%></td>
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">��ϵ��ʽ</font></td>
    <td><%=lxfs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���ݵ�ַ</font></td>
    <td><%=fwdz%></td>
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">���</font></td>
    <td><%=fwmj%></td>
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
  <tr bgcolor="#FFFFCC">
    <td colspan="4" align="center"><span class="STYLE4">��Ʒ����</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>��ͬ��Ʒ�</span></td> 
  <td width="32%"><input type="text" name="htsjf" value="<%=htsjf%>" size="20" maxlength="17" readonly></td>
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>ʵ����Ʒ�</span></td> 
  <td width="32%"><input type="text" name="sssjf" value="<%=sssjf%>" size="20" maxlength="17" readonly></td>
</tr>

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
  <td align="right"><strong>����ֱ�ӷ�</strong></td>
  <td align="center"><%=zqgczjf%></td>
  <td align="center"><%=zjxje%></td>
  <td align="center"><%=cf.formatDouble(zqgczjf+zjxje)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><strong><%=qtsfsm%>��<%=wjrqyexmsm%></strong></td>
  <td align="center"><%=cf.round(zqqtsf+zqwjrqyexm,2)%></td>
  <td align="center"><%=cf.round(zqqtsfzjx+zqwjrzjx,2)%></td>
  <td align="center"><%=cf.round(zqqtsf+zqqtsfzjx+zqwjrqyexm+zqwjrzjx,2)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><strong>�����(<%=glfbfb%>%)</strong></td>
  <td align="center"><%=zqguanlif%></td>
  <td align="center"><%=zqzjxguanlif%></td>
  <td align="center"><%=cf.formatDouble(zqguanlif+zqzjxguanlif)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><strong>˰��(<%=suijinbfb%>%)</strong></td>
  <td align="center"><%=zqsuijin%></td>
  <td align="center"><%=zqzjxsuijin%></td>
  <td align="center"><%=cf.formatDouble(zqsuijin+zqzjxsuijin)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><strong> С ��</strong></td>
  <td align="center"><strong><%=cf.formatDouble(wdzgce)%>
        <input type="button" onClick="window.open('/dzbjone/zxbjmx/Bj_khbjmxDyList.jsp?khbh=<%=khbh%>')" value=" Ԥ�㱨��">
  </strong></td>
  <td align="center"><strong><%=cf.formatDouble(zqljzjx)%>
        <input type="button" onClick="window.open('/khxx/ViewZjxxx.jsp?khbh=<%=khbh%>')" value="������">
  </strong></td>
  <td align="center"><strong><%=cf.formatDouble(wdzgce+zqljzjx)%>
        <input type="button" onClick=window.open("/khxx/ViewZxbj.jsp?khbh=<%=khbh%>") value="���㱨��">
  </strong></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF"><span class="STYLE3"><span class="STYLE5">*</span></span>�ͻ��ѽ�װ�޿�</font></td>
  <td><input type="text" name="yjgck" value="<%=yjgck%>" size="20" maxlength="17" readonly></td>
  <td colspan="2" bgcolor="#FFFFFF">���ж���ת��װ��:<%=djzgck%>
    <input type="hidden" name="djzgck" value="<%=djzgck%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF"><span class="STYLE3"><span class="STYLE5">*</span></span>Ӧ��װ��β��</font></td>
  <td><input type="text" name="yjgcwk" value="<%=yjgcwk%>" size="20" maxlength="17" readonly></td>
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
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>�ͻ��ۿ�</span></td> 
  <td width="32%"> 
    <%=zklmc%><input type="hidden" name="zkl" value="<%=zkl%>" size="20" maxlength="9" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>�����ۿ��Ż�</span></td> 
  <td width="32%"><input type="text" name="gczkyh" value="<%=gczkyh%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sftzkStyle%>">
  <td align="right"><span class="STYLE3"><span class="STYLE5">*</span>���������ۿ�</span></td>
  <td><%
	cf.radioToken(out, "sftzk","1+��&3+��",sftzk,true);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sftzkStyle%>">
  <td align="right">���¿ͻ��ۿ�</td>
  <td><input type="text" name="zxzkl" value="<%=zxzkl%>" size="20" maxlength="9" onChange="calValue(insertform)"></td>
  <td align="right"><span class="STYLE3"><span class="STYLE5">*</span></span>���ۿ������Ż�</td>
  <td><input type="text" name="tzkxzyh" value="<%=tzkxzyh%>" size="20" maxlength="17" onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sftzkStyle%>">
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>�����ۺ�ǩԼ�ܶ�</span></td> 
  <td width="32%"><input type="text" name="zxqye" value="<%=zxqye%>" size="20" maxlength="17" readonly></td>
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>�����ۺ��������ܶ�</span></td> 
  <td width="32%"> 
    <input type="text" name="zxzhljzjx" value="<%=zxzhljzjx%>" size="20" maxlength="17" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfyjsgcyhStyle%>">
  <td align="right"><span class="STYLE3"><span class="STYLE5">*</span>�Ƿ��н��㹤���Ż�</span></td>
  <td><%
	cf.radioToken(out, "sfyjsgcyh","1+�ֹ�¼��&2+�Զ���ȡ&3+��",sfyjsgcyh,true);
%></td>
  <td align="right">���㹤���Ż�</td>
  <td><input type="text" name="jsgcyh" value="<%=jsgcyh%>" size="20" maxlength="17" onChange="calValue(insertform)"></td>
</tr>

<tr bgcolor="#FFFFFF" style="display:<%=sfyfqStyle%>">
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>�Ƿ��з�ȯ</span></td> 
  <td width="32%"><%
	cf.radioToken(out, "sfyfq","1+�ֹ�¼��&2+�Զ���ȡ&3+��",sfyfq,true);
%></td>
  <td align="right" width="18%">��ȯ����</td> 
  <td width="32%"> 
    <input type="text" name="fqbl" value="<%=fqbl%>" size="20" maxlength="9" onChange="calValue(insertform)">  </td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfyfqStyle%>">
  <td align="right" width="18%">��ȯ�Ż�</td> 
  <td width="32%"> 
    <input type="text" name="fqje" value="<%=fqje%>" size="20" maxlength="17" onChange="calValue(insertform)">  </td>
  <td align="right" width="18%">�ջؼ��ȯ���</td> 
  <td width="32%"> 
    <input type="text" name="shfqje" value="<%=shfqje%>" size="20" maxlength="17" onChange="calValue(insertform)">  </td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfyfqStyle%>">
  <td align="right" width="18%">�ջ�ʩ����ȯ</td> 
  <td width="32%"> 
    <input type="text" name="shsgfq" value="<%=shsgfq%>" size="20" maxlength="17" onChange="calValue(insertform)">  </td>
  <td align="right" width="18%">�ջ����ķ�ȯ</td> 
  <td width="32%"> 
    <input type="text" name="shzcfq" value="<%=shzcfq%>" size="20" maxlength="17" onChange="calValue(insertform)">  </td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfydjfxStyle%>">
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>�Ƿ��ж�����</span></td> 
  <td width="32%"><%
	cf.radioToken(out, "sfydjfx","1+�ֹ�¼��&2+�Զ���ȡ&3+��",sfydjfx,true);
%></td>
  <td align="right" width="18%">�������Ż�</td> 
  <td width="32%"> 
    <input type="text" name="djfxje" value="<%=djfxje%>" size="20" maxlength="17"   <%=sfydjfxRead%> onChange="calValue(insertform)">  </td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfydyqStyle%>">
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>�Ƿ��е���ȯ</span></td> 
  <td width="32%"><%
	cf.radioToken(out, "sfydyq","1+�ֹ�¼��&2+�Զ���ȡ&3+��",sfydyq,true);
%></td>
  <td align="right" width="18%">����ȯ</td> 
  <td width="32%"> 
    <input type="text" name="dyq" value="<%=dyq%>" size="20" maxlength="17"  <%=sfydyqRead%> onChange="calValue(insertform)">  </td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfyzcfkStyle%>">
  <td align="right"><span class="STYLE3"><span class="STYLE5">*</span>�Ƿ������ķ���</span></td>
  <td><%
	cf.radioToken(out, "sfyzcfk","1+�ֹ�¼��&2+�Զ���ȡ&3+��",sfyzcfk,true);
%></td>
  <td align="right">���ķ�����</td>
  <td><input type="text" name="zcfkje" value="<%=zcfkje%>" size="20" maxlength="17" <%=sfyzcfkRead%> onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfxmbm1Style%>">
  <td align="right"><span class="STYLE3">�����շ���Ŀ1</span></td>
  <td><select name="sfxmbm1" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where sfxmbm='"+sfxmbm1+"'",sfxmbm1);
%>
  </select></td>
  <td align="right"><span class="STYLE3">�����շ���Ŀ1���</span></td>
  <td><input type="text" name="sfxmbm1je" value="<%=sfxmbm1je%>" size="20" maxlength="17" readonly onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfxmbm2Style%>">
  <td align="right"><span class="STYLE3">�����շ���Ŀ2</span></td>
  <td><select name="sfxmbm2" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where sfxmbm='"+sfxmbm2+"'",sfxmbm2);
%>
  </select></td>
  <td align="right"><span class="STYLE3">�����շ���Ŀ2���</span></td>
  <td><input type="text" name="sfxmbm2je" value="<%=sfxmbm2je%>" size="20" maxlength="17" readonly onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfxmbm3Style%>">
  <td align="right"><span class="STYLE3">�����շ���Ŀ3</span></td>
  <td><select name="sfxmbm3" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where sfxmbm='"+sfxmbm3+"'",sfxmbm3);
%>
  </select></td>
  <td align="right"><span class="STYLE3">�����շ���Ŀ3���</span></td>
  <td><input type="text" name="sfxmbm3je" value="<%=sfxmbm3je%>" size="20" maxlength="17" readonly onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>�����Ż��ܶ�</span></td> 
  <td width="32%"> 
    <input type="text" name="gcyhze" value="<%=gcyhze%>" size="20" maxlength="17" readonly>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center" bgcolor="#FFFFCC"><span class="STYLE4">�������</span></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfydxpzcStyle%>">
  <td align="right"><span class="STYLE3"><span class="STYLE5">*</span>�Ƿ��д���Ʒ����</span></td>
  <td><%
	cf.radioToken(out, "sfydxpzc","1+�ֹ�¼��&2+�Զ���ȡ&3+��",sfydxpzc,true);
%></td>
  <td align="right"><font color="#0000FF"><strong>
    <input name="button32" type="button" onClick=window.open("/cwgl/jrkhjs/Jc_zcddJddxCxList.jsp?khbh=<%=khbh%>") value="����Ʒ����">
  </strong></font></td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfydxpzcStyle%>">
  <td align="right" width="18%">����Ʒ���Ľ��</td> 
  <td width="32%"> 
    <input type="text" name="dxpzcje" value="<%=dxpzcje%>" size="20" maxlength="17" <%=sfydxpzcRead%> onChange="calValue(insertform)">  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF"  style="display:<%=sfydxpzcyhStyle%>">
  <td align="right"><span class="STYLE3"><span class="STYLE5">*</span>�Ƿ��д���Ʒ�����Ż�</span></td>
  <td><%
	cf.radioToken(out, "sfydxpzcyh","1+�ֹ�¼��&2+�Զ���ȡ&3+��",sfydxpzcyh,true);
%></td>
  <td align="right">����Ʒ�����Ż�</td>
  <td><input type="text" name="dxpzcyh" value="<%=dxpzcyh%>" size="20" maxlength="17" <%=sfydxpzcyhRead%> onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfydgzcStyle%>">
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>�Ƿ��д�������</span></td> 
  <td width="32%"><%
	cf.radioToken(out, "sfydgzc","1+�ֹ�¼��&2+�Զ���ȡ&3+��",sfydgzc,true);
%></td>
  <td align="right" width="18%"><strong>
    <input type="button" onClick=window.open("/cwgl/jrkhjs/Jc_zcddDgzcCxList.jsp?khbh=<%=khbh%>") value="��������">
  </strong></td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfydgzcStyle%>">
  <td align="right">�������Ľ��</td>
  <td><input type="text" name="dgzcje" value="<%=dgzcje%>" size="20" maxlength="17"  <%=sfydgzcRead%> onChange="calValue(insertform)"></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF"  style="display:<%=sfydgzcyhStyle%>">
  <td align="right"><span class="STYLE3"><span class="STYLE5">*</span>�Ƿ��д��������Ż�</span></td>
  <td><%
	cf.radioToken(out, "sfydgzcyh","1+�ֹ�¼��&2+�Զ���ȡ&3+��",sfydgzcyh,true);
%></td>
  <td align="right">���������Ż�</td>
  <td><input type="text" name="dgzcyh" value="<%=dgzcyh%>" size="20" maxlength="17" <%=sfydgzcyhRead%> onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfyjszcyhStyle%>">
  <td align="right"><span class="STYLE5">*</span><span class="STYLE3">�Ƿ��н��������Ż�</span></td>
  <td><%
	cf.radioToken(out, "sfyjszcyh","1+�ֹ�¼��&2+�Զ���ȡ&3+��",sfyjszcyh,true);
%></td>
  <td align="right">���������Ż�</td>
  <td><input type="text" name="jszcyh" value="<%=jszcyh%>" size="20" maxlength="17" <%=sfyjszcyhRead%> onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>���Ľ����ܶ�</span></td> 
  <td width="32%"><input type="text" name="zcjsze" value="<%=zcjsze%>" size="20" maxlength="17" readonly></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>�ֽ����Ŀ�</span></td> 
  <td width="32%"> 
    <input type="text" name="xjjzck" value="<%=xjjzck%>" size="20" maxlength="17" readonly>
    <strong>
    <input name="button" type="button" onclick=window.open("/cwgl/jrkhjs/Cw_khfkjlZcCxList.jsp?khbh=<%=khbh%>") value="������ϸ">
    </strong> </td>
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>���ֽ����Ŀ�</span></td> 
  <td width="32%"> 
    <input type="text" name="fxjjzck" value="<%=fxjjzck%>" size="20" maxlength="17" readonly>
    <strong>
    <input name="button3" type="button" onclick=window.open("/cwgl/jrkhjs/Cw_khfkjlFxjZcCxList.jsp?khbh=<%=khbh%>") value="������ϸ">
    </strong> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>Ӧ�������Ŀ�</span></td> 
  <td width="32%"> 
    <input type="text" name="ybjzck" value="<%=ybjzck%>" size="20" maxlength="17" readonly>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center" bgcolor="#FFFFCC"><span class="STYLE4">�����ۿ�</span></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfykhpcStyle%>">
  <td align="right"><span class="STYLE3"><span class="STYLE5">*</span>�Ƿ��пͻ��⳥��</span></td>
  <td><%
	cf.radioToken(out, "sfykhpc","1+�ֹ�¼��&2+�Զ���ȡ&3+��",sfykhpc,true);
%></td>
  <td align="right">�ͻ��⳥��</td>
  <td><input type="text" name="khpck" value="<%=khpck%>" size="20" maxlength="17" <%=sfykhpcRead%> onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF"  style="display:<%=sfyyqfStyle%>">
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>�Ƿ������ڷ�</span></td> 
  <td width="32%"><%
	cf.radioToken(out, "sfyyqf","1+�ֹ�¼��&2+�Զ���ȡ&3+��",sfyyqf,true);
%></td>
  <td align="right" width="18%">���ڷ�</td> 
  <td width="32%"><input type="text" name="yqf" value="<%=yqf%>" size="20" maxlength="17" <%=sfyyqfRead%> onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF"  style="display:<%=sfyyqfStyle%>">
  <td align="right" width="18%">ʩ���ӳе����ڷ�</td> 
  <td width="32%"><input type="text" name="sgdyqf" value="<%=sgdyqf%>" size="20" maxlength="17" <%=sfyyqfRead%>></td>
  <td align="right" width="18%">���ʦ�е����ڷ�</td> 
  <td width="32%"><input type="text" name="sjsyqf" value="<%=sjsyqf%>" size="20" maxlength="17" <%=sfyyqfRead%>></td>
</tr>
<tr bgcolor="#FFFFFF"  style="display:<%=sfyyqfStyle%>">
  <td align="right" width="18%">���̳е����ڷ�</td> 
  <td width="32%"><input type="text" name="csyqf" value="<%=csyqf%>" size="20" maxlength="17" <%=sfyyqfRead%>></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfyqtx1Style%>">
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>�Ƿ���������1</span></td> 
  <td width="32%"><%
	cf.radioToken(out, "sfyqtx1","1+��&3+��",sfyqtx1,true);
%></td>
  <td align="right" width="18%">������1���</td> 
  <td width="32%"><input type="text" name="qtx1je" value="<%=qtx1je%>" size="20" maxlength="17" <%=sfyqtx1Read%> onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfyqtx1Style%>">
  <td align="right" width="18%">������1����</td> 
  <td colspan="3"><input type="text" name="qtx1mc" value="<%=qtx1mc%>" size="73" maxlength="50" <%=sfyqtx1Read%>></td>
  </tr>
<tr bgcolor="#FFFFFF"  style="display:<%=sfyqtx2Style%>">
  <td align="right"><span class="STYLE3"><span class="STYLE5">*</span>�Ƿ���������2</span></td>
  <td><%
	cf.radioToken(out, "sfyqtx2","1+��&3+��",sfyqtx2,true);
%></td>
  <td align="right">������2���</td>
  <td><input type="text" name="qtx2je" value="<%=qtx2je%>" size="20" maxlength="17" <%=sfyqtx2Read%> onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF"  style="display:<%=sfyqtx2Style%>">
  <td align="right" width="18%">������2����</td> 
  <td colspan="3"> 
    <input type="text" name="qtx2mc" value="<%=qtx2mc%>" size="73" maxlength="50" <%=sfyqtx2Read%>>  </td>
  </tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfyqtx3Style%>">
  <td align="right" width="18%"><span class="STYLE3"><span class="STYLE5">*</span>�Ƿ���������3</span></td> 
  <td width="32%"><%
	cf.radioToken(out, "sfyqtx3","1+��&3+��",sfyqtx3,true);
%></td>
  <td align="right" width="18%">������3���</td> 
  <td width="32%"><input type="text" name="qtx3je" value="<%=qtx3je%>" size="20" maxlength="17" <%=sfyqtx3Read%> onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfyqtx3Style%>">
  <td align="right" width="18%">������3����</td> 
  <td colspan="3"><input type="text" name="qtx3mc" value="<%=qtx3mc%>" size="73" maxlength="50" <%=sfyqtx3Read%>></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE5">*</span><span class="STYLE3">�ͻ�������</span></td>
  <td><input type="text" name="khbjk" value="<%=khbjk%>" size="20" maxlength="17" readonly></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">¼����</font></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
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

	<input type="button"  value="����" onClick="f_do(insertform)">
	<input name="button6" type="button" onClick="window.open('ViewCw_khjsty.jsp?khbh=<%=khbh%>')"  value="��ӡ">
	<input type="reset"  value="����" name="reset">
    <input type="hidden" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="17" >
    <input type="hidden" name="qye" value="<%=qye%>" size="20" maxlength="17" >
    <input type="hidden" name="zqljzjx" value="<%=zqljzjx%>" size="20" maxlength="17" >
    <input type="hidden" name="zhljzjx" value="<%=zhljzjx%>" size="20" maxlength="17" >
    <input type="hidden" name="zqgchj" value="<%=zqgchj%>" size="20" maxlength="17" >
    <input type="hidden" name="zhgchj" value="<%=zhgchj%>" size="20" maxlength="17" >
    <input type="hidden" name="gcjsze" value="<%=gcjsze%>" size="20" maxlength="17" ></td>
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
	//�����Ż��ܶ����������������������������ʼ
	var gcyhze=FormName.gczkyh.value*1.0;//�����ۿ��Ż�
	if (FormName.sftzk.value=="1")//1���ǣ�3����
	{
		gcyhze=gcyhze+FormName.tzkxzyh.value*1.0;
	}


	if (FormName.sfyjsgcyh.value!="3")//���������ۿ�  1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		gcyhze=gcyhze+FormName.jsgcyh.value*1.0;//���ۿ������Ż�
	}

	if (FormName.sfyfq.value!="3")//�Ƿ��з�ȯ  1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		gcyhze=gcyhze+FormName.fqje.value*1.0-FormName.shfqje.value*1.0;
	}


	if (FormName.sfydjfx.value!="3")//�Ƿ��ж�����  1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		gcyhze=gcyhze+FormName.djfxje.value*1.0;
	}
	if (FormName.sfydyq.value!="3")//�Ƿ��е���ȯ  1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		gcyhze=gcyhze+FormName.dyq.value*1.0;
	}
	if (FormName.sfyzcfk.value!="3")//�Ƿ������ķ���  1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		gcyhze=gcyhze+FormName.zcfkje.value*1.0;
	}

	if (FormName.sfxmbm1.value!="")//�����շ���Ŀ1
	{
		gcyhze=gcyhze+FormName.sfxmbm1je.value*1.0;
	}
	if (FormName.sfxmbm2.value!="")//�����շ���Ŀ2
	{
		gcyhze=gcyhze+FormName.sfxmbm2je.value*1.0;
	}
	if (FormName.sfxmbm3.value!="")//�����շ���Ŀ3
	{
		gcyhze=gcyhze+FormName.sfxmbm3je.value*1.0;
	}

	gcyhze=round(gcyhze,0);
	FormName.gcyhze.value=gcyhze;

	//�����Ż��ܶ������������������������������


	//���Ľ����ܶ��������������������ʼ
	var zcjsze=0;
	if (FormName.sfydxpzc.value!="3")//�Ƿ��д���Ʒ����  1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		zcjsze=zcjsze+FormName.dxpzcje.value*1.0;
	}
	if (FormName.sfydxpzcyh.value!="3")//�Ƿ��д���Ʒ�����Ż�  1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		zcjsze=zcjsze-FormName.dxpzcyh.value*1.0;
	}
	if (FormName.sfydgzc.value!="3")//�Ƿ��д�������   1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		zcjsze=zcjsze+FormName.dgzcje.value*1.0;
	}
	if (FormName.sfydgzcyh.value!="3")//�Ƿ��д��������Ż�  1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		zcjsze=zcjsze-FormName.dgzcyh.value*1.0;
	}
	if (FormName.sfyjszcyh.value!="3")//�Ƿ��н��������Ż�  1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		zcjsze=zcjsze-FormName.jszcyh.value*1.0;
	}

	zcjsze=round(zcjsze,0);
	FormName.zcjsze.value=zcjsze;

	//Ӧ�������Ŀ�
	ybjzck=FormName.zcjsze.value*1.0-FormName.xjjzck.value*1.0-FormName.fxjjzck.value*1.0;
	ybjzck=round(ybjzck,0);
	FormName.ybjzck.value=ybjzck;
	//���Ľ����ܶ����������������������

	//�ͻ����������������������������������ʼ
	var khbjk=0;
	khbjk=(FormName.htsjf.value*1.0 -FormName.sssjf.value*1.0)+(FormName.yjgcwk.value*1.0-FormName.gcyhze.value*1.0)+FormName.ybjzck.value*1.0;
	if (FormName.sfykhpc.value!="3")//�Ƿ��пͻ��⳥��  1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		khbjk=khbjk-FormName.khpck.value*1.0;
	}
	if (FormName.sfyyqf.value!="3")//�Ƿ������ڷ�  1���ֹ�¼�룻2���Զ���ȡ��3����
	{
		khbjk=khbjk-FormName.yqf.value*1.0;
	}
	if (FormName.sfyqtx1.value!="3")//�Ƿ���������1  1���ǣ�3����
	{
		khbjk=khbjk+FormName.qtx1je.value*1.0;
	}
	if (FormName.sfyqtx2.value!="3")//�Ƿ���������2  1���ǣ�3����
	{
		khbjk=khbjk+FormName.qtx2je.value*1.0;
	}
	if (FormName.sfyqtx3.value!="3")//�Ƿ���������3  1���ǣ�3����
	{
		khbjk=khbjk+FormName.qtx3je.value*1.0;
	}

	khbjk=round(khbjk,0);
	FormName.khbjk.value=khbjk;
	//�ͻ������������������������������������
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
		alert("������[��ǰǩԼ�ܶ�]��");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "��ǰǩԼ�ܶ�"))) {
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("������[�ۺ�ǩԼ�ܶ�]��");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "�ۺ�ǩԼ�ܶ�"))) {
		return false;
	}
	if(	javaTrim(FormName.zqljzjx)=="") {
		alert("������[��ǰ�������ܶ�]��");
		FormName.zqljzjx.focus();
		return false;
	}
	if(!(isFloat(FormName.zqljzjx, "��ǰ�������ܶ�"))) {
		return false;
	}
	if(	javaTrim(FormName.zhljzjx)=="") {
		alert("������[�ۺ��������ܶ�]��");
		FormName.zhljzjx.focus();
		return false;
	}
	if(!(isFloat(FormName.zhljzjx, "�ۺ��������ܶ�"))) {
		return false;
	}
	if(	javaTrim(FormName.zqgchj)=="") {
		alert("������[��ǰ���̺ϼ�]��");
		FormName.zqgchj.focus();
		return false;
	}
	if(!(isFloat(FormName.zqgchj, "��ǰ���̺ϼ�"))) {
		return false;
	}
	if(	javaTrim(FormName.zhgchj)=="") {
		alert("������[�ۺ󹤳̺ϼ�]��");
		FormName.zhgchj.focus();
		return false;
	}
	if(!(isFloat(FormName.zhgchj, "�ۺ󹤳̺ϼ�"))) {
		return false;
	}
	if(	javaTrim(FormName.gcjsze)=="") {
		alert("������[���̽����ܶ�]��");
		FormName.gcjsze.focus();
		return false;
	}
	if(!(isFloat(FormName.gcjsze, "���̽����ܶ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yjgck)=="") {
		alert("������[�ͻ��ѽ����̿�]��");
		FormName.yjgck.focus();
		return false;
	}
	if(!(isFloat(FormName.yjgck, "�ͻ��ѽ����̿�"))) {
		return false;
	}
	if(	javaTrim(FormName.djzgck)=="") {
		alert("������[����ת���̿�]��");
		FormName.djzgck.focus();
		return false;
	}
	if(!(isFloat(FormName.djzgck, "����ת���̿�"))) {
		return false;
	}
	if(	javaTrim(FormName.yjgcwk)=="") {
		alert("������[Ӧ������β��]��");
		FormName.yjgcwk.focus();
		return false;
	}
	if(!(isFloat(FormName.yjgcwk, "Ӧ������β��"))) {
		return false;
	}
	if(	javaTrim(FormName.sfxmbm1je)=="") {
		alert("������[�����շ���Ŀ1���]��");
		FormName.sfxmbm1je.focus();
		return false;
	}
	if(!(isFloat(FormName.sfxmbm1je, "�����շ���Ŀ1���"))) {
		return false;
	}
	if(	javaTrim(FormName.sfxmbm2je)=="") {
		alert("������[�����շ���Ŀ2���]��");
		FormName.sfxmbm2je.focus();
		return false;
	}
	if(!(isFloat(FormName.sfxmbm2je, "�����շ���Ŀ2���"))) {
		return false;
	}
	if(	javaTrim(FormName.sfxmbm3je)=="") {
		alert("������[�����շ���Ŀ3���]��");
		FormName.sfxmbm3je.focus();
		return false;
	}
	if(!(isFloat(FormName.sfxmbm3je, "�����շ���Ŀ3���"))) {
		return false;
	}

	if(	javaTrim(FormName.sftzk)=="") {
		alert("������[���������ۿ�]��");
		FormName.sftzk.focus();
		return false;
	}


	if(	javaTrim(FormName.zxzkl)=="") {
		alert("������[���¿ͻ��ۿ�]��");
		FormName.zxzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zxzkl, "���¿ͻ��ۿ�"))) {
		return false;
	}
	if(	javaTrim(FormName.zxqye)=="") {
		alert("������[�����ۺ�ǩԼ�ܶ�]��");
		FormName.zxqye.focus();
		return false;
	}
	if(!(isFloat(FormName.zxqye, "�����ۺ�ǩԼ�ܶ�"))) {
		return false;
	}
	if(	javaTrim(FormName.zxzhljzjx)=="") {
		alert("������[�����ۺ��������ܶ�]��");
		FormName.zxzhljzjx.focus();
		return false;
	}
	if(!(isFloat(FormName.zxzhljzjx, "�����ۺ��������ܶ�"))) {
		return false;
	}

	if(	javaTrim(FormName.sfyfq)=="") {
		alert("������[�Ƿ��з�ȯ]��");
		FormName.sfyfq.focus();
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
	if(	javaTrim(FormName.shfqje)=="") {
		alert("������[�ջؼ��ȯ���]��");
		FormName.shfqje.focus();
		return false;
	}
	if(!(isFloat(FormName.shfqje, "�ջؼ��ȯ���"))) {
		return false;
	}
	if(	javaTrim(FormName.shsgfq)=="") {
		alert("������[�ջ�ʩ����ȯ]��");
		FormName.shsgfq.focus();
		return false;
	}
	if(!(isFloat(FormName.shsgfq, "�ջ�ʩ����ȯ"))) {
		return false;
	}
	if(	javaTrim(FormName.shzcfq)=="") {
		alert("������[�ջ����ķ�ȯ]��");
		FormName.shzcfq.focus();
		return false;
	}
	if(!(isFloat(FormName.shzcfq, "�ջ����ķ�ȯ"))) {
		return false;
	}

	if(	javaTrim(FormName.sfydjfx)=="") {
		alert("������[�Ƿ��ж�������]��");
		FormName.sfydjfx.focus();
		return false;
	}
	if(	javaTrim(FormName.djfxje)=="") {
		alert("������[�������Ż�]��");
		FormName.djfxje.focus();
		return false;
	}
	if(!(isFloat(FormName.djfxje, "�������Ż�"))) {
		return false;
	}

	if(	javaTrim(FormName.sfydyq)=="") {
		alert("������[�Ƿ��е���ȯ]��");
		FormName.sfydyq.focus();
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
	if(	javaTrim(FormName.gcyhze)=="") {
		alert("������[�����Ż��ܶ�]��");
		FormName.gcyhze.focus();
		return false;
	}
	if(!(isFloat(FormName.gcyhze, "�����Ż��ܶ�"))) {
		return false;
	}

	if(	javaTrim(FormName.sfydxpzc)=="") {
		alert("������[�Ƿ��д���Ʒ����]��");
		FormName.sfydxpzc.focus();
		return false;
	}
	if(	javaTrim(FormName.dxpzcje)=="") {
		alert("������[����Ʒ���Ľ��]��");
		FormName.dxpzcje.focus();
		return false;
	}
	if(!(isFloat(FormName.dxpzcje, "����Ʒ���Ľ��"))) {
		return false;
	}
	if(	javaTrim(FormName.dxpzcyh)=="") {
		alert("������[����Ʒ�����Ż�]��");
		FormName.dxpzcyh.focus();
		return false;
	}
	if(!(isFloat(FormName.dxpzcyh, "����Ʒ�����Ż�"))) {
		return false;
	}

	if(	javaTrim(FormName.sfydgzc)=="") {
		alert("������[FormName]��");
		FormName.sfydgzc.focus();
		return false;
	}
	if(	javaTrim(FormName.dgzcje)=="") {
		alert("������[�������Ľ��]��");
		FormName.dgzcje.focus();
		return false;
	}
	if(!(isFloat(FormName.dgzcje, "�������Ľ��"))) {
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
	if(	javaTrim(FormName.zcjsze)=="") {
		alert("������[���Ľ����ܶ�]��");
		FormName.zcjsze.focus();
		return false;
	}
	if(!(isFloat(FormName.zcjsze, "���Ľ����ܶ�"))) {
		return false;
	}
	if(	javaTrim(FormName.xjjzck)=="") {
		alert("������[�ֽ����Ŀ�]��");
		FormName.xjjzck.focus();
		return false;
	}
	if(!(isFloat(FormName.xjjzck, "�ֽ����Ŀ�"))) {
		return false;
	}
	if(	javaTrim(FormName.fxjjzck)=="") {
		alert("������[���ֽ����Ŀ�]��");
		FormName.fxjjzck.focus();
		return false;
	}
	if(!(isFloat(FormName.fxjjzck, "���ֽ����Ŀ�"))) {
		return false;
	}
	if(	javaTrim(FormName.ybjzck)=="") {
		alert("������[Ӧ�������Ŀ�]��");
		FormName.ybjzck.focus();
		return false;
	}
	if(!(isFloat(FormName.ybjzck, "Ӧ�������Ŀ�"))) {
		return false;
	}

	if(	javaTrim(FormName.sfyzcfk)=="") {
		alert("������[�Ƿ������ķ���]��");
		FormName.sfyzcfk.focus();
		return false;
	}
	if(	javaTrim(FormName.zcfkje)=="") {
		alert("������[���ķ�����]��");
		FormName.zcfkje.focus();
		return false;
	}
	if(!(isFloat(FormName.zcfkje, "���ķ�����"))) {
		return false;
	}

	if(	javaTrim(FormName.sfykhpc)=="") {
		alert("������[�Ƿ��пͻ��⳥��]��");
		FormName.sfykhpc.focus();
		return false;
	}
	if(	javaTrim(FormName.khpck)=="") {
		alert("������[�ͻ��⳥��]��");
		FormName.khpck.focus();
		return false;
	}
	if(!(isFloat(FormName.khpck, "�ͻ��⳥��"))) {
		return false;
	}

	if(	javaTrim(FormName.sfyyqf)=="") {
		alert("������[�Ƿ������ڷ�]��");
		FormName.sfyyqf.focus();
		return false;
	}
	if(	javaTrim(FormName.yqf)=="") {
		alert("������[���ڷ�]��");
		FormName.yqf.focus();
		return false;
	}
	if(!(isFloat(FormName.yqf, "���ڷ�"))) {
		return false;
	}
	if(!(isFloat(FormName.sgdyqf, "ʩ���ӳе����ڷ�"))) {
		return false;
	}
	if(!(isFloat(FormName.sjsyqf, "���ʦ�е����ڷ�"))) {
		return false;
	}
	if(!(isFloat(FormName.csyqf, "���̳е����ڷ�"))) {
		return false;
	}

	if(	javaTrim(FormName.sfyqtx1)=="") {
		alert("������[�Ƿ���������1]��");
		FormName.sfyqtx1.focus();
		return false;
	}
	if(	javaTrim(FormName.qtx1je)=="") {
		alert("������[������1���]��");
		FormName.qtx1je.focus();
		return false;
	}
	if(!(isFloat(FormName.qtx1je, "������1���"))) {
		return false;
	}

	if(	javaTrim(FormName.sfyqtx2)=="") {
		alert("������[�Ƿ���������2]��");
		FormName.sfyqtx2.focus();
		return false;
	}
	if(	javaTrim(FormName.qtx2je)=="") {
		alert("������[������2���]��");
		FormName.qtx2je.focus();
		return false;
	}
	if(!(isFloat(FormName.qtx2je, "������2���"))) {
		return false;
	}

	if(	javaTrim(FormName.sfyqtx3)=="") {
		alert("������[�Ƿ���������3]��");
		FormName.sfyqtx3.focus();
		return false;
	}
	if(	javaTrim(FormName.qtx3je)=="") {
		alert("������[������3���]��");
		FormName.qtx3je.focus();
		return false;
	}
	if(!(isFloat(FormName.qtx3je, "������3���"))) {
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
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zkl)=="") {
		alert("������[�ͻ��ۿ�]��");
		FormName.zkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zkl, "�ͻ��ۿ�"))) {
		return false;
	}
	if(	javaTrim(FormName.gczkyh)=="") {
		alert("������[�����ۿ��Ż�]��");
		FormName.gczkyh.focus();
		return false;
	}
	if(!(isFloat(FormName.gczkyh, "�����ۿ��Ż�"))) {
		return false;
	}
	if(	javaTrim(FormName.tzkxzyh)=="") {
		alert("������[���ۿ������Ż�]��");
		FormName.tzkxzyh.focus();
		return false;
	}
	if(!(isFloat(FormName.tzkxzyh, "���ۿ������Ż�"))) {
		return false;
	}
	if(	javaTrim(FormName.sfyjsgcyh)=="") {
		alert("������[�Ƿ��н��㹤���Ż�]��");
		FormName.sfyjsgcyh.focus();
		return false;
	}
	if(	javaTrim(FormName.jsgcyh)=="") {
		alert("������[���㹤���Ż�]��");
		FormName.jsgcyh.focus();
		return false;
	}
	if(!(isFloat(FormName.jsgcyh, "���㹤���Ż�"))) {
		return false;
	}
	if(	javaTrim(FormName.sfydxpzcyh)=="") {
		alert("������[�Ƿ��д���Ʒ�����Ż�]��");
		FormName.sfydxpzcyh.focus();
		return false;
	}
	if(	javaTrim(FormName.sfydgzcyh)=="") {
		alert("������[�Ƿ��д��������Ż�]��");
		FormName.sfydgzcyh.focus();
		return false;
	}
	if(	javaTrim(FormName.sfyjszcyh)=="") {
		alert("������[�Ƿ��н��������Ż�]��");
		FormName.sfyjszcyh.focus();
		return false;
	}
	if(	javaTrim(FormName.jszcyh)=="") {
		alert("������[���������Ż�]��");
		FormName.jszcyh.focus();
		return false;
	}
	if(!(isFloat(FormName.jszcyh, "���������Ż�"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
