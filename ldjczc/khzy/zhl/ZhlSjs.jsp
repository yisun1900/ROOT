<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='170108'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[ת����ͳ�ƣ����ʦ]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'����[ת����ͳ�ƣ����ʦ]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);
	}
%>


<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgs=cf.fillNull(request.getParameter("fgs"));
String dwbh=cf.fillNull(request.getParameter("dwbh"));
String sjs=cf.GB2Uni(request.getParameter("sjs"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<CENTER >
  <B>ת����ͳ�ƣ����ʦ</B><BR>
  <b>(ʱ�䷶Χ��<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="230%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="2%" rowspan="2" >���</td>
  <td  width="4%" rowspan="2" >���ʦ</td>


  <td colspan="11" >�����ͻ�</td>
  <td colspan="11" >�ۼƿͻ�</td>
  <td colspan="2" >ǩ���ͻ�</td>
  </tr>
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="4%" >�¿ͻ���</td>
  <td  width="4%" >��ƶ�����</td>
  <td  width="4%" >��ƶ���ת����</td>
  <td  width="4%" >��ƽ��ͼ��</td>
  <td  width="4%" >ƽ��ͼת����</td>
  <td  width="4%" >��ʩ��ͼ��</td>
  <td  width="4%" >ʩ��ͼת����</td>
  <td  width="4%" >ǩ����</td>
  <td  width="4%" >ǩ��ת����</td>
  <td  width="4%" >�ɵ���</td>
  <td  width="3%" >�ɵ���</td>

  <td  width="4%" >������</td>
  <td  width="4%" >��ƶ�����</td>
  <td  width="4%" >��ƶ���ת����</td>
  <td  width="4%" >��ƽ��ͼ��</td>
  <td  width="4%" >ƽ��ͼת����</td>
  <td  width="4%" >��ʩ��ͼ��</td>
  <td  width="4%" >ʩ��ͼת����</td>
  <td  width="4%" >ǩ����</td>
  <td  width="4%" >ǩ��ת����</td>
  <td  width="4%" >�ɵ���</td>
  <td  width="3%" >�ɵ���</td>

  <td  width="4%" >��ʩ������</td>
  <td  width="4%" >����������</td>


  </tr>
<%

int row=0;

//�¿ͻ���
int newkhs_zj=0;
//��ƶ���
int newdjkhs_zj=0;
//��ƽ��ͼ
int newctkhs_zj=0;
//��ͼ��
double newctl_zj=0;
//��ʩ��ͼ
int newsgtkhs_zj=0;
//ǩ����
int newqdkhs_zj=0;
//ǩ����
double newqdl_zj=0;
//�ɵ���
int newfdkhs_zj=0;


//������
int ljkhs_zj=0;
//��ƶ���
int ljdjkhs_zj=0;
//��ƽ��ͼ
int ljctkhs_zj=0;
//��ͼ��
double ljctl_zj=0;
//��ʩ��ͼ
int ljsgtkhs_zj=0;
//ǩ����
int ljqdkhs_zj=0;
//ǩ����
double ljqdl_zj=0;
//�ɵ���
int ljfdkhs_zj=0;

//��ʩ������
int zsgdkhs_zj=0;
//����������
int wkgkhs_zj=0;


String fgsbh=null;
String fgsmc=null;
String getdwbh=null;
String dmmc=null;

ls_sql =" SELECT b.dwmc fgsmc,sq_dwxx.dwbh,sq_dwxx.dwmc,sq_dwxx.ssfgs";
ls_sql+=" FROM sq_dwxx,sq_dwxx b";
ls_sql+=" where  sq_dwxx.ssfgs=b.dwbh(+) and sq_dwxx.dwlx='F2'";
if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
{
	ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
}
else
{
	ls_sql+=" and sq_dwxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
}
if (!(fgs.equals("")))
{
	ls_sql+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
}

if (!(dwbh.equals("")))
{
	ls_sql+=" and  sq_dwxx.dwbh='"+dwbh+"'";
}
if (!(sjs.equals("")))	
{
	ls_sql+=" and  sq_dwxx.dwbh in(select dwbh from sq_yhxx where yhmc='"+sjs+"' and zwbm in('04','23') and sfzszg in('Y','N'))";
}
ls_sql+=" and (sq_dwxx.cxbz='N' or sq_dwxx.gdsj+62>SYSDATE)";
ls_sql+=" order by sq_dwxx.ssfgs,sq_dwxx.dwbh";
ps= conn.prepareStatement(ls_sql);
rs =ps.executeQuery();
while (rs.next())
{
	fgsmc=rs.getString("fgsmc");
	getdwbh=rs.getString("dwbh");
	dmmc=rs.getString("dwmc");
	fgsbh=rs.getString("ssfgs");

	//�¿ͻ���
	int newkhs_xj=0;
	//��ƶ���
	int newdjkhs_xj=0;
	//��ƽ��ͼ
	int newctkhs_xj=0;
	//��ʩ��ͼ
	int newsgtkhs_xj=0;
	//ǩ����
	int newqdkhs_xj=0;
	//�ɵ���
	int newfdkhs_xj=0;



	//������
	int ljkhs_xj=0;
	//��ƶ���
	int ljdjkhs_xj=0;
	//��ƽ��ͼ
	int ljctkhs_xj=0;
	//��ʩ��ͼ
	int ljsgtkhs_xj=0;
	//ǩ����
	int ljqdkhs_xj=0;
	//�ɵ���
	int ljfdkhs_xj=0;

	//��ʩ������
	int zsgdkhs_xj=0;
	//����������
	int wkgkhs_xj=0;

	String yhmc=null;
	ls_sql =" select yhmc";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where dwbh='"+getdwbh+"'";
	ls_sql+=" and zwbm in('04','23')";
	ls_sql+=" and sfzszg in('Y','N')";
	if (!(sjs.equals("")))	
	{
		ls_sql+=" and yhmc='"+sjs+"'";
	}
	ls_sql+=" order by yhmc";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		yhmc=rs2.getString("yhmc");


		//�¿ͻ���
		int newkhs=0;
		ls_sql="select count(*) ";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.sjs='"+yhmc+"'";
		ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y����Ч��Ϣ��N����Ч��Ϣ
		ls_sql+=" and crm_zxkhxx.zxzt!='6'";//6��ɢ��
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			newkhs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		//��ƶ���
		int newdjkhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.sjs='"+yhmc+"'";
		ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y����Ч��Ϣ��N����Ч��Ϣ
		ls_sql+=" and crm_zxkhxx.zxzt!='6'";//6��ɢ��

		ls_sql+=" and ( crm_zxkhxx.lfdj>0 OR crm_zxkhxx.hddj>0 OR crm_zxkhxx.sjf>0)";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			newdjkhs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();


		//��ƶ���ת����
		double newdjl=0;
		if (newkhs!=0)
		{
			newdjl=cf.round(newdjkhs*100.0/newkhs,2);
		}


		//��ƽ��ͼ
		int newctkhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.sjs='"+yhmc+"'";
		ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y����Ч��Ϣ��N����Ч��Ϣ
		ls_sql+=" and crm_zxkhxx.zxzt!='6'";//6��ɢ��

		ls_sql+=" and crm_zxkhxx.ctbz='Y'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			newctkhs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		//��ͼ��
		double newctl=0;
		if (newkhs!=0)
		{
			newctl=cf.round(newctkhs*100.0/newkhs,2);
		}


		//��ʩ��ͼ
		int newsgtkhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.sjs='"+yhmc+"'";
		ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y����Ч��Ϣ��N����Ч��Ϣ
		ls_sql+=" and crm_zxkhxx.zxzt!='6'";//6��ɢ��

		ls_sql+=" and crm_zxkhxx.csgtbz='Y'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			newsgtkhs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		//��ʩ��ͼ��
		double newsgtl=0;
		if (newkhs!=0)
		{
			newsgtl=cf.round(newsgtkhs*100.0/newkhs,2);
		}


		//�ɵ���
		int newfdkhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.sjs='"+yhmc+"'";
		ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y����Ч��Ϣ��N����Ч��Ϣ
		ls_sql+=" and crm_zxkhxx.zxzt!='6'";//6��ɢ��

		ls_sql+=" and crm_zxkhxx.zxzt in('2','4')";//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ����6��ɢ��
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			newfdkhs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		//�ɵ�����
		double newfdl=0;
		if (newkhs!=0)
		{
			newfdl=cf.round(newfdkhs*100.0/newkhs,2);
		}

		//ǩ����
		int newqdkhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.sjs='"+yhmc+"'";
		ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y����Ч��Ϣ��N����Ч��Ϣ
		ls_sql+=" and crm_zxkhxx.zxzt!='6'";//6��ɢ��

		ls_sql+=" and crm_zxkhxx.zxzt='3'";//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ����6��ɢ��
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			newqdkhs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		
		//ǩ����
		double newqdl=0;
		if (newkhs!=0)
		{
			newqdl=cf.round(newqdkhs*100.0/newkhs,2);
		}


////////////////////////////////////////////////////////�ۼƿͻ�
		//������
		int ljkhs=0;
		ls_sql="select count(*) ";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.sjs='"+yhmc+"'";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y����Ч��Ϣ��N����Ч��Ϣ
		ls_sql+=" and crm_zxkhxx.zxzt not in('2','3','4','6')";//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ����6��ɢ��
		
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ljkhs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		//��ƶ���
		int ljdjkhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.sjs='"+yhmc+"'";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y����Ч��Ϣ��N����Ч��Ϣ
		ls_sql+=" and crm_zxkhxx.zxzt not in('2','3','4','6')";//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ����6��ɢ��

		ls_sql+=" and ( crm_zxkhxx.lfdj>0 OR crm_zxkhxx.hddj>0 OR crm_zxkhxx.sjf>0)";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ljdjkhs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();




		//��ƽ��ͼ
		int ljctkhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.sjs='"+yhmc+"'";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y����Ч��Ϣ��N����Ч��Ϣ
		ls_sql+=" and crm_zxkhxx.zxzt not in('2','3','4','6')";//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ����6��ɢ��

		ls_sql+=" and crm_zxkhxx.ctbz='Y'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ljctkhs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();


		//��ʩ��ͼ
		int ljsgtkhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.sjs='"+yhmc+"'";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y����Ч��Ϣ��N����Ч��Ϣ
		ls_sql+=" and crm_zxkhxx.zxzt not in('2','3','4','6')";//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ����6��ɢ��

		ls_sql+=" and crm_zxkhxx.csgtbz='Y'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ljsgtkhs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();


		//ǩ����
		int ljqdkhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=" and crm_khxx.sjs='"+yhmc+"'";

		ls_sql+=" and crm_khxx.zt='2'";//2����װ�ͻ���3���˵��ͻ���4�����ɿͻ���5����ƿͻ���6��ɢ��
		
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.sfke>0";

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ljqdkhs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		


		//�ɵ���
		int ljfdkhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.sjs='"+yhmc+"'";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y����Ч��Ϣ��N����Ч��Ϣ

		ls_sql+=" and crm_zxkhxx.zxzt in('2','4')";//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ����6��ɢ��
		
		ls_sql+=" and crm_zxkhxx.sbsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.sbsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ljfdkhs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();


		//��ʩ������
		int zsgdkhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=" and crm_khxx.sjs='"+yhmc+"'";

		ls_sql+=" and crm_khxx.zt='2'";//2����װ�ͻ���3���˵��ͻ���4�����ɿͻ���5����ƿͻ���6��ɢ��
		ls_sql+=" and crm_khxx.gcjdbm in('2','6','3')";//1��δ������2�����̿�����6�����ι�����ɣ�3���������գ�4�������깤��5��������᣻7����ͬ�쳣��ֹ
		

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zsgdkhs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		//����������
		int wkgkhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=" and crm_khxx.sjs='"+yhmc+"'";

		ls_sql+=" and crm_khxx.zt='2'";//2����װ�ͻ���3���˵��ͻ���4�����ɿͻ���5����ƿͻ���6��ɢ��
		ls_sql+=" and crm_khxx.gcjdbm in('1')";//1��δ������2�����̿�����6�����ι�����ɣ�3���������գ�4�������깤��5��������᣻7����ͬ�쳣��ֹ
		

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			wkgkhs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		//��ƶ���ת����
		double ljdjl=0;
		if (ljkhs!=0)
		{
			ljdjl=cf.round(ljdjkhs*100.0/ljkhs,2);
		}
		//��ͼ��
		double ljctl=0;
		if (ljkhs!=0)
		{
			ljctl=cf.round(ljctkhs*100.0/ljkhs,2);
		}
		//��ʩ��ͼ��
		double ljsgtl=0;
		if (ljkhs!=0)
		{
			ljsgtl=cf.round(ljsgtkhs*100.0/ljkhs,2);
		}
		//�ɵ�����
		double ljfdl=0;
		if (ljkhs!=0)
		{
			ljfdl=cf.round(ljfdkhs*100.0/ljkhs,2);
		}
		//ǩ����
		double ljqdl=0;
		if (ljkhs!=0)
		{
			ljqdl=cf.round(ljqdkhs*100.0/ljkhs,2);
		}
////////////////////////С��
		//�¿ͻ���
		newkhs_xj+=newkhs;
		//��ƶ���
		newdjkhs_xj+=newdjkhs;
		//��ƽ��ͼ
		newctkhs_xj+=newctkhs;
		//��ʩ��ͼ
		newsgtkhs_xj+=newsgtkhs;
		//ǩ����
		newqdkhs_xj+=newqdkhs;
		//�ɵ���
		newfdkhs_xj+=newfdkhs;


		//������
		ljkhs_xj+=ljkhs;
		//��ƶ���
		ljdjkhs_xj+=ljdjkhs;
		//��ƽ��ͼ
		ljctkhs_xj+=ljctkhs;
		//��ʩ��ͼ
		ljsgtkhs_xj+=ljsgtkhs;
		//ǩ����
		ljqdkhs_xj+=ljqdkhs;
		//�ɵ���
		ljfdkhs_xj+=ljfdkhs;

		
		//�¿ͻ���
		newkhs_zj+=newkhs;
		//��ƶ���
		newdjkhs_zj+=newdjkhs;
		//��ƽ��ͼ
		newctkhs_zj+=newctkhs;
		//��ʩ��ͼ
		newsgtkhs_zj+=newsgtkhs;
		//ǩ����
		newqdkhs_zj+=newqdkhs;
		//�ɵ���
		newfdkhs_zj+=newfdkhs;


		//������
		ljkhs_zj+=ljkhs;
		//��ƶ���
		ljdjkhs_zj+=ljdjkhs;
		//��ƽ��ͼ
		ljctkhs_zj+=ljctkhs;
		//��ʩ��ͼ
		ljsgtkhs_zj+=ljsgtkhs;
		//ǩ����
		ljqdkhs_zj+=ljqdkhs;
		//�ɵ���
		ljfdkhs_zj+=ljfdkhs;


		row++;

		%>
		<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			<td align="center"><%=row%></td>
			<td align="center"><%=yhmc%></td>

			<td><A HREF="ViewNewkhs.jsp?fgsbh=<%=fgsbh%>&yhmc=<%=yhmc%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=newkhs%></A></td>
			<td><A HREF="ViewNewdjkhs.jsp?fgsbh=<%=fgsbh%>&yhmc=<%=yhmc%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=newdjkhs%></A></td>
			<td><%=newdjl%>%</td>
			<td><A HREF="ViewNewctkhs.jsp?fgsbh=<%=fgsbh%>&yhmc=<%=yhmc%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=newctkhs%></A></td>
			<td><%=newctl%>%</td>
			<td><A HREF="Viewnewsgtkhs.jsp?fgsbh=<%=fgsbh%>&yhmc=<%=yhmc%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=newsgtkhs%></A></td>
			<td><%=newsgtl%>%</td>
			<td><A HREF="ViewNewqdkhs.jsp?fgsbh=<%=fgsbh%>&yhmc=<%=yhmc%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=newqdkhs%></A></td>
			<td><%=newqdl%>%</td>
			<td><A HREF="ViewNewfdkhs.jsp?fgsbh=<%=fgsbh%>&yhmc=<%=yhmc%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=newfdkhs%></A></td>
			<td><%=newfdl%>%</td>


			<td><A HREF="ViewLjkhs.jsp?fgsbh=<%=fgsbh%>&yhmc=<%=yhmc%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=ljkhs%></A></td>
			<td><A HREF="ViewLjdjkhs.jsp?fgsbh=<%=fgsbh%>&yhmc=<%=yhmc%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=ljdjkhs%></A></td>
			<td><%=ljdjl%>%</td>

			<td><A HREF="ViewLjctkhs.jsp?fgsbh=<%=fgsbh%>&yhmc=<%=yhmc%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=ljctkhs%></A></td>
			<td><%=ljctl%>%</td>
			<td><A HREF="Viewljsgtkhs.jsp?fgsbh=<%=fgsbh%>&yhmc=<%=yhmc%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=ljsgtkhs%></A></td>
			<td><%=ljsgtl%>%</td>


			<td><A HREF="ViewLjqdkhs.jsp?fgsbh=<%=fgsbh%>&yhmc=<%=yhmc%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=ljqdkhs%></A></td>
			<td><%=ljqdl%>%</td>

			<td><A HREF="ViewLjfdkhs.jsp?fgsbh=<%=fgsbh%>&yhmc=<%=yhmc%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=ljfdkhs%></A></td>
			<td><%=ljfdl%>%</td>

			<td><A HREF="ViewZsgdkhs.jsp?fgsbh=<%=fgsbh%>&yhmc=<%=yhmc%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=zsgdkhs%></A></td>
			<td><A HREF="ViewWkgkhs.jsp?fgsbh=<%=fgsbh%>&yhmc=<%=yhmc%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=wkgkhs%></A></td>

		</tr>
		<%	
	}
	rs2.close();
	ps2.close();


	//��ƶ���ת����
	double newdjl=0;
	if (newkhs_xj!=0)
	{
		newdjl=cf.round(newdjkhs_xj*100.0/newkhs_xj,2);
	}
	//��ͼ��
	double newctl=0;
	if (newkhs_xj!=0)
	{
		newctl=cf.round(newctkhs_xj*100.0/newkhs_xj,2);
	}
	//��ʩ��ͼ��
	double newsgtl=0;
	if (newkhs_xj!=0)
	{
		newsgtl=cf.round(newsgtkhs_xj*100.0/newkhs_xj,2);
	}
	//�ɵ�����
	double newfdl=0;
	if (newkhs_xj!=0)
	{
		newfdl=cf.round(newfdkhs_xj*100.0/newkhs_xj,2);
	}
	//ǩ����
	double newqdl=0;
	if (newkhs_xj!=0)
	{
		newqdl=cf.round(newqdkhs_xj*100.0/newkhs_xj,2);
	}


	//��ƶ���ת����
	double ljdjl=0;
	if (ljkhs_xj!=0)
	{
		ljdjl=cf.round(ljdjkhs_xj*100.0/ljkhs_xj,2);
	}
	//��ͼ��
	double ljctl=0;
	if (ljkhs_xj!=0)
	{
		ljctl=cf.round(ljctkhs_xj*100.0/ljkhs_xj,2);
	}
	//��ʩ��ͼ��
	double ljsgtl=0;
	if (ljkhs_xj!=0)
	{
		ljsgtl=cf.round(ljsgtkhs_xj*100.0/ljkhs_xj,2);
	}
	//�ɵ�����
	double ljfdl=0;
	if (ljkhs_xj!=0)
	{
		ljfdl=cf.round(ljfdkhs_xj*100.0/ljkhs_xj,2);
	}
	//ǩ����
	double ljqdl=0;
	if (ljkhs_xj!=0)
	{
		ljqdl=cf.round(ljqdkhs_xj*100.0/ljkhs_xj,2);
	}

	%>
	<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		<td align="center" colspan="2"><B>[<%=dmmc%>]С��</B></td>

		<td><B><%=newkhs_xj%></B></td>
		<td><B><%=newdjkhs_xj%></B></td>
			<td><%=newdjl%>%</td>

		<td><B><%=newctkhs_xj%></B></td>
			<td><%=newctl%>%</td>
		<td><B><%=newsgtkhs_xj%></B></td>
			<td><%=newsgtl%>%</td>


		<td><B><%=newqdkhs_xj%></B></td>
			<td><%=newqdl%>%</td>

		<td><B><%=newfdkhs_xj%></B></td>
			<td><%=newfdl%>%</td>


		<td><B><%=ljkhs_xj%></B></td>
		<td><B><%=ljdjkhs_xj%></B></td>
			<td><%=ljdjl%>%</td>

		<td><B><%=ljctkhs_xj%></B></td>
			<td><%=ljctl%>%</td>
		<td><B><%=ljsgtkhs_xj%></B></td>
			<td><%=ljsgtl%>%</td>


		<td><B><%=ljqdkhs_xj%></B></td>
			<td><%=ljqdl%>%</td>

		<td><B><%=ljfdkhs_xj%></B></td>
			<td><%=ljfdl%>%</td>

		<td><B><%=zsgdkhs_xj%></B></td>
		<td><B><%=wkgkhs_xj%></B></td>

	</tr>
	<%	
}
rs.close();
ps.close();

//�ϼƣ�����������������������������ʼ


//��ƶ���ת����
double newdjl=0;
if (newkhs_zj!=0)
{
	newdjl=cf.round(newdjkhs_zj*100.0/newkhs_zj,2);
}
//��ͼ��
double newctl=0;
if (newkhs_zj!=0)
{
	newctl=cf.round(newctkhs_zj*100.0/newkhs_zj,2);
}
//��ʩ��ͼ��
double newsgtl=0;
if (newkhs_zj!=0)
{
	newsgtl=cf.round(newsgtkhs_zj*100.0/newkhs_zj,2);
}
//�ɵ�����
double newfdl=0;
if (newkhs_zj!=0)
{
	newfdl=cf.round(newfdkhs_zj*100.0/newkhs_zj,2);
}
//ǩ����
double newqdl=0;
if (newkhs_zj!=0)
{
	newqdl=cf.round(newqdkhs_zj*100.0/newkhs_zj,2);
}


//��ƶ���ת����
double ljdjl=0;
if (ljkhs_zj!=0)
{
	ljdjl=cf.round(ljdjkhs_zj*100.0/ljkhs_zj,2);
}
//��ͼ��
double ljctl=0;
if (ljkhs_zj!=0)
{
	ljctl=cf.round(ljctkhs_zj*100.0/ljkhs_zj,2);
}
//��ʩ��ͼ��
double ljsgtl=0;
if (ljkhs_zj!=0)
{
	ljsgtl=cf.round(ljsgtkhs_zj*100.0/ljkhs_zj,2);
}
//�ɵ�����
double ljfdl=0;
if (ljkhs_zj!=0)
{
	ljfdl=cf.round(ljfdkhs_zj*100.0/ljkhs_zj,2);
}
//ǩ����
double ljqdl=0;
if (ljkhs_zj!=0)
{
	ljqdl=cf.round(ljqdkhs_zj*100.0/ljkhs_zj,2);
}
%>

<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td align="center" colspan="2"><B>�� ��</B></td>

	<td><B><%=newkhs_zj%></B></td>
	<td><B><%=newdjkhs_zj%></B></td>
		<td><%=newdjl%>%</td>

	<td><B><%=newctkhs_zj%></B></td>
		<td><%=newctl%>%</td>
	<td><B><%=newsgtkhs_zj%></B></td>
		<td><%=newsgtl%>%</td>


	<td><B><%=newqdkhs_zj%></B></td>
		<td><%=newqdl%>%</td>

	<td><B><%=newfdkhs_zj%></B></td>
		<td><%=newfdl%>%</td>


	<td><B><%=ljkhs_zj%></B></td>
	<td><B><%=ljdjkhs_zj%></B></td>
		<td><%=ljdjl%>%</td>

	<td><B><%=ljctkhs_zj%></B></td>
		<td><%=ljctl%>%</td>
	<td><B><%=ljsgtkhs_zj%></B></td>
		<td><%=ljsgtl%>%</td>


	<td><B><%=ljqdkhs_zj%></B></td>
		<td><%=ljqdl%>%</td>

	<td><B><%=ljfdkhs_zj%></B></td>
		<td><%=ljfdl%>%</td>

	<td><B><%=zsgdkhs_zj%></B></td>
	<td><B><%=wkgkhs_zj%></B></td>

</tr>

</table>


</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>" + ls_sql);
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

<script>

function onclickTr(obj)
{
	if (obj.style.background=='#ff33ff')
	{
		obj.style.background='#FFFFFF';
	}
	else
	{
		obj.style.background='#FF33FF';
	}
}
function inTr(obj)
{
	if (obj.style.background!='#ff33ff')
	{
		obj.style.background='#FFFF33';
	}
}
function outTr(obj)
{
	if (obj.style.background=='#ffff33')
	{
		obj.style.background='#FFFFFF';
	}
}

</script> 