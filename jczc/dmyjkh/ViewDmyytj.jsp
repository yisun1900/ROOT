<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<%
String dwbh=request.getParameter("dwbh");
String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

String dwmc=null;
String dwdz=null;
String dwfzr=null;
String kdsj=null;
String ssfwmc=null;
String dwjbmc=null;
String dmxsmc=null;
String dwdh=null;



double khcz=0;
double mbcz=0;
double wccz=0;
int qdgs=0;
double yczdcl=0;
double mbczdcl=0;
int pjde=0;
double sqdj=0;
double ljdj=0;
int wjdjqds=0;
double scbcz=0;
double zdmczbl=0;
int scbgds=0;
int scbcds=0;
double scbcdbl=0;
int scbpjde=0;
int kllzs=0;
double scbkllb=0;
double scbqdsb=0;
int dmzrs=0;
int bzrysl=0;
int xzsl=0;
int sjrysl=0;
int sjsrjcz=0;
int wcdbrs=0;
double sjsdcl=0;
int lczrs=0;
double lczrrbl=0;
double zrsjscz=0;
double zrscbcz=0;
double zrsjsdj=0;
int zrsjsrs=0;
int zrsjsqds=0;
double zdmczb=0;
double zscbczb=0;
double zdmdjb=0;
double zzrsb=0;
double zzqdsb=0;
int zrsjspjde=0;
double zrsjssjf=0;
int zrsjsmj=0;
double zsjfzsrb=0;
int zrsjspmsjf=0;
int zrrjcz=0;
double sjfsr=0;
int sqsjfds=0;
int sqsjfmj=0;
int pjmhsjf=0;
double sjfzqdsb=0;
int pjpmsjf=0;
double spxse=0;
double zycpxse=0;
int wckhrysl=0;
int wczcz=0;
int wczmj=0;
double ytb=0;
double yhb=0;
int pfmhtzj=0;
double cyczyg=0;
double cydjyg=0;
double scbcyczyg=0;
String byczsm=null;
String cyczsm=null;
String fzyj=null;
String lrr=null;


try {
	conn=cf.getConnection();

	ls_sql=" SELECT dwmc,dwdz,dwfzr,kdsj,ssfwmc,dwjbmc,dmxsmc,dwdh,bzrs";
	ls_sql+=" FROM sq_dwxx,dm_ssfw,dm_dwjb,dm_dmxs  ";
	ls_sql+=" where sq_dwxx.dwbh='"+dwbh+"'";
    ls_sql+=" and sq_dwxx.ssfw=dm_ssfw.ssfw(+) and sq_dwxx.dwjb=dm_dwjb.dwjb(+) and sq_dwxx.dmxs=dm_dmxs.dmxs(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwmc=cf.fillHtml(rs.getString("dwmc"));
		dwdz=cf.fillHtml(rs.getString("dwdz"));
		dwfzr=cf.fillHtml(rs.getString("dwfzr"));
		kdsj=cf.fillHtml(rs.getDate("kdsj"));
		ssfwmc=cf.fillHtml(rs.getString("ssfwmc"));
		dwjbmc=cf.fillHtml(rs.getString("dwjbmc"));
		dmxsmc=cf.fillHtml(rs.getString("dmxsmc"));
		dwdh=cf.fillHtml(rs.getString("dwdh"));
		bzrysl=rs.getInt("bzrs");
	}
	rs.close();
	ps.close();



	//���¿��˲�ֵ
	ls_sql=" SELECT sum(khcz)";
	ls_sql+=" FROM cw_dmkhcz";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ls_sql+=" and nian>='"+sjfw.substring(0,4)+"' and yue>='"+sjfw.substring(5,7)+"'";
	ls_sql+=" and nian<='"+sjfw2.substring(0,4)+"' and yue<='"+sjfw2.substring(5,7)+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khcz=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	//Ŀ���ֵ
	ls_sql=" SELECT sum(mbcz)";
	ls_sql+=" FROM cw_dmkhcz";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ls_sql+=" and nian>='"+sjfw.substring(0,4)+"' and yue>='"+sjfw.substring(5,7)+"'";
	ls_sql+=" and nian<='"+sjfw2.substring(0,4)+"' and yue<='"+sjfw2.substring(5,7)+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		mbcz=rs.getDouble(1);
	}
	rs.close();
	ps.close();

