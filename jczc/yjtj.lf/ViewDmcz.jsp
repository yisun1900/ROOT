<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String wheresql="";

	String dwbh=request.getParameter("dwbh");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	
	String lx=request.getParameter("lx");
	String getjzbz=request.getParameter("jzbz");
	if (!getjzbz.equals("0"))
	{
		wheresql+=" and  cw_qmjzmx.jzbz='"+getjzbz+"'";
	}

	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+dwbh+"'");

	wheresql+=" and jzrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and jzrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">����ǩԼ��ϸ��<%=dwmc%>��
  <BR>(ʱ�䷶Χ��<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="360%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">���ʦ</td>
	<td  width="2%">��ͬ��</td>
	<td  width="2%">����</td>
	<td  width="5%">���ݵ�ַ</td>
	<td  width="2%">��װ��־</td>
	<td  width="4%">��˾�����</td>
	<td  width="4%">С�������</td>
	<td  width="4%">չ������</td>

	<td  width="3%">ǩԼ���ǰ</td>
	<td  width="2%">�ۿ���</td>
	<td  width="3%">ǩԼ��ۺ�</td>
	<td  width="3%">��Ŀ�����</td>
	<td  width="2%">˰��</td>
	<td  width="2%">˰��</td>

	<td  width="3%">������</td>
	<td  width="2%">����������</td>
	<td  width="2%">������˰�� </td>
	<td  width="2%">����ΥԼ�� </td>

	<td  width="3%">����ǩԼҵ��</td>
	<td  width="3%">��װ���ʦǩԼҵ��</td>
	<td  width="3%">��װ����ǩԼҵ��</td>
	<td  width="3%">�г�������ǩԼҵ��</td>

	<td  width="3%">�����깤ҵ��</td>
	<td  width="3%">��ͬ�깤��</td>
	<td  width="3%">��װ�깤��</td>

	<td  width="3%">��Ʒ�</td>
	<td  width="3%">ʵ�տ�</td>
	<td  width="2%">�Ƿ����г���ȯ</td>
	<td  width="2%">�г���ȯ�ܽ��</td>
	<td  width="2%">��˾�е��г���ȯ��</td>

	<td  width="2%">�Ƿ���֤</td>
	<td  width="2%">��֤�г�</td>
	<td  width="2%">ǩԼ����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="2%">ǩԼ����</td>
	<td  width="1%">����¼��</td>
	<td  width="2%">ʩ����</td>
	<td  width="2%">�ʼ�Ա</td>
</tr>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	
	String khbh=null;
	String sjs=null;
	String hth=null;
	String khxm=null;
	String fwdz=null;
	String sgdmc=null;
	String zjxm=null;
	String jzbz=null;
	String fgsbh=null;
	String cxhdmc=null;
	String cxhdbmxq=null;
	String cxhdbmzh=null;

	double wdzgce=0;
	double zkl=0;
	double qye=0;
	double suijinbfb=0;
	double suijin=0;
	double guanlif=0;
	double zjxje=0;
	double zjxguanlif=0;
	double zjxsuijin=0;
	double kglf=0;
	double sjf=0;
	double sfke=0;
	double ze=0;

	String sffj=null;
	double fjje=0;
	double gsfje=0;
	String sfyrz=null;
	String rzsc=null;
	String qydm=null;
	String lrsj=null;
	String qyrq=null;
	String dylr=null;

	double dmjlyj=0;
	double sjsyj=0;
	double ywyyj=0;
	double scbjlyj=0;



	double allwdzgce=0;
	double allqye=0;
	double allsuijin=0;
	double allguanlif=0;
	double allzjxje=0;
	double allzjxguanlif=0;
	double allzjxsuijin=0;
	double allkglf=0;
	double allsjf=0;
	double allsfke=0;
	double allfjje=0;
	double allgsfje=0;
	double alldmjlyj=0;
	double allsjsyj=0;
	double allywyyj=0;
	double allscbjlyj=0;

	int row=0;
	if(lx.equals("1"))//����
	{
		ls_sql="SELECT cw_qmjzmx.khbh,cw_qmjzmx.fgsbh,cw_qmjzmx.cxhdbm,cw_qmjzmx.cxhdbmxq,cw_qmjzmx.cxhdbmzh,cw_qmjzmx.sjs,cw_qmjzmx.hth,cw_qmjzmx.khxm,crm_khxx.fwdz,sgdmc,cw_qmjzmx.zjxm,DECODE(cw_qmjzmx.jzbz,'1','��װ','2','��װ') jzbz";
		ls_sql+=" ,cw_qmjzmx.wdzgce,cw_qmjzmx.zkl,cw_qmjzmx.qye,cw_qmjzmx.guanlif,cw_qmjzmx.suijinbfb,cw_qmjzmx.suijin ";
		ls_sql+=" ,cw_qmjzmx.zhzjxje,cw_qmjzmx.zjxguanlif,cw_qmjzmx.zjxsuijin,cw_qmjzmx.kglf ";
		ls_sql+=" ,cw_qmjzmx.sjf,cw_qmjzmx.sfke,DECODE(crm_khxx.sffj,'Y','����','N','��') sffj,cw_qmjzmx.fjje,cw_qmjzmx.gsfje";
		ls_sql+=" ,DECODE(crm_khxx.sfyrz,'Y','��֤','N','��') sfyrz,b.dwmc rzsc,a.dwmc qydm,crm_khxx.lrsj";
		ls_sql+=" ,cw_qmjzmx.qyrq,DECODE(TO_CHAR(crm_khxx.lrsj,'MM')-TO_CHAR(cw_qmjzmx.qyrq,'MM'),0,'��','<font color=\"#FF0000\">����</font>') dylr";
		ls_sql+=" FROM cw_qmjzmx,crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd";
		ls_sql+=" where cw_qmjzmx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and cw_qmjzmx.sgd=sq_sgd.sgd(+)";
		ls_sql+=" and cw_qmjzmx.dwbh='"+dwbh+"'";
		ls_sql+=" and cw_qmjzmx.khbh=crm_khxx.khbh";
		ls_sql+=" and cw_qmjzmx.zt!='3' ";
		ls_sql+=wheresql;

		ls_sql+=" UNION ALL ";

		ls_sql+=" SELECT cw_qmjzmx.khbh,cw_qmjzmx.fgsbh,cw_qmjzmx.cxhdbm,cw_qmjzmx.cxhdbmxq,cw_qmjzmx.cxhdbmzh,cw_qmjzmx.sjs,cw_qmjzmx.hth,cw_qmjzmx.khxm,crm_khxx.fwdz,sgdmc,cw_qmjzmx.zjxm,DECODE(cw_qmjzmx.jzbz,'1','��װ','2','��װ') jzbz";
		ls_sql+=" ,-1*cw_qmjzmx.wdzgce,cw_qmjzmx.zkl,-1*cw_qmjzmx.qye,-1*cw_qmjzmx.guanlif,cw_qmjzmx.suijinbfb,-1*cw_qmjzmx.suijin ";
		ls_sql+=" ,-1*cw_qmjzmx.zhzjxje,-1*cw_qmjzmx.zjxguanlif,-1*cw_qmjzmx.zjxsuijin,-1*cw_qmjzmx.kglf ";
		ls_sql+=" ,-1*cw_qmjzmx.sjf,-1*cw_qmjzmx.sfke,DECODE(crm_khxx.sffj,'Y','����','N','��') sffj,-1*cw_qmjzmx.fjje,-1*cw_qmjzmx.gsfje";
		ls_sql+=" ,DECODE(crm_khxx.sfyrz,'Y','��֤','N','��') sfyrz,b.dwmc rzsc,a.dwmc qydm,crm_khxx.lrsj";
		ls_sql+=" ,cw_qmjzmx.qyrq,DECODE(TO_CHAR(crm_khxx.lrsj,'MM')-TO_CHAR(cw_qmjzmx.qyrq,'MM'),0,'��','<font color=\"#FF0000\">����</font>') dylr";
		ls_sql+=" FROM cw_qmjzmx,crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd";
		ls_sql+=" where cw_qmjzmx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and cw_qmjzmx.sgd=sq_sgd.sgd(+)";
		ls_sql+=" and cw_qmjzmx.dwbh='"+dwbh+"'";
		ls_sql+=" and cw_qmjzmx.khbh=crm_khxx.khbh";
		ls_sql+=" and cw_qmjzmx.zt='3' ";
		ls_sql+=wheresql;

		ls_sql+=" order by sjs,lrsj";
	
	
	}
	else{//�ֹ�˾
		ls_sql="SELECT cw_qmjzmx.khbh,cw_qmjzmx.fgsbh,cw_qmjzmx.cxhdbm,cw_qmjzmx.cxhdbmxq,cw_qmjzmx.cxhdbmzh,cw_qmjzmx.sjs,cw_qmjzmx.hth,cw_qmjzmx.khxm,crm_khxx.fwdz,sgdmc,cw_qmjzmx.zjxm,DECODE(cw_qmjzmx.jzbz,'1','��װ','2','��װ') jzbz";
		ls_sql+=" ,cw_qmjzmx.wdzgce,cw_qmjzmx.zkl,cw_qmjzmx.qye,cw_qmjzmx.guanlif,cw_qmjzmx.suijinbfb,cw_qmjzmx.suijin ";
		ls_sql+=" ,cw_qmjzmx.zhzjxje,cw_qmjzmx.zjxguanlif,cw_qmjzmx.zjxsuijin,cw_qmjzmx.kglf ";
		ls_sql+=" ,cw_qmjzmx.sjf,cw_qmjzmx.sfke,DECODE(crm_khxx.sffj,'Y','����','N','��') sffj,cw_qmjzmx.fjje,cw_qmjzmx.gsfje";
		ls_sql+=" ,DECODE(crm_khxx.sfyrz,'Y','��֤','N','��') sfyrz,b.dwmc rzsc,a.dwmc qydm,crm_khxx.lrsj";
		ls_sql+=" ,cw_qmjzmx.qyrq,DECODE(TO_CHAR(crm_khxx.lrsj,'MM')-TO_CHAR(cw_qmjzmx.qyrq,'MM'),0,'��','<font color=\"#FF0000\">����</font>') dylr";
		ls_sql+=" FROM cw_qmjzmx,crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd";
		ls_sql+=" where cw_qmjzmx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and cw_qmjzmx.sgd=sq_sgd.sgd(+)";
		ls_sql+=" and cw_qmjzmx.fgsbh='"+dwbh+"'";
		ls_sql+=" and cw_qmjzmx.khbh=crm_khxx.khbh";
		ls_sql+=" and cw_qmjzmx.zt!='3' ";
		ls_sql+=wheresql;

		ls_sql+=" UNION ALL ";

		ls_sql+=" SELECT cw_qmjzmx.khbh,cw_qmjzmx.fgsbh,cw_qmjzmx.cxhdbm,cw_qmjzmx.cxhdbmxq,cw_qmjzmx.cxhdbmzh,cw_qmjzmx.sjs,cw_qmjzmx.hth,cw_qmjzmx.khxm,crm_khxx.fwdz,sgdmc,cw_qmjzmx.zjxm,DECODE(cw_qmjzmx.jzbz,'1','��װ','2','��װ') jzbz";
		ls_sql+=" ,-1*cw_qmjzmx.wdzgce,cw_qmjzmx.zkl,-1*cw_qmjzmx.qye,-1*cw_qmjzmx.guanlif,cw_qmjzmx.suijinbfb,-1*cw_qmjzmx.suijin ";
		ls_sql+=" ,-1*cw_qmjzmx.zhzjxje,-1*cw_qmjzmx.zjxguanlif,-1*cw_qmjzmx.zjxsuijin,-1*cw_qmjzmx.kglf ";
		ls_sql+=" ,-1*cw_qmjzmx.sjf,-1*cw_qmjzmx.sfke,DECODE(crm_khxx.sffj,'Y','����','N','��') sffj,-1*cw_qmjzmx.fjje,-1*cw_qmjzmx.gsfje";
		ls_sql+=" ,DECODE(crm_khxx.sfyrz,'Y','��֤','N','��') sfyrz,b.dwmc rzsc,a.dwmc qydm,crm_khxx.lrsj";
		ls_sql+=" ,cw_qmjzmx.qyrq,DECODE(TO_CHAR(crm_khxx.lrsj,'MM')-TO_CHAR(cw_qmjzmx.qyrq,'MM'),0,'��','<font color=\"#FF0000\">����</font>') dylr";
		ls_sql+=" FROM cw_qmjzmx,crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd";
		ls_sql+=" where cw_qmjzmx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and cw_qmjzmx.sgd=sq_sgd.sgd(+)";
		ls_sql+=" and cw_qmjzmx.fgsbh='"+dwbh+"'";
		ls_sql+=" and cw_qmjzmx.khbh=crm_khxx.khbh";
		ls_sql+=" and cw_qmjzmx.zt='3' ";
		ls_sql+=wheresql;

		ls_sql+=" order by sjs,lrsj";
	}
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		cxhdmc=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		khbh=cf.fillHtml(rs.getString("khbh"));
		hth=cf.fillHtml(rs.getString("hth"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		jzbz=cf.fillHtml(rs.getString("jzbz"));


		wdzgce=rs.getDouble("wdzgce");
		zkl=rs.getDouble("zkl");
		qye=rs.getDouble("qye");
		guanlif=rs.getDouble("guanlif");
		suijinbfb=rs.getDouble("suijinbfb");
		suijin=rs.getDouble("suijin");

		zjxje=rs.getDouble("zhzjxje");
		zjxguanlif=rs.getDouble("zjxguanlif");
		zjxsuijin=rs.getDouble("zjxsuijin");
		kglf=rs.getDouble("kglf");

		sjf=rs.getDouble("sjf");
		sfke=rs.getDouble("sfke");
		sffj=cf.fillHtml(rs.getString("sffj"));
		fjje=rs.getDouble("fjje");
		gsfje=rs.getDouble("gsfje");

		sfyrz=cf.fillHtml(rs.getString("sfyrz"));
		rzsc=cf.fillHtml(rs.getString("rzsc"));
		qydm=cf.fillHtml(rs.getString("qydm"));
		lrsj=cf.fillHtml(rs.getString("lrsj"));
		qyrq=cf.fillHtml(rs.getDate("qyrq"));
		dylr=cf.fillHtml(rs.getString("dylr"));

		
		row++;

		double yjxs11=10;//02�����澭��ҵ��ϵ��
		double yjxs12=10;//04����װ���ʦҵ��ϵ��
		double yjxs13=10;//06��ҵ��Աϵ��
		double yjxs14=10;//07���г�������ϵ��

		if (!cxhdmc.equals(""))//��˾�
		{
			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='02'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs11=rs1.getDouble("yjxs");
			}
			else{
				out.println("�����Ҳ����������"+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='04'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs12=rs1.getDouble("yjxs");
			}
			else{
				out.println("�����Ҳ����������"+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='06'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs13=rs1.getDouble("yjxs");
			}
			else{
				out.println("�����Ҳ����������"+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='07'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs14=rs1.getDouble("yjxs");
			}
			else{
				out.println("�����Ҳ����������"+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();
		}

		double yjxs21=10;
		double yjxs22=10;
		double yjxs23=10;
		double yjxs24=10;
		if (!cxhdbmxq.equals(""))
		{
			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='02'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs21=rs1.getDouble("yjxs");
			}
			else{
				out.println("�����Ҳ����������"+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='04'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs22=rs1.getDouble("yjxs");
			}
			else{
				out.println("�����Ҳ����������"+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='06'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs23=rs1.getDouble("yjxs");
			}
			else{
				out.println("�����Ҳ����������"+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='07'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs24=rs1.getDouble("yjxs");
			}
			else{
				out.println("�����Ҳ����������"+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();
		}

		double yjxs31=10;
		double yjxs32=10;
		double yjxs33=10;
		double yjxs34=10;
		if (!cxhdbmzh.equals(""))
		{
			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='02'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs31=rs1.getDouble("yjxs");
			}
			else{
				out.println("�����Ҳ����������"+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='04'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs32=rs1.getDouble("yjxs");
			}
			else{
				out.println("�����Ҳ����������"+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='06'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs33=rs1.getDouble("yjxs");
			}
			else{
				out.println("�����Ҳ����������"+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='07'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs34=rs1.getDouble("yjxs");
			}
			else{
				out.println("�����Ҳ����������"+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();
		}

		double yjxs1=10;//02�����澭��ҵ��ϵ��
		double yjxs2=10;//04����װ���ʦҵ��ϵ��
		double yjxs3=10;//06��ҵ��Աϵ��
		double yjxs4=10;//07���г�������ϵ��

		yjxs1=10-(10-yjxs11)-(10-yjxs21)-(10-yjxs31);
		yjxs2=10-(10-yjxs12)-(10-yjxs22)-(10-yjxs32);
		yjxs3=10-(10-yjxs13)-(10-yjxs23)-(10-yjxs33);
		yjxs4=10-(10-yjxs14)-(10-yjxs24)-(10-yjxs34);

		if (cxhdmc!=null || cxhdbmxq!=null || cxhdbmzh!=null )
		{
			dmjlyj=qye*yjxs1/10+guanlif;
			sjsyj=qye*yjxs2/10+guanlif;
			ywyyj=qye*yjxs3/10+guanlif;
			scbjlyj=qye*yjxs4/10+guanlif;
		}
		else{
			dmjlyj=qye+guanlif;
			sjsyj=qye+guanlif;
			ywyyj=qye+guanlif;
			scbjlyj=qye+guanlif;
		}


		dmjlyj=cf.round(dmjlyj,2);
		sjsyj=cf.round(sjsyj,2);
		ywyyj=cf.round(ywyyj,2);
		scbjlyj=cf.round(scbjlyj,2);

		allwdzgce+=wdzgce;
		allqye+=qye;
		allsuijin+=suijin;
		allguanlif+=guanlif;

		allzjxje+=zjxje;
		allzjxguanlif+=zjxguanlif;
		allzjxsuijin+=zjxsuijin;
		allkglf+=kglf;

		allsjf+=sjf;
		allsfke+=sfke;
		allfjje+=fjje;
		allgsfje+=gsfje;

		alldmjlyj+=dmjlyj;
		allsjsyj+=sjsyj;
		allywyyj+=ywyyj;
		allscbjlyj+=scbjlyj;

		if (cxhdmc.equals(""))
		{
			cxhdmc="&nbsp;";
		}
		if (cxhdbmxq.equals(""))
		{
			cxhdbmxq="&nbsp;";
		}
		if (cxhdbmzh.equals(""))
		{
			cxhdbmzh="&nbsp;";
		}

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td><%=row%></td>
			<td><%=sjs%></td>
			<td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=hth%></A></td>
			<td><%=khxm%></td>
			<td><%=fwdz%></td>
			<td><%=jzbz%></td>
			<td><%=cxhdmc%></td>
			<td><%=cxhdbmxq%></td>
			<td><%=cxhdbmzh%></td>

			<td><%=wdzgce%></td>
			<td><%=zkl%></td>
			<td><%=qye%></td>
			<td><%=guanlif%></td>
			<td><%=suijinbfb%></td>
			<td><%=suijin%></td>

			<td><%=zjxje%></td>
			<td><%=zjxguanlif%></td>
			<td><%=zjxsuijin%></td>
			<td><%=kglf%></td>


			<td><%=dmjlyj%></td>
			<td><%=sjsyj%></td>
			<td><%=ywyyj%></td>
			<td><%=scbjlyj%></td>

			<td><%=cf.formatDouble(dmjlyj+zjxje+zjxguanlif)%></td>
			<td><%=cf.formatDouble(dmjlyj+zjxje+zjxguanlif+zjxsuijin)%></td>
			<td><%=cf.formatDouble(dmjlyj+zjxje+zjxguanlif+zjxsuijin+kglf)%></td>

			<td><%=sjf%></td>
			<td><%=sfke%></td>
			<td><%=sffj%></td>
			<td><%=fjje%></td>
			<td><%=gsfje%></td>

			<td><%=sfyrz%></td>
			<td><%=rzsc%></td>
			<td><%=qydm%></td>
			<td><%=lrsj%></td>
			<td><%=qyrq%></td>
			<td><%=dylr%></td>
			<td><%=sgdmc%></td>
			<td><%=zjxm%></td>
		</tr>
		<%
	
	
	
	}
	rs.close();
	ps.close();

	if (allwdzgce==0)
	{
		zkl=0;
	}
	else{
		zkl=cf.round(allqye*10/allwdzgce,1);
	}




%>
<tr bgcolor="#FFFFFF"  align="center">
	<td colspan="2">С ��</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>

	<td><%=cf.formatDouble(allwdzgce)%></td>
	<td><%=zkl%></td>
	<td><%=cf.formatDouble(allqye)%></td>
	<td><%=cf.formatDouble(allguanlif)%></td>
	<td>&nbsp;</td>
	<td><%=cf.formatDouble(allsuijin)%></td>

	<td><%=cf.formatDouble(allzjxje)%></td>
	<td><%=cf.formatDouble(allzjxguanlif)%></td>
	<td><%=cf.formatDouble(allzjxsuijin)%></td>
	<td><%=cf.formatDouble(allkglf)%></td>

	<td><%=cf.formatDouble(alldmjlyj)%></td>
	<td><%=cf.formatDouble(allsjsyj)%></td>
	<td><%=cf.formatDouble(allywyyj)%></td>
	<td><%=cf.formatDouble(allscbjlyj)%></td>

	<td><%=cf.formatDouble(alldmjlyj+allzjxje+allzjxguanlif)%></td>
	<td><%=cf.formatDouble(alldmjlyj+allzjxje+allzjxguanlif+allzjxsuijin)%></td>
	<td><%=cf.formatDouble(alldmjlyj+allzjxje+allzjxguanlif+allzjxsuijin+allkglf)%></td>

	<td><%=cf.formatDouble(allsjf)%></td>
	<td><%=cf.formatDouble(allsfke)%></td>
	<td>&nbsp;</td>
	<td><%=cf.formatDouble(allfjje)%></td>
	<td><%=cf.formatDouble(allgsfje)%></td>

	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
</tr>

</table>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
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

