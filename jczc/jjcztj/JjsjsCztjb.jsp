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
String sjs=cf.GB2Uni(request.getParameter("sjs"));

String wheresql="";

if (!(fgs.equals("")))
{
	wheresql+=" and  (sq_yhxx.ssfgs='"+fgs+"')";
}
if (!(sjs.equals("")))
{
	wheresql+=" and sq_yhxx.yhmc='"+sjs+"'";
}


String getfgsbh=null;
String getdwmc=null;
String getsjs=null;

String olddwbh="";

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

	//ϵͳ��־
	String xtrzip=request.getRemoteHost();
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String xtrzyhmc=(String)session.getAttribute("yhmc");
	ls_sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
	ls_sql+=" values ( (select NVL(max(xh),0)+8 from sq_ckxxrz),?,?,SYSDATE,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xtrzip);
	ps.setString(2,xtrzyhdlm);
	ps.setString(3,xtrzyhmc+"�����ʦ�Ҿ�ҵ����"+sjfw+"��"+sjfw2+"��"+fgs);
	ps.executeUpdate();
	ps.close();

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>�Ҿ����ʦ��ֵͳ��<BR>
  (ʱ�䷶Χ��<%=sjfw%>--<%=sjfw2%>)</B> <BR>
</CENTER>

<table border="1" width="190%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 13px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td rowspan="2" width="3%">���</td>
    <td rowspan="2"  width="6%">�ֹ�˾</td>
    <td rowspan="2"  width="4%">���ʦ</td>
    <td colspan="2">�ӵ���</td>
    <td colspan="2">�ۼƽӵ���</td>
    <td colspan="2">�ִ浥δǩ��</td>
    <td rowspan="2"  width="3%">�ɵ���</td>
    <td colspan="2">ǩ����</td>
    <td colspan="2">ǩԼ���</td>
    <td colspan="2">�˵�����</td>
    <td  rowspan="2" width="4%">����Ҿ߿���</td>
    <td colspan="3">�ۼ�ǩԼ��</td>
    <td colspan="3">�ۼư�װ����</td>
  </tr>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="4%">����</td>
    <td  width="4%">�Ҿ�</td>
    <td  width="4%">����</td>
    <td  width="4%">�Ҿ�</td>
    <td  width="4%">����</td>
    <td  width="4%">�Ҿ�</td>
    <td  width="4%">����</td>
    <td  width="4%">�Ҿ�</td>
    <td  width="5%">����</td>
    <td  width="5%">�Ҿ�</td>
    <td  width="4%">����</td>
    <td  width="4%">�Ҿ�</td>

    <td  width="6%">����</td>
    <td  width="6%">�Ҿ�</td>
    <td  width="6%">�ϼ�</td>
    <td  width="4%">����</td>
    <td  width="4%">�Ҿ�</td>
    <td  width="4%">�ϼ�</td>
  </tr>
  <%
  //�Ҿ�ҵ��������ǩԼ��+��������<����ǰ��ǩ�ú�ͬ>-���ڼ���<����ǰ��ǩ�ú�ͬ>-�����˵�<����ǰ��ǩ�ú�ͬ>

	int xjcgjdl=0;
	int xjjjjdl=0;
	int xjljcgjdl=0;
	int xjljjjjdl=0;
	int xjcgwqds=0;
	int xjjjwqds=0;
	int xjcgqds=0;
	double xjcgqde=0;
	int xjjjqds=0;
	double xjjjqde=0;
	int xjcgtds=0;
	double xjcgtde=0;
	int xjjjtds=0;
	double xjjjtde=0;
	int xjcgjjkss=0;
	int xjljcgqds=0;
	double xjljcgqde=0;
	int xjljjjqds=0;
	double xjljjjqde=0;

	int xjljcgazs=0;
	int xjljjjazs=0;

	double cgjjqdl=0;

	//��ȡȫ���Ҿ����ʦ���۳���ְԱ��
	ls_sql=" select sq_yhxx.ssfgs,dwmc,yhmc";
	ls_sql+=" from sq_yhxx,sq_dwxx ";
	ls_sql+=" where sq_yhxx.ssfgs=sq_dwxx.dwbh and sq_yhxx.zwbm='12' and sq_yhxx.sfzszg in('Y','N')";
	ls_sql+=wheresql;
	ls_sql+=" order by ssfgs,yhmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getfgsbh=rs.getString("ssfgs");
		getdwmc=rs.getString("dwmc");
		getsjs=rs.getString("yhmc");

		row++;

		if (row%2==0)
		{
			bgcolor="E8E8FF";
		}
		else
		{
			bgcolor="FFFFFF";
		}

		//ʱ��γ���ӵ���
		int cgjdl=0;
		int jjjdl=0;

		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_khxx,jc_cgdd";
		ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_cgdd.cgsjs='"+getsjs+"'";
		ls_sql+=" and jc_cgdd.pdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_cgdd.pdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			cgjdl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		xjcgjdl+=cgjdl;

		//ʱ��μҾ߽ӵ���
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_khxx,jc_jjdd";
		ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_jjdd.jjsjs='"+getsjs+"'";
		ls_sql+=" and jc_jjdd.pdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_jjdd.pdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			jjjdl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		xjjjjdl+=jjjdl;

		//�ۼƳ���ӵ���
		int ljcgjdl=0;
		int ljjjjdl=0;

		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_khxx,jc_cgdd";
		ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_cgdd.cgsjs='"+getsjs+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			ljcgjdl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		xjljcgjdl+=ljcgjdl;

		//�ۼƼҾ߽ӵ���
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_khxx,jc_jjdd";
		ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_jjdd.jjsjs='"+getsjs+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			ljjjjdl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		xjljjjjdl+=ljjjjdl;

		//����δǩ����
		int cgwqds=0;
		int jjwqds=0;

		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_khxx,jc_cgdd";
		ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_cgdd.cgsjs='"+getsjs+"'";
		ls_sql+=" and jc_cgdd.clzt in('03','05','07','09','11')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			cgwqds=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		xjcgwqds+=cgwqds;

		//�Ҿ�δǩ����
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_khxx,jc_jjdd";
		ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_jjdd.jjsjs='"+getsjs+"'";
		ls_sql+=" and jc_jjdd.clzt in('03','05','07','09','11')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			jjwqds=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		xjjjwqds+=jjwqds;

		//����ǩ������ǩԼ���
		int cgqds=0;
		double cgqde=0;

		ls_sql="SELECT count(*),sum(jc_cgdd.htze)";
		ls_sql+=" FROM crm_khxx,jc_cgdd";
		ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_cgdd.cgsjs='"+getsjs+"'";
		ls_sql+=" and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_cgdd.clzt>='13' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			cgqds=rs1.getInt(1);
			cgqde=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		//�����˵���
		int cgtds=0;
		double cgtde=0;

		ls_sql="SELECT count(*),sum(jc_cgdd.htze)";
		ls_sql+=" FROM crm_khxx,jc_cgdd";
		ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_cgdd.cgsjs='"+getsjs+"'";
		ls_sql+=" and jc_cgdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_cgdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_cgdd.clzt='99' and jc_cgdd.htze>0";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			cgtds=rs1.getInt(1);
			cgtde=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		xjcgtds+=cgtds;
		xjcgtde+=cgtde;

		//�����������ܶ�
		double cgzjxze=0;
		ls_sql="SELECT sum(jc_cgzjx.zjxze) zjxze";
		ls_sql+=" FROM crm_khxx,jc_cgdd,jc_cgzjx";
		ls_sql+=" where jc_cgzjx.khbh=crm_khxx.khbh and jc_cgdd.ddbh=jc_cgzjx.ddbh";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_cgdd.cgsjs='"+getsjs+"'";
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

		xjcgqds+=cgqds-cgtds;
		xjcgqde+=cgqde-cgtde+cgzjxze;

		//�Ҿ�ǩ������ǩԼ���
		int jjqds=0;
		double jjqde=0;

		ls_sql="SELECT count(*),sum(jc_jjdd.htze)";
		ls_sql+=" FROM crm_khxx,jc_jjdd";
		ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_jjdd.jjsjs='"+getsjs+"'";
		ls_sql+=" and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_jjdd.clzt>='13'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			jjqds=rs1.getInt(1);
			jjqde=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		//�Ҿ��˵���
		int jjtds=0;
		double jjtde=0;

		ls_sql="SELECT count(*),sum(jc_jjdd.htze)";
		ls_sql+=" FROM crm_khxx,jc_jjdd";
		ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_jjdd.jjsjs='"+getsjs+"'";
		ls_sql+=" and jc_jjdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_jjdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_jjdd.clzt='99' and jc_jjdd.htze>0";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			jjtds=rs1.getInt(1);
			jjtde=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		xjjjtds+=jjtds;
		xjjjtde+=jjtde;

		//�Ҿ������������
		double jjzjxze=0;
		ls_sql="SELECT sum(jc_jjzjx.zjxze) zjxze";
		ls_sql+=" FROM crm_khxx,jc_jjdd,jc_jjzjx";
		ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh and jc_jjzjx.ddbh=jc_jjdd.ddbh";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_jjdd.jjsjs='"+getsjs+"'";
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

		xjjjqds+=jjqds-jjtds;
		xjjjqde+=jjqde-jjtde+jjzjxze;

		//����Ҿ߿�����
		int cgjjkss=0;


		ls_sql="SELECT count(distinct khbh)";
		ls_sql+=" from (";
		ls_sql+=" SELECT crm_khxx.khbh";
		ls_sql+=" FROM crm_khxx,jc_cgdd,crm_tsjl,crm_tsbm";
		ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh and crm_khxx.khbh=crm_tsjl.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"' and crm_tsbm.tslxbm='2305'";//2305���Ҿ����ʦ/����ʦͶ��
		ls_sql+=" and jc_cgdd.cgsjs='"+getsjs+"'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

		ls_sql+=" UNION ALL ";

		ls_sql+=" SELECT crm_khxx.khbh";
		ls_sql+=" FROM crm_khxx,jc_jjdd,crm_tsjl,crm_tsbm";
		ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh and crm_khxx.khbh=crm_tsjl.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"' and crm_tsbm.tslxbm='2305'";//2305���Ҿ����ʦ/����ʦͶ��
		ls_sql+=" and jc_jjdd.jjsjs='"+getsjs+"'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" )";

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			cgjjkss=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		xjcgjjkss+=cgjjkss;


		//�ۼƳ���ǩ�������ۼ�ǩԼ���
		int ljcgqds=0;
		double ljcgqde=0;
		int ljjjqds=0;
		double ljjjqde=0;

		ls_sql="SELECT count(*),sum(jc_cgdd.zjhze)";
		ls_sql+=" FROM crm_khxx,jc_cgdd";
		ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_cgdd.cgsjs='"+getsjs+"'";
		ls_sql+=" and jc_cgdd.clzt>='13' and jc_cgdd.clzt!='99'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			ljcgqds=rs1.getInt(1);
			ljcgqde=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		xjljcgqds+=ljcgqds;
		xjljcgqde+=ljcgqde;

		//�ۼƼҾ�ǩ�������ۼ�ǩԼ���
		ls_sql="SELECT count(*),sum(jc_jjdd.zjhze)";
		ls_sql+=" FROM crm_khxx,jc_jjdd";
		ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_jjdd.jjsjs='"+getsjs+"'";
		ls_sql+=" and jc_jjdd.clzt>='13' and jc_jjdd.clzt!='99'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			ljjjqds=rs1.getInt(1);
			ljjjqde=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		xjljjjqds+=ljjjqds;
		xjljjjqde+=ljjjqde;

	  
		//�ۼƳ���װ����
		int ljcgazs=0;
		int ljjjazs=0;

		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_khxx,jc_cgdd";
		ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_cgdd.cgsjs='"+getsjs+"'";
		ls_sql+=" and jc_cgdd.clzt in('31','33','35')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			ljcgazs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		xjljcgazs+=ljcgazs;

		//�ۼƼҾ߰�װ����
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_khxx,jc_jjdd";
		ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_jjdd.jjsjs='"+getsjs+"'";
		ls_sql+=" and jc_jjdd.clzt in('31','33','35')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			ljjjazs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		xjljjjazs+=ljjjazs;

		if ((ljcgjdl+ljjjjdl)==0)
		{
			cgjjqdl=0;
		}
		else{
			cgjjqdl=(ljcgqds+ljjjqds)*100.0/(ljcgjdl+ljjjjdl);
		}

	  %> 
	  <tr align="center" bgcolor="<%=bgcolor%>"> 
		<td ><%=row%> </td>
		<td ><%=getdwmc%></td>
		<td ><%=getsjs%></td>
		<td  align="right"><%=cgjdl%></td>
		<td  align="right"><%=jjjdl%></td>
		<td  align="right"><%=ljcgjdl%></td>
		<td  align="right"><%=ljjjjdl%></td>
		<td  align="right"><%=cgwqds%></td>
		<td  align="right"><%=jjwqds%></td>
		<td  align="right"><%=cf.formatDouble(cgjjqdl)%>%</td>
		<td  align="right"><%=cgqds%></td>
		<td  align="right"><%=jjqds%></td>
		<td  align="right"><%=cf.formatDouble(cgqde)%></td>
		<td  align="right"><%=cf.formatDouble(jjqde)%></td>
		<td  align="right"><%=cgtds%></td>
		<td  align="right"><%=jjtds%></td>
		<td  align="right"><%=cgjjkss%></td>
		<td  align="right"><%=cf.formatDouble(ljcgqde)%></td>
		<td  align="right"><%=cf.formatDouble(ljjjqde)%></td>
		<td  align="right"><%=cf.formatDouble(ljcgqde+ljjjqde)%></td>
		<td  align="right"><%=ljcgazs%></td>
		<td  align="right"><%=ljjjazs%></td>
		<td  align="right"><%=(ljcgazs+ljjjazs)%></td>
	  </tr>
	  <%
	}
	rs.close();
	ps.close();

	if ((xjljcgjdl+xjljjjjdl)==0)
	{
		cgjjqdl=0;
	}
	else{
		cgjjqdl=(xjljcgqds+xjljjjqds)*100.0/(xjljcgjdl+xjljjjjdl);
	}

