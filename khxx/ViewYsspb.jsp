<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">

</head>


<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >
<CENTER >
  <B><font size="3">��ĿԤ��������</font></B>
</CENTER>

<%
String khbh=request.getParameter("khbh");

//�ͻ�������Ϣ
String khxm=null;
String hth=null;
String fwdz=null;
double fwmj=0;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
int sjgq=0;

//��ͬ��
double wdzgce=0;
double qye=0;
//������
double zqljzjx=0;
double zhljzjx=0;
double zqhtzcbj=0;
double zhhtzcbj=0;


double htjz=0;//��ͬ��ֵ
double sgcbj=0;//��ͬʩ���ɱ���
double mle=0;//��ͬë����
double mll=0;//���̺�ͬë����

double zxhtjz=0;//���º�ͬ��ֵ
double zxsgcbj=0;//����ʩ���ɱ���
double zxmle=0;//����ë����
double zxmll=0;//��������ë����

double zchtje=0;//���ĺ�ͬ���۶�
double zchtcb=0;//���ĺ�ͬ�ɱ�
double zchtml=0;//���ĺ�ͬë��

double zczxje=0;//�����������۶�
double zczxcb=0;//�������³ɱ�
double zczxml=0;//��������ë��


double rfxszb=0;//�˸�����ռ��
double zcxszb=0;//��������ռ��

double rfcbzb=0;//�˸��ɱ�ռ��
double zccbzb=0;//���ĳɱ�ռ��

double rflrzb=0;//�˸�����ռ��
double zclrzb=0;//��������ռ��


//ˮ�粿��
double sdxse=0;//ˮ�粿�����۶�
double sdcbe=0;//ˮ�粿�ֳɱ���
double sdxszb=0;//ˮ�粿������ռ��
double sdcbzb=0;//ˮ�粿�ֳɱ�ռ��
double sdlrzb=0;//ˮ�粿������ռ��


//��������
double sxzcxse=0;//�����������۶�
double sxzccbe=0;//�������ĳɱ���
double sxzcxszb=0;//������������ռ��
double sxzccbzb=0;//�������ĳɱ�ռ��
double sxzclrzb=0;//������������ռ��

//��������
double jczcxse=0;//�����������۶�
double jczccbe=0;//�������ĳɱ���
double jczcxszb=0;//������������ռ��
double jczccbzb=0;//�������ĳɱ�ռ��
double jczclrzb=0;//������������ռ��

//���º˼�
double sdhjxse=0;//���º˼����۶�
double sdhjxszb=0;//���º˼�����ռ��

//˰��
double allsuijin=0;

