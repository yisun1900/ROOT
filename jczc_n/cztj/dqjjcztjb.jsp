<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='090401'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[�����ֵͳ��]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'����[�����ֵͳ��]��"+xtrzyhmc+"') ";
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

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String ssdqbm=cf.fillNull(request.getParameter("ssdqbm"));
String fgs=cf.fillNull(request.getParameter("fgs"));
String dwbh=cf.fillNull(request.getParameter("dwbh"));

String wheresql="";
String wheresql1="";
String wheresql2="";

if (!dwbh.equals(""))
{
	return;
}
if (!fgs.equals(""))
{
	return;
}



if (!(ssdqbm.equals("")))
{
	wheresql+=" and  (crm_khxx.fgsbh in(select dwbh from sq_dwxx where dwlx='F0' and ssdqbm='"+ssdqbm+"'))";
	wheresql1+=" and  (a.ssdqbm='"+ssdqbm+"')";
	wheresql2+=" and  (fgsbh in(select dwbh from sq_dwxx where dwlx='F0' and ssdqbm='"+ssdqbm+"'))";
}

if (!(fgs.equals("")))
{
	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	wheresql1+=" and  (a.ssfgs='"+fgs+"')";
	wheresql2+=" and  (fgsbh='"+fgs+"')";
}

if (!(dwbh.equals("")))
{
	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	wheresql1+=" and  a.dwbh='"+dwbh+"'";
	wheresql2+=" and  qddm='"+dwbh+"'";
}


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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>�����ҾӲ�ֵͳ��</B><BR>
  <b>(ͳ��ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</b>
</CENTER>


<table border="1" width="4220" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="40">���</td>
    <td  width="120">����</td>
    <td  width="80">����������������</td>
    <td  width="80">�ۼƶ�������δǩ����</td>
    <td  width="80">����ǩ����</td>
    <td  width="100">��װǩԼ��</td>
    <td  width="100">��װǩԼ��</td>
    <td  width="100"><font color="#000099"><b>�Ҿ�ǩԼ��</b></font></td>
    <td  width="70"><font color="#000099"><b>�Ҿ���/��װ��</b></font></td>
    <td  width="70"><font color="#000099"><b>ռ�ܼҾ�ǩԼ������</b></font></td>
    <td  width="100"><font color="#000099"><b>�Ҿ�ǩԼ��</b></font></td>
    <td  width="70"><font color="#000099"><b>�ҾӶ�/��װ��</b></font></td>
    <td  width="70"><font color="#000099"><b>ռ�ܼҾ�ǩԼ�����</b></font></td>
    <td  width="100">ľ��ǩԼ��</td>
    <td  width="70">ľ����/��װ��</td>
    <td  width="70">ľ����/�Ҿ���</td>
    <td  width="70">ռȫ��ľ��ǩԼ������</td>
    <td  width="100">ľ��ǩԼ��</td>
    <td  width="70">ľ�Ŷ�/��װ��</td>
    <td  width="70">ľ�Ŷ�/�ҾӶ�</td>
    <td  width="70">ռȫ��ľ��ǩԼ�����</td>
    <td  width="100"><font color="#000099"><b>����ǩԼ��</b></font></td>
    <td  width="70"><font color="#000099"><b>������/��װ��</b></font></td>
    <td  width="70"><font color="#000099"><b>������/�Ҿ���</b></font></td>
    <td  width="70"><font color="#000099"><b>ռȫ������ǩԼ������</b></font></td>
    <td  width="100"><font color="#000099"><b>����ǩԼ��</b></font></td>
    <td  width="70"><font color="#000099"><b>�����/��װ��</b></font></td>
    <td  width="70"><font color="#000099"><b>�����/�ҾӶ�</b></font></td>
    <td  width="70"><font color="#000099"><b>ռȫ������ǩԼ�����</b></font></td>
    <td  width="100">�Ҿ�ǩԼ��</td>
    <td  width="70">�Ҿ���/��װ��</td>
    <td  width="70">�Ҿ���/�Ҿ���</td>
    <td  width="70">ռȫ���Ҿ�ǩԼ������</td>
    <td  width="100">�Ҿ�ǩԼ��</td>
    <td  width="70">�Ҿ߶�/��װ��</td>
    <td  width="70">�Ҿ߶�/�ҾӶ�</td>
    <td  width="70">ռȫ���Ҿ�ǩԼ�����</td>

    <td  width="100"><font color="#000099"><b>�ذ�</b></font></td>
    <td  width="100"><font color="#000099"><b>���</b></font></td>
    <td  width="100"><font color="#000099"><b>��ש</b></font></td>
    <td  width="100"><font color="#000099"><b>����</b></font></td>
    <td  width="100"><font color="#000099"><b>����</b></font></td>
	
	
	<td  width="100"><font color="#000099"><b>����ǩԼ��</b></font></td>
    <td  width="70"><font color="#000099"><b>������/��װ��</b></font></td>
    <td  width="70"><font color="#000099"><b>������/�Ҿ���</b></font></td>
    <td  width="70"><font color="#000099"><b>ռȫ������ǩԼ������</b></font></td>
    <td  width="100"><font color="#000099"><b>����ǩԼ��</b></font></td>
    <td  width="70"><font color="#000099"><b>���Ķ�/��װ��</b></font></td>
    <td  width="70"><font color="#000099"><b>���Ķ�/�ҾӶ�</b></font></td>
    <td  width="70"><font color="#000099"><b>ռȫ������ǩԼ�����</b></font></td>
  </tr>
  <%
	
	String oldfgs="";

	int row=0;
	
	String fgsbh=null;
	String fgsmc=null;

	double jzqye=0;
	int jzqys=0;
	double mmqye=0;
	int mmqys=0;
	int cgqys=0;
	double cgqye=0;
	int jjqys=0;
	double jjqye=0;
	int zcqys=0;
	double zcqye=0;

	int jcqys=0;
	double jcqye=0;

	int xjjzqys=0;
	double xjjzqye=0;	
	int xjmmqys=0;
	double xjmmqye=0;
	int xjcgqys=0;
	double xjcgqye=0;
	int xjjjqys=0;
	double xjjjqye=0;
	int xjzcqys=0;
	double xjzcqye=0;

	int xjjcqys=0;
	double xjjcqye=0;

	int zjjzqys=0;
	double zjjzqye=0;	
	int zjmmqys=0;
	double zjmmqye=0;
	int zjcgqys=0;
	double zjcgqye=0;
	int zjjjqys=0;
	double zjjjqye=0;
	int zjzcqys=0;
	double zjzcqye=0;

	int zjjcqys=0;
	double zjjcqye=0;

	double zcdbje=0;
	double zcjjje=0;
	double zcczje=0;
	double zcbyje=0;
	double zcqtje=0;

	double xjzcdbje=0;
	double xjzcjjje=0;
	double xjzcczje=0;
	double xjzcbyje=0;
	double xjzcqtje=0;

	double zjzcdbje=0;
	double zjzcjjje=0;
	double zjzcczje=0;
	double zjzcbyje=0;
	double zjzcqtje=0;

	int sdjs=0;
	int ljsdjs=0;
	int djqds=0;
	int xjsdjs=0;
	int xjljsdjs=0;
	int xjdjqds=0;
	int zjsdjs=0;
	int zjljsdjs=0;
	int zjdjqds=0;


//ȫ��ҵ��ͳ��++++++++++++++++++++++++++++

	ls_sql=" SELECT count(*) jzqys,sum(qye) jzqye ";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.fgsbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_khxx.zt!='3' ";
	ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
	ls_sql+=wheresql;
	ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ps1= conn.prepareStatement(ls_sql);
	rs1=ps1.executeQuery();
	if(rs1.next())
	{
		zjjzqys=rs1.getInt("jzqys");
		zjjzqye=rs1.getDouble("jzqye");
	}
	rs1.close();
	ps1.close();

	//ľ�Ž�����
	//ǩԼ
	int mmqds=0;
	double mmqde=0;
	ls_sql="SELECT sum(jc_mmydd.htje) htze,count(distinct jc_mmydd.khbh) mmqys";
	ls_sql+=" FROM jc_mmydd,sq_dwxx";
	ls_sql+=" where jc_mmydd.fgsbh=sq_dwxx.dwbh(+)";
	ls_sql+=" ";
	ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
	ls_sql+=wheresql2;
	ls_sql+=" and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_mmydd.htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_mmydd.clzt>='04' and jc_mmydd.clzt!='98'";//04��ǩ����ͬ
	ps1= conn.prepareStatement(ls_sql);
	rs1=ps1.executeQuery();
	if(rs1.next())
	{
		mmqde=rs1.getDouble(1);
		mmqds=rs1.getInt(2);
	}
	rs1.close();
	ps1.close();

	//�˵�
	int mmtds=0;
	double mmtde=0;
	ls_sql="SELECT sum(jc_mmydd.zjhze) htze,count(distinct jc_mmydd.khbh) mmqys";
	ls_sql+=" FROM jc_mmydd,sq_dwxx";
	ls_sql+=" where jc_mmydd.fgsbh=sq_dwxx.dwbh(+)";
	ls_sql+=" ";
	ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
	ls_sql+=wheresql2;
	ls_sql+=" and jc_mmydd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_mmydd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_mmydd.clzt='99' ";
	ps1= conn.prepareStatement(ls_sql);
	rs1=ps1.executeQuery();
	if(rs1.next())
	{
		mmtde=rs1.getDouble(1);
		mmtds=rs1.getInt(2);
	}
	rs1.close();
	ps1.close();

	//������
	double mmzjx=0;
	ls_sql="SELECT sum(jc_mmzjx.zjxze) zjxze";
	ls_sql+=" FROM jc_mmzjx,sq_dwxx";
	ls_sql+=" where jc_mmzjx.fgsbh=sq_dwxx.dwbh(+)";
	ls_sql+=" ";
	ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
	ls_sql+=wheresql2;
	ls_sql+=" and jc_mmzjx.clzt not in('00')";
	ls_sql+=" and jc_mmzjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_mmzjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ps1= conn.prepareStatement(ls_sql);
	rs1=ps1.executeQuery();
	if(rs1.next())
	{
		mmzjx=rs1.getDouble(1);
	}
	rs1.close();
	ps1.close();

	zjmmqys=mmqds-mmtds;
	zjmmqye=mmqde-mmtde+mmzjx;


	//���������
	//ǩ��
	double cgqde=0;
	int cgqds=0;
	ls_sql="SELECT sum(jc_cgdd.htze) htze,count(distinct jc_cgdd.khbh) cgqys";
	ls_sql+=" FROM jc_cgdd,sq_dwxx";
	ls_sql+=" where jc_cgdd.fgsbh=sq_dwxx.dwbh(+)";
	ls_sql+=" ";
	ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
	ls_sql+=wheresql2;
	ls_sql+=" and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_cgdd.clzt>='13' and jc_cgdd.clzt!='98'";//13��ǩ����ͬ
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if(rs1.next())
	{
		cgqde=rs1.getDouble(1);//������
		cgqds=rs1.getInt(2);//��������
	}
	rs1.close();
	ps1.close();

	//�˵�
	double cgtde=0;
	int cgtds=0;
	ls_sql="SELECT sum(jc_cgdd.zjhze) htze,count(distinct jc_cgdd.khbh) cgqys";
	ls_sql+=" FROM jc_cgdd,sq_dwxx";
	ls_sql+=" where jc_cgdd.fgsbh=sq_dwxx.dwbh(+)";
	ls_sql+=" ";
	ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
	ls_sql+=wheresql2;
	ls_sql+=" and jc_cgdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_cgdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_cgdd.clzt='99' ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if(rs1.next())
	{
		cgtde=rs1.getDouble(1);//������
		cgtds=rs1.getInt(2);//��������
	}
	rs1.close();
	ps1.close();

	//������
	double cgzjx=0;
	ls_sql="SELECT sum(jc_cgzjx.zjxze) zjxze";
	ls_sql+=" FROM jc_cgzjx,sq_dwxx";
	ls_sql+=" where jc_cgzjx.fgsbh=sq_dwxx.dwbh(+)";
	ls_sql+=" ";
	ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
	ls_sql+=wheresql2;
	ls_sql+=" and jc_cgzjx.clzt not in('00')";
	ls_sql+=" and jc_cgzjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_cgzjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if(rs1.next())
	{
		cgzjx=rs1.getDouble(1);//������
	}
	rs1.close();
	ps1.close();

	zjcgqys=cgqds-cgtds;
	zjcgqye=cgqde-cgtde+cgzjx;


	//�Ҿ߽�����
	//ǩ��
	double jjqde=0;
	int jjqds=0;
	ls_sql="SELECT sum(jc_jjdd.htze) htze,count(distinct jc_jjdd.khbh) jjqys";
	ls_sql+=" FROM jc_jjdd,sq_dwxx";
	ls_sql+=" where jc_jjdd.fgsbh=sq_dwxx.dwbh(+)";
	ls_sql+=" ";
	ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
	ls_sql+=wheresql2;
	ls_sql+=" and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_jjdd.clzt>='13' and jc_jjdd.clzt!='98'";//13��ǩ����ͬ
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if(rs1.next())
	{
		jjqde=rs1.getDouble(1);//�Ҿ߽��
		jjqds=rs1.getInt(2);//�Ҿ�����
	}
	rs1.close();
	ps1.close();

	//�˵�
	double jjtde=0;
	int jjtds=0;
	ls_sql="SELECT sum(jc_jjdd.zjhze) htze,count(distinct jc_jjdd.khbh) jjqys";
	ls_sql+=" FROM jc_jjdd,sq_dwxx";
	ls_sql+=" where jc_jjdd.fgsbh=sq_dwxx.dwbh(+)";
	ls_sql+=" ";
	ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
	ls_sql+=wheresql2;
	ls_sql+=" and jc_jjdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_jjdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_jjdd.clzt='99'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if(rs1.next())
	{
		jjtde=rs1.getDouble(1);//�Ҿ߽��
		jjtds=rs1.getInt(2);//�Ҿ�����
	}
	rs1.close();
	ps1.close();

	//������
	double jjzjx=0;
	ls_sql="SELECT sum(jc_jjzjx.zjxze) zjxze";
	ls_sql+=" FROM jc_jjzjx,sq_dwxx";
	ls_sql+=" where jc_jjzjx.fgsbh=sq_dwxx.dwbh(+)";
	ls_sql+=" ";
	ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
	ls_sql+=wheresql2;
	ls_sql+=" and jc_jjzjx.clzt not in('00')";
	ls_sql+=" and jc_jjzjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_jjzjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if(rs1.next())
	{
		jjzjx=rs1.getDouble(1);//�Ҿ߽��
	}
	rs1.close();
	ps1.close();

	zjjjqys=jjqds-jjtds;
	zjjjqye=jjqde-jjtde+jjzjx;

	//���Ľ�����
	//ǩ��
	double zcqde=0;
	int zcqds=0;
	ls_sql="SELECT sum(jc_zcdd.hkze) htze,count(distinct jc_zcdd.khbh) zcqys";
	ls_sql+=" FROM jc_zcdd,sq_dwxx";
	ls_sql+=" where jc_zcdd.fgsbh=sq_dwxx.dwbh(+)";
	ls_sql+=" ";
	ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
	ls_sql+=wheresql2;
	ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='98'";//09����ͬ�����
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if(rs1.next())
	{
		zcqde=rs1.getDouble(1);//���Ľ��
		zcqds=rs1.getInt(2);//��������
	}
	rs1.close();
	ps1.close();

	//�˵�
	double zctde=0;
	int zctds=0;
	ls_sql="SELECT sum(jc_zcdd.hkze+zjhze) htze,count(distinct jc_zcdd.khbh) zcqys";
	ls_sql+=" FROM jc_zcdd,sq_dwxx";
	ls_sql+=" where jc_zcdd.fgsbh=sq_dwxx.dwbh(+)";
	ls_sql+=" ";
	ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
	ls_sql+=wheresql2;
	ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_zcdd.clzt='99'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if(rs1.next())
	{
		zctde=rs1.getDouble(1);//���Ľ��
		zctds=rs1.getInt(2);//��������
	}
	rs1.close();
	ps1.close();

	//������
	double zczjx=0;
	ls_sql="SELECT sum(jc_zczjx.zjxze) zjxze";
	ls_sql+=" FROM jc_zczjx,sq_dwxx";
	ls_sql+=" where jc_zczjx.fgsbh=sq_dwxx.dwbh(+)";
	ls_sql+=" ";
	ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
	ls_sql+=wheresql2;
	ls_sql+=" and jc_zczjx.clzt not in('00')";
	ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if(rs1.next())
	{
		zczjx=rs1.getDouble(1);//���Ľ��
	}
	rs1.close();
	ps1.close();

	zjzcqys=zcqds-zctds;
	zjzcqye=zcqde-zctde+zczjx;


	ls_sql="SELECT count(distinct khbh)";
	ls_sql+=" FROM (";

	ls_sql+=" SELECT jc_mmydd.khbh";
	ls_sql+=" FROM jc_mmydd,sq_dwxx";
	ls_sql+=" where jc_mmydd.fgsbh=sq_dwxx.dwbh(+)";
	ls_sql+=" ";
	ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
	ls_sql+=wheresql2;
	ls_sql+=" and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_mmydd.htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_mmydd.clzt>='04' and jc_mmydd.clzt!='99'";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT jc_cgdd.khbh";
	ls_sql+=" FROM jc_cgdd,sq_dwxx";
	ls_sql+=" where jc_cgdd.fgsbh=sq_dwxx.dwbh(+)";
	ls_sql+=" ";
	ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
	ls_sql+=wheresql2;
	ls_sql+=" and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_cgdd.clzt>='13' and jc_cgdd.clzt!='99'";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT jc_jjdd.khbh";
	ls_sql+=" FROM jc_jjdd,sq_dwxx";
	ls_sql+=" where jc_jjdd.fgsbh=sq_dwxx.dwbh(+)";
	ls_sql+=" ";
	ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
	ls_sql+=wheresql2;
	ls_sql+=" and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_jjdd.clzt>='13' and jc_jjdd.clzt!='99'";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT jc_zcdd.khbh";
	ls_sql+=" FROM jc_zcdd,sq_dwxx";
	ls_sql+=" where jc_zcdd.fgsbh=sq_dwxx.dwbh(+)";
	ls_sql+=" ";
	ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
	ls_sql+=wheresql2;
	ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='99'";

	ls_sql+=" )";

	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if(rs1.next())
	{
		zjjcqys=rs1.getInt(1);//�Ҿ�����
	}
	rs1.close();
	ps1.close();

	zjjcqye=zjmmqye+zjcgqye+zjjjqye+zjzcqye;


//ȫ��ҵ��ͳ��----------------------------


	String getssdqbm=null;
	String getssdqmc=null;

	ls_sql=" SELECT ssdqbm,ssdqmc";
	ls_sql+=" FROM sq_ssdqbm";
	if (!ssdqbm.equals(""))
	{
		ls_sql+=" where ssdqbm='"+ssdqbm+"'";
	}
	ls_sql+=" order by ssdqbm";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{	
		getssdqbm=rs2.getString("ssdqbm");
		getssdqmc=rs2.getString("ssdqmc");

		row++;

		xjjzqye=0;
		xjjzqys=0;

		xjzcqys=0;//����������
		xjzcqye=0;//���������ܶ�
		xjjjqys=0;//�Ҿ�������
		xjjjqye=0;//���мҾ��ܶ�
		xjcgqys=0;//����������
		xjcgqye=0;//���г����ܶ�
		xjmmqys=0;//ľ��������
		xjmmqye=0;//����ľ���ܶ�

		xjjcqys=0;
		xjjcqye=0;

		xjzcdbje=0;
		xjzcjjje=0;
		xjzcczje=0;
		xjzcbyje=0;
		xjzcqtje=0;

		xjsdjs=0;
		xjljsdjs=0;
		xjdjqds=0;


		//�ն�����		
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx,sq_dwxx";
		ls_sql+=" where crm_zxkhxx.lfdjbz='Y' ";
		ls_sql+=" and crm_zxkhxx.jlfdjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.jlfdjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

		ls_sql+=" and crm_zxkhxx.ssfgs=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{	
			xjsdjs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		//�ۼ��ն�����		
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx,sq_dwxx";
		ls_sql+=" where crm_zxkhxx.lfdjbz='Y' ";
		ls_sql+=" and crm_zxkhxx.zxzt not in('2','3','4')";

		ls_sql+=" and crm_zxkhxx.ssfgs=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{	
			xjljsdjs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		//����ǩ����		
		ls_sql=" SELECT count(*) ";
		ls_sql+=" FROM crm_khxx,crm_zxkhxx,sq_dwxx";
		ls_sql+=" where crm_khxx.zt!='3' ";
		ls_sql+=" and crm_khxx.khbh=crm_zxkhxx.khbh";
		ls_sql+=" and crm_zxkhxx.lfdjbz='Y' ";
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

		ls_sql+=" and crm_khxx.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
		
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{	
			xjdjqds=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		zjsdjs+=xjsdjs;
		zjljsdjs+=xjljsdjs;
		zjdjqds+=xjdjqds;


//����ҵ��ͳ��++++++++++++++++++++++++++++

		ls_sql=" SELECT count(*) jzqys,sum(qye) jzqye ";
		ls_sql+=" FROM crm_khxx,sq_dwxx";
		ls_sql+=" where crm_khxx.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and crm_khxx.zt!='3' and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
		ls_sql+=wheresql;
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if(rs1.next())
		{
			xjjzqys=rs1.getInt("jzqys");
			xjjzqye=rs1.getDouble("jzqye");
		}
		rs1.close();
		ps1.close();

		//ľ�Ž�����
		//ǩԼ
		mmqds=0;
		mmqde=0;
		ls_sql="SELECT sum(jc_mmydd.htje) htze,count(distinct jc_mmydd.khbh) mmqys";
		ls_sql+=" FROM jc_mmydd,sq_dwxx";
		ls_sql+=" where jc_mmydd.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
		ls_sql+=wheresql2;
		ls_sql+=" and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_mmydd.htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_mmydd.clzt>='04' and jc_mmydd.clzt!='98'";//04��ǩ����ͬ
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if(rs1.next())
		{
			mmqde=rs1.getDouble(1);
			mmqds=rs1.getInt(2);
		}
		rs1.close();
		ps1.close();

		//�˵�
		mmtds=0;
		mmtde=0;
		ls_sql="SELECT sum(jc_mmydd.zjhze) htze,count(distinct jc_mmydd.khbh) mmqys";
		ls_sql+=" FROM jc_mmydd,sq_dwxx";
		ls_sql+=" where jc_mmydd.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
		ls_sql+=wheresql2;
		ls_sql+=" and jc_mmydd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_mmydd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_mmydd.clzt='99' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if(rs1.next())
		{
			mmtde=rs1.getDouble(1);
			mmtds=rs1.getInt(2);
		}
		rs1.close();
		ps1.close();

		//������
		mmzjx=0;
		ls_sql="SELECT sum(jc_mmzjx.zjxze) zjxze";
		ls_sql+=" FROM jc_mmzjx,sq_dwxx";
		ls_sql+=" where jc_mmzjx.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
		ls_sql+=wheresql2;
		ls_sql+=" and jc_mmzjx.clzt not in('00')";
		ls_sql+=" and jc_mmzjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_mmzjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if(rs1.next())
		{
			mmzjx=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		xjmmqys=mmqds-mmtds;
		xjmmqye=mmqde-mmtde+mmzjx;


		//���������
		//ǩ��
		cgqde=0;
		cgqds=0;
		ls_sql="SELECT sum(jc_cgdd.htze) htze,count(distinct jc_cgdd.khbh) cgqys";
		ls_sql+=" FROM jc_cgdd,sq_dwxx";
		ls_sql+=" where jc_cgdd.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
		ls_sql+=wheresql2;
		ls_sql+=" and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_cgdd.clzt>='13' and jc_cgdd.clzt!='98'";//13��ǩ����ͬ
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			cgqde=rs1.getDouble(1);//������
			cgqds=rs1.getInt(2);//��������
		}
		rs1.close();
		ps1.close();

		//�˵�
		cgtde=0;
		cgtds=0;
		ls_sql="SELECT sum(jc_cgdd.zjhze) htze,count(distinct jc_cgdd.khbh) cgqys";
		ls_sql+=" FROM jc_cgdd,sq_dwxx";
		ls_sql+=" where jc_cgdd.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
		ls_sql+=wheresql2;
		ls_sql+=" and jc_cgdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_cgdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_cgdd.clzt='99' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			cgtde=rs1.getDouble(1);//������
			cgtds=rs1.getInt(2);//��������
		}
		rs1.close();
		ps1.close();

		//������
		cgzjx=0;
		ls_sql="SELECT sum(jc_cgzjx.zjxze) zjxze";
		ls_sql+=" FROM jc_cgzjx,sq_dwxx";
		ls_sql+=" where jc_cgzjx.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
		ls_sql+=wheresql2;
		ls_sql+=" and jc_cgzjx.clzt not in('00')";
		ls_sql+=" and jc_cgzjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_cgzjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			cgzjx=rs1.getDouble(1);//������
		}
		rs1.close();
		ps1.close();

		xjcgqys=cgqds-cgtds;
		xjcgqye=cgqde-cgtde+cgzjx;
		
		//�Ҿ߽�����
		//ǩ��
		jjqde=0;
		jjqds=0;
		ls_sql="SELECT sum(jc_jjdd.htze) htze,count(distinct jc_jjdd.khbh) jjqys";
		ls_sql+=" FROM jc_jjdd,sq_dwxx";
		ls_sql+=" where jc_jjdd.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
		ls_sql+=wheresql2;
		ls_sql+=" and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_jjdd.clzt>='13' and jc_jjdd.clzt!='98'";//13��ǩ����ͬ
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			jjqde=rs1.getDouble(1);//�Ҿ߽��
			jjqds=rs1.getInt(2);//�Ҿ�����
		}
		rs1.close();
		ps1.close();

		//�˵�
		jjtde=0;
		jjtds=0;
		ls_sql="SELECT sum(jc_jjdd.zjhze) htze,count(distinct jc_jjdd.khbh) jjqys";
		ls_sql+=" FROM jc_jjdd,sq_dwxx";
		ls_sql+=" where jc_jjdd.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
		ls_sql+=wheresql2;
		ls_sql+=" and jc_jjdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_jjdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_jjdd.clzt='99'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			jjtde=rs1.getDouble(1);//�Ҿ߽��
			jjtds=rs1.getInt(2);//�Ҿ�����
		}
		rs1.close();
		ps1.close();

		//������
		jjzjx=0;
		ls_sql="SELECT sum(jc_jjzjx.zjxze) zjxze";
		ls_sql+=" FROM jc_jjzjx,sq_dwxx";
		ls_sql+=" where jc_jjzjx.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
		ls_sql+=wheresql2;
		ls_sql+=" and jc_jjzjx.clzt not in('00')";
		ls_sql+=" and jc_jjzjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_jjzjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			jjzjx=rs1.getDouble(1);//�Ҿ߽��
		}
		rs1.close();
		ps1.close();

		xjjjqys=jjqds-jjtds;
		xjjjqye=jjqde-jjtde+jjzjx;

		//���Ľ�����
		//ǩ��
		zcqde=0;
		zcqds=0;
		ls_sql="SELECT sum(jc_zcdd.hkze) htze,count(distinct jc_zcdd.khbh) zcqys";
		ls_sql+=" FROM jc_zcdd,sq_dwxx";
		ls_sql+=" where jc_zcdd.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
		ls_sql+=wheresql2;
		ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='98'";//09����ͬ�����
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			zcqde=rs1.getDouble(1);//���Ľ��
			zcqds=rs1.getInt(2);//��������
		}
		rs1.close();
		ps1.close();

		//�˵�
		zctde=0;
		zctds=0;
		ls_sql="SELECT sum(jc_zcdd.hkze+zjhze) htze,count(distinct jc_zcdd.khbh) zcqys";
		ls_sql+=" FROM jc_zcdd,sq_dwxx";
		ls_sql+=" where jc_zcdd.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
		ls_sql+=wheresql2;
		ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.clzt='99'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			zctde=rs1.getDouble(1);//���Ľ��
			zctds=rs1.getInt(2);//��������
		}
		rs1.close();
		ps1.close();

		//������
		zczjx=0;
		ls_sql="SELECT sum(jc_zczjx.zjxze) zjxze";
		ls_sql+=" FROM jc_zczjx,sq_dwxx";
		ls_sql+=" where jc_zczjx.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
		ls_sql+=wheresql2;
		ls_sql+=" and jc_zczjx.clzt not in('00')";
		ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			zczjx=rs1.getDouble(1);//���Ľ��
		}
		rs1.close();
		ps1.close();

		xjzcqys=zcqds-zctds;
		xjzcqye=zcqde-zctde+zczjx;

		ls_sql="SELECT count(distinct khbh)";
		ls_sql+=" FROM (";

		ls_sql+=" SELECT jc_mmydd.khbh";
		ls_sql+=" FROM jc_mmydd,sq_dwxx";
		ls_sql+=" where jc_mmydd.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
		ls_sql+=wheresql2;
		ls_sql+=" and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_mmydd.htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_mmydd.clzt>='04' and jc_mmydd.clzt!='99'";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT jc_cgdd.khbh";
		ls_sql+=" FROM jc_cgdd,sq_dwxx";
		ls_sql+=" where jc_cgdd.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
		ls_sql+=wheresql2;
		ls_sql+=" and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_cgdd.clzt>='13' and jc_cgdd.clzt!='99'";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT jc_jjdd.khbh";
		ls_sql+=" FROM jc_jjdd,sq_dwxx";
		ls_sql+=" where jc_jjdd.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
		ls_sql+=wheresql2;
		ls_sql+=" and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_jjdd.clzt>='13' and jc_jjdd.clzt!='99'";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT jc_zcdd.khbh";
		ls_sql+=" FROM jc_zcdd,sq_dwxx";
		ls_sql+=" where jc_zcdd.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and sq_dwxx.ssdqbm='"+getssdqbm+"'";
		ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
		ls_sql+=wheresql2;
		ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='99'";

		ls_sql+=" )";

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			xjjcqys=rs1.getInt(1);//�Ҿ�����
		}
		rs1.close();
		ps1.close();

		xjjcqye=xjmmqye+xjcgqye+xjjjqye+xjzcqye;



		double dmjcjzsbl=0;
		double dmjcjzebl=0;
		double dmjcsbl=0;
		double dmjcebl=0;

		if (xjjzqys==0)
		{
			dmjcjzsbl=0;
		}
		else{
			dmjcjzsbl=xjjcqys*100.0/xjjzqys;
		}

		if (xjjzqye==0)
		{
			dmjcjzebl=0;
		}
		else{
			dmjcjzebl=xjjcqye*100.0/xjjzqye;
		}

		if (zjjcqys==0)
		{
			dmjcsbl=0;
		}
		else{
			dmjcsbl=xjjcqys*100.0/zjjcqys;
		}
		if (zjjcqye==0)
		{
			dmjcebl=0;
		}
		else{
			dmjcebl=xjjcqye*100.0/zjjcqye;
		}

		double dmmmjzsbl=0;
		double dmmmjzebl=0;
		double dmmmjcsbl=0;
		double dmmmjcebl=0;
		double dmmmsbl=0;
		double dmmmebl=0;
		if (xjjzqys==0)
		{
			dmmmjzsbl=0;
		}
		else{
			dmmmjzsbl=xjmmqys*100.0/xjjzqys;
		}

		if (xjjzqye==0)
		{
			dmmmjzebl=0;
		}
		else{
			dmmmjzebl=xjmmqye*100.0/xjjzqye;
		}

		if (xjjcqys==0)
		{
			dmmmjcsbl=0;
		}
		else{
			dmmmjcsbl=xjmmqys*100.0/xjjcqys;
		}
		if (xjjcqye==0)
		{
			dmmmjcebl=0;
		}
		else{
			dmmmjcebl=xjmmqye*100.0/xjjcqye;
		}

		if (zjmmqys==0)
		{
			dmmmsbl=0;
		}
		else{
			dmmmsbl=xjmmqys*100.0/zjmmqys;
		}
		if (zjmmqye==0)
		{
			dmmmebl=0;
		}
		else{
			dmmmebl=xjmmqye*100.0/zjmmqye;
		}


		double dmcgjzsbl=0;
		double dmcgjzebl=0;
		double dmcgsbl=0;
		double dmcgebl=0;
		double dmcgjcsbl=0;
		double dmcgjcebl=0;

		if (xjjzqys==0)
		{
			dmcgjzsbl=0;
		}
		else{
			dmcgjzsbl=xjcgqys*100.0/xjjzqys;
		}

		if (xjjzqye==0)
		{
			dmcgjzebl=0;
		}
		else{
			dmcgjzebl=xjcgqye*100.0/xjjzqye;
		}

		if (xjjcqys==0)
		{
			dmcgjcsbl=0;
		}
		else{
			dmcgjcsbl=xjcgqys*100.0/xjjcqys;
		}
		if (xjjcqye==0)
		{
			dmcgjcebl=0;
		}
		else{
			dmcgjcebl=xjcgqye*100.0/xjjcqye;
		}

		if (zjcgqys==0)
		{
			dmcgsbl=0;
		}
		else{
			dmcgsbl=xjcgqys*100.0/zjcgqys;
		}
		if (zjcgqye==0)
		{
			dmcgebl=0;
		}
		else{
			dmcgebl=xjcgqye*100.0/zjcgqye;
		}

		double dmjjjzsbl=0;
		double dmjjjzebl=0;
		double dmjjsbl=0;
		double dmjjebl=0;
		double dmjjjcsbl=0;
		double dmjjjcebl=0;

		if (xjjzqys==0)
		{
			dmjjjzsbl=0;
		}
		else{
			dmjjjzsbl=xjjjqys*100.0/xjjzqys;
		}

		if (xjjzqye==0)
		{
			dmjjjzebl=0;
		}
		else{
			dmjjjzebl=xjjjqye*100.0/xjjzqye;
		}

		if (xjjcqys==0)
		{
			dmjjjcsbl=0;
		}
		else{
			dmjjjcsbl=xjjjqys*100.0/xjjcqys;
		}
		if (xjjcqye==0)
		{
			dmjjjcebl=0;
		}
		else{
			dmjjjcebl=xjjjqye*100.0/xjjcqye;
		}

		if (zjjjqys==0)
		{
			dmjjsbl=0;
		}
		else{
			dmjjsbl=xjjjqys*100.0/zjjjqys;
		}
		if (zjjjqye==0)
		{
			dmjjebl=0;
		}
		else{
			dmjjebl=xjjjqye*100.0/zjjjqye;
		}

		double dmzcjzsbl=0;
		double dmzcjzebl=0;
		double dmzcsbl=0;
		double dmzcebl=0;
		double dmzcjcsbl=0;
		double dmzcjcebl=0;

		if (xjjzqys==0)
		{
			dmzcjzsbl=0;
		}
		else{
			dmzcjzsbl=xjzcqys*100.0/xjjzqys;
		}

		if (xjjzqye==0)
		{
			dmzcjzebl=0;
		}
		else{
			dmzcjzebl=xjzcqye*100.0/xjjzqye;
		}

		if (xjjcqys==0)
		{
			dmzcjcsbl=0;
		}
		else{
			dmzcjcsbl=xjzcqys*100.0/xjjcqys;
		}
		if (xjjcqye==0)
		{
			dmzcjcebl=0;
		}
		else{
			dmzcjcebl=xjzcqye*100.0/xjjcqye;
		}

		if (zjzcqys==0)
		{
			dmzcsbl=0;
		}
		else{
			dmzcsbl=xjzcqys*100.0/zjzcqys;
		}
		if (zjzcqye==0)
		{
			dmzcebl=0;
		}
		else{
			dmzcebl=xjzcqye*100.0/zjzcqye;
		}

		%> 
		  <tr align="center" > 
			<td ><font color="#000099"><b><%=row%></b></font></td>
			<td ><font color="#000099"><b><%=getssdqmc%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=xjsdjs%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=xjljsdjs%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=xjdjqds%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(xjjzqye)%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=xjjzqys%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=xjjcqys%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmjcjzsbl)%>%</b></font></td>
				<td  align="right"><%=cf.formatDouble(dmjcsbl)%>%</td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(xjjcqye)%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmjcjzebl)%>%</b></font></td>
				<td  align="right"><%=cf.formatDouble(dmjcebl)%>%</td>
			<!-- ������ľ������: --> 
			<td  align="right"><font color="#000099"><b><%=xjmmqys%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmmmjzsbl)%>%</b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmmmjcsbl)%>%</b></font></td>
				<td  align="right"><%=cf.formatDouble(dmmmsbl)%>%</td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(xjmmqye)%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmmmjzebl)%>%</b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmmmjcebl)%>%</b></font></td>
				<td  align="right"><%=cf.formatDouble(dmmmebl)%>%</td>
			<!-- �����ǳ�������: --> 
			<td  align="right"><font color="#000099"><b><%=xjcgqys%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmcgjzsbl)%>%</b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmcgjcsbl)%>%</b></font></td>
				<td  align="right"><%=cf.formatDouble(dmcgsbl)%>%</td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(xjcgqye)%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmcgjzebl)%>%</b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmcgjcebl)%>%</b></font></td>
				<td  align="right"><%=cf.formatDouble(dmcgebl)%>%</td>
			<!-- �����ǼҾ�����: --> 
			<td  align="right"><font color="#000099"><b><%=xjjjqys%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmjjjzsbl)%>%</b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmjjjcsbl)%>%</b></font></td>
				<td  align="right"><%=cf.formatDouble(dmjjsbl)%>%</td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(xjjjqye)%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmjjjzebl)%>%</b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmjjjcebl)%>%</b></font></td>
				<td  align="right"><%=cf.formatDouble(dmjjebl)%>%</td>
			<!-- ��������������: --> 
			<td  align="right"><%=cf.formatDouble(xjzcdbje)%></td>
			<td  align="right"><%=cf.formatDouble(xjzcjjje)%></td>
			<td  align="right"><%=cf.formatDouble(xjzcczje)%></td>
			<td  align="right"><%=cf.formatDouble(xjzcbyje)%></td>
			<td  align="right"><%=cf.formatDouble(xjzcqtje)%></td>

			<td  align="right"><font color="#000099"><b><%=xjzcqys%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmzcjzsbl)%>%</b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmzcjcsbl)%>%</b></font></td>
				<td  align="right"><%=cf.formatDouble(dmzcsbl)%>%</td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(xjzcqye)%></b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmzcjzebl)%>%</b></font></td>
			<td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmzcjcebl)%>%</b></font></td>
				<td  align="right"><%=cf.formatDouble(dmzcebl)%>%</td>
		  </tr>
		<%

	}
	rs2.close();
	ps2.close();

