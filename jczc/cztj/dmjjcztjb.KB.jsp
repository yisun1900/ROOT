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
String fgs="FBJ00";
String dwbh=cf.fillNull(request.getParameter("dwbh"));

String wheresql="";
String wheresql1="";
String wheresql2="";


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
  <B>����ҾӲ�ֵͳ��</B><BR>
  <b>(ͳ��ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</b>
</CENTER>


<table border="1" width="2432" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
  <tr bgcolor="#CCCCCC"  align="center">
    <td  width="40" rowspan="2">���</td>
    <td  width="160" rowspan="2">����</td>
    <td colspan="4">��װ</td>
    <td colspan="9"><strong>�ɲ�Ʒ��ϵ</strong></td>
    <td colspan="9"><strong>�²�Ʒ��ϵ</strong></td>
  </tr>
  <tr bgcolor="#CCCCCC"  align="center">
    <td  width="80">�����ڴ�</td> 
    <td  width="100">�����ڴ�</td>
    <td  width="100">�����ڴ�</td>
    <td  width="100">�ϼ�</td>
    <td  width="100">����</td>
    <td  width="100">����</td>
    <td  width="100">��ԡ</td>
    <td  width="100">�Ҿ�</td>
    <td  width="70">ɳ��/��</td>
    <td  width="70">����/����</td>
    <td  width="70">�ذ�/¥��</td>
    <td  width="70">��ֽ/�ڲ�</td>
    <td  width="70">�ϼ�</td>

    <td  width="100">ɢ�������ز�ů������յ�</td>
    <td  width="100">����ʯ����ש</td>
    <td  width="100">����ϵͳ����ͥӰԺ�����ز���</td>
    <td  width="100">�ֽṹ</td>
    <td  width="100">԰�־���</td>
	
	
	<td  width="100">���ߡ�ʯ���ߡ���©</td>
    <td  width="100">�ƾ���Ʒ</td>
    <td  width="70">��¯���Ŵ��Ȳ�Ʒ</td>
    <td  width="70">�ϼ�</td>
  </tr>
  <%
	
	String oldfgs="";

	int row=0;
	
	String fgsbh=null;
	String fgsmc=null;
	String dmmc=null;
	String dmbh=null;

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


	ls_sql=" SELECT dwbh,dwmc";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwlx='F0' and cxbz='N'";
	ls_sql+=" and sfjms='N'";//N����Y����
	if (!(fgs.equals("")))
	{
		ls_sql+=" and ssfgs='"+fgs+"'";
	}
	ls_sql+=" order by dwbh";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{	
		fgsbh=rs2.getString("dwbh");
		fgsmc=rs2.getString("dwmc");

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


//�ֹ�˾ҵ��ͳ��++++++++++++++++++++++++++++

		ls_sql=" SELECT count(*) jzqys,sum(qye) jzqye ";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt!='3' and crm_khxx.fgsbh='"+fgsbh+"'";
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

		zjjzqye+=xjjzqye;
		zjjzqys+=xjjzqys;

		//ľ�Ž�����
		//ǩԼ
		int mmqds=0;
		double mmqde=0;
		ls_sql="SELECT sum(jc_mmydd.htje) htze,count(distinct jc_mmydd.khbh) mmqys";
		ls_sql+=" FROM jc_mmydd";
		ls_sql+=" where  jc_mmydd.fgsbh='"+fgsbh+"'";
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
		ls_sql+=" FROM jc_mmydd";
		ls_sql+=" where  jc_mmydd.fgsbh='"+fgsbh+"'";
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
		ls_sql+=" FROM jc_mmzjx";
		ls_sql+=" where jc_mmzjx.fgsbh='"+fgsbh+"'";
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

		zjmmqys+=xjmmqys;//ľ��������
		zjmmqye+=xjmmqye;//����ľ���ܶ�


		//���������
		//ǩ��
		double cgqde=0;
		int cgqds=0;
		ls_sql="SELECT sum(jc_cgdd.htze) htze,count(distinct jc_cgdd.khbh) cgqys";
		ls_sql+=" FROM jc_cgdd";
		ls_sql+=" where jc_cgdd.fgsbh='"+fgsbh+"'";
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
		ls_sql+=" FROM jc_cgdd";
		ls_sql+=" where jc_cgdd.fgsbh='"+fgsbh+"'";
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
		ls_sql+=" FROM jc_cgzjx";
		ls_sql+=" where jc_cgzjx.fgsbh='"+fgsbh+"'";
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

		zjcgqys+=xjcgqys;//����������
		zjcgqye+=xjcgqye;//���г����ܶ�
		
		//�Ҿ߽�����
		//ǩ��
		double jjqde=0;
		int jjqds=0;
		ls_sql="SELECT sum(jc_jjdd.htze) htze,count(distinct jc_jjdd.khbh) jjqys";
		ls_sql+=" FROM jc_jjdd";
		ls_sql+=" where jc_jjdd.fgsbh='"+fgsbh+"'";
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
		ls_sql+=" FROM jc_jjdd";
		ls_sql+=" where jc_jjdd.fgsbh='"+fgsbh+"'";
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
		ls_sql+=" FROM jc_jjzjx";
		ls_sql+=" where jc_jjzjx.fgsbh='"+fgsbh+"'";
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

		zjjjqys+=xjjjqys;//�Ҿ�������
		zjjjqye+=xjjjqye;//���мҾ��ܶ�

		//���Ľ�����
		//ǩ��
		double zcqde=0;
		int zcqds=0;
		ls_sql="SELECT sum(jc_zcdd.hkze) htze,count(distinct jc_zcdd.khbh) zcqys";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.fgsbh='"+fgsbh+"'";
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
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.fgsbh='"+fgsbh+"'";
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
		ls_sql+=" FROM jc_zczjx";
		ls_sql+=" where jc_zczjx.fgsbh='"+fgsbh+"'";
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

		zjzcqys+=xjzcqys;//��������
		zjzcqye+=xjzcqye;//�����ܶ�

		ls_sql="SELECT count(distinct khbh)";
		ls_sql+=" FROM (";

		ls_sql+=" SELECT jc_mmydd.khbh";
		ls_sql+=" FROM jc_mmydd";
		ls_sql+=" where  jc_mmydd.fgsbh='"+fgsbh+"'";
		ls_sql+=wheresql2;
		ls_sql+=" and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_mmydd.htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_mmydd.clzt>='04' and jc_mmydd.clzt!='99'";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT jc_cgdd.khbh";
		ls_sql+=" FROM jc_cgdd";
		ls_sql+=" where jc_cgdd.fgsbh='"+fgsbh+"'";
		ls_sql+=wheresql2;
		ls_sql+=" and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_cgdd.clzt>='13' and jc_cgdd.clzt!='99'";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT jc_jjdd.khbh";
		ls_sql+=" FROM jc_jjdd";
		ls_sql+=" where jc_jjdd.fgsbh='"+fgsbh+"'";
		ls_sql+=wheresql2;
		ls_sql+=" and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_jjdd.clzt>='13' and jc_jjdd.clzt!='99'";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT jc_zcdd.khbh";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.fgsbh='"+fgsbh+"'";
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

		zjjcqys+=xjjcqys;
		zjjcqye+=xjjcqye;

//�ֹ�˾ҵ��ͳ��----------------------------



//����ҵ��ͳ��++++++++++++++++++++++++++++
		ls_sql=" SELECT dwbh,dwmc";
		ls_sql+=" FROM sq_dwxx a";
		ls_sql+=" where dwlx='F2' and cxbz='N'";
		ls_sql+=" and ssfgs='"+fgsbh+"'";
		ls_sql+=wheresql1;
		ls_sql+=" order by dwbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{	
			dmbh=rs.getString("dwbh");
			dmmc=rs.getString("dwmc");

			row++;

/*
			if (fgsmc.equals(oldfgs))
			{
				fgsmc="ͬ��";
			}
			else{
				oldfgs=fgsmc;
			}
*/

			//�ն�����		
			ls_sql=" SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.lfdjbz='Y' and crm_zxkhxx.zxdm='"+dmbh+"'";
			ls_sql+=" and crm_zxkhxx.jlfdjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_zxkhxx.jlfdjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{	
				sdjs=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			//�ۼ��ն�����		
			ls_sql=" SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where crm_zxkhxx.lfdjbz='Y' and crm_zxkhxx.zxdm='"+dmbh+"'";
			ls_sql+=" and crm_zxkhxx.zxzt not in('2','3','4')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{	
				ljsdjs=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			//����ǩ����		
			ls_sql=" SELECT count(*) ";
			ls_sql+=" FROM crm_khxx,crm_zxkhxx";
			ls_sql+=" where crm_khxx.zt!='3' and crm_khxx.dwbh='"+dmbh+"'";
			ls_sql+=" and crm_khxx.khbh=crm_zxkhxx.khbh";
			ls_sql+=" and crm_zxkhxx.lfdjbz='Y' ";
			ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{	
				djqds=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			xjsdjs+=sdjs;
			xjljsdjs+=ljsdjs;
			xjdjqds+=djqds;
			zjsdjs+=sdjs;
			zjljsdjs+=ljsdjs;
			zjdjqds+=djqds;

		
			ls_sql=" SELECT count(*) jzqys,sum(qye) jzqye ";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where crm_khxx.zt!='3' and crm_khxx.dwbh='"+dmbh+"'";
			ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{	
				jzqys=rs1.getInt("jzqys");
				jzqye=rs1.getDouble("jzqye");
			}
			rs1.close();
			ps1.close();


			//ľ�Ž�����
			//ǩԼ
			mmqds=0;
			mmqde=0;
			ls_sql="SELECT sum(jc_mmydd.htje) htze,count(distinct jc_mmydd.khbh) mmqys";
			ls_sql+=" FROM jc_mmydd";
			ls_sql+=" where  jc_mmydd.qddm='"+dmbh+"'";
			ls_sql+=" and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_mmydd.htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_mmydd.clzt>='04' and jc_mmydd.clzt!='98'";//04��ǩ����ͬ
			ps1= conn.prepareStatement(ls_sql);
			rs1=ps1.executeQuery();
			if(rs1.next())
			{
				mmqde=rs1.getDouble(1);//����ľ�Ž��
				mmqds=rs1.getInt(2);//����ľ������
			}
			rs1.close();
			ps1.close();

			//�˵�
			mmtds=0;
			mmtde=0;
			ls_sql="SELECT sum(jc_mmydd.zjhze) htze,count(distinct jc_mmydd.khbh) mmqys";
			ls_sql+=" FROM jc_mmydd";
			ls_sql+=" where  qddm='"+dmbh+"'";
			ls_sql+=" and jc_mmydd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_mmydd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_mmydd.clzt='99' ";
			ps1= conn.prepareStatement(ls_sql);
			rs1=ps1.executeQuery();
			if(rs1.next())
			{
				mmtde=rs1.getDouble(1);//����ľ�Ž��
				mmtds=rs1.getInt(2);//����ľ������
			}
			rs1.close();
			ps1.close();

			//������
			mmzjx=0;
			ls_sql="SELECT sum(jc_mmzjx.zjxze) zjxze";
			ls_sql+=" FROM jc_mmzjx";
			ls_sql+=" where qddm='"+dmbh+"'";
			ls_sql+=" and jc_mmzjx.clzt not in('00')";
			ls_sql+=" and jc_mmzjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_mmzjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1=ps1.executeQuery();
			if(rs1.next())
			{
				mmzjx=rs1.getDouble(1);//����ľ�Ž��
			}
			rs1.close();
			ps1.close();

			mmqys=mmqds-mmtds;
			mmqye=mmqde-mmtde+mmzjx;


			//���������
			//ǩ��
			cgqde=0;
			cgqds=0;
			ls_sql="SELECT sum(jc_cgdd.htze) htze,count(distinct jc_cgdd.khbh) cgqys";
			ls_sql+=" FROM jc_cgdd";
			ls_sql+=" where qddm='"+dmbh+"'";
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
			ls_sql+=" FROM jc_cgdd";
			ls_sql+=" where qddm='"+dmbh+"'";
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
			ls_sql+=" FROM jc_cgzjx";
			ls_sql+=" where qddm='"+dmbh+"'";
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
			
			cgqys=cgqds-cgtds;
			cgqye=cgqde-cgtde+cgzjx;
		
			//�Ҿ߽�����
			//ǩ��
			jjqde=0;
			jjqds=0;
			ls_sql="SELECT sum(jc_jjdd.htze) htze,count(distinct jc_jjdd.khbh) jjqys";
			ls_sql+=" FROM jc_jjdd";
			ls_sql+=" where qddm='"+dmbh+"'";
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
			ls_sql+=" FROM jc_jjdd";
			ls_sql+=" where qddm='"+dmbh+"'";
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
		ls_sql+=" FROM jc_jjzjx";
		ls_sql+=" where qddm='"+dmbh+"'";
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

			jjqys=jjqds-jjtds;
			jjqye=jjqde-jjtde+jjzjx;


			//���Ľ����㣫��������������������������������
			//ǩ��
			zcqde=0;
			zcqds=0;
			ls_sql="SELECT sum(jc_zcdd.hkze) htze,count(distinct jc_zcdd.khbh) zcqys";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where qddm='"+dmbh+"'";
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

//			out.println(ls_sql);

			//�˵�
			zctde=0;
			zctds=0;
			ls_sql="SELECT sum(jc_zcdd.hkze+zjhze) htze,count(distinct jc_zcdd.khbh) zcqys";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where qddm='"+dmbh+"'";
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

//			out.println(ls_sql);

			//������
			zczjx=0;
			ls_sql="SELECT sum(jc_zczjx.zjxze) zjxze";
		ls_sql+=" FROM jc_zczjx";
		ls_sql+=" where qddm='"+dmbh+"'";
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

			zcqys=zcqds-zctds;
			zcqye=zcqde-zctde+zczjx;


			//�ذ�����㣫��������������������������������������

			double zcdbhtje=0;
			ls_sql="SELECT sum(jc_zcdd.hkze) htze";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.qddm='"+dmbh+"'";
			ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt>='09'";
			ls_sql+=" and jc_zcdd.zcxlbm='�ذ�'";//1003:�ذ�
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcdbhtje=rs1.getDouble(1);//���Ľ��
			}
			rs1.close();
			ps1.close();

			//�˵�
			double zcdbtdje=0;
			ls_sql="SELECT sum(jc_zcdd.hkze+zjhze) htze";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.qddm='"+dmbh+"'";
			ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt='99'";
			ls_sql+=" and jc_zcdd.zcxlbm='�ذ�'";//1003:�ذ�
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcdbtdje=rs1.getDouble(1);//���Ľ��
			}
			rs1.close();
			ps1.close();

			//������
			double zcdbzjxje=0;
			ls_sql="SELECT sum(jc_zczjx.zjxze) zjxze";
		ls_sql+=" FROM jc_zczjx";
		ls_sql+=" where qddm='"+dmbh+"'";
			ls_sql+=" and jc_zczjx.clzt not in('00')";
			ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zczjx.zcxlbm='�ذ�'";//1003:�ذ�
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcdbzjxje=rs1.getDouble(1);//���Ľ��
			}
			rs1.close();
			ps1.close();

			zcdbje=zcdbhtje-zcdbtdje+zcdbzjxje;

			xjzcdbje+=zcdbje;
			zjzcdbje+=zcdbje;

			//��߽����㣫��������������������������������������

			double zcjjhtje=0;
			ls_sql="SELECT sum(jc_zcdd.hkze) htze";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where qddm='"+dmbh+"'";
			ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt>='09'";
			ls_sql+=" and jc_zcdd.zcxlbm='���'";//1003:�ذ�
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcjjhtje=rs1.getDouble(1);//���Ľ��
			}
			rs1.close();
			ps1.close();

			//�˵�
			double zcjjtdje=0;
			ls_sql="SELECT sum(jc_zcdd.hkze+zjhze) htze";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where qddm='"+dmbh+"'";
			ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt='99'";
			ls_sql+=" and jc_zcdd.zcxlbm='���'";//1003:�ذ�
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcjjtdje=rs1.getDouble(1);//���Ľ��
			}
			rs1.close();
			ps1.close();

			//������
			double zcjjzjxje=0;
			ls_sql="SELECT sum(jc_zczjx.zjxze) zjxze";
		ls_sql+=" FROM jc_zczjx";
		ls_sql+=" where qddm='"+dmbh+"'";
			ls_sql+=" and jc_zczjx.clzt not in('00')";
			ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zczjx.zcxlbm='���'";//1003:�ذ�
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcjjzjxje=rs1.getDouble(1);//���Ľ��
			}
			rs1.close();
			ps1.close();

			zcjjje=zcjjhtje-zcjjtdje+zcjjzjxje;

			xjzcjjje+=zcjjje;
			zjzcjjje+=zcjjje;

			//��ש�����㣫��������������������������������������

			double zcczhtje=0;
			ls_sql="SELECT sum(jc_zcdd.hkze) htze";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where qddm='"+dmbh+"'";
			ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt>='09'";
			ls_sql+=" and jc_zcdd.zcxlbm='��ש'";//1003:�ذ�
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcczhtje=rs1.getDouble(1);//���Ľ��
			}
			rs1.close();
			ps1.close();

			//�˵�
			double zccztdje=0;
			ls_sql="SELECT sum(jc_zcdd.hkze+zjhze) htze";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where qddm='"+dmbh+"'";
			ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt='99'";
			ls_sql+=" and jc_zcdd.zcxlbm='��ש'";//1003:�ذ�
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zccztdje=rs1.getDouble(1);//���Ľ��
			}
			rs1.close();
			ps1.close();

			//������
			double zcczzjxje=0;
			ls_sql="SELECT sum(jc_zczjx.zjxze) zjxze";
		ls_sql+=" FROM jc_zczjx";
		ls_sql+=" where qddm='"+dmbh+"'";
			ls_sql+=" and jc_zczjx.clzt not in('00')";
			ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zczjx.zcxlbm='��ש'";//1003:�ذ�
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcczzjxje=rs1.getDouble(1);//���Ľ��
			}
			rs1.close();
			ps1.close();

			zcczje=zcczhtje-zccztdje+zcczzjxje;

			xjzcczje+=zcczje;
			zjzcczje+=zcczje;

			//���ս����㣫��������������������������������������

			double zcbyhtje=0;
			ls_sql="SELECT sum(jc_zcdd.hkze) htze";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where qddm='"+dmbh+"'";
			ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt>='09'";
			ls_sql+=" and jc_zcdd.zcxlbm='����'";//1003:�ذ�
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcbyhtje=rs1.getDouble(1);//���Ľ��
			}
			rs1.close();
			ps1.close();

			//�˵�
			double zcbytdje=0;
			ls_sql="SELECT sum(jc_zcdd.hkze+zjhze) htze";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where qddm='"+dmbh+"'";
			ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt='99'";
			ls_sql+=" and jc_zcdd.zcxlbm='����'";//1003:�ذ�
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcbytdje=rs1.getDouble(1);//���Ľ��
			}
			rs1.close();
			ps1.close();

			//������
			double zcbyzjxje=0;
			ls_sql="SELECT sum(jc_zczjx.zjxze) zjxze";
		ls_sql+=" FROM jc_zczjx";
		ls_sql+=" where qddm='"+dmbh+"'";
			ls_sql+=" and jc_zczjx.clzt not in('00')";
			ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zczjx.zcxlbm='����'";//1003:�ذ�
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcbyzjxje=rs1.getDouble(1);//���Ľ��
			}
			rs1.close();
			ps1.close();

			zcbyje=zcbyhtje-zcbytdje+zcbyzjxje;

			xjzcbyje+=zcbyje;
			zjzcbyje+=zcbyje;


			zcqtje=zcqye-zcdbje-zcjjje-zcczje-zcbyje;

			xjzcqtje+=zcqtje;
			zjzcqtje+=zcqtje;
			//������������������������������������������

			ls_sql="SELECT count(distinct khbh)";
			ls_sql+=" FROM (";

			ls_sql+=" SELECT jc_mmydd.khbh";
			ls_sql+=" FROM jc_mmydd";
			ls_sql+=" where  qddm='"+dmbh+"'";
			ls_sql+=wheresql2;
			ls_sql+=" and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_mmydd.htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_mmydd.clzt>='04' and jc_mmydd.clzt!='99'";

			ls_sql+=" UNION ALL";

			ls_sql+=" SELECT jc_cgdd.khbh";
			ls_sql+=" FROM jc_cgdd";
			ls_sql+=" where qddm='"+dmbh+"'";
			ls_sql+=wheresql2;
			ls_sql+=" and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_cgdd.clzt>='13' and jc_cgdd.clzt!='99'";

			ls_sql+=" UNION ALL";

			ls_sql+=" SELECT jc_jjdd.khbh";
			ls_sql+=" FROM jc_jjdd";
			ls_sql+=" where qddm='"+dmbh+"'";
			ls_sql+=wheresql2;
			ls_sql+=" and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_jjdd.clzt>='13' and jc_jjdd.clzt!='99'";

			ls_sql+=" UNION ALL";

			ls_sql+=" SELECT jc_zcdd.khbh";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where qddm='"+dmbh+"'";
			ls_sql+=wheresql2;
			ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='99'";

			ls_sql+=" )";

			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				jcqys=rs1.getInt(1);//�Ҿ�����
			}
			rs1.close();
			ps1.close();

			jcqye=mmqye+cgqye+jjqye+zcqye;


			double dmjcjzsbl=0;
			double dmjcjzebl=0;
			double dmjcsbl=0;
			double dmjcebl=0;

			if (jzqys==0)
			{
				dmjcjzsbl=0;
			}
			else{
				dmjcjzsbl=jcqys*100.0/jzqys;
			}

			if (jzqye==0)
			{
				dmjcjzebl=0;
			}
			else{
				dmjcjzebl=jcqye*100.0/jzqye;
			}

			if (xjjcqys==0)
			{
				dmjcsbl=0;
			}
			else{
				dmjcsbl=jcqys*100.0/xjjcqys;
			}
			if (xjjcqye==0)
			{
				dmjcebl=0;
			}
			else{
				dmjcebl=jcqye*100.0/xjjcqye;
			}

			double dmmmjzsbl=0;
			double dmmmjzebl=0;
			double dmmmjcsbl=0;
			double dmmmjcebl=0;
			double dmmmsbl=0;
			double dmmmebl=0;
			if (jzqys==0)
			{
				dmmmjzsbl=0;
			}
			else{
				dmmmjzsbl=mmqys*100.0/jzqys;
			}

			if (jzqye==0)
			{
				dmmmjzebl=0;
			}
			else{
				dmmmjzebl=mmqye*100.0/jzqye;
			}

			if (jcqys==0)
			{
				dmmmjcsbl=0;
			}
			else{
				dmmmjcsbl=mmqys*100.0/jcqys;
			}
			if (jcqye==0)
			{
				dmmmjcebl=0;
			}
			else{
				dmmmjcebl=mmqye*100.0/jcqye;
			}

			if (xjmmqys==0)
			{
				dmmmsbl=0;
			}
			else{
				dmmmsbl=mmqys*100.0/xjmmqys;
			}
			if (xjmmqye==0)
			{
				dmmmebl=0;
			}
			else{
				dmmmebl=mmqye*100.0/xjmmqye;
			}


			double dmcgjzsbl=0;
			double dmcgjzebl=0;
			double dmcgsbl=0;
			double dmcgebl=0;
			double dmcgjcsbl=0;
			double dmcgjcebl=0;

			if (jzqys==0)
			{
				dmcgjzsbl=0;
			}
			else{
				dmcgjzsbl=cgqys*100.0/jzqys;
			}

			if (jzqye==0)
			{
				dmcgjzebl=0;
			}
			else{
				dmcgjzebl=cgqye*100.0/jzqye;
			}

			if (jcqys==0)
			{
				dmcgjcsbl=0;
			}
			else{
				dmcgjcsbl=cgqys*100.0/jcqys;
			}
			if (jcqye==0)
			{
				dmcgjcebl=0;
			}
			else{
				dmcgjcebl=cgqye*100.0/jcqye;
			}

			if (xjcgqys==0)
			{
				dmcgsbl=0;
			}
			else{
				dmcgsbl=cgqys*100.0/xjcgqys;
			}
			if (xjcgqye==0)
			{
				dmcgebl=0;
			}
			else{
				dmcgebl=cgqye*100.0/xjcgqye;
			}

			double dmjjjzsbl=0;
			double dmjjjzebl=0;
			double dmjjsbl=0;
			double dmjjebl=0;
			double dmjjjcsbl=0;
			double dmjjjcebl=0;

			if (jzqys==0)
			{
				dmjjjzsbl=0;
			}
			else{
				dmjjjzsbl=jjqys*100.0/jzqys;
			}

			if (jzqye==0)
			{
				dmjjjzebl=0;
			}
			else{
				dmjjjzebl=jjqye*100.0/jzqye;
			}

			if (jcqys==0)
			{
				dmjjjcsbl=0;
			}
			else{
				dmjjjcsbl=jjqys*100.0/jcqys;
			}
			if (jcqye==0)
			{
				dmjjjcebl=0;
			}
			else{
				dmjjjcebl=jjqye*100.0/jcqye;
			}

			if (xjjjqys==0)
			{
				dmjjsbl=0;
			}
			else{
				dmjjsbl=jjqys*100.0/xjjjqys;
			}
			if (xjjjqye==0)
			{
				dmjjebl=0;
			}
			else{
				dmjjebl=jjqye*100.0/xjjjqye;
			}

			double dmzcjzsbl=0;
			double dmzcjzebl=0;
			double dmzcsbl=0;
			double dmzcebl=0;
			double dmzcjcsbl=0;
			double dmzcjcebl=0;

			if (jzqys==0)
			{
				dmzcjzsbl=0;
			}
			else{
				dmzcjzsbl=zcqys*100.0/jzqys;
			}

			if (jzqye==0)
			{
				dmzcjzebl=0;
			}
			else{
				dmzcjzebl=zcqye*100.0/jzqye;
			}

			if (jcqys==0)
			{
				dmzcjcsbl=0;
			}
			else{
				dmzcjcsbl=zcqys*100.0/jcqys;
			}
			if (jcqye==0)
			{
				dmzcjcebl=0;
			}
			else{
				dmzcjcebl=zcqye*100.0/jcqye;
			}

			if (xjzcqys==0)
			{
				dmzcsbl=0;
			}
			else{
				dmzcsbl=zcqys*100.0/xjzcqys;
			}
			if (xjzcqye==0)
			{
				dmzcebl=0;
			}
			else{
				dmzcebl=zcqye*100.0/xjzcqye;
			}

			
			%> 
			  <tr align="center" > 
				<td ><%=row%></td>
				<td ><A HREF="ViewDmjjcz.jsp?dwbh=<%=dmbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=dmmc%></A></td>
				<td  align="right"><%=cf.formatDouble(djqds*67850.23)%></td>
				<td  align="right"><%=cf.formatDouble(jzqye)%></td>
				<td  align="right"><%=cf.formatDouble(jcqye)%></td>
				<td  align="right">&nbsp;</td>
				<!-- ������ľ������: --> 
				<td  align="right"><%=cf.formatDouble(cgqye)%></td>
				<td  align="right"><%=cf.formatDouble(mmqye)%></td>
				<!-- �����ǳ�������: --> 
				<!-- �����ǼҾ�����: --> 
				<td  align="right"><%=jjqys%></td>
				<td  align="right"><%=cf.formatDouble(jjqye)%></td>
				<td  align="right"><%=cf.formatDouble(dmjjjzebl)%></td>
				<td  align="right"><%=cf.formatDouble(dmjjjcebl)%></td>
				<td  align="right">&nbsp;</td>
				<td  align="right"><%=cf.formatDouble(dmjjebl)%></td>
				<td  align="right"><%=cf.formatDouble(mmqye+cgqye+jjqye)%></td>
				<!-- ��������������: --> 
			 
				<td  align="right"><%=cf.formatDouble(zcdbje)%></td>
				<td  align="right"><%=cf.formatDouble(zcjjje)%></td>
				<td  align="right"><%=cf.formatDouble(zcczje)%></td>
				<td  align="right"><%=cf.formatDouble(zcbyje)%></td>
				<td  align="right"><%=cf.formatDouble(zcqtje)%></td>

				<td  align="right"><%=zcqys%></td>
				<td  align="right"><%=cf.formatDouble(zcqye)%></td>
				<td  align="right"><%=cf.formatDouble(dmzcjzebl)%></td>
				<td  align="right"><%=cf.formatDouble(zcqye)%></td>
			  </tr>
			<%	
		}
		rs.close();
		ps.close();


		double dmjcjzsbl=0;
		double dmjcjzebl=0;

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

		double dmmmjzsbl=0;
		double dmmmjzebl=0;
		double dmmmjcsbl=0;
		double dmmmjcebl=0;
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


		double dmcgjzsbl=0;
		double dmcgjzebl=0;
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

		double dmjjjzsbl=0;
		double dmjjjzebl=0;
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

		double dmzcjzsbl=0;
		double dmzcjzebl=0;
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

		%> 
		  
		<%

	}
	rs2.close();
	ps2.close();