//��˾�Żݽ��
double gsyhje=0;
//����������
double gclrv=0;
//ë����
double gcmll=0;
//ʵ��ë����
double gcsjmll=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();



	ls_sql="SELECT khxm,hth,fwdz,fwmj,kgrq,jgrq,sjkgrq,sjjgrq,jgrq-kgrq sjgq ";
	ls_sql+=" ,wdzgce,qye,zqljzjx,zhljzjx,zqhtzcbj,zhhtzcbj";
	ls_sql+=" FROM crm_khxx ";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		//�ͻ�������Ϣ
		khxm=rs.getString("khxm");
		hth=cf.fillHtml(rs.getString("hth"));
		fwdz=rs.getString("fwdz");
		fwmj=rs.getDouble("fwmj");


		kgrq=cf.fillHtml(rs.getDate("kgrq"));
		jgrq=cf.fillHtml(rs.getDate("jgrq"));
		sjkgrq=cf.fillHtml(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillHtml(rs.getDate("sjjgrq"));
		sjgq=rs.getInt("sjgq");

		//��ͬ��
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		zqljzjx=rs.getDouble("zqljzjx");
		zhljzjx=rs.getDouble("zhljzjx");
		zhljzjx=rs.getDouble("zhljzjx");
		zqhtzcbj=rs.getDouble("zqhtzcbj");
		zhhtzcbj=rs.getDouble("zhhtzcbj");

	}
	rs.close();
	ps.close();

	String fjtcbz="";
	ls_sql="select fjtcbz";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fjtcbz=cf.fillNull(rs.getString("fjtcbz"));
	}
	rs.close();
	ps.close();

	if (fjtcbz==null || !fjtcbz.equals("Y"))
	{
		out.println("<P><B><font color=\"#FF0000\" size=\"5\">���ѣ��ͻ�δ���۸���ˣ�ë������ȷ</font></B><P>");

	}


	htjz=0;//��ͬ��ֵ
	sgcbj=0;//��ͬʩ���ɱ���
	mle=0;//��ͬë����
	mll=0;//���̺�ͬë����

	zxhtjz=0;//���º�ͬ��ֵ
	zxsgcbj=0;//����ʩ���ɱ���
	zxmle=0;//����ë����
	zxmll=0;//��������ë����

	zchtje=0;//���ĺ�ͬ���۶�
	zchtcb=0;//���ĺ�ͬ�ɱ�
	zchtml=0;//���ĺ�ͬë��

	zczxje=0;//�����������۶�
	zczxcb=0;//�������³ɱ�
	zczxml=0;//��������ë��


	ls_sql=" SELECT  ";
	ls_sql+="  htjz,sgcbj,mle,mll";//����
	ls_sql+=" ,zxhtjz,zxsgcbj,zxmle,zxmll";

	ls_sql+=" ,zchtje,zchtcb,zchtml";//����
	ls_sql+=" ,zczxje,zczxcb,zczxml";
	
	ls_sql+=" FROM crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		htjz=rs.getDouble("htjz");
		sgcbj=rs.getDouble("sgcbj");
		mle=rs.getDouble("mle");
		mll=rs.getDouble("mll");

		zxhtjz=rs.getDouble("zxhtjz");
		zxsgcbj=rs.getDouble("zxsgcbj");
		zxmle=rs.getDouble("zxmle");
		zxmll=rs.getDouble("zxmll");

