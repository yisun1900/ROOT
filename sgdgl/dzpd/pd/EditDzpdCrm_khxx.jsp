<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String hth=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;
String dwbh=null;
String lrsj=null;
String pdsj=null;
String pdr=null;
String sgd=null;
String sfxhf=null;
String hfrq=null;
String hflxbm=null;
String hdbz=null;
String khlxbm=null;
String pmjj=null;
double qye=0;
double sjf=0;
double glf=0;
String ybjbh=null;
String sgbz=null;
String cqbm=null;
String xqbm=null;
String sjs=null;
String sjsdh=null;
String bz=null;
String pdsm=null;
String zjxm=null;
String jlbz=null;
String kgzbz=null;
String jzbz=null;

String cgdz=null;
String hdr=null;
String kgsjqd=null;

String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));

String ybjfwdz="";
String ybjsjs="";
String ybjsgd="";
String ybjsgbz="";
String ybjzjxm="";

String ybjssmc=null;
String hdsfssmc=null;
String ybjss=null;
String hdsfss=null;
String ssfgs=null;

String deflbm="";
String deflmc="";
String kpjlh=null;
String yxzssgd=null;
String yxfzssgd=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,kgsjqd,DECODE(jzbz,'1','��װ����','2','��װ����') jzbz,DECODE(NVL(kgzbz,'N'),'Y','�ѳ�����֤','N','δ������֤') kgzbz,hth,jlbz,zjxm,pdsm,cgdz,hdr,sjs,cqbm,xqbm,sgbz,pmjj,qye,sjf,glf,ybjbh,khbh,khxm,fwdz,lxfs,qyrq,jyjdrq,kgrq,jgrq,dwbh,lrsj,pdsj,pdr,sgd,sfxhf,hfrq,hflxbm,hdbz,khlxbm,bz,DECODE(ybjss,'0','δ��ʵ','Y','��ʵ','N','����ʵ') ybjssmc,ybjss,DECODE(hdsfss,'0','δ��ʵ','Y','��ʵ','N','����ʵ') hdsfssmc,hdsfss ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		kgsjqd=cf.fillNull(rs.getString("kgsjqd"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		kgzbz=cf.fillNull(rs.getString("kgzbz"));
		hth=cf.fillNull(rs.getString("hth"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		pdsm=cf.fillNull(rs.getString("pdsm"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdr=cf.fillNull(rs.getString("hdr"));
		sjs=cf.fillNull(rs.getString("sjs"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		xqbm=cf.fillNull(rs.getString("xqbm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		pmjj=cf.fillNull(rs.getString("pmjj"));
		qye=rs.getDouble("qye");
		sjf=rs.getDouble("sjf");
		glf=rs.getDouble("glf");
		ybjbh=cf.fillNull(rs.getString("ybjbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		pdr=cf.fillNull(rs.getString("pdr"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		hfrq=cf.fillNull(rs.getDate("hfrq"));
		hflxbm=cf.fillNull(rs.getString("hflxbm"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		bz=cf.fillNull(rs.getString("bz"));
		ybjss=cf.fillNull(rs.getString("ybjss"));
		hdsfss=cf.fillNull(rs.getString("hdsfss"));
		ybjssmc=cf.fillNull(rs.getString("ybjssmc"));
		hdsfssmc=cf.fillNull(rs.getString("hdsfssmc"));
	}
	rs.close();
	ps.close();

/*
	if (kgsjqd.equals("N"))
	{
		out.println("�����ɵ�������ʱ��δȷ��");
		return;
	}
*/
	if (sgd.equals(""))
	{
		sgd="0";
	}

	ls_sql="select fwdz,sjs,sq_sgd.sgdmc||'��'||sq_sgd.sgd||'��' sgd,sgbz,zjxm";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where  khbh='"+ybjbh+"' and crm_khxx.sgd=sq_sgd.sgd(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ybjfwdz=cf.fillNull(rs.getString("fwdz"));
		ybjsjs=cf.fillNull(rs.getString("sjs"));
		ybjsgd=cf.fillNull(rs.getString("sgd"));
		ybjsgbz=cf.fillNull(rs.getString("sgbz"));
		ybjzjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();


	ls_sql="select dh";
	ls_sql+=" from  sq_yhxx ";
	ls_sql+=" where  dwbh='"+dwbh+"' and yhmc='"+sjs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	int kxsgds=0;
	ls_sql="select kpjlh,kxsgds";
	ls_sql+=" from  kp_pdkpjl ";
	ls_sql+=" where  fgsbh='"+ssfgs+"' and zxbz='Y' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kpjlh=rs.getString("kpjlh");
		kxsgds=rs.getInt("kxsgds");
	}
	rs.close();
	ps.close();

	//��С��
	ls_sql=" select deflbm,deflmc";
	ls_sql+=" from  kp_deflbm";
	ls_sql+=" where fgsbh='"+ssfgs+"'";
	ls_sql+=" and "+qye+">=dedy and "+qye+"<dexy";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		deflbm=rs.getString("deflbm");
		deflmc=rs.getString("deflmc");
	}
	else{
		out.println("���󣡴�С�������׼������"+ls_sql);
		return;
	}
	rs.close();
	ps.close();
	
	//��ʩ������
	String lssgd=null;
	int zsbzs=0;
	ls_sql="select sgd,count(*)";
	ls_sql+=" from  crm_khxx ";
	ls_sql+=" where gcjdbm in('1','2') and  fgsbh='"+ssfgs+"'";
	ls_sql+=" group by sgd";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		lssgd=cf.fillNull(rs.getString("sgd"));
		zsbzs=rs.getInt(2);

		ls_sql="update kp_pdkpmx set zsbzs=?";
		ls_sql+=" where  kpjlh='"+kpjlh+"' and sgd='"+lssgd+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setInt(1,zsbzs);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();
%>

<html>
<head>
<title>�ɵ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">�����ɵ����������ã�ֱ���Ӻ�ѡ��<%=kxsgds%>��������ֱ���Ӻ�ѡ��<%=kxsgds%>������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">

<%

	String c2=null;
	String hxsgd=null;
	String sgdmc=null;
	String kjdsm=null;
	String duihao=null;
	String sgdlx=null;
	double qdl=0;
	String sgdjbbm=null;
	int bqpm=0;
	double bzkxl=0;
	double syddje=0;
	double syzdje=0;
	double syxdje=0;
	String hxsgdstr="";

	int row=0;//ʩ�������ȼ�
	int hxsl=0;//��������ʩ��������
	int jsq=0;//������

	//��Ҫ������
	//��������>0�� and �����ڽӵ��ܶ�>0�� and ��ʣ�൥�ܶ�> 0�� and ��δ������δͣ����
	//Ƿ���ʡ����������������ɵ��ʣ���ֱ���ӡ�ֱ���ӷֱ�����

	if (deflbm.equals("1"))//1:��(6������);2:�е�(3��6��);3:С��(3������)
	{
		//����������A���ӣ���B�������ܳ���C��D����
		//A��ʣ�൥�ܶ� >= ǩԼ��з���������
		//��������ʾ��Ƿ��>=ǩԼ��ߣ���ֱ���ӡ�ֱ���ӷֱ���ʾ��kxsgds����
		//S1��ֱ���ӣ�����������������������������������������������������������������������
		row=0;//�ֱ�����
		ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
		ls_sql+=" from (";

		ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
		ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
		ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
		ls_sql+=" from kp_pdkpmx,sq_sgd";
		ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"' ";

		//��Ҫ������
		ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
		ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

		//����������A���ӣ���B�������ܳ���C��D����
		ls_sql+=" and kp_pdkpmx.sgdjbbm in('A','B')";

		ls_sql+=" and kp_pdkpmx.sydze*10000>="+qye;
		ls_sql+=" and kp_pdkpmx.syddje*10000>="+qye;

		ls_sql+=" and kp_pdkpmx.sgdlx='S1'";//S0����ֱ���ӣ�S1��ֱ����

		ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

		ls_sql+=" order by qdl desc,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm,bzkxl";

		ls_sql+=" )";
		ls_sql+=" where rownum<="+kxsgds;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			hxsgd=cf.fillNull(rs.getString("sgd"));
			sgdmc=cf.fillNull(rs.getString("sgdmc"));
			kjdsm=cf.fillNull(rs.getString("kjdsm"));
			duihao=cf.fillNull(rs.getString("duihao"));
			sgdlx=cf.fillNull(rs.getString("sgdlx"));
			qdl=rs.getDouble("qdl");
			sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
			bqpm=rs.getInt("bqpm");
			bzkxl=rs.getDouble("bzkxl");
			syddje=rs.getDouble("syddje");
			syzdje=rs.getDouble("syzdje");
			syxdje=rs.getDouble("syxdje");

			row++;
			hxsl++;

			if (row==1)
			{
				yxzssgd=hxsgd;
			}

			c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

			hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

			%>
			<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
			<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
			<%
		}
		rs.close();
		ps.close();

		//S0����ֱ���ӣ�����������������������������������������������������������������������

		row=0;//�ֱ�����

		ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
		ls_sql+=" from (";

		ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
		ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
		ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
		ls_sql+=" from kp_pdkpmx,sq_sgd";
		ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"'";

		//��Ҫ������
		ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
		ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

		//����������A���ӣ���B�������ܳ���C��D����
		ls_sql+=" and kp_pdkpmx.sgdjbbm in('A','B')";

		ls_sql+=" and kp_pdkpmx.sydze*10000>="+qye;
		ls_sql+=" and kp_pdkpmx.syddje*10000>="+qye;

		ls_sql+=" and kp_pdkpmx.sgdlx='S0'";

		ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

		ls_sql+=" order by qdl desc,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm,bzkxl";

		ls_sql+=" )";
		ls_sql+=" where rownum<="+kxsgds;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			hxsgd=cf.fillNull(rs.getString("sgd"));
			sgdmc=cf.fillNull(rs.getString("sgdmc"));
			kjdsm=cf.fillNull(rs.getString("kjdsm"));
			duihao=cf.fillNull(rs.getString("duihao"));
			sgdlx=cf.fillNull(rs.getString("sgdlx"));
			qdl=rs.getDouble("qdl");
			sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
			bqpm=rs.getInt("bqpm");
			bzkxl=rs.getDouble("bzkxl");
			syddje=rs.getDouble("syddje");
			syzdje=rs.getDouble("syzdje");
			syxdje=rs.getDouble("syxdje");

			row++;
			hxsl++;

			if (row==1)
			{
				yxfzssgd=hxsgd;
			}

			c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

			hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

			%>
			<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
			<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
			<%
		}
		rs.close();
		ps.close();
		//��������ֱ���ӣ�ֱ���ӣ�û�з�������������ʾ���У�Ƿ�󵥣��е�>=ǩԼ��ߣ������ʾ��kxsgds��������С���ִ󵥣�
		if (hxsl==0)
		{

			//S1��ֱ���ӣ�����������������������������������������������������������������������
			row=0;//�ֱ�����
			ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
			ls_sql+=" from (";

			ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
			ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
			ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
			ls_sql+=" from kp_pdkpmx,sq_sgd";
			ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"' ";

			//��Ҫ������
			ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
			ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

			//����������A���ӣ���B�������ܳ���C��D����
			ls_sql+=" and kp_pdkpmx.sgdjbbm in('A','B')";

			ls_sql+=" and kp_pdkpmx.sydze*10000>="+qye;
			ls_sql+=" and (kp_pdkpmx.syddje+kp_pdkpmx.syzdje)*10000>="+qye;

			ls_sql+=" and kp_pdkpmx.sgdlx='S1'";//S0����ֱ���ӣ�S1��ֱ����

			ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

			ls_sql+=" order by qdl desc,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm,bzkxl";

			ls_sql+=" )";
			ls_sql+=" where rownum<="+kxsgds;
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				hxsgd=cf.fillNull(rs.getString("sgd"));
				sgdmc=cf.fillNull(rs.getString("sgdmc"));
				kjdsm=cf.fillNull(rs.getString("kjdsm"));
				duihao=cf.fillNull(rs.getString("duihao"));
				sgdlx=cf.fillNull(rs.getString("sgdlx"));
				qdl=rs.getDouble("qdl");
				sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
				bqpm=rs.getInt("bqpm");
				bzkxl=rs.getDouble("bzkxl");
				syddje=rs.getDouble("syddje");
				syzdje=rs.getDouble("syzdje");
				syxdje=rs.getDouble("syxdje");

				row++;
				hxsl++;

				if (row==1)
				{
					yxzssgd=hxsgd;
				}

				c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

				hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

				%>
				<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
				<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
				<%
			}
			rs.close();
			ps.close();

			//S0����ֱ���ӣ�����������������������������������������������������������������������

			row=0;//�ֱ�����

			ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
			ls_sql+=" from (";

			ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
			ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
			ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
			ls_sql+=" from kp_pdkpmx,sq_sgd";
			ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"'";

			//��Ҫ������
			ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
			ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

			//����������A���ӣ���B�������ܳ���C��D����
			ls_sql+=" and kp_pdkpmx.sgdjbbm in('A','B')";

			ls_sql+=" and kp_pdkpmx.sydze*10000>="+qye;
			ls_sql+=" and (kp_pdkpmx.syddje+kp_pdkpmx.syzdje)*10000>="+qye;

			ls_sql+=" and kp_pdkpmx.sgdlx='S0'";

			ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

			ls_sql+=" order by qdl desc,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm,bzkxl";

			ls_sql+=" )";
			ls_sql+=" where rownum<="+kxsgds;
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				hxsgd=cf.fillNull(rs.getString("sgd"));
				sgdmc=cf.fillNull(rs.getString("sgdmc"));
				kjdsm=cf.fillNull(rs.getString("kjdsm"));
				duihao=cf.fillNull(rs.getString("duihao"));
				sgdlx=cf.fillNull(rs.getString("sgdlx"));
				qdl=rs.getDouble("qdl");
				sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
				bqpm=rs.getInt("bqpm");
				bzkxl=rs.getDouble("bzkxl");
				syddje=rs.getDouble("syddje");
				syzdje=rs.getDouble("syzdje");
				syxdje=rs.getDouble("syxdje");

				row++;
				hxsl++;

				if (row==1)
				{
					yxfzssgd=hxsgd;
				}

				c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

				hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

				%>
				<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
				<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
				<%
			}
			rs.close();
			ps.close();
		}
		//��������ֱ���ӣ�ֱ���ӣ�û�з���������ȡ��Ƿ�󵥣��е���С��>=ǩԼ��������ʾ��kxsgds��������С���ִ󵥣�
		if (hxsl==0)
		{
			//S1��ֱ���ӣ�����������������������������������������������������������������������
			row=0;//�ֱ�����
			ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
			ls_sql+=" from (";

			ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
			ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
			ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
			ls_sql+=" from kp_pdkpmx,sq_sgd";
			ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"' ";

			//��Ҫ������
			ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
			ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

			//����������A���ӣ���B�������ܳ���C��D����
			ls_sql+=" and kp_pdkpmx.sgdjbbm in('A','B')";

			ls_sql+=" and kp_pdkpmx.sydze*10000>="+qye;

			ls_sql+=" and kp_pdkpmx.sgdlx='S1'";//S0����ֱ���ӣ�S1��ֱ����

			ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

			ls_sql+=" order by qdl desc,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm,bzkxl";

			ls_sql+=" )";
			ls_sql+=" where rownum<="+kxsgds;
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				hxsgd=cf.fillNull(rs.getString("sgd"));
				sgdmc=cf.fillNull(rs.getString("sgdmc"));
				kjdsm=cf.fillNull(rs.getString("kjdsm"));
				duihao=cf.fillNull(rs.getString("duihao"));
				sgdlx=cf.fillNull(rs.getString("sgdlx"));
				qdl=rs.getDouble("qdl");
				sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
				bqpm=rs.getInt("bqpm");
				bzkxl=rs.getDouble("bzkxl");
				syddje=rs.getDouble("syddje");
				syzdje=rs.getDouble("syzdje");
				syxdje=rs.getDouble("syxdje");

				row++;
				hxsl++;

				if (row==1)
				{
					yxzssgd=hxsgd;
				}

				c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

				hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

				%>
				<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
				<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
				<%
			}
			rs.close();
			ps.close();

			//S0����ֱ���ӣ�����������������������������������������������������������������������

			row=0;//�ֱ�����

			ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
			ls_sql+=" from (";

			ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
			ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
			ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
			ls_sql+=" from kp_pdkpmx,sq_sgd";
			ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"'";

			//��Ҫ������
			ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
			ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

			//����������A���ӣ���B�������ܳ���C��D����
			ls_sql+=" and kp_pdkpmx.sgdjbbm in('A','B')";

			ls_sql+=" and kp_pdkpmx.sydze*10000>="+qye;

			ls_sql+=" and kp_pdkpmx.sgdlx='S0'";

			ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

			ls_sql+=" order by qdl desc,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm,bzkxl";

			ls_sql+=" )";
			ls_sql+=" where rownum<="+kxsgds;
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				hxsgd=cf.fillNull(rs.getString("sgd"));
				sgdmc=cf.fillNull(rs.getString("sgdmc"));
				kjdsm=cf.fillNull(rs.getString("kjdsm"));
				duihao=cf.fillNull(rs.getString("duihao"));
				sgdlx=cf.fillNull(rs.getString("sgdlx"));
				qdl=rs.getDouble("qdl");
				sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
				bqpm=rs.getInt("bqpm");
				bzkxl=rs.getDouble("bzkxl");
				syddje=rs.getDouble("syddje");
				syzdje=rs.getDouble("syzdje");
				syxdje=rs.getDouble("syxdje");

				row++;
				hxsl++;

				if (row==1)
				{
					yxfzssgd=hxsgd;
				}

				c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

				hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

				%>
				<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
				<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
				<%
			}
			rs.close();
			ps.close();
		}
		//B������û�з���������ʣ�൥�ܶ� < ǩԼ�
		//��	��A������ѡ�񣬰���������Ƿ���Ƿ���ʡ������ɵ��ʡ���������ʾ��kxsgds��������
		if (hxsl==0)
		{
			//S1��ֱ���ӣ�����������������������������������������������������������������������
			row=0;//�ֱ�����
			ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
			ls_sql+=" from (";

			ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
			ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
			ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
			ls_sql+=" from kp_pdkpmx,sq_sgd";
			ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"' ";

			//��Ҫ������
			ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
			ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

			ls_sql+=" and kp_pdkpmx.sydze*10000<"+qye;

			ls_sql+=" and kp_pdkpmx.sgdlx='S1'";//S0����ֱ���ӣ�S1��ֱ����

			ls_sql+=" and kp_pdkpmx.sgdjbbm='A'";

			ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

			ls_sql+=" order by kp_pdkpmx.bqpm,kp_pdkpmx.sydze desc,qdl desc,bzkxl";

			ls_sql+=" )";
			ls_sql+=" where rownum<="+kxsgds;

			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				hxsgd=cf.fillNull(rs.getString("sgd"));
				sgdmc=cf.fillNull(rs.getString("sgdmc"));
				kjdsm=cf.fillNull(rs.getString("kjdsm"));
				duihao=cf.fillNull(rs.getString("duihao"));
				sgdlx=cf.fillNull(rs.getString("sgdlx"));
				qdl=rs.getDouble("qdl");
				sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
				bqpm=rs.getInt("bqpm");
				bzkxl=rs.getDouble("bzkxl");
				syddje=rs.getDouble("syddje");
				syzdje=rs.getDouble("syzdje");
				syxdje=rs.getDouble("syxdje");

				row++;
				hxsl++;

				if (row==1)
				{
					yxzssgd=hxsgd;
				}

				c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

				hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

				%>
				<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
				<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
				<%
			}
			rs.close();
			ps.close();

			//S0����ֱ���ӣ�����������������������������������������������������������������������

			row=0;//�ֱ�����

			ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
			ls_sql+=" from (";

			ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
			ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
			ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
			ls_sql+=" from kp_pdkpmx,sq_sgd";
			ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"'";

			//��Ҫ������
			ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
			ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

			ls_sql+=" and kp_pdkpmx.sydze*10000<"+qye;

			ls_sql+=" and kp_pdkpmx.sgdlx='S0'";

			ls_sql+=" and kp_pdkpmx.sgdjbbm='A'";

			ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

			ls_sql+=" order by kp_pdkpmx.bqpm,kp_pdkpmx.sydze desc,qdl desc,bzkxl";

			ls_sql+=" )";
			ls_sql+=" where rownum<="+kxsgds;
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				hxsgd=cf.fillNull(rs.getString("sgd"));
				sgdmc=cf.fillNull(rs.getString("sgdmc"));
				kjdsm=cf.fillNull(rs.getString("kjdsm"));
				duihao=cf.fillNull(rs.getString("duihao"));
				sgdlx=cf.fillNull(rs.getString("sgdlx"));
				qdl=rs.getDouble("qdl");
				sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
				bqpm=rs.getInt("bqpm");
				bzkxl=rs.getDouble("bzkxl");
				syddje=rs.getDouble("syddje");
				syzdje=rs.getDouble("syzdje");
				syxdje=rs.getDouble("syxdje");

				row++;
				hxsl++;

				if (row==1)
				{
					yxfzssgd=hxsgd;
				}

				c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

				hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

				%>
				<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
				<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
				<%
			}
			rs.close();
			ps.close();
		}
		//��	A�������ޣ���B������ѡ�񣬰���������Ƿ���Ƿ���ʡ������ɵ��ʡ���������ʾ��kxsgds������
		if (hxsl==0)
		{
			//S1��ֱ���ӣ�����������������������������������������������������������������������
			row=0;//�ֱ�����
			ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
			ls_sql+=" from (";

			ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
			ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
			ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
			ls_sql+=" from kp_pdkpmx,sq_sgd";
			ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"' ";

			//��Ҫ������
			ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
			ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

			ls_sql+=" and kp_pdkpmx.sydze*10000<"+qye;

			ls_sql+=" and kp_pdkpmx.sgdlx='S1'";//S0����ֱ���ӣ�S1��ֱ����

			ls_sql+=" and kp_pdkpmx.sgdjbbm='B'";

			ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

			ls_sql+=" order by kp_pdkpmx.bqpm,kp_pdkpmx.sydze desc,qdl desc,bzkxl";

			ls_sql+=" )";
			ls_sql+=" where rownum<="+kxsgds;

			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				hxsgd=cf.fillNull(rs.getString("sgd"));
				sgdmc=cf.fillNull(rs.getString("sgdmc"));
				kjdsm=cf.fillNull(rs.getString("kjdsm"));
				duihao=cf.fillNull(rs.getString("duihao"));
				sgdlx=cf.fillNull(rs.getString("sgdlx"));
				qdl=rs.getDouble("qdl");
				sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
				bqpm=rs.getInt("bqpm");
				bzkxl=rs.getDouble("bzkxl");
				syddje=rs.getDouble("syddje");
				syzdje=rs.getDouble("syzdje");
				syxdje=rs.getDouble("syxdje");

				row++;
				hxsl++;

				if (row==1)
				{
					yxzssgd=hxsgd;
				}

				c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

				hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

				%>
				<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
				<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
				<%
			}
			rs.close();
			ps.close();

			//S0����ֱ���ӣ�����������������������������������������������������������������������

			row=0;//�ֱ�����

			ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
			ls_sql+=" from (";

			ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
			ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
			ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
			ls_sql+=" from kp_pdkpmx,sq_sgd";
			ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"'";

			//��Ҫ������
			ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
			ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

			ls_sql+=" and kp_pdkpmx.sydze*10000<"+qye;

			ls_sql+=" and kp_pdkpmx.sgdlx='S0'";

			ls_sql+=" and kp_pdkpmx.sgdjbbm='B'";

			ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

			ls_sql+=" order by kp_pdkpmx.bqpm,kp_pdkpmx.sydze desc,qdl desc,bzkxl";

			ls_sql+=" )";
			ls_sql+=" where rownum<="+kxsgds;
			
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				hxsgd=cf.fillNull(rs.getString("sgd"));
				sgdmc=cf.fillNull(rs.getString("sgdmc"));
				kjdsm=cf.fillNull(rs.getString("kjdsm"));
				duihao=cf.fillNull(rs.getString("duihao"));
				sgdlx=cf.fillNull(rs.getString("sgdlx"));
				qdl=rs.getDouble("qdl");
				sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
				bqpm=rs.getInt("bqpm");
				bzkxl=rs.getDouble("bzkxl");
				syddje=rs.getDouble("syddje");
				syzdje=rs.getDouble("syzdje");
				syxdje=rs.getDouble("syxdje");

				row++;
				hxsl++;

				if (row==1)
				{
					yxfzssgd=hxsgd;
				}

				c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

				hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

				%>
				<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
				<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
				<%
			}
			rs.close();
			ps.close();
		}

	}
	else if (deflbm.equals("2"))//2:�е�(3��6��)
	{
		//��������A���ӣ���B������C�������ܳ���D��
		row=0;
		hxsl=0;
		jsq=0;
		//ʣ�൥�ܶ� >= ǩԼ��
		//��	ȡ��Ƿ�󵥣��е�>=ǩԼ�ǰ��kxsgds��2��������ʾ��kxsgds������Ƿ�е�>=ǩԼ��ߡ�
		//S1��ֱ���ӣ�����������������������������������������������������������������������
		ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
		ls_sql+=" from (";

		ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
		ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
		ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
		ls_sql+=" from kp_pdkpmx,sq_sgd";
		ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"'";

		//��Ҫ������
		ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
		ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

		ls_sql+=" and kp_pdkpmx.sydze*10000>="+qye;
		ls_sql+=" and (kp_pdkpmx.syddje+kp_pdkpmx.syzdje)*10000>="+qye;

		ls_sql+=" and kp_pdkpmx.sgdlx='S1'";//S0����ֱ���ӣ�S1��ֱ����

		ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

		ls_sql+=" order by qdl desc,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm,bzkxl";
		ls_sql+=" )";
		ls_sql+=" where rownum<="+2*kxsgds;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			hxsgd=cf.fillNull(rs.getString("sgd"));
			sgdmc=cf.fillNull(rs.getString("sgdmc"));
			kjdsm=cf.fillNull(rs.getString("kjdsm"));
			duihao=cf.fillNull(rs.getString("duihao"));
			sgdlx=cf.fillNull(rs.getString("sgdlx"));
			qdl=rs.getDouble("qdl");
			sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
			bqpm=rs.getInt("bqpm");
			bzkxl=rs.getDouble("bzkxl");
			syddje=rs.getDouble("syddje");
			syzdje=rs.getDouble("syzdje");
			syxdje=rs.getDouble("syxdje");

			//ȡ��kxsgds������Ƿ�е�>=ǩԼ���
			if (syzdje*10000>=qye)
			{
				if (jsq>=kxsgds)
				{
					break;
				}
				else{
					jsq++;//������
					row++;
					hxsl++;

					if (row==1)
					{
						yxzssgd=hxsgd;
					}

					c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

					hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

					%>
					<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
					<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
					<%
				}
			}

		}
		rs.close();
		ps.close();


		//S0����ֱ���ӣ�����������������������������������������������������������������������
		row=0;//�ֱ�����
		jsq=0;

		ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
		ls_sql+=" from (";

		ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
		ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
		ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
		ls_sql+=" from kp_pdkpmx,sq_sgd";
		ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"'";

		//��Ҫ������
		ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
		ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

		ls_sql+=" and kp_pdkpmx.sydze*10000>="+qye;
		ls_sql+=" and (kp_pdkpmx.syddje+kp_pdkpmx.syzdje)*10000>="+qye;

		ls_sql+=" and kp_pdkpmx.sgdlx='S0'";//S0����ֱ���ӣ�S1��ֱ����

		ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

		ls_sql+=" order by qdl desc,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm,bzkxl";
		ls_sql+=" )";
		ls_sql+=" where rownum<="+2*kxsgds;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			hxsgd=cf.fillNull(rs.getString("sgd"));
			sgdmc=cf.fillNull(rs.getString("sgdmc"));
			kjdsm=cf.fillNull(rs.getString("kjdsm"));
			duihao=cf.fillNull(rs.getString("duihao"));
			sgdlx=cf.fillNull(rs.getString("sgdlx"));
			qdl=rs.getDouble("qdl");
			sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
			bqpm=rs.getInt("bqpm");
			bzkxl=rs.getDouble("bzkxl");
			syddje=rs.getDouble("syddje");
			syzdje=rs.getDouble("syzdje");
			syxdje=rs.getDouble("syxdje");

			//ȡ��kxsgds������Ƿ�е�>=ǩԼ���
			if (syzdje*10000>=qye)
			{
				if (jsq>=kxsgds)
				{
					break;
				}
				else{
					jsq++;//������
					row++;
					hxsl++;

					if (row==1)
					{
						yxfzssgd=hxsgd;
					}

					c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

					hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

					%>
					<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
					<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
					<%
				}
			}

		}
		rs.close();
		ps.close();

		
		
		//��	�����������������ߣ�����ʾ��kxsgds������Ƿ�󵥣��е�>=ǩԼ��ߣ���������Ŀ�ģ�Ϊ��ֹ�󵥵�ָ�걻�ɳ��е����ֿɷ�ֹ�󵥲�����Զ����ȥ�����е��ִ󵥣���
		if (hxsl==0)
		{
			//S1��ֱ���ӣ�����������������������������������������������������������������������
			row=0;
			ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
			ls_sql+=" from (";

			ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
			ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
			ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
			ls_sql+=" from kp_pdkpmx,sq_sgd";
			ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"'";

			//��Ҫ������
			ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
			ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

			ls_sql+=" and kp_pdkpmx.sydze*10000>="+qye;
			ls_sql+=" and (kp_pdkpmx.syddje+kp_pdkpmx.syzdje)*10000>="+qye;

			ls_sql+=" and kp_pdkpmx.sgdlx='S1'";//S0����ֱ���ӣ�S1��ֱ����

			ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

			ls_sql+=" order by qdl desc,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm,bzkxl";
			ls_sql+=" )";
			ls_sql+=" where rownum<="+kxsgds;
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				hxsgd=cf.fillNull(rs.getString("sgd"));
				sgdmc=cf.fillNull(rs.getString("sgdmc"));
				kjdsm=cf.fillNull(rs.getString("kjdsm"));
				duihao=cf.fillNull(rs.getString("duihao"));
				sgdlx=cf.fillNull(rs.getString("sgdlx"));
				qdl=rs.getDouble("qdl");
				sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
				bqpm=rs.getInt("bqpm");
				bzkxl=rs.getDouble("bzkxl");
				syddje=rs.getDouble("syddje");
				syzdje=rs.getDouble("syzdje");
				syxdje=rs.getDouble("syxdje");

				row++;
				hxsl++;

				if (row==1)
				{
					yxzssgd=hxsgd;
				}

				c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

				hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

				%>
				<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
				<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
				<%
			}
			rs.close();
			ps.close();

			//S0����ֱ���ӣ�����������������������������������������������������������������������
			row=0;
			ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
			ls_sql+=" from (";

			ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
			ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
			ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
			ls_sql+=" from kp_pdkpmx,sq_sgd";
			ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"'";

			//��Ҫ������
			ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
			ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

			ls_sql+=" and kp_pdkpmx.sydze*10000>="+qye;
			ls_sql+=" and (kp_pdkpmx.syddje+kp_pdkpmx.syzdje)*10000>="+qye;

			ls_sql+=" and kp_pdkpmx.sgdlx='S0'";//S0����ֱ���ӣ�S1��ֱ����

			ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

			ls_sql+=" order by qdl desc,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm,bzkxl";
			ls_sql+=" )";
			ls_sql+=" where rownum<="+kxsgds;
			
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				hxsgd=cf.fillNull(rs.getString("sgd"));
				sgdmc=cf.fillNull(rs.getString("sgdmc"));
				kjdsm=cf.fillNull(rs.getString("kjdsm"));
				duihao=cf.fillNull(rs.getString("duihao"));
				sgdlx=cf.fillNull(rs.getString("sgdlx"));
				qdl=rs.getDouble("qdl");
				sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
				bqpm=rs.getInt("bqpm");
				bzkxl=rs.getDouble("bzkxl");
				syddje=rs.getDouble("syddje");
				syzdje=rs.getDouble("syzdje");
				syxdje=rs.getDouble("syxdje");

				row++;
				hxsl++;

				if (row==1)
				{
					yxfzssgd=hxsgd;
				}

				c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

				hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

				%>
				<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
				<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
				<%
			}
			rs.close();
			ps.close();
		}

		//��	������ֱ���ӣ�ֱ���ӣ�û�з���������ȡ��Ƿ�󵥣��е���С��>=ǩԼ��������ʾ��kxsgds���������е���С������
		if (hxsl==0)
		{
			//S1��ֱ���ӣ�����������������������������������������������������������������������
			row=0;
			ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
			ls_sql+=" from (";

			ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
			ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
			ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
			ls_sql+=" from kp_pdkpmx,sq_sgd";
			ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"'";

			//��Ҫ������
			ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
			ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

			ls_sql+=" and kp_pdkpmx.sydze*10000>="+qye;

			ls_sql+=" and kp_pdkpmx.sgdlx='S1'";//S0����ֱ���ӣ�S1��ֱ����

			ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

			ls_sql+=" order by qdl desc,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm,bzkxl";
			ls_sql+=" )";
			ls_sql+=" where rownum<="+kxsgds;
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				hxsgd=cf.fillNull(rs.getString("sgd"));
				sgdmc=cf.fillNull(rs.getString("sgdmc"));
				kjdsm=cf.fillNull(rs.getString("kjdsm"));
				duihao=cf.fillNull(rs.getString("duihao"));
				sgdlx=cf.fillNull(rs.getString("sgdlx"));
				qdl=rs.getDouble("qdl");
				sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
				bqpm=rs.getInt("bqpm");
				bzkxl=rs.getDouble("bzkxl");
				syddje=rs.getDouble("syddje");
				syzdje=rs.getDouble("syzdje");
				syxdje=rs.getDouble("syxdje");

				row++;
				hxsl++;

				if (row==1)
				{
					yxzssgd=hxsgd;
				}

				c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

				hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

				%>
				<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
				<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
				<%
			}
			rs.close();
			ps.close();

			//S0����ֱ���ӣ�����������������������������������������������������������������������
			row=0;
			ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
			ls_sql+=" from (";

			ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
			ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
			ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
			ls_sql+=" from kp_pdkpmx,sq_sgd";
			ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"'";

			//��Ҫ������
			ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
			ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

			ls_sql+=" and kp_pdkpmx.sydze*10000>="+qye;

			ls_sql+=" and kp_pdkpmx.sgdlx='S0'";//S0����ֱ���ӣ�S1��ֱ����

			ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

			ls_sql+=" order by qdl desc,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm,bzkxl";
			ls_sql+=" )";
			ls_sql+=" where rownum<="+kxsgds;
			
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				hxsgd=cf.fillNull(rs.getString("sgd"));
				sgdmc=cf.fillNull(rs.getString("sgdmc"));
				kjdsm=cf.fillNull(rs.getString("kjdsm"));
				duihao=cf.fillNull(rs.getString("duihao"));
				sgdlx=cf.fillNull(rs.getString("sgdlx"));
				qdl=rs.getDouble("qdl");
				sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
				bqpm=rs.getInt("bqpm");
				bzkxl=rs.getDouble("bzkxl");
				syddje=rs.getDouble("syddje");
				syzdje=rs.getDouble("syzdje");
				syxdje=rs.getDouble("syxdje");

				row++;
				hxsl++;

				if (row==1)
				{
					yxfzssgd=hxsgd;
				}

				c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

				hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

				%>
				<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
				<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
				<%
			}
			rs.close();
			ps.close();
		}
		//B������û�з���������ʣ�൥�ܶ� < ǩԼ�
		//��	��A������ѡ�񣬰���������Ƿ���Ƿ���ʡ������ɵ��ʡ���������ʾ��kxsgds��������
		if (hxsl==0)
		{
			//S1��ֱ���ӣ�����������������������������������������������������������������������
			row=0;//�ֱ�����
			ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
			ls_sql+=" from (";

			ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
			ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
			ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
			ls_sql+=" from kp_pdkpmx,sq_sgd";
			ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"' ";

			//��Ҫ������
			ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
			ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

			ls_sql+=" and kp_pdkpmx.sydze*10000<"+qye;

			ls_sql+=" and kp_pdkpmx.sgdlx='S1'";//S0����ֱ���ӣ�S1��ֱ����

			ls_sql+=" and kp_pdkpmx.sgdjbbm='A'";

			ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

			ls_sql+=" order by kp_pdkpmx.bqpm,kp_pdkpmx.sydze desc,qdl desc,bzkxl";

			ls_sql+=" )";
			ls_sql+=" where rownum<="+kxsgds;

			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				hxsgd=cf.fillNull(rs.getString("sgd"));
				sgdmc=cf.fillNull(rs.getString("sgdmc"));
				kjdsm=cf.fillNull(rs.getString("kjdsm"));
				duihao=cf.fillNull(rs.getString("duihao"));
				sgdlx=cf.fillNull(rs.getString("sgdlx"));
				qdl=rs.getDouble("qdl");
				sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
				bqpm=rs.getInt("bqpm");
				bzkxl=rs.getDouble("bzkxl");
				syddje=rs.getDouble("syddje");
				syzdje=rs.getDouble("syzdje");
				syxdje=rs.getDouble("syxdje");

				row++;
				hxsl++;

				if (row==1)
				{
					yxzssgd=hxsgd;
				}

				c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

				hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

				%>
				<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
				<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
				<%
			}
			rs.close();
			ps.close();

			//S0����ֱ���ӣ�����������������������������������������������������������������������

			row=0;//�ֱ�����

			ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
			ls_sql+=" from (";

			ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
			ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
			ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
			ls_sql+=" from kp_pdkpmx,sq_sgd";
			ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"'";

			//��Ҫ������
			ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
			ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

			ls_sql+=" and kp_pdkpmx.sydze*10000<"+qye;

			ls_sql+=" and kp_pdkpmx.sgdlx='S0'";

			ls_sql+=" and kp_pdkpmx.sgdjbbm='A'";

			ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

			ls_sql+=" order by kp_pdkpmx.bqpm,kp_pdkpmx.sydze desc,qdl desc,bzkxl";

			ls_sql+=" )";
			ls_sql+=" where rownum<="+kxsgds;
			
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				hxsgd=cf.fillNull(rs.getString("sgd"));
				sgdmc=cf.fillNull(rs.getString("sgdmc"));
				kjdsm=cf.fillNull(rs.getString("kjdsm"));
				duihao=cf.fillNull(rs.getString("duihao"));
				sgdlx=cf.fillNull(rs.getString("sgdlx"));
				qdl=rs.getDouble("qdl");
				sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
				bqpm=rs.getInt("bqpm");
				bzkxl=rs.getDouble("bzkxl");
				syddje=rs.getDouble("syddje");
				syzdje=rs.getDouble("syzdje");
				syxdje=rs.getDouble("syxdje");

				row++;
				hxsl++;

				if (row==1)
				{
					yxfzssgd=hxsgd;
				}

				c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

				hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

				%>
				<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
				<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
				<%
			}
			rs.close();
			ps.close();
		}
		//��	A�������ޣ���B������ѡ�񣬰���������Ƿ���Ƿ���ʡ������ɵ��ʡ���������ʾ��kxsgds������
		if (hxsl==0)
		{
			//S1��ֱ���ӣ�����������������������������������������������������������������������
			row=0;//�ֱ�����
			ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
			ls_sql+=" from (";

			ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
			ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
			ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
			ls_sql+=" from kp_pdkpmx,sq_sgd";
			ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"' ";

			//��Ҫ������
			ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
			ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

			ls_sql+=" and kp_pdkpmx.sydze*10000<"+qye;

			ls_sql+=" and kp_pdkpmx.sgdlx='S1'";//S0����ֱ���ӣ�S1��ֱ����

			ls_sql+=" and kp_pdkpmx.sgdjbbm='B'";

			ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

			ls_sql+=" order by kp_pdkpmx.bqpm,kp_pdkpmx.sydze desc,qdl desc,bzkxl";

			ls_sql+=" )";
			ls_sql+=" where rownum<="+kxsgds;

			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				hxsgd=cf.fillNull(rs.getString("sgd"));
				sgdmc=cf.fillNull(rs.getString("sgdmc"));
				kjdsm=cf.fillNull(rs.getString("kjdsm"));
				duihao=cf.fillNull(rs.getString("duihao"));
				sgdlx=cf.fillNull(rs.getString("sgdlx"));
				qdl=rs.getDouble("qdl");
				sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
				bqpm=rs.getInt("bqpm");
				bzkxl=rs.getDouble("bzkxl");
				syddje=rs.getDouble("syddje");
				syzdje=rs.getDouble("syzdje");
				syxdje=rs.getDouble("syxdje");

				row++;
				hxsl++;

				if (row==1)
				{
					yxzssgd=hxsgd;
				}

				c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

				hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

				%>
				<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
				<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
				<%
			}
			rs.close();
			ps.close();

			//S0����ֱ���ӣ�����������������������������������������������������������������������

			row=0;//�ֱ�����

			ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
			ls_sql+=" from (";

			ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
			ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
			ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
			ls_sql+=" from kp_pdkpmx,sq_sgd";
			ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"'";

			//��Ҫ������
			ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
			ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

			ls_sql+=" and kp_pdkpmx.sydze*10000<"+qye;

			ls_sql+=" and kp_pdkpmx.sgdlx='S0'";

			ls_sql+=" and kp_pdkpmx.sgdjbbm='B'";

			ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

			ls_sql+=" order by kp_pdkpmx.bqpm,kp_pdkpmx.sydze desc,qdl desc,bzkxl";

			ls_sql+=" )";
			ls_sql+=" where rownum<="+kxsgds;
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				hxsgd=cf.fillNull(rs.getString("sgd"));
				sgdmc=cf.fillNull(rs.getString("sgdmc"));
				kjdsm=cf.fillNull(rs.getString("kjdsm"));
				duihao=cf.fillNull(rs.getString("duihao"));
				sgdlx=cf.fillNull(rs.getString("sgdlx"));
				qdl=rs.getDouble("qdl");
				sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
				bqpm=rs.getInt("bqpm");
				bzkxl=rs.getDouble("bzkxl");
				syddje=rs.getDouble("syddje");
				syzdje=rs.getDouble("syzdje");
				syxdje=rs.getDouble("syxdje");

				row++;
				hxsl++;

				if (row==1)
				{
					yxfzssgd=hxsgd;
				}

				c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

				hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

				%>
				<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
				<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
				<%
			}
			rs.close();
			ps.close();
		}
		//��	B�������ޣ���C������ѡ�񣬰���������Ƿ���Ƿ���ʡ������ɵ��ʡ���������ʾ��kxsgds������
		if (hxsl==0)
		{
			//S1��ֱ���ӣ�����������������������������������������������������������������������
			row=0;//�ֱ�����
			ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
			ls_sql+=" from (";

			ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
			ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
			ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
			ls_sql+=" from kp_pdkpmx,sq_sgd";
			ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"' ";

			//��Ҫ������
			ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
			ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

			ls_sql+=" and kp_pdkpmx.sydze*10000<"+qye;

			ls_sql+=" and kp_pdkpmx.sgdlx='S1'";//S0����ֱ���ӣ�S1��ֱ����

			ls_sql+=" and kp_pdkpmx.sgdjbbm='C'";

			ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

			ls_sql+=" order by kp_pdkpmx.bqpm,kp_pdkpmx.sydze desc,qdl desc,bzkxl";

			ls_sql+=" )";
			ls_sql+=" where rownum<="+kxsgds;

			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				hxsgd=cf.fillNull(rs.getString("sgd"));
				sgdmc=cf.fillNull(rs.getString("sgdmc"));
				kjdsm=cf.fillNull(rs.getString("kjdsm"));
				duihao=cf.fillNull(rs.getString("duihao"));
				sgdlx=cf.fillNull(rs.getString("sgdlx"));
				qdl=rs.getDouble("qdl");
				sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
				bqpm=rs.getInt("bqpm");
				bzkxl=rs.getDouble("bzkxl");
				syddje=rs.getDouble("syddje");
				syzdje=rs.getDouble("syzdje");
				syxdje=rs.getDouble("syxdje");

				row++;
				hxsl++;

				if (row==1)
				{
					yxzssgd=hxsgd;
				}

				c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

				hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

				%>
				<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
				<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
				<%
			}
			rs.close();
			ps.close();

			//S0����ֱ���ӣ�����������������������������������������������������������������������

			row=0;//�ֱ�����

			ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
			ls_sql+=" from (";

			ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
			ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
			ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
			ls_sql+=" from kp_pdkpmx,sq_sgd";
			ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"'";

			//��Ҫ������
			ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
			ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

			ls_sql+=" and kp_pdkpmx.sydze*10000<"+qye;

			ls_sql+=" and kp_pdkpmx.sgdlx='S0'";

			ls_sql+=" and kp_pdkpmx.sgdjbbm='C'";

			ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

			ls_sql+=" order by kp_pdkpmx.bqpm,kp_pdkpmx.sydze desc,qdl desc,bzkxl";

			ls_sql+=" )";
			ls_sql+=" where rownum<="+kxsgds;
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				hxsgd=cf.fillNull(rs.getString("sgd"));
				sgdmc=cf.fillNull(rs.getString("sgdmc"));
				kjdsm=cf.fillNull(rs.getString("kjdsm"));
				duihao=cf.fillNull(rs.getString("duihao"));
				sgdlx=cf.fillNull(rs.getString("sgdlx"));
				qdl=rs.getDouble("qdl");
				sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
				bqpm=rs.getInt("bqpm");
				bzkxl=rs.getDouble("bzkxl");
				syddje=rs.getDouble("syddje");
				syzdje=rs.getDouble("syzdje");
				syxdje=rs.getDouble("syxdje");

				row++;
				hxsl++;

				if (row==1)
				{
					yxfzssgd=hxsgd;
				}

				c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

				hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

				%>
				<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
				<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
				<%
			}
			rs.close();
			ps.close();
		}

	}
	else{//3:С��(3������)
		row=0;
		hxsl=0;
		jsq=0;

		//ʣ�൥�ܶ� >= ǩԼ��
		//��	ȡ��Ƿ�󵥣��е���С��>=ǩԼ�ǰ��kxsgds��2��������ʾ��kxsgds������ǷС��>=ǩԼ��ߡ�

		//S1��ֱ���ӣ�����������������������������������������������������������������������
		ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
		ls_sql+=" from (";

		ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
		ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
		ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
		ls_sql+=" from kp_pdkpmx,sq_sgd";
		ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"'";

		//��Ҫ������
		ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
		ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

		ls_sql+=" and kp_pdkpmx.sydze*10000>="+qye;

		ls_sql+=" and kp_pdkpmx.sgdlx='S1'";//S0����ֱ���ӣ�S1��ֱ����

		ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

		ls_sql+=" order by qdl desc,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm,bzkxl";
		ls_sql+=" )";
		ls_sql+=" where rownum<="+2*kxsgds;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			hxsgd=cf.fillNull(rs.getString("sgd"));
			sgdmc=cf.fillNull(rs.getString("sgdmc"));
			kjdsm=cf.fillNull(rs.getString("kjdsm"));
			duihao=cf.fillNull(rs.getString("duihao"));
			sgdlx=cf.fillNull(rs.getString("sgdlx"));
			qdl=rs.getDouble("qdl");
			sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
			bqpm=rs.getInt("bqpm");
			bzkxl=rs.getDouble("bzkxl");
			syddje=rs.getDouble("syddje");
			syzdje=rs.getDouble("syzdje");
			syxdje=rs.getDouble("syxdje");

			//ȡ��kxsgds������ǷС��>=ǩԼ���
			if (syxdje*10000>=qye)
			{
				if (jsq>=kxsgds)
				{
					break;
				}
				else{
					jsq++;//������
					row++;
					hxsl++;

					if (row==1)
					{
						yxzssgd=hxsgd;
					}

					c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

					hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

					%>
					<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
					<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
					<%
				}
			}

		}
		rs.close();
		ps.close();


		//S0����ֱ���ӣ�����������������������������������������������������������������������
		row=0;//�ֱ�����
		jsq=0;

		ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
		ls_sql+=" from (";

		ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
		ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
		ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
		ls_sql+=" from kp_pdkpmx,sq_sgd";
		ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"'";

		//��Ҫ������
		ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
		ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

		ls_sql+=" and kp_pdkpmx.sydze*10000>="+qye;

		ls_sql+=" and kp_pdkpmx.sgdlx='S0'";//S0����ֱ���ӣ�S1��ֱ����

		ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

		ls_sql+=" order by qdl desc,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm,bzkxl";
		ls_sql+=" )";
		ls_sql+=" where rownum<="+2*kxsgds;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			hxsgd=cf.fillNull(rs.getString("sgd"));
			sgdmc=cf.fillNull(rs.getString("sgdmc"));
			kjdsm=cf.fillNull(rs.getString("kjdsm"));
			duihao=cf.fillNull(rs.getString("duihao"));
			sgdlx=cf.fillNull(rs.getString("sgdlx"));
			qdl=rs.getDouble("qdl");
			sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
			bqpm=rs.getInt("bqpm");
			bzkxl=rs.getDouble("bzkxl");
			syddje=rs.getDouble("syddje");
			syzdje=rs.getDouble("syzdje");
			syxdje=rs.getDouble("syxdje");

			//ȡ��kxsgds������ǷС��>=ǩԼ���
			if (syxdje*10000>=qye)
			{
				if (jsq>=kxsgds)
				{
					break;
				}
				else{
					jsq++;//������
					row++;
					hxsl++;

					if (row==1)
					{
						yxfzssgd=hxsgd;
					}

					c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

					hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

					%>
					<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
					<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
					<%
				}
			}

		}
		rs.close();
		ps.close();

		if (hxsl==0)
		{
			row=0;
			hxsl=0;
			jsq=0;

			//ʣ�൥�ܶ� >= ǩԼ��
			//��	�����������������ߣ�����ʾ��kxsgds������Ƿ�е���С��>=ǩԼ��ߣ���������Ŀ�ģ�Ϊ��ֹ�е���ָ�걻�ɳ�С�����ֿɷ�ֹ�е�������Զ����ȥ����С�����е�����

			//S1��ֱ���ӣ�����������������������������������������������������������������������
			ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
			ls_sql+=" from (";

			ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
			ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
			ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
			ls_sql+=" from kp_pdkpmx,sq_sgd";
			ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"'";

			//��Ҫ������
			ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
			ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

			ls_sql+=" and kp_pdkpmx.sydze*10000>="+qye;

			ls_sql+=" and kp_pdkpmx.sgdlx='S1'";//S0����ֱ���ӣ�S1��ֱ����

			ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

			ls_sql+=" order by qdl desc,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm,bzkxl";
			ls_sql+=" )";
			ls_sql+=" where rownum<="+2*kxsgds;
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				hxsgd=cf.fillNull(rs.getString("sgd"));
				sgdmc=cf.fillNull(rs.getString("sgdmc"));
				kjdsm=cf.fillNull(rs.getString("kjdsm"));
				duihao=cf.fillNull(rs.getString("duihao"));
				sgdlx=cf.fillNull(rs.getString("sgdlx"));
				qdl=rs.getDouble("qdl");
				sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
				bqpm=rs.getInt("bqpm");
				bzkxl=rs.getDouble("bzkxl");
				syddje=rs.getDouble("syddje");
				syzdje=rs.getDouble("syzdje");
				syxdje=rs.getDouble("syxdje");

				//ȡ��kxsgds������Ƿ�е���С��>=ǩԼ���
				if ((syzdje+syxdje)*10000>=qye)
				{
					if (jsq>=kxsgds)
					{
						break;
					}
					else{
						jsq++;//������
						row++;
						hxsl++;

						if (row==1)
						{
							yxzssgd=hxsgd;
						}

						c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

						hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

						%>
						<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
						<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
						<%
					}
				}

			}
			rs.close();
			ps.close();


			//S0����ֱ���ӣ�����������������������������������������������������������������������
			row=0;//�ֱ�����
			jsq=0;

			ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
			ls_sql+=" from (";

			ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
			ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
			ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
			ls_sql+=" from kp_pdkpmx,sq_sgd";
			ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"'";

			//��Ҫ������
			ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
			ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

			ls_sql+=" and kp_pdkpmx.sydze*10000>="+qye;

			ls_sql+=" and kp_pdkpmx.sgdlx='S0'";//S0����ֱ���ӣ�S1��ֱ����

			ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

			ls_sql+=" order by qdl desc,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm,bzkxl";
			ls_sql+=" )";
			ls_sql+=" where rownum<="+2*kxsgds;
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				hxsgd=cf.fillNull(rs.getString("sgd"));
				sgdmc=cf.fillNull(rs.getString("sgdmc"));
				kjdsm=cf.fillNull(rs.getString("kjdsm"));
				duihao=cf.fillNull(rs.getString("duihao"));
				sgdlx=cf.fillNull(rs.getString("sgdlx"));
				qdl=rs.getDouble("qdl");
				sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
				bqpm=rs.getInt("bqpm");
				bzkxl=rs.getDouble("bzkxl");
				syddje=rs.getDouble("syddje");
				syzdje=rs.getDouble("syzdje");
				syxdje=rs.getDouble("syxdje");

				//ȡ��kxsgds������Ƿ�е���С��>=ǩԼ���
				if ((syzdje+syxdje)*10000>=qye)
				{
					if (jsq>=kxsgds)
					{
						break;
					}
					else{
						jsq++;//������
						row++;
						hxsl++;

						if (row==1)
						{
							yxfzssgd=hxsgd;
						}

						c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

						hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

						%>
						<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
						<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
						<%
					}
				}

			}
			rs.close();
			ps.close();
		}

		if (hxsl==0)
		{
			row=0;
			hxsl=0;

			//ʣ�൥�ܶ� >= ǩԼ��
			//��	�����������������ߣ�����ʾ��kxsgds������Ƿ�󵥣��е���С��>=ǩԼ��ߣ���������Ŀ�ģ�Ϊ��ֹ���е���ָ�걻�ɳ�С�����ֿɷ�ֹ���е�������Զ����ȥ����С���ִ��е�����

			//S1��ֱ���ӣ�����������������������������������������������������������������������
			ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
			ls_sql+=" from (";

			ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
			ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
			ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
			ls_sql+=" from kp_pdkpmx,sq_sgd";
			ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"'";

			//��Ҫ������
			ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
			ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

			ls_sql+=" and kp_pdkpmx.sydze*10000>="+qye;

			ls_sql+=" and kp_pdkpmx.sgdlx='S1'";//S0����ֱ���ӣ�S1��ֱ����

			ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

			ls_sql+=" order by qdl desc,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm,bzkxl";
			ls_sql+=" )";
			ls_sql+=" where rownum<="+kxsgds;
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				hxsgd=cf.fillNull(rs.getString("sgd"));
				sgdmc=cf.fillNull(rs.getString("sgdmc"));
				kjdsm=cf.fillNull(rs.getString("kjdsm"));
				duihao=cf.fillNull(rs.getString("duihao"));
				sgdlx=cf.fillNull(rs.getString("sgdlx"));
				qdl=rs.getDouble("qdl");
				sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
				bqpm=rs.getInt("bqpm");
				bzkxl=rs.getDouble("bzkxl");
				syddje=rs.getDouble("syddje");
				syzdje=rs.getDouble("syzdje");
				syxdje=rs.getDouble("syxdje");


				row++;
				hxsl++;

				if (row==1)
				{
					yxzssgd=hxsgd;
				}

				c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

				hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

				%>
				<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
				<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
				<%

			}
			rs.close();
			ps.close();


			//S0����ֱ���ӣ�����������������������������������������������������������������������
			row=0;//�ֱ�����

			ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
			ls_sql+=" from (";

			ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
			ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
			ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
			ls_sql+=" from kp_pdkpmx,sq_sgd";
			ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"'";

			//��Ҫ������
			ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
			ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

			ls_sql+=" and kp_pdkpmx.sydze*10000>="+qye;

			ls_sql+=" and kp_pdkpmx.sgdlx='S0'";//S0����ֱ���ӣ�S1��ֱ����

			ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

			ls_sql+=" order by qdl desc,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm,bzkxl";
			ls_sql+=" )";
			ls_sql+=" where rownum<="+kxsgds;
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				hxsgd=cf.fillNull(rs.getString("sgd"));
				sgdmc=cf.fillNull(rs.getString("sgdmc"));
				kjdsm=cf.fillNull(rs.getString("kjdsm"));
				duihao=cf.fillNull(rs.getString("duihao"));
				sgdlx=cf.fillNull(rs.getString("sgdlx"));
				qdl=rs.getDouble("qdl");
				sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
				bqpm=rs.getInt("bqpm");
				bzkxl=rs.getDouble("bzkxl");
				syddje=rs.getDouble("syddje");
				syzdje=rs.getDouble("syzdje");
				syxdje=rs.getDouble("syxdje");

				row++;
				hxsl++;

				if (row==1)
				{
					yxfzssgd=hxsgd;
				}

				c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

				hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

				%>
				<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
				<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
				<%

			}
			rs.close();
			ps.close();
		}

		//B������û�з���������ʣ�൥�ܶ� < ǩԼ�
		//��	��A������ѡ�񣬰���������Ƿ���Ƿ���ʡ������ɵ��ʡ���������ʾ��kxsgds��������
		if (hxsl==0)
		{
			//S1��ֱ���ӣ�����������������������������������������������������������������������
			row=0;//�ֱ�����
			ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
			ls_sql+=" from (";

			ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
			ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
			ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
			ls_sql+=" from kp_pdkpmx,sq_sgd";
			ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"' ";

			//��Ҫ������
			ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
			ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

			ls_sql+=" and kp_pdkpmx.sydze*10000<"+qye;

			ls_sql+=" and kp_pdkpmx.sgdlx='S1'";//S0����ֱ���ӣ�S1��ֱ����

			ls_sql+=" and kp_pdkpmx.sgdjbbm='A'";

			ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

			ls_sql+=" order by kp_pdkpmx.bqpm,kp_pdkpmx.sydze desc,qdl desc,bzkxl";

			ls_sql+=" )";
			ls_sql+=" where rownum<="+kxsgds;

			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				hxsgd=cf.fillNull(rs.getString("sgd"));
				sgdmc=cf.fillNull(rs.getString("sgdmc"));
				kjdsm=cf.fillNull(rs.getString("kjdsm"));
				duihao=cf.fillNull(rs.getString("duihao"));
				sgdlx=cf.fillNull(rs.getString("sgdlx"));
				qdl=rs.getDouble("qdl");
				sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
				bqpm=rs.getInt("bqpm");
				bzkxl=rs.getDouble("bzkxl");
				syddje=rs.getDouble("syddje");
				syzdje=rs.getDouble("syzdje");
				syxdje=rs.getDouble("syxdje");

				row++;
				hxsl++;

				if (row==1)
				{
					yxzssgd=hxsgd;
				}

				c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

				hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

				%>
				<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
				<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
				<%
			}
			rs.close();
			ps.close();

			//S0����ֱ���ӣ�����������������������������������������������������������������������

			row=0;//�ֱ�����

			ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
			ls_sql+=" from (";

			ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
			ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
			ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
			ls_sql+=" from kp_pdkpmx,sq_sgd";
			ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"'";

			//��Ҫ������
			ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
			ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

			ls_sql+=" and kp_pdkpmx.sydze*10000<"+qye;

			ls_sql+=" and kp_pdkpmx.sgdlx='S0'";

			ls_sql+=" and kp_pdkpmx.sgdjbbm='A'";

			ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

			ls_sql+=" order by kp_pdkpmx.bqpm,kp_pdkpmx.sydze desc,qdl desc,bzkxl";

			ls_sql+=" )";
			ls_sql+=" where rownum<="+kxsgds;
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				hxsgd=cf.fillNull(rs.getString("sgd"));
				sgdmc=cf.fillNull(rs.getString("sgdmc"));
				kjdsm=cf.fillNull(rs.getString("kjdsm"));
				duihao=cf.fillNull(rs.getString("duihao"));
				sgdlx=cf.fillNull(rs.getString("sgdlx"));
				qdl=rs.getDouble("qdl");
				sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
				bqpm=rs.getInt("bqpm");
				bzkxl=rs.getDouble("bzkxl");
				syddje=rs.getDouble("syddje");
				syzdje=rs.getDouble("syzdje");
				syxdje=rs.getDouble("syxdje");

				row++;
				hxsl++;

				if (row==1)
				{
					yxfzssgd=hxsgd;
				}

				c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

				hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

				%>
				<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
				<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
				<%
			}
			rs.close();
			ps.close();
		}
		//��	A�������ޣ���B������ѡ�񣬰���������Ƿ���Ƿ���ʡ������ɵ��ʡ���������ʾ��kxsgds������
		if (hxsl==0)
		{
			//S1��ֱ���ӣ�����������������������������������������������������������������������
			row=0;//�ֱ�����
			ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
			ls_sql+=" from (";

			ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
			ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
			ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
			ls_sql+=" from kp_pdkpmx,sq_sgd";
			ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"' ";

			//��Ҫ������
			ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
			ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

			ls_sql+=" and kp_pdkpmx.sydze*10000<"+qye;

			ls_sql+=" and kp_pdkpmx.sgdlx='S1'";//S0����ֱ���ӣ�S1��ֱ����

			ls_sql+=" and kp_pdkpmx.sgdjbbm='B'";

			ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

			ls_sql+=" order by kp_pdkpmx.bqpm,kp_pdkpmx.sydze desc,qdl desc,bzkxl";

			ls_sql+=" )";
			ls_sql+=" where rownum<="+kxsgds;

			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				hxsgd=cf.fillNull(rs.getString("sgd"));
				sgdmc=cf.fillNull(rs.getString("sgdmc"));
				kjdsm=cf.fillNull(rs.getString("kjdsm"));
				duihao=cf.fillNull(rs.getString("duihao"));
				sgdlx=cf.fillNull(rs.getString("sgdlx"));
				qdl=rs.getDouble("qdl");
				sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
				bqpm=rs.getInt("bqpm");
				bzkxl=rs.getDouble("bzkxl");
				syddje=rs.getDouble("syddje");
				syzdje=rs.getDouble("syzdje");
				syxdje=rs.getDouble("syxdje");

				row++;
				hxsl++;

				if (row==1)
				{
					yxzssgd=hxsgd;
				}

				c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

				hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

				%>
				<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
				<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
				<%
			}
			rs.close();
			ps.close();

			//S0����ֱ���ӣ�����������������������������������������������������������������������

			row=0;//�ֱ�����

			ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
			ls_sql+=" from (";

			ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
			ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
			ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
			ls_sql+=" from kp_pdkpmx,sq_sgd";
			ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"'";

			//��Ҫ������
			ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
			ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

			ls_sql+=" and kp_pdkpmx.sydze*10000<"+qye;

			ls_sql+=" and kp_pdkpmx.sgdlx='S0'";

			ls_sql+=" and kp_pdkpmx.sgdjbbm='B'";

			ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

			ls_sql+=" order by kp_pdkpmx.bqpm,kp_pdkpmx.sydze desc,qdl desc,bzkxl";

			ls_sql+=" )";
			ls_sql+=" where rownum<="+kxsgds;
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				hxsgd=cf.fillNull(rs.getString("sgd"));
				sgdmc=cf.fillNull(rs.getString("sgdmc"));
				kjdsm=cf.fillNull(rs.getString("kjdsm"));
				duihao=cf.fillNull(rs.getString("duihao"));
				sgdlx=cf.fillNull(rs.getString("sgdlx"));
				qdl=rs.getDouble("qdl");
				sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
				bqpm=rs.getInt("bqpm");
				bzkxl=rs.getDouble("bzkxl");
				syddje=rs.getDouble("syddje");
				syzdje=rs.getDouble("syzdje");
				syxdje=rs.getDouble("syxdje");

				row++;
				hxsl++;

				if (row==1)
				{
					yxfzssgd=hxsgd;
				}

				c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

				hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

				%>
				<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
				<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
				<%
			}
			rs.close();
			ps.close();
		}
		//��	B�������ޣ���C������ѡ�񣬰���������Ƿ���Ƿ���ʡ������ɵ��ʡ���������ʾ��kxsgds������
		if (hxsl==0)
		{
			//S1��ֱ���ӣ�����������������������������������������������������������������������
			row=0;//�ֱ�����
			ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
			ls_sql+=" from (";

			ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
			ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
			ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
			ls_sql+=" from kp_pdkpmx,sq_sgd";
			ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"' ";

			//��Ҫ������
			ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
			ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

			ls_sql+=" and kp_pdkpmx.sydze*10000<"+qye;

			ls_sql+=" and kp_pdkpmx.sgdlx='S1'";//S0����ֱ���ӣ�S1��ֱ����

			ls_sql+=" and kp_pdkpmx.sgdjbbm='C'";

			ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

			ls_sql+=" order by kp_pdkpmx.bqpm,kp_pdkpmx.sydze desc,qdl desc,bzkxl";

			ls_sql+=" )";
			ls_sql+=" where rownum<="+kxsgds;

			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				hxsgd=cf.fillNull(rs.getString("sgd"));
				sgdmc=cf.fillNull(rs.getString("sgdmc"));
				kjdsm=cf.fillNull(rs.getString("kjdsm"));
				duihao=cf.fillNull(rs.getString("duihao"));
				sgdlx=cf.fillNull(rs.getString("sgdlx"));
				qdl=rs.getDouble("qdl");
				sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
				bqpm=rs.getInt("bqpm");
				bzkxl=rs.getDouble("bzkxl");
				syddje=rs.getDouble("syddje");
				syzdje=rs.getDouble("syzdje");
				syxdje=rs.getDouble("syxdje");

				row++;
				hxsl++;

				if (row==1)
				{
					yxzssgd=hxsgd;
				}

				c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

				hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

				%>
				<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
				<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
				<%
			}
			rs.close();
			ps.close();

			//S0����ֱ���ӣ�����������������������������������������������������������������������

			row=0;//�ֱ�����

			ls_sql =" select sgd,sgdmc,kjdsm,duihao,sgdlx,qdl,sgdjbbm,bqpm,bzkxl,syddje,syzdje,syxdje";
			ls_sql+=" from (";

			ls_sql+=" select kp_pdkpmx.sgd,sgdmc,sq_sgd.kjdsm,sq_sgd.duihao,DECODE(kp_pdkpmx.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx";
			ls_sql+=" ,ROUND(kp_pdkpmx.sydze*100.0/kp_pdkpmx.bqjdze,1) qdl,kp_pdkpmx.sgdjbbm,kp_pdkpmx.bqpm";
			ls_sql+=" ,ROUND(kp_pdkpmx.zsbzs*100.0/kp_pdkpmx.bzs,1) bzkxl,kp_pdkpmx.syddje,kp_pdkpmx.syzdje,kp_pdkpmx.syxdje";
			ls_sql+=" from kp_pdkpmx,sq_sgd";
			ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.kpjlh='"+kpjlh+"' and sq_sgd.ssfgs='"+ssfgs+"'";

			//��Ҫ������
			ls_sql+=" and kp_pdkpmx.bqjdze>0 and kp_pdkpmx.bzs>0 and kp_pdkpmx.sydze>0";
			ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";

			ls_sql+=" and kp_pdkpmx.sydze*10000<"+qye;

			ls_sql+=" and kp_pdkpmx.sgdlx='S0'";

			ls_sql+=" and kp_pdkpmx.sgdjbbm='C'";

			ls_sql+=" and kp_pdkpmx.sgd not in(select sgd from pd_pdjl where khbh='"+khbh+"')";//���˾ܵ�ʩ����

			ls_sql+=" order by kp_pdkpmx.bqpm,kp_pdkpmx.sydze desc,qdl desc,bzkxl";

			ls_sql+=" )";
			ls_sql+=" where rownum<="+kxsgds;
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				hxsgd=cf.fillNull(rs.getString("sgd"));
				sgdmc=cf.fillNull(rs.getString("sgdmc"));
				kjdsm=cf.fillNull(rs.getString("kjdsm"));
				duihao=cf.fillNull(rs.getString("duihao"));
				sgdlx=cf.fillNull(rs.getString("sgdlx"));
				qdl=rs.getDouble("qdl");
				sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
				bqpm=rs.getInt("bqpm");
				bzkxl=rs.getDouble("bzkxl");
				syddje=rs.getDouble("syddje");
				syzdje=rs.getDouble("syzdje");
				syxdje=rs.getDouble("syxdje");

				row++;
				hxsl++;

				if (row==1)
				{
					yxfzssgd=hxsgd;
				}

				c2=sgdmc+"��"+sgdlx+"����Ƿ����"+qdl+"%��������"+sgdjbbm+"��������"+bqpm+"���������ɵ���"+bzkxl+"%����Ƿ��"+syddje+"����"+syzdje+"��С"+syxdje+"����"+kjdsm+"��";

				hxsgdstr+="<option value=\""+hxsgd+"\">"+c2+"</option>";

				%>
				<input type="hidden" name="hxsgd" value="<%=hxsgd%>" >
				<input type="hidden" name="hxsgdyxj" value="<%=row%>" >
				<%
			}
			rs.close();
			ps.close();
		}

	
	
	}



