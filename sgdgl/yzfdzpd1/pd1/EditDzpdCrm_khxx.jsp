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
double guanlif=0;
double suijin=0;
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
String hdsgd=null;
String hdsgbz=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int kxsgds=10;//��ѡ����

try {
	conn=cf.getConnection();

	ls_sql="select hdsgd,hdsgbz,fgsbh,kgsjqd,DECODE(jzbz,'1','��װ����','2','��װ����') jzbz,DECODE(NVL(kgzbz,'N'),'Y','�ѳ�����֤','N','δ������֤') kgzbz,hth,jlbz,zjxm,pdsm,cgdz,hdr,sjs,cqbm,xqbm,sgbz,pmjj,qye,guanlif,suijin,sjf,glf,ybjbh,khbh,khxm,fwdz,lxfs,qyrq,jyjdrq,kgrq,jgrq,dwbh,lrsj,pdsj,pdr,sgd,sfxhf,hfrq,hflxbm,hdbz,khlxbm,bz,DECODE(ybjss,'0','δ��ʵ','Y','��ʵ','N','����ʵ') ybjssmc,ybjss,DECODE(hdsfss,'0','δ��ʵ','Y','��ʵ','N','����ʵ') hdsfssmc,hdsfss ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hdsgd=cf.fillNull(rs.getString("hdsgd"));
		hdsgbz=cf.fillNull(rs.getString("hdsgbz"));
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
		guanlif=rs.getDouble("guanlif");
		suijin=rs.getDouble("suijin");
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
      <div align="center">�����ɵ����������ã���ѡ��<%=kxsgds%>������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">

<%
	String getsgd=null;
	String sgdmc=null;
	String bzmc=null;
	String getkhmyd=null;
	String zbj=null;
	String bzjb=null;
	String sgdjb=null;
	String mqzsgds=null;
	String getkygrsl=null;

	String hxsgdstr="";

	int count=0;

	double zxzbj=0;
	int grs=0;
	double khmyd=0;
	ls_sql=" select zbj,grs,khmyd";
	ls_sql+=" from  kp_yzfdzpdcs";
	ls_sql+=" where ssfgs='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zxzbj=rs.getDouble("zbj");
		grs=rs.getInt("grs");
		khmyd=rs.getDouble("khmyd");
	}
	rs.close();
	ps.close();

	if (hdsfssmc.equals("δ��ʵ"))
	{
		out.println("<font color='#FF00FF'><B>���ѣ��ص�δ��ʵ�����ǻص�����</B></font>");
	}
	else if (hdsfssmc.equals("����ʵ"))
	{
		out.println("<font color='#FF00FF'><B>���ѣ��ص�����ʵ�����ǻص�����</B></font>");
	}

	double qyeall=qye+guanlif+suijin;

	//�����ɵ�����SQL��䣫������������������������������������ʼ
	//��Ҫ�ɵ�������
	String BYsql="";
	BYsql =" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj < SYSDATE )) ";
	BYsql+=" and sq_bzxx.tdbz='N' ";
	BYsql+=" and sq_sgd.zbj>="+zxzbj;//����Ѻ��Ѻ����Ĳ����ɵ���Ѻ���������ٵģ�
	BYsql+=" and sq_sgd.khmyd>="+khmyd;//�ͻ������[�ɵ���֮ǰ���������깤���̣�����ȣ�������ǳ�����֮�ͣ�����80%����Ŀ�������ɵ���
	BYsql+=" and sq_bzxx.kygrsl>=2";//���ù�������
	BYsql+=" and sq_bzxx.kjdzdz>="+qyeall;//���� < �ɽӵ������ֵ
	BYsql+=" and sq_bzxx.mqzsgds<sq_bzxx.zdzsgds";// Ŀǰ��ʩ������ < ���������ʩ�������� ÿ��������ʩ���ز�����3����

	//��һ������Ŀ�����������ɵ�������50%������£���������һ���ɵ���ͬһ����Ŀ�������������ɵ�
	String GJsql=" and sq_bzxx.mqzsgds<sq_bzxx.zxzsgds";//Ŀǰ��ʩ������ < ������С��ʩ������
	GJsql+=" and sq_bzxx.kjdzxz<="+qyeall;//�ɵ��� > �ɽӵ�����Сֵ

	//ͬС���ɵ��������ɱ�С����ʩ����
	//��ѯ�೤ͬС����ʩ����
	String XQsql=" and sq_bzxx.bzmc in(select sgbz from crm_khxx where gcjdbm in('1','2') and crm_khxx.zt='2' and fgsbh='"+ssfgs+"' and  xqbm='"+xqbm+"' and crm_khxx.sgd=sq_bzxx.sgd)";//���ù�������
	
	//ͬ�����ɵ��������ɱ�������ʩ����
	//��ѯ�೤ͬ������ʩ����
	String CQsql=" and sq_bzxx.bzmc in(select sgbz from crm_khxx where gcjdbm in('1','2') and crm_khxx.zt='2' and fgsbh='"+ssfgs+"' and  cqbm='"+cqbm+"' and crm_khxx.sgd=sq_bzxx.sgd)";//���ù�������
	//�����ɵ�����SQL��䣽��������������������������������������

	//�����ɻص����ɸ��ص���
	if ( hdsfssmc.equals("��ʵ") && (hdbz.equals("3") || hdbz.equals("6")) )//1+�ǻص�&2+���ʦ�ص�&3+ʩ���ӻص�&4+�Ͽͻ��ص�&5+Ա���ص�&6+�೤�ص�&7+��¥��&8+������&9+����
	{
		ls_sql=" select sq_bzxx.sgd";
		ls_sql+=" from  sq_bzxx,sq_sgd";
		ls_sql+=" where sq_bzxx.sgd=sq_sgd.sgd and sq_bzxx.bzmc='"+hdsgbz+"' and sq_sgd.sgdmc='"+hdsgd+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getsgd=rs.getString("sgd");
		}
		else{
			out.println("���󣡲����ڵĻص���Ϣ���ص����ضӳ�["+hdsgd+"]���ص����ذ೤["+hdsgbz+"]");
			return;
		}
		rs.close();
		ps.close();

		hxsgdstr+="<option value=\""+getsgd+"*"+hdsgbz+"\">"+hdsgbz+"("+hdsgd+")���ص���</option>";
	}
	else{
		hxsgdstr+="<option value=''></option>";

		//�����ʱ��
		ls_sql=" delete from pd_yzfpdlsb where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//ͬС���ɵ����������ϼ��ӵ�
		ls_sql =" insert into pd_yzfpdlsb (khbh,sgd,sgdmc,sgdjb,zbj,khmyd,bzmc,bzjb,mqzsgds,kygrsl,sfbxz,lx,xh) ";
		ls_sql+=" select '"+khbh+"',sgd,sgdmc,sgdjb,zbj,khmyd,bzmc,bzjb,mqzsgds,kygrsl,'N','1',rownum ";
		ls_sql+=" from (";
		ls_sql+=" select sq_bzxx.kygrsl,sq_sgd.sgd,sq_sgd.sgdmc,sq_bzxx.bzmc,sq_sgd.zbj,sq_sgd.khmyd,sq_bzxx.sgdjbbm bzjb,sq_sgd.sgdjbbm sgdjb,sq_bzxx.mqzsgds ";
		ls_sql+=" from sq_sgd,sq_bzxx";
		ls_sql+=" where sq_sgd.sgd=sq_bzxx.sgd and sq_sgd.ssfgs='"+ssfgs+"' ";
		//��Ҫ�ɵ�������
		ls_sql+=BYsql;
		//ͬС���ɵ�
		ls_sql+=XQsql;

		//��һ������Ŀ�����������ɵ�������50%������£���������һ���ɵ���ͬһ����Ŀ�������������ɵ�
		ls_sql+=GJsql;

		ls_sql+=" order by sq_bzxx.sgdjbbm,sq_sgd.sgdjbbm,sq_sgd.zbj desc,sq_sgd.khmyd desc,sq_bzxx.mqzsgds";
		ls_sql+=" )";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();



		//ͬС���ɵ�����ʩ���ӿ����㣬�����¼��ӵ�
		ls_sql=" select count(*) from pd_yzfpdlsb where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count==0)
		{
			ls_sql =" insert into pd_yzfpdlsb (khbh,sgd,sgdmc,sgdjb,zbj,khmyd,bzmc,bzjb,mqzsgds,kygrsl,sfbxz,lx,xh) ";
			ls_sql+=" select '"+khbh+"',sgd,sgdmc,sgdjb,zbj,khmyd,bzmc,bzjb,mqzsgds,kygrsl,'N','1',rownum ";
			ls_sql+=" from (";
			ls_sql+=" select sq_bzxx.kygrsl,sq_sgd.sgd,sq_sgd.sgdmc,sq_bzxx.bzmc,sq_sgd.zbj,sq_sgd.khmyd,sq_bzxx.sgdjbbm bzjb,sq_sgd.sgdjbbm sgdjb,sq_bzxx.mqzsgds ";
			ls_sql+=" from sq_sgd,sq_bzxx";
			ls_sql+=" where sq_sgd.sgd=sq_bzxx.sgd and sq_sgd.ssfgs='"+ssfgs+"' ";
			//��Ҫ�ɵ�������
			ls_sql+=BYsql;
			//ͬС���ɵ�
			ls_sql+=XQsql;
			ls_sql+=" order by sq_bzxx.sgdjbbm,sq_sgd.sgdjbbm,sq_sgd.zbj desc,sq_sgd.khmyd desc,sq_bzxx.mqzsgds";
			ls_sql+=" )";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}


		//ͬ�����ɵ����������ϼ��ӵ�
		ls_sql=" select count(*) from pd_yzfpdlsb where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count==0)
		{
			ls_sql =" insert into pd_yzfpdlsb (khbh,sgd,sgdmc,sgdjb,zbj,khmyd,bzmc,bzjb,mqzsgds,kygrsl,sfbxz,lx,xh) ";
			ls_sql+=" select '"+khbh+"',sgd,sgdmc,sgdjb,zbj,khmyd,bzmc,bzjb,mqzsgds,kygrsl,'N','2',rownum ";
			ls_sql+=" from (";
			ls_sql+=" select sq_bzxx.kygrsl,sq_sgd.sgd,sq_sgd.sgdmc,sq_bzxx.bzmc,sq_sgd.zbj,sq_sgd.khmyd,sq_bzxx.sgdjbbm bzjb,sq_sgd.sgdjbbm sgdjb,sq_bzxx.mqzsgds ";
			ls_sql+=" from sq_sgd,sq_bzxx";
			ls_sql+=" where sq_sgd.sgd=sq_bzxx.sgd and sq_sgd.ssfgs='"+ssfgs+"' ";
			//��Ҫ�ɵ�������
			ls_sql+=BYsql;
			//ͬ�����ɵ�
			ls_sql+=CQsql;

			//��һ������Ŀ�����������ɵ�������50%������£���������һ���ɵ���ͬһ����Ŀ�������������ɵ�
			ls_sql+=GJsql;

			ls_sql+=" order by sq_bzxx.sgdjbbm,sq_sgd.sgdjbbm,sq_sgd.zbj desc,sq_sgd.khmyd desc,sq_bzxx.mqzsgds";
			ls_sql+=" )";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

		//ͬ�����ɵ�����ʩ���ӿ����㣬�����¼��ӵ�
		ls_sql=" select count(*) from pd_yzfpdlsb where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count==0)
		{
			ls_sql =" insert into pd_yzfpdlsb (khbh,sgd,sgdmc,sgdjb,zbj,khmyd,bzmc,bzjb,mqzsgds,kygrsl,sfbxz,lx,xh) ";
			ls_sql+=" select '"+khbh+"',sgd,sgdmc,sgdjb,zbj,khmyd,bzmc,bzjb,mqzsgds,kygrsl,'N','2',rownum ";
			ls_sql+=" from (";
			ls_sql+=" select sq_bzxx.kygrsl,sq_sgd.sgd,sq_sgd.sgdmc,sq_bzxx.bzmc,sq_sgd.zbj,sq_sgd.khmyd,sq_bzxx.sgdjbbm bzjb,sq_sgd.sgdjbbm sgdjb,sq_bzxx.mqzsgds ";
			ls_sql+=" from sq_sgd,sq_bzxx";
			ls_sql+=" where sq_sgd.sgd=sq_bzxx.sgd and sq_sgd.ssfgs='"+ssfgs+"' ";
			//��Ҫ�ɵ�������
			ls_sql+=BYsql;
			//ͬ�����ɵ�
			ls_sql+=CQsql;
			ls_sql+=" order by sq_bzxx.sgdjbbm,sq_sgd.sgdjbbm,sq_sgd.zbj desc,sq_sgd.khmyd desc,sq_bzxx.mqzsgds";
			ls_sql+=" )";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

		//�ޱ�С���ӵ����ޱ������ӵ����������ϼ��ӵ�
		ls_sql=" select count(*) from pd_yzfpdlsb where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count==0)
		{
			ls_sql =" insert into pd_yzfpdlsb (khbh,sgd,sgdmc,sgdjb,zbj,khmyd,bzmc,bzjb,mqzsgds,kygrsl,sfbxz,lx,xh) ";
			ls_sql+=" select '"+khbh+"',sgd,sgdmc,sgdjb,zbj,khmyd,bzmc,bzjb,mqzsgds,kygrsl,'N','9',rownum ";
			ls_sql+=" from (";
			ls_sql+=" select sq_bzxx.kygrsl,sq_sgd.sgd,sq_sgd.sgdmc,sq_bzxx.bzmc,sq_sgd.zbj,sq_sgd.khmyd,sq_bzxx.sgdjbbm bzjb,sq_sgd.sgdjbbm sgdjb,sq_bzxx.mqzsgds ";
			ls_sql+=" from sq_sgd,sq_bzxx";
			ls_sql+=" where sq_sgd.sgd=sq_bzxx.sgd and sq_sgd.ssfgs='"+ssfgs+"' ";
			//��Ҫ�ɵ�������
			ls_sql+=BYsql;

			//��һ������Ŀ�����������ɵ�������50%������£���������һ���ɵ���ͬһ����Ŀ�������������ɵ�
			ls_sql+=GJsql;

			ls_sql+=" order by sq_bzxx.sgdjbbm,sq_sgd.sgdjbbm,sq_sgd.zbj desc,sq_sgd.khmyd desc,sq_bzxx.mqzsgds";
			ls_sql+=" )";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

		//��ʩ���ӿ����㣬�����¼��ӵ�
		ls_sql=" select count(*) from pd_yzfpdlsb where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count==0)
		{
			ls_sql =" insert into pd_yzfpdlsb (khbh,sgd,sgdmc,sgdjb,zbj,khmyd,bzmc,bzjb,mqzsgds,kygrsl,sfbxz,lx,xh) ";
			ls_sql+=" select '"+khbh+"',sgd,sgdmc,sgdjb,zbj,khmyd,bzmc,bzjb,mqzsgds,kygrsl,'N','9',rownum ";
			ls_sql+=" from (";
			ls_sql+=" select sq_bzxx.kygrsl,sq_sgd.sgd,sq_sgd.sgdmc,sq_bzxx.bzmc,sq_sgd.zbj,sq_sgd.khmyd,sq_bzxx.sgdjbbm bzjb,sq_sgd.sgdjbbm sgdjb,sq_bzxx.mqzsgds ";
			ls_sql+=" from sq_sgd,sq_bzxx";
			ls_sql+=" where sq_sgd.sgd=sq_bzxx.sgd and sq_sgd.ssfgs='"+ssfgs+"' ";
			//��Ҫ�ɵ�������
			ls_sql+=BYsql;
			ls_sql+=" order by sq_bzxx.sgdjbbm,sq_sgd.sgdjbbm,sq_sgd.zbj desc,sq_sgd.khmyd desc,sq_bzxx.mqzsgds";
			ls_sql+=" )";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}


	//�����ظ�ʩ����
	int js=0;
	ls_sql =" select sgd,bzmc";
	ls_sql+=" from pd_yzfpdlsb ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ls_sql+=" order by xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getsgd=cf.fillNull(rs.getString("sgd"));
		bzmc=cf.fillNull(rs.getString("bzmc"));

		//�ж�ʩ�����Ƿ���ѡ��
		count=0;
		ls_sql =" select count(*)";
		ls_sql+=" from pd_yzfpdlsb ";
		ls_sql+=" where khbh='"+khbh+"' and sgd='"+getsgd+"' and sfbxz='Y'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count==0)//δѡ������ѡ���־
		{
			ls_sql=" update pd_yzfpdlsb set sfbxz='Y'  ";
			ls_sql+=" where khbh='"+khbh+"' and sgd='"+getsgd+"' and bzmc='"+bzmc+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();

			js++;

			if (js>kxsgds)
			{
				break;
			}
		}
	}
	rs.close();
	ps.close();

	//�ж��Ƿ������������������㣬����
	if (js<kxsgds)
	{
		ls_sql =" select sgd,bzmc";
		ls_sql+=" from pd_yzfpdlsb ";
		ls_sql+=" where khbh='"+khbh+"' and sfbxz='N'";
		ls_sql+=" order by xh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getsgd=cf.fillNull(rs.getString("sgd"));
			bzmc=cf.fillNull(rs.getString("bzmc"));

			ls_sql=" update pd_yzfpdlsb set sfbxz='Y'  ";
			ls_sql+=" where khbh='"+khbh+"' and sgd='"+getsgd+"' and bzmc='"+bzmc+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();

			js++;

			if (js>kxsgds)
			{
				break;
			}
		}
		rs.close();
		ps.close();
	}

	//��ʾʩ����
	String lxmc=null;
	ls_sql =" select kygrsl,sgd,sgdmc,bzmc,zbj,khmyd,bzjb,sgdjb,mqzsgds,DECODE(lx,'1','��ͬС����','2','��ͬ������','9','') lxmc ";
	ls_sql+=" from pd_yzfpdlsb ";
	ls_sql+=" where khbh='"+khbh+"' and sfbxz='Y'";
	ls_sql+=" order by xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getkygrsl=cf.fillNull(rs.getString("kygrsl"));
		getsgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		bzmc=cf.fillNull(rs.getString("bzmc"));
		zbj=cf.fillNull(rs.getString("zbj"));
		getkhmyd=cf.fillNull(rs.getString("khmyd"));
		bzjb=cf.fillNull(rs.getString("bzjb"));
		sgdjb=cf.fillNull(rs.getString("sgdjb"));
		mqzsgds=cf.fillNull(rs.getString("mqzsgds"));
		lxmc=cf.fillNull(rs.getString("lxmc"));

		hxsgdstr+="\r\n<option value=\""+getsgd+"*"+bzmc+"\">"+bzmc+"(���ù�����"+getkygrsl+")("+sgdmc+")"+lxmc+"</option>";
	}
	rs.close();
	ps.close();

	//�����ʱ��
	ls_sql=" delete from pd_yzfpdlsb where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	
%>

		  
		  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td width="14%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#0000CC">�ͻ����</font></div>              </td>
              <td width="36%" bgcolor="#FFFFFF"> <font color="#000000"> <%=khbh%> 
                <input type="hidden" name="khbh" size="20" maxlength="7"  value="<%=khbh%>" >
                </font></td>
              <td width="17%" bgcolor="#FFFFFF"> 
                <div align="right">��ͬ��</div>              </td>
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
                <div align="right"><font color="#0000CC">ǩԼ����</font></div>              </td>
              <td width="36%" bgcolor="#FFFFFF"> <font color="#000000"> <%=qyrq%> 
                </font></td>
              <td width="17%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#000099">¼��ʱ��</font></div>              </td>
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
              <td width="14%" align="right" bgcolor="#FFFFFF"><font color="#0000CC">�ص����ضӳ�</font></td>
              <td width="36%" bgcolor="#FFFFFF"><font color="#000000"><%=hdsgd%></font></td>
              <td width="17%" bgcolor="#FFFFFF" align="right"><font color="#660066">�ص����ذ೤</font></td>
              <td width="33%" bgcolor="#FFFFFF"><font color="#660066"><%=hdsgbz%></font></td>
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
              <td width="17%" align="right" bgcolor="#FFFFCC">ǩԼ��</td>
              <td width="33%" bgcolor="#FFFFCC"><font color="#000000"><%=cf.formatDouble(qyeall)%></font> </td>
            </tr>
            <tr>
              <td width="14%" bgcolor="#FFFFCC" align="right"><font color="#CC0000">*</font>�ɵ�����</td>
              <td width="36%" bgcolor="#FFFFCC">
                <select name="jlbz" style="FONT-SIZE:12PX;WIDTH:182PX" >
                  <option value="8">�����ɵ�</option>
                </select>              </td>
              <td width="17%" bgcolor="#FFFFCC" align="right"><font color="#CC0000">*</font>�Ƿ�ռ�ɵ�ָ��</td>
              <td width="33%" bgcolor="#FFFFCC">
                <input type="radio" name="shzzb" value="Y" checked>ռָ��              </td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFCC"> 
                <div align="right"><font color="#CC0000">*</font><font color="#0000CC">�ɵ���</font></div>              </td>
              <td width="36%" bgcolor="#FFFFCC"> 
                <input type="text" name="pdr" size="24" maxlength="20"  value="<%=yhmc%>" readonly>              </td>
              <td width="17%" bgcolor="#FFFFCC"> 
                <div align="right"><font color="#CC0000">*</font><font color="#0000CC">�ɵ�ʱ��</font></div>              </td>
              <td width="33%" bgcolor="#FFFFCC"> 
                <input type="text" name="pdsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>              </td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFCC" align="right"><font color="#CC0000">*</font>ʩ���೤</td>
              <td colspan="3" bgcolor="#FFFFCC"> 
                <select name="sgbz" style="FONT-SIZE:12PX;WIDTH:668PX" onChange="changeSgd(editform)" >
                  <%=hxsgdstr%> 
                </select>              </td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFCC" align="right">�ʼ�</td>
              <td width="36%" bgcolor="#FFFFCC"><select name="zjxm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select yhmc,yhmc||'��'||dh||'��' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssfgs='"+ssfgs+"' and zwbm='05' and sfzszg in('Y','N') order by yhmc",zjxm);