//		zchtje=rs.getDouble("zchtje");
//		zchtcb=rs.getDouble("zchtcb");
		zchtml=rs.getDouble("zchtml");

		zczxje=rs.getDouble("zczxje");
		zczxcb=rs.getDouble("zczxcb");
		zczxml=rs.getDouble("zczxml");
	}
	rs.close();
	ps.close();


	//����
	double allzcje=0;
	double allzccb=0;
	ls_sql="SELECT  sum(je+ycf+qtfyje),sum(cbj*sl)";
	ls_sql+=" FROM bj_khzcmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		allzcje=rs.getDouble(1);
		allzccb=rs.getDouble(2);
	}
	rs.close();
	ps.close();


	//���������ѽ��
	double zcqtfje=0;
	ls_sql="SELECT sum(sfje)";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and sfxmlx in('4','7','8')";//8����˾������˰��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcqtfje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//���������ѳɱ�
	double zcqtfcb=0;
	ls_sql="SELECT sum(zqsfje*sgcbjbfb/100)";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and sfxmlx in('4','7','8')";//8����˾������˰��
	ls_sql+=" and sfcysgdjs='Y' ";
	ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�;3:������
	//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹����ѣ�6������˰��7����˾�����Ĺ����ѣ�8����˾������˰��A���Թ����Ĺ����ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcqtfcb+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(sfje*sgcbjbfb/100)";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and sfxmlx in('4','7','8')";//8����˾������˰��
	ls_sql+=" and sfcysgdjs='Y' ";
	ls_sql+=" and cbjjsfs='2' ";//1:��ǰ;2:�ۺ�;3:������
	//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹����ѣ�6������˰��7����˾�����Ĺ����ѣ�8����˾������˰��A���Թ����Ĺ����ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcqtfcb+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	zchtje=cf.round(allzcje+zcqtfje,2);
	zchtcb=cf.round(allzccb+zcqtfcb,2);

	//�˸�����ռ��
	if (qye+zchtje!=0)
	{
		rfxszb=cf.round(qye*100/(qye+zchtje),2);
	}
	else {
		rfxszb=0;
	}

	//��������ռ��
	if (qye+zchtje!=0)
	{
		zcxszb=cf.round(zchtje*100/(qye+zchtje),2);
	}
	else {
		zcxszb=0;
	}

	//�˸��ɱ�ռ��
	if (sgcbj+zchtcb!=0)
	{
		rfcbzb=cf.round(sgcbj*100/(sgcbj+zchtcb),2);
	}
	else {
		rfcbzb=0;
	}

	//���ĳɱ�ռ��
	if (sgcbj+zchtcb!=0)
	{
		zccbzb=cf.round(zchtcb*100/(sgcbj+zchtcb),2);
	}
	else {
		zccbzb=0;
	}

	//�˸�����ռ��
	if (((qye+zchtje)-(sgcbj+zchtcb))!=0)
	{
		rflrzb=cf.round((qye-sgcbj)*100/((qye+zchtje)-(sgcbj+zchtcb)),2);
	}
	else {
		rflrzb=0;
	}

	//��������ռ��
	if (((qye+zchtje)-(sgcbj+zchtcb))!=0)
	{
		zclrzb=cf.round((zchtje-zchtcb)*100/((qye+zchtje)-(sgcbj+zchtcb)),2);
	}
	else {
		zclrzb=0;
	}

	//ˮ�粿��
	
	sdxse=0;//ˮ�粿�����۶�
	sdcbe=0;//ˮ�粿�ֳɱ���
	ls_sql="SELECT sum(sfje),sum(ROUND(zqsfje*sgcbjbfb/100,2))";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
	ls_sql+=" and sfxmlx in('D','E')";//D��ˮ��·��E��ˮ��·Ԥ��
	ls_sql+=" and sfjrqye='1'";//1�����룻2��������
	ls_sql+=" and cbjjsfs='1' ";//1:��ǰ;2:�ۺ�;3:������
	ls_sql+=" and sfcysgdjs='Y' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sdxse=rs.getDouble(1);
		sdcbe=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(sfje),sum(ROUND(sfje*sgcbjbfb/100,2))";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and sfjrqye='1'";//1�����룻2��������
	ls_sql+=" and cbjjsfs='2' ";//1:��ǰ;2:�ۺ�;3:������
	ls_sql+=" and sfcysgdjs='Y' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sdxse+=rs.getDouble(1);
		sdcbe+=rs.getDouble(2);
	}
	rs.close();
	ps.close();


	ls_sql="SELECT sum(round(bj_gclmx.sl*bj_bjxmmx.dj,2)),sum(round(bj_gclmx.sl*bj_bjxmmx.sgcbj,2))";
	ls_sql+=" FROM bj_bjxmmx,bj_gclmx";
	ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
	ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	ls_sql+=" and xmflbm='01'";//01��ˮ�粿��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sdxse+=rs.getDouble(1);
		sdcbe+=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	sdxse=cf.round(sdxse,2);
	sdcbe=cf.round(sdcbe,2);

	sdxszb=0;//ˮ�粿������ռ��
	if (qye+zchtje!=0)
	{
		sdxszb=cf.round(sdxse*100/(qye+zchtje),2);
	}
	else {
		sdxszb=0;
	}

	sdcbzb=0;//ˮ�粿�ֳɱ�ռ��
	if (sgcbj+zchtcb!=0)
	{
		sdcbzb=cf.round(sdcbe*100/(sgcbj+zchtcb),2);
	}
	else {
		sdcbzb=0;
	}

	sdlrzb=0;//ˮ�粿������ռ��
	if (((qye+zchtje)-(sgcbj+zchtcb))!=0)
	{
		sdlrzb=cf.round((sdxse-sdcbe)*100/((qye+zchtje)-(sgcbj+zchtcb)),2);
	}
	else {
		sdlrzb=0;
	}


	//��������
	sxzcxse=0;//�����������۶�
	sxzccbe=0;//�������ĳɱ���
	ls_sql="SELECT  sum(je+ycf+qtfyje),sum(cbj*sl)";
	ls_sql+=" FROM bj_khzcmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and zcdlbm='���²�Ʒ'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sxzcxse=rs.getDouble(1);
		sxzccbe=rs.getDouble(2);
	}
	rs.close();
	ps.close();


	//��������������
	double sxzcqtf=0;
	double sxzcqtcb=0;
	if (allzcje!=0)
	{
		sxzcqtf=zcqtfje*(sxzcxse/allzcje);
		sxzcqtcb=zcqtfcb*(sxzcxse/allzcje);
	}

	sxzcxse=cf.round(sxzcxse+sxzcqtf,2);
	sxzccbe=cf.round(sxzccbe+sxzcqtcb,2);



	sxzcxszb=0;//������������ռ��
	if (qye+zchtje!=0)
	{
		sxzcxszb=cf.round(sxzcxse*100/(qye+zchtje),2);
	}
	else {
		sxzcxszb=0;
	}

	sxzccbzb=0;//�������ĳɱ�ռ��
	if (sgcbj+zchtcb!=0)
	{
		sxzccbzb=cf.round(sxzccbe*100/(sgcbj+zchtcb),2);
	}
	else {
		sxzccbzb=0;
	}

	sxzclrzb=0;//������������ռ��
	if (((qye+zchtje)-(sgcbj+zchtcb))!=0)
	{
		sxzclrzb=cf.round((sxzcxse-sxzccbe)*100/((qye+zchtje)-(sgcbj+zchtcb)),2);
	}
	else {
		sxzclrzb=0;
	}

	//��������
	jczcxse=0;//�����������۶�
	jczcxse=cf.round(zchtje-sxzcxse,2);

	jczccbe=0;//�������ĳɱ���
	jczccbe=cf.round(zchtcb-sxzccbe,2);

	jczcxszb=0;//������������ռ��
	if (qye+zchtje!=0)
	{
		jczcxszb=cf.round(jczcxse*100/(qye+zchtje),2);
	}
	else {
		jczcxszb=0;
	}

	jczccbzb=0;//�������ĳɱ�ռ��
	if (sgcbj+zchtcb!=0)
	{
		jczccbzb=cf.round(jczccbe*100/(sgcbj+zchtcb),2);
	}
	else {
		jczccbzb=0;
	}

	jczclrzb=0;//������������ռ��
	if (((qye+zchtje)-(sgcbj+zchtcb))!=0)
	{
		jczclrzb=cf.round((jczcxse-jczccbe)*100/((qye+zchtje)-(sgcbj+zchtcb)),2);
	}
	else {
		jczclrzb=0;
	}


	//���º˼�
	sdhjxse=0;//���º˼����۶�
	ls_sql="SELECT sum(-1*sfje) ";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and sfxmmc like '%���²�Ʒ�ⰲװ��%'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sdhjxse=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	sdhjxszb=0;//���º˼�����ռ��
	if (qye+zchtje!=0)
	{
		sdhjxszb=cf.round(sdhjxse*100/(qye+zchtje),2);
	}
	else {
		sdhjxszb=0;
	}


	ls_sql="SELECT sum(sfje)";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and sfxmlx in('6','8')";//8����˾������˰��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		allsuijin=rs.getDouble(1);
	}
	rs.close();
	ps.close();



	double zcyh=0;//�����Ż�
	ls_sql="SELECT sum(zqje-je)";
	ls_sql+=" FROM bj_khzcmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcyh=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(zqsfje-sfje)";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and sfxmlx in('4','7','8')";//4����˾�����ļ�ӷ�;7����˾�����Ĺ�����;8����˾������˰��
	ls_sql+=" and sfxmmc not like '%�����Ż�%'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcyh+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(-1*sfje) ";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and sfxmmc like '%�����Ż�%'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcyh+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//��˾�Żݽ��=�˸��ۿ۶�+�˸�����+�����Ż�+���¼���
	gsyhje=(wdzgce-qye)+zcyh;
	gsyhje=cf.round(gsyhje,2);

	//����������=����ͬ�ܶ�-��ͬ�ɱ���/��ͬ�ܶ�
	if ((qye+zchtje)!=0)
	{
		gclrv=((qye+zchtje)-(sgcbj+zchtcb))*100/(qye+zchtje);
	}
	else{
		gclrv=0;
	}
	gclrv=cf.round(gclrv,2);

	//ë����=����ͬ�ܶ�-��ͬ�ɱ���/��ͬ�ܶ�-3.477%
	if ((qye+zchtje)!=0)
	{
		gcmll=((qye+zchtje)-(sgcbj+zchtcb))*100/(qye+zchtje)-3.477;
	}
	else{
		gcmll=0;
	}
	gcmll=cf.round(gcmll,2);

	//ʵ��ë����=����ͬ�ܶ�-��ͬ�ܶ�*3.477%)-��ͬ�ɱ���/��ͬ�ܶ�-10%
	if ((qye+zchtje)!=0)
	{
		gcsjmll=((qye+zchtje)-(qye+zchtje)*0.03477-(sgcbj+zchtcb))*100/(qye+zchtje)-10;
	}
	else{
		gcsjmll=0;
	}

	gcsjmll=cf.round(gcsjmll,2);

	


}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
		<tr bgcolor="#FFFFFF" >
		  <td width="36%">��Ŀ���ƣ�<%=fwdz%></td>
		  <td width="37%">����������O����<%=fwmj%></td>
		  <td width="27%">���ڣ�<%=sjgq%>��</td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="19%" rowspan="2">Ԥ��ָ��</td>

	<td colspan="2">����</td>
	<td colspan="2">�ɱ�</td>
	<td colspan="3">����</td>
	<td>&nbsp;</td>
  </tr>



