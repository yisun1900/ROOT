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
String sjs=cf.GB2Uni(request.getParameter("sjs"));

String wheresql="";

if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
if (!(sjs.equals("")))	wheresql+=" and  crm_khxx.sjs='"+sjs+"'";


String getfgsbh=null;
String getdwbh=null;
String getdwmc=null;
String getsjs=null;
String olddwbh="";

int qys=0;
double zqye=0;
double wdzgce=0;
double sjf=0;
long fwmj=0;
int allqys=0;
double allzqye=0;
double allwdzgce=0;
double allsjf=0;
long allfwmj=0;
double zkl=0;
int pjde=0;
int pmjj=0;

int row=0;

String bgcolor="#FFFFFF";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

PreparedStatement ps1=null;
ResultSet rs1=null;

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
	ps.setString(3,xtrzyhmc+"�����ʦ�Ҿ�ҵ����"+sjfw+"��"+sjfw2+"��"+fgs+"��"+dwbh+"��");
	ps.executeUpdate();
	ps.close();

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>���ʦ�Ҿӵ����ֵͳ��<BR>
  (ǩԼʱ�䣺<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>

<table border="1" width="160%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 13px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="3%">���</td>
  <td  width="9%">����</td>
  <td  width="4%">���ʦ</td>
  <td  width="5%">����ǩԼ��</td>
  <td  width="6%">����ǩԼ��</td>
  <td  width="6%">ľ��ǩԼ��</td>
  <td  width="4%">ľ��/��װ</td>
   <td  width="6%">����ǩԼ��</td>
  <td  width="4%">����/��װ</td>
   <td  width="6%">�Ҿ�ǩԼ��</td>
  <td  width="4%">�Ҿ�/��װ</td>
<td  width="6%"><font color="#CC0000"><b>�ذ�</b></font></td>
<td  width="6%"><font color="#CC0000"><b>���</b></font></td>
<td  width="6%"><font color="#CC0000"><b>��ש</b></font></td>
<td  width="6%"><font color="#CC0000"><b>����</b></font></td>
   <td  width="6%">����ǩԼ��</td>
  <td  width="4%">����/��װ</td>
  <td  width="6%">�����ܶ�</td>
  <td  width="4%">����/��װ</td>

</tr>
<%
  //�Ҿ�ҵ��������ǩԼ��+��������<����ǰ��ǩ�ú�ͬ>-���ڼ���<����ǰ��ǩ�ú�ͬ>-�����˵�<����ǰ��ǩ�ú�ͬ>

		double allsishtje=0;

		int maxkhsl=0;

		double mmhtje=0;
		double cghtze=0;
		double jjhtze=0;
		double zchtje=0;

		double jcje=0;

		double xjmmje=0;
		double xjcgje=0;
		double xjjjje=0;
		double xjzcje=0;
		double xjjcje=0;

		double zcczhtje=0;
		double zcdbhtje=0;
		double zcjjhtje=0;
		double zcqtje=0;

		double xjzcczje=0;
		double xjzcdbje=0;
		double xjzcjjje=0;
		double xjzcqtje=0;

		double mmjzbl=0;
		double cgjzbl=0;
		double jjjzbl=0;
		double zcjzbl=0;
		double jcjzbl=0;
	//��ȡ�����

		ls_sql=" SELECT distinct fgsbh,dwbh,sjs";
		ls_sql+=" from ";
		ls_sql+=" ( ";

		ls_sql+=" SELECT crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.sjs";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt='2'";
		ls_sql+=wheresql;
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	
		ls_sql+=" UNION ALL";
		
		ls_sql+=" SELECT crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.sjs";
		ls_sql+=" FROM crm_khxx,jc_mmydd";
		ls_sql+=" where jc_mmydd.khbh=crm_khxx.khbh ";
		ls_sql+=wheresql;
		ls_sql+=" and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_mmydd.htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_mmydd.clzt>='04' and jc_mmydd.clzt!='99'";
	
		ls_sql+=" UNION ALL";
		
		ls_sql+=" SELECT crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.sjs";
		ls_sql+=" FROM crm_khxx,jc_cgdd";
		ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh ";
		ls_sql+=wheresql;
		ls_sql+=" and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_cgdd.clzt>='13' and jc_cgdd.clzt!='99'";
	
		ls_sql+=" UNION ALL";
		
		ls_sql+=" SELECT crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.sjs";
		ls_sql+=" FROM crm_khxx,jc_jjdd";
		ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh ";
		ls_sql+=wheresql;
		ls_sql+=" and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_jjdd.clzt>='13' and jc_jjdd.clzt!='99'";
	
		ls_sql+=" UNION ALL";
		
		ls_sql+=" SELECT crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.sjs";
		ls_sql+=" FROM crm_khxx,jc_zcdd";
		ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh ";
		ls_sql+=wheresql;
		ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='99'";

		if (sjs.equals(""))
		{
			ls_sql+=" UNION ALL";

			ls_sql+=" SELECT sq_yhxx.ssfgs fgsbh,sq_yhxx.dwbh,sq_yhxx.yhmc sjs";
			ls_sql+=" FROM sq_yhxx,sq_dwxx";
			ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm='04' and sfzszg in('Y','N')";

			if (!(fgs.equals("")))	
			{
				ls_sql+=" and  (sq_yhxx.ssfgs='"+fgs+"')";
			}

			if (!(dwbh.equals("")))	
			{
				ls_sql+=" and  sq_yhxx.dwbh='"+dwbh+"'";
			}

		}


		ls_sql+=" ) ";

		ls_sql+=" order by fgsbh,dwbh,sjs";

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getfgsbh=rs.getString("fgsbh");
			getdwbh=rs.getString("dwbh");
			getsjs=rs.getString("sjs");

			row++;

			qys=0;
			zqye=0;

			mmhtje=0;
			cghtze=0;
			jjhtze=0;
			zchtje=0;

			jcje=0;

			zcczhtje=0;
			zcdbhtje=0;
			zcjjhtje=0;
			zcqtje=0;

			if (!olddwbh.equals(getdwbh))
			{
				ls_sql=" SELECT dwmc";
				ls_sql+=" FROM sq_dwxx";
				ls_sql+=" where dwbh='"+getdwbh+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					getdwmc=rs1.getString("dwmc");
				}
				rs1.close();
				ps1.close();

				olddwbh=getdwbh;
			}


			//��װҵ��
			ls_sql=" SELECT count(*) qys,sum(qye) zqye";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where crm_khxx.zt='2'";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				qys=rs1.getInt("qys");
				zqye=rs1.getDouble("zqye");
			}
			rs1.close();
			ps1.close();


			allqys+=qys;
			allzqye+=zqye;


			double mmje=0;
			//ľ�ź�ͬ������
			ls_sql="SELECT sum(jc_mmydd.htje) htze";
			ls_sql+=" FROM crm_khxx,jc_mmydd";
			ls_sql+=" where jc_mmydd.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_mmydd.htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_mmydd.clzt>='04'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				mmhtje=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			//ľ���˵�������
			double mmtdje=0;
			ls_sql="SELECT sum(jc_mmydd.htje) htze";
			ls_sql+=" FROM crm_khxx,jc_mmydd";
			ls_sql+=" where jc_mmydd.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and jc_mmydd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_mmydd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_mmydd.clzt='99' and jc_mmydd.htje>0";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				mmtdje=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			//ľ�������������
			double mmzjxze=0;
			ls_sql="SELECT sum(jc_mmzjx.zjxze) zjxze";
			ls_sql+=" FROM crm_khxx,jc_mmydd,jc_mmzjx";
			ls_sql+=" where jc_mmzjx.khbh=crm_khxx.khbh and jc_mmydd.yddbh=jc_mmzjx.yddbh";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and jc_mmydd.clzt>='04' and jc_mmydd.clzt!='99'";
			ls_sql+=" and jc_mmzjx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_mmzjx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_mmzjx.clzt!='00'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				mmzjxze=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			mmje=mmhtje-mmtdje+mmzjxze;

			xjmmje+=mmje;

			//�����ͬ�ܶ�
			double cgje=0;
			ls_sql="SELECT sum(jc_cgdd.htze) htze";
			ls_sql+=" FROM crm_khxx,jc_cgdd";
			ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_cgdd.clzt>='13'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				cghtze=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			//�����˵��ܶ�
			double cgtdze=0;
			ls_sql="SELECT sum(jc_cgdd.htze) htze";
			ls_sql+=" FROM crm_khxx,jc_cgdd";
			ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and jc_cgdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_cgdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_cgdd.clzt='99' and jc_cgdd.htze>0";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				cgtdze=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			//�����������ܶ�
			double cgzjxze=0;
			ls_sql="SELECT sum(jc_cgzjx.zjxze) zjxze";
			ls_sql+=" FROM crm_khxx,jc_cgdd,jc_cgzjx";
			ls_sql+=" where jc_cgzjx.khbh=crm_khxx.khbh and jc_cgdd.ddbh=jc_cgzjx.ddbh";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and jc_cgdd.clzt>='13' and jc_cgdd.clzt!='99'";
			ls_sql+=" and jc_cgzjx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_cgzjx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_cgzjx.clzt!='00'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				cgzjxze=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			cgje=cghtze-cgtdze+cgzjxze;

			xjcgje+=cgje;

			//�Ҿ߽�����
			double jjje=0;
			ls_sql="SELECT sum(jc_jjdd.htze) htze";
			ls_sql+=" FROM crm_khxx,jc_jjdd";
			ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_jjdd.clzt>='13'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				jjhtze=rs1.getDouble(1);//���ʦ������
			}
			rs1.close();
			ps1.close();

			//�Ҿ��˵�������
			double jjtdze=0;
			ls_sql="SELECT sum(jc_jjdd.htze) htze";
			ls_sql+=" FROM crm_khxx,jc_jjdd";
			ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and jc_jjdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_jjdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_jjdd.clzt='99' and jc_jjdd.htze>0";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				jjtdze=rs1.getDouble(1);//���ʦ������
			}
			rs1.close();
			ps1.close();

			//�Ҿ������������
			double jjzjxze=0;
			ls_sql="SELECT sum(jc_jjzjx.zjxze) zjxze";
			ls_sql+=" FROM crm_khxx,jc_jjdd,jc_jjzjx";
			ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh and jc_jjzjx.ddbh=jc_jjdd.ddbh";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and jc_jjdd.clzt>='13' and jc_jjdd.clzt!='99'";
			ls_sql+=" and jc_jjzjx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_jjzjx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_jjzjx.clzt!='00'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				jjzjxze=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			jjje=jjhtze-jjtdze+jjzjxze;

			xjjjje+=jjje;

			//���ĺ�ͬ������
			double zcje=0;
			ls_sql="SELECT sum(jc_zcdd.hkze) htze";
			ls_sql+=" FROM crm_khxx,jc_zcdd";
			ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt>='09'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zchtje=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			//�����˵�������
			double zctdje=0;
			ls_sql="SELECT sum(jc_zcdd.hkze) htze";
			ls_sql+=" FROM crm_khxx,jc_zcdd";
			ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt='99' and jc_zcdd.hkze>0";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zctdje=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			//���������������
			double zczjxje=0;
			ls_sql="SELECT sum(jc_zczjx.zjxze) zjxze";
			ls_sql+=" FROM crm_khxx,jc_zcdd,jc_zczjx";
			ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and jc_zcdd.ddbh=jc_zczjx.ddbh";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='99'";
			ls_sql+=" and jc_zczjx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zczjx.clzt!='00'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zczjxje=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			zcje=zchtje-zctdje+zczjxje;

			xjzcje+=zcje;

			//�ذ������

			double zcdbje=0;

			//��ͬ������
			ls_sql="SELECT sum(jc_zcdd.hkze) htze";
			ls_sql+=" FROM crm_khxx,jc_zcdd";
			ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.zcxlbm='�ذ�'";//1003:�ذ�
			ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt>='09'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcdbhtje=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			//�˵�������
			double zcdbtdje=0;
			ls_sql="SELECT sum(jc_zcdd.hkze) htze";
			ls_sql+=" FROM crm_khxx,jc_zcdd";
			ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.zcxlbm='�ذ�'";//1003:�ذ�
			ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt='99' and jc_zcdd.hkze>0";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcdbtdje=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			//�����������
			double zcdbzjxje=0;
			ls_sql="SELECT sum(jc_zczjx.zjxze) zjxze";
			ls_sql+=" FROM crm_khxx,jc_zcdd,jc_zczjx";
			ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and jc_zcdd.ddbh=jc_zczjx.ddbh";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.zcxlbm='�ذ�'";//1003:�ذ�
			ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='99'";
			ls_sql+=" and jc_zczjx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zczjx.clzt!='00'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcdbzjxje=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			zcdbje=zcdbhtje-zcdbtdje+zcdbzjxje;

			xjzcdbje+=zcdbje;


			//��߽�����

			double zcjjje=0;

			//��ͬ������
			ls_sql="SELECT sum(jc_zcdd.hkze) htze";
			ls_sql+=" FROM crm_khxx,jc_zcdd";
			ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.zcxlbm='���'";//0901:���
			ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt>='09'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcjjhtje=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			//�˵�������
			double zcjjtdje=0;
			ls_sql="SELECT sum(jc_zcdd.hkze) htze";
			ls_sql+=" FROM crm_khxx,jc_zcdd";
			ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.zcxlbm='���'";//0901:���
			ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt='99' and jc_zcdd.hkze>0";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcjjtdje=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			//�����������
			double zcjjzjxje=0;
			ls_sql="SELECT sum(jc_zczjx.zjxze) zjxze";
			ls_sql+=" FROM crm_khxx,jc_zcdd,jc_zczjx";
			ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and jc_zcdd.ddbh=jc_zczjx.ddbh";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.zcxlbm='���'";//0901:���
			ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='99'";
			ls_sql+=" and jc_zczjx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zczjx.clzt!='00'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcjjzjxje=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			zcjjje=zcjjhtje-zcjjtdje+zcjjzjxje;

			xjzcjjje+=zcjjje;


			//��ש������
			double zcczje=0;

			//��ͬ������
			ls_sql="SELECT sum(jc_zcdd.hkze) htze";
			ls_sql+=" FROM crm_khxx,jc_zcdd";
			ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.zcxlbm='��ש'";//1001:��ש
			ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt>='09'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcczhtje=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			//�˵�������
			double zccztdje=0;
			ls_sql="SELECT sum(jc_zcdd.hkze) htze";
			ls_sql+=" FROM crm_khxx,jc_zcdd";
			ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.zcxlbm='��ש'";//1001:��ש
			ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt='99' and jc_zcdd.hkze>0";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zccztdje=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			//�����������
			double zcczzjxje=0;
			ls_sql="SELECT sum(jc_zczjx.zjxze) zjxze";
			ls_sql+=" FROM crm_khxx,jc_zcdd,jc_zczjx";
			ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and jc_zcdd.ddbh=jc_zczjx.ddbh";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.sjs='"+getsjs+"'";
			ls_sql+=" and jc_zcdd.zcxlbm='��ש'";//1001:��ש
			ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='99'";
			ls_sql+=" and jc_zczjx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zczjx.clzt!='00'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcczzjxje=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			zcczje=zcczhtje-zccztdje+zcczzjxje;

			xjzcczje+=zcczje;


			zcqtje=zcje-zcdbje-zcjjje-zcczje;

			xjzcqtje+=zcqtje;


			jcje=mmje+cgje+jjje+zcje;

			xjjcje+=jcje;

			//�������
			if(zqye==0)
			{
				mmjzbl=0;
				cgjzbl=0;
				jjjzbl=0;
				zcjzbl=0;
				jcjzbl=0;
			}
			else
			{
				mmjzbl=mmje*100/zqye;
				cgjzbl=cgje*100/zqye;
				jjjzbl=jjje*100/zqye;
				zcjzbl=zcje*100/zqye;
				jcjzbl=jcje*100/zqye;
			}

		%>
			<tr align="center" bgcolor="<%=bgcolor%>">
				<td ><%=row%>
				</td>
				<td ><%=getdwmc%></td>
				<td ><%=getsjs%></td>
				<td  align="right"><%=qys%></td>
				<td  align="right"><%=cf.formatDouble(zqye)%></td>
				<td  align="right"><%=cf.formatDouble(mmje)%></td>
				<td  align="right"><%=cf.formatDouble(mmjzbl)%>%</td>
				<td  align="right"><%=cf.formatDouble(cgje)%></td>
				<td  align="right"><%=cf.formatDouble(cgjzbl)%>%</td>
				<td  align="right"><%=cf.formatDouble(jjje)%></td>
				<td  align="right"><%=cf.formatDouble(jjjzbl)%>%</td>
				<td  align="right"><%=cf.formatDouble(zcdbje)%></td>
				<td  align="right"><%=cf.formatDouble(zcjjje)%></td>
				<td  align="right"><%=cf.formatDouble(zcczje)%></td>
				<td  align="right"><%=cf.formatDouble(zcqtje)%></td>
				<td  align="right"><%=cf.formatDouble(zcje)%></td>
				<td  align="right"><%=cf.formatDouble(zcjzbl)%>%</td>
				<td  align="right"><A HREF="ViewSjsJjcz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&sjs=<%=getsjs%>&dwbh=<%=getdwbh%>" target="_blank"><%=cf.formatDouble(jcje)%></A></td>
				<td  align="right"><%=cf.formatDouble(jcjzbl)%>%</td>
			</tr>
		<%
		}
		rs.close();
		ps.close();


		//�������
		if(allzqye==0)
		{
			mmjzbl=0;
			cgjzbl=0;
			jjjzbl=0;
			zcjzbl=0;
			jcjzbl=0;
		}
		else
		{
			mmjzbl=xjmmje*100/allzqye;
			cgjzbl=xjcgje*100/allzqye;
			jjjzbl=xjjjje*100/allzqye;
			zcjzbl=xjzcje*100/allzqye;
			jcjzbl=xjjcje*100/allzqye;
		}

