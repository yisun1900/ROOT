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
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

//�ͻ�������Ϣ
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String khjl=null;
String sgd="";
String sgbz=null;
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

double sgcbj=0;
double zxsgcbj=0;
double zxclf=0;
double zxrgf=0;
double khpck=0;
double yqf=0;
double jsyh=0;

double khqk=0;//�ͻ�Ƿ��
double htgcf=0;//��ͬ���̶�
double gcfzjx=0;//���̷�������
double htqtsf=0;//��ͬ������
double qtsfzjx=0;//������������
String qtfsm="";//������˵��
double htsgcb=0;//��ͬ��ʩ���ɱ�
double zjxsgcb=0;//������ʩ���ɱ�

double ljclf=0;//�ۼƲ��Ϸ�
double ljrgf=0;//�ۼ��˹���

//�������
String bfcs=null;//��������
String bfjs=null;//��������
double bfbl=0;//��������
String sgdjbxg=null;//�Ƿ���ʩ���Ӽ������

String sdljsfs=null;//ˮ��·���㷽ʽ
String sdlqz="";//ˮ��·ȡֵ
String sdlqzStr="";//ˮ��·ȡֵ
double sdlbfbl=0;//ˮ��·��������
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


/*
*/

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



String yfjeStr="";
String jsjszeStr="�������";//��������ܶ���㷽ʽ


double yqzbj=0;//Ҫ���ʱ���
double zbj=0;//�ۼ��ʱ���
double zbjce=0;//�ʱ�����


String jsjlh=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

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

	ls_sql="select sfxmmc";
	ls_sql+=" from  bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		qtfsm+=rs.getString(1)+"��";
	}
	rs.close();
	ps.close();

	ls_sql="select sgcbj,zxsgcbj,zxclf,zxrgf,khpck,yqf,jsyh";
	ls_sql+=" from crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgcbj=rs.getDouble("sgcbj");
		zxsgcbj=rs.getDouble("zxsgcbj");
		zxclf=rs.getDouble("zxclf");
		zxrgf=rs.getDouble("zxrgf");
		khpck=rs.getDouble("khpck");
		yqf=rs.getDouble("yqf");
		jsyh=rs.getDouble("jsyh");
	}
	rs.close();
	ps.close();

	ls_sql="select yqzbj,zbj";
	ls_sql+=" from sq_sgd";
	ls_sql+=" where sgd='"+sgd+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yqzbj=rs.getDouble("yqzbj");//Ҫ���ʱ���
		zbj=rs.getDouble("zbj");//�ۼ��ʱ���
	}
	rs.close();
	ps.close();

	if (zbj<yqzbj)
	{
		zbjce=cf.round(yqzbj-zbj,2);//�ʱ�����
	}


	//�ͻ�Ƿ��
	khqk=cf.round(qye+zhljzjx-jsyh-khpck-yqf-cwsfke,2);

	htgcf=zhgczjf;//��ͬ���̶�
	gcfzjx=zhzjxje;//���̷�������

	htqtsf=zhqtsf+zhwjrqyexm+guanlif+suijin+sjf;//��ͬ������
	qtsfzjx=zhqtsfzjx+zhwjrzjx+zjxguanlif+zjxsuijin+zhsjfzjx;//������������

	htsgcb=sgcbj;//��ͬ��ʩ���ɱ�
	zjxsgcb=zxsgcbj;//������ʩ���ɱ�

	ljclf=zxclf;//�ۼƲ��Ϸ�
	ljrgf=zxrgf;//�ۼ��˹���

	if (sgd.equals(""))//1:�������ڽ�������
	{
		out.println("<BR>������������ʩ����");
		return;
	}

	if (!gdjsjd.equals("X"))//1:�������ڽ�������
	{
		out.println("<BR>���������󣬽�����Ȳ���ȷ");
		return;
	}


	//ʩ���ӽ��������
	ls_sql="select bfcs,bfjs,bfbl,sgdjbxg   ,sdljsfs,sdlqz,DECODE(sdlqz,'1','��ǰ','2','�ۺ�','3','ʩ���ɱ���') sdlqzStr,sdlbfbl,zjxjffs,ljzjxxs,zxxs,jxxs,zjxbhfw,zjxsjd,sfkyqpc,zcsfjs,zcjehqfs,zcjsblkg,zcjsbl";
	ls_sql+="  ,sfkzbj,kzbjjs,kzbjbl,sfkclk,sfkgdyp,sfkyfgf  ,sfkclfk,sfkclyf,sfkzckk,sfjzcjl,sfkfkje,sfjjlje,sfjqtje";
	ls_sql+=" from  dm_sgdjscsb";
	ls_sql+=" where fgsbh='"+fgsbh+"' and sfwgjs='Y'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bfcs=rs.getString("bfcs");//��������
		bfjs=rs.getString("bfjs");//��������
		bfbl=rs.getDouble("bfbl");//��������
		sgdjbxg=cf.fillNull(rs.getString("sgdjbxg"));//�Ƿ���ʩ���Ӽ������

		sdljsfs=cf.fillNull(rs.getString("sdljsfs"));//ˮ��·���㷽ʽ
		sdlqz=cf.fillNull(rs.getString("sdlqz"));//ˮ��·ȡֵ
		sdlqzStr=cf.fillNull(rs.getString("sdlqzStr"));//ˮ��·ȡֵ
		sdlbfbl=rs.getDouble("sdlbfbl");//ˮ��·��������
		zjxjffs=cf.fillNull(rs.getString("zjxjffs"));//���������ʽ
		ljzjxxs=rs.getDouble("ljzjxxs");//�ۼ�������ϵ��
		zxxs=rs.getDouble("zxxs");//����ϵ��
		jxxs=rs.getDouble("jxxs");//����ϵ��
		zjxbhfw=cf.fillNull(rs.getString("zjxbhfw"));//�����������Χ
		zjxsjd=cf.fillNull(rs.getString("zjxsjd"));//������ʱ���
		sfkyqpc=cf.fillNull(rs.getString("sfkyqpc"));//�Ƿ�����ڷ��⳥��
		zcsfjs=cf.fillNull(rs.getString("zcsfjs"));//�����Ƿ����
		zcjehqfs=cf.fillNull(rs.getString("zcjehqfs"));//���Ľ���ȡ��ʽ
		zcjsblkg=cf.fillNull(rs.getString("zcjsblkg"));//���Ľ���������޸�
		zcjsbl=rs.getDouble("zcjsbl");//���Ľ������

		sfkzbj=cf.fillNull(rs.getString("sfkzbj"));//�Ƿ���ʱ���
		kzbjjs=cf.fillNull(rs.getString("kzbjjs"));//���ʱ������
		kzbjbl=rs.getDouble("kzbjbl");//���ʱ������
		sfkclk=cf.fillNull(rs.getString("sfkclk"));//�Ƿ�۲��Ͽ�
		sfkgdyp=cf.fillNull(rs.getString("sfkgdyp"));//�Ƿ�۹�����Ʒ
		sfkyfgf=cf.fillNull(rs.getString("sfkyfgf"));//�Ƿ���Ѹ�����

		sfkclfk=cf.fillNull(rs.getString("sfkclfk"));//�Ƿ�۸��ķ���
		sfkclyf=cf.fillNull(rs.getString("sfkclyf"));//�Ƿ�۲����˷�
		sfkzckk=cf.fillNull(rs.getString("sfkzckk"));//�Ƿ�����Ŀۿ�
		sfjzcjl=cf.fillNull(rs.getString("sfjzcjl"));//�Ƿ�����Ľ���
		sfkfkje=cf.fillNull(rs.getString("sfkfkje"));//�Ƿ�۷�����
		sfjjlje=cf.fillNull(rs.getString("sfjjlje"));//�Ƿ�ӽ������
		sfjqtje=cf.fillNull(rs.getString("sfjqtje"));//�Ƿ���������
	}
	rs.close();
	ps.close();

	if (bfjs==null)
	{
		out.println("�����ޡ�����������á������ܽ��н���");
		return;
	}

	//�������
	jsjs=bfjs;
	//�������
	jsbl=bfbl;

	if (sgdjbxg.equals("Y"))//Y���ǣ�N����
	{
		String sgdjbbm=null;
		ls_sql="select sgdjbbm";
		ls_sql+=" from  sq_sgd";
		ls_sql+=" where sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
		}
		rs.close();
		ps.close();

		String zyfw=null;
		double jbjsbl=0;
		ls_sql="select jsbl,zyfw";
		ls_sql+=" from  dm_jbtjsbl";
		ls_sql+=" where fgsbh='"+fgsbh+"' and bfcs="+bfcs+" and sgdjbbm='"+sgdjbbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jbjsbl=rs.getDouble("jsbl");
			zyfw=cf.fillNull(rs.getString("zyfw"));//���÷�Χ  1��ȫ����2��Ӱ�칤��ֱ�ӷѣ�3��Ӱ�������շ�

			jsbl=jbjsbl;
		}
		else{
			rs.close();
			ps.close();
			out.println("�����ޡ�ʩ���Ӽ������������������ܽ��н���:"+ls_sql);
			return;
		}
		rs.close();
		ps.close();
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



	//���ϵ�
	ls_sql="select sum(pszje)";
	ls_sql+=" from  jxc_clpsd";
	ls_sql+=" where khbh='"+khbh+"' and psdzt in('2','3','5')";
	//0���ȴ��ύ��1���ȴ���ˣ�2���ȴ����⣻3���ѳ��⣻5�����ֳ��⣻6�����������޸ģ�7������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clf=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	
	//������Ʒ���ü�¼
	ls_sql="select sum(je)";
	ls_sql+=" from  cw_gdyplyjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N'";//0��δ���㣻1���ѽ���
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gdyp=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	//�Ѹ�����
	ls_sql="select sum(sjbk)";
	ls_sql+=" from  cw_sgdbgfty";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yfgf=rs.getDouble(1);
	}
	rs.close();
	ps.close();




	//��ȡ����ͬ���������������������������������������������ʼ	
	double htje=0;
	double zjxje=0;
	
	//1����ͬ���̷ѡ�2����ͬ���̷ѣ������ѡ�J�����¹��̷ѡ�K�����¹��̷ѣ������ѡ�3��ʵ�տ��ܶ4��һ�ڿ5�����ڿ6�����ڿ7����ͬ���̻������ۡ�8����ͬ���̻������ۣ������ѻ������ۡ�L�����¹��̻������ۡ�M�����¹��̻������ۣ������ѻ������ۡ�9�����¹���ʩ���ɱ��ۡ�A�����¹���ʩ���ɱ��ۣ�������ʩ���ɱ���D����ͬ����ʩ���ɱ��ۡ�E����ͬ����ʩ���ɱ��ۣ�������ʩ���ɱ���B����ͬ���̳ɱ��ۡ�C����ͬ���̳ɱ��ۣ������ѳɱ���N�����¹��̳ɱ��ۡ�O�����¹��̳ɱ��ۣ������ѳɱ���F����ͬ�˹��ѡ�G�������˹��ѡ�H����ͬ���Ϸѡ�I�����²��Ϸ�
	if (bfjs.equals("1"))//1����ͬ���̷�
	{
		if (sdljsfs.equals("1"))//1�����������㣻2�������������ɸģ�3�����������ɸģ�4���ֹ�¼�������
		{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();
			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.dj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}
		else{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01��ˮ�粿��
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();
			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.dj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01��ˮ�粿��
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}


		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=htje;//��������ܶ�
	}
	else if (bfjs.equals("1"))//J�����¹��̷�
	{
		if (sdljsfs.equals("1"))//1�����������㣻2�������������ɸģ�3�����������ɸģ�4���ֹ�¼�������
		{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();
			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.dj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}
		else{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01��ˮ�粿��
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();
			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.dj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01��ˮ�粿��
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}


		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=cf.round(htje+zjxje,2);//��������ܶ�
	}
	else if (bfjs.equals("2"))//2����ͬ���̷ѣ�������
	{
		if (sdljsfs.equals("1"))//1�����������㣻2�������������ɸģ�3�����������ɸģ�4���ֹ�¼�������
		{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//�����շ���Ŀ��ϸ
			ls_sql="SELECT sum(sfje)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();


			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.dj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//�����շ���Ŀ��ϸ
				ls_sql="SELECT sum(sfje)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();


				zjxje=newsgcb-htje;
			}
		}
		else{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01��ˮ�粿��
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//�����շ���Ŀ��ϸ
			ls_sql="SELECT sum(sfje)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and sfxmlx not in('D','E')";//ˮ��
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();


			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.dj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01��ˮ�粿��
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//�����շ���Ŀ��ϸ
				ls_sql="SELECT sum(sfje)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and sfxmlx not in('D','E')";//ˮ��
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();


				zjxje=newsgcb-htje;
			}
		}


		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=htje;//��������ܶ�
	}
	else if (bfjs.equals("K"))//K�����¹��̷ѣ�������
	{
		if (sdljsfs.equals("1"))//1�����������㣻2�������������ɸģ�3�����������ɸģ�4���ֹ�¼�������
		{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//�����շ���Ŀ��ϸ
			ls_sql="SELECT sum(sfje)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();


			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.dj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//�����շ���Ŀ��ϸ
				ls_sql="SELECT sum(sfje)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();


				zjxje=newsgcb-htje;
			}
		}
		else{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01��ˮ�粿��
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//�����շ���Ŀ��ϸ
			ls_sql="SELECT sum(sfje)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and sfxmlx not in('D','E')";//ˮ��
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();


			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.dj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01��ˮ�粿��
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//�����շ���Ŀ��ϸ
				ls_sql="SELECT sum(sfje)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and sfxmlx not in('D','E')";//ˮ��
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();


				zjxje=newsgcb-htje;
			}
		}


		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=cf.round(htje+zjxje,2);//��������ܶ�
	}
	else if (bfjs.equals("3"))//3��ʵ�տ��ܶ�
	{
		htje=0;
		zjxje=0;

		jsjsxjje=cwsfke;//��������ܶ�
	}
	else if (bfjs.equals("4"))//4��һ�ڿ�
	{
		htje=0;
		zjxje=0;

		double fk=0;
		ls_sql="select sum(fkje) ";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='11' and fkcs=1";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fk=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		jsjsxjje=fk;//��������ܶ�
	}
	else if (bfjs.equals("5"))//5�����ڿ�
	{
		htje=0;
		zjxje=0;

		double fk=0;
		ls_sql="select sum(fkje) ";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='11' and fkcs=2";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fk=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		jsjsxjje=fk;//��������ܶ�
	}
	else if (bfjs.equals("6"))//6�����ڿ�
	{
		htje=0;
		zjxje=0;

		double fk=0;
		ls_sql="select sum(fkje) ";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='11' and fkcs=3";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fk=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		jsjsxjje=fk;//��������ܶ�
	}
	else if (bfjs.equals("7"))//7����ͬ���̻�������
	{
		if (sdljsfs.equals("1"))//1�����������㣻2�������������ɸģ�3�����������ɸģ�4���ֹ�¼�������
		{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgdbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgdbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}
		else{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgdbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01��ˮ�粿��
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgdbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01��ˮ�粿��
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}


		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=htje;//��������ܶ�
	}
	else if (bfjs.equals("L"))//L�����¹��̻�������
	{
		if (sdljsfs.equals("1"))//1�����������㣻2�������������ɸģ�3�����������ɸģ�4���ֹ�¼�������
		{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgdbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgdbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}
		else{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgdbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01��ˮ�粿��
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgdbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01��ˮ�粿��
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}


		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=cf.round(htje+zjxje,2);//��������ܶ�
	}
	else if (bfjs.equals("8"))//8����ͬ���̻������ۣ������ѻ�������
	{
		if (sdljsfs.equals("1"))//1�����������㣻2�������������ɸģ�3�����������ɸģ�4���ֹ�¼�������
		{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgdbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//�����շ���Ŀ��ϸ
			ls_sql="SELECT sum(zqsfje*gcjcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="SELECT sum(sfje*gcjcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs!='1' ";//1:��ǰ;2:�ۺ�
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgdbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//�����շ���Ŀ��ϸ
				ls_sql="SELECT sum(zqsfje*gcjcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*gcjcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs!='1' ";//1:��ǰ;2:�ۺ�
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}
		else{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgdbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01��ˮ�粿��
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//�����շ���Ŀ��ϸ
			ls_sql="SELECT sum(zqsfje*gcjcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�
			ls_sql+=" and sfxmlx not in('D','E')";//ˮ��
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="SELECT sum(sfje*gcjcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs!='1' ";//1:��ǰ;2:�ۺ�
			ls_sql+=" and sfxmlx not in('D','E')";//ˮ��
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgdbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01��ˮ�粿��
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//�����շ���Ŀ��ϸ
				ls_sql="SELECT sum(zqsfje*gcjcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�
				ls_sql+=" and sfxmlx not in('D','E')";//ˮ��
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*gcjcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs!='1' ";//1:��ǰ;2:�ۺ�
				ls_sql+=" and sfxmlx not in('D','E')";//ˮ��
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}



		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=htje;//��������ܶ�
	}
	else if (bfjs.equals("M"))//M�����¹��̻������ۣ������ѻ�������
	{
		if (sdljsfs.equals("1"))//1�����������㣻2�������������ɸģ�3�����������ɸģ�4���ֹ�¼�������
		{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgdbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//�����շ���Ŀ��ϸ
			ls_sql="SELECT sum(zqsfje*gcjcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="SELECT sum(sfje*gcjcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs!='1' ";//1:��ǰ;2:�ۺ�
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgdbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//�����շ���Ŀ��ϸ
				ls_sql="SELECT sum(zqsfje*gcjcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*gcjcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs!='1' ";//1:��ǰ;2:�ۺ�
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}
		else{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgdbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01��ˮ�粿��
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//�����շ���Ŀ��ϸ
			ls_sql="SELECT sum(zqsfje*gcjcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�
			ls_sql+=" and sfxmlx not in('D','E')";//ˮ��
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="SELECT sum(sfje*gcjcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs!='1' ";//1:��ǰ;2:�ۺ�
			ls_sql+=" and sfxmlx not in('D','E')";//ˮ��
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgdbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01��ˮ�粿��
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//�����շ���Ŀ��ϸ
				ls_sql="SELECT sum(zqsfje*gcjcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�
				ls_sql+=" and sfxmlx not in('D','E')";//ˮ��
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*gcjcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs!='1' ";//1:��ǰ;2:�ۺ�
				ls_sql+=" and sfxmlx not in('D','E')";//ˮ��
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}



		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=cf.round(htje+zjxje,2);//��������ܶ�
	}
	else if (bfjs.equals("D"))//D����ͬ����ʩ���ɱ���
	{
		if (sdljsfs.equals("1"))//1�����������㣻2�������������ɸģ�3�����������ɸģ�4���ֹ�¼�������
		{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgcbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgcbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}
		else{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgcbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01��ˮ�粿��
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgcbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01��ˮ�粿��
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}


		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=htje;//��������ܶ�
	}
	else if (bfjs.equals("9"))//9�����¹���ʩ���ɱ���
	{
		if (sdljsfs.equals("1"))//1�����������㣻2�������������ɸģ�3�����������ɸģ�4���ֹ�¼�������
		{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgcbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgcbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}
		else{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgcbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01��ˮ�粿��
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgcbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01��ˮ�粿��
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}


		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=cf.round(htje+zjxje,2);//��������ܶ�
	}
	else if (bfjs.equals("E"))//E����ͬ����ʩ���ɱ��ۣ�������ʩ���ɱ�
	{
		if (sdljsfs.equals("1"))//1�����������㣻2�������������ɸģ�3�����������ɸģ�4���ֹ�¼�������
		{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgcbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//�����շ���Ŀ��ϸ
			ls_sql="SELECT sum(zqsfje*sgcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="SELECT sum(sfje*sgcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs!='1' ";//1:��ǰ;2:�ۺ�
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgcbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//�����շ���Ŀ��ϸ
				ls_sql="SELECT sum(zqsfje*sgcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*sgcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs!='1' ";//1:��ǰ;2:�ۺ�
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}
		else{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgcbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01��ˮ�粿��
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//�����շ���Ŀ��ϸ
			ls_sql="SELECT sum(zqsfje*sgcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�
			ls_sql+=" and sfxmlx not in('D','E')";//ˮ��
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="SELECT sum(sfje*sgcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs!='1' ";//1:��ǰ;2:�ۺ�
			ls_sql+=" and sfxmlx not in('D','E')";//ˮ��
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgcbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01��ˮ�粿��
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//�����շ���Ŀ��ϸ
				ls_sql="SELECT sum(zqsfje*sgcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�
				ls_sql+=" and sfxmlx not in('D','E')";//ˮ��
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*sgcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs!='1' ";//1:��ǰ;2:�ۺ�
				ls_sql+=" and sfxmlx not in('D','E')";//ˮ��
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}


		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=htje;//��������ܶ�
	}
	else if (bfjs.equals("A"))//A�����¹���ʩ���ɱ��ۣ�������ʩ���ɱ�
	{
		if (sdljsfs.equals("1"))//1�����������㣻2�������������ɸģ�3�����������ɸģ�4���ֹ�¼�������
		{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgcbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//�����շ���Ŀ��ϸ
			ls_sql="SELECT sum(zqsfje*sgcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="SELECT sum(sfje*sgcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs!='1' ";//1:��ǰ;2:�ۺ�
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgcbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//�����շ���Ŀ��ϸ
				ls_sql="SELECT sum(zqsfje*sgcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*sgcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs!='1' ";//1:��ǰ;2:�ۺ�
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}
		else{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgcbj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01��ˮ�粿��
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//�����շ���Ŀ��ϸ
			ls_sql="SELECT sum(zqsfje*sgcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�
			ls_sql+=" and sfxmlx not in('D','E')";//ˮ��
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="SELECT sum(sfje*sgcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs!='1' ";//1:��ǰ;2:�ۺ�
			ls_sql+=" and sfxmlx not in('D','E')";//ˮ��
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgcbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01��ˮ�粿��
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//�����շ���Ŀ��ϸ
				ls_sql="SELECT sum(zqsfje*sgcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�
				ls_sql+=" and sfxmlx not in('D','E')";//ˮ��
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*sgcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs!='1' ";//1:��ǰ;2:�ۺ�
				ls_sql+=" and sfxmlx not in('D','E')";//ˮ��
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=cf.round(htje+zjxje,2);//��������ܶ�
	}
	else if (bfjs.equals("B"))//B����ͬ���̳ɱ���
	{
		if (sdljsfs.equals("1"))//1�����������㣻2�������������ɸģ�3�����������ɸģ�4���ֹ�¼�������
		{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.cbenj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.cbenj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}
		else{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.cbenj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01��ˮ�粿��
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.cbenj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01��ˮ�粿��
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}


		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=htje;//��������ܶ�
	}
	else if (bfjs.equals("N"))//N�����¹��̳ɱ���
	{
		if (sdljsfs.equals("1"))//1�����������㣻2�������������ɸģ�3�����������ɸģ�4���ֹ�¼�������
		{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.cbenj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.cbenj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}
		else{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.cbenj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01��ˮ�粿��
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.cbenj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01��ˮ�粿��
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}


		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=cf.round(htje+zjxje,2);//��������ܶ�
	}
	else if (bfjs.equals("C"))//C����ͬ���̳ɱ��ۣ������ѳɱ�
	{
		if (sdljsfs.equals("1"))//1�����������㣻2�������������ɸģ�3�����������ɸģ�4���ֹ�¼�������
		{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.cbenj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//�����շ���Ŀ��ϸ
			ls_sql="SELECT sum(zqsfje*cbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="SELECT sum(sfje*cbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs!='1' ";//1:��ǰ;2:�ۺ�
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.cbenj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//�����շ���Ŀ��ϸ
				ls_sql="SELECT sum(zqsfje*cbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*cbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs!='1' ";//1:��ǰ;2:�ۺ�
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}
		else{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.cbenj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01��ˮ�粿��
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//�����շ���Ŀ��ϸ
			ls_sql="SELECT sum(zqsfje*cbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�
			ls_sql+=" and sfxmlx not in('D','E')";//ˮ��
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="SELECT sum(sfje*cbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs!='1' ";//1:��ǰ;2:�ۺ�
			ls_sql+=" and sfxmlx not in('D','E')";//ˮ��
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.cbenj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01��ˮ�粿��
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//�����շ���Ŀ��ϸ
				ls_sql="SELECT sum(zqsfje*cbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�
				ls_sql+=" and sfxmlx not in('D','E')";//ˮ��
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*cbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs!='1' ";//1:��ǰ;2:�ۺ�
				ls_sql+=" and sfxmlx not in('D','E')";//ˮ��
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=htje;//��������ܶ�
	}
	else if (bfjs.equals("O"))//O�����¹��̳ɱ��ۣ������ѳɱ�
	{
		if (sdljsfs.equals("1"))//1�����������㣻2�������������ɸģ�3�����������ɸģ�4���ֹ�¼�������
		{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.cbenj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//�����շ���Ŀ��ϸ
			ls_sql="SELECT sum(zqsfje*cbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="SELECT sum(sfje*cbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs!='1' ";//1:��ǰ;2:�ۺ�
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.cbenj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//�����շ���Ŀ��ϸ
				ls_sql="SELECT sum(zqsfje*cbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*cbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs!='1' ";//1:��ǰ;2:�ۺ�
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}
		else{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.cbenj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01��ˮ�粿��
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//�����շ���Ŀ��ϸ
			ls_sql="SELECT sum(zqsfje*cbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�
			ls_sql+=" and sfxmlx not in('D','E')";//ˮ��
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="SELECT sum(sfje*cbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmx";
			ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs!='1' ";//1:��ǰ;2:�ۺ�
			ls_sql+=" and sfxmlx not in('D','E')";//ˮ��
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				htje+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.cbenj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01��ˮ�粿��
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//�����շ���Ŀ��ϸ
				ls_sql="SELECT sum(zqsfje*cbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�
				ls_sql+=" and sfxmlx not in('D','E')";//ˮ��
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*cbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs!='1' ";//1:��ǰ;2:�ۺ�
				ls_sql+=" and sfxmlx not in('D','E')";//ˮ��
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newsgcb+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				zjxje=newsgcb-htje;
			}
		}

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=cf.round(htje+zjxje,2);//��������ܶ�
	}
	else if (bfjs.equals("F"))//F����ͬ�˹���
	{
		if (sdljsfs.equals("1"))//1�����������㣻2�������������ɸģ�3�����������ɸģ�4���ֹ�¼�������
		{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.rgdj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();


			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.rgdj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();


				zjxje=newsgcb-htje;
			}
		}
		else{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.rgdj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01��ˮ�粿��
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();


			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.rgdj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01��ˮ�粿��
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();


				zjxje=newsgcb-htje;
			}
		}

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=htje;//��������ܶ�
	}
	else if (bfjs.equals("G"))//G�������˹���
	{
		if (sdljsfs.equals("1"))//1�����������㣻2�������������ɸģ�3�����������ɸģ�4���ֹ�¼�������
		{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.rgdj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();


			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.rgdj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();


				zjxje=newsgcb-htje;
			}
		}
		else{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.rgdj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01��ˮ�粿��
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();


			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.rgdj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01��ˮ�粿��
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();


				zjxje=newsgcb-htje;
			}
		}

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=cf.round(htje+zjxje,2);//��������ܶ�
	}
	else if (bfjs.equals("H"))//H����ͬ���Ϸ�
	{
		if (sdljsfs.equals("1"))//1�����������㣻2�������������ɸģ�3�����������ɸģ�4���ֹ�¼�������
		{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.cldj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();


			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.cldj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();


				zjxje=newsgcb-htje;
			}
		}
		else{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.cldj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01��ˮ�粿��
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();


			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.cldj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01��ˮ�粿��
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();


				zjxje=newsgcb-htje;
			}
		}

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=htje;//��������ܶ�
	}
	else if (bfjs.equals("I"))//I�����²��Ϸ�
	{
		if (sdljsfs.equals("1"))//1�����������㣻2�������������ɸģ�3�����������ɸģ�4���ֹ�¼�������
		{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.cldj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();


			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.cldj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();


				zjxje=newsgcb-htje;
			}
		}
		else{
			//��ͬ���̷�ʩ���ɱ�
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.cldj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01��ˮ�粿��
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				htje=rs.getDouble(1);
			}
			rs.close();
			ps.close();


			//������̷�ʩ���ɱ�
			if (zjxxh==null || zjxxh.equals(""))
			{
				zjxje=0;
			}
			else{
				double newsgcb=0;//����ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.cldj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01��ˮ�粿��
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					newsgcb=rs.getDouble(1);
				}
				rs.close();
				ps.close();


				zjxje=newsgcb-htje;
			}
		}

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsxjje=cf.round(htje+zjxje,2);//��������ܶ�
	}
	else
	{
		out.println("���󣡡��������������ò���ȷ��"+bfjs);
		return;
	}

	htjsjs=htje;//��ͬ�������
	zjxjsjs=zjxje;//������������
	//��ȡ����ͬ�����������������������������������������������	


	//��ȡ:ˮ��·������������������������������ʼ
	if (sdljsfs.equals("2") || sdljsfs.equals("3"))//ˮ��·���㷽ʽ  1�����������㣻2�������������ɸģ�3�����������ɸģ�4���ֹ�¼�������
	{
		if (zjxxh==null || zjxxh.equals(""))
		{
			if (sdlqz.equals("1"))//ˮ��·ȡֵ  1����ǰ��2���ۺ�3��ʩ���ɱ���
			{
				ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.zqdj)";
				ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
				ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
				ls_sql+=" and bj_bjxmmx.xmflbm='01'";//01��ˮ�粿��
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sdlje=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//ˮ��·���������̷�
				ls_sql="SELECT sum(zqsfje)";
				ls_sql+=" FROM bj_sfxmmx";
				ls_sql+=" where khbh='"+khbh+"' and sfxmlx in('D','E')";
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�D��ˮ��·��E��ˮ��·Ԥ�գ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sdlje+=rs.getDouble(1);
				}
				rs.close();
				ps.close();
			}
			else if (sdlqz.equals("2"))//ˮ��·ȡֵ  1����ǰ��2���ۺ�3��ʩ���ɱ���
			{
				ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj)";
				ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
				ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
				ls_sql+=" and bj_bjxmmx.xmflbm='01'";//01��ˮ�粿��
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sdlje=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//ˮ��·���������̷�
				ls_sql="SELECT sum(sfje)";
				ls_sql+=" FROM bj_sfxmmx";
				ls_sql+=" where khbh='"+khbh+"' and sfxmlx in('D','E')";
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�D��ˮ��·��E��ˮ��·Ԥ�գ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sdlje+=rs.getDouble(1);
				}
				rs.close();
				ps.close();
			}
			else{
				//��ͬ���̷�ʩ���ɱ�
				ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgcbj)";
				ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
				ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
				ls_sql+=" and bj_bjxmmx.xmflbm='01'";//01��ˮ�粿��
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					sdlje=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//�����շ���Ŀ��ϸ
				ls_sql="SELECT sum(zqsfje*sgcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmx";
				ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�
				ls_sql+=" and sfxmlx in('D','E')";//ˮ��
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sdlje+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*sgcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmx";
				ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs!='1' ";//1:��ǰ;2:�ۺ�
				ls_sql+=" and sfxmlx in('D','E')";//ˮ��
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sdlje+=rs.getDouble(1);
				}
				rs.close();
				ps.close();
			}
		}
		else{//��������
			if (sdlqz.equals("1"))//ˮ��·ȡֵ  1����ǰ��2���ۺ�3��ʩ���ɱ���
			{
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.zqdj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.dqbm=bj_gclmxh.dqbm and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and bj_bjxmmxh.xmflbm='01'";//01��ˮ�粿��
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sdlje=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//ˮ��·���������̷�
				ls_sql="SELECT sum(zqsfje)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfxmlx in('D','E')";
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�D��ˮ��·��E��ˮ��·Ԥ�գ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sdlje+=rs.getDouble(1);
				}
				rs.close();
				ps.close();
			}
			else if (sdlqz.equals("2"))//ˮ��·ȡֵ  1����ǰ��2���ۺ�3��ʩ���ɱ���
			{
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.dj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.dqbm=bj_gclmxh.dqbm and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and bj_bjxmmxh.xmflbm='01'";//01��ˮ�粿��
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sdlje=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//ˮ��·���������̷�
				ls_sql="SELECT sum(sfje)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfxmlx in('D','E')";
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�D��ˮ��·��E��ˮ��·Ԥ�գ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sdlje+=rs.getDouble(1);
				}
				rs.close();
				ps.close();
			}
			else{
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgcbj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and bj_bjxmmxh.xmflbm='01'";//01��ˮ�粿��
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					sdlje=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				//�����շ���Ŀ��ϸ
				ls_sql="SELECT sum(zqsfje*sgcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�
				ls_sql+=" and sfxmlx in('D','E')";//ˮ��
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sdlje+=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				ls_sql="SELECT sum(sfje*sgcbjbfb/100)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
				ls_sql+=" and cbjjsfs!='1' ";//1:��ǰ;2:�ۺ�
				ls_sql+=" and sfxmlx in('D','E')";//ˮ��
				//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sdlje+=rs.getDouble(1);
				}
				rs.close();
				ps.close();
			}
		}//�Ƿ���������

		sdlje=cf.round(sdlje,2);

		sdljsje=sdlje*sdlbfbl/100;
		sdljsje=cf.round(sdljsje,2);//ˮ��·���
	}
	//��ȡ:ˮ��·��������������������������������



	//���㣺�������������������������������������ʼ

	ljzjxje=0;//�ۼ�������
	zxje=0;//������
	jxje=0;//������

	if (!zjxxh.equals(""))//����������
	{
		String getzjxxh="";//����ǰ���һ�������Ϊ�ձ�ʾû��
		if (!gcjdbm.equals("0"))//1��δ������2�����̿�����6�����ι�����ɣ�3���������գ�4�������깤��5��������᣻7����ͬ�쳣��ֹ
		{
			ls_sql="select zjxxh";
			ls_sql+=" from  crm_zjxdj";
			ls_sql+=" where khbh='"+khbh+"'  ";
			ls_sql+=" and fssj<TO_DATE('"+sjkgrq+"','YYYY-MM-DD')";//������
			ls_sql+=" order by zjxxh desc";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				getzjxxh=cf.fillNull(rs.getString("zjxxh"));
			}
			rs.close();
			ps.close();
		}



		//�����������ˮ��·����������������������ʼ
		double gczxsgcbj=0;//��������ʩ���ɱ���
		double gczxzhje=0;//���������ۺ���


		String xmbh="";
		double sgcbdj=0;
		double dj=0;
		double sl=0;

		if (zjxsjd.equals("1") || zjxsjd.equals("3"))//������ʱ���  1:ȫ����2:����ǰ��3:������
		{
			ls_sql="select bj_bjxmmxh.xmbh,bj_bjxmmxh.sgcbj,bj_bjxmmxh.dj,sum(bj_gclmxh.sl) sl";
			ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
			ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
			ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01��ˮ�粿��
			ls_sql+=" group by bj_bjxmmxh.xmbh,bj_bjxmmxh.sgcbj,bj_bjxmmxh.dj";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				xmbh=rs.getString("xmbh");
				sgcbdj=rs.getDouble("sgcbj");
				dj=rs.getDouble("dj");
				sl=rs.getDouble("sl");

				double qsl=0;//����ǰ����

				if (zjxsjd.equals("1"))//������ʱ���  1:ȫ����2:����ǰ��3:������
				{
					//��ͬ��Ϣ
					ls_sql="select sum(sl) sl";
					ls_sql+=" from  bj_gclmx";
					ls_sql+=" where  khbh='"+khbh+"'";
					ls_sql+=" and  xmbh='"+xmbh+"'";
				}
				else//������ʱ��� 3:������
				{
					if (getzjxxh.equals(""))//����ǰ�������ȡ��ͬ
					{
						//��ͬ��Ϣ
						ls_sql="select sum(sl) sl";
						ls_sql+=" from  bj_gclmx";
						ls_sql+=" where  khbh='"+khbh+"'";
						ls_sql+=" and  xmbh='"+xmbh+"'";
					}
					else{//����ǰ��������
						ls_sql="select sum(sl) sl";
						ls_sql+=" from  bj_gclmxh";
						ls_sql+=" where  zjxxh='"+getzjxxh+"'";
						ls_sql+=" and  xmbh='"+xmbh+"'";
					}
				}

				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					qsl=rs1.getDouble("sl");
				}
				rs1.close();
				ps1.close();


				if (sl>qsl)//����
				{
					gczxsgcbj+=sgcbdj*(sl-qsl);
					gczxsgcbj=cf.round(gczxsgcbj,2);

					gczxzhje+=dj*(sl-qsl);
					gczxzhje=cf.round(gczxzhje,2);
				}
			}
			rs.close();
			ps.close();
		}
		else{//������ʱ��� 2:����ǰ 
			if (!getzjxxh.equals(""))//����ǰ��������
			{
				ls_sql="select bj_bjxmmxh.xmbh,bj_bjxmmxh.sgcbj,bj_bjxmmxh.dj,sum(bj_gclmxh.sl) sl";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+getzjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01��ˮ�粿��
				ls_sql+=" group by bj_bjxmmxh.xmbh,bj_bjxmmxh.sgcbj,bj_bjxmmxh.dj ";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				while (rs.next())
				{
					xmbh=rs.getString("xmbh");
					sgcbdj=rs.getDouble("sgcbj");
					dj=rs.getDouble("dj");
					sl=rs.getDouble("sl");

					double qsl=0;//����ǰ����

					//��ͬ��Ϣ
					ls_sql="select sum(sl) sl";
					ls_sql+=" from  bj_gclmx";
					ls_sql+=" where  khbh='"+khbh+"'";
					ls_sql+=" and  xmbh='"+xmbh+"'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						qsl=rs1.getDouble("sl");
					}
					rs1.close();
					ps1.close();


					if (sl>qsl)//����
					{
						gczxsgcbj+=sgcbdj*(sl-qsl);
						gczxsgcbj=cf.round(gczxsgcbj,2);

						gczxzhje+=dj*(sl-qsl);
						gczxzhje=cf.round(gczxzhje,2);
					}
				}
				rs.close();
				ps.close();
			}//����ǰ��������

		}
		//�����������ˮ��·������������������������


		//���̼������ˮ��·����������������������ʼ
		double gcjxsgcbj=0;//���̼���ʩ���ɱ���
		double gcjxzhje=0;//���̼����ۺ���

		xmbh="";
		sgcbdj=0;
		dj=0;
		sl=0;
		if (zjxsjd.equals("1"))//������ʱ���  1:ȫ����2:����ǰ��3:������
		{
			//������Ŀ�������ˮ��·����������������������ʼ
			ls_sql="select bj_bjxmmx.xmbh,bj_bjxmmx.sgcbj,bj_bjxmmx.dj,sum(bj_gclmx.sl) sl";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01��ˮ�粿��
			ls_sql+=" group by bj_bjxmmx.xmbh,bj_bjxmmx.sgcbj,bj_bjxmmx.dj";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				xmbh=rs.getString("xmbh");
				sgcbdj=rs.getDouble("sgcbj");
				dj=rs.getDouble("dj");
				sl=rs.getDouble("sl");

				//���������
				double hsl=0;
				ls_sql="select sum(sl) sl";
				ls_sql+=" from  bj_gclmxh";
				ls_sql+=" where  zjxxh='"+zjxxh+"'";
				ls_sql+=" and  xmbh='"+xmbh+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					hsl=rs1.getDouble("sl");
				}
				rs1.close();
				ps1.close();

				if (sl>hsl)//����
				{
					gcjxsgcbj+=dj*(sl-hsl);
					gcjxsgcbj=cf.round(gcjxsgcbj,2);

					gcjxzhje+=dj*(sl-hsl);
					gcjxzhje=cf.round(gcjxzhje,2);
				}
			}
			rs.close();
			ps.close();
		}
		else if (zjxsjd.equals("3"))//������ʱ���  1:ȫ����2:����ǰ��3:������
		{
			//������Ŀ�������ˮ��·����������������������ʼ
			if (getzjxxh.equals(""))//����ǰ�������ȡ��ͬ
			{
				ls_sql="select bj_bjxmmx.xmbh,bj_bjxmmx.sgcbj,bj_bjxmmx.dj,sum(bj_gclmx.sl) sl";
				ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
				ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
				ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01��ˮ�粿��
				ls_sql+=" group by bj_bjxmmx.xmbh,bj_bjxmmx.sgcbj,bj_bjxmmx.dj ";
			}
			else{//����ǰ��������
				ls_sql="select bj_bjxmmxh.xmbh,bj_bjxmmxh.sgcbj,bj_bjxmmxh.dj,sum(bj_gclmxh.sl) sl";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+getzjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ls_sql+=" and (bj_bjxmmxh.xmflbm!='01' OR bj_bjxmmxh.xmflbm is null)";//01��ˮ�粿��
				ls_sql+=" group by bj_bjxmmxh.xmbh,bj_bjxmmxh.sgcbj,bj_bjxmmxh.dj ";
			}
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				xmbh=rs.getString("xmbh");
				sgcbdj=rs.getDouble("sgcbj");
				dj=rs.getDouble("dj");
				sl=rs.getDouble("sl");

				//���������
				double hsl=0;
				ls_sql="select sum(sl) sl";
				ls_sql+=" from  bj_gclmxh";
				ls_sql+=" where  zjxxh='"+zjxxh+"'";
				ls_sql+=" and  xmbh='"+xmbh+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					hsl=rs1.getDouble("sl");
				}
				rs1.close();
				ps1.close();

				if (sl>hsl)//����
				{
					gcjxsgcbj+=dj*(sl-hsl);
					gcjxsgcbj=cf.round(gcjxsgcbj,2);

					gcjxzhje+=dj*(sl-hsl);
					gcjxzhje=cf.round(gcjxzhje,2);
				}
			}
			rs.close();
			ps.close();
		}
		else{//������ʱ��� 2:����ǰ 
			//������Ŀ�������ˮ��·����������������������ʼ
			if (!getzjxxh.equals(""))//����ǰ��������
			{
				ls_sql="select bj_bjxmmx.xmbh,bj_bjxmmx.sgcbj,bj_bjxmmx.dj,sum(bj_gclmx.sl) sl";
				ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
				ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
				ls_sql+=" and (bj_bjxmmx.xmflbm!='01' OR bj_bjxmmx.xmflbm is null)";//01��ˮ�粿��
				ls_sql+=" group by bj_bjxmmx.xmbh,bj_bjxmmx.sgcbj,bj_bjxmmx.dj ";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				while (rs.next())
				{
					xmbh=rs.getString("xmbh");
					sgcbdj=rs.getDouble("sgcbj");
					dj=rs.getDouble("dj");
					sl=rs.getDouble("sl");

					//���������
					double hsl=0;
					ls_sql="select sum(sl) sl";
					ls_sql+=" from  bj_gclmxh";
					ls_sql+=" where  zjxxh='"+getzjxxh+"'";
					ls_sql+=" and  xmbh='"+xmbh+"'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						hsl=rs1.getDouble("sl");
					}
					rs1.close();
					ps1.close();

					if (sl>hsl)//����
					{
						gcjxsgcbj+=dj*(sl-hsl);
						gcjxsgcbj=cf.round(gcjxsgcbj,2);

						gcjxzhje+=dj*(sl-hsl);
						gcjxzhje=cf.round(gcjxzhje,2);
					}
				}
				rs.close();
				ps.close();
			}//����ǰ��������
		}

		//���̼������ˮ��·������������������������



		//ˮ��·������������������������������������ʼ

		// ����ˮ��·
		double sdlsgcb_zx=0;//ʩ���ɱ�
		double sdlzhje_zx=0;//�ۺ���
		ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgcbj),sum(bj_gclmxh.sl*bj_bjxmmxh.dj)";
		ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
		ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
		ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
		ls_sql+=" and bj_bjxmmxh.xmflbm='01'";//01��ˮ�粿��
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sdlsgcb_zx=rs.getDouble(1);
			sdlzhje_zx=rs.getDouble(2);
		}
		rs.close();
		ps.close();

		//ˮ��·���������̷�
		ls_sql="SELECT sum(zqsfje*sgcbjbfb/100),sum(sfje)";
		ls_sql+=" FROM bj_sfxmmxh";
		ls_sql+=" where zjxxh='"+zjxxh+"'";
		ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�;3:������
		ls_sql+=" and sfxmlx in('D','E')";
		//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�D��ˮ��·��E��ˮ��·Ԥ�գ�9������
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sdlsgcb_zx+=rs.getDouble(1);
			sdlzhje_zx+=rs.getDouble(2);
		}
		rs.close();
		ps.close();

		ls_sql="SELECT sum(sfje*sgcbjbfb/100),sum(sfje)";
		ls_sql+=" FROM bj_sfxmmxh";
		ls_sql+=" where zjxxh='"+zjxxh+"'";
		ls_sql+=" and cbjjsfs='2' ";//1:��ǰ;2:�ۺ�;3:������
		ls_sql+=" and sfxmlx in('D','E')";
		//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sdlsgcb_zx+=rs.getDouble(1);
			sdlzhje_zx+=rs.getDouble(2);
		}
		rs.close();
		ps.close();

		sdlsgcb_zx=cf.round(sdlsgcb_zx,2);
		sdlzhje_zx=cf.round(sdlzhje_zx,2);



		//��ͬˮ��·
		double sdlsgcb_ht=0;//ʩ���ɱ�
		double sdlzhje_ht=0;//�ۺ���
		//��ͬ��Ϣ
		ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgcbj),sum(bj_gclmx.sl*bj_bjxmmx.dj)";
		ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
		ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
		ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ls_sql+=" and bj_bjxmmx.xmflbm='01'";//01��ˮ�粿��
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sdlsgcb_ht=rs.getDouble(1);
			sdlzhje_ht=rs.getDouble(2);
		}
		rs.close();
		ps.close();

		//�����շ���Ŀ��ϸ
		ls_sql="SELECT sum(zqsfje*sgcbjbfb/100),sum(sfje)";
		ls_sql+=" FROM bj_sfxmmx";
		ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
		ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�;3:������
		ls_sql+=" and sfxmlx in('D','E')";
		//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sdlsgcb_ht+=rs.getDouble(1);
			sdlzhje_ht+=rs.getDouble(2);
		}
		rs.close();
		ps.close();

		ls_sql="SELECT sum(sfje*sgcbjbfb/100),sum(sfje)";
		ls_sql+=" FROM bj_sfxmmx";
		ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
		ls_sql+=" and cbjjsfs='2' ";//1:��ǰ;2:�ۺ�;3:������
		ls_sql+=" and sfxmlx in('D','E')";
		//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sdlsgcb_ht+=rs.getDouble(1);
			sdlzhje_ht+=rs.getDouble(2);
		}
		rs.close();
		ps.close();

		sdlsgcb_ht=cf.round(sdlsgcb_ht,2);
		sdlzhje_ht=cf.round(sdlzhje_ht,2);

		//����ǰˮ��·
		double sdlsgcb_kgq=0;//����ǰʩ���ɱ�
		double sdlzhje_kgq=0;//����ǰ�ۺ���
		if (getzjxxh.equals(""))//����ǰ�������ȡ��ͬ
		{
			sdlsgcb_kgq=sdlsgcb_ht;
			sdlzhje_kgq=sdlzhje_ht;
		}
		else{//����ǰ��������
			ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgcbj),sum(bj_gclmxh.sl*bj_bjxmmxh.dj)";
			ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmxh.zjxxh='"+getzjxxh+"'";
			ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
			ls_sql+=" and bj_bjxmmxh.xmflbm='01'";//01��ˮ�粿��
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sdlsgcb_kgq=rs.getDouble(1);
				sdlzhje_kgq=rs.getDouble(2);
			}
			rs.close();
			ps.close();

			//ˮ��·���������̷�
			ls_sql="SELECT sum(zqsfje*sgcbjbfb/100),sum(sfje)";
			ls_sql+=" FROM bj_sfxmmxh";
			ls_sql+=" where zjxxh='"+getzjxxh+"'";
			ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�;3:������
			ls_sql+=" and sfxmlx in('D','E')";
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�D��ˮ��·��E��ˮ��·Ԥ�գ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sdlsgcb_kgq+=rs.getDouble(1);
				sdlzhje_kgq+=rs.getDouble(2);
			}
			rs.close();
			ps.close();

			ls_sql="SELECT sum(sfje*sgcbjbfb/100),sum(sfje)";
			ls_sql+=" FROM bj_sfxmmxh";
			ls_sql+=" where zjxxh='"+getzjxxh+"'";
			ls_sql+=" and cbjjsfs='2' ";//1:��ǰ;2:�ۺ�;3:������
			ls_sql+=" and sfxmlx in('D','E')";
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sdlsgcb_kgq+=rs.getDouble(1);
				sdlzhje_kgq+=rs.getDouble(2);
			}
			rs.close();
			ps.close();
		}

		sdlsgcb_kgq=cf.round(sdlsgcb_kgq,2);
		sdlzhje_kgq=cf.round(sdlzhje_kgq,2);

		double sdlsgcb=0;//ˮ��·����ʩ���ɱ�
		double sdlzhje=0;//ˮ��·�������

		if (zjxsjd.equals("1"))//������ʱ���  1:ȫ����2:����ǰ��3:������
		{
			sdlsgcb=sdlsgcb_zx-sdlsgcb_ht;
			sdlsgcb=cf.round(sdlsgcb,2);

			sdlzhje=sdlzhje_zx-sdlzhje_ht;
			sdlzhje=cf.round(sdlzhje,2);
		}
		else if (zjxsjd.equals("2"))//������ʱ���  1:ȫ����2:����ǰ��3:������
		{
			sdlsgcb=sdlsgcb_kgq-sdlsgcb_ht;
			sdlsgcb=cf.round(sdlsgcb,2);

			sdlzhje=sdlzhje_kgq-sdlzhje_ht;
			sdlzhje=cf.round(sdlzhje,2);
		}
		else//������ʱ��� 3:������
		{
			sdlsgcb=sdlsgcb_zx-sdlsgcb_kgq;
			sdlsgcb=cf.round(sdlsgcb,2);

			sdlzhje=sdlzhje_zx-sdlzhje_kgq;
			sdlzhje=cf.round(sdlzhje,2);
		}

		//ˮ��·��������������������������������������


		//������ʩ���ɱ�������ˮ��·������������������������������������ʼ

		//����
		double qtfsgcb_zx=0;
		double qtfzhje_zx=0;
		ls_sql="SELECT sum(zqsfje*sgcbjbfb/100),sum(sfje)";
		ls_sql+=" FROM bj_sfxmmxh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
		ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�;3:������
		ls_sql+=" and sfxmlx not in('D','E')";
		//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�D��ˮ��·��E��ˮ��·Ԥ�գ�9������
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			qtfsgcb_zx=rs.getDouble(1);
			qtfzhje_zx=rs.getDouble(2);
		}
		rs.close();
		ps.close();

		ls_sql="SELECT sum(sfje*sgcbjbfb/100),sum(sfje)";
		ls_sql+=" FROM bj_sfxmmxh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
		ls_sql+=" and cbjjsfs='2' ";//1:��ǰ;2:�ۺ�;3:������
		ls_sql+=" and sfxmlx not in('D','E')";
		//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			qtfsgcb_zx+=rs.getDouble(1);
			qtfzhje_zx+=rs.getDouble(2);
		}
		rs.close();
		ps.close();

		qtfsgcb_zx=cf.round(qtfsgcb_zx,2);
		qtfzhje_zx=cf.round(qtfzhje_zx,2);

		//��ͬ
		double qtfsgcb_ht=0;
		double qtfzhje_ht=0;

		//ˮ��·���������̷�
		ls_sql="SELECT sum(zqsfje*sgcbjbfb/100),sum(sfje)";
		ls_sql+=" FROM bj_sfxmmx";
		ls_sql+=" where khbh='"+khbh+"' and sfcysgdjs='Y' ";
		ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�;3:������
		ls_sql+=" and sfxmlx not in('D','E')";
		//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�D��ˮ��·��E��ˮ��·Ԥ�գ�9������
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			qtfsgcb_ht=rs.getDouble(1);
			qtfzhje_ht=rs.getDouble(2);
		}
		rs.close();
		ps.close();

		ls_sql="SELECT sum(sfje*sgcbjbfb/100),sum(sfje)";
		ls_sql+=" FROM bj_sfxmmx";
		ls_sql+=" where khbh='"+khbh+"' and sfcysgdjs='Y' ";
		ls_sql+=" and cbjjsfs='2' ";//1:��ǰ;2:�ۺ�;3:������
		ls_sql+=" and sfxmlx not in('D','E')";
		//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			qtfsgcb_ht+=rs.getDouble(1);
			qtfzhje_ht+=rs.getDouble(2);
		}
		rs.close();
		ps.close();

		qtfsgcb_ht=cf.round(qtfsgcb_ht,2);
		qtfzhje_ht=cf.round(qtfzhje_ht,2);

		//����ǰ
		double qtfsgcb_kgq=0;
		double qtfzhje_kgq=0;
		if (getzjxxh.equals(""))//����ǰ�������ȡ��ͬ
		{
			qtfsgcb_kgq=qtfsgcb_zx;
			qtfzhje_kgq=qtfzhje_zx;
		}
		else{//����ǰ��������
			//ˮ��·���������̷�
			ls_sql="SELECT sum(zqsfje*sgcbjbfb/100),sum(sfje)";
			ls_sql+=" FROM bj_sfxmmxh";
			ls_sql+=" where zjxxh='"+getzjxxh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�;3:������
			ls_sql+=" and sfxmlx not in('D','E')";
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�D��ˮ��·��E��ˮ��·Ԥ�գ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				qtfsgcb_kgq=rs.getDouble(1);
				qtfzhje_kgq=rs.getDouble(2);
			}
			rs.close();
			ps.close();

			ls_sql="SELECT sum(sfje*sgcbjbfb/100),sum(sfje)";
			ls_sql+=" FROM bj_sfxmmxh";
			ls_sql+=" where zjxxh='"+getzjxxh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='2' ";//1:��ǰ;2:�ۺ�;3:������
			ls_sql+=" and sfxmlx not in('D','E')";
			//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				qtfsgcb_kgq+=rs.getDouble(1);
				qtfzhje_kgq+=rs.getDouble(2);
			}
			rs.close();
			ps.close();
		}

		qtfsgcb_kgq=cf.round(qtfsgcb_kgq,2);
		qtfzhje_kgq=cf.round(qtfzhje_kgq,2);

		double qtfsgcb=0;//�����շ�����ʩ���ɱ�
		double qtfzhje=0;//�����շ��������

		if (zjxsjd.equals("1"))//������ʱ���  1:ȫ����2:����ǰ��3:������
		{
			qtfsgcb=qtfsgcb_zx-qtfsgcb_ht;
			qtfsgcb=cf.round(qtfsgcb,2);

			qtfzhje=qtfzhje_zx-qtfzhje_ht;
			qtfzhje=cf.round(qtfzhje,2);
		}
		else if (zjxsjd.equals("2"))//������ʱ���  1:ȫ����2:����ǰ��3:������
		{
			qtfsgcb=qtfsgcb_kgq-qtfsgcb_ht;
			qtfsgcb=cf.round(qtfsgcb,2);

			qtfzhje=qtfzhje_kgq-qtfzhje_ht;
			qtfzhje=cf.round(qtfzhje,2);
		}
		else//������ʱ��� 3:������
		{
			qtfsgcb=qtfsgcb_zx-qtfsgcb_kgq;
			qtfsgcb=cf.round(qtfsgcb,2);

			qtfzhje=qtfzhje_zx-qtfzhje_kgq;
			qtfzhje=cf.round(qtfzhje,2);
		}

		//������ʩ���ɱ�������ˮ��·��������������������������������������

		if (zjxjffs.equals("2"))//1:��������2: �ۼ��ۺ��������3:�ۼ�������ʩ���ɱ���4: �ۺ�����������5: ����ʩ���ɱ�����ʩ���ɱ���6:����ʩ���ɱ��ۺ�����7: �ۺ����������ʩ���ɱ�
		{
			if (zjxbhfw.equals("1"))//1:���̣�2:�����ѣ�3:���̣������ѣ�4:����(��ˮ��)��5:���̣�������(��ˮ��)
			{
				ljzjxje=cf.round(gczxzhje-gcjxzhje,2);
			}
			else if (zjxbhfw.equals("2"))
			{
				ljzjxje=qtfzhje;
			}
			else if (zjxbhfw.equals("3"))
			{
				ljzjxje=cf.round(gczxzhje-gcjxzhje+qtfzhje,2);
			}
			else if (zjxbhfw.equals("4"))
			{
				ljzjxje=cf.round(gczxzhje-gcjxzhje+sdlzhje,2);
			}
			else if (zjxbhfw.equals("5"))
			{
				ljzjxje=cf.round(gczxzhje-gcjxzhje+qtfzhje+sdlzhje,2);
			}

			zxje=0;
			jxje=0;
		}
		else if (zjxjffs.equals("3"))//3:�ۼ�������ʩ���ɱ���4: �ۺ�����������5: ����ʩ���ɱ�����ʩ���ɱ���6:����ʩ���ɱ��ۺ�����7: �ۺ����������ʩ���ɱ�
		{
			if (zjxbhfw.equals("1"))//1:���̣�2:�����ѣ�3:���̣������ѣ�4:����(��ˮ��)��5:���̣�������(��ˮ��)
			{
				ljzjxje=cf.round(gczxsgcbj-gcjxsgcbj,2);
			}
			else if (zjxbhfw.equals("2"))
			{
				ljzjxje=qtfsgcb;
			}
			else if (zjxbhfw.equals("3"))
			{
				ljzjxje=cf.round(gczxsgcbj-gcjxsgcbj+qtfsgcb,2);
			}
			else if (zjxbhfw.equals("4"))
			{
				ljzjxje=cf.round(gczxsgcbj-gcjxsgcbj+sdlsgcb,2);
			}
			else if (zjxbhfw.equals("5"))
			{
				ljzjxje=cf.round(gczxsgcbj-gcjxsgcbj+qtfsgcb+sdlsgcb,2);
			}

			zxje=0;
			jxje=0;
		}
		else if (zjxjffs.equals("4"))//4: �ۺ�����������5: ����ʩ���ɱ�����ʩ���ɱ���6:����ʩ���ɱ��ۺ�����7: �ۺ����������ʩ���ɱ�
		{
			ljzjxje=0;

			if (zjxbhfw.equals("1"))//1:���̣�2:�����ѣ�3:���̣������ѣ�4:����(��ˮ��)��5:���̣�������(��ˮ��)
			{
				zxje=gczxzhje;
				jxje=gcjxzhje;
			}
			else if (zjxbhfw.equals("2"))
			{
				if (qtfzhje>0)
				{
					zxje=qtfzhje;
					jxje=0;
				}
				else{
					zxje=0;
					jxje=-1*qtfzhje;
				}
			}
			else if (zjxbhfw.equals("3"))
			{
				if (qtfzhje>0)
				{
					zxje=gczxzhje+qtfzhje;
					jxje=gcjxzhje;
				}
				else{
					zxje=gczxzhje;
					jxje=gcjxzhje-qtfzhje;
				}
			}
			else if (zjxbhfw.equals("4"))
			{
				if (sdlzhje>0)
				{
					zxje=gczxzhje+sdlzhje;
					jxje=gcjxzhje;
				}
				else{
					zxje=gczxzhje;
					jxje=gcjxzhje-sdlzhje;
				}
			}
			else if (zjxbhfw.equals("5"))
			{
				if (qtfzhje>0)
				{
					if (sdlzhje>0)
					{
						zxje=gczxzhje+qtfzhje+sdlzhje;
						jxje=gcjxzhje;
					}
					else{
						zxje=gczxzhje+qtfzhje;
						jxje=gcjxzhje-sdlzhje;
					}
				}
				else{
					if (sdlzhje>0)
					{
						zxje=gczxzhje+sdlzhje;
						jxje=gcjxzhje-qtfzhje;
					}
					else{
						zxje=gczxzhje;
						jxje=gcjxzhje-qtfzhje-sdlzhje;
					}
				}
			}
		}
		else if (zjxjffs.equals("5"))//5: ����ʩ���ɱ�����ʩ���ɱ���6:����ʩ���ɱ��ۺ�����7: �ۺ����������ʩ���ɱ�
		{
			ljzjxje=0;

			if (zjxbhfw.equals("1"))//1:���̣�2:�����ѣ�3:���̣������ѣ�4:����(��ˮ��)��5:���̣�������(��ˮ��)
			{
				zxje=gczxsgcbj;
				jxje=gcjxsgcbj;
			}
			else if (zjxbhfw.equals("2"))//2:������
			{
				if (qtfsgcb>0)
				{
					zxje=qtfsgcb;
					jxje=0;
				}
				else{
					zxje=0;
					jxje=-1*qtfsgcb;
				}
			}
			else if (zjxbhfw.equals("3"))//3:���̣�������
			{
				if (qtfsgcb>0)
				{
					zxje=gczxsgcbj+qtfsgcb;
					jxje=gcjxsgcbj;
				}
				else{
					zxje=gczxsgcbj;
					jxje=gcjxsgcbj-qtfsgcb;
				}
			}
			else if (zjxbhfw.equals("4"))//4:����(��ˮ��)
			{
				if (sdlsgcb>0)
				{
					zxje=gczxsgcbj+sdlsgcb;
					jxje=gcjxsgcbj;
				}
				else{
					zxje=gczxsgcbj;
					jxje=gcjxsgcbj-sdlsgcb;
				}
			}
			else if (zjxbhfw.equals("5"))//5:���̣�������(��ˮ��)
			{
				if (qtfsgcb>0)
				{
					if (sdlsgcb>0)
					{
						zxje=gczxsgcbj+qtfsgcb+sdlsgcb;
						jxje=gcjxsgcbj;
					}
					else{
						zxje=gczxsgcbj+qtfsgcb;
						jxje=gcjxsgcbj-sdlsgcb;
					}
				}
				else{
					if (sdlsgcb>0)
					{
						zxje=gczxsgcbj+sdlsgcb;
						jxje=gcjxsgcbj-qtfsgcb;
					}
					else{
						zxje=gczxsgcbj;
						jxje=gcjxsgcbj-qtfsgcb-sdlsgcb;
					}
				}
			}
		}
		else if (zjxjffs.equals("6"))//6:����ʩ���ɱ��ۺ�����7: �ۺ����������ʩ���ɱ�
		{
			ljzjxje=0;

			if (zjxbhfw.equals("1"))//1:���̣�2:�����ѣ�3:���̣������ѣ�4:����(��ˮ��)��5:���̣�������(��ˮ��)
			{
				zxje=gczxsgcbj;
				jxje=gcjxzhje;
			}
			else if (zjxbhfw.equals("2"))//2:������
			{
				if (qtfzhje>0)
				{
					zxje=qtfsgcb;
					jxje=0;
				}
				else{
					zxje=0;
					jxje=-1*qtfzhje;
				}
			}
			else if (zjxbhfw.equals("3"))//3:���̣�������
			{
				if (qtfzhje>0)
				{
					zxje=gczxsgcbj+qtfsgcb;
					jxje=gcjxzhje;
				}
				else{
					zxje=gczxsgcbj;
					jxje=gcjxzhje-qtfzhje;
				}
			}
			else if (zjxbhfw.equals("4"))//4:����(��ˮ��)
			{
				if (sdlzhje>0)
				{
					zxje=gczxsgcbj+sdlsgcb;
					jxje=gcjxzhje;
				}
				else{
					zxje=gczxsgcbj;
					jxje=gcjxzhje-sdlzhje;
				}
			}
			else if (zjxbhfw.equals("5"))//5:���̣�������(��ˮ��)
			{
				if (qtfzhje>0)
				{
					if (sdlzhje>0)
					{
						zxje=gczxsgcbj+qtfsgcb+sdlsgcb;
						jxje=gcjxzhje;
					}
					else{
						zxje=gczxsgcbj+qtfsgcb;
						jxje=gcjxzhje-sdlzhje;
					}
				}
				else{
					if (sdlzhje>0)
					{
						zxje=gczxsgcbj+sdlsgcb;
						jxje=gcjxzhje-qtfzhje;
					}
					else{
						zxje=gczxsgcbj;
						jxje=gcjxzhje-qtfzhje-sdlzhje;
					}
				}
			}
		}
		else if (zjxjffs.equals("7"))//6:����ʩ���ɱ��ۺ�����7: �ۺ����������ʩ���ɱ�
		{
			ljzjxje=0;

			if (zjxbhfw.equals("1"))//1:���̣�2:�����ѣ�3:���̣������ѣ�4:����(��ˮ��)��5:���̣�������(��ˮ��)
			{
				zxje=gczxzhje;
				jxje=gcjxsgcbj;
			}
			else if (zjxbhfw.equals("2"))//2:������
			{
				if (qtfsgcb>0)
				{
					zxje=qtfzhje;
					jxje=0;
				}
				else{
					zxje=0;
					jxje=-1*qtfsgcb;
				}
			}
			else if (zjxbhfw.equals("3"))//3:���̣�������
			{
				if (qtfsgcb>0)
				{
					zxje=gczxzhje+qtfzhje;
					jxje=gcjxsgcbj;
				}
				else{
					zxje=gczxzhje;
					jxje=gcjxsgcbj-qtfsgcb;
				}
			}
			else if (zjxbhfw.equals("4"))//4:����(��ˮ��)
			{
				if (sdlsgcb>0)
				{
					zxje=gczxzhje+sdlzhje;
					jxje=gcjxsgcbj;
				}
				else{
					zxje=gczxzhje;
					jxje=gcjxsgcbj-sdlsgcb;
				}
			}
			else if (zjxbhfw.equals("5"))//5:���̣�������(��ˮ��)
			{
				if (qtfsgcb>0)
				{
					if (sdlsgcb>0)
					{
						zxje=gczxzhje+qtfzhje+sdlzhje;
						jxje=gcjxsgcbj;
					}
					else{
						zxje=gczxzhje+qtfzhje;
						jxje=gcjxsgcbj-sdlsgcb;
					}
				}
				else{
					if (sdlsgcb>0)
					{
						zxje=gczxzhje+sdlzhje;
						jxje=gcjxsgcbj-qtfsgcb;
					}
					else{
						zxje=gczxzhje;
						jxje=gcjxsgcbj-qtfsgcb-sdlsgcb;
					}
				}
			}//�����������Χ
		}//���������ʽ

		jxje=-1*jxje;

	}//����������


	//���㣺���������������������������������������


	//���㣺��������ܶ������������������ʼ
	jsjsze=jsjsxjje;
	if (!sdljsfs.equals("1"))//ˮ��·���㷽ʽ  1�����������㣻2�������������ɸģ�3�����������ɸģ�4���ֹ�¼�������
	{
		jsjsze=cf.round(jsjsze+sdljsje,2);

		jsjszeStr+="��ˮ��·������";
	}

	if (!zjxjffs.equals("1"))//���������ʽ  1:��������2: �ۼ��ۺ��������3:�ۼ�������ʩ���ɱ���4: �ۺ�����������5: ����ʩ���ɱ�����ʩ���ɱ���6:����ʩ���ɱ��ۺ�����7: �ۺ����������ʩ���ɱ�
	{
		//���ѡ��ͬ�ļ��㷽ʽ������Ҫ����Ϊ0 ����������ֱ�����
		jsjsze=cf.round(jsjsze+zxje*zxxs+jxje*jxxs+ljzjxxs*ljzjxje,2);

		jsjszeStr+="���������";
	}

	if (!sfkyqpc.equals("N"))//�Ƿ�����ڷ��⳥��  Y���Զ���ȡ��S���˹�¼�룻N����
	{
		jsjsze=cf.round(jsjsze-khqk-khpck-yqf,2);

		jsjszeStr+="�����ڷѣ��⳥��ͻ�Ƿ��";
	}
	//���㣺��������ܶ������������������������
	
	jsje=cf.round(jsjsze*jsbl/100,2);//������=��������ܶ��������������������������


	//���㣺Ӧ��������������������������������ʼ
	yfje=jsje;//ʵ�ʲ���
	yfjeStr="Ӧ���������ܶ�";

	if (zcsfjs.equals("2"))//�����Ƿ����  1�������㣻2�����������㣻3���˹�¼��
	{
		zcjsje=cf.round(zcje*zcjsbl/100.0,2);

		yfje=yfje+zcjsje;
		yfjeStr+="�����Ľ�����";
	}
	else if (zcsfjs.equals("3"))//�����Ƿ����  1�������㣻2�����������㣻3���˹�¼��
	{
		yfje=yfje+zcjsje;
		yfjeStr+="�����Ľ�����";
	}

	if (sfkclk.equals("Y"))//�Ƿ�۲��Ͽ�
	{
		yfje=yfje-clf;
		yfjeStr+="�����Ͽ�";
	}
	if (sfkgdyp.equals("Y"))//�Ƿ�۹�����Ʒ
	{
		yfje=yfje-gdyp;
		yfjeStr+="��������Ʒ";
	}
	if (sfkyfgf.equals("Y"))//�Ƿ���Ѹ�����
	{
		yfje=yfje-yfgf;
		yfjeStr+="���Ѹ�����";
	}

	//���ʱ���
	if (!sfkzbj.equals("N"))//�Ƿ���ʱ���  Y:���ʱ���������ɸģ�M:���ʱ�������ɸģ�N:�����ʱ���
	{
		if (kzbjjs.equals("1"))//���ʱ������  1����������ܶ2�������ܶ�
		{
			kzbj=cf.round(jsjsze*kzbjbl/100,2);//���ʱ���
		}
		else{
			kzbj=cf.round(jsje*kzbjbl/100,2);//���ʱ���
		}

		if (zbjce>0)
		{
			if (kzbj>zbjce)//�ʱ�������ٿ۳�
			{
				kzbj=zbjce;
			}

			yfje=yfje-kzbj;

			yfjeStr+="���ʱ���(���:"+zbjce+")";
		}
		else{
			kzbj=0;
			yfjeStr+="���ʱ���(�ʱ����Ѵ��)";
		}

	}


	//������
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_sgdfkjl";
	ls_sql+=" where sgd='"+sgd+"' and scbz='N' and zt='2'";//1��δ��ˣ�2����ˣ�3������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fkje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//�������
	ls_sql="select sum(jlje)";
	ls_sql+=" from  cw_sgdjljl";
	ls_sql+=" where sgd='"+sgd+"' and scbz='N' and zt='2'";//1��δ��ˣ�2����ˣ�3������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jlje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (!sfkclfk.equals("N"))//�Ƿ�۸��ķ���  Y���Զ���ȡ��S���˹�¼�룻N����
	{
		yfje=yfje-clfk;

		yfjeStr+="�����ķ���";
	}
	if (!sfkclyf.equals("N"))//�Ƿ�۲����˷�  Y���Զ���ȡ��S���˹�¼�룻N����
	{
		yfje=yfje-clyf;

		yfjeStr+="�������˷�";
	}
	if (!sfkzckk.equals("N"))//�Ƿ�����Ŀۿ�  Y���Զ���ȡ��S���˹�¼�룻N����
	{
		yfje=yfje-zckk;

		yfjeStr+="�����Ŀۿ�";
	}
	if (!sfjzcjl.equals("N"))//�Ƿ�����Ľ���  Y���Զ���ȡ��S���˹�¼�룻N����
	{
		yfje=yfje+zcjl;

		yfjeStr+="�����Ľ���";
	}
	if (!sfkfkje.equals("N"))//�Ƿ�۷�����  Y���Զ���ȡ��S���˹�¼�룻N����
	{
		yfje=yfje-fkje;

		yfjeStr+="��������";
	}
	if (!sfjjlje.equals("N"))//�Ƿ�ӽ������  Y���Զ���ȡ��S���˹�¼�룻N����
	{
		yfje=yfje+jlje;

		yfjeStr+="���������";
	}
	if (!sfjqtje.equals("N"))//�Ƿ���������  Y���Զ���ȡ��S���˹�¼�룻N����
	{
		yfje=yfje+qtje;

		yfjeStr+="���������";
	}

	yfje=cf.round(yfje,2);

	//���㣺Ӧ����������������������������������

	rgfjse=yfgf;
	flfjse=cf.round(jsje-rgfjse,2);
	
	int count=0;
	ls_sql="select NVL(max(substr(jsjlh,8,2)),0)";
	ls_sql+=" from  cw_sgdwgjsty";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	jsjlh=khbh+cf.addZero(count+1,2);
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