<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">�ܽ�Ԫ��</td>
	<td  width="7%">ռ���ۺ�ͬ�ܶ��%</td>
	<td  width="10%">�ܽ�Ԫ��</td>
	<td  width="7%">ռ�ɱ��ܶ��%</td>
	<td  width="10%">��λָ��   ��Ԫ/�O��</td>
	<td  width="10%">�ܽ�Ԫ��</td>
	<td  width="7%">ռ����ٷֱ�</td>
	<td  width="20%">��ע</td>
  </tr>




		<tr bgcolor="#FFFFFF"  align="center" >
          <td>�ϼ�</td>
		  <td><%=cf.round(qye+zchtje,2)%></td>
		  <td>100%</td>
		  <td><%=cf.round(sgcbj+zchtcb,2)%></td>
		  <td>100%</td>
		  <td><%=cf.round(((qye+zchtje)-(sgcbj+zchtcb))/fwmj,2)%></td>
		  <td><%=cf.round((qye+zchtje)-(sgcbj+zchtcb),2)%></td>
		  <td>100%</td>
		  <td>&nbsp;</td>
  </tr>
		<tr bgcolor="#FFFFFF"  align="center" >
          <td>�˹�����С��</td>
		  <td><%=qye%></td>
		  <td><%=rfxszb%>%</td>
		  <td><%=sgcbj%></td>
		  <td><%=rfcbzb%>%</td>
		  <td><%=cf.round((qye-sgcbj)/fwmj,2)%></td>
		  <td><%=cf.round(qye-sgcbj,2)%></td>
		  <td><%=rflrzb%>%</td>
		  <td>&nbsp;</td>
  </tr>
		<tr bgcolor="#FFFFFF"  align="center" >
          <td> ���У�ˮ�粿��</td>
		  <td><%=sdxse%></td>
		  <td><%=sdxszb%>%</td>
		  <td><%=sdcbe%></td>
		  <td><%=sdcbzb%>%</td>
		  <td><%=cf.round((sdxse-sdcbe)/fwmj,2)%></td>
		  <td><%=cf.round(sdxse-sdcbe,2)%></td>
		  <td><%=sdlrzb%>%</td>
		  <td>&nbsp;</td>
  </tr>
		<tr bgcolor="#FFFFFF"  align="center" >
		  <td>���ķ�С��</td>
		  <td><%=zchtje%></td>
		  <td><%=zcxszb%>%</td>
		  <td><%=zchtcb%></td>
		  <td><%=zccbzb%>%</td>
		  <td><%=cf.round((zchtje-zchtcb)/fwmj,2)%></td>
		  <td><%=cf.round(zchtje-zchtcb,2)%></td>
		  <td><%=zclrzb%>%</td>
		  <td>&nbsp;</td>
  </tr>
		<tr bgcolor="#FFFFFF"  align="center" >
		  <td>���вɹ�����</td>
		  <td><%=jczcxse%></td>
		  <td><%=jczcxszb%>%</td>
		  <td><%=jczccbe%></td>
		  <td><%=jczccbzb%>%</td>
		  <td><%=cf.round((jczcxse-jczccbe)/fwmj,2)%></td>
		  <td><%=cf.round(jczcxse-jczccbe,2)%></td>
		  <td><%=jczclrzb%>%</td>
		  <td>&nbsp;</td>
  </tr>
		<tr bgcolor="#FFFFFF"  align="center" >
		  <td>��������</td>
		  <td><%=sxzcxse%></td>
		  <td><%=sxzcxszb%>%</td>
		  <td><%=sxzccbe%></td>
		  <td><%=sxzccbzb%>%</td>
		  <td><%=cf.round((sxzcxse-sxzccbe)/fwmj,2)%></td>
		  <td><%=cf.round(sxzcxse-sxzccbe,2)%></td>
		  <td><%=sxzclrzb%>%</td>
		  <td>&nbsp;</td>
  </tr>
		<tr bgcolor="#FFFFFF"  align="center" >
		  <td>˰���˸�+���ģ�*3.477%</td>
		  <td><%=allsuijin%></td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
  </tr>
		<tr bgcolor="#FFFFFF"  align="center" >
		  <td>�˼����²�Ʒ��˰��</td>
		  <td><%=sdhjxse%></td>
		  <td><%=sdhjxszb%>%</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF"  >
  <td height="24" colspan="9">Ԥ��ָ�����˵��</td>
  </tr>