/*
*/
	//������ɲ�ֵ
	//��������
	ls_sql=" SELECT count(*),sum(qye),sum(fwmj)";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qdgs=rs.getInt(1);
		wccz=rs.getDouble(2);
		wczmj=rs.getInt(3);
	}
	rs.close();
	ps.close();


	//���˲�ֵ�����
	if (khcz!=0)
	{
		yczdcl=wccz*100.0/khcz;
	}
	else{
		yczdcl=0;
	}
	yczdcl=cf.doubleTrim(yczdcl);

	//Ŀ���ֵ�����
	if (mbcz!=0)
	{
		mbczdcl=wccz*100.0/mbcz;
	}
	else{
		mbczdcl=0;
	}
	mbczdcl=cf.doubleTrim(mbczdcl);

	//ƽ������
	if (qdgs!=0)
	{
		pjde=(int)wccz/qdgs;
	}
	else{
		pjde=0;
	}

	//������ȡ����
	ls_sql=" SELECT sum(fkje)";
	ls_sql+=" FROM cw_khfkjl";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ls_sql+=" and scbz='N' and fklxbm='51'";
	ls_sql+=" and sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sqdj=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	//�����ۼƶ���
	ls_sql=" SELECT sum(hddj)";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where zxdm='"+dwbh+"'";
	ls_sql+=" and zxzt not in('2','3','4')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ljdj=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	//δ������ǩ����
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_khxx,crm_zxkhxx";
	ls_sql+=" where crm_khxx.khbh=crm_zxkhxx.khbh and crm_khxx.dwbh='"+dwbh+"'";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=" and crm_zxkhxx.hddjbz='N'";
	ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wjdjqds=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//�г�����ֵ
	//�ɵ�����
	ls_sql=" SELECT count(*),sum(qye)";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ls_sql+=" and crm_khxx.zt='2' and ywy is not null";
	ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		scbcds=rs.getInt(1);
		scbcz=rs.getDouble(2);
	}
	rs.close();
	ps.close();
	//�г�����������
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where zxdm='"+dwbh+"' and ywy is not null";
	ls_sql+=" and lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		scbgds=rs.getInt(1);
	}
	rs.close();
	ps.close();
	//����������
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where zxdm='"+dwbh+"'";
	ls_sql+=" and lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kllzs=rs.getInt(1);
	}
	rs.close();
	ps.close();
	//ռ�����ֵ����
	if (wccz!=0)
	{
		zdmczbl=scbcz*100.0/wccz;
	}
	else{
		zdmczbl=0;
	}
	zdmczbl=cf.doubleTrim(zdmczbl);
	//�ɵ�����
	if (scbgds!=0)
	{
		scbcdbl=scbcds*100.0/scbgds;
	}
	else{
		scbcdbl=0;
	}
	scbcdbl=cf.doubleTrim(scbcdbl);
	//�г���ƽ������
	if (scbcds!=0)
	{
		scbpjde=(int)scbcz/scbcds;
	}
	else{
		scbpjde=0;
	}

	//�г���ռ��������
	if (kllzs!=0)
	{
		scbkllb=scbgds*100.0/kllzs;
	}
	else{
		scbkllb=0;
	}
	scbkllb=cf.doubleTrim(scbkllb);
	//ռ��ǩ������
	if (qdgs!=0)
	{
		scbqdsb=scbcds*100.0/qdgs;
	}
	else{
		scbqdsb=0;
	}
	scbqdsb=cf.doubleTrim(scbqdsb);
	//����������
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ls_sql+=" and sfzszg in('Y','N')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dmzrs=rs.getInt(1);
	}
	rs.close();
	ps.close();
	//С������
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where ssdw='"+dwbh+"'";
	ls_sql+=" and dwlx='F3' and cxbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xzsl=rs.getInt(1);
	}
	rs.close();
	ps.close();
	//�����Ա����
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ls_sql+=" and zwbm='04'";
	ls_sql+=" and sfzszg in('Y','N')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjrysl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//���ֵ��Ա��
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ls_sql+=" and zwbm='04'";
	ls_sql+=" and sfzszg in('Y','N')";

	ls_sql+=" and yhmc not in(";

	ls_sql+=" SELECT distinct sjs";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

	ls_sql+=" )";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lczrs=rs.getInt(1);
	}
	rs.close();
	ps.close();
	//���ʦ�˾���ֵ
	if (sjrysl!=0)
	{
		sjsrjcz=(int)wccz/sjrysl;
	}
	else{
		sjsrjcz=0;
	}
	//���ֵ��Ա����
	if (sjrysl!=0)
	{
		lczrrbl=lczrs*100.0/sjrysl;
	}
	else{
		lczrrbl=0;
	}
	lczrrbl=cf.doubleTrim(lczrrbl);

	//�������ʦǩ����
	//�������ʦ��ֵ
	ls_sql=" SELECT count(*),sum(qye)";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

	ls_sql+=" and sjs in(";

	ls_sql+=" SELECT yhmc";
	ls_sql+=" FROM sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ls_sql+=" and zwbm='04'";
	ls_sql+=" and sfzszg in('Y','N')";
	ls_sql+=" and sjsjb in('00','01')";

	ls_sql+=" )";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zrsjsqds=rs.getInt(1);
		zrsjscz=rs.getDouble(2);
	}
	rs.close();
	ps.close();
	//�����г�����ֵ
	ls_sql=" SELECT sum(qye)";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

	ls_sql+=" and ywy in(";

	ls_sql+=" SELECT yhmc";
	ls_sql+=" FROM sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ls_sql+=" and zwbm='19'";
	ls_sql+=" and sfzszg in('Y','N')";
	ls_sql+=" and sjsjb in('00','01')";

	ls_sql+=" )";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zrscbcz=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	//�������ʦ��ȡ����
	ls_sql=" SELECT sum(fkje)";
	ls_sql+=" FROM cw_khfkjl";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ls_sql+=" and scbz='N' and fklxbm='51'";
	ls_sql+=" and sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

	ls_sql+=" and sjs in(";

	ls_sql+=" SELECT yhmc";
	ls_sql+=" FROM sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ls_sql+=" and zwbm='04'";
	ls_sql+=" and sfzszg in('Y','N')";
	ls_sql+=" and sjsjb in('00','01')";

	ls_sql+=" )";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zrsjsdj=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	//�������ʦ����
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ls_sql+=" and zwbm='04'";
	ls_sql+=" and sfzszg in('Y','N')";
	ls_sql+=" and sjsjb in('00','01')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zrsjsrs=rs.getInt(1);
	}
	rs.close();
	ps.close();
	//����Ʒ����
	ls_sql=" SELECT sum(fwmj)";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

	ls_sql+=" and sjf>0";

	ls_sql+=" and sjs in(";

	ls_sql+=" SELECT yhmc";
	ls_sql+=" FROM sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ls_sql+=" and zwbm='04'";
	ls_sql+=" and sfzszg in('Y','N')";
	ls_sql+=" and sjsjb in('00','01')";

	ls_sql+=" )";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zrsjsmj=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//������Ʒ�����
	ls_sql=" SELECT sum(sjf)";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

	ls_sql+=" and sjs in(";

	ls_sql+=" SELECT yhmc";
	ls_sql+=" FROM sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ls_sql+=" and zwbm='04'";
	ls_sql+=" and sfzszg in('Y','N')";
	ls_sql+=" and sjsjb in('00','01')";

	ls_sql+=" )";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zrsjssjf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//������Ʒ�����
	//��ȡ��Ʒѵ���
	//����ȡ��Ʒ����
	ls_sql=" SELECT count(*),sum(sjf),sum(fwmj)";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and sjf>0";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sqsjfds=rs.getInt(1);
		sjfsr=rs.getDouble(2);
		sqsjfmj=rs.getInt(3);
	}
	rs.close();
	ps.close();



	//ռ�����ֵ����
	if (wccz!=0)
	{
		zdmczb=zrsjscz*100.0/wccz;
	}
	else{
		zdmczb=0;
	}
	zdmczb=cf.doubleTrim(zdmczb);
	//ռ�г�����ֵ����
	if (scbcz!=0)
	{
		zscbczb=zrscbcz*100.0/scbcz;
	}
	else{
		zscbczb=0;
	}
	zscbczb=cf.doubleTrim(zscbczb);
	//ռ���涨�����
	if (sqdj!=0)
	{
		zdmdjb=zrsjsdj*100.0/sqdj;
	}
	else{
		zdmdjb=0;
	}
	zdmdjb=cf.doubleTrim(zdmdjb);
	//ռ����������
	if (dmzrs!=0)
	{
		zzrsb=zrsjsrs*100.0/dmzrs;
	}
	else{
		zzrsb=0;
	}
	zzrsb=cf.doubleTrim(zzrsb);
	//ռ��ǩ��������
	if (qdgs!=0)
	{
		zzqdsb=zrsjsqds*100.0/qdgs;
	}
	else{
		zzqdsb=0;
	}
	zzqdsb=cf.doubleTrim(zzqdsb);
	//ƽ������
	if (zrsjsqds!=0)
	{
		zrsjspjde=(int)zrsjscz/zrsjsqds;
	}
	else{
		zrsjspjde=0;
	}
	//ռ��Ʒ��������
	if (sjfsr!=0)
	{
		zsjfzsrb=zrsjssjf*100.0/sjfsr;
	}
	else{
		zsjfzsrb=0;
	}
	zsjfzsrb=cf.doubleTrim(zsjfzsrb);
	//�������ʦƽ��ÿƽ����Ʒ�
	if (zrsjsmj!=0)
	{
		zrsjspmsjf=(int)zrsjssjf/zrsjsmj;
	}
	else{
		zrsjspmsjf=0;
	}
	//�������ʦ�˾���ֵ
	if (zrsjsrs!=0)
	{
		zrrjcz=(int)zrsjscz/zrsjsrs;
	}
	else{
		zrrjcz=0;
	}


	//ƽ��ÿ����Ʒ�
	if (sqsjfds!=0)
	{
		pjmhsjf=(int)sjfsr/sqsjfds;
	}
	else{
		pjmhsjf=0;
	}
	//ռ��ǩ��������
	if (qdgs!=0)
	{
		sjfzqdsb=sqsjfds*100.0/qdgs;
	}
	else{
		sjfzqdsb=0;
	}
	sjfzqdsb=cf.doubleTrim(sjfzqdsb);
	//ƽ��ÿƽ����Ʒ�
	if (sqsjfmj!=0)
	{
		pjpmsjf=(int)sjfsr/sqsjfmj;
	}
	else{
		pjpmsjf=0;
	}
	//ƽ���׺�ͬ���
	if (wczmj!=0)
	{
		pfmhtzj=(int)wccz/wczmj;
	}
	else{
		pfmhtzj=0;
	}
