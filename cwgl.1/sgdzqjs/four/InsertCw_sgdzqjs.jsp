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
.STYLE3 {
	color: #CC0033;
	font-weight: bold;
}
.STYLE5 {color: #CC0033; font-weight: bold; }
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
String sgd=null;
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


String bfjs=null;
double bfbl=0;
String sfkclk=null;
String sfkgdyp=null;
String sfkyfgf=null;

String sjbkStr="";
String htjeStr="��ͬ���";
String zjxjeStr="��������";

double jsjsze=0;
double htje=0;
double zjxje=0;
double jsbl=15;
double jsje=0;
double sjbk=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select zjxxh,gdjsjd,khjl,gj,dd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sjwjrq,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
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

	if (!gdjsjd.equals("J"))//A:���Ե����β�����
	{
		out.println("<BR>���������󣬽�����Ȳ���ȷ");
		return;
	}

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
	ls_sql="select bfjs,bfbl,sfkclk,sfkgdyp,sfkyfgf";
	ls_sql+=" from  dm_sgdjscsb";
	ls_sql+=" where fgsbh='"+fgsbh+"' and bfcs=4 and sfwgjs='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bfjs=rs.getString("bfjs");
		bfbl=rs.getDouble("bfbl");
		sfkclk=cf.fillNull(rs.getString("sfkclk"));//�Ƿ�۲��Ͽ�
		sfkgdyp=cf.fillNull(rs.getString("sfkgdyp"));//�Ƿ�۹�����Ʒ
		sfkyfgf=cf.fillNull(rs.getString("sfkyfgf"));//�Ƿ���Ѹ�����
	}

	rs.close();
	ps.close();

	if (bfjs==null)
	{
		out.println("�����ޡ�����������á������ܽ��в���");
		return;
	}

	jsbl=bfbl;

	sjbkStr="ʵ�ʲ���������";
	if (sfkclk.equals("Y"))//�Ƿ�۲��Ͽ�
	{
		sjbkStr+="�����Ͽ�";
	}
	if (sfkgdyp.equals("Y"))//�Ƿ�۹�����Ʒ
	{
		sjbkStr+="��������Ʒ";
	}
	if (sfkyfgf.equals("Y"))//�Ƿ���Ѹ�����
	{
		sjbkStr+="���Ѹ�����";
	}

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


	jsje=cf.round(jsjsze*jsbl/100,2);//������
	sjbk=jsje;//ʵ�ʲ���
	if (sfkclk.equals("Y"))//�Ƿ�۲��Ͽ�
	{
		sjbk=sjbk-clf;
	}
	if (sfkgdyp.equals("Y"))//�Ƿ�۹�����Ʒ
	{
		sjbk=sjbk-gdyp;
	}
	if (sfkyfgf.equals("Y"))//�Ƿ���Ѹ�����
	{
		sjbk=sjbk-yfgf;
	}

	sjbk=cf.round(sjbk,2);

	int count=0;
	ls_sql="select NVL(max(substr(jsjlh,8,2)),0)";
	ls_sql+=" from  cw_sgdzqjs";
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
<form method="post" action="SaveInsertCw_sgdzqjs.jsp" name="insertform" >
<div align="center">ʩ���Ӳ�����</div>

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

	ls_sql="SELECT cw_sgdzqjs.jsjlh,gdjsjdmc,cw_sgdzqjs.jsrq,TO_CHAR(cw_sgdzqjs.htje),TO_CHAR(cw_sgdzqjs.zjxje), DECODE(cw_sgdzqjs.jsjs,'1','���̷�','2','���̷ѣ�������','3','ʵ�տ��ܶ�','4','һ�ڿ�','5','���ڿ�','6','���ڿ�','7','���̻�������','8','���̻������ۣ������ѻ�������','9','����ʩ���ɱ���','A','����ʩ���ɱ��ۣ�������ʩ���ɱ�','B','���̳ɱ���','C','���̳ɱ��ۣ������ѳɱ�'),TO_CHAR(cw_sgdzqjs.jsjsze),cw_sgdzqjs.jsbl||'%',cw_sgdzqjs.jsje,TO_CHAR(cw_sgdzqjs.clf),TO_CHAR(cw_sgdzqjs.gdyp),cw_sgdzqjs.sjbk,cw_sgdzqjs.lrr,cw_sgdzqjs.bz  ";
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
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2">����</span></td>
    <td><select name="lx" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
	cf.selectItem(out,"select gdjsjd,gdjsjdmc from dm_gdjsjd where gdjsjd='K'","");
%>
    </select></td>
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2">��������</span></td>
    <td>
	<select name="jsjs" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectToken(out,"1+���̷�&2+���̷ѣ�������&3+ʵ�տ��ܶ�&4+һ�ڿ�&5+���ڿ�&6+���ڿ�&7+���̻�������&8+���̻������ۣ������ѻ�������&9+����ʩ���ɱ���&A+����ʩ���ɱ��ۣ�������ʩ���ɱ�&B+���̳ɱ���&C+���̳ɱ��ۣ������ѳɱ�",bfjs,false);
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span><span class="STYLE2">�Ƿ�۲��Ͽ�</span></td>
    <td><%
	cf.radioToken(out, "sfkclk","Y+��&N+��",sfkclk,true);
