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
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
.STYLE4 {color: #0000CC}
.STYLE5 {
	color: #990000;
	font-weight: bold;
}
.STYLE7 {color: #FF0000; font-weight: bold; }
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String jsjlh=null;

String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;

String pdr=null;
String pdsj=null;
String jlbz=null;
String sgd="";
String sgbz=null;
String zjxm=null;

String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;

String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String sjwjrq=null;
String gj=null;
String dd=null;
String khjl=null;
String gdjsjd=null;
String zjxxh="";

double clf=0;
double gdyp=0;
double jzssk=0;
double yfgf=0;


String bfcs=null;
String bfjs=null;
double bfbl=0;
String sfkclk=null;
String sfkgdyp=null;
String sfkyfgf=null;
String sfkzbj=null;

String yfjeStr="";
String htjeStr="��ͬ���";
String zjxjeStr="��������";

double jsjsze=0;
double htje=0;
double zjxje=0;
double jsbl=15;
double jsje=0;
double yfje=0;

	double qtf=0;
	String qtfsm="";
	String sdljsfs=null;
	double sdlbfbl=0;
	double sdlje=0;
	String kzbjjs=null;
	String sgdjbxg=null;
	double kzbjbl=5;
	double kzbj=0;

	double sdljsje=0;

double zqgcf=0;
double zhgcf=0;
double zqqtsf=0;
double zhqtsf=0;
double zqwjrqyexm=0;
double zhwjrqyexm=0;
double zqqtf=0;
double zhqtf=0;
double zhzjxje=0;
double zqguanlif=0;
double guanlif=0;
double zqljzjx=0;
double zhljzjx=0;
double sjf=0;
double zqsjf=0;

double fkje=0;
double jlje=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="select zjxxh,gdjsjd,khjl,gj,dd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sjwjrq,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" ,wdzgce,zqgczjf,zhgczjf,zqqtsf,zhqtsf,zqwjrqyexm,zhwjrqyexm,zhzjxje,zqguanlif,guanlif,zqljzjx,zhljzjx,zqsjf,sjf";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zqgcf=rs.getDouble("zqgczjf");
		zhgcf=rs.getDouble("zhgczjf");
		zqqtsf=rs.getDouble("zqqtsf");
		zhqtsf=rs.getDouble("zhqtsf");
		zqwjrqyexm=rs.getDouble("zqwjrqyexm");
		zhwjrqyexm=rs.getDouble("zhwjrqyexm");
		zhzjxje=rs.getDouble("zhzjxje");
		zqguanlif=rs.getDouble("zqguanlif");
		guanlif=rs.getDouble("guanlif");
		zqljzjx=rs.getDouble("zqljzjx");
		zhljzjx=rs.getDouble("zhljzjx");
		zqsjf=rs.getDouble("zqsjf");
		sjf=rs.getDouble("sjf");

		zjxxh=cf.fillNull(rs.getString("zjxxh"));
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		khjl=cf.fillNull(rs.getString("khjl"));
		gj=cf.fillNull(rs.getString("gj"));
		dd=cf.fillNull(rs.getString("dd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
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
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
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

	zqqtf=zqqtsf+zqwjrqyexm;
	zqqtf=cf.round(zqqtf,2);

	zhqtf=zhqtsf+zhwjrqyexm;
	zhqtf=cf.round(zhqtf,2);

	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sjs+="��"+rs.getString("sjs");
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje) ";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='11'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jzssk=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	
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
	ls_sql+=" from  cw_sgdzqjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yfgf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//ʩ���ӽ��������
	ls_sql="select bfcs,bfjs,bfbl,sfkclk,sfkgdyp,sfkyfgf,sfkzbj,sdljsfs,sdlbfbl,sfkzbj,kzbjjs,sgdjbxg";
	ls_sql+=" from  dm_sgdjscsb";
	ls_sql+=" where fgsbh='"+fgsbh+"' and sfwgjs='Y'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bfcs=rs.getString("bfcs");
		bfjs=rs.getString("bfjs");
		bfbl=rs.getDouble("bfbl");
		sfkclk=cf.fillNull(rs.getString("sfkclk"));//�Ƿ�۲��Ͽ�
		sfkgdyp=cf.fillNull(rs.getString("sfkgdyp"));//�Ƿ�۹�����Ʒ
		sfkyfgf=cf.fillNull(rs.getString("sfkyfgf"));//�Ƿ���Ѹ�����
		sfkzbj=cf.fillNull(rs.getString("sfkzbj"));//�Ƿ���ʱ���
		sdljsfs=cf.fillNull(rs.getString("sdljsfs"));//ˮ��·���㷽ʽ
		sdlbfbl=rs.getDouble("sdlbfbl");//ˮ��·��������
		sfkzbj=cf.fillNull(rs.getString("sfkzbj"));//�Ƿ���ʱ���
		kzbjjs=cf.fillNull(rs.getString("kzbjjs"));//���ʱ������
		sgdjbxg=cf.fillNull(rs.getString("sgdjbxg"));//�Ƿ���ʩ���Ӽ������
	}
	rs.close();
	ps.close();

	if (bfjs==null)
	{
		out.println("�����ޡ�����������á������ܽ��н���");
		return;
	}

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




	yfjeStr="ʵ�ʲ���������";
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

	ls_sql="select sfje,sfxmmc";
	ls_sql+=" from  bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		qtf+=rs.getDouble(1);
		qtfsm+=rs.getString(2)+"��";
	}
	rs.close();
	ps.close();

	qtf=cf.round(qtf,2);

	//1�����̷ѡ�2�����̷ѣ������ѡ�3��ʵ�տ��ܶ4��һ�ڿ5�����ڿ6�����ڿ7�����̻������ۡ�8�����̻������ۣ������ѻ������ۡ�9������ʩ���ɱ��ۡ�A������ʩ���ɱ��ۣ�������ʩ���ɱ���B�����̳ɱ��ۡ�C�����̳ɱ��ۣ������ѳɱ�
	if (bfjs.equals("1"))//1�����̷�
	{
		htjeStr="�����̷ѣ���ͬ���";
		zjxjeStr="�����̷ѣ���������";

		double zqgczjf=0;
		ls_sql="select zqgczjf,zjxje";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zqgczjf=rs.getDouble("zqgczjf");
			zjxje=rs.getDouble("zjxje");
		}
		rs.close();
		ps.close();

		htje=zqgczjf;

		jsjsze=cf.round(htje+zjxje,2);//��������ܶ�

	}
	else if (bfjs.equals("2"))//2�����̷ѣ�������
	{
		htjeStr="�����̷ѣ������ѣ���ͬ��";
		zjxjeStr="�����̷ѣ������ѣ�������";

		double zqgczjf=0;
		ls_sql="select zqgczjf,zjxje";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zqgczjf=rs.getDouble("zqgczjf");
			zjxje=rs.getDouble("zjxje");
		}
		rs.close();
		ps.close();

		double htqtf=0;
		ls_sql="select zqsfje";
		ls_sql+=" from  bj_sfxmmx";
		ls_sql+=" where khbh='"+khbh+"' and sfcysgdjs='Y' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			htqtf=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		double zjxhqtf=0;
		if (!zjxxh.equals(""))//��������
		{
			ls_sql="select zqsfje";
			ls_sql+=" from  bj_sfxmmxh";
			ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zjxhqtf=rs.getDouble(1);
			}
			rs.close();
			ps.close();
		}
		else{
			zjxhqtf=htqtf;
		}

		htje=zqgczjf+htqtf;
		zjxje=zjxje+(zjxhqtf-htqtf);

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsze=cf.round(htje+zjxje,2);//��������ܶ�
	}
	else if (bfjs.equals("3"))//3��ʵ�տ��ܶ�
	{
		htjeStr="�����̷ѣ���ͬ��";
		zjxjeStr="�����̷ѣ�������";

		double zqgczjf=0;
		ls_sql="select zqgczjf,zjxje";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zqgczjf=rs.getDouble("zqgczjf");
			zjxje=rs.getDouble("zjxje");
		}
		rs.close();
		ps.close();


		htje=zqgczjf;
		zjxje=zjxje;

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsze=jzssk;//��������ܶ�
	}
	else if (bfjs.equals("4"))//4��һ�ڿ�
	{
		htjeStr="�����̷ѣ���ͬ��";
		zjxjeStr="�����̷ѣ�������";

		double zqgczjf=0;
		ls_sql="select zqgczjf,zjxje";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zqgczjf=rs.getDouble("zqgczjf");
			zjxje=rs.getDouble("zjxje");
		}
		rs.close();
		ps.close();


		htje=zqgczjf;
		zjxje=zjxje;

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

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

		jsjsze=fk;//��������ܶ�
	}
	else if (bfjs.equals("5"))//5�����ڿ�
	{
		htjeStr="�����̷ѣ���ͬ��";
		zjxjeStr="�����̷ѣ�������";

		double zqgczjf=0;
		ls_sql="select zqgczjf,zjxje";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zqgczjf=rs.getDouble("zqgczjf");
			zjxje=rs.getDouble("zjxje");
		}
		rs.close();
		ps.close();


		htje=zqgczjf;
		zjxje=zjxje;

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

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

		jsjsze=fk;//��������ܶ�
	}
	else if (bfjs.equals("6"))//6�����ڿ�
	{
		htjeStr="�����̷ѣ���ͬ��";
		zjxjeStr="�����̷ѣ�������";

		double zqgczjf=0;
		ls_sql="select zqgczjf,zjxje";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zqgczjf=rs.getDouble("zqgczjf");
			zjxje=rs.getDouble("zjxje");
		}
		rs.close();
		ps.close();


		htje=zqgczjf;
		zjxje=zjxje;

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

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

		jsjsze=fk;//��������ܶ�
	}
	else if (bfjs.equals("7"))//7�����̻�������
	{
		htjeStr="�����̻������ۣ���ͬ���";
		zjxjeStr="�����̻������ۣ���������";

		double gcjcbj=0;
		double zjxgcjcbj=0;
		ls_sql="select gcjcbj,zjxgcjcbj";
		ls_sql+=" from  crm_khqye";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			gcjcbj=rs.getDouble("gcjcbj");
			zjxgcjcbj=rs.getDouble("zjxgcjcbj");
		}
		rs.close();
		ps.close();

		double htqtf=0;
		ls_sql="select zqsfje*gcjcbjbfb/100";
		ls_sql+=" from  bj_sfxmmx";
		ls_sql+=" where khbh='"+khbh+"' and sfcysgdjs='Y' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			htqtf=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		double zjxhqtf=0;
		if (!zjxxh.equals(""))//��������
		{
			ls_sql="select zqsfje*gcjcbjbfb/100";
			ls_sql+=" from  bj_sfxmmxh";
			ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zjxhqtf=rs.getDouble(1);
			}
			rs.close();
			ps.close();
		}
		else{
			zjxhqtf=htqtf;
		}

		htje=gcjcbj-htqtf;
		zjxje=zjxgcjcbj-(zjxhqtf-htqtf);

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsze=cf.round(htje+zjxje,2);//��������ܶ�
	}
	else if (bfjs.equals("8"))//8�����̻������ۣ������ѻ�������
	{
		htjeStr="�����̻������ۣ������ѻ������ۣ���ͬ���";
		zjxjeStr="�����̻������ۣ������ѻ������ۣ���������";

		double gcjcbj=0;
		double zjxgcjcbj=0;
		ls_sql="select gcjcbj,zjxgcjcbj";
		ls_sql+=" from  crm_khqye";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			gcjcbj=rs.getDouble("gcjcbj");
			zjxgcjcbj=rs.getDouble("zjxgcjcbj");
		}
		rs.close();
		ps.close();

		htje=gcjcbj;
		zjxje=zjxgcjcbj;

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsze=cf.round(htje+zjxje,2);//��������ܶ�
	}
	else if (bfjs.equals("9"))//9������ʩ���ɱ���
	{
		htjeStr="������ʩ���ɱ��ۣ���ͬ���";
		zjxjeStr="������ʩ���ɱ��ۣ���������";

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


		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsze=cf.round(htje+zjxje,2);//��������ܶ�
	}
	else if (bfjs.equals("A"))//A������ʩ���ɱ��ۣ�������ʩ���ɱ�
	{
		htjeStr="������ʩ���ɱ��ۣ�������ʩ���ɱ�����ͬ���";
		zjxjeStr="������ʩ���ɱ��ۣ�������ʩ���ɱ�����������";

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


		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsze=cf.round(htje+zjxje,2);//��������ܶ�
	}
	else if (bfjs.equals("B"))//B�����̳ɱ���
	{
		htjeStr="�����̳ɱ��ۣ���ͬ���";
		zjxjeStr="�����̳ɱ��ۣ���������";

		double cbj=0;
		double zjxcbj=0;
		ls_sql="select cbj,zjxcbj";
		ls_sql+=" from  crm_khqye";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			cbj=rs.getDouble("cbj");
			zjxcbj=rs.getDouble("zjxcbj");
		}
		rs.close();
		ps.close();

		double htqtf=0;
		ls_sql="select zqsfje*sgcbjbfb/100";
		ls_sql+=" from  bj_sfxmmx";
		ls_sql+=" where khbh='"+khbh+"' and sfcysgdjs='Y' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			htqtf=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		double zjxhqtf=0;
		if (!zjxxh.equals(""))//��������
		{
			ls_sql="select zqsfje*sgcbjbfb/100";
			ls_sql+=" from  bj_sfxmmxh";
			ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zjxhqtf=rs.getDouble(1);
			}
			rs.close();
			ps.close();
		}
		else{
			zjxhqtf=htqtf;
		}

		htje=cbj-htqtf;
		zjxje=zjxcbj-(zjxhqtf-htqtf);

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsze=cf.round(htje+zjxje,2);//��������ܶ�
	}
	else if (bfjs.equals("C"))//C�����̳ɱ��ۣ������ѳɱ�
	{
		htjeStr="�����̳ɱ��ۣ������ѳɱ�����ͬ���";
		zjxjeStr="�����̳ɱ��ۣ������ѳɱ�����������";

		double cbj=0;
		double zjxcbj=0;
		ls_sql="select cbj,zjxcbj";
		ls_sql+=" from  crm_khqye";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			cbj=rs.getDouble("cbj");
			zjxcbj=rs.getDouble("zjxcbj");
		}
		rs.close();
		ps.close();

		htje=cbj;
		zjxje=zjxcbj;

		jsjsze=cf.round(htje+zjxje,2);//��������ܶ�
	}
	else
	{
		out.println("���󣡡��������������ò���ȷ��"+bfjs);
		return;
	}



	//ˮ��·���
	if (zjxxh==null || zjxxh.equals(""))
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
	else{
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
	sdlje=cf.round(sdlje,2);

	sdljsje=sdlje*sdlbfbl/100;
	sdljsje=cf.round(sdljsje,2);//ˮ��·���

	jsjsze=cf.round(jsjsze+sdljsje,2);
	
	jsje=cf.round(jsjsze*jsbl/100,2);//������

	kzbj=cf.round(jsjsze*kzbjbl/100,2);//���ʱ���

	yfje=jsje;//ʵ�ʲ���
	if (sfkclk.equals("Y"))//�Ƿ�۲��Ͽ�
	{
		yfje=yfje-clf;
	}
	if (sfkgdyp.equals("Y"))//�Ƿ�۹�����Ʒ
	{
		yfje=yfje-gdyp;
	}
	if (sfkyfgf.equals("Y"))//�Ƿ���Ѹ�����
	{
		yfje=yfje-yfgf;
	}



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

	yfje=yfje-kzbj-fkje+jlje;
	yfje=cf.round(yfje,2);

	int count=0;
	ls_sql="select NVL(max(substr(jsjlh,8,2)),0)";
	ls_sql+=" from  cw_sgdwgjs";
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_sgdwgjs.jsp" name="insertform" >
<div align="center">��¼������</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">�����¼��</td>
	<td  width="8%">����</td>
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

	ls_sql="SELECT cw_sgdzqjs.jsjlh,gdjsjdmc,cw_sgdzqjs.jsrq,TO_CHAR(cw_sgdzqjs.htje),TO_CHAR(cw_sgdzqjs.zjxje), DECODE(cw_sgdzqjs.jsjs,'1','���̷�','2','���̷ѣ�������','3','ʵ�տ��ܶ�','4','һ�ڿ�','5','���ڿ�','6','���ڿ�','7','���̻�������','8','���̻������ۣ������ѻ�������','9','����ʩ���ɱ���','A','����ʩ���ɱ��ۣ�������ʩ���ɱ�','B','���̳ɱ���','C','���̳ɱ��ۣ������ѳɱ�'),TO_CHAR(cw_sgdzqjs.jsjsze),cw_sgdzqjs.jsbl||'%',TO_CHAR(cw_sgdzqjs.jsje),TO_CHAR(cw_sgdzqjs.clf),TO_CHAR(cw_sgdzqjs.gdyp),cw_sgdzqjs.sjbk,cw_sgdzqjs.lrr,cw_sgdzqjs.bz  ";
	ls_sql+=" FROM cw_sgdzqjs,dm_gdjsjd  ";
    ls_sql+=" where cw_sgdzqjs.lx=dm_gdjsjd.gdjsjd(+) ";
    ls_sql+=" and cw_sgdzqjs.khbh='"+khbh+"'";
    ls_sql+=" order by cw_sgdzqjs.lrsj desc";
    pageObj.sql=ls_sql;
	pageObj.initPage("Cw_sgdzqjsCxList.jsp","","","");

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>
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
    <td align="right"><span class="STYLE2">�ܼ�</span></td>
    <td><%=gj%></td>
    <td align="right"><span class="STYLE2">����</span></td>
    <td><%=dd%></td>
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
    <td><%=jyjdrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">��ͬ��������</font></td>
    <td><%=kgrq%> </td>
    <td align="right"><font color="#0000FF">��ͬ��������</font></td>
    <td><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center" bgcolor="#E8E8FF"><input name="button3" type="button" onClick="window.open('/dzbj/zxbjmx/Bj_khbjmxViewList.jsp?khbh=<%=khbh%>')" value="���ӱ���">
        <input name="button4" type="button" onClick="window.open('/khxx/Crm_gcfxysjlCxList.jsp?khbh=<%=khbh%>')"  value="���ռ�¼">
        <input name="button5" type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="������Ϣ">
        <input name="button6" type="button" onClick="window.open('/khxx/Jxc_clpsdCxList.jsp?khbh=<%=khbh%>')"  value="���ϵ�"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1"><font color="#FF0000">*</font></span><span class="STYLE2"><font color="#0000CC">�����¼��</font></span></td>
    <td><input type="text" name="jsjlh" value="<%=jsjlh%>" size="20" maxlength="9" readonly>    </td>
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">�ͻ����</font></span></td>
    <td><input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">ʩ����</font></span></td>
    <td><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%>
      </select>    </td>
    <td align="right"><span class="STYLE2"><font color="#0000CC">�ֳ�������</font></span></td>
    <td><input type="text" name="sgbz" value="<%=sgbz%>" size="20" maxlength="20" readonly>    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE4">�������</span></td> 
  <td width="32%"> 
    <select name="jsjs" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
	cf.selectToken(out,"1+���̷�&2+���̷ѣ�������&3+ʵ�տ��ܶ�&4+һ�ڿ�&5+���ڿ�&6+���ڿ�&7+���̻�������&8+���̻������ۣ������ѻ�������&9+����ʩ���ɱ���&A+����ʩ���ɱ��ۣ�������ʩ���ɱ�&B+���̳ɱ���&C+���̳ɱ��ۣ������ѳɱ�",bfjs,false);
%>
    </select>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">��ͬ���̶�</span></td>
  <td><input type="text" name="htje" value="<%=zhgcf%>" size="20" maxlength="17" readonly></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">�ۼ�������</span></td>
  <td><input type="text" name="zjxje" value="<%=zhljzjx%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">��ͬ������</span></td>
  <td><input type="text" name="qtf" value="<%=qtf%>" size="20" maxlength="17" readonly></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">ʵ�տ�</span></td>
  <td><input type="text" name="ssk" size="20" maxlength="17" value=<%=jzssk%> readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">������˵��</span></td>
  <td colspan="3"><input type="text" name="qtfsm" value="<%=qtfsm%>" size="72" maxlength="100" readonly>  </td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right">���±����ܶ�</td>
  <td><%=cf.round(zhgcf+qtf+zhljzjx,2)%></td>
  <td align="right">Ӧ�ս��</td>
  <td><%=cf.round(zhgcf+qtf+zhljzjx-jzssk,2)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">��������ܶ�</span></td>
  <td colspan="3"><input type="text" name="jsjsze" value="<%=jsjsze%>" size="20" maxlength="17" readonly></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><input type="button" onClick="window.open('/khxx/ViewZxsgcbj.jsp?khbh=<%=khbh%>')"  value="�鿴����ʩ���ɱ���">
  </td>
  <td colspan="3"><span class="STYLE1"><strong>ע�⣺�������ȷ������ݹ�ʽ���
    </strong></span>
    <p><span class="STYLE7">��������ܶ�=����ͬʩ���ɱ���������ʩ���ɱ���������ˮ��·����ˮ��·����ˮ��·�������</span></p>
    <p><span class="STYLE7">��ͬʩ���ɱ�</span><span class="STYLE1"><strong>��<%=htje%>��������ʩ���ɱ���<%=zjxje%>��ˮ��·��<%=sdlje%>��ˮ��·���������<%=sdlbfbl%>��</strong></span></p></td>
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
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE4">ˮ��·���㷽ʽ</span></td> 
  <td width="32%">
    <%
	cf.radioToken(out, "sdljsfs","1+ͳһ��������&2+������������&3+������",sdljsfs,true);
%></td>
  <td align="right" width="18%"><span class="STYLE4"><font color="#FF0000">*</font>ˮ��·���</span></td> 
  <td width="32%"> 
    <input type="text" name="sdlje" value="<%=sdlje%>" size="20" maxlength="17" readonly>
    <input name="button" type="button" onClick="window.open('/khxx/ViewZxSdl.jsp?khbh=<%=khbh%>')"  value="�鿴ˮ��·"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE4"><font color="#FF0000">*</font>ˮ��·�������</span></td> 
  <td width="32%"> 
    <input type="text" name="sdljsbl" value="<%=sdlbfbl%>" size="10" maxlength="9" readonly>
    % </td>
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE4">ˮ��·������</span></td> 
  <td width="32%"><input type="text" name="sdljsje" value="<%=sdljsje%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">�����ܶ�</span></td>
  <td colspan="3"><input type="text" name="jsje" value="<%=jsje%>" size="20" maxlength="17" readonly>
    <span class="STYLE5"><span class="STYLE2">�����ܶ�</span>��<span class="STYLE4">��������ܶ�</span>����<span class="STYLE4">�������</span>��<span class="STYLE4">�����������</span>��</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2"><font color="#FF0000">*</font>�Ƿ�۲��Ͽ�</span></td>
  <td><%
	cf.radioToken(out, "sfkclk","Y+��&N+��",sfkclk,true);
%></td>
  <td align="right"><font color="#FF0000">*</font>���Ϸ���</td>
  <td><input type="text" name="clfk" value="0" size="20" maxlength="17" onChange="jsValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE2">���Ϸ�</span></td> 
  <td width="32%"><input type="text" name="clf" value="<%=clf%>" size="20" maxlength="17" readonly></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>�����˷�</td> 
  <td width="32%"> 
    <input type="text" name="clyf" value="0" size="20" maxlength="17" onChange="jsValue(insertform)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">�Ƿ�۹�����Ʒ</span></td>
  <td><%
	cf.radioToken(out, "sfkgdyp","Y+��&N+��",sfkgdyp,true);
%></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">������Ʒ</span></td>
  <td><input type="text" name="gdyp" value="<%=gdyp%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE2">�Ƿ���Ѹ�����</span></td> 
  <td width="32%"><%
	cf.radioToken(out, "sfkyfgf","Y+��&N+��",sfkyfgf,true);
%></td>
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE2">�Ѹ����̿�</span></td> 
  <td width="32%"><input name="yfgck" type="text" id="yfgck" value="<%=yfgf%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">�Ƿ���ʱ���</span></td>
  <td><%
	cf.radioToken(out, "sfkzbj","Y+��&N+��",sfkzbj,true);
%></td>
  <td align="right">���ʱ������</td>
  <td>
    <%
	cf.radioToken(out, "kzbjjs","1+�������&2+�����ܶ�",kzbjjs,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>Ӧ���ʱ������</td> 
  <td width="32%"> 
    <input type="text" name="kzbjbl" value="<%=kzbjbl%>" size="10" maxlength="9" onChange="jsValue(insertform)">
    % </td>
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE2">���ʱ���</span></td> 
  <td width="32%"><input type="text" name="kzbj" value="<%=kzbj%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>������</td>
  <td><input type="text" name="fkje" value="<%=fkje%>" size="20" maxlength="17" onChange="jsValue(insertform)">  </td>
  <td align="right"><font color="#FF0000">*</font>�������</td>
  <td><input type="text" name="jlje" value="<%=jlje%>" size="20" maxlength="17" onChange="jsValue(insertform)">  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�������</td>
  <td><input type="text" name="qtje" value="0" size="20" maxlength="17" onChange="jsValue(insertform)">  </td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">Ӧ�����</span></td>
  <td><input type="text" name="yfje" value="<%=yfje%>" size="20" maxlength="17" readonly>
    <span class="STYLE5">��ˮ�粿��</span></td>
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
	<input type="reset"  value="����" name="reset">      </td>
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
	var jsje=FormName.jsjsze.value/100*(FormName.jsbl.value*1.0+FormName.tzjsbl.value*1.0);//������
	jsje=round(jsje,2);
	FormName.jsje.value=jsje;

	
	var kzbj=FormName.jsjsze.value/100*FormName.kzbjbl.value;
	kzbj=round(kzbj,2);
	FormName.kzbj.value=kzbj;

	var yfje=FormName.jsje.value*1;//ʵ�ʲ���
	if ("<%=sfkclk%>"=="Y")//�Ƿ�۲��Ͽ�
	{
		yfje=yfje-FormName.clf.value*1;
	}
	if ("<%=sfkgdyp%>"=="Y")//�Ƿ�۹�����Ʒ
	{
		yfje=yfje-FormName.gdyp.value*1;
	}
	if ("<%=sfkyfgf%>"=="Y")//�Ƿ���Ѹ�����
	{
		yfje=yfje-FormName.yfgck.value*1;
	}

	yfje=yfje-FormName.kzbj.value*1-FormName.clfk.value*1-FormName.clyf.value*1-FormName.fkje.value*1+FormName.jlje.value*1+FormName.qtje.value*1;
	yfje=round(yfje,2);
	FormName.yfje.value=yfje;

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
		alert("��ѡ��[ʩ����]��");
		FormName.sgd.focus();
		return false;
	}


	if(!(isFloat(FormName.jsbl, "�������"))) {
		return false;
	}
	if(!(isFloat(FormName.tzjsbl, "�����������"))) {
		return false;
	}
	if(!(isFloat(FormName.sdlje, "ˮ��·���"))) {
		return false;
	}
	if(!(isFloat(FormName.sdljsbl, "ˮ��·�������"))) {
		return false;
	}
	if(!(isFloat(FormName.jsje, "�����ܶ�"))) {
		return false;
	}
	if(!(isFloat(FormName.clf, "���Ϸ�"))) {
		return false;
	}
	if(!(isFloat(FormName.clyf, "�����˷�"))) {
		return false;
	}
	if(!(isFloat(FormName.gdyp, "������Ʒ"))) {
		return false;
	}

	if(!(isFloat(FormName.yfgck, "�Ѹ����̿�"))) {
		return false;
	}
	if(!(isFloat(FormName.kzbjbl, "Ӧ���ʱ������"))) {
		return false;
	}
	if(!(isFloat(FormName.clfk, "���Ϸ���"))) {
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
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	if(!(isFloat(FormName.kzbj, "���ʱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.htje)=="") {
		alert("������[���̺�ͬ��]��");
		FormName.htje.focus();
		return false;
	}
	if(!(isFloat(FormName.htje, "���̺�ͬ��"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxje)=="") {
		alert("������[����������]��");
		FormName.zjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxje, "����������"))) {
		return false;
	}
	if(	javaTrim(FormName.qtf)=="") {
		alert("������[������]��");
		FormName.qtf.focus();
		return false;
	}
	if(!(isFloat(FormName.qtf, "������"))) {
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
	if(	javaTrim(FormName.jsjsze)=="") {
		alert("������[��������ܶ�]��");
		FormName.jsjsze.focus();
		return false;
	}
	if(!(isFloat(FormName.jsjsze, "��������ܶ�"))) {
		return false;
	}

/*
	if(	!radioChecked(FormName.sdljsfs)) {
		alert("��ѡ��[ˮ��·���㷽ʽ]��");
		FormName.sdljsfs[0].focus();
		return false;
	}
*/
	if(	javaTrim(FormName.sfkclk)=="") {
		alert("������[�Ƿ�۲��Ͽ�]��");
		FormName.sfkclk.focus();
		return false;
	}
	if(	javaTrim(FormName.sfkgdyp)=="") {
		alert("������[�Ƿ�۹�����Ʒ]��");
		FormName.sfkgdyp.focus();
		return false;
	}
	if(	javaTrim(FormName.sfkyfgf)=="") {
		alert("������[�Ƿ���Ѹ�����]��");
		FormName.sfkyfgf.focus();
		return false;
	}
	if(	javaTrim(FormName.sfkzbj)=="") {
		alert("������[�Ƿ���ʱ���]��");
		FormName.sfkzbj.focus();
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
	if(	javaTrim(FormName.jlje)=="") {
		alert("������[�������]��");
		FormName.jlje.focus();
		return false;
	}
	if(!(isFloat(FormName.jlje, "�������"))) {
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