//����ҵ��ͳ��----------------------------

	//�ܼ�
	
	double dmjcjzsbl=0;
	double dmjcjzebl=0;

	if (zjjzqys==0)
	{
		dmjcjzsbl=0;
	}
	else{
		dmjcjzsbl=zjjcqys*100.0/zjjzqys;
	}

	if (zjjzqye==0)
	{
		dmjcjzebl=0;
	}
	else{
		dmjcjzebl=zjjcqye*100.0/zjjzqye;
	}

	double dmmmjzsbl=0;
	double dmmmjzebl=0;
	double dmmmjcsbl=0;
	double dmmmjcebl=0;
	if (zjjzqys==0)
	{
		dmmmjzsbl=0;
	}
	else{
		dmmmjzsbl=zjmmqys*100.0/zjjzqys;
	}

	if (zjjzqye==0)
	{
		dmmmjzebl=0;
	}
	else{
		dmmmjzebl=zjmmqye*100.0/zjjzqye;
	}

	if (zjjcqys==0)
	{
		dmmmjcsbl=0;
	}
	else{
		dmmmjcsbl=zjmmqys*100.0/zjjcqys;
	}
	if (zjjcqye==0)
	{
		dmmmjcebl=0;
	}
	else{
		dmmmjcebl=zjmmqye*100.0/zjjcqye;
	}


	double dmcgjzsbl=0;
	double dmcgjzebl=0;
	double dmcgjcsbl=0;
	double dmcgjcebl=0;

	if (zjjzqys==0)
	{
		dmcgjzsbl=0;
	}
	else{
		dmcgjzsbl=zjcgqys*100.0/zjjzqys;
	}

	if (zjjzqye==0)
	{
		dmcgjzebl=0;
	}
	else{
		dmcgjzebl=zjcgqye*100.0/zjjzqye;
	}

	if (zjjcqys==0)
	{
		dmcgjcsbl=0;
	}
	else{
		dmcgjcsbl=zjcgqys*100.0/zjjcqys;
	}
	if (zjjcqye==0)
	{
		dmcgjcebl=0;
	}
	else{
		dmcgjcebl=zjcgqye*100.0/zjjcqye;
	}

	double dmjjjzsbl=0;
	double dmjjjzebl=0;
	double dmjjjcsbl=0;
	double dmjjjcebl=0;

	if (zjjzqys==0)
	{
		dmjjjzsbl=0;
	}
	else{
		dmjjjzsbl=zjjjqys*100.0/zjjzqys;
	}

	if (zjjzqye==0)
	{
		dmjjjzebl=0;
	}
	else{
		dmjjjzebl=zjjjqye*100.0/zjjzqye;
	}

	if (zjjcqys==0)
	{
		dmjjjcsbl=0;
	}
	else{
		dmjjjcsbl=zjjjqys*100.0/zjjcqys;
	}
	if (zjjcqye==0)
	{
		dmjjjcebl=0;
	}
	else{
		dmjjjcebl=zjjjqye*100.0/zjjcqye;
	}

	double dmzcjzsbl=0;
	double dmzcjzebl=0;
	double dmzcjcsbl=0;
	double dmzcjcebl=0;

	if (zjjzqys==0)
	{
		dmzcjzsbl=0;
	}
	else{
		dmzcjzsbl=zjzcqys*100.0/zjjzqys;
	}

	if (zjjzqye==0)
	{
		dmzcjzebl=0;
	}
	else{
		dmzcjzebl=zjzcqye*100.0/zjjzqye;
	}

	if (zjjcqys==0)
	{
		dmzcjcsbl=0;
	}
	else{
		dmzcjcsbl=zjzcqys*100.0/zjjcqys;
	}
	if (zjjcqye==0)
	{
		dmzcjcebl=0;
	}
	else{
		dmzcjcebl=zjzcqye*100.0/zjjcqye;
	}

