<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
//�������,��ȡ����
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String fgs=request.getParameter("fgs");

	String wheresql="";
	String ls_sql=null;
	if (!(fgs.equals("")))
	{
		wheresql+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
	}

	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>����ͳ�Ʊ�
  <BR>(ͳ��ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
      <table border="1" width="210%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="4%" rowspan="3">�ֹ�˾</td>
          <td  width="3%" rowspan="3">ǩԼ��</td>
          <td  width="5%" rowspan="3">ǩԼ��</td>
          <td colspan="9">δ��������</td>
          <td colspan="12" bgcolor="#FFFFCC">��ʩ�����أ�11+12+13+14֮�ͣ�(�Ǽǲ���ʱ)</td>
          <td colspan="4">���ڿ�������</td>
        </tr>
        <tr bgcolor="#CCCCCC"  align="center">
          <td colspan="2" bgcolor="#FFFFCC">����֮ǰδ��</td>
          <td colspan="2">����ǩ��δ��</td>
          <td width="3%" rowspan="2" bgcolor="#FFFFCC">5:һ���ڿ���</td>
          <td colspan="4">���ڿ�������</td>
          <td width="3%" rowspan="2" bgcolor="#FFFFCC">10�������¿�����</td>
          <td width="3%" rowspan="2" bgcolor="#FFFFCC">11������</td>
          <td width="3%" rowspan="2" bgcolor="#FFFFCC">12�����ι�������</td>
          <td width="3%" rowspan="2" bgcolor="#FFFFCC">13��������������</td>
          <td width="3%" rowspan="2" bgcolor="#FFFFCC">14���깤����</td>
          <td width="3%" rowspan="2" bgcolor="#FFFFCC">15���깤����һ��</td>
          <td width="3%" rowspan="2" bgcolor="#FFFFCC">16���깤����һ��</td>
          <td width="3%" rowspan="2" bgcolor="#FFFFCC">17��һ����Ԥ���깤</td>
          <td width="3%" rowspan="2" bgcolor="#FFFFCC">17���쳣</td>
          <td width="3%" rowspan="2" bgcolor="#FFFFCC">17��Ͷ��</td>
          <td width="3%" rowspan="2" bgcolor="#FFFFCC">17������</td>
          <td width="3%" rowspan="2" bgcolor="#FFFFCC">17��δ�����ڿ�</td>
          <td colspan="2">δ����</td>
          <td colspan="2">�ѽ���</td>
        </tr>
        <tr bgcolor="#CCCCCC"  align="center">
          <td width="3%" bgcolor="#FFFFCC">1:δ���׿�</td>
          <td width="3%" bgcolor="#FFFFCC">2:�ѽ��׿�</td>
          <td width="3%">3:δ���׿�</td>
          <td width="3%">4:�ѽ��׿�</td>
          <td width="3%">6:δ���׿�</td>
          <td width="3%">7:�ѽ��׿�</td>
          <td width="3%">8:����һ������</td>
          <td width="3%">9:����һ������</td>
          <td width="3%">18:��������</td>
          <td width="3%">19:���ڿ���</td>
          <td width="3%">20:��������</td>
          <td width="3%">21:���ڿ���</td>
        </tr>
<%
		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String fgsbh=null;
String fgsmc=null;

int qys=0;
double qye=0;

int wkg_bqzq_wjk=0;//δ�������أ�����֮ǰδ����δ���׿�
int wkg_bqzq_yjk=0;//δ�������أ�����֮ǰδ�����ѽ��׿�
int wkg_bqqd_wjk=0;//δ�������أ�����ǩ��δ����δ���׿�
int wkg_bqqd_yjk=0;//δ�������أ�����ǩ��δ�����ѽ��׿�

int wkg_yznkg=0;//δ�������أ�һ���ڿ���
int wkg_yqkg_wjk=0;//δ�������أ����ڿ������أ�δ���׿�
int wkg_yqkg_yjk=0;//δ�������أ����ڿ������أ��ѽ��׿�
int wkg_yqkg_yqyz=0;//δ�������أ����ڿ������أ�����һ������
int wkg_yqkg_yqyy=0;//δ�������أ����ڿ������أ�����һ������

int zsgd_bqxk=0;//��ʩ�����أ������¿�������
int zsgd_zszc=0;//��ʩ�����أ�����
int zsgd_ybgcyq=0;//��ʩ�����أ����ι�������
int zsgd_zqysyq=0;//��ʩ�����أ�������������
int zsgd_zsyq=0;//��ʩ�����أ��깤����
int zsgd_yqyz=0;//��ʩ�����أ�����1������
int zsgd_yqyy=0;//��ʩ�����أ�����1������
int zsgd_yznwg=0;//��ʩ�����أ�һ�����깤
int zsgd_yc=0;//��ʩ�����أ��쳣
int zsgd_ts=0;//��ʩ�����أ�Ͷ��
int zsgd_bx=0;//��ʩ�����أ�����
int zsgd_wjzqk=0;//��ʩ�����أ�δ�����ڿ�

int bqjg_wjs_zc=0;//���ڿ������أ�δ��ᣭ��������
int bqjg_wjs_yq=0;//���ڿ������أ�δ��ᣭ���ڿ���
int bqjg_wj_zc=0;//���ڿ������أ���ᣭ��������
int bqjg_wj_yq=0;//���ڿ������أ���ᣭ���ڿ���


int allqys=0;//��ǩԼ��
double allqye=0;//��ǩԼ��

int allwkg_bqzq_wjk=0;//δ�������أ�����֮ǰδ����δ���׿�
int allwkg_bqzq_yjk=0;//δ�������أ�����֮ǰδ�����ѽ��׿�
int allwkg_bqqd_wjk=0;//δ�������أ�����ǩ��δ����δ���׿�
int allwkg_bqqd_yjk=0;//δ�������أ�����ǩ��δ�����ѽ��׿�

int allwkg_yznkg=0;//δ�������أ�һ���ڿ���
int allwkg_yqkg_wjk=0;//δ�������أ����ڿ������أ�δ���׿�
int allwkg_yqkg_yjk=0;//δ�������أ����ڿ������أ��ѽ��׿�
int allwkg_yqkg_yqyz=0;//δ�������أ����ڿ������أ�����һ������
int allwkg_yqkg_yqyy=0;//δ�������أ����ڿ������أ�����һ������

int allzsgd_bqxk=0;//��ʩ�����أ������¿�������
int allzsgd_zszc=0;//��ʩ�����أ�����
int allzsgd_ybgcyq=0;//��ʩ�����أ����ι�������
int allzsgd_zqysyq=0;//��ʩ�����أ�������������
int allzsgd_zsyq=0;//��ʩ�����أ��깤����
int allzsgd_yqyz=0;//��ʩ�����أ�����1������
int allzsgd_yqyy=0;//��ʩ�����أ�����1������
int allzsgd_yznwg=0;//��ʩ�����أ�һ�����깤
int allzsgd_yc=0;//��ʩ�����أ��쳣
int allzsgd_ts=0;//��ʩ�����أ�Ͷ��
int allzsgd_bx=0;//��ʩ�����أ�����
int allzsgd_wjzqk=0;//��ʩ�����أ�δ�����ڿ�

int allbqjg_wjs_zc=0;//���ڿ������أ�δ��ᣭ��������
int allbqjg_wjs_yq=0;//���ڿ������أ�δ��ᣭ���ڿ���
int allbqjg_wj_zc=0;//���ڿ������أ���ᣭ��������
int allbqjg_wj_yq=0;//���ڿ������أ���ᣭ���ڿ���

try {
	conn=cf.getConnection();

	ls_sql="SELECT sq_dwxx.dwmc fgs,sq_dwxx.dwbh fgsbh ";
	ls_sql+=" FROM sq_dwxx ";
	ls_sql+=" where  dwlx='F0' and cxbz='N'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		fgsbh=rs.getString("fgsbh");
		fgsmc=rs.getString("fgs");

		//ǩԼ�� ǩԼ�� 
		ls_sql="select count(*) qye,sum(qye) qye";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' ";
		ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			qys=rs1.getInt(1);
			qye=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();
		
		allqys+=qys;
		allqye+=qye;

		//δ�������أ�����֮ǰδ����δ���׿�
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='1'";
		ls_sql+=" and qyrq<TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and (cwsfke<=100 OR cwsfke is null)";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			wkg_bqzq_wjk=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allwkg_bqzq_wjk+=wkg_bqzq_wjk;

		//δ�������أ�����֮ǰδ�����ѽ��׿�
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='1'";
		ls_sql+=" and qyrq<TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and cwsfke>100 ";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			wkg_bqzq_yjk=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allwkg_bqzq_yjk+=wkg_bqzq_yjk;

		//δ�������أ�����ǩ��δ����δ���׿�
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='1'";
		ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and (cwsfke<=100 OR cwsfke is null)";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			wkg_bqqd_wjk=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allwkg_bqqd_wjk+=wkg_bqqd_wjk;

		//δ�������أ�����ǩ��δ�����ѽ��׿�
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='1'";
		ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and cwsfke>100 ";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			wkg_bqqd_yjk=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allwkg_bqqd_yjk+=wkg_bqqd_yjk;

		//δ�������أ�һ���ڿ���
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='1'";
		ls_sql+=" and kgrq<=TRUNC(SYSDATE)+7";
		ls_sql+=" and kgrq>=TRUNC(SYSDATE)";
		ls_sql+=" and cwsfke>100 ";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			wkg_yznkg=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allwkg_yznkg+=wkg_yznkg;

		
		//δ�������أ����ڿ������أ�δ���׿�
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='1'";
		ls_sql+=" and TRUNC(SYSDATE)>kgrq";
		ls_sql+=" and (cwsfke<=100 OR cwsfke is null)";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			wkg_yqkg_wjk=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allwkg_yqkg_wjk+=wkg_yqkg_wjk;

		//δ�������أ����ڿ������أ��ѽ��׿�
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='1'";
		ls_sql+=" and TRUNC(SYSDATE)>kgrq";
		ls_sql+=" and cwsfke>100 ";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			wkg_yqkg_yjk=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allwkg_yqkg_yjk+=wkg_yqkg_yjk;

		//δ�������أ����ڿ������أ�����һ������
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='1'";
		ls_sql+=" and (TRUNC(SYSDATE)-kgrq)>7";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			wkg_yqkg_yqyz=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allwkg_yqkg_yqyz+=wkg_yqkg_yqyz;

		//δ�������أ����ڿ������أ�����һ������
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='1'";
		ls_sql+=" and (TRUNC(SYSDATE)-kgrq)>30";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			wkg_yqkg_yqyy=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allwkg_yqkg_yqyy+=wkg_yqkg_yqyy;





		//��ʩ�����أ������¿�������
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' ";
		ls_sql+=" and crm_khxx.gcjdbm in('2','3','6')";
		ls_sql+=" and sjkgrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and sjkgrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD') ";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zsgd_bqxk=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allzsgd_bqxk+=zsgd_bqxk;

		//��ʩ�����أ�����
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2'";
		ls_sql+=" and TRUNC(SYSDATE) <= jgrq+NVL(hzts,0) ";//δ�깤����
		//1��δ������2���ѿ�����3���������գ�4���깤��5���ͻ���᣻6�����ι������;7: ��ͬ�쳣��ֹ
		ls_sql+=" and ( ";
		ls_sql+="    (crm_khxx.gcjdbm in('2') and (TRUNC(SYSDATE) <= jhybgcrq  or jhybgcrq is null) ) ";
		ls_sql+=" OR (crm_khxx.gcjdbm in('6') and (TRUNC(SYSDATE) <= jhzqsj    or jhzqsj   is null) ) ";
		ls_sql+=" OR crm_khxx.gcjdbm in('3')";
		ls_sql+="     ) ";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zsgd_zszc=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzsgd_zszc+=zsgd_zszc;

		//��ʩ�����أ����ι�������
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm in('2')";
		//1��δ������2���ѿ�����3���������գ�4���깤��5���ͻ���᣻6�����ι������;7: ��ͬ�쳣��ֹ
		ls_sql+=" and TRUNC(SYSDATE) <= jgrq+NVL(hzts,0) ";//δ�깤����
		ls_sql+=" and TRUNC(SYSDATE) > jhybgcrq ";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zsgd_ybgcyq=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzsgd_ybgcyq+=zsgd_ybgcyq;

		//��ʩ�����أ�������������
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm in('6')";
		//1��δ������2���ѿ�����3���������գ�4���깤��5���ͻ���᣻6�����ι������;7: ��ͬ�쳣��ֹ
		ls_sql+=" and TRUNC(SYSDATE) <= jgrq+NVL(hzts,0) ";//δ�깤����
		ls_sql+=" and TRUNC(SYSDATE) > jhzqsj ";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zsgd_zqysyq=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzsgd_zqysyq+=zsgd_zqysyq;

		//��ʩ�����أ��깤����
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2'";
		ls_sql+=" and crm_khxx.gcjdbm in('2','3','6')";
		ls_sql+=" and TRUNC(SYSDATE) > jgrq+NVL(hzts,0) ";//Ŀǰ������
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zsgd_zsyq=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzsgd_zsyq+=zsgd_zsyq;

		//��ʩ�����أ�����1������
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2'";
		ls_sql+=" and crm_khxx.gcjdbm in('2','3','6')";
		ls_sql+=" and TRUNC(SYSDATE) > jgrq+NVL(hzts,0)+7 ";//Ŀǰ������
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zsgd_yqyz=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzsgd_yqyz+=zsgd_yqyz;

		//��ʩ�����أ�����1������
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2'";
		ls_sql+=" and crm_khxx.gcjdbm in('2','3','6')";
		ls_sql+=" and TRUNC(SYSDATE) > jgrq+NVL(hzts,0)+30 ";//Ŀǰ������
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zsgd_yqyy=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzsgd_yqyy+=zsgd_yqyy;

		//��ʩ�����أ�һ�����깤
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2'";
		ls_sql+=" and crm_khxx.gcjdbm in('2','3','6')";
		ls_sql+=" and jgrq+NVL(hzts,0)>=TRUNC(SYSDATE)";
		ls_sql+=" and jgrq+NVL(hzts,0)<=TRUNC(SYSDATE)+7";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zsgd_yznwg=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzsgd_yznwg+=zsgd_yznwg;

		//��ʩ�����أ��쳣
		ls_sql="select count(distinct crm_khxx.khbh)";
		ls_sql+=" from crm_khxx,crm_xmycgl";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.gcjdbm in('2','3','6')";
		ls_sql+=" and crm_khxx.khbh=crm_xmycgl.khbh";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zsgd_yc=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzsgd_yc+=zsgd_yc;

		//��ʩ�����أ�Ͷ��
		ls_sql="select count(distinct crm_khxx.khbh)";
		ls_sql+=" from crm_khxx,crm_tsjl";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.gcjdbm in('2','3','6')";
		ls_sql+=" and crm_khxx.khbh=crm_tsjl.khbh";
		ls_sql+=" and crm_tsjl.lx='1'";//1��Ͷ�ߣ�2������
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zsgd_ts=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzsgd_ts+=zsgd_ts;

		//��ʩ�����أ�����
		ls_sql="select count(distinct crm_khxx.khbh)";
		ls_sql+=" from crm_khxx,crm_tsjl";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.gcjdbm in('2','3','6')";
		ls_sql+=" and crm_khxx.khbh=crm_tsjl.khbh";
		ls_sql+=" and crm_tsjl.lx='2'";//1��Ͷ�ߣ�2������
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zsgd_bx=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzsgd_bx+=zsgd_bx;

		//��ʩ�����أ�δ�����ڿ�
		ls_sql="select count(distinct crm_khxx.khbh)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.gcjdbm='3'";
		//1��δ������2���ѿ�����3���������գ�4���깤��5���ͻ���᣻6�����ι������;7: ��ͬ�쳣��ֹ
		ls_sql+=" and cwsfke>100 and cwjzkfkcs=1";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zsgd_wjzqk=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzsgd_wjzqk+=zsgd_wjzqk;

		//���ڿ������أ�δ��ᣭ��������
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='4'";
		ls_sql+=" and sjjgrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq-kgrq <= jgrq-kgrq+NVL(hzts,0)";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			bqjg_wjs_zc=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allbqjg_wjs_zc+=bqjg_wjs_zc;

		//���ڿ������أ�δ��ᣭ���ڿ���
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='4'";
		ls_sql+=" and sjjgrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq-kgrq > jgrq-kgrq+NVL(hzts,0)";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			bqjg_wjs_yq=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allbqjg_wjs_yq+=bqjg_wjs_yq;

		//���ڿ������أ���ᣭ��������
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='5'";
		ls_sql+=" and sjjgrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq-kgrq <= jgrq-kgrq+NVL(hzts,0)";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			bqjg_wj_zc=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allbqjg_wj_zc+=bqjg_wj_zc;

		//���ڿ������أ���ᣭ���ڿ���
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='5'";
		ls_sql+=" and sjjgrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq-kgrq > jgrq-kgrq+NVL(hzts,0)";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			bqjg_wj_yq=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allbqjg_wj_yq+=bqjg_wj_yq;
%>
		<tr align="center">
          <td><%=fgsmc%></td>
          <td ><A HREF="Crm_khxxxQd.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=qys%></A></td>
          <td><%=cf.formatDouble((int)qye)%></td>
          <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxwkg_bqzq_wjk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=wkg_bqzq_wjk%></A></td>
          <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxwkg_bqzq_yjk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=wkg_bqzq_yjk%></A></td>
          <td align="right"><A HREF="Crm_khxxxwkg_bqqd_wjk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=wkg_bqqd_wjk%></A></td>
          <td align="right"><A HREF="Crm_khxxxwkg_bqqd_yjk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=wkg_bqqd_yjk%></A></td>
 
		  <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxwkg_yznkg.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=wkg_yznkg%></A></td>
		  <td align="right"><A HREF="Crm_khxxxwkg_yqkg_wjk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=wkg_yqkg_wjk%></A></td>
          <td align="right"><A HREF="Crm_khxxxwkg_yqkg_yjk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=wkg_yqkg_yjk%></A></td>
          <td align="right"><A HREF="Crm_khxxxwkg_yqkg_yqyz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=wkg_yqkg_yqyz%></A></td>
          <td align="right"><A HREF="Crm_khxxxwkg_yqkg_yqyy.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=wkg_yqkg_yqyy%></A></td>

          <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxzsgd_bqxk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zsgd_bqxk%></A></td>
          <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxzsgd_zszc.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zsgd_zszc%></A></td>
          <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxzsgd_ybgcyq.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zsgd_ybgcyq%></A></td>
          <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxzsgd_zqysyq.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zsgd_zqysyq%></A></td>
          <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxzsgd_zsyq.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zsgd_zsyq%></A></td>
          <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxzsgd_yqyz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zsgd_yqyz%></A></td>
          <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxzsgd_yqyy.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zsgd_yqyy%></A></td>
          <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxzsgd_yznwg.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zsgd_yznwg%></A></td>
          <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxzsgd_yc.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zsgd_yc%></A></td>
          <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxzsgd_ts.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zsgd_ts%></A></td>
          <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxzsgd_bx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zsgd_bx%></A></td>
          <td align="right" bgcolor="#FFFFCC"><A HREF="Crm_khxxxzsgd_wjzqk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zsgd_wjzqk%></A></td>

          <td align="right"><A HREF="Crm_khxxxbqjg_wjs_zc.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=bqjg_wjs_zc%></A></td>
          <td align="right"><A HREF="Crm_khxxxbqjg_wjs_yq.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=bqjg_wjs_yq%></A></td>
          <td align="right"><A HREF="Crm_khxxxbqjg_wj_zc.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=bqjg_wj_zc%></A></td>
          <td align="right"><A HREF="Crm_khxxxbqjg_wj_yq.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=bqjg_wj_yq%></A></td>
        </tr>
<%
	}
	ps.close();
	rs.close();
%>

        <tr align="center" >
          <td><font color=red><B>�ܼ�</B></font></td>
          <td><B><%=allqys%></B></td>
          <td><B><%=cf.formatDouble((int)allqye)%></B></td>
          <td bgcolor="#FFFFCC"><B><%=allwkg_bqzq_wjk%></B></td>
          <td bgcolor="#FFFFCC"><B><%=allwkg_bqzq_yjk%></B></td>
          <td><B><%=allwkg_bqqd_wjk%></B></td>
          <td><B><%=allwkg_bqqd_yjk%></B></td>
          <td bgcolor="#FFFFCC"><B><%=allwkg_yznkg%></B></td>
          <td><B><%=allwkg_yqkg_wjk%></B></td>
          <td><B><%=allwkg_yqkg_yjk%></B></td>
          <td><B><%=allwkg_yqkg_yqyz%></B></td>
          <td><B><%=allwkg_yqkg_yqyy%></B></td>

          <td bgcolor="#FFFFCC"><B><%=allzsgd_bqxk%></B></td>
          <td bgcolor="#FFFFCC"><B><%=allzsgd_zszc%></B></td>
          <td bgcolor="#FFFFCC"><B><%=allzsgd_ybgcyq%></B></td>
          <td bgcolor="#FFFFCC"><B><%=allzsgd_zqysyq%></B></td>
          <td bgcolor="#FFFFCC"><B><%=allzsgd_zsyq%></B></td>
          <td bgcolor="#FFFFCC"><B><%=allzsgd_yqyz%></B></td>
          <td bgcolor="#FFFFCC"><B><%=allzsgd_yqyy%></B></td>
          <td bgcolor="#FFFFCC"><B><%=allzsgd_yznwg%></B></td>
          <td bgcolor="#FFFFCC"><B><%=allzsgd_yc%></B></td>
          <td bgcolor="#FFFFCC"><B><%=allzsgd_ts%></B></td>
          <td bgcolor="#FFFFCC"><B><%=allzsgd_bx%></B></td>
          <td bgcolor="#FFFFCC"><B><%=allzsgd_wjzqk%></B></td>

          <td><B><%=allbqjg_wjs_zc%></B></td>
          <td><B><%=allbqjg_wjs_yq%></B></td>
          <td><B><%=allbqjg_wj_zc%></B></td>
          <td><B><%=allbqjg_wj_yq%></B></td>
        </tr>
        <tr align="center" >
          <td colspan="3"><font color=red><B>�� �� �� ��</B></font></td>
          <td colspan="9"><B><%=(allwkg_bqzq_wjk+allwkg_bqzq_yjk+allwkg_bqqd_wjk+allwkg_bqqd_yjk)%></B></td>

          <td colspan="12" bgcolor="#FFFFCC"><B><%=(allzsgd_zszc+allzsgd_ybgcyq+allzsgd_zqysyq+allzsgd_zsyq)%></B></td>

          <td colspan="4"><B><%=(allbqjg_wjs_zc+allbqjg_wjs_yq+allbqjg_wj_zc+allbqjg_wj_yq)%></B></td>
        </tr>

<%}
catch (Exception e) {
	out.print("��������: " + e);
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
</table>

&nbsp;<br>
˵����

<BR>������ָ��[<%=sjfw%>]--[<%=sjfw2%>]֮�䡣												
<BR>����֮ǰ��ָ��[<%=sjfw%>]֮ǰ��												
<BR>��ͬ���ڣ���ͬ��������ͬ������												
<BR>ʵ�ʹ��ڣ�ʵ�ʿ�����ʵ�ʿ������깤�� �� [<%=sjfw2%>]��ʵ�ʿ�����δ�깤����												
<BR>�Ϸ����ڣ���ͬ���ڣ����ڵ�������												
<BR>
1����[<%=sjfw%>]֮ǰǩ������δ�����ڿ												
<BR>
2����[<%=sjfw%>]֮ǰǩ�������ѽ����ڿ												
<BR>
3����[<%=sjfw%>]--[<%=sjfw2%>]֮��ǩ������δ�����ڿ 
<BR>
4����[<%=sjfw%>]--[<%=sjfw2%>]֮��ǩ�������ѽ����ڿ <BR>
5������ʱ��δ��������һ���ڿ�����
<BR>
6��Ŀǰ�ѳ�����ͬ����ʱ�䣬��δ�����ڿ
<BR>
7��Ŀǰ�ѳ�����ͬ����ʱ�䣬���ѽ����ڿ
<BR>
8���ѽ����ڿ��ͬ����ʱ���ѹ�һ�ܡ�
<BR>
9���ѽ����ڿ��ͬ����ʱ���ѹ�һ�¡�
<BR>
10����[<%=sjfw%>]--[<%=sjfw2%>]֮��ʵ�ʿ������� <BR>
11��δ���ڵ���ʩ���� <BR>
12���깤δ���ڣ������ι�������<BR>
13���깤δ���ڣ���������������<BR>
14�����깤���ڵ���ʩ���� <BR>
15�����ڳ���һ�ܵ���ʩ���� <BR>
16�����ڳ���һ�µ���ʩ���� <BR>
17��û�����ڣ�����ͬ�깤ʱ�䣬����һ�����깤���� <BR>
18����[<%=sjfw%>]--[<%=sjfw2%>]֮�俢����Ŀǰδ��ᣬ�������� <BR>
19����[<%=sjfw%>]--[<%=sjfw2%>]֮�俢����Ŀǰδ��ᣬ��������  <BR>
20��[<%=sjfw%>]--[<%=sjfw2%>]֮�俢����Ŀǰ��ᣬ�������� <BR>
21����[<%=sjfw%>]--[<%=sjfw2%>]֮�俢����Ŀǰ��ᣬ�������� <BR>
</body>
</html>
