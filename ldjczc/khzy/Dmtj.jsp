<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='170102'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[�������ͳ��]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'����[�������ͳ��]��"+xtrzyhmc+"') ";
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
  <B>�������ͳ��</B><BR>
  <b>(ʱ�䷶Χ��<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="230%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="2%" rowspan="2" >���</td>
  <td  width="6%" rowspan="2" >����</td>


  <td colspan="11" >�����ͻ�</td>
  <td colspan="11" >�ۼƿͻ�</td>
  <td colspan="2" >ǩ���ͻ�</td>
  </tr>
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="4%" >�¿ͻ���</td>
  <td  width="4%" >�г�ռ����</td>
  <td  width="4%" >���ε�����</td>
  <td  width="4%" >��ƽ��ͼ</td>
  <td  width="3%" >��ͼ��</td>
  <td  width="4%" >��ʩ��ͼ</td>
  <td  width="4%" >�ط���</td>

  <td  width="4%" >�ɵ���</td>
  <td  width="4%" >��ƶ���</td>
  <td  width="4%" >ǩ����</td>
  <td  width="3%" >�ɵ���</td>

  <td  width="4%" >������</td>
  <td  width="4%" >�г�ռ����</td>
  <td  width="4%" >���ε�����</td>
  <td  width="4%" >��ƽ��ͼ</td>
  <td  width="4%" >��ͼ��</td>
  <td  width="4%" >��ʩ��ͼ</td>
  <td  width="4%" >�ط���</td>

  <td  width="4%" >�ɵ���</td>
  <td  width="4%" >��ƶ���</td>
  <td  width="4%" >ǩ����</td>
  <td  width="4%" >�ɵ���</td>

  <td  width="3%" >��ʩ������</td>
  <td  width="3%" >����������</td>


  </tr>
<%

int row=0;

//�¿ͻ���
int newkhs_zj=0;
//�г�ռ����
int newywykhs_zj=0;
//���ε�����
int newecddkhs_zj=0;
//��ʩ��ͼ
int newsgtkhs_zj=0;
//��ƽ��ͼ
int newctkhs_zj=0;
//��ͼ��
double newctl_zj=0;
//��ƶ���
int newdjkhs_zj=0;
//�ط���
int newhfkhs_zj=0;
//�ɵ���
int newfdkhs_zj=0;
//ǩ����
int newqdkhs_zj=0;
//ǩ����
double newqdl_zj=0;


//������
int ljkhs_zj=0;
//�г�ռ����
int ljywykhs_zj=0;
//���ε�����
int ljecddkhs_zj=0;
//��ʩ��ͼ
int ljsgtkhs_zj=0;
//��ƽ��ͼ
int ljctkhs_zj=0;
//��ͼ��
double ljctl_zj=0;
//��ƶ���
int ljdjkhs_zj=0;
//�ط���
int ljhfkhs_zj=0;
//�ɵ���
int ljfdkhs_zj=0;
//ǩ����
int ljqdkhs_zj=0;
//ǩ����
double ljqdl_zj=0;
//��ʩ������
int zsgdkhs_zj=0;
//����������
int wkgkhs_zj=0;


String fgsbh=null;
String fgsmc=null;

ls_sql =" SELECT dwmc,dwbh";
ls_sql+=" FROM sq_dwxx";
ls_sql+=" where dwlx='F0'";
if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
{
	ls_sql+=" and sq_dwxx.dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
}
else
{
	ls_sql+=" and sq_dwxx.dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
}
if (!(fgs.equals("")))
{
	ls_sql+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
}
ls_sql+=" and (sq_dwxx.cxbz='N' or sq_dwxx.gdsj+62>SYSDATE)";
ls_sql+=" order by sq_dwxx.dwbh";
ps= conn.prepareStatement(ls_sql);
rs =ps.executeQuery();
while (rs.next())
{
	fgsbh=rs.getString("dwbh");
	fgsmc=rs.getString("dwmc");


	//�¿ͻ���
	int newkhs_xj=0;
	//�г�ռ����
	int newywykhs_xj=0;
	//���ε�����
	int newecddkhs_xj=0;
	//��ʩ��ͼ
	int newsgtkhs_xj=0;
	//��ƽ��ͼ
	int newctkhs_xj=0;
	//��ͼ��
	double newctl_xj=0;
	//��ƶ���
	int newdjkhs_xj=0;
	//�ط���
	int newhfkhs_xj=0;
	//�ɵ���
	int newfdkhs_xj=0;
	//ǩ����
	int newqdkhs_xj=0;
	//ǩ����
	double newqdl_xj=0;


	//������
	int ljkhs_xj=0;
	//�г�ռ����
	int ljywykhs_xj=0;
	//���ε�����
	int ljecddkhs_xj=0;
	//��ʩ��ͼ
	int ljsgtkhs_xj=0;
	//��ƽ��ͼ
	int ljctkhs_xj=0;
	//��ͼ��
	double ljctl_xj=0;
	//��ƶ���
	int ljdjkhs_xj=0;
	//�ط���
	int ljhfkhs_xj=0;
	//�ɵ���
	int ljfdkhs_xj=0;
	//ǩ����
	int ljqdkhs_xj=0;
	//ǩ����
	double ljqdl_xj=0;
	//��ʩ������
	int zsgdkhs_xj=0;
	//����������
	int wkgkhs_xj=0;

	String getdwbh=null;
	String dmmc=null;
	ls_sql =" SELECT dwmc,dwbh";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwlx='F2'";
	ls_sql+=" and ssfgs='"+fgsbh+"'";
	if (!(dwbh.equals("")))
	{
		ls_sql+=" and  sq_dwxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" and (sq_dwxx.cxbz='N' or sq_dwxx.gdsj+62>SYSDATE)";
	ls_sql+=" order by sq_dwxx.dwbh";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		getdwbh=rs2.getString("dwbh");
		dmmc=rs2.getString("dwmc");


		//�¿ͻ���
		int newkhs=0;
		ls_sql="select count(*) ";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
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



		//�г�ռ����
		int newywykhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
		ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y����Ч��Ϣ��N����Ч��Ϣ
		ls_sql+=" and crm_zxkhxx.zxzt!='6'";//6��ɢ��

		ls_sql+=" and crm_zxkhxx.ywy is not null";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			newywykhs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		//���ε�����
		int newecddkhs=0;
		ls_sql =" SELECT count(crm_zxkhxx.khbh)";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
		ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y����Ч��Ϣ��N����Ч��Ϣ
		ls_sql+=" and crm_zxkhxx.zxzt!='6'";//6��ɢ��

		ls_sql+=" and crm_zxkhxx.smcs>0";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			newecddkhs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		

		//��ʩ��ͼ
		int newsgtkhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
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

		//��ƽ��ͼ
		int newctkhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
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

		//��ƶ���
		int newdjkhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
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

		//�ط���
		int newhfkhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
		ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y����Ч��Ϣ��N����Ч��Ϣ
		ls_sql+=" and crm_zxkhxx.zxzt!='6'";//6��ɢ��

		ls_sql+=" and crm_zxkhxx.zxhfsj is not null";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			newhfkhs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		//�ɵ���
		int newfdkhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
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

		//ǩ����
		int newqdkhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
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
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
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



		//�г�ռ����
		int ljywykhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y����Ч��Ϣ��N����Ч��Ϣ
		ls_sql+=" and crm_zxkhxx.zxzt not in('2','3','4','6')";//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ����6��ɢ��

		ls_sql+=" and crm_zxkhxx.ywy is not null";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ljywykhs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		//���ε�����
		int ljecddkhs=0;
		ls_sql =" SELECT count(crm_zxkhxx.khbh)";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y����Ч��Ϣ��N����Ч��Ϣ
		ls_sql+=" and crm_zxkhxx.zxzt not in('2','3','4','6')";//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ����6��ɢ��

		ls_sql+=" and crm_zxkhxx.smcs>0";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ljecddkhs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		

		//��ʩ��ͼ
		int ljsgtkhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
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

		//��ƽ��ͼ
		int ljctkhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
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

		//��ͼ��
		double ljctl=0;
		if (ljkhs!=0)
		{
			ljctl=cf.round(ljctkhs*100.0/ljkhs,2);
		}

		//��ƶ���
		int ljdjkhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
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

		//�ط���
		int ljhfkhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y����Ч��Ϣ��N����Ч��Ϣ
		ls_sql+=" and crm_zxkhxx.zxzt not in('2','3','4','6')";//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ����6��ɢ��

		ls_sql+=" and crm_zxkhxx.zxhfsj is not null";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ljhfkhs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		//�ɵ���
		int ljfdkhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.zxdm='"+getdwbh+"'";
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

		//ǩ����
		int ljqdkhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";

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
		
		//ǩ����
		double ljqdl=0;
		if (ljkhs!=0)
		{
			ljqdl=cf.round(ljqdkhs*100.0/ljkhs,2);
		}


		//��ʩ������
		int zsgdkhs=0;
		ls_sql =" SELECT count(*)";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";

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
		ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";

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

////////////////////////С��
		//�¿ͻ���
		newkhs_xj+=newkhs;
		//�г�ռ����
		newywykhs_xj+=newywykhs;
		//���ε�����
		newecddkhs_xj+=newecddkhs;
		//��ʩ��ͼ
		newsgtkhs_xj+=newsgtkhs;
		//��ƽ��ͼ
		newctkhs_xj+=newctkhs;
		//��ƶ���
		newdjkhs_xj+=newdjkhs;
		//�ط���
		newhfkhs_xj+=newhfkhs;
		//�ɵ���
		newfdkhs_xj+=newfdkhs;
		//ǩ����
		newqdkhs_xj+=newqdkhs;


		//������
		ljkhs_xj+=ljkhs;
		//�г�ռ����
		ljywykhs_xj+=ljywykhs;
		//���ε�����
		ljecddkhs_xj+=ljecddkhs;
		//��ʩ��ͼ
		ljsgtkhs_xj+=ljsgtkhs;
		//��ƽ��ͼ
		ljctkhs_xj+=ljctkhs;
		//��ƶ���
		ljdjkhs_xj+=ljdjkhs;
		//�ط���
		ljhfkhs_xj+=ljhfkhs;
		//�ɵ���
		ljfdkhs_xj+=ljfdkhs;
		//ǩ����
		ljqdkhs_xj+=ljqdkhs;
		//��ʩ������
		zsgdkhs_xj+=zsgdkhs;
		//����������
		wkgkhs_xj+=wkgkhs;

		
		//�¿ͻ���
		newkhs_zj+=newkhs;
		//�г�ռ����
		newywykhs_zj+=newywykhs;
		//���ε�����
		newecddkhs_zj+=newecddkhs;
		//��ʩ��ͼ
		newsgtkhs_zj+=newsgtkhs;
		//��ƽ��ͼ
		newctkhs_zj+=newctkhs;
		//��ƶ���
		newdjkhs_zj+=newdjkhs;
		//�ط���
		newhfkhs_zj+=newhfkhs;
		//�ɵ���
		newfdkhs_zj+=newfdkhs;
		//ǩ����
		newqdkhs_zj+=newqdkhs;


		//������
		ljkhs_zj+=ljkhs;
		//�г�ռ����
		ljywykhs_zj+=ljywykhs;
		//���ε�����
		ljecddkhs_zj+=ljecddkhs;
		//��ʩ��ͼ
		ljsgtkhs_zj+=ljsgtkhs;
		//��ƽ��ͼ
		ljctkhs_zj+=ljctkhs;
		//��ƶ���
		ljdjkhs_zj+=ljdjkhs;
		//�ط���
		ljhfkhs_zj+=ljhfkhs;
		//�ɵ���
		ljfdkhs_zj+=ljfdkhs;
		//ǩ����
		ljqdkhs_zj+=ljqdkhs;
		//��ʩ������
		zsgdkhs_zj+=zsgdkhs;
		//����������
		wkgkhs_zj+=wkgkhs;

		//��ͼ��
		newctl_xj=0;
		if (newkhs_xj!=0)
		{
			newctl_xj=cf.round(newctkhs_xj*100.0/newkhs_xj,2);
		}
		//ǩ����
		newqdl_xj=0;
		if (newkhs_xj!=0)
		{
			newqdl_xj=cf.round(newqdkhs_xj*100.0/newkhs_xj,2);
		}
		//��ͼ��
		ljctl_xj=0;
		if (ljkhs_xj!=0)
		{
			ljctl_xj=cf.round(ljctkhs_xj*100.0/ljkhs_xj,2);
		}
		//ǩ����
		ljqdl_xj=0;
		if (ljkhs_xj!=0)
		{
			ljqdl_xj=cf.round(ljqdkhs_xj*100.0/ljkhs_xj,2);
		}

		row++;

		%>
		<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			<td align="center"><%=row%></td>
			<td align="center"><%=dmmc%></td>

			<td><A HREF="ViewDmNew.jsp?fgsbh=<%=fgsbh%>&dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=newkhs%></A></td>
			<td><A HREF="ViewDmNewYwy.jsp?fgsbh=<%=fgsbh%>&dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=newywykhs%></A></td>

			<td><A HREF="ViewDmNewEcdd.jsp?fgsbh=<%=fgsbh%>&dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=newecddkhs%></A></td>
			<td><A HREF="ViewDmNewCt.jsp?fgsbh=<%=fgsbh%>&dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=newctkhs%></A></td>
			<td><%=newctl%>%</td>
			<td><A HREF="ViewDmNewSgt.jsp?fgsbh=<%=fgsbh%>&dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=newsgtkhs%></A></td>

			<td><A HREF="ViewDmNewHf.jsp?fgsbh=<%=fgsbh%>&dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=newhfkhs%></A></td>

			<td><A HREF="ViewDmNewFd.jsp?fgsbh=<%=fgsbh%>&dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=newfdkhs%></A></td>
			<td><A HREF="ViewDmNewDj.jsp?fgsbh=<%=fgsbh%>&dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=newdjkhs%></A></td>
			<td><A HREF="ViewDmNewQd.jsp?fgsbh=<%=fgsbh%>&dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=newqdkhs%></A></td>
			<td><%=newqdl%>%</td>


			<td><A HREF="ViewDmLj.jsp?fgsbh=<%=fgsbh%>&dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=ljkhs%></A></td>
			<td><A HREF="ViewDmLjYwy.jsp?fgsbh=<%=fgsbh%>&dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=ljywykhs%></A></td>

			<td><A HREF="ViewDmLjEcdd.jsp?fgsbh=<%=fgsbh%>&dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=ljecddkhs%></A></td>
			<td><A HREF="ViewDmLjCt.jsp?fgsbh=<%=fgsbh%>&dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=ljctkhs%></A></td>
			<td><%=ljctl%>%</td>
			<td><A HREF="ViewDmLjSgt.jsp?fgsbh=<%=fgsbh%>&dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=ljsgtkhs%></A></td>

			<td><A HREF="ViewDmLjHf.jsp?fgsbh=<%=fgsbh%>&dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=ljhfkhs%></A></td>

			<td><A HREF="ViewDmLjFd.jsp?fgsbh=<%=fgsbh%>&dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=ljfdkhs%></A></td>
			<td><A HREF="ViewDmLjDj.jsp?fgsbh=<%=fgsbh%>&dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=ljdjkhs%></A></td>
			<td><A HREF="ViewDmLjQd.jsp?fgsbh=<%=fgsbh%>&dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=ljqdkhs%></A></td>
			<td><%=ljqdl%>%</td>

			<td><A HREF="ViewDmZsg.jsp?fgsbh=<%=fgsbh%>&dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=zsgdkhs%></A></td>
			<td><A HREF="ViewDmWkg.jsp?fgsbh=<%=fgsbh%>&dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=wkgkhs%></A></td>

		</tr>
		<%	
	}
	rs2.close();
	ps2.close();



	%>
	<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		<td align="center" colspan="2"><B>[<%=fgsmc%>]С��</B></td>

		<td><B><%=newkhs_xj%></B></td>
		<td><B><%=newywykhs_xj%></B></td>

		<td><B><%=newecddkhs_xj%></B></td>
		<td><B><%=newctkhs_xj%></B></td>
		<td><B><%=newctl_xj%>%</B></td>
		<td><B><%=newsgtkhs_xj%></B></td>

		<td><B><%=newhfkhs_xj%></B></td>

		<td><B><%=newfdkhs_xj%></B></td>
		<td><B><%=newdjkhs_xj%></B></td>
		<td><B><%=newqdkhs_xj%></B></td>
		<td><B><%=newqdl_xj%>%</B></td>


		<td><B><%=ljkhs_xj%></B></td>
		<td><B><%=ljywykhs_xj%></B></td>

		<td><B><%=ljecddkhs_xj%></B></td>
		<td><B><%=ljctkhs_xj%></B></td>
		<td><B><%=ljctl_xj%>%</B></td>
		<td><B><%=ljsgtkhs_xj%></B></td>

		<td><B><%=ljhfkhs_xj%></B></td>

		<td><B><%=ljfdkhs_xj%></B></td>
		<td><B><%=ljdjkhs_xj%></B></td>
		<td><B><%=ljqdkhs_xj%></B></td>
		<td><B><%=ljqdl_xj%>%</B></td>

		<td><B><%=zsgdkhs_xj%></B></td>
		<td><B><%=wkgkhs_xj%></B></td>

	</tr>
	<%	
}
rs.close();
ps.close();

	//�ϼƣ�����������������������������ʼ

//��ͼ��
newctl_zj=0;
if (newkhs_zj!=0)
{
	newctl_zj=cf.round(newctkhs_zj*100.0/newkhs_zj,2);
}
//ǩ����
newqdl_zj=0;
if (newkhs_zj!=0)
{
	newqdl_zj=cf.round(newqdkhs_zj*100.0/newkhs_zj,2);
}
//��ͼ��
ljctl_zj=0;
if (ljkhs_zj!=0)
{
	ljctl_zj=cf.round(ljctkhs_zj*100.0/ljkhs_zj,2);
}
//ǩ����
ljqdl_zj=0;
if (ljkhs_zj!=0)
{
	ljqdl_zj=cf.round(ljqdkhs_zj*100.0/ljkhs_zj,2);
}

%>

<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td align="center" colspan="2"><B>�� ��</B></td>

	<td><B><%=newkhs_zj%></B></td>
	<td><B><%=newywykhs_zj%></B></td>

	<td><B><%=newecddkhs_zj%></B></td>
	<td><B><%=newctkhs_zj%></B></td>
	<td><B><%=newctl_zj%>%</B></td>
	<td><B><%=newsgtkhs_zj%></B></td>

	<td><B><%=newhfkhs_zj%></B></td>

	<td><B><%=newfdkhs_zj%></B></td>
	<td><B><%=newdjkhs_zj%></B></td>
	<td><B><%=newqdkhs_zj%></B></td>
	<td><B><%=newqdl_zj%>%</B></td>


	<td><B><%=ljkhs_zj%></B></td>
	<td><B><%=ljywykhs_zj%></B></td>

	<td><B><%=ljecddkhs_zj%></B></td>
	<td><B><%=ljctkhs_zj%></B></td>
	<td><B><%=ljctl_zj%>%</B></td>
	<td><B><%=ljsgtkhs_zj%></B></td>

	<td><B><%=ljhfkhs_zj%></B></td>

	<td><B><%=ljfdkhs_zj%></B></td>
	<td><B><%=ljdjkhs_zj%></B></td>
	<td><B><%=ljqdkhs_zj%></B></td>
	<td><B><%=ljqdl_zj%>%</B></td>

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