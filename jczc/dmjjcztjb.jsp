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

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");

String wheresql="";
String wheresql1="";

if (!(fgs.equals("")))
{
	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	wheresql1+=" and  (a.ssfgs='"+fgs+"')";
}

if (!(dwbh.equals("")))
{
	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	wheresql1+=" and  a.dwbh='"+dwbh+"'";
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


	String xtrzip=request.getRemoteHost();
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String xtrzyhmc=(String)session.getAttribute("yhmc");
	ls_sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
	ls_sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),?,?,SYSDATE,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xtrzip);
	ps.setString(2,xtrzyhdlm);
	ps.setString(3,xtrzyhmc+"������Ҿ�ҵ����"+sjfw+"��"+sjfw2+"��"+fgs+"��"+dwbh+"��");
	ps.executeUpdate();
	ps.close();

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

<table border="1" width="3480" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="120">�ֹ�˾</td>
    <td  width="40">���</td>
    <td  width="160">����</td>
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



	ls_sql=" SELECT dwbh,dwmc";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwlx='F0' and cxbz='N'";
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
		ls_sql+=" FROM crm_khxx,jc_mmydd";
		ls_sql+=" where  crm_khxx.khbh=jc_mmydd.khbh and crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=wheresql;
		ls_sql+=" and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_mmydd.htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_mmydd.clzt>='04'";
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
		ls_sql="SELECT sum(jc_mmydd.htje) htze,count(distinct jc_mmydd.khbh) mmqys";
		ls_sql+=" FROM crm_khxx,jc_mmydd";
		ls_sql+=" where  crm_khxx.khbh=jc_mmydd.khbh and crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=wheresql;
		ls_sql+=" and jc_mmydd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_mmydd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_mmydd.clzt='99' and jc_mmydd.htje>0";
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
		ls_sql+=" FROM crm_khxx,jc_mmydd,jc_mmzjx";
		ls_sql+=" where jc_mmzjx.khbh=crm_khxx.khbh and jc_mmydd.yddbh=jc_mmzjx.yddbh and crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=wheresql;
		ls_sql+=" and jc_mmydd.clzt>='04' and jc_mmydd.clzt!='99'";
		ls_sql+=" and jc_mmzjx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_mmzjx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_mmzjx.clzt!='00'";
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
		ls_sql+=" FROM crm_khxx,jc_cgdd";
		ls_sql+=" where crm_khxx.khbh=jc_cgdd.khbh and crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=wheresql;
		ls_sql+=" and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_cgdd.clzt>='13'";
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
		ls_sql="SELECT sum(jc_cgdd.htze) htze,count(distinct jc_cgdd.khbh) cgqys";
		ls_sql+=" FROM crm_khxx,jc_cgdd";
		ls_sql+=" where crm_khxx.khbh=jc_cgdd.khbh and crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=wheresql;
		ls_sql+=" and jc_cgdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_cgdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_cgdd.clzt='99' and jc_cgdd.htze>0";
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
		ls_sql+=" FROM crm_khxx,jc_cgdd,jc_cgzjx";
		ls_sql+=" where jc_cgzjx.khbh=crm_khxx.khbh and jc_cgdd.ddbh=jc_cgzjx.ddbh and crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=wheresql;
		ls_sql+=" and jc_cgdd.clzt>='13' and jc_cgdd.clzt!='99'";
		ls_sql+=" and jc_cgzjx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_cgzjx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_cgzjx.clzt!='00'";
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
		ls_sql+=" FROM crm_khxx,jc_jjdd";
		ls_sql+=" where crm_khxx.khbh=jc_jjdd.khbh and crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=wheresql;
		ls_sql+=" and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_jjdd.clzt>='13'";
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
		ls_sql="SELECT sum(jc_jjdd.htze) htze,count(distinct jc_jjdd.khbh) jjqys";
		ls_sql+=" FROM crm_khxx,jc_jjdd";
		ls_sql+=" where crm_khxx.khbh=jc_jjdd.khbh and crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=wheresql;
		ls_sql+=" and jc_jjdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_jjdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_jjdd.clzt='99' and jc_jjdd.htze>0";
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
		ls_sql+=" FROM crm_khxx,jc_jjdd,jc_jjzjx";
		ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh and jc_jjzjx.ddbh=jc_jjdd.ddbh and crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=wheresql;
		ls_sql+=" and jc_jjdd.clzt>='13' and jc_jjdd.clzt!='99'";
		ls_sql+=" and jc_jjzjx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_jjzjx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_jjzjx.clzt!='00'";
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
		ls_sql+=" FROM crm_khxx,jc_zcdd";
		ls_sql+=" where crm_khxx.khbh=jc_zcdd.khbh and crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=wheresql;
		ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.clzt>='09'";
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
		ls_sql="SELECT sum(jc_zcdd.hkze) htze,count(distinct jc_zcdd.khbh) zcqys";
		ls_sql+=" FROM crm_khxx,jc_zcdd";
		ls_sql+=" where crm_khxx.khbh=jc_zcdd.khbh and crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=wheresql;
		ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.clzt='99' and jc_zcdd.hkze>0";
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
		ls_sql+=" FROM crm_khxx,jc_zcdd,jc_zczjx";
		ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and jc_zcdd.ddbh=jc_zczjx.ddbh and crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=wheresql;
		ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='99'";
		ls_sql+=" and jc_zczjx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zczjx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zczjx.clzt!='00'";
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
		ls_sql+=" FROM crm_khxx,jc_mmydd";
		ls_sql+=" where  crm_khxx.khbh=jc_mmydd.khbh and crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=wheresql;
		ls_sql+=" and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_mmydd.htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_mmydd.clzt>='04' and jc_mmydd.clzt!='99'";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT jc_cgdd.khbh";
		ls_sql+=" FROM crm_khxx,jc_cgdd";
		ls_sql+=" where crm_khxx.khbh=jc_cgdd.khbh and crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=wheresql;
		ls_sql+=" and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_cgdd.clzt>='13' and jc_cgdd.clzt!='99'";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT jc_jjdd.khbh";
		ls_sql+=" FROM crm_khxx,jc_jjdd";
		ls_sql+=" where crm_khxx.khbh=jc_jjdd.khbh and crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=wheresql;
		ls_sql+=" and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_jjdd.clzt>='13' and jc_jjdd.clzt!='99'";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT jc_zcdd.khbh";
		ls_sql+=" FROM crm_khxx,jc_zcdd";
		ls_sql+=" where crm_khxx.khbh=jc_zcdd.khbh and crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=wheresql;
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
		ls_sql=" select dwbh,dmmc,sum(jzqys) jzqys,TRUNC(sum(jzqye)) jzqye";
		ls_sql+=" from ( ";

		ls_sql+=" SELECT crm_khxx.dwbh dwbh,a.dwmc dmmc,count(*) jzqys,sum(qye) jzqye ";
		ls_sql+=" FROM crm_khxx,sq_dwxx a";
		ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) ";
		ls_sql+=" and crm_khxx.zt!='3' and crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=wheresql;
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" group by crm_khxx.dwbh,a.dwmc ";

		ls_sql+=" UNION ALL";
		ls_sql+=" SELECT a.dwbh dwbh,a.dwmc dmmc,0 jzqys,0 jzqye ";
		ls_sql+=" FROM sq_dwxx a";
		ls_sql+=" where  a.dwlx='F2' and a.cxbz='N' and a.ssfgs='"+fgsbh+"'";
		ls_sql+=wheresql1;

		ls_sql+=" )";
		ls_sql+=" group by dwbh,dmmc ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{	
			dmbh=rs.getString("dwbh");
			dmmc=rs.getString("dmmc");
			jzqys=rs.getInt("jzqys");
			jzqye=rs.getDouble("jzqye");

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

			//ľ�Ž�����
			//ǩԼ
			mmqds=0;
			mmqde=0;
			ls_sql="SELECT sum(jc_mmydd.htje) htze,count(distinct jc_mmydd.khbh) mmqys";
			ls_sql+=" FROM crm_khxx,jc_mmydd";
			ls_sql+=" where  crm_khxx.khbh=jc_mmydd.khbh and crm_khxx.dwbh='"+dmbh+"'";
			ls_sql+=wheresql;
			ls_sql+=" and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_mmydd.htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_mmydd.clzt>='04'";
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
			ls_sql="SELECT sum(jc_mmydd.htje) htze,count(distinct jc_mmydd.khbh) mmqys";
			ls_sql+=" FROM crm_khxx,jc_mmydd";
			ls_sql+=" where  crm_khxx.khbh=jc_mmydd.khbh and crm_khxx.dwbh='"+dmbh+"'";
			ls_sql+=wheresql;
			ls_sql+=" and jc_mmydd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_mmydd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_mmydd.clzt='99' and jc_mmydd.htje>0";
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
			ls_sql+=" FROM crm_khxx,jc_mmydd,jc_mmzjx";
			ls_sql+=" where jc_mmzjx.khbh=crm_khxx.khbh and jc_mmydd.yddbh=jc_mmzjx.yddbh and crm_khxx.dwbh='"+dmbh+"'";
			ls_sql+=wheresql;
			ls_sql+=" and jc_mmydd.clzt>='04' and jc_mmydd.clzt!='99'";
			ls_sql+=" and jc_mmzjx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_mmzjx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_mmzjx.clzt!='00'";
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
			ls_sql+=" FROM crm_khxx,jc_cgdd";
			ls_sql+=" where crm_khxx.khbh=jc_cgdd.khbh and crm_khxx.dwbh='"+dmbh+"'";
			ls_sql+=wheresql;
			ls_sql+=" and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_cgdd.clzt>='13'";
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
			ls_sql="SELECT sum(jc_cgdd.htze) htze,count(distinct jc_cgdd.khbh) cgqys";
			ls_sql+=" FROM crm_khxx,jc_cgdd";
			ls_sql+=" where crm_khxx.khbh=jc_cgdd.khbh and crm_khxx.dwbh='"+dmbh+"'";
			ls_sql+=wheresql;
			ls_sql+=" and jc_cgdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_cgdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_cgdd.clzt='99' and jc_cgdd.htze>0";
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
			ls_sql+=" FROM crm_khxx,jc_cgdd,jc_cgzjx";
			ls_sql+=" where jc_cgzjx.khbh=crm_khxx.khbh and jc_cgdd.ddbh=jc_cgzjx.ddbh and crm_khxx.dwbh='"+dmbh+"'";
			ls_sql+=wheresql;
			ls_sql+=" and jc_cgdd.clzt>='13' and jc_cgdd.clzt!='99'";
			ls_sql+=" and jc_cgzjx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_cgzjx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_cgzjx.clzt!='00'";
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
			ls_sql+=" FROM crm_khxx,jc_jjdd";
			ls_sql+=" where crm_khxx.khbh=jc_jjdd.khbh and crm_khxx.dwbh='"+dmbh+"'";
			ls_sql+=wheresql;
			ls_sql+=" and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_jjdd.clzt>='13'";
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
			ls_sql="SELECT sum(jc_jjdd.htze) htze,count(distinct jc_jjdd.khbh) jjqys";
			ls_sql+=" FROM crm_khxx,jc_jjdd";
			ls_sql+=" where crm_khxx.khbh=jc_jjdd.khbh and crm_khxx.dwbh='"+dmbh+"'";
			ls_sql+=wheresql;
			ls_sql+=" and jc_jjdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_jjdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_jjdd.clzt='99' and jc_jjdd.htze>0";
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
			ls_sql+=" FROM crm_khxx,jc_jjdd,jc_jjzjx";
			ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh and jc_jjzjx.ddbh=jc_jjdd.ddbh and crm_khxx.dwbh='"+dmbh+"'";
			ls_sql+=wheresql;
			ls_sql+=" and jc_jjdd.clzt>='13' and jc_jjdd.clzt!='99'";
			ls_sql+=" and jc_jjzjx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_jjzjx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_jjzjx.clzt!='00'";
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


			//���Ľ�����
			//ǩ��
			zcqde=0;
			zcqds=0;
			ls_sql="SELECT sum(jc_zcdd.hkze) htze,count(distinct jc_zcdd.khbh) zcqys";
			ls_sql+=" FROM crm_khxx,jc_zcdd";
			ls_sql+=" where crm_khxx.khbh=jc_zcdd.khbh and crm_khxx.dwbh='"+dmbh+"'";
			ls_sql+=wheresql;
			ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt>='09'";
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
			ls_sql="SELECT sum(jc_zcdd.hkze) htze,count(distinct jc_zcdd.khbh) zcqys";
			ls_sql+=" FROM crm_khxx,jc_zcdd";
			ls_sql+=" where crm_khxx.khbh=jc_zcdd.khbh and crm_khxx.dwbh='"+dmbh+"'";
			ls_sql+=wheresql;
			ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt='99' and jc_zcdd.hkze>0";
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
			ls_sql+=" FROM crm_khxx,jc_zcdd,jc_zczjx";
			ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and jc_zcdd.ddbh=jc_zczjx.ddbh and crm_khxx.dwbh='"+dmbh+"'";
			ls_sql+=wheresql;
			ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='99'";
			ls_sql+=" and jc_zczjx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zczjx.clzt!='00'";
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

			ls_sql="SELECT count(distinct khbh)";
			ls_sql+=" FROM (";

			ls_sql+=" SELECT jc_mmydd.khbh";
			ls_sql+=" FROM crm_khxx,jc_mmydd";
			ls_sql+=" where  crm_khxx.khbh=jc_mmydd.khbh and crm_khxx.dwbh='"+dmbh+"'";
			ls_sql+=wheresql;
			ls_sql+=" and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_mmydd.htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_mmydd.clzt>='04' and jc_mmydd.clzt!='99'";

			ls_sql+=" UNION ALL";

			ls_sql+=" SELECT jc_cgdd.khbh";
			ls_sql+=" FROM crm_khxx,jc_cgdd";
			ls_sql+=" where crm_khxx.khbh=jc_cgdd.khbh and crm_khxx.dwbh='"+dmbh+"'";
			ls_sql+=wheresql;
			ls_sql+=" and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_cgdd.clzt>='13' and jc_cgdd.clzt!='99'";

			ls_sql+=" UNION ALL";

			ls_sql+=" SELECT jc_jjdd.khbh";
			ls_sql+=" FROM crm_khxx,jc_jjdd";
			ls_sql+=" where crm_khxx.khbh=jc_jjdd.khbh and crm_khxx.dwbh='"+dmbh+"'";
			ls_sql+=wheresql;
			ls_sql+=" and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_jjdd.clzt>='13' and jc_jjdd.clzt!='99'";

			ls_sql+=" UNION ALL";

			ls_sql+=" SELECT jc_zcdd.khbh";
			ls_sql+=" FROM crm_khxx,jc_zcdd";
			ls_sql+=" where crm_khxx.khbh=jc_zcdd.khbh and crm_khxx.dwbh='"+dmbh+"'";
			ls_sql+=wheresql;
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
    <td ><%=fgsmc%></td>
    <td ><%=row%></td>
    <td ><%=dmmc%></td>
    <td  align="right"><%=cf.formatDouble(jzqye)%></td>
    <td  align="right"><%=jzqys%></td>
    <td  align="right"><%=jcqys%></td>
    <td  align="right"><%=cf.formatDouble(dmjcjzsbl)%>%</td>
    <td  align="right"><%=cf.formatDouble(dmjcsbl)%>%</td>
    <td  align="right"><%=cf.formatDouble(jcqye)%></td>
    <td  align="right"><%=cf.formatDouble(dmjcjzebl)%>%</td>
    <td  align="right"><%=cf.formatDouble(dmjcebl)%>%</td>
    <!-- ������ľ������: --> 
    <td  align="right"><%=mmqys%></td>
    <td  align="right"><%=cf.formatDouble(dmmmjzsbl)%>%</td>
    <td  align="right"><%=cf.formatDouble(dmmmjcsbl)%>%</td>
    <td  align="right"><%=cf.formatDouble(dmmmsbl)%>%</td>
    <td  align="right"><%=cf.formatDouble(mmqye)%></td>
    <td  align="right"><%=cf.formatDouble(dmmmjzebl)%>%</td>
    <td  align="right"><%=cf.formatDouble(dmmmjcebl)%>%</td>
    <td  align="right"><%=cf.formatDouble(dmmmebl)%>%</td>
    <!-- �����ǳ�������: --> 
    <td  align="right"><%=cgqys%></td>
    <td  align="right"><%=cf.formatDouble(dmcgjzsbl)%>%</td>
    <td  align="right"><%=cf.formatDouble(dmcgjcsbl)%>%</td>
    <td  align="right"><%=cf.formatDouble(dmcgsbl)%>%</td>
    <td  align="right"><%=cf.formatDouble(cgqye)%></td>
    <td  align="right"><%=cf.formatDouble(dmcgjzebl)%>%</td>
    <td  align="right"><%=cf.formatDouble(dmcgjcebl)%>%</td>
    <td  align="right"><%=cf.formatDouble(dmcgebl)%>%</td>
    <!-- �����ǼҾ�����: --> 
    <td  align="right"><%=jjqys%></td>
    <td  align="right"><%=cf.formatDouble(dmjjjzsbl)%>%</td>
    <td  align="right"><%=cf.formatDouble(dmjjjcsbl)%>%</td>
    <td  align="right"><%=cf.formatDouble(dmjjsbl)%>%</td>
    <td  align="right"><%=cf.formatDouble(jjqye)%></td>
    <td  align="right"><%=cf.formatDouble(dmjjjzebl)%>%</td>
    <td  align="right"><%=cf.formatDouble(dmjjjcebl)%>%</td>
    <td  align="right"><%=cf.formatDouble(dmjjebl)%>%</td>
    <!-- ��������������: --> 
    <td  align="right"><%=zcqys%></td>
    <td  align="right"><%=cf.formatDouble(dmzcjzsbl)%>%</td>
    <td  align="right"><%=cf.formatDouble(dmzcjcsbl)%>%</td>
    <td  align="right"><%=cf.formatDouble(dmzcsbl)%>%</td>
    <td  align="right"><%=cf.formatDouble(zcqye)%></td>
    <td  align="right"><%=cf.formatDouble(dmzcjzebl)%>%</td>
    <td  align="right"><%=cf.formatDouble(dmzcjcebl)%>%</td>
    <td  align="right"><%=cf.formatDouble(dmzcebl)%>%</td>
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
  <tr align="center" > 
    <td colspan="3"><font color="#000099"><b><%=fgsmc%>С ��</b></font></td>
    <td  align="right"><font color="#000099"><b><%=cf.formatDouble(xjjzqye)%></b></font></td>
    <td  align="right"><font color="#000099"><b><%=xjjzqys%></b></font></td>
    <td  align="right"><font color="#000099"><b><%=xjjcqys%></b></font></td>
    <td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmjcjzsbl)%>%</b></font></td>
    <td >&nbsp;</td>
    <td  align="right"><font color="#000099"><b><%=cf.formatDouble(xjjcqye)%></b></font></td>
    <td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmjcjzebl)%>%</b></font></td>
    <td >&nbsp;</td>
    <!-- ������ľ������: --> 
    <td  align="right"><font color="#000099"><b><%=xjmmqys%></b></font></td>
    <td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmmmjzsbl)%>%</b></font></td>
    <td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmmmjcsbl)%>%</b></font></td>
    <td >&nbsp;</td>
    <td  align="right"><font color="#000099"><b><%=cf.formatDouble(xjmmqye)%></b></font></td>
    <td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmmmjzebl)%>%</b></font></td>
    <td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmmmjcebl)%>%</b></font></td>
    <td >&nbsp;</td>
    <!-- �����ǳ�������: --> 
    <td  align="right"><font color="#000099"><b><%=xjcgqys%></b></font></td>
    <td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmcgjzsbl)%>%</b></font></td>
    <td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmcgjcsbl)%>%</b></font></td>
    <td >&nbsp;</td>
    <td  align="right"><font color="#000099"><b><%=cf.formatDouble(xjcgqye)%></b></font></td>
    <td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmcgjzebl)%>%</b></font></td>
    <td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmcgjcebl)%>%</b></font></td>
    <td >&nbsp;</td>
    <!-- �����ǼҾ�����: --> 
    <td  align="right"><font color="#000099"><b><%=xjjjqys%></b></font></td>
    <td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmjjjzsbl)%>%</b></font></td>
    <td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmjjjcsbl)%>%</b></font></td>
    <td >&nbsp;</td>
    <td  align="right"><font color="#000099"><b><%=cf.formatDouble(xjjjqye)%></b></font></td>
    <td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmjjjzebl)%>%</b></font></td>
    <td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmjjjcebl)%>%</b></font></td>
    <td >&nbsp;</td>
    <!-- ��������������: --> 
    <td  align="right"><font color="#000099"><b><%=xjzcqys%></b></font></td>
    <td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmzcjzsbl)%>%</b></font></td>
    <td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmzcjcsbl)%>%</b></font></td>
    <td ><font color="#000099"><b>&nbsp;</b></font></td>
    <td  align="right"><font color="#000099"><b><%=cf.formatDouble(xjzcqye)%></b></font></td>
    <td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmzcjzebl)%>%</b></font></td>
    <td  align="right"><font color="#000099"><b><%=cf.formatDouble(dmzcjcebl)%>%</b></font></td>
    <td >&nbsp;</td>
  </tr>
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
    <td colspan="3"><b>�� ��</b></td>
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

<BR>1.ռ�ܼҾ�ǩԼ������=(����Ҿ�ǩԼ��/�ֹ�˾�Ҿ���ǩԼ��)

<BR>2.ռ�ܼҾ�ǩԼ�����=(����Ҿ�ǩԼ��/�ֹ�˾�Ҿ���ǩԼ��)

<P>[����ǩԼ��]��ָ��ͬ?��??��?��ͼ�װ�?��?������?
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
 