%>

		  
		  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td width="14%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#0000CC">�ͻ����</font></div>
              </td>
              <td width="36%" bgcolor="#FFFFFF"> <font color="#000000"> <%=khbh%> 
                <input type="hidden" name="khbh" size="20" maxlength="7"  value="<%=khbh%>" >
                </font></td>
              <td width="17%" bgcolor="#FFFFFF"> 
                <div align="right">��ͬ��</div>
              </td>
              <td width="33%" bgcolor="#FFFFFF"> <font color="#000000"><%=hth%> 
                </font></td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFFF" align="right"><font color="#000099">�ͻ�����</font></td>
              <td width="36%" bgcolor="#FFFFFF"><font color="#000000"><%=khxm%>��<%=lxfs%>��</font></td>
              <td width="17%" bgcolor="#FFFFFF" align="right"><font color="#000000">�Ƿ��װ</font></td>
              <td width="33%" bgcolor="#FFFFFF"><font color="#000000"><%=jzbz%></font></td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFFF" align="right"><font color="#0000CC">����</font></td>
              <td width="36%" bgcolor="#FFFFFF"> <font color="#000000"><%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm",cqbm,true);
%> </font></td>
              <td width="17%" bgcolor="#FFFFFF" align="right">С��</td>
              <td width="33%" bgcolor="#FFFFFF"><font color="#000000"><%=xqbm%> 
                </font></td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFFF" align="right"><font color="#000099">���ݵ�ַ</font></td>
              <td colspan="3" bgcolor="#FFFFFF"><font color="#000000"><%=fwdz%></font></td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFFF" align="right">ǩ������</td>
              <td width="36%" bgcolor="#FFFFFF"><font color="#000000"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </font></td>
              <td width="17%" bgcolor="#FFFFFF" align="right">���ʦ</td>
              <td width="33%" bgcolor="#FFFFFF"><font color="#000000"><%=sjs%>���绰��<%=sjsdh%>��</font></td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#0000CC">ǩԼ����</font></div>
              </td>
              <td width="36%" bgcolor="#FFFFFF"> <font color="#000000"> <%=qyrq%> 
                </font></td>
              <td width="17%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#000099">¼��ʱ��</font></div>
              </td>
              <td width="33%" bgcolor="#FFFFFF"> <font color="#000000"><%=lrsj%> 
                </font></td>
            </tr>
            <tr> 
              <td width="14%" align="right" bgcolor="#FFFFFF"><font color="#0000CC">��ע</font></td>
              <td colspan="3" bgcolor="#FFFFFF"><%=bz%></td>
            </tr>
            <%
	if (!ybjbh.equals(""))
	{
%> 
            <tr> 
              <td width="14%" align="right" bgcolor="#FFFFFF"><font color="#FF00FF">�ι��������</font></td>
              <td width="36%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjbh%></font></td>
              <td width="17%" bgcolor="#FFFFFF" align="right"><font color="#FF00FF">������ַ</font></td>
              <td width="33%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjfwdz%></font></td>
            </tr>
            <tr> 
              <td width="14%" align="right" bgcolor="#FFFFFF"><font color="#FF00FF">���ʦ</font></td>
              <td width="36%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjsjs%></font></td>
              <td width="17%" bgcolor="#FFFFFF" align="right"><font color="#FF00FF">�ʼ�����</font></td>
              <td width="33%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjzjxm%></font></td>
            </tr>
            <tr> 
              <td width="14%" align="right" bgcolor="#FFFFFF"><font color="#FF00FF">ʩ����</font></td>
              <td width="36%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjsgd%></font></td>
              <td width="17%" bgcolor="#FFFFFF" align="right"><font color="#FF00FF">ʩ������</font></td>
              <td width="33%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjsgbz%></font></td>
            </tr>
            <%
	}
	if (!hdbz.equals("1")){
%> 
            <tr> 
              <td width="14%" align="right" bgcolor="#FFFFFF"><font color="#0000CC">�ص���־</font></td>
              <td width="36%" bgcolor="#FFFFFF"><font color="#000000"><%
	cf.selectToken(out,"1+�ǻص�&2+���ʦ�ص�&3+ʩ���ӻص�&4+�Ͽͻ��ص�&5+Ա���ص�&6+�೤�ص�&7+��¥��&8+������&9+����",hdbz,false);
%></font></td>
              <td width="17%" bgcolor="#FFFFFF" align="right"><font color="#660066">�ص���</font></td>
              <td width="33%" bgcolor="#FFFFFF"><font color="#660066"><%=hdr%></font></td>
            </tr>
            <tr> 
              <td width="14%" align="right" bgcolor="#FFFFFF"><font color="#660066">�ص�װ�޵�ַ</font></td>
              <td colspan="3" bgcolor="#FFFFFF"><font color="#660066"><%=cgdz%></font></td>
            </tr>
            <%
	}