//����ҵ��ͳ��--------------------------------

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
    <td  align="right"><b><%=cf.formatDouble(zjdjqds*67850.23)%></b></td>
    <td  align="right"><b><%=cf.formatDouble(zjjzqye)%></b></td>
    <td  align="right"><b><%=cf.formatDouble(zjjcqye)%></b></td>
    <td  align="right">&nbsp;</td>
    <!-- ������ľ������: --> 
    <td  align="right"><b><%=cf.formatDouble(zjcgqye)%></b></td>
    <td  align="right"><b><%=cf.formatDouble(zjmmqye)%></b></td>
    <!-- �����ǳ�������: --> 
    <!-- �����ǼҾ�����: --> 
    <td  align="right"><b><%=zjjjqys%></b></td>
    <td  align="right"><b><%=cf.formatDouble(zjjjqye)%></b></td>
    <td  align="right"><b><%=cf.formatDouble(dmjjjzebl)%></b></td>
    <td  align="right"><b><%=cf.formatDouble(dmjjjcebl)%></b></td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td  align="right" ><b><%=cf.formatDouble(zjmmqye+zjcgqye+zjjjqye)%></b></td>
    <!-- ��������������: --> 
    <td  align="right"><%=cf.formatDouble(zjzcdbje)%></td>
    <td  align="right"><%=cf.formatDouble(zjzcjjje)%></td>
    <td  align="right"><%=cf.formatDouble(zjzcczje)%></td>
    <td  align="right"><%=cf.formatDouble(zjzcbyje)%></td>
    <td  align="right"><%=cf.formatDouble(zjzcqtje)%></td>

    <td  align="right"><b><%=zjzcqys%></b></td>
    <td  align="right"><b><%=cf.formatDouble(zjzcqye)%></b></td>
    <td  align="right"><b><%=cf.formatDouble(dmzcjzebl)%></b></td>
    <td  align="right"><b><%=cf.formatDouble(zjzcqye)%></b></td>
  </tr>
</table>
<br>
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