<tr bgcolor="#FFFFFF"  align="center" >
  <td align="center">��˾�Żݽ��</td>
  <td colspan="8" align="left"><%=gsyhje%></td>
  </tr>
<tr bgcolor="#FFFFFF"  align="center" >
  <td align="center">���������ʣ���31%��</td>
  <td colspan="8" align="left"><%=gclrv%>%</td>
</tr>
<tr bgcolor="#FFFFFF"  align="center" >
  <td align="center">ë���ʣ���˰��3.477%��</td>
  <td colspan="8" align="left"><%=gcmll%>%</td>
</tr>
<tr bgcolor="#FFFFFF"  align="center" >
  <td align="center">ʵ��ë���ʣ�����Ч10%��</td>
  <td colspan="8" align="left"><%=gcsjmll%>%</td>
</tr>
<tr bgcolor="#FFFFFF"  align="center" >
  <td>&nbsp;</td>
  <td colspan="8">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF"  align="center" >
  <td>&nbsp;</td>
  <td colspan="8">&nbsp;</td>
</tr>
</table>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#FFFFFF"  align="center" >
  <td width="20%" height="30">Ԥ��Ա��</td>
  <td width="20%"> �곤��</td>
  <td width="20%"> �ֹܻ�ƣ�</td>
  <td width="20%"> �����ܣ�</td>
  <td width="20%">�ܾ�����</td>
  </tr>
</table>
</body>
</html>