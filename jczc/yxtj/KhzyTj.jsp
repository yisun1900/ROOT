<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String sjfw=null;
	String sjfw2=null;

	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");

	String lrfgs=request.getParameter("fgs");
	String lrdwbh=request.getParameter("dwbh");

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>�ͻ���Դͳ��</B><BR>
</CENTER>
<table border="1" width="3100px" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td width="40px" rowspan="2">���</td>
    <td width="200px" rowspan="2">����</td>
    <td colspan="19" bgcolor="#CCCCFF"><b>(<%=sjfw%>--<%=sjfw2%>)�µǼǿ�������[�Ǽǲ���]ͳ��</b></td>
    <td colspan="10" bgcolor="#CCFFFF"><b>Ŀǰ�ۼ�[δǩ��]��������[��������]ͳ��</b></td>
    <td colspan="5" bgcolor="#CCCCCC"><b>(<%=sjfw%>--<%=sjfw2%>)ǩ�����</b></td>
  </tr>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="80px" bgcolor="#CCCCFF">����</td>
    <td  width="70px" bgcolor="#CCCCFF">��̸�ͻ���</td>
    <td  width="70px" bgcolor="#CCCCFF">ʧ����</td>
    <td  width="60px" bgcolor="#CCCCFF">ʧ����</td>
    <td  width="70px" bgcolor="#CCCCFF">ǩ����</td>
    <td  width="60px" bgcolor="#CCCCFF">ǩ����</td>
    <td  width="150px" bgcolor="#CCCCFF">ǩ����</td>
    <td  width="70px" bgcolor="#CCCCFF">ǩ������</td>
    <td  width="80px" bgcolor="#CCCCFF">ƽ������</td>
    <td  width="80px" bgcolor="#CCCCFF">ƽ�׾���</td>
    <td  width="70px" bgcolor="#CCCCFF">������������</td>
    <td  width="110px" bgcolor="#CCCCFF">���������</td>
    <td  width="70px" bgcolor="#CCCCFF">����Ʒ���</td>
    <td  width="120px" bgcolor="#CCCCFF">��ƷѶ�</td>
    <td  width="70px" bgcolor="#CCCCFF">���������</td>
    <td  width="110px" bgcolor="#CCCCFF">������</td>
    <td  width="70px" bgcolor="#CCCCFF">������</td>
    <td  width="70px" bgcolor="#CCCCFF">��ͼ��</td>
    <td  width="70px" bgcolor="#CCCCFF">��������</td>

    <td  width="80px" bgcolor="#CCFFFF">��̸�ͻ���</td>
    <td  width="80px" bgcolor="#CCFFFF">������������</td>
    <td  width="110px" bgcolor="#CCFFFF">���������</td>
    <td  width="80px" bgcolor="#CCFFFF">����Ʒ���</td>
    <td  width="120px" bgcolor="#CCFFFF">��ƷѶ�</td>
    <td  width="80px" bgcolor="#CCFFFF">���������</td>
    <td  width="110px" bgcolor="#CCFFFF">������</td>
    <td  width="80px" bgcolor="#CCFFFF">������</td>
    <td  width="80px" bgcolor="#CCFFFF">��ͼ��</td>
    <td  width="80px" bgcolor="#CCFFFF">��������</td>

    <td  width="80px" bgcolor="#CCCCCC">ǩ����</td>
    <td  width="150px" bgcolor="#CCCCCC">ǩ����</td>
    <td  width="80px" bgcolor="#CCCCCC">ƽ������</td>
    <td  width="80px" bgcolor="#CCCCCC">ƽ�׾���</td>
    <td  width="80px" bgcolor="#CCCCCC">ǩ������</td>
  
  </tr>
  <%
		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

String bgcolor="";

int xh=0;

String dwbh=null;
String dwmc=null;
String fgsbh=null;
String fgsmc=null;

//�µǼǿ���
int kls=0;
int ztkhs=0;
int sbkhs=0;
double sbl=0;

int qys=0;
double qye=0;
double sjf=0;
int fwmj=0;
double qdl=0;
int qdts=0;
double qdzq=0;

int jdjs=0;
double dje=0;
int jsjfs=0;
double sjfe=0;
int jhddjs=0;
double hddje=0;

int lfs=0;
int cts=0;
int bjs=0;

//Ŀǰ�ۼ�δǩ������
int ljztkhs=0;