%> 
  <tr align="center" > 
    <td colspan="2"><b>�� ��</b></td>
    <td  align="right"><b><%=zjsdjs%></b></td>
    <td  align="right"><b><%=zjljsdjs%></b></td>
    <td  align="right"><b><%=zjdjqds%></b></td>
    <td  align="right"><b><%=cf.formatDouble(zjjzqye)%></b></td>
    <td  align="right"><b><%=zjjzqys%></b></td>
    <td  align="right"><b><%=zjjcqys%></b></td>
    <td  align="right"><b><%=cf.formatDouble(dmjcjzsbl)%>%</b></td>
    <td >&nbsp;</td>
    <td  align="right"><b><%=cf.formatDouble(zjjcqye)%></b></td>
    <td  align="right"><b><%=cf.formatDouble(dmjcjzebl)%>%</b></td>
    <td >&nbsp;</td>
    <!-- ������ľ������: --> 
    <td  align="right"><b><%=zjmmqys%></b></td>
    <td  align="right"><b><%=cf.formatDouble(dmmmjzsbl)%>%</b></td>
    <td  align="right"><b><%=cf.formatDouble(dmmmjcsbl)%>%</b></td>
    <td >&nbsp;</td>
    <td  align="right"><b><%=cf.formatDouble(zjmmqye)%></b></td>
    <td  align="right"><b><%=cf.formatDouble(dmmmjzebl)%>%</b></td>
    <td  align="right"><b><%=cf.formatDouble(dmmmjcebl)%>%</b></td>
    <td >&nbsp;</td>
    <!-- �����ǳ�������: --> 
    <td  align="right"><b><%=zjcgqys%></b></td>
    <td  align="right"><b><%=cf.formatDouble(dmcgjzsbl)%>%</b></td>
    <td  align="right"><b><%=cf.formatDouble(dmcgjcsbl)%>%</b></td>
    <td >&nbsp;</td>
    <td  align="right"><b><%=cf.formatDouble(zjcgqye)%></b></td>
    <td  align="right"><b><%=cf.formatDouble(dmcgjzebl)%>%</b></td>
    <td  align="right"><b><%=cf.formatDouble(dmcgjcebl)%>%</b></td>
    <td >&nbsp;</td>
    <!-- �����ǼҾ�����: --> 
    <td  align="right"><b><%=zjjjqys%></b></td>
    <td  align="right"><b><%=cf.formatDouble(dmjjjzsbl)%>%</b></td>
    <td  align="right"><b><%=cf.formatDouble(dmjjjcsbl)%>%</b></td>
    <td >&nbsp;</td>
    <td  align="right"><b><%=cf.formatDouble(zjjjqye)%></b></td>
    <td  align="right"><b><%=cf.formatDouble(dmjjjzebl)%>%</b></td>
    <td  align="right"><b><%=cf.formatDouble(dmjjjcebl)%>%</b></td>
    <td >&nbsp;</td>
    <!-- ��������������: --> 
    <td  align="right"><%=cf.formatDouble(zjzcdbje)%></td>
    <td  align="right"><%=cf.formatDouble(zjzcjjje)%></td>
    <td  align="right"><%=cf.formatDouble(zjzcczje)%></td>
    <td  align="right"><%=cf.formatDouble(zjzcbyje)%></td>
    <td  align="right"><%=cf.formatDouble(zjzcqtje)%></td>

    <td  align="right"><b><%=zjzcqys%></b></td>
    <td  align="right"><b><%=cf.formatDouble(dmzcjzsbl)%>%</b></td>
    <td  align="right"><b><%=cf.formatDouble(dmzcjcsbl)%>%</b></td>
    <td >&nbsp;</td>
    <td  align="right"><b><%=cf.formatDouble(zjzcqye)%></b></td>
    <td  align="right"><b><%=cf.formatDouble(dmzcjzebl)%>%</b></td>
    <td  align="right"><b><%=cf.formatDouble(dmzcjcebl)%>%</b></td>
    <td >&nbsp;</td>
  </tr>
</table>
<br>
ע��

<BR>1.ռ�ܼҾ�ǩԼ������=(����Ҿ�ǩԼ��/�Ҿ���ǩԼ��)

<BR>2.ռ�ܼҾ�ǩԼ�����=(����Ҿ�ǩԼ��/�Ҿ���ǩԼ��)

<P>[����ǩԼ��]��ָ��ͬ��������װ�ͼ�װ��������������
<BR>[�Ҿӽ��]������ǩԼ��+��������<����ǰ��ǩ�ú�ͬ>-���ڼ���<����ǰ��ǩ�ú�ͬ>-�����˵�<����ǰ��ǩ�ú�ͬ>

</body>
</html>
<%
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