%>

<form method="post" action="SaveInsertCw_dmkhjl.jsp" name="insertform" >


<CENTER >
  <B>��������Ӫͳ��</B><BR>
    <b>(ͳ��ʱ�䣺<%=sjfw%>-------<%=sjfw2%>)</b>
    <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
      <tr  align="center"> 
        <td colspan="6" bgcolor="#CCCCCC">�������</td>
      </tr>
      <tr> 
        <td align="right" width="17%"><b>��������</b></td>
        <td width="17%"><%=dwmc%></td>
        <td width="16%" align="right"><b>�����ַ</b></td>
        <td colspan="3"><%=dwdz%></td>
      </tr>
      <tr> 
        <td align="right" width="17%"><b>���漶��</b></td>
        <td width="17%"><%=dwjbmc%></td>
        <td width="16%" align="right"><b>���渺����</b></td>
        <td width="17%"><%=dwfzr%></td>
        <td width="17%" align="right"><b>����绰</b></td>
        <td width="16%"><%=dwdh%></td>
      </tr>
      <tr> 
        <td align="right" width="17%"><b>������ʽ</b></td>
        <td width="17%"><%=dmxsmc%></td>
        <td width="16%" align="right"><b>����ʱ��</b></td>
        <td width="17%"><%=kdsj%></td>
        <td width="17%" align="right"><b>������λ</b></td>
        <td width="16%"><%=ssfwmc%></td>
      </tr>
      <tr> 
        <td align="center" colspan="6" height="24" bgcolor="#CCCCCC"><b>���ݷ���ͳ��</b></td>
      </tr>
      <tr> 
        <td align="right" width="17%">���¿��˲�ֵ</td>
        <td width="17%"> 
          <input type="text" name="khcz" size="15" maxlength="17"  value="<%=khcz%>" >
        </td>
        <td width="16%" align="right">�г�����ֵ</td>
        <td width="17%"> 
          <input type="text" name="scbcz" size="15" maxlength="17"  value="<%=scbcz%>" >
        </td>
        <td width="17%" align="right">����������</td>
        <td width="16%"> 
          <input type="text" name="dmzrs" size="15" maxlength="8"  value="<%=dmzrs%>" >
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%">����Ŀ���ֵ</td>
        <td width="17%">
          <input type="text" name="mbcz" size="15" maxlength="17"  value="<%=mbcz%>" >
        </td>
        <td width="16%" align="right"><font color="#0000CC">ռ�����ֵ����</font></td>
        <td width="17%"> 
          <input type="text" name="zdmczbl" size="15" maxlength="9"  value="<%=zdmczbl%>" >
        </td>
        <td width="17%" align="right">��׼��Ա����</td>
        <td width="16%"> 
          <input type="text" name="bzrysl" size="15" maxlength="8"  value="<%=bzrysl%>" >
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%">������ɲ�ֵ</td>
        <td width="17%"> 
          <input type="text" name="wccz" size="15" maxlength="17"  value="<%=wccz%>" >
        </td>
        <td width="16%" align="right">�г�����������</td>
        <td width="17%"> 
          <input type="text" name="scbgds" size="15" maxlength="8"  value="<%=scbgds%>" >
        </td>
        <td width="17%" align="right">С������</td>
        <td width="16%"> 
          <input type="text" name="xzsl" size="15" maxlength="8"  value="<%=xzsl%>" >
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#0000CC">�²�ֵ�����</font></td>
        <td width="17%"> 
          <input type="text" name="yczdcl" size="15" maxlength="9"  value="<%=yczdcl%>" >
        </td>
        <td width="16%" align="right">�ɵ�����</td>
        <td width="17%"> 
          <input type="text" name="scbcds" size="15" maxlength="8"  value="<%=scbcds%>" >
        </td>
        <td width="17%" align="right">�����Ա����</td>
        <td width="16%"> 
          <input type="text" name="sjrysl" size="15" maxlength="8"  value="<%=sjrysl%>" >
        </td>
      </tr>
      <tr>
        <td align="right" width="17%"><font color="#0000CC">Ŀ���ֵ�����</font></td>
        <td width="17%">
          <input type="text" name="mbczdcl" size="15" maxlength="9"  value="<%=mbczdcl%>" >
        </td>
        <td width="16%" align="right">&nbsp;</td>
        <td width="17%">&nbsp;</td>
        <td width="17%" align="right">&nbsp;</td>
        <td width="16%">&nbsp;</td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#0000CC">ƽ������</font></td>
        <td width="17%"> 
          <input type="text" name="pjde" size="15" maxlength="8"  value="<%=pjde%>" >
        </td>
        <td width="16%" align="right"><font color="#0000CC">�ɵ�����</font></td>
        <td width="17%"> 
          <input type="text" name="scbcdbl" size="15" maxlength="9"  value="<%=scbcdbl%>" >
        </td>
        <td width="17%" align="right"><font color="#0000CC">���ʦ�˾���ֵ</font></td>
        <td width="16%"> 
          <input type="text" name="sjsrjcz" size="15" maxlength="8"  value="<%=sjsrjcz%>" >
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%">ǩ������</td>
        <td width="17%"> 
          <input type="text" name="qdgs" size="15" maxlength="8"  value="<%=qdgs%>" >
        </td>
        <td width="16%" align="right"><font color="#0000CC">�г���ƽ������</font></td>
        <td width="17%"> 
          <input type="text" name="scbpjde" size="15" maxlength="8"  value="<%=scbpjde%>" >
        </td>
        <td width="17%" align="right"><font color="#FF0033">*</font>��ɴ������</td>
        <td width="16%"> 
          <input type="text" name="wcdbrs" size="15" maxlength="8"  value="<%=wcdbrs%>"  onChange="js(insertform)">
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%">������ȡ����</td>
        <td width="17%"> 
          <input type="text" name="sqdj" size="15" maxlength="17"  value="<%=sqdj%>" >
        </td>
        <td width="16%" align="right">����������</td>
        <td width="17%"> 
          <input type="text" name="kllzs" size="15" maxlength="8"  value="<%=kllzs%>" >
        </td>
        <td width="17%" align="right"><font color="#0000CC">�����</font></td>
        <td width="16%"> 
          <input type="text" name="sjsdcl" size="15" maxlength="9"  value="<%=sjsdcl%>" >
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%">�����ۼƶ���</td>
        <td width="17%"> 
          <input type="text" name="ljdj" size="15" maxlength="17"  value="<%=ljdj%>" >
        </td>
        <td width="16%" align="right"><font color="#0000CC">�г���ռ��������</font></td>
        <td width="17%"> 
          <input type="text" name="scbkllb" size="15" maxlength="9"  value="<%=scbkllb%>" >
        </td>
        <td width="17%" align="right">���ֵ��Ա��</td>
        <td width="16%"> 
          <input type="text" name="lczrs" size="15" maxlength="8"  value="<%=lczrs%>" >
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%">δ������ǩ����</td>
        <td width="17%"> 
          <input type="text" name="wjdjqds" size="15" maxlength="8"  value="<%=wjdjqds%>" >
        </td>
        <td width="16%" align="right"><font color="#0000CC">ռ��ǩ������</font></td>
        <td width="17%"> 
          <input type="text" name="scbqdsb" size="15" maxlength="9"  value="<%=scbqdsb%>" >
        </td>
        <td width="17%" align="right"><font color="#0000CC">���ֵ��Ա����</font></td>
        <td width="16%"> 
          <input type="text" name="lczrrbl" size="15" maxlength="9"  value="<%=lczrrbl%>" >
        </td>
      </tr>
      <tr  align="center"> 
        <td align="center" colspan="6" height="24" bgcolor="#CCCCCC"><b>���μ����μ��������ʦ����ͳ��</b></td>
      </tr>
      <tr> 
        <td align="right" width="17%">�������ʦ��ֵ</td>
        <td width="17%"> 
          <input type="text" name="zrsjscz" size="15" maxlength="17"  value="<%=zrsjscz%>" >
        </td>
        <td width="16%" align="right"><font color="#0000CC">ռ�����ֵ����</font></td>
        <td width="17%"> 
          <input type="text" name="zdmczb" size="15" maxlength="9"  value="<%=zdmczb%>" >
        </td>
        <td width="17%" align="right"><font color="#0000CC">ƽ������</font></td>
        <td width="16%"> 
          <input type="text" name="zrsjspjde" size="15" maxlength="8"  value="<%=zrsjspjde%>" >
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%">�����г�����ֵ</td>
        <td width="17%"> 
          <input type="text" name="zrscbcz" size="15" maxlength="17"  value="<%=zrscbcz%>" >
        </td>
        <td width="16%" align="right"><font color="#0000CC">ռ�г�����ֵ����</font></td>
        <td width="17%"> 
          <input type="text" name="zscbczb" size="15" maxlength="9"  value="<%=zscbczb%>" >
        </td>
        <td width="17%" align="right">������Ʒ�����</td>
        <td width="16%"> 
          <input type="text" name="zsjfzsrb" size="15" maxlength="9"  value="<%=zsjfzsrb%>" >
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%">�������ʦ��ȡ����</td>
        <td width="17%"> 
          <input type="text" name="zrsjsdj" size="15" maxlength="17"  value="<%=zrsjsdj%>" >
        </td>
        <td width="16%" align="right"><font color="#0000CC">ռ���涨�����</font></td>
        <td width="17%"> 
          <input type="text" name="zdmdjb" size="15" maxlength="9"  value="<%=zdmdjb%>" >
        </td>
        <td width="17%" align="right"><font color="#0000CC">ռ��Ʒ��������</font></td>
        <td width="16%"> 
          <input type="text" name="zrsjsmj" size="15" maxlength="8"  value="<%=zrsjsmj%>" >
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%">�������ʦ����</td>
        <td width="17%"> 
          <input type="text" name="zrsjsrs" size="15" maxlength="8"  value="<%=zrsjsrs%>" >
        </td>
        <td width="16%" align="right"><font color="#0000CC">ռ����������</font></td>
        <td width="17%"> 
          <input type="text" name="zzrsb" size="15" maxlength="9"  value="<%=zzrsb%>" >
        </td>
        <td width="17%" align="right"><font color="#0000CC">ƽ��ÿƽ����Ʒ�</font></td>
        <td width="16%"> 
          <input type="text" name="zrsjspmsjf" size="15" maxlength="8"  value="<%=zrsjspmsjf%>" >
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%">�������ʦǩ����</td>
        <td width="17%"> 
          <input type="text" name="zrsjsqds" size="15" maxlength="8"  value="<%=zrsjsqds%>" >
        </td>
        <td width="16%" align="right"><font color="#0000CC">ռ��ǩ��������</font></td>
        <td width="17%"> 
          <input type="text" name="zzqdsb" size="15" maxlength="9"  value="<%=zzqdsb%>" >
        </td>
        <td width="17%" align="right"><font color="#0000CC">�������ʦ�˾���ֵ</font></td>
        <td width="16%"> 
          <input type="text" name="zrrjcz" size="15" maxlength="8"  value="<%=zrrjcz%>" >
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%">����Ʒ����</td>
        <td width="17%"> 
          <input type="text" name="zrsjssjf" size="15" maxlength="17"  value="<%=zrsjssjf%>" >
        </td>
        <td width="16%" align="right">&nbsp;</td>
        <td width="17%">&nbsp;</td>
        <td width="17%" align="right">&nbsp;</td>
        <td width="16%">&nbsp; </td>
      </tr>
      <tr> 
        <td align="center" colspan="6" height="24" bgcolor="#CCCCCC"><b>��Ʒѷ���ͳ��</b></td>
      </tr>
      <tr> 
        <td align="right" width="17%">������Ʒ�����</td>
        <td width="17%"> 
          <input type="text" name="sjfsr" size="15" maxlength="17"  value="<%=sjfsr%>" >
        </td>
        <td width="16%" align="right">��ȡ��Ʒѵ���</td>
        <td width="17%"> 
          <input type="text" name="sqsjfds" size="15" maxlength="8"  value="<%=sqsjfds%>" >
        </td>
        <td width="17%" align="right">����ȡ��Ʒ����</td>
        <td width="16%"> 
          <input type="text" name="sqsjfmj" size="15" maxlength="8"  value="<%=sqsjfmj%>" >
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#0000CC">ƽ��ÿ����Ʒ�</font></td>
        <td width="17%"> 
          <input type="text" name="pjmhsjf" size="15" maxlength="8"  value="<%=pjmhsjf%>" >
        </td>
        <td width="16%" align="right"><font color="#0000CC">ռ��ǩ��������</font></td>
        <td width="17%"> 
          <input type="text" name="sjfzqdsb" size="15" maxlength="9"  value="<%=sjfzqdsb%>" >
        </td>
        <td width="17%" align="right"><font color="#0000CC">ƽ��ÿƽ����Ʒ�</font></td>
        <td width="16%"> 
          <input type="text" name="pjpmsjf" size="15" maxlength="8"  value="<%=pjpmsjf%>" >
        </td>
      </tr>
      <tr> 
        <td align="center" colspan="6" height="24" bgcolor="#CCCCCC"><b>5S��Ʒ�����в�Ʒ����</b></td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#FF0033">*</font>5S��Ʒ���۽��</td>
        <td width="17%"> 
          <input type="text" name="spxse" size="15" maxlength="17"  value="<%=spxse%>" >
        </td>
        <td width="16%" align="right"><font color="#FF0033">*</font>���в�Ʒ���۽��</td>
        <td width="17%"> 
          <input type="text" name="zycpxse" size="15" maxlength="17"  value="<%=zycpxse%>" >
        </td>
        <td width="17%" align="right"><font color="#FF0033">*</font>��ɿ�����Ա����</td>
        <td width="16%"> 
          <input type="text" name="wckhrysl" size="15" maxlength="8"  value="<%=wckhrysl%>" >
        </td>
      </tr>
      <tr> 
        <td align="center" colspan="6" height="24" bgcolor="#CCCCCC"><b>���ܷ���</b></td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#FF0033">*</font>����ܲ�ֵ</td>
        <td width="17%"> 
          <input type="text" name="wczcz" size="15" maxlength="8"  value="<%=wczcz%>" >
        </td>
        <td width="16%" align="right">��������</td>
        <td width="17%"> 
          <input type="text" name="wczmj" size="15" maxlength="8"  value="<%=wczmj%>" >
        </td>
        <td width="17%" align="right"><font color="#0000CC">ƽ���׺�ͬ���</font></td>
        <td width="16%"> 
          <input type="text" name="pfmhtzj" size="15" maxlength="8"  value="<%=pfmhtzj%>" >
        </td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#FF0033">*</font>��ͬ��</td>
        <td width="17%"> 
          <input type="text" name="ytb" size="15" maxlength="9"  value="<%=ytb%>" >
        </td>
        <td width="16%" align="right"><font color="#FF0033">*</font>�»���</td>
        <td width="17%"> 
          <input type="text" name="yhb" size="15" maxlength="9"  value="<%=yhb%>" >
        </td>
        <td width="17%" align="center">&nbsp;</td>
        <td width="16%">&nbsp;</td>
      </tr>
      <tr> 
        <td align="center" colspan="6" height="24" bgcolor="#CCCCCC"><b>����Ԥ�����</b></td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#FF0033">*</font>���²�ֵԤ��</td>
        <td width="17%"> 
          <input type="text" name="cyczyg" size="15" maxlength="17"  value="<%=cyczyg%>" >
        </td>
        <td width="16%" align="right"><font color="#FF0033">*</font>���¶���Ԥ��</td>
        <td width="17%"> 
          <input type="text" name="cydjyg" size="15" maxlength="17"  value="<%=cydjyg%>" >
        </td>
        <td width="17%" align="right"><font color="#FF0033">*</font>�г������²�ֵԤ��</td>
        <td width="16%"> 
          <input type="text" name="scbcyczyg" size="15" maxlength="17"  value="<%=scbcyczyg%>" >
        </td>
      </tr>
    </table>
</CENTER >
</form>
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