int ljjdjs=0;
double ljdje=0;
int ljjsjfs=0;
double ljsjfe=0;
int ljjhddjs=0;
double ljhddje=0;

int ljlfs=0;
int ljcts=0;
int ljbjs=0;

//ǩ�����
int ljqys=0;
double ljqye=0;
double ljsjf=0;
int ljfwmj=0;
int ljqdts=0;
double ljqdzq=0;

//��˾[�µǼǿ���]С��
int fgskls=0;
int fgsztkhs=0;
int fgssbkhs=0;

int fgsqys=0;
double fgsqye=0;
double fgssjf=0;
int fgsfwmj=0;
int fgsqdts=0;

int fgsjdjs=0;
double fgsdje=0;
int fgsjsjfs=0;
double fgssjfe=0;
int fgsjhddjs=0;
double fgshddje=0;

int fgslfs=0;
int fgscts=0;
int fgsbjs=0;

//��˾[Ŀǰ�ۼ�δǩ������]С��
int ljfgsztkhs=0;

int ljfgsjdjs=0;
double ljfgsdje=0;
int ljfgsjsjfs=0;
double ljfgssjfe=0;
int ljfgsjhddjs=0;
double ljfgshddje=0;

int ljfgslfs=0;
int ljfgscts=0;
int ljfgsbjs=0;

//��˾[ǩ�����]С��
int ljfgsqys=0;
double ljfgsqye=0;
double ljfgssjf=0;
int ljfgsfwmj=0;
int ljfgsqdts=0;

//[�µǼǿ���]�ܼ�
int allkls=0;
int allztkhs=0;
int allsbkhs=0;

int allqys=0;
double allqye=0;
double allsjf=0;
int allfwmj=0; 
int allqdts=0;

int alljdjs=0;
double alldje=0;
int alljsjfs=0;
double allsjfe=0;
int alljhddjs=0;
double allhddje=0;

int alllfs=0;
int allcts=0;
int allbjs=0;

//[Ŀǰ�ۼ�δǩ������]�ܼ�
int ljallztkhs=0;

int ljalljdjs=0;
double ljalldje=0;
int ljalljsjfs=0;
double ljallsjfe=0;
int ljalljhddjs=0;
double ljallhddje=0;

int ljalllfs=0;
int ljallcts=0;
int ljallbjs=0;

//[ǩ�����]�ܼ�
int ljallqys=0;
double ljallqye=0;
double ljallsjf=0;
int ljallfwmj=0; 
int ljallqdts=0;


//��ʱ����[ƽ�����ƽ�׾���]
int pjde=0;
int pmjj=0;
int ljpjde=0;
int ljpmjj=0;