%> 
            <tr bgcolor="#CCCCFF"> 
              <td width="14%" align="right">������Ƿ���ʵ</td>
              <td width="36%"><font color="#660066"><%=ybjssmc%></font></td>
              <td width="17%" align="right">�ص��Ƿ���ʵ</td>
              <td width="33%"><font color="#660066"><%=hdsfssmc%></font></td>
            </tr>
            <tr bgcolor="#FFCCCC"> 
              <td width="14%" align="right"><b><font color="#0000FF">�ͻ�����</font></b></td>
              <td width="36%"><font color="#000000"><%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm,true);
%></font></td>
              <td width="17%" align="right"><b>���齻������</b></td>
              <td width="33%"><font color="#000000"><%=jyjdrq%></font></td>
            </tr>
            <tr bgcolor="#FFCCCC"> 
              <td width="14%" align="right"><b>��ͬ��������</b></td>
              <td width="36%"><font color="#000000"><%=kgrq%></font></td>
              <td width="17%" align="right"><b>��ͬ��������</b></td>
              <td width="33%"><font color="#000000"><%=jgrq%></font></td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFCC" align="right">������֤��־</td>
              <td width="36%" bgcolor="#FFFFCC"><%=kgzbz%></td>
              <td width="17%" bgcolor="#FFFFCC"> 
                <div align="right"></div>
              </td>
              <td width="33%" bgcolor="#FFFFCC">&nbsp; </td>
            </tr>
            <tr>
              <td width="14%" bgcolor="#FFFFCC" align="right"><font color="#CC0000">*</font>�ɵ�����</td>
              <td width="36%" bgcolor="#FFFFCC">
                <select name="jlbz" style="FONT-SIZE:12PX;WIDTH:182PX" >
                  <option value="8">�����ɵ�</option>
                </select>
              </td>
              <td width="17%" bgcolor="#FFFFCC" align="right"><font color="#CC0000">*</font>�Ƿ�ռ�ɵ�ָ��</td>
              <td width="33%" bgcolor="#FFFFCC">
                <input type="radio" name="shzzb" value="Y" checked>ռָ��
              </td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFCC"> 
                <div align="right"><font color="#CC0000">*</font><font color="#0000CC">�ɵ���</font></div>
              </td>
              <td width="36%" bgcolor="#FFFFCC"> 
                <input type="text" name="pdr" size="24" maxlength="20"  value="<%=yhmc%>" readonly>
              </td>
              <td width="17%" bgcolor="#FFFFCC"> 
                <div align="right"><font color="#CC0000">*</font><font color="#0000CC">�ɵ�ʱ��</font></div>
              </td>
              <td width="33%" bgcolor="#FFFFCC"> 
                <input type="text" name="pdsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
              </td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFCC" align="right"><font color="#CC0000">*</font>����ʩ����</td>
              <td colspan="3" bgcolor="#FFFFCC"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:668PX" onChange="changeSgd(editform)" >
                  <option value=""></option>
                  <%=hxsgdstr%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFCC" align="right">ʩ���೤</td>
              <td width="36%" bgcolor="#FFFFCC"> 
                <select name="sgbz" style="FONT-SIZE:12PX;WIDTH:180PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select bzmc,bzmc||'��'||dh||'��' from sq_bzxx where sgd='"+sgd+"' order by bzmc",sgbz);
