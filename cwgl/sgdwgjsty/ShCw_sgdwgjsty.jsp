<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
.STYLE4 {color: #0000CC}
.STYLE5 {
	color: #990000;
	font-weight: bold;
}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String sgd="";
String sgbz=null;
double htgcf=0;//��ͬ���̶�
double gcfzjx=0;//���̷�������
double htqtsf=0;//��ͬ������
double qtsfzjx=0;//������������
String qtfsm="";//������˵��
double htsgcb=0;//��ͬ��ʩ���ɱ�
double zjxsgcb=0;//������ʩ���ɱ�
double ljclf=0;//�ۼƲ��Ϸ�
double ljrgf=0;//�ۼ��˹���
double khqk=0;//�ͻ�Ƿ��
double khpck=0;
double yqf=0;
double jsyh=0;


double kyqf=0;
double kkhpck=0;
double kkhqk=0;



String jsjs="";//�������
double jsbl=0;//�������
double htjsjs=0;//��ͬ�������
double zjxjsjs=0;//������������
double jsjsxjje=0;

double sdlje=0;//ˮ��·���
double sdljsje=0;//ˮ��·������

double ljzjxje=0;//�ۼ�������
double zxje=0;//���ʱ���
double jxje=0;//������

double zcje=0;//���Ľ��
double zcjsje=0;//���Ľ�����

double jsjsze=0;//��������ܶ�
double jsje=0;//�����ܶ�
double rgfjse=0;//�˹��ѽ����
double flfjse=0;//���Ϸѽ����

double kzbj=0;//���ʱ���

double clf=0;//���Ϸ�
double gdyp=0;//������Ʒ
double yfgf=0;//�Ѹ�����

double clfk=0;//���ķ���
double clyf=0;//�����˷�
double zckk=0;//���Ŀۿ�
double zcjl=0;//���Ľ���
double fkje=0;//������
double jlje=0;//�������
double qtje=0;//�������

double yfje=0;//Ӧ�����


String sdljsfs=null;//ˮ��·���㷽ʽ
String sdlqz="";//ˮ��·ȡֵ
String sdlqzStr="";//ˮ��·ȡֵ
String zjxjffs="";//���������ʽ
double ljzjxxs=0;//�ۼ�������ϵ��
double zxxs=0;//����ϵ��
double jxxs=0;//����ϵ��
String zjxbhfw="";//�����������Χ
String zjxsjd="";//������ʱ���
String sfkyqpc="";//�Ƿ�����ڷ��⳥��

String zcsfjs="";//�����Ƿ����
String zcjehqfs="";//���Ľ���ȡ��ʽ
String zcjsblkg="";//���Ľ���������޸�
double zcjsbl=0;//���Ľ������

String sfkzbj=null;//�Ƿ���ʱ���
String kzbjjs=null;//���ʱ������
double kzbjbl=0;//���ʱ������
String sfkclk=null;//�Ƿ�۲��Ͽ�
String sfkgdyp=null;//�Ƿ�۹�����Ʒ
String sfkyfgf=null;//�Ƿ���Ѹ�����
String sfkclfk="";//�Ƿ�۸��ķ���
String sfkclyf="";//�Ƿ�۲����˷�
String sfkzckk="";//�Ƿ�����Ŀۿ�
String sfjzcjl="";//�Ƿ�����Ľ���
String sfkfkje="";//�Ƿ�۷�����
String sfjjlje="";//�Ƿ�ӽ������
String sfjqtje="";//�Ƿ���������

double ssk=0;
double sdljsbl=0;

double tzjsbl=0;
String jsrq=null;
String spzt=null;
String spr=null;
String spsj=null;
String spyj=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
double zbjce=0;


//�ͻ�������Ϣ
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String khjl=null;
String zjxm=null;
String qyrq=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String sjwjrq=null;
String gcjdbm=null;

String dwbh=null;
String dwmc=null;
String zjxxh="";
String gdjsjd=null;
String fgsbh=null;
//������Ϣ

double qye=0;
double zhljzjx=0;
double cwsfke=0;


double zhgczjf=0;
double guanlif=0;
double suijin=0;
double zhqtsf=0;
double zhwjrqyexm=0;
double sjf=0;

double zhzjxje=0;
double zjxguanlif=0;
double zjxsuijin=0;
double zhqtsfzjx=0;
double zhwjrzjx=0;
double zhsjfzjx=0;


//���ݽ����������ȷ�����Ƿ���ʾ��������������
String sdlStyle="";
String sdlblRead="";
String sdljeRead="";

String zjxfsStyle="";
String zjxStyle="";
String zjxRead="";
String zxStyle="";
String zxRead="";
String jxStyle="";
String jxRead="";

String sfkclkStyle="";
String sfkclkRead="";

String sfkgdypStyle="";
String sfkgdypRead="";

String sfkyfgfStyle="";
String sfkyfgfRead="";

String sfkzbjStyle="";
String sfkzbjRead="";

String sfkyqpcStyle="";
String sfkyqpcRead="";

String zcsfjsStyle="";
String zcjeRead="";
String zcjsblRead="";
String zcjsjeRead="";

String sfkclfkStyle="";
String sfkclfkRead="";

String sfkclyfStyle="";
String sfkclyfRead="";

String sfkzckkStyle="";
String sfkzckkRead="";

String sfjzcjlStyle="";
String sfjzcjlRead="";

String sfkfkjeStyle="";
String sfkfkjeRead="";

String sfjjljeStyle="";
String sfjjljeRead="";

String sfjqtjeStyle="";
String sfjqtjeRead="";
//���ݽ����������ȷ�����Ƿ���ʾ��������������

String yfjeStr="";
String jsjszeStr="�������";//��������ܶ���㷽ʽ

String jsjlh=request.getParameter("jsjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select khbh,sgd,sgbz,htgcf,htqtsf,gcfzjx,qtsfzjx,qtfsm,htsgcb,zjxsgcb,ljclf,ljrgf,ssk,jsyh,khpck,yqf,khqk,jsjs,htjsjs,zjxjsjs,sdljsfs,sdlqz,sdlje,sdljsbl,sdljsje,zjxjffs,zjxbhfw,zjxsjd,ljzjxxs,ljzjxje,zxxs,zxje,jxxs,jxje,sfkyqpc,kyqf,kkhpck,kkhqk,zcsfjs,zcjehqfs,zcjsblkg,zcjsbl,zcje,zcjsje,jsjsze,jsbl,tzjsbl,jsje,rgfjse,flfjse,sfkclk,clf,sfkgdyp,gdyp,sfkyfgf,yfgf,sfkzbj,kzbjjs,kzbjbl,kzbj,sfkclfk,clfk,sfkclyf,clyf,sfkzckk,zckk,sfjzcjl,zcjl,sfkfkje,fkje,sfjjlje,jlje,sfjqtje,qtje,yfje,jsrq,spzt,spr,spsj,spyj,lrr,lrsj,lrbm,bz,jsjsxjje,zbjce ";
	ls_sql+=" from  cw_sgdwgjsty";
	ls_sql+=" where jsjlh='"+jsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		htgcf=rs.getDouble("htgcf");
		htqtsf=rs.getDouble("htqtsf");
		gcfzjx=rs.getDouble("gcfzjx");
		qtsfzjx=rs.getDouble("qtsfzjx");
		qtfsm=cf.fillNull(rs.getString("qtfsm"));
		htsgcb=rs.getDouble("htsgcb");
		zjxsgcb=rs.getDouble("zjxsgcb");
		ljclf=rs.getDouble("ljclf");
		ljrgf=rs.getDouble("ljrgf");
		ssk=rs.getDouble("ssk");
		jsyh=rs.getDouble("jsyh");
		khpck=rs.getDouble("khpck");
		yqf=rs.getDouble("yqf");
		khqk=rs.getDouble("khqk");
		jsjs=cf.fillNull(rs.getString("jsjs"));
		htjsjs=rs.getDouble("htjsjs");
		zjxjsjs=rs.getDouble("zjxjsjs");
		sdljsfs=cf.fillNull(rs.getString("sdljsfs"));
		sdlqz=cf.fillNull(rs.getString("sdlqz"));
		sdlje=rs.getDouble("sdlje");
		sdljsbl=rs.getDouble("sdljsbl");
		sdljsje=rs.getDouble("sdljsje");
		zjxjffs=cf.fillNull(rs.getString("zjxjffs"));
		zjxbhfw=cf.fillNull(rs.getString("zjxbhfw"));
		zjxsjd=cf.fillNull(rs.getString("zjxsjd"));
		ljzjxxs=rs.getDouble("ljzjxxs");
		ljzjxje=rs.getDouble("ljzjxje");
		zxxs=rs.getDouble("zxxs");
		zxje=rs.getDouble("zxje");
		jxxs=rs.getDouble("jxxs");
		jxje=rs.getDouble("jxje");
		sfkyqpc=cf.fillNull(rs.getString("sfkyqpc"));
		kyqf=rs.getDouble("kyqf");
		kkhpck=rs.getDouble("kkhpck");
		kkhqk=rs.getDouble("kkhqk");
		zcsfjs=cf.fillNull(rs.getString("zcsfjs"));
		zcjehqfs=cf.fillNull(rs.getString("zcjehqfs"));
		zcjsblkg=cf.fillNull(rs.getString("zcjsblkg"));
		zcjsbl=rs.getDouble("zcjsbl");
		zcje=rs.getDouble("zcje");
		zcjsje=rs.getDouble("zcjsje");
		jsjsze=rs.getDouble("jsjsze");
		jsbl=rs.getDouble("jsbl");
		tzjsbl=rs.getDouble("tzjsbl");
		jsje=rs.getDouble("jsje");
		rgfjse=rs.getDouble("rgfjse");
		flfjse=rs.getDouble("flfjse");
		sfkclk=cf.fillNull(rs.getString("sfkclk"));
		clf=rs.getDouble("clf");
		sfkgdyp=cf.fillNull(rs.getString("sfkgdyp"));
		gdyp=rs.getDouble("gdyp");
		sfkyfgf=cf.fillNull(rs.getString("sfkyfgf"));
		yfgf=rs.getDouble("yfgf");
		sfkzbj=cf.fillNull(rs.getString("sfkzbj"));
		kzbjjs=cf.fillNull(rs.getString("kzbjjs"));
		kzbjbl=rs.getDouble("kzbjbl");
		kzbj=rs.getDouble("kzbj");
		sfkclfk=cf.fillNull(rs.getString("sfkclfk"));
		clfk=rs.getDouble("clfk");
		sfkclyf=cf.fillNull(rs.getString("sfkclyf"));
		clyf=rs.getDouble("clyf");
		sfkzckk=cf.fillNull(rs.getString("sfkzckk"));
		zckk=rs.getDouble("zckk");
		sfjzcjl=cf.fillNull(rs.getString("sfjzcjl"));
		zcjl=rs.getDouble("zcjl");
		sfkfkje=cf.fillNull(rs.getString("sfkfkje"));
		fkje=rs.getDouble("fkje");
		sfjjlje=cf.fillNull(rs.getString("sfjjlje"));
		jlje=rs.getDouble("jlje");
		sfjqtje=cf.fillNull(rs.getString("sfjqtje"));
		qtje=rs.getDouble("qtje");
		yfje=rs.getDouble("yfje");
		jsrq=cf.fillNull(rs.getDate("jsrq"));
		spzt=cf.fillNull(rs.getString("spzt"));
		spr=cf.fillNull(rs.getString("spr"));
		spsj=cf.fillNull(rs.getDate("spsj"));
		spyj=cf.fillNull(rs.getString("spyj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		jsjsxjje=rs.getDouble("jsjsxjje");
		zbjce=rs.getDouble("zbjce");
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,hth,sjs,khjl,sgd,sgbz,zjxm,qyrq,kgrq,jgrq,sjkgrq,sjjgrq,sjwjrq,gcjdbm,crm_khxx.dwbh,dwmc,zjxxh,gdjsjd,fgsbh";
	ls_sql+=" ,qye,zhljzjx,cwsfke  ,zhgczjf,guanlif,suijin,zhqtsf,zhwjrqyexm,sjf    ,zhzjxje,zjxguanlif,zjxsuijin,zhqtsfzjx,zhwjrzjx,zhsjfzjx";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		khjl=cf.fillNull(rs.getString("khjl"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));

		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		zjxxh=cf.fillNull(rs.getString("zjxxh"));
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));

		qye=rs.getDouble("qye");
		zhljzjx=rs.getDouble("zhljzjx");
		cwsfke=rs.getDouble("cwsfke");

		zhgczjf=rs.getDouble("zhgczjf");
		guanlif=rs.getDouble("guanlif");
		suijin=rs.getDouble("suijin");
		zhqtsf=rs.getDouble("zhqtsf");
		zhwjrqyexm=rs.getDouble("zhwjrqyexm");
		sjf=rs.getDouble("sjf");

		zhzjxje=rs.getDouble("zhzjxje");
		zjxguanlif=rs.getDouble("zjxguanlif");
		zjxsuijin=rs.getDouble("zjxsuijin");
		zhqtsfzjx=rs.getDouble("zhqtsfzjx");
		zhwjrzjx=rs.getDouble("zhwjrzjx");
		zhsjfzjx=rs.getDouble("zhsjfzjx");
	}
	rs.close();
	ps.close();


	if (sgd.equals(""))//1:�������ڽ�������
	{
		out.println("<BR>������������ʩ����");
		return;
	}

	if (!gdjsjd.equals("Y"))//1:�������ڽ�������
	{
		out.println("<BR>���������󣬽�����Ȳ���ȷ");
		return;
	}

	//���ݽ����������ȷ�����Ƿ���ʾ������������������������������ʼ

	if (sdljsfs.equals("1"))//1�����������㣻2�������������ɸģ�3�����������ɸģ�4���ֹ�¼�������
	{
		sdlStyle="none";
		sdlblRead="readonly";
		sdljeRead="readonly";
	}
	else if (sdljsfs.equals("2"))
	{
		sdlStyle="block";
		sdlblRead="readonly";
		sdljeRead="readonly";
	}
	else if (sdljsfs.equals("3"))
	{
		sdlStyle="block";
		sdlblRead="";
		sdljeRead="readonly";
	}
	else if (sdljsfs.equals("4"))
	{
		sdlStyle="block";
		sdlblRead="readonly";
		sdljeRead="";
	}

	if (zjxjffs.equals("1"))//1:��������2:�ۼ��������3:�ۼ�������ʩ���ɱ���4:����������5: ����ʩ���ɱ�����ʩ���ɱ���6:����ʩ���ɱ������7: ���������ʩ���ɱ�
	{
		zjxfsStyle="none";
		zjxStyle="none";
		zjxRead="readonly";
		zxStyle="none";
		zxRead="readonly";
		jxStyle="none";
		jxRead="readonly";
	}
	else if (zjxjffs.equals("2"))
	{
		zjxfsStyle="block";
		zjxStyle="block";
		zjxRead="readonly";
		zxStyle="none";
		zxRead="readonly";
		jxStyle="none";
		jxRead="readonly";
	}
	else if (zjxjffs.equals("3"))
	{
		zjxfsStyle="block";
		zjxStyle="block";
		zjxRead="readonly";
		zxStyle="none";
		zxRead="readonly";
		jxStyle="none";
		jxRead="readonly";
	}
	else if (zjxjffs.equals("4"))
	{
		zjxfsStyle="block";
		zjxStyle="none";
		zjxRead="readonly";
		zxStyle="block";
		zxRead="readonly";
		jxStyle="block";
		jxRead="readonly";
	}
	else if (zjxjffs.equals("5"))
	{
		zjxfsStyle="block";
		zjxStyle="none";
		zjxRead="readonly";
		zxStyle="block";
		zxRead="readonly";
		jxStyle="block";
		jxRead="readonly";
	}
	else if (zjxjffs.equals("6"))
	{
		zjxfsStyle="block";
		zjxStyle="none";
		zjxRead="readonly";
		zxStyle="block";
		zxRead="readonly";
		jxStyle="block";
		jxRead="readonly";
	}
	else if (zjxjffs.equals("7"))
	{
		zjxfsStyle="block";
		zjxStyle="none";
		zjxRead="readonly";
		zxStyle="block";
		zxRead="readonly";
		jxStyle="block";
		jxRead="readonly";
	}

	if (sfkclk.equals("Y"))//Y���ǣ�N����
	{
		sfkclkStyle="block";
		sfkclkRead="readonly";
	}
	else if (sfkclk.equals("N"))
	{
		sfkclkStyle="none";
		sfkclkRead="readonly";
	}

	if (sfkgdyp.equals("Y"))//Y���ǣ�N����
	{
		sfkgdypStyle="block";
		sfkgdypRead="readonly";
	}
	else if (sfkgdyp.equals("N"))
	{
		sfkgdypStyle="none";
		sfkgdypRead="readonly";
	}

	if (sfkyfgf.equals("Y"))//Y���ǣ�N����
	{
		sfkyfgfStyle="block";
		sfkyfgfRead="readonly";
	}
	else if (sfkyfgf.equals("N"))
	{
		sfkyfgfStyle="none";
		sfkyfgfRead="readonly";
	}

	if (sfkzbj.equals("Y"))//Y:���ʱ���������ɸģ�M:���ʱ�������ɸģ�N:�����ʱ���
	{
		sfkzbjStyle="block";
		sfkzbjRead="readonly";
	}
	else if (sfkzbj.equals("M"))
	{
		sfkzbjStyle="block";
		sfkzbjRead="";
	}
	else if (sfkzbj.equals("N"))
	{
		sfkzbjStyle="none";
		sfkzbjRead="readonly";
	}


	if (sfkyqpc.equals("Y"))//Y���Զ���ȡ��S���˹�¼�룻N����
	{
		sfkyqpcStyle="block";
		sfkyqpcRead="readonly";
	}
	else if (sfkyqpc.equals("S"))
	{
		sfkyqpcStyle="block";
		sfkyqpcRead="";
	}
	else if (sfkyqpc.equals("N"))
	{
		sfkyqpcStyle="none";
		sfkyqpcRead="readonly";
	}

	if (zcsfjs.equals("1"))//�����Ƿ����  1�������㣻2�����������㣻3���˹�¼��
	{
		zcsfjsStyle="none";
		zcjeRead="readonly";
		zcjsblRead="readonly";
		zcjsjeRead="readonly";
	}
	else if (zcsfjs.equals("2"))
	{
		zcsfjsStyle="block";
		if (zcjehqfs.equals("2"))//���Ľ���ȡ��ʽ  1���Զ���ȡ��2���˹�¼��
		{
			zcjeRead="";
		}
		else{
			zcjeRead="readonly";
		}

		if (zcjehqfs.equals("1"))//���Ľ���������޸�  1�����޸ģ�2�������޸�
		{
			zcjsblRead="";
		}
		else{
			zcjsblRead="readonly";
		}

		zcjsjeRead="readonly";
	}
	else if (zcsfjs.equals("3"))
	{
		zcsfjsStyle="block";
		if (zcjehqfs.equals("2"))//���Ľ���ȡ��ʽ  1���Զ���ȡ��2���˹�¼��
		{
			zcjeRead="";
		}
		else{
			zcjeRead="readonly";
		}

		zcjsblRead="readonly";
		zcjsjeRead="";
	}


	if (sfkclfk.equals("Y"))//Y���Զ���ȡ��S���˹�¼�룻N����
	{
		sfkclfkStyle="block";
		sfkclfkRead="readonly";
	}
	else if (sfkclfk.equals("S"))
	{
		sfkclfkStyle="block";
		sfkclfkRead="";
	}
	else if (sfkclfk.equals("N"))
	{
		sfkclfkStyle="none";
		sfkclfkRead="readonly";
	}

	if (sfkclyf.equals("Y"))//Y���Զ���ȡ��S���˹�¼�룻N����
	{
		sfkclyfStyle="block";
		sfkclyfRead="readonly";
	}
	else if (sfkclyf.equals("S"))
	{
		sfkclyfStyle="block";
		sfkclyfRead="";
	}
	else if (sfkclyf.equals("N"))
	{
		sfkclyfStyle="none";
		sfkclyfRead="readonly";
	}

	if (sfkzckk.equals("Y"))//Y���Զ���ȡ��S���˹�¼�룻N����
	{
		sfkzckkStyle="block";
		sfkzckkRead="readonly";
	}
	else if (sfkzckk.equals("S"))
	{
		sfkzckkStyle="block";
		sfkzckkRead="";
	}
	else if (sfkzckk.equals("N"))
	{
		sfkzckkStyle="none";
		sfkzckkRead="readonly";
	}

	if (sfjzcjl.equals("Y"))//Y���Զ���ȡ��S���˹�¼�룻N����
	{
		sfjzcjlStyle="block";
		sfjzcjlRead="readonly";
	}
	else if (sfkzckk.equals("S"))
	{
		sfjzcjlStyle="block";
		sfjzcjlRead="";
	}
	else if (sfkzckk.equals("N"))
	{
		sfjzcjlStyle="none";
		sfjzcjlRead="readonly";
	}



	if (sfkfkje.equals("Y"))//Y���Զ���ȡ��S���˹�¼�룻N����
	{
		sfkfkjeStyle="block";
		sfkfkjeRead="readonly";
	}
	else if (sfkfkje.equals("S"))
	{
		sfkfkjeStyle="block";
		sfkfkjeRead="";
	}
	else if (sfkfkje.equals("N"))
	{
		sfkfkjeStyle="none";
		sfkfkjeRead="readonly";
	}

	if (sfjjlje.equals("Y"))//Y���Զ���ȡ��S���˹�¼�룻N����
	{
		sfjjljeStyle="block";
		sfjjljeRead="readonly";
	}
	else if (sfjjlje.equals("S"))
	{
		sfjjljeStyle="block";
		sfjjljeRead="";
	}
	else if (sfjjlje.equals("N"))
	{
		sfjjljeStyle="none";
		sfjjljeRead="readonly";
	}

	if (sfjqtje.equals("Y"))//Y���Զ���ȡ��S���˹�¼�룻N����
	{
		sfjqtjeStyle="block";
		sfjqtjeRead="readonly";
	}
	else if (sfjqtje.equals("S"))
	{
		sfjqtjeStyle="block";
		sfjqtjeRead="";
	}
	else if (sfjqtje.equals("N"))
	{
		sfjqtjeStyle="none";
		sfjqtjeRead="readonly";
	}
	//���ݽ����������ȷ�����Ƿ���ʾ��������������������������������


	if (!sdljsfs.equals("1"))//ˮ��·���㷽ʽ  1�����������㣻2�������������ɸģ�3�����������ɸģ�4���ֹ�¼�������
	{
		jsjszeStr+="��ˮ��·������";
	}
	if (!zjxjffs.equals("1"))//���������ʽ  1:��������2: �ۼ��ۺ��������3:�ۼ�������ʩ���ɱ���4: �ۺ�����������5: ����ʩ���ɱ�����ʩ���ɱ���6:����ʩ���ɱ��ۺ�����7: �ۺ����������ʩ���ɱ�
	{
		jsjszeStr+="���������";
	}
	if (!sfkyqpc.equals("N"))//�Ƿ�����ڷ��⳥��  Y���Զ���ȡ��S���˹�¼�룻N����
	{
		jsjszeStr+="�����ڷѣ��⳥��ͻ�Ƿ��";
	}


	yfjeStr="Ӧ���������ܶ�";
	if (zcsfjs.equals("2"))//�����Ƿ����  1�������㣻2�����������㣻3���˹�¼��
	{
		yfjeStr+="�����Ľ�����";
	}
	else if (zcsfjs.equals("3"))//�����Ƿ����  1�������㣻2�����������㣻3���˹�¼��
	{
		yfjeStr+="�����Ľ�����";
	}

	if (sfkclk.equals("Y"))//�Ƿ�۲��Ͽ�
	{
		yfjeStr+="�����Ͽ�";
	}
	if (sfkgdyp.equals("Y"))//�Ƿ�۹�����Ʒ
	{
		yfjeStr+="��������Ʒ";
	}
	if (sfkyfgf.equals("Y"))//�Ƿ���Ѹ�����
	{
		yfjeStr+="���Ѹ�����";
	}
	//���ʱ���
	if (!sfkzbj.equals("N"))//�Ƿ���ʱ���  Y:���ʱ���������ɸģ�M:���ʱ�������ɸģ�N:�����ʱ���
	{
		if (zbjce>0)
		{
			yfjeStr+="���ʱ���(���:"+zbjce+")";
		}
		else{
			yfjeStr+="���ʱ���(�ʱ����Ѵ��)";
		}
	}
	if (!sfkclfk.equals("N"))//�Ƿ�۸��ķ���  Y���Զ���ȡ��S���˹�¼�룻N����
	{
		yfjeStr+="�����ķ���";
	}
	if (!sfkclyf.equals("N"))//�Ƿ�۲����˷�  Y���Զ���ȡ��S���˹�¼�룻N����
	{
		yfjeStr+="�������˷�";
	}
	if (!sfkzckk.equals("N"))//�Ƿ�����Ŀۿ�  Y���Զ���ȡ��S���˹�¼�룻N����
	{
		yfjeStr+="�����Ŀۿ�";
	}
	if (!sfjzcjl.equals("N"))//�Ƿ�����Ľ���  Y���Զ���ȡ��S���˹�¼�룻N����
	{
		yfjeStr+="�����Ľ���";
	}
	if (!sfkfkje.equals("N"))//�Ƿ�۷�����  Y���Զ���ȡ��S���˹�¼�룻N����
	{
		yfjeStr+="��������";
	}
	if (!sfjjlje.equals("N"))//�Ƿ�ӽ������  Y���Զ���ȡ��S���˹�¼�룻N����
	{
		yfjeStr+="���������";
	}
	if (!sfjqtje.equals("N"))//�Ƿ���������  Y���Զ���ȡ��S���˹�¼�룻N����
	{
		yfjeStr+="���������";
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">�����Ѽ�¼��</td>
	<td  width="8%">�����Ѵ���</td>
	<td  width="7%">��������</td>
	<td  width="7%">��ͬ���</td>
	<td  width="6%">��������</td>
	<td  width="8%">�������</td>
	<td  width="7%">��������ܶ�</td>
	<td  width="4%">�������</td>
	<td  width="7%">������</td>
	<td  width="5%">���Ϸ�</td>
	<td  width="5%">������Ʒ</td>
	<td  width="7%">ʵ�ʲ���</td>
	<td  width="5%">¼����</td>
	<td  width="54%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT cw_sgdbgfty.jsjlh,gdjsjdmc,cw_sgdbgfty.jsrq,TO_CHAR(cw_sgdbgfty.htje),TO_CHAR(cw_sgdbgfty.zjxje), DECODE(cw_sgdbgfty.jsjs,'1','���̷�','2','���̷ѣ�������','3','ʵ�տ��ܶ�','4','һ�ڿ�','5','���ڿ�','6','���ڿ�','7','���̻�������','8','���̻������ۣ������ѻ�������','9','���¹���ʩ���ɱ���','A','���¹���ʩ���ɱ��ۣ�������ʩ���ɱ�','D','��ͬ����ʩ���ɱ���','E','��ͬ����ʩ���ɱ��ۣ�������ʩ���ɱ�','B','���̳ɱ���','C','���̳ɱ��ۣ������ѳɱ�'),TO_CHAR(cw_sgdbgfty.jsjsze),cw_sgdbgfty.jsbl||'%',TO_CHAR(cw_sgdbgfty.jsje),TO_CHAR(cw_sgdbgfty.clf),TO_CHAR(cw_sgdbgfty.gdyp),cw_sgdbgfty.sjbk,cw_sgdbgfty.lrr,cw_sgdbgfty.bz  ";
	ls_sql+=" FROM cw_sgdbgfty,dm_gdjsjd  ";
    ls_sql+=" where cw_sgdbgfty.gdjsjd=dm_gdjsjd.gdjsjd(+) ";
    ls_sql+=" and cw_sgdbgfty.khbh='"+khbh+"'";
    ls_sql+=" order by cw_sgdbgfty.lrsj";
    pageObj.sql=ls_sql;
	pageObj.initPage("Cw_sgdbgftyCxList.jsp","","","");

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>

<form method="post" action="SaveShCw_sgdwgjsty.jsp" name="insertform" >
<div align="center">������ˣ������¼�ţ�<%=jsjlh%>��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">�ͻ����</font> </td>
    <td><%=khbh%> </td>
    <td align="right"><font color="#0000FF">��ͬ��</font> </td>
    <td><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">�ͻ�����</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">�ʼ�����</font></td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���ݵ�ַ</font></td>
    <td colspan="3"><%=fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ʩ����</font></td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','���ѳ�����','N','')||'��'||dh||'��' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"><font color="#0000FF">ʩ������</font></td>
    <td><%=sgbz%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���ʦ</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">ǩԼ����</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�ͻ�����</span></td>
    <td><%=khjl%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ǩԼ����</font></td>
    <td><%=qyrq%> </td>
    <td align="right"><font color="#0000FF">���齻������</font></td>
    <td> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">��ͬ��������</font></td>
    <td><%=kgrq%> </td>
    <td align="right"><font color="#0000FF">��ͬ��������</font></td>
    <td><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center" bgcolor="#E8E8FF">
	<input type="button" onClick="window.open('/dzbj/dybj.jsp?khbh=<%=khbh%>')" value="���ӱ���">
    <input type="button" onClick="window.open('/khxx/ViewZxsgcbj.jsp?khbh=<%=khbh%>')"  value="����ʩ���ɱ���">
    <input type="button" onClick="window.open('/khxx/ViewZxSdl.jsp?khbh=<%=khbh%>')"  value="�鿴ˮ��·">
        <input type="button" onClick="window.open('/khxx/Crm_gcfxysjlCxList.jsp?khbh=<%=khbh%>')"  value="���ռ�¼">
        <input type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="������Ϣ">
        <input type="button" onClick="window.open('/khxx/Jxc_clpsdCxList.jsp?khbh=<%=khbh%>')"  value="���ϵ�"></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">��ͬ���̷�</span></td>
  <td><%=htgcf%></td>
  <td align="right"><span class="STYLE4">���̷�������</span></td>
  <td><%=gcfzjx%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">��ͬ������</span></td>
  <td><%=htqtsf%></td>
  <td align="right"><span class="STYLE4">������������</span></td>
  <td><%=qtsfzjx%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">��ͬʩ���ɱ�</span></td>
  <td><%=htsgcb%></td>
  <td align="right"><span class="STYLE4">������ʩ���ɱ�</span></td>
  <td><%=zjxsgcb%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">������˵��</span></td>
  <td colspan="3"><%=qtfsm%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">�ۼƲ��Ϸ�</span></td>
  <td><%=ljclf%></td>
  <td align="right"><span class="STYLE4">�ۼ��˹���</span></td>
  <td><%=ljrgf%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">ʵ�տ�</span></td>
  <td><%=cwsfke%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">���±����ܶ�</span></td>
  <td><%=cf.round(qye+zhljzjx,2)%></td>
  <td colspan="2">���±����ܶ�=��ͬ��+�ۼ�������</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td  align="right"><span class="STYLE4">Ӧ�ս��</span></td>
  <td><%=cf.round(qye+zhljzjx-cwsfke,2)%></td>
  <td colspan="2">Ӧ�ս��=���±����ܶ�-ʵ�տ�</td>
  </tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkyqpcStyle%>">
  <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkyqpcStyle%>">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">�ͻ������Ż�</span></td>
  <td><input type="text" name="jsyh" value="<%=jsyh%>" size="20" maxlength="17" readonly></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">�ͻ��⳥��</span></td>
  <td><input type="text" name="khpck" value="<%=khpck%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkyqpcStyle%>">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">���ڷ�</span></td>
  <td><input type="text" name="yqf" value="<%=yqf%>" size="20" maxlength="17" readonly></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkyqpcStyle%>">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">�ͻ�Ƿ��</span></td>
  <td colspan="3"><input type="text" name="khqk" value="<%=khqk%>" size="20" maxlength="17" readonly>
    �ͻ�Ƿ��=���±����ܶ�-�����Ż�-�ͻ��⳥��-���ڷ�-ʵ�տ�</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td  colspan="4" align="center" bgcolor="#E8E8FF">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">�������</span></td>
  <td colspan="3">
  <select name="jsjs" style="FONT-SIZE:12PX;WIDTH:512PX">
    <%
		cf.selectItem(out,"select jsjsbm,jsjsmc from dm_jsjsbm where jsjsbm='"+jsjs+"'",jsjs);
%>
  </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4"><font color="#FF0000">*</font>��ͬ�������</span></td>
  <td><input type="text" name="htjsjs" value="<%=htjsjs%>" size="20" maxlength="17" readonly>  </td>
  <td align="right"><span class="STYLE4"><font color="#FF0000">*</font>������������</span></td>
  <td><input type="text" name="zjxjsjs" value="<%=zjxjsjs%>" size="20" maxlength="17" readonly>    </td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sdlStyle%>">
  <td  colspan="4" align="center" bgcolor="#E8E8FF">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sdlStyle%>">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">ˮ��·���㷽ʽ</span></td>
  <td><%
	cf.radioToken(out, "sdljsfs","1+����������&2+�����������ɸ�&3+���������ɸ�&4+�ֹ�¼�������",sdljsfs,true);
%>(<%=sdlqzStr%>)</td>
  <td align="right"><span class="STYLE4"><font color="#FF0000">*</font>ˮ��·�������</span></td>
  <td>
  <input type="text" name="sdljsbl" value="<%=sdljsbl%>" size="10" maxlength="9"  <%=sdlblRead%>>%  </td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sdlStyle%>">
  <td align="right"><span class="STYLE4"><font color="#FF0000">*</font>ˮ��·���</span></td>
  <td><input type="text" name="sdlje" value="<%=sdlje%>" size="20" maxlength="17" readonly></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">ˮ��·������</span></td>
  <td><input type="text" name="sdljsje" value="<%=sdljsje%>" size="15" maxlength="17"  <%=sdljeRead%>>
    ˮ��·����ˮ��·�������</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=zjxfsStyle%>">
  <td  colspan="4" align="center" bgcolor="#E8E8FF">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=zjxfsStyle%>">
  <td align="right"><font color="#FF0000">*</font>���������ʽ</td>
  <td><%
	cf.radioToken(out, "zjxjffs","1+������&2+�ۼ��ۺ���������&3+�ۼ�������ʩ���ɱ�&4+�ۺ������������&5+����ʩ���ɱ�����ʩ���ɱ�&6+����ʩ���ɱ��ۺ������&7+�ۺ����������ʩ���ɱ�",zjxjffs,true);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=zxStyle%>">
  <td align="right">�����������Χ</td>
  <td><%
	cf.radioToken(out, "zjxbhfw","1+����&2+������&3+���̣�������<br>&4+����(��ˮ��)&5+���̣�������(��ˮ��)",zjxbhfw,true);
%></td>
  <td align="right">������ʱ���</td>
  <td><%
	cf.radioToken(out, "zjxsjd","1+ȫ��&2+����ǰ&3+������",zjxsjd,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=zxStyle%>">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">����ϵ��</span></td>
  <td><input name="zxxs" type="text" value="<%=zxxs%>" size="20" maxlength="17"  <%=zxRead%>></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">������</span></td>
  <td><input type="text" name="zxje" value="<%=zxje%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=jxStyle%>">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">����ϵ��</span></td>
  <td><input type="text" name="jxxs" value="<%=jxxs%>" size="20" maxlength="17"  <%=jxRead%>></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">������</span></td>
  <td><input type="text" name="jxje" value="<%=jxje%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=zjxStyle%>">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">�ۼ�������ϵ��</span></td>
  <td><input type="text" name="ljzjxxs" value="<%=ljzjxxs%>" size="20" maxlength="17"  <%=zjxRead%>></td>
  <td align="right"><span class="STYLE4"><font color="#FF0000">*</font>�ۼ���������</span></td>
  <td><input type="text" name="ljzjxje" value="<%=ljzjxje%>" size="20" maxlength="17" ></td>
</tr>

<tr bgcolor="#FFFFFF" style="display:<%=sfkyqpcStyle%>">
  <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkyqpcStyle%>">
  <td align="right">�Ƿ�����ڷ��⳥��</td>
  <td><%
	cf.radioToken(out, "sfkyqpc","Y+�Զ���ȡ&S+�˹�¼��&N+��",sfkyqpc,true);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkyqpcStyle%>">
  <td align="right"><font color="#FF0000">*</font>�����ڷ�</td>
  <td><input type="text" name="kyqf" value="<%=yqf%>" size="20" maxlength="17"  <%=sfkyqpcRead%> onChange="jsValue(insertform)"></td>
  <td align="right"><font color="#FF0000">*</font>�ۿͻ��⳥��</td>
  <td><input type="text" name="kkhpck" value="<%=khpck%>" size="20" maxlength="17"  <%=sfkyqpcRead%> onChange="jsValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkyqpcStyle%>">
  <td align="right"><font color="#FF0000">*</font>�ۿͻ�Ƿ��</td>
  <td><input type="text" name="kkhqk" value="<%=khqk%>" size="20" maxlength="17"  <%=sfkyqpcRead%> onChange="jsValue(insertform)"></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">��������ܶ�</span></td>
  <td colspan="3"><input type="text" name="jsjsze" value="<%=jsjsze%>" size="20" maxlength="17" readonly>
    ��������ܶ�=<%=jsjszeStr%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">�������</span></td>
  <td><input type="text" name="jsbl" value="<%=jsbl%>" size="10" maxlength="9" readonly>    
    % </td>
  <td align="right"><font color="#FF0000">*</font>�����������</td>
  <td><input type="text" name="tzjsbl" value="<%=tzjsbl%>" size="10" maxlength="9" onChange="jsValue(insertform)">
% </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">�����ܶ�</span></td>
  <td colspan="3"><input type="text" name="jsje" value="<%=jsje%>" size="20" maxlength="17" readonly>
    <span class="STYLE5"><span class="STYLE2">�����ܶ�</span>��<span class="STYLE4">��������ܶ�</span>����<span class="STYLE4">�������</span>��<span class="STYLE4">�����������</span>��</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�˹��ѽ����</td>
  <td><input type="text" name="rgfjse" value="<%=rgfjse%>" size="20" maxlength="17" readonly></td>
  <td align="right">���Ϸѽ����</td>
  <td><input type="text" name="flfjse" value="<%=flfjse%>" size="20" maxlength="17" readonly></td>
</tr>

<tr bgcolor="#FFFFFF" style="display:<%=zcsfjsStyle%>">
  <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=zcsfjsStyle%>">
  <td align="right">�����Ƿ����</td>
  <td><%
	cf.radioToken(out, "zcsfjs","1+������&2+����������&3+�˹�¼��",zcsfjs,true);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=zcsfjsStyle%>">
  <td align="right"><font color="#FF0000">*</font>���Ľ���ȡ��ʽ</td>
  <td><%
	cf.radioToken(out, "zcjehqfs","1+�Զ���ȡ&2+�˹�¼��",zcjehqfs,true);
%></td>
  <td align="right"><font color="#FF0000">*</font>���Ľ���������޸�</td>
  <td><%
	cf.radioToken(out, "zcjsblkg","1+���޸�&2+�����޸�",zcjsblkg,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=zcsfjsStyle%>">
  <td align="right"><font color="#FF0000">*</font>���Ľ��</td>
  <td><input type="text" name="zcje" value="<%=zcje%>" size="20" maxlength="17"  <%=zcjeRead%> onChange="jsValue(insertform)"></td>
  <td align="right"><font color="#FF0000">*</font>���Ľ������</td>
  <td><input type="text" name="zcjsbl" value="<%=zcjsbl%>" size="20" maxlength="17"  <%=zcjsblRead%> onChange="jsValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=zcsfjsStyle%>">
  <td align="right"><font color="#FF0000">*</font>���Ľ�����</td>
  <td><input type="text" name="zcjsje" value="<%=zcjsje%>" size="20" maxlength="17"  <%=zcjsjeRead%> onChange="jsValue(insertform)"></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkclkStyle%>">
  <td align="right"><span class="STYLE2"><font color="#FF0000">*</font>�Ƿ�۲��Ͽ�</span></td>
  <td><%
	cf.radioToken(out, "sfkclk","Y+��&N+��",sfkclk,true);
%></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">���Ϸ�</span></td>
  <td><input type="text" name="clf" value="<%=clf%>" size="20" maxlength="17"  <%=sfkclkRead%>></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkgdypStyle%>">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">�Ƿ�۹�����Ʒ</span></td>
  <td><%
	cf.radioToken(out, "sfkgdyp","Y+��&N+��",sfkgdyp,true);
%></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">������Ʒ</span></td>
  <td><input type="text" name="gdyp" value="<%=gdyp%>" size="20" maxlength="17"  <%=sfkgdypRead%>></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkyfgfStyle%>">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">�Ƿ���Ѹ�����</span></td>
  <td><%
	cf.radioToken(out, "sfkyfgf","Y+��&N+��",sfkyfgf,true);
%></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">�Ѹ�����</span></td>
  <td><input name="yfgf" type="text" value="<%=yfgf%>" size="20" maxlength="17"  <%=sfkyfgfRead%>></td>
</tr>

<tr bgcolor="#FFFFFF" style="display:<%=sfkzbjStyle%>">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">�Ƿ���ʱ���</span></td>
  <td><%
	cf.radioToken(out, "sfkzbj","Y+���ʱ���������ɸ�&M+���ʱ�������ɸ�&N+�����ʱ���",sfkzbj,true);
%></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">���ʱ���</span></td>
  <td><input type="text" name="kzbj" value="<%=kzbj%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkzbjStyle%>">
  <td align="right" width="18%"><font color="#FF0000">*</font>Ӧ���ʱ������</td> 
  <td width="32%"> 
    <input type="text" name="kzbjbl" value="<%=kzbjbl%>" size="10" maxlength="9" <%=sfkzbjRead%> onChange="jsValue(insertform)">
    % </td>
  <td align="right" width="18%">���ʱ������</td> 
  <td width="32%"><%
	cf.radioToken(out, "kzbjjs","1+�������&2+�����ܶ�",kzbjjs,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkclfkStyle%>">
  <td align="right"><span class="STYLE2"><font color="#FF0000">*</font>�Ƿ�۸��ķ���</span></td>
  <td><%
	cf.radioToken(out, "sfkclfk","Y+�Զ���ȡ&S+�˹�¼��&N+��",sfkclfk,true);
%></td>
  <td align="right"><font color="#FF0000">*</font>���ķ���</td>
  <td><input type="text" name="clfk" value="<%=clfk%>" size="20" maxlength="17" onChange="jsValue(insertform)" <%=sfkclfkRead%>></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkclyfStyle%>">
  <td align="right"><span class="STYLE2"><font color="#FF0000">*</font>�Ƿ�۲����˷�</span></td>
  <td><%
	cf.radioToken(out, "sfkclyf","Y+�Զ���ȡ&S+�˹�¼��&N+��",sfkclyf,true);
%></td>
  <td align="right"><font color="#FF0000">*</font>�����˷�</td>
  <td><input type="text" name="clyf" value="<%=clyf%>" size="20" maxlength="17" onChange="jsValue(insertform)" <%=sfkclyfRead%> ></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkzckkStyle%>">
  <td align="right"><span class="STYLE2"><font color="#FF0000">*</font>�Ƿ�����Ŀۿ�</span></td>
  <td><%
	cf.radioToken(out, "sfkzckk","Y+�Զ���ȡ&S+�˹�¼��&N+��",sfkzckk,true);
%></td>
  <td align="right"><font color="#FF0000">*</font>���Ŀۿ�</td>
  <td><input type="text" name="zckk" value="<%=zckk%>" size="20" maxlength="17" onChange="jsValue(insertform)" <%=sfkzckkRead%>></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfjzcjlStyle%>">
  <td align="right"><span class="STYLE2"><font color="#FF0000">*</font>�Ƿ�����Ľ���</span></td>
  <td><%
	cf.radioToken(out, "sfjzcjl","Y+�Զ���ȡ&S+�˹�¼��&N+��",sfjzcjl,true);
%></td>
  <td align="right"><font color="#FF0000">*</font>���Ľ���</td>
  <td><input type="text" name="zcjl" value="<%=zcjl%>" size="20" maxlength="17" onChange="jsValue(insertform)" <%=sfjzcjlRead%>></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkfkjeStyle%>">
  <td align="right"><span class="STYLE2"><font color="#FF0000">*</font>�Ƿ�۷�����</span></td>
  <td><%
	cf.radioToken(out, "sfkfkje","Y+�Զ���ȡ&S+�˹�¼��&N+��",sfkfkje,true);
%></td>
  <td align="right"><font color="#FF0000">*</font>������</td>
  <td><input type="text" name="fkje" value="<%=fkje%>" size="20" maxlength="17" onChange="jsValue(insertform)" <%=sfkfkjeRead%>></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfjjljeStyle%>">
  <td align="right"><span class="STYLE2"><font color="#FF0000">*</font>�Ƿ�ӽ������</span></td>
  <td><%
	cf.radioToken(out, "sfjjlje","Y+�Զ���ȡ&S+�˹�¼��&N+��",sfjjlje,true);
%></td>
  <td align="right"><font color="#FF0000">*</font>�������</td>
  <td><input type="text" name="jlje" value="<%=jlje%>" size="20" maxlength="17" onChange="jsValue(insertform)" <%=sfjjljeRead%>></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfjqtjeStyle%>">
  <td align="right"><span class="STYLE2"><font color="#FF0000">*</font>�Ƿ���������</span></td>
  <td><%
	cf.radioToken(out, "sfjqtje","Y+�Զ���ȡ&S+�˹�¼��&N+��",sfjqtje,true);
%></td>
  <td align="right"><font color="#FF0000">*</font>�������</td>
  <td><input type="text" name="qtje" value="<%=qtje%>" size="20" maxlength="17" onChange="jsValue(insertform)" <%=sfjqtjeRead%>></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">Ӧ�����</span></td>
  <td colspan="3"><input type="text" name="yfje" value="<%=yfje%>" size="20" maxlength="17" readonly></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td height="29" align="right">&nbsp;</td>
  <td colspan="3"><%=yfjeStr%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">*</span><span class="STYLE2">¼�벿��</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>  </td>
  <td align="right">��������</td>
  <td><input type="text" name="jsrq" value="<%=cf.today()%>" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ע</td>
  <td colspan="3"><textarea name="bz" cols="71" rows="3"></textarea>  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="button" onClick="window.open('dyjsd.jsp?jsjlh=<%=jsjlh%>')"  value="��ӡ���㵥">
	<input type="reset"  value="����" name="reset">
	<input type="hidden" name="jsjlh" value="<%=jsjlh%>" size="20" maxlength="9" readonly>
    <input type="hidden" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>
    <input type="hidden" name="sgd" value="<%=sgd%>" size="20" maxlength="20" readonly>
    <input type="hidden" name="sgbz" value="<%=sgbz%>" size="20" maxlength="20" readonly>

    <input type="hidden" name="htgcf" value="<%=htgcf%>" >
    <input type="hidden" name="htqtsf" value="<%=htqtsf%>" >
    <input type="hidden" name="gcfzjx" value="<%=gcfzjx%>" >
    <input type="hidden" name="qtsfzjx" value="<%=qtsfzjx%>" >
    <input type="hidden" name="qtfsm" value="<%=qtfsm%>" >
    <input type="hidden" name="htsgcb" value="<%=htsgcb%>" >
    <input type="hidden" name="zjxsgcb" value="<%=zjxsgcb%>" >
    <input type="hidden" name="ljclf" value="<%=ljclf%>" >
    <input type="hidden" name="ljrgf" value="<%=ljrgf%>" >
    <input type="hidden" name="ssk" value="<%=ssk%>" >	
    <input type="hidden" name="sdlqz" value="<%=sdlqz%>" >	
    <input type="hidden" name="jsjsxjje" value="<%=jsjsxjje%>" >	
    <input type="hidden" name="zbjce" value="<%=zbjce%>" >	
	</td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function jsValue(FormName)//����FormName:Form������
{
	//���㣺��������ܶ������������������ʼ
	var jsjsze=<%=jsjsxjje%>;
	if ("<%=sdljsfs%>"=="2")//ˮ��·���㷽ʽ  1�����������㣻2�������������ɸģ�3�����������ɸģ�4���ֹ�¼�������
	{
		jsjsze=round(jsjsze+FormName.sdljsje.value*1.0,2);
	}
	else if ("<%=sdljsfs%>"=="3")//ˮ��·���㷽ʽ  1�����������㣻2�������������ɸģ�3�����������ɸģ�4���ֹ�¼�������
	{
		var sdljsje=FormName.sdlje.value/100.0*FormName.sdljsbl.value
		sdljsje=round(sdljsje,2);
		FormName.sdljsje.value=sdljsje;

		jsjsze=round(jsjsze+FormName.sdljsje.value*1.0,2);
	}
	else if ("<%=sdljsfs%>"=="4")//ˮ��·���㷽ʽ  1�����������㣻2�������������ɸģ�3�����������ɸģ�4���ֹ�¼�������
	{
		jsjsze=round(jsjsze+FormName.sdljsje.value*1.0,2);
	}

	if ("<%=zjxjffs%>"!="1")//���������ʽ  1:��������2: �ۼ��ۺ��������3:�ۼ�������ʩ���ɱ���4: �ۺ�����������5: ����ʩ���ɱ�����ʩ���ɱ���6:����ʩ���ɱ��ۺ�����7: �ۺ����������ʩ���ɱ�
	{
		//���ѡ��ͬ�ļ��㷽ʽ������Ҫ����Ϊ0 ����������ֱ�����
		jsjsze=round(jsjsze + <%=zxje*zxxs+jxje*jxxs+ljzjxxs*ljzjxje%>,2);
	}

	if ("<%=sfkyqpc%>"!="N")//�Ƿ�����ڷ��⳥��  Y���Զ���ȡ��S���˹�¼�룻N����
	{
		jsjsze=round(jsjsze-FormName.kkhqk.value*1.0-FormName.kkhpck.value*1.0-FormName.kyqf.value*1.0,2);
	}

	jsjsze=round(jsjsze,2);
	FormName.jsjsze.value=jsjsze;
	//���㣺��������ܶ������������������������

	//������=��������ܶ��������������������������
	var jsje=FormName.jsjsze.value/100*(FormName.jsbl.value*1.0+FormName.tzjsbl.value*1.0);//������
	jsje=round(jsje,2);
	FormName.jsje.value=jsje;


	//���㣺Ӧ��������������������������������ʼ
	var yfje=FormName.jsje.value*1.0;//ʵ�ʲ���

	if ("<%=zcsfjs%>"=="2")//�����Ƿ����  1�������㣻2�����������㣻3���˹�¼��
	{
		var zcjsje=round(FormName.zcje.value/100.0*FormName.zcjsbl.value,2);
		zcjsje=round(zcjsje,2);
		FormName.zcjsje.value=zcjsje;

		yfje=yfje+FormName.zcjsje.value*1.0;
	}
	else if ("<%=zcsfjs%>"=="3")//�����Ƿ����  1�������㣻2�����������㣻3���˹�¼��
	{
		yfje=yfje+FormName.zcjsje.value*1.0;
	}

	
	if ("<%=sfkclk%>"=="Y")//�Ƿ�۲��Ͽ�
	{
		yfje=yfje-FormName.clf.value*1.0;
	}
	if ("<%=sfkgdyp%>"=="Y")//�Ƿ�۹�����Ʒ
	{
		yfje=yfje-FormName.gdyp.value*1.0;
	}
	if ("<%=sfkyfgf%>"=="Y")//�Ƿ���Ѹ�����
	{
		yfje=yfje-FormName.yfgf.value*1.0;
	}


	//���ʱ���
	if ("<%=sfkzbj%>"!="N")//�Ƿ���ʱ���  Y:���ʱ���������ɸģ�M:���ʱ�������ɸģ�N:�����ʱ���
	{
		var kzbj=0;
		if ("<%=kzbjjs%>"=="1")//���ʱ������  1����������ܶ2�������ܶ�
		{
			kzbj=round(FormName.jsjsze.value/100.0*FormName.kzbjbl.value,2);//���ʱ���
		}
		else{
			kzbj=round(FormName.jsje.value/100.0*FormName.kzbjbl.value,2);//���ʱ���
		}

		if (<%=zbjce%> > 0)
		{
			if (kzbj><%=zbjce%>)//�ʱ�������ٿ۳�
			{
				kzbj=<%=zbjce%>;
			}
		}
		else{
			kzbj=0;
		}

		FormName.kzbj.value=kzbj;

		yfje=yfje-kzbj;
	}

	if ("<%=sfkclfk%>"!="N")//�Ƿ�۸��ķ���  Y���Զ���ȡ��S���˹�¼�룻N����
	{
		yfje=yfje-FormName.clfk.value/1.0;
	}
	if ("<%=sfkclyf%>"!="N")//�Ƿ�۲����˷�  Y���Զ���ȡ��S���˹�¼�룻N����
	{
		yfje=yfje-FormName.clyf.value/1.0;
	}
	if ("<%=sfkzckk%>"!="N")//�Ƿ�����Ŀۿ�  Y���Զ���ȡ��S���˹�¼�룻N����
	{
		yfje=yfje-FormName.zckk.value/1.0;
	}
	if ("<%=sfjzcjl%>"!="N")//�Ƿ�����Ľ���  Y���Զ���ȡ��S���˹�¼�룻N����
	{
		yfje=yfje+FormName.zcjl.value/1.0;
	}
	if ("<%=sfkfkje%>"!="N")//�Ƿ�۷�����  Y���Զ���ȡ��S���˹�¼�룻N����
	{
		yfje=yfje-FormName.fkje.value/1.0;
	}
	if ("<%=sfjjlje%>"!="N")//�Ƿ�ӽ������  Y���Զ���ȡ��S���˹�¼�룻N����
	{
		yfje=yfje+FormName.jlje.value/1.0;
	}
	if ("<%=sfjqtje%>"!="N")//�Ƿ���������  Y���Զ���ȡ��S���˹�¼�룻N����
	{
		yfje=yfje+FormName.qtje.value/1.0;
	}

	yfje=round(yfje,2);
	FormName.yfje.value=yfje;
	//���㣺Ӧ����������������������������������

}

function f_do(FormName)//����FormName:Form������
{
	jsValue(FormName);

	if(	javaTrim(FormName.jsjlh)=="") {
		alert("������[�����¼��]��");
		FormName.jsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("������[ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.htgcf)=="") {
		alert("������[��ͬ���̶�]��");
		FormName.htgcf.focus();
		return false;
	}
	if(!(isFloat(FormName.htgcf, "��ͬ���̶�"))) {
		return false;
	}
	if(	javaTrim(FormName.htqtsf)=="") {
		alert("������[��ͬ�����շ�]��");
		FormName.htqtsf.focus();
		return false;
	}
	if(!(isFloat(FormName.htqtsf, "��ͬ�����շ�"))) {
		return false;
	}
	if(	javaTrim(FormName.gcfzjx)=="") {
		alert("������[���̷�������]��");
		FormName.gcfzjx.focus();
		return false;
	}
	if(!(isFloat(FormName.gcfzjx, "���̷�������"))) {
		return false;
	}
	if(	javaTrim(FormName.qtsfzjx)=="") {
		alert("������[������������]��");
		FormName.qtsfzjx.focus();
		return false;
	}
	if(!(isFloat(FormName.qtsfzjx, "������������"))) {
		return false;
	}
	if(	javaTrim(FormName.htsgcb)=="") {
		alert("������[��ͬ��ʩ���ɱ�]��");
		FormName.htsgcb.focus();
		return false;
	}
	if(!(isFloat(FormName.htsgcb, "��ͬ��ʩ���ɱ�"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxsgcb)=="") {
		alert("������[������ʩ���ɱ�]��");
		FormName.zjxsgcb.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxsgcb, "������ʩ���ɱ�"))) {
		return false;
	}
	if(	javaTrim(FormName.ljclf)=="") {
		alert("������[�ۼƲ��Ϸ�]��");
		FormName.ljclf.focus();
		return false;
	}
	if(!(isFloat(FormName.ljclf, "�ۼƲ��Ϸ�"))) {
		return false;
	}
	if(	javaTrim(FormName.ljrgf)=="") {
		alert("������[�ۼ��˹���]��");
		FormName.ljrgf.focus();
		return false;
	}
	if(!(isFloat(FormName.ljrgf, "�ۼ��˹���"))) {
		return false;
	}
	if(	javaTrim(FormName.ssk)=="") {
		alert("������[ʵ�տ�]��");
		FormName.ssk.focus();
		return false;
	}
	if(!(isFloat(FormName.ssk, "ʵ�տ�"))) {
		return false;
	}
	if(	javaTrim(FormName.jsyh)=="") {
		alert("������[�ͻ������Ż�]��");
		FormName.jsyh.focus();
		return false;
	}
	if(!(isFloat(FormName.jsyh, "�ͻ������Ż�"))) {
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
	if(	javaTrim(FormName.yqf)=="") {
		alert("������[���ڷ�]��");
		FormName.yqf.focus();
		return false;
	}
	if(!(isFloat(FormName.yqf, "���ڷ�"))) {
		return false;
	}
	if(	javaTrim(FormName.khqk)=="") {
		alert("������[�ͻ�Ƿ��]��");
		FormName.khqk.focus();
		return false;
	}
	if(!(isFloat(FormName.khqk, "�ͻ�Ƿ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jsjs)=="") {
		alert("������[�������]��");
		FormName.jsjs.focus();
		return false;
	}
	if(	javaTrim(FormName.htjsjs)=="") {
		alert("������[��ͬ�������]��");
		FormName.htjsjs.focus();
		return false;
	}
	if(!(isFloat(FormName.htjsjs, "��ͬ�������"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxjsjs)=="") {
		alert("������[������������]��");
		FormName.zjxjsjs.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxjsjs, "������������"))) {
		return false;
	}
	if(	javaTrim(FormName.sdljsfs)=="") {
		alert("������[ˮ��·���㷽ʽ]��");
		FormName.sdljsfs.focus();
		return false;
	}
	if(	javaTrim(FormName.sdlje)=="") {
		alert("������[ˮ��·���]��");
		FormName.sdlje.focus();
		return false;
	}
	if(!(isFloat(FormName.sdlje, "ˮ��·���"))) {
		return false;
	}
	if(	javaTrim(FormName.sdljsbl)=="") {
		alert("������[ˮ��·�������]��");
		FormName.sdljsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sdljsbl, "ˮ��·�������"))) {
		return false;
	}
	if(	javaTrim(FormName.sdljsje)=="") {
		alert("������[ˮ��·������]��");
		FormName.sdljsje.focus();
		return false;
	}
	if(!(isFloat(FormName.sdljsje, "ˮ��·������"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxjffs)=="") {
		alert("������[���������ʽ]��");
		FormName.zjxjffs.focus();
		return false;
	}
	if(	javaTrim(FormName.ljzjxxs)=="") {
		alert("������[�ۼ�������ϵ��]��");
		FormName.ljzjxxs.focus();
		return false;
	}
	if(!(isFloat(FormName.ljzjxxs, "�ۼ�������ϵ��"))) {
		return false;
	}
	if(	javaTrim(FormName.ljzjxje)=="") {
		alert("������[�ۼ�������]��");
		FormName.ljzjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.ljzjxje, "�ۼ�������"))) {
		return false;
	}
	if(	javaTrim(FormName.zxxs)=="") {
		alert("������[����ϵ��]��");
		FormName.zxxs.focus();
		return false;
	}
	if(!(isFloat(FormName.zxxs, "����ϵ��"))) {
		return false;
	}
	if(	javaTrim(FormName.zxje)=="") {
		alert("������[������]��");
		FormName.zxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zxje, "������"))) {
		return false;
	}
	if(	javaTrim(FormName.jxxs)=="") {
		alert("������[����ϵ��]��");
		FormName.jxxs.focus();
		return false;
	}
	if(!(isFloat(FormName.jxxs, "����ϵ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jxje)=="") {
		alert("������[������]��");
		FormName.jxje.focus();
		return false;
	}
	if(!(isFloat(FormName.jxje, "������"))) {
		return false;
	}
	if(	javaTrim(FormName.sfkyqpc)=="") {
		alert("������[�Ƿ�����ڷ��⳥��]��");
		FormName.sfkyqpc.focus();
		return false;
	}
	if(	javaTrim(FormName.kyqf)=="") {
		alert("������[�����ڷ�]��");
		FormName.kyqf.focus();
		return false;
	}
	if(!(isFloat(FormName.kyqf, "�����ڷ�"))) {
		return false;
	}
	if(	javaTrim(FormName.kkhpck)=="") {
		alert("������[�ۿͻ��⳥��]��");
		FormName.kkhpck.focus();
		return false;
	}
	if(!(isFloat(FormName.kkhpck, "�ۿͻ��⳥��"))) {
		return false;
	}
	if(	javaTrim(FormName.kkhqk)=="") {
		alert("������[�ۿͻ�Ƿ��]��");
		FormName.kkhqk.focus();
		return false;
	}
	if(!(isFloat(FormName.kkhqk, "�ۿͻ�Ƿ��"))) {
		return false;
	}
	if(	javaTrim(FormName.zcsfjs)=="") {
		alert("������[�����Ƿ����]��");
		FormName.zcsfjs.focus();
		return false;
	}
	if(	javaTrim(FormName.zcjsbl)=="") {
		alert("������[���Ľ������]��");
		FormName.zcjsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zcjsbl, "���Ľ������"))) {
		return false;
	}
	if(	javaTrim(FormName.zcje)=="") {
		alert("������[���Ľ��]��");
		FormName.zcje.focus();
		return false;
	}
	if(!(isFloat(FormName.zcje, "���Ľ��"))) {
		return false;
	}
	if(	javaTrim(FormName.zcjsje)=="") {
		alert("������[���Ľ�����]��");
		FormName.zcjsje.focus();
		return false;
	}
	if(!(isFloat(FormName.zcjsje, "���Ľ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.jsjsze)=="") {
		alert("������[��������ܶ�]��");
		FormName.jsjsze.focus();
		return false;
	}
	if(!(isFloat(FormName.jsjsze, "��������ܶ�"))) {
		return false;
	}
	if(	javaTrim(FormName.jsbl)=="") {
		alert("������[�������]��");
		FormName.jsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.jsbl, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.tzjsbl)=="") {
		alert("������[�����������]��");
		FormName.tzjsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.tzjsbl, "�����������"))) {
		return false;
	}


	
	if(	javaTrim(FormName.jsje)=="") {
		alert("������[�����ܶ�]��");
		FormName.jsje.focus();
		return false;
	}
	if(!(isFloat(FormName.jsje, "�����ܶ�"))) {
		return false;
	}
	if(	javaTrim(FormName.rgfjse)=="") {
		alert("������[�˹��ѽ����]��");
		FormName.rgfjse.focus();
		return false;
	}
	if(!(isFloat(FormName.rgfjse, "�˹��ѽ����"))) {
		return false;
	}
	if(	javaTrim(FormName.flfjse)=="") {
		alert("������[���Ϸѽ����]��");
		FormName.flfjse.focus();
		return false;
	}
	if(!(isFloat(FormName.flfjse, "���Ϸѽ����"))) {
		return false;
	}

	if(	javaTrim(FormName.sfkclk)=="") {
		alert("������[�Ƿ�۲��Ͽ�]��");
		FormName.sfkclk.focus();
		return false;
	}
	if(	javaTrim(FormName.clf)=="") {
		alert("������[���Ϸ�]��");
		FormName.clf.focus();
		return false;
	}
	if(!(isFloat(FormName.clf, "���Ϸ�"))) {
		return false;
	}
	if(	javaTrim(FormName.sfkgdyp)=="") {
		alert("������[�Ƿ�۹�����Ʒ]��");
		FormName.sfkgdyp.focus();
		return false;
	}
	if(	javaTrim(FormName.gdyp)=="") {
		alert("������[������Ʒ]��");
		FormName.gdyp.focus();
		return false;
	}
	if(!(isFloat(FormName.gdyp, "������Ʒ"))) {
		return false;
	}


	
	if(	javaTrim(FormName.sfkyfgf)=="") {
		alert("������[�Ƿ���Ѹ�����]��");
		FormName.sfkyfgf.focus();
		return false;
	}
	if(	javaTrim(FormName.yfgf)=="") {
		alert("������[�Ѹ�����]��");
		FormName.yfgf.focus();
		return false;
	}
	if(!(isFloat(FormName.yfgf, "�Ѹ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.sfkzbj)=="") {
		alert("������[�Ƿ���ʱ���]��");
		FormName.sfkzbj.focus();
		return false;
	}
	if(	javaTrim(FormName.kzbjbl)=="") {
		alert("������[���ʱ������]��");
		FormName.kzbjbl.focus();
		return false;
	}
	if(!(isFloat(FormName.kzbjbl, "���ʱ������"))) {
		return false;
	}
	if(	javaTrim(FormName.kzbj)=="") {
		alert("������[���ʱ���]��");
		FormName.kzbj.focus();
		return false;
	}
	if(!(isFloat(FormName.kzbj, "���ʱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sfkclfk)=="") {
		alert("������[�Ƿ�۸��ķ���]��");
		FormName.sfkclfk.focus();
		return false;
	}
	if(	javaTrim(FormName.clfk)=="") {
		alert("������[���ķ���]��");
		FormName.clfk.focus();
		return false;
	}
	if(!(isFloat(FormName.clfk, "���ķ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sfkclyf)=="") {
		alert("������[�Ƿ�۲����˷�]��");
		FormName.sfkclyf.focus();
		return false;
	}
	if(	javaTrim(FormName.clyf)=="") {
		alert("������[�����˷�]��");
		FormName.clyf.focus();
		return false;
	}
	if(!(isFloat(FormName.clyf, "�����˷�"))) {
		return false;
	}
	if(	javaTrim(FormName.sfkzckk)=="") {
		alert("������[�Ƿ�����Ŀۿ�]��");
		FormName.sfkzckk.focus();
		return false;
	}
	if(	javaTrim(FormName.zckk)=="") {
		alert("������[���Ŀۿ�]��");
		FormName.zckk.focus();
		return false;
	}
	if(!(isFloat(FormName.zckk, "���Ŀۿ�"))) {
		return false;
	}
	if(	javaTrim(FormName.sfjzcjl)=="") {
		alert("������[�Ƿ�����Ľ���]��");
		FormName.sfjzcjl.focus();
		return false;
	}
	if(	javaTrim(FormName.zcjl)=="") {
		alert("������[���Ľ���]��");
		FormName.zcjl.focus();
		return false;
	}
	if(!(isFloat(FormName.zcjl, "���Ľ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sfkfkje)=="") {
		alert("������[�Ƿ�۷�����]��");
		FormName.sfkfkje.focus();
		return false;
	}
	if(	javaTrim(FormName.fkje)=="") {
		alert("������[������]��");
		FormName.fkje.focus();
		return false;
	}
	if(!(isFloat(FormName.fkje, "������"))) {
		return false;
	}
	if(	javaTrim(FormName.sfjjlje)=="") {
		alert("������[�Ƿ�ӽ������]��");
		FormName.sfjjlje.focus();
		return false;
	}
	if(	javaTrim(FormName.jlje)=="") {
		alert("������[�������]��");
		FormName.jlje.focus();
		return false;
	}
	if(!(isFloat(FormName.jlje, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.sfjqtje)=="") {
		alert("������[�Ƿ���������]��");
		FormName.sfjqtje.focus();
		return false;
	}
	if(	javaTrim(FormName.qtje)=="") {
		alert("������[�������]��");
		FormName.qtje.focus();
		return false;
	}
	if(!(isFloat(FormName.qtje, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.yfje)=="") {
		alert("������[Ӧ�����]��");
		FormName.yfje.focus();
		return false;
	}
	if(!(isFloat(FormName.yfje, "Ӧ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.jsrq)=="") {
		alert("������[��������]��");
		FormName.jsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jsrq, "��������"))) {
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
		alert("������[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