%> 
  <tr align="center" bgcolor="<%=bgcolor%>"> 
    <td >�ܼ�</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
	<td  align="right"><%=xjcgjdl%></td>
	<td  align="right"><%=xjjjjdl%></td>
	<td  align="right"><%=xjljcgjdl%></td>
	<td  align="right"><%=xjljjjjdl%></td>
	<td  align="right"><%=xjcgwqds%></td>
	<td  align="right"><%=xjjjwqds%></td>
	<td  align="right"><%=cf.formatDouble(cgjjqdl)%>%</td>
	<td  align="right"><%=xjcgqds%></td>
	<td  align="right"><%=xjjjqds%></td>
	<td  align="right"><%=cf.formatDouble(xjcgqde)%></td>
	<td  align="right"><%=cf.formatDouble(xjjjqde)%></td>
	<td  align="right"><%=xjcgtds%></td>
	<td  align="right"><%=xjjjtds%></td>
	<td  align="right"><%=xjcgjjkss%></td>
	<td  align="right"><%=cf.formatDouble(xjljcgqde)%></td>
	<td  align="right"><%=cf.formatDouble(xjljjjqde)%></td>
	<td  align="right"><%=cf.formatDouble(xjljcgqde+xjljjjqde)%></td>
	<td  align="right"><%=xjljcgazs%></td>
	<td  align="right"><%=xjljjjazs%></td>
	<td  align="right"><%=(xjljcgazs+xjljjjazs)%></td>
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

<P>�ӵ������������ɵ�����ͳ���ɵ�ʱ�䣩
<P>�ۼƽӵ�����ȫ���ɵ�����ͳ���ɵ�ʱ�䣩
<P>�ִ浥δǩ�����������ʦ��ȷ������ʱ�䡢������Ҿ߳��⡢����֪ͨ��������Ҿ߸���5��״̬�Ļ�����Ϣ
<P>�ɵ��ʣ�(����+�Ҿ�)ǩ����������(����+�Ҿ�)�ӵ������İٷֱ�
<P>ǩ������������ǩ�������������˵���
<P>ǩԼ������ǩԼ��+��������<����ǰ��ǩ�ú�ͬ>-���ڼ���<����ǰ��ǩ�ú�ͬ>-�����˵�<����ǰ��ǩ�ú�ͬ>
<P>�˵��������������˵�����ͳ���˵�ʱ�䣩
<P>���ߣ�����������ġ��Ҿ����ʦ/����ʦͶ�߿ͻ���������Ͷ�ߴ���
<P>�ۼ�ǩԼ�ǩԼ��+����-����-�˵�
<P>�ۼư�װ������ȫ����װ������������ʼ��װ����װ��ɡ�����ᣩ