%>    </td>
    <td align="right"><span class="STYLE1">*</span><span class="STYLE2">�Ƿ�۹�����Ʒ</span></td>
    <td><%
	cf.radioToken(out, "sfkgdyp","Y+��&N+��",sfkgdyp,true);
%>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span><span class="STYLE2">�Ƿ���Ѹ�����</span></td>
    <td><%
	cf.radioToken(out, "sfkyfgf","Y+��&N+��",sfkyfgf,true);
%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE2"><%=htjeStr%></span></td> 
  <td width="32%"><input type="text" name="htje" value="<%=htje%>" size="20" maxlength="17" readonly></td>
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE2"><%=zjxjeStr%></span></td> 
  <td width="32%"><input type="text" name="zjxje" value="<%=zjxje%>" size="20" maxlength="17" readonly></td>
</tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2">��װʵ�տ�</span></td>
    <td><input type="text" name="jzssk" value="<%=jzssk%>" size="20" maxlength="17" readonly></td>
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2">�Ѹ�����</span></td>
    <td><input type="text" name="yfgf" value="<%=yfgf%>" size="20" maxlength="17" readonly></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2">���Ϸ�</span></td>
    <td><input type="text" name="clf" value="<%=clf%>" size="20" maxlength="17" readonly></td>
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2">������Ʒ</span></td>
    <td><input type="text" name="gdyp" value="<%=gdyp%>" size="20" maxlength="17" readonly></td>
  </tr>
  
  <tr bgcolor="#FFFFCC">
    <td colspan="4" align="right">&nbsp;</td>
    </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE2">���������ܶ�</span></td> 
  <td width="32%"><input type="text" name="jsjsze" value="<%=jsjsze%>" size="20" maxlength="17" readonly></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>��������</td> 
  <td width="32%"><input type="text" name="jsbl" value="<%=jsbl%>" size="10" maxlength="9" onchange="f_jsje(insertform)">
%</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">�������</span></td>
  <td colspan="3"><input type="text" name="jsje" value="<%=jsje%>" size="20" maxlength="17" readonly>
    <span class="STYLE5">�������=���������ܶ����������</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE2">ʵ�ʲ���</span></td> 
  <td colspan="3"><input type="text" name="sjbk" value="<%=sjbk%>" size="20" maxlength="17" readonly>
    <span class="STYLE3"><%=sjbkStr%></span></td>
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
  <td align="right"><span class="STYLE1">*</span>��������</td>
  <td><input type="text" name="jsrq" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"></textarea>    </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset"></td>
    </tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_jsje(FormName)//����FormName:Form������
{
	var jsje=FormName.jsjsze.value*1.0*FormName.jsbl.value/100.0;
	jsje=round(jsje,2);
	FormName.jsje.value=jsje;

	var sjbk=FormName.jsje.value*1.0;

	if ("<%=sfkclk%>"=="Y")//�Ƿ�۲��Ͽ�
	{
		sjbk=sjbk-FormName.clf.value*1.0;
	}
	if ("<%=sfkgdyp%>"=="Y")//�Ƿ�۹�����Ʒ
	{
		sjbk=sjbk-FormName.gdyp.value*1.0;
	}
	if ("<%=sfkyfgf%>"=="Y")//�Ƿ���Ѹ�����
	{
		sjbk=sjbk-FormName.yfgf.value*1.0;
	}
	sjbk=round(sjbk,2);

	FormName.sjbk.value=sjbk;
}

function f_do(FormName)//����FormName:Form������
{
	f_jsje(FormName);

	if(	javaTrim(FormName.jsjlh)=="") {
		alert("������[������¼��]��");
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
	if(	javaTrim(FormName.jsrq)=="") {
		alert("������[��������]��");
		FormName.jsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jsrq, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.htje)=="") {
		alert("������[��ͬ���]��");
		FormName.htje.focus();
		return false;
	}
	if(!(isFloat(FormName.htje, "��ͬ���"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxje)=="") {
		alert("������[��������]��");
		FormName.zjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxje, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.jzssk)=="") {
		alert("������[��װʵ�տ�]��");
		FormName.jzssk.focus();
		return false;
	}
	if(!(isFloat(FormName.jzssk, "��װʵ�տ�"))) {
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
	if(	javaTrim(FormName.gdyp)=="") {
		alert("������[������Ʒ]��");
		FormName.gdyp.focus();
		return false;
	}
	if(!(isFloat(FormName.gdyp, "������Ʒ"))) {
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


	if(	javaTrim(FormName.jsjsze)=="") {
		alert("������[��������ܶ�]��");
		FormName.jsjsze.focus();
		return false;
	}
	if(!(isFloat(FormName.jsjsze, "��������ܶ�"))) {
		return false;
	}
	if(	javaTrim(FormName.jsbl)=="") {
		alert("������[��������]��");
		FormName.jsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.jsbl, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.jsje)=="") {
		alert("������[�������]��");
		FormName.jsje.focus();
		return false;
	}
	if(!(isFloat(FormName.jsje, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.sjbk)=="") {
		alert("������[ʵ�ʲ���]��");
		FormName.sjbk.focus();
		return false;
	}
	if(!(isFloat(FormName.sjbk, "ʵ�ʲ���"))) {
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

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