%>
		<tr align="center" bgcolor="<%=bgcolor%>">
			<td >�ܼ�</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td  align="right"><%=allqys%></td>
			<td  align="right"><%=cf.formatDouble(allzqye)%></td>
			<td  align="right"><%=cf.formatDouble(xjmmje)%></td>
			<td  align="right"><%=cf.formatDouble(mmjzbl)%>%</td>
			<td  align="right"><%=cf.formatDouble(xjcgje)%></td>
			<td  align="right"><%=cf.formatDouble(cgjzbl)%>%</td>
			<td  align="right"><%=cf.formatDouble(xjjjje)%></td>
			<td  align="right"><%=cf.formatDouble(jjjzbl)%>%</td>
			<td  align="right"><%=cf.formatDouble(xjzcdbje)%></td>
			<td  align="right"><%=cf.formatDouble(xjzcjjje)%></td>
			<td  align="right"><%=cf.formatDouble(xjzcczje)%></td>
			<td  align="right"><%=cf.formatDouble(xjzcqtje)%></td>
			<td  align="right"><%=cf.formatDouble(xjzcje)%></td>
			<td  align="right"><%=cf.formatDouble(zcjzbl)%>%</td>
			<td  align="right"><%=cf.formatDouble(xjjcje)%></td>
			<td  align="right"><%=cf.formatDouble(jcjzbl)%>%</td>
		</tr>
		</table>
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<P>[����ǩԼ��]��ָ��ͬ��������װ�ͼ�װ��������������
<P>[�Ҿӽ��]������ǩԼ��+��������<����ǰ��ǩ�ú�ͬ>-���ڼ���<����ǰ��ǩ�ú�ͬ>-�����˵�<����ǰ��ǩ�ú�ͬ>