%>
              </select></td>
              <td width="17%" bgcolor="#FFFFCC" align="right">&nbsp;</td>
              <td width="33%" bgcolor="#FFFFCC">&nbsp;</td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFFF"> 
                <div align="right">�ɵ�˵��</div>              </td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <textarea name="pdsm" cols="73" rows="3"><%=pdsm%></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4" height="2"> 
                <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
                <input type="hidden"  name="kpjlh" value="<%=kpjlh%>">
                <input type="hidden"  name="deflbm" value="<%=deflbm%>">
                <input type="button"  value="����" onClick="f_do(editform)">
                <input type="button" onClick="f_pdpm(editform)"  value="ʩ�����ɵ�����">
                <%
if (!hdbz.equals("1"))
{
%> 
                <input type="button"  value="��ʵ�ص�" onClick="window.open('/sgdgl/yzfdzpd/hshd/EditCrm_khxx.jsp?khbh=<%=wherekhbh%>')">
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
                <input type="button"  value="��ӡ�ɹ���" onClick="window.open('/pdgl/pd/DyPdCrm_khxx.jsp?khbh=<%=wherekhbh%>')">              </td>
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
	if(	javaTrim(FormName.sgbz)=="") {
		alert("������[ʩ���೤]��");
		FormName.sgbz.focus();
		return false;
	}



	FormName.action="SaveEditDzpdCrm_khxx.jsp";
//	FormName.target="";
	FormName.submit();
	return true;
}

function f_pdpm(FormName)//����FormName:Form������
{
	FormName.action="PdPm.jsp?ssfgs=<%=ssfgs%>";
	FormName.target="_blank";
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