<form method="post" action="SaveInsertCw_sgdwgjsty.jsp" name="insertform" >
<div align="center">ʩ�����깤���㣨�����¼�ţ�<%=jsjlh%>��</div>
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
  <input type="text" name="sdljsbl" value="<%=sdlbfbl%>" size="10" maxlength="9"  <%=sdlblRead%>>%  </td>
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
  <td><input type="text" name="tzjsbl" value="0" size="10" maxlength="9" onChange="jsValue(insertform)">
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
  <td><input type="text" name="clfk" value="0" size="20" maxlength="17" onChange="jsValue(insertform)" <%=sfkclfkRead%>></td>
</tr>
<tr bgcolor="#FFFFFF" style="display:<%=sfkclyfStyle%>">
  <td align="right"><span class="STYLE2"><font color="#FF0000">*</font>�Ƿ�۲����˷�</span></td>
  <td><%
	cf.radioToken(out, "sfkclyf","Y+�Զ���ȡ&S+�˹�¼��&N+��",sfkclyf,true);
%></td>
  <td align="right"><font color="#FF0000">*</font>�����˷�</td>
  <td><input type="text" name="clyf" value="0" size="20" maxlength="17" onChange="jsValue(insertform)" <%=sfkclyfRead%> ></td>
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
  <td><input type="text" name="qtje" value="0" size="20" maxlength="17" onChange="jsValue(insertform)" <%=sfjqtjeRead%>></td>
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
    <input type="hidden" name="ssk" value="<%=cwsfke%>" >	
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