%> 
                </select>
              </td>
              <td width="17%" bgcolor="#FFFFCC" align="right">�ʼ�</td>
              <td width="33%" bgcolor="#FFFFCC"> 
                <select name="zjxm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc,yhmc||'��'||dh||'��' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssfgs='"+ssfgs+"' and zwbm='05' and sfzszg in('Y','N') order by yhmc",zjxm);
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFFF"> 
                <div align="right">�ɵ�˵��</div>
              </td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <textarea name="pdsm" cols="73" rows="3"><%=pdsm%></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4" height="2"> 
                <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
                <input type="hidden"  name="kpjlh" value="<%=kpjlh%>">
                <input type="hidden"  name="deflbm" value="<%=deflbm%>">
                <input type="button"  value="����" onClick="f_do(editform)">
                <%
if (!hdbz.equals("1"))
{
%> 
                <input type="button"  value="��ʵ�ص�" onClick="window.open('/gcgl/hshd/EditCrm_khxx.jsp?khbh=<%=wherekhbh%>')">
                <%
}
if (ybjss.equals("0"))
{
%> 
                <input type="button"  value="��ʵ�����" onClick="window.open('/gcgl/hsybj/EditCrm_khxx.jsp?khbh=<%=wherekhbh%>')" name="button">
                <%
}
%> 
                <input type="button"  value="ʩ�����ɵ�ͳ��" onClick="f_cksgd(editform)">
                <input type="button"  value="��ѯ������ʩ����" onClick="f_ckbz(editform)" >
                <input type="reset"  value="����">
                <input type="button"  value="��ӡ�ɹ���" onClick="window.open('/pdgl/pd/DyPdCrm_khxx.jsp?khbh=<%=wherekhbh%>')">
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>

<%
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
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>



<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function changeSgd(FormName)
{
	if (FormName.sgd.value=='')
	{
		return;
	}

	editform.sgbz.options.length=1;

	var str="SgdCx.jsp?sgd="+FormName.sgd.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function addItem(str1,str2)
{
	var op1=document.createElement("OPTION");
	op1.value=str1;
	op1.text=str2;
	editform.sgbz.add(op1);
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.jlbz)=="") {
		alert("������[�ɵ�����]��");
		FormName.jlbz.focus();
		return false;
	}
	if(	javaTrim(FormName.shzzb)=="") {
		alert("������[�Ƿ�ռ�ɵ�ָ��]��");
		FormName.shzzb.focus();
		return false;
	}
	if(	javaTrim(FormName.pdsj)=="") {
		alert("������[�ɵ�ʱ��]��");
		FormName.pdsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.pdsj, "�ɵ�ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("������[����ʩ����]��");
		FormName.sgd.focus();
		return false;
	}

	if (FormName.sgd.value!="<%=yxzssgd%>" && FormName.sgd.value!="<%=yxfzssgd%>")
	{
		if(	javaTrim(FormName.pdsm)=="") {
			alert("��Ӧѡ��ֱ����������ǰ�ߡ��򡺷�ֱ����������ǰ�ߡ�����û��ѡ�����ڡ��ɵ�˵������д��ԭ��");
			FormName.pdsm.select();
			return false;
		}
	}

	FormName.action="SaveEditDzpdCrm_khxx.jsp";
//	FormName.target="";
	FormName.submit();
	return true;
}

function f_cksgd(FormName)//����FormName:Form������
{
	FormName.action="PdTjb.jsp?ssfgs=<%=ssfgs%>";
	FormName.target="_blank";
	FormName.submit();
	return true;
}
function f_ckbz(FormName)//����FormName:Form������
{

	FormName.action="EnterFwdz.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>