try {
	conn=cf.getConnection();

	ls_sql=" SELECT dwbh,dwmc";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwlx='F0' and cxbz='N'";
	if (lrfgs!=null)
	{
		if (!(lrfgs.equals("")))	ls_sql+=" and  dwbh ='"+lrfgs+"'";
	}
	ls_sql+=" order by dwbh";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery(ls_sql);
	while (rs2.next())
	{
		fgsbh=rs2.getString("dwbh");
		fgsmc=rs2.getString("dwmc");

		//С�ƹ�0
		//��˾[�µǼǿ���]С��
		fgskls=0;
		fgsztkhs=0;
		fgssbkhs=0;

		fgsqys=0;
		fgsqye=0;
		fgssjf=0;
		fgsfwmj=0;
		fgsqdts=0;

		fgsjdjs=0;
		fgsdje=0;
		fgsjsjfs=0;
		fgssjfe=0;
		fgsjhddjs=0;
		fgshddje=0;

		fgslfs=0;
		fgscts=0;
		fgsbjs=0;

		//��˾[Ŀǰ�ۼ�δǩ������]С��
		ljfgsztkhs=0;

		ljfgsjdjs=0;
		ljfgsdje=0;
		ljfgsjsjfs=0;
		ljfgssjfe=0;
		ljfgsjhddjs=0;
		ljfgshddje=0;

		ljfgslfs=0;
		ljfgscts=0;
		ljfgsbjs=0;

		//��˾[ǩ�����]С��
		ljfgsqys=0;
		ljfgsqye=0;
		ljfgssjf=0;
		ljfgsfwmj=0;
		ljfgsqdts=0;

		ls_sql=" SELECT dwbh,dwmc";
		ls_sql+=" FROM sq_dwxx";
		ls_sql+=" where ssfgs='"+fgsbh+"' and dwlx in('F0','F1','F2') and cxbz='N'";
		if (lrdwbh!=null)
		{
			if (!(lrdwbh.equals("")))	ls_sql+=" and  dwbh='"+lrdwbh+"'";
		}
		ls_sql+=" order by dwlx,dwbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			dwbh=rs.getString("dwbh");
			dwmc=rs.getString("dwmc");

			//�µǼǿ���:����
			ls_sql=" SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where zxdjbm='"+dwbh+"'";
			ls_sql+=" and lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				kls=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			//�µǼǿ���:��̸�ͻ���
			ls_sql=" SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where zxdjbm='"+dwbh+"'";
			ls_sql+=" and lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and zxzt in('0','1','5')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				ztkhs=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			//�µǼǿ���:ʧ����
			ls_sql=" SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where zxdjbm='"+dwbh+"'";
			ls_sql+=" and lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and zxzt in('2','4')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				sbkhs=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			//�µǼǿ���:ǩ����
			ls_sql=" SELECT count(*),sum(crm_khxx.qye),sum(crm_khxx.sjf),sum(crm_khxx.fwmj),sum(crm_khxx.qyrq-TRUNC(crm_zxkhxx.lrsj))";
			ls_sql+=" FROM crm_zxkhxx,crm_khxx";
			ls_sql+=" where crm_zxkhxx.zxdjbm='"+dwbh+"' and crm_zxkhxx.khbh=crm_khxx.khbh";
			ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

			ls_sql+=" and crm_zxkhxx.zxzt in('3')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				qys=rs1.getInt(1);
				qye=rs1.getDouble(2);
				sjf=rs1.getDouble(3);
				fwmj=rs1.getInt(4);
				qdts=rs1.getInt(5);
			}
			rs1.close();
			ps1.close();

			//�µǼǿ���:������������
			ls_sql=" SELECT count(*),sum(lfdj)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where zxdjbm='"+dwbh+"'";
			ls_sql+=" and lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

			ls_sql+=" and crm_zxkhxx.lfdjbz='Y'";
			ls_sql+=" and crm_zxkhxx.jlfdjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_zxkhxx.jlfdjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				jdjs=rs1.getInt(1);
				dje=rs1.getDouble(2);
			}
			rs1.close();
			ps1.close();

			//�µǼǿ���:����Ʒ�
			ls_sql=" SELECT count(*),sum(sjf)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where zxdjbm='"+dwbh+"'";
			ls_sql+=" and lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

			ls_sql+=" and crm_zxkhxx.sjfbz='Y'";
			ls_sql+=" and crm_zxkhxx.jsjfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_zxkhxx.jsjfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				jsjfs=rs1.getInt(1);
				sjfe=rs1.getDouble(2);
			}
			rs1.close();
			ps1.close();

			//�µǼǿ���:�������
			ls_sql=" SELECT count(*),sum(hddj)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where zxdjbm='"+dwbh+"'";
			ls_sql+=" and lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

			ls_sql+=" and crm_zxkhxx.hddjbz='Y'";
			ls_sql+=" and crm_zxkhxx.jhddjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_zxkhxx.jhddjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				jhddjs=rs1.getInt(1);
				hddje=rs1.getDouble(2);
			}
			rs1.close();
			ps1.close();

			//�µǼǿ���:������
			ls_sql=" SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where zxdjbm='"+dwbh+"'";
			ls_sql+=" and lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

			ls_sql+=" and crm_zxkhxx.lfbz='Y'";
			ls_sql+=" and crm_zxkhxx.lfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_zxkhxx.lfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				lfs=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			//�µǼǿ���:��ͼ��
			ls_sql=" SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where zxdjbm='"+dwbh+"'";
			ls_sql+=" and lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

			ls_sql+=" and crm_zxkhxx.ctbz='Y'";
			ls_sql+=" and crm_zxkhxx.ctsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_zxkhxx.ctsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				cts=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			//�µǼǿ���:��������
			ls_sql=" SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where zxdjbm='"+dwbh+"'";
			ls_sql+=" and lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and crm_zxkhxx.sfzdzbj='Y'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				bjs=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			//Ŀǰ�ۼ�δǩ������:��̸�ͻ���
			ls_sql=" SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.zxdm='"+dwbh+"' and crm_zxkhxx.zxzt in('0','1','5')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				ljztkhs=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			//Ŀǰ�ۼ�δǩ������:������������
			ls_sql=" SELECT count(*),sum(lfdj)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.zxdm='"+dwbh+"' and crm_zxkhxx.zxzt in('0','1','5')";

			ls_sql+=" and crm_zxkhxx.lfdjbz='Y'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				ljjdjs=rs1.getInt(1);
				ljdje=rs1.getDouble(2);
			}
			rs1.close();
			ps1.close();

			//Ŀǰ�ۼ�δǩ������:����Ʒ�
			ls_sql=" SELECT count(*),sum(sjf)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.zxdm='"+dwbh+"' and crm_zxkhxx.zxzt in('0','1','5')";

			ls_sql+=" and crm_zxkhxx.sjfbz='Y'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				ljjsjfs=rs1.getInt(1);
				ljsjfe=rs1.getDouble(2);
			}
			rs1.close();
			ps1.close();

			//Ŀǰ�ۼ�δǩ������:�������
			ls_sql=" SELECT count(*),sum(hddj)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.zxdm='"+dwbh+"' and crm_zxkhxx.zxzt in('0','1','5')";

			ls_sql+=" and crm_zxkhxx.hddjbz='Y'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				ljjhddjs=rs1.getInt(1);
				ljhddje=rs1.getDouble(2);
			}
			rs1.close();
			ps1.close();


			//Ŀǰ�ۼ�δǩ������:������
			ls_sql=" SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.zxdm='"+dwbh+"' and crm_zxkhxx.zxzt in('0','1','5')";
			ls_sql+=" and crm_zxkhxx.lfbz='Y'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				ljlfs=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			//Ŀǰ�ۼ�δǩ������:��ͼ��
			ls_sql=" SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.zxdm='"+dwbh+"' and crm_zxkhxx.zxzt in('0','1','5')";
			ls_sql+=" and crm_zxkhxx.ctbz='Y'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				ljcts=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			//Ŀǰ�ۼ�δǩ������:��������
			ls_sql=" SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.zxdm='"+dwbh+"' and crm_zxkhxx.zxzt in('0','1','5')";
			ls_sql+=" and crm_zxkhxx.sfzdzbj='Y'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				ljbjs=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			//ǩ�����
			ls_sql=" SELECT count(*),sum(crm_khxx.qye),sum(crm_khxx.sjf),sum(crm_khxx.fwmj),sum(crm_khxx.qyrq-TRUNC(crm_zxkhxx.lrsj))";
			ls_sql+=" FROM crm_khxx,crm_zxkhxx";
			ls_sql+=" where crm_khxx.dwbh='"+dwbh+"' and crm_khxx.zt='2' and crm_khxx.khbh=crm_zxkhxx.khbh";
			ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				ljqys=rs1.getInt(1);
				ljqye=rs1.getDouble(2);
				ljsjf=rs1.getDouble(3);
				ljfwmj=rs1.getInt(4);
				ljqdts=rs1.getInt(5);
			}
			rs1.close();
			ps1.close();


			if (kls==0 && ljztkhs==0 && ljjdjs==0 && ljqys==0 && ljqye==0)
			{
				continue;
			}

			xh++;


			//��˾[�µǼǿ���]С��
			fgskls+=kls;
			fgsztkhs+=ztkhs;
			fgssbkhs+=sbkhs;

			fgsqys+=qys;
			fgsqye+=qye;
			fgssjf+=sjf;
			fgsfwmj+=fwmj;
			fgsqdts+=qdts;

			fgsjdjs+=jdjs;
			fgsdje+=dje;
			fgsjsjfs+=jsjfs;
			fgssjfe+=sjfe;
			fgsjhddjs+=jhddjs;
			fgshddje+=hddje;

			fgslfs+=lfs;
			fgscts+=cts;
			fgsbjs+=bjs;

			//��˾[Ŀǰ�ۼ�δǩ������]С��
			ljfgsztkhs+=ljztkhs;

			ljfgsjdjs+=ljjdjs;
			ljfgsdje+=ljdje;
			ljfgsjsjfs+=ljjsjfs;
			ljfgssjfe+=ljsjfe;
			ljfgsjhddjs+=ljjhddjs;
			ljfgshddje+=ljhddje;

			ljfgslfs+=ljlfs;
			ljfgscts+=ljcts;
			ljfgsbjs+=ljbjs;

			//��˾[ǩ�����]С��
			ljfgsqys+=ljqys;
			ljfgsqye+=ljqye;
			ljfgssjf+=ljsjf;
			ljfgsfwmj+=ljfwmj;
			ljfgsqdts+=ljqdts;


			//[�µǼǿ���]�ܼ�
			allkls+=kls;
			allztkhs+=ztkhs;
			allsbkhs+=sbkhs;

			allqys+=qys;
			allqye+=qye;
			allsjf+=sjf;
			allfwmj+=fwmj;
			allqdts+=qdts;

			alljdjs+=jdjs;
			alldje+=dje;
			alljsjfs+=jsjfs;
			allsjfe+=sjfe;
			alljhddjs+=jhddjs;
			allhddje+=hddje;

			alllfs+=lfs;
			allcts+=cts;
			allbjs+=bjs;

			//[Ŀǰ�ۼ�δǩ������]�ܼ�
			ljallztkhs+=ljztkhs;

			ljalljdjs+=ljjdjs;
			ljalldje+=ljdje;
			ljalljsjfs+=ljjsjfs;
			ljallsjfe+=ljsjfe;
			ljalljhddjs+=ljjhddjs;
			ljallhddje+=ljhddje;

			ljalllfs+=ljlfs;
			ljallcts+=ljcts;
			ljallbjs+=ljbjs;

			//[ǩ�����]�ܼ�
			ljallqys+=ljqys;
			ljallqye+=ljqye;
			ljallsjf+=ljsjf;
			ljallfwmj+=ljfwmj;
			ljallqdts+=ljqdts;
			

			//ƽ������
			if (qys!=0)
			{
				pjde=(int)qye/qys;
			}
			else{
				pjde=0;
			}
			//ƽ�׾���
			if (fwmj!=0)
			{
				pmjj=(int)qye/fwmj;
			}
			else{
				pmjj=0;
			}

			//ƽ������
			if (ljqys!=0)
			{
				ljpjde=(int)ljqye/ljqys;
			}
			else{
				ljpjde=0;
			}
			//ƽ�׾���
			if (ljfwmj!=0)
			{
				ljpmjj=(int)ljqye/ljfwmj;
			}
			else{
				ljpmjj=0;
			}

			//ʧ����
			if (kls!=0)
			{
				sbl=cf.round(sbkhs*100.0/kls,1);
			}
			else{
				sbl=0;
			}
			//ǩ����
			if (kls!=0)
			{
				qdl=cf.round(qys*100.0/kls,1);
			}
			else{
				qdl=0;
			}
			//�µǼǿ�����ǩ������
			if (qys!=0)
			{
				qdzq=cf.round(qdts/qys,1);
			}
			else{
				qdzq=0;
			}

			//ǩ�������ǩ������
			if (ljqys!=0)
			{
				ljqdzq=cf.round(ljqdts/ljqys,1);
			}
			else{
				ljqdzq=0;
			}

			if (xh%2==1)
			{
				bgcolor="#FFFFFF";
			}
			else{
				bgcolor="#E8E8FF";
			}
			
			%> 
  <tr align="center" bgcolor="<%=bgcolor%>"> 
    <td><%=xh%></td>
    <td><%=dwmc%></td>

    <td><%=kls%></td>
    <td><%=ztkhs%></td>
    <td><%=sbkhs%></td>
    <td><%=sbl%>%</td>

    <td><%=qys%></td>
    <td><%=qdl%>%</td>
    <td align="right"><%=cf.formatDouble(qye)%></td>
    <td align="right"><%=qdzq%></td>
    <td align="right"><%=pjde%></td>
    <td align="right"><%=pmjj%></td>

    <td><%=jdjs%></td>
    <td align="right"><%=dje%></td>
    <td><%=jsjfs%></td>
    <td align="right"><%=sjfe%></td>
    <td><%=jhddjs%></td>
    <td align="right"><%=hddje%></td>

    <td><%=lfs%></td>
    <td><%=cts%></td>
    <td><%=bjs%></td>

    <td><%=ljztkhs%></td>

    <td><%=ljjdjs%></td>
    <td align="right"><%=ljdje%></td>
    <td><%=ljjsjfs%></td>
    <td align="right"><%=ljsjfe%></td>
    <td><%=ljjhddjs%></td>
    <td align="right"><%=ljhddje%></td>

    <td><%=ljlfs%></td>
    <td><%=ljcts%></td>
    <td><%=ljbjs%></td>

    <td><%=ljqys%></td>
    <td align="right"><%=cf.formatDouble(ljqye)%></td>
    <td align="right"><%=ljpjde%></td>
    <td align="right"><%=ljpmjj%></td>
    <td align="right"><%=ljqdzq%></td>


  </tr>
  <%	
		}
		rs.close();
		ps.close();

		if (fgsqys!=0)
		{
			pjde=(int)fgsqye/fgsqys;
		}
		else{
			pjde=0;
		}
		if (fgsfwmj!=0)
		{
			pmjj=(int)fgsqye/fgsfwmj;
		}
		else{
			pmjj=0;
		}

		if (ljfgsqys!=0)
		{
			ljpjde=(int)ljfgsqye/ljfgsqys;
		}
		else{
			ljpjde=0;
		}
		if (ljfgsfwmj!=0)
		{
			ljpmjj=(int)ljfgsqye/ljfgsfwmj;
		}
		else{
			ljpmjj=0;
		}

		//ʧ����
		if (fgskls!=0)
		{
			sbl=cf.round(fgssbkhs*100.0/fgskls,1);
		}
		else{
			sbl=0;
		}
		//ǩ����
		if (fgskls!=0)
		{
			qdl=cf.round(fgsqys*100.0/fgskls,1);
		}
		else{
			qdl=0;
		}
		//�µǼǿ�����ǩ������
		if (fgsqys!=0)
		{
			qdzq=cf.round(fgsqdts/fgsqys,1);
		}
		else{
			qdzq=0;
		}

		//ǩ�������ǩ������
		if (ljfgsqys!=0)
		{
			ljqdzq=cf.round(ljfgsqdts/ljfgsqys,1);
		}
		else{
			ljqdzq=0;
		}

		%> 
  <tr  align="center" height="29" bgcolor="#CCCCCC"> 
    <td colspan="2"><font color="#0000FF"><b><%=fgsmc%>С��</b></font></td>
    <td><font color="#0000FF"><b><%=fgskls%></b></font></td>
    <td><font color="#0000FF"><b><%=fgsztkhs%></b></font></td>
    <td><font color="#0000FF"><b><%=fgssbkhs%></b></font></td>
    <td><font color="#0000FF"><b><%=sbl%>%</b></font></td>

    <td><font color="#0000FF"><b><%=fgsqys%></b></font></td>
    <td><font color="#0000FF"><b><%=qdl%>%</b></font></td>
    <td align="right"><font color="#0000FF"><b><%=cf.formatDouble(fgsqye)%></b></font></td>
	 <td><font color="#0000FF"><b><%=qdzq%></b></font></td>
   <td align="right"><font color="#0000FF"><b><%=pjde%></b></font></td>
    <td align="right"><font color="#0000FF"><b><%=pmjj%></b></font></td>

    <td><font color="#0000FF"><b><%=fgsjdjs%></b></font></td>
    <td align="right"><font color="#0000FF"><b><%=fgsdje%></b></font></td>
    <td><%=fgsjsjfs%></td>
    <td align="right"><%=cf.formatDouble(fgssjfe)%></td>
    <td><%=fgsjhddjs%></td>
    <td align="right"><%=cf.formatDouble(fgshddje)%></td>

    <td><%=fgslfs%></td>
    <td><%=fgscts%></td>
    <td><%=fgsbjs%></td>

		
    <td><font color="#0000FF"><b><%=ljfgsztkhs%></b></font></td>

    <td><font color="#0000FF"><b><%=ljfgsjdjs%></b></font></td>
    <td align="right"><font color="#0000FF"><b><%=ljfgsdje%></b></font></td>
    <td><%=ljfgsjsjfs%></td>
    <td align="right"><%=cf.formatDouble(ljfgssjfe)%></td>
    <td><%=ljfgsjhddjs%></td>
    <td align="right"><%=cf.formatDouble(ljfgshddje)%></td>

    <td><%=ljfgslfs%></td>
    <td><%=ljfgscts%></td>
    <td><%=ljfgsbjs%></td>

    <td><font color="#0000FF"><b><%=ljfgsqys%></b></font></td>
    <td align="right"><font color="#0000FF"><b><%=cf.formatDouble(ljfgsqye)%></b></font></td>
    <td align="right"><font color="#0000FF"><b><%=ljpjde%></b></font></td>
    <td align="right"><font color="#0000FF"><b><%=ljpmjj%></b></font></td>
    <td align="right"><font color="#0000FF"><b><%=ljqdzq%></b></font></td>
		
		
		</tr>
  <%	
	}
	rs2.close();
	ps2.close();

	
	if (allqys!=0)
	{
		pjde=(int)allqye/allqys;
	}
	else{
		pjde=0;
	}
	if (allfwmj!=0)
	{
		pmjj=(int)allqye/allfwmj;
	}
	else{
		pmjj=0;
	}

	if (ljallqys!=0)
	{
		ljpjde=(int)ljallqye/ljallqys;
	}
	else{
		ljpjde=0;
	}
	if (ljallfwmj!=0)
	{
		ljpmjj=(int)ljallqye/ljallfwmj;
	}
	else{
		ljpmjj=0;
	}

	//ʧ����
	if (allkls!=0)
	{
		sbl=cf.round(allsbkhs*100.0/allkls,1);
	}
	else{
		sbl=0;
	}
	//ǩ����
	if (allkls!=0)
	{
		qdl=cf.round(allqys*100.0/allkls,1);
	}
	else{
		qdl=0;
	}
	//�µǼǿ�����ǩ������
	if (allqys!=0)
	{
		qdzq=cf.round(allqdts/allqys,1);
	}
	else{
		qdzq=0;
	}

	//ǩ�������ǩ������
	if (ljallqys!=0)
	{
		ljqdzq=cf.round(ljallqdts/ljallqys,1);
	}
	else{
		ljqdzq=0;
	}


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
  <tr  align="center" height="29" bgcolor="#CCCCCC"> 
    <td colspan="2"><font color="#0000FF"><b>��&nbsp;&nbsp;&nbsp;&nbsp;��</b></font></td>
    <td><font color="#0000FF"><b><%=allkls%></b></font></td>
    <td><font color="#0000FF"><b><%=allztkhs%></b></font></td>
    <td><font color="#0000FF"><b><%=allsbkhs%></b></font></td>
    <td><font color="#0000FF"><b><%=sbl%>%</b></font></td>

    <td><font color="#0000FF"><b><%=allqys%></b></font></td>
    <td><font color="#0000FF"><b><%=qdl%>%</b></font></td>
    <td align="right"><font color="#0000FF"><b><%=cf.formatDouble(allqye)%></b></font></td>
    <td><font color="#0000FF"><b><%=qdzq%>%</b></font></td>
    <td align="right"><font color="#0000FF"><b><%=pjde%></b></font></td>
    <td align="right"><font color="#0000FF"><b><%=pmjj%></b></font></td>
    <td><font color="#0000FF"><b><%=alljdjs%></b></font></td>
    <td align="right"><font color="#0000FF"><b><%=alldje%></b></font></td>
    <td><%=alljsjfs%></td>
    <td align="right"><%=cf.formatDouble(allsjfe)%></td>
    <td><%=alljhddjs%></td>
    <td align="right"><%=cf.formatDouble(allhddje)%></td>
    <td><%=alllfs%></td>
    <td><%=allcts%></td>
    <td><%=allbjs%></td>

    <td><font color="#0000FF"><b><%=ljallztkhs%></b></font></td>
    <td><font color="#0000FF"><b><%=ljalljdjs%></b></font></td>
    <td align="right"><font color="#0000FF"><b><%=ljalldje%></b></font></td>
    <td><%=ljalljsjfs%></td>
    <td align="right"><%=cf.formatDouble(ljallsjfe)%></td>
    <td><%=ljalljhddjs%></td>
    <td align="right"><%=cf.formatDouble(ljallhddje)%></td>
    <td><%=ljalllfs%></td>
    <td><%=ljallcts%></td>
    <td><%=ljallbjs%></td>

    <td><font color="#0000FF"><b><%=ljallqys%></b></font></td>
    <td align="right"><font color="#0000FF"><b><%=cf.formatDouble(ljallqye)%></b></font></td>
    <td align="right"><font color="#0000FF"><b><%=ljpjde%></b></font></td>
    <td align="right"><font color="#0000FF"><b><%=ljpmjj%></b></font></td>
    <td align="right"><font color="#0000FF"><b><%=ljqdzq%></b></font></td>
  
  
  
  </tr>
</table>
</body>
</html>