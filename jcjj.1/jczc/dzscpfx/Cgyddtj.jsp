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

String fgs=request.getParameter("fgs");
String dwbh1=request.getParameter("dwbh");
String wheresql="";
if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh1!=null)
	{
		if (!(dwbh1.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh1+"'";
	}
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;

String ls_sql=null;
try {
	conn=cf.getConnection();

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<%
	//��ȡ�����


	String dwmc=null;
	String dwbh=null;


	
	int alllxsl=0;
	int allqds=0;

	double jjqye=0;
	double mmqye=0;
	double cgqye=0;
	double jzqye=0;
	int khbhx=0;
	double Xzqys=0;
	double maxhtje=0;
	double maxkhsl=0;
	String bgcolor="#FFFFFF";
	double maxqye=0;
	 double htze=0;
	 double hje=0;//������
	 double allhje=0;//�ܻ�����
	 double alljjjzze=0;//�ҾӺͼ�װ�ܶ�
     int row=0;
	int allkhbhx=0;
	//��װ�ܿͻ���ǩԼ��
	ls_sql="SELECT count(*),TRUNC(sum(qye+NVL(zjxje,0)))";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where crm_khxx.zt='2'";
	ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	//out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		Xzqys=rs.getInt(1);
		maxqye=rs.getDouble(2);//��װ�ܶ�
	}
	rs.close();
	ps.close();

	//��û�пͻ�ʱ�����ء�
	if(Xzqys==0)
	{
		out.print("��ʱ��û��Ҫͳ�Ƶ����ݣ�");
		return;
	}
	//�Ҿӿͻ���
	ls_sql=" select sum(khbhx) khbh,sum(htze) htze from";
	ls_sql+="(";
	ls_sql+=" SELECT sum(jc_mmydd.zjhze) htze,count(distinct(crm_khxx.khbh)) khbhx";
	ls_sql+=" FROM crm_khxx,sq_dwxx,jc_mmydd";
	ls_sql+=" where jc_mmydd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
	ls_sql+=" and htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.zt='2'";//�Ƿ�ȫ������Ϊ��װ�ͻ�����
	ls_sql+=wheresql;
	
	ls_sql+=" union all ";

	ls_sql+=" SELECT sum(jc_cgdd.zjhze) htze,count(distinct(crm_khxx.khbh)) khbhx";
	ls_sql+=" FROM crm_khxx,sq_dwxx,jc_cgdd";
	ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
	ls_sql+=" and qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.zt='2'";//�Ƿ�ȫ������Ϊ��װ�ͻ�����
	ls_sql+=wheresql;

	ls_sql+=" union all";

	ls_sql+=" SELECT sum(jc_jjdd.zjhze) htze,count(distinct(crm_khxx.khbh)) khbhx";
	ls_sql+=" FROM crm_khxx,sq_dwxx,jc_jjdd";
	ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
	ls_sql+=" and qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.zt='2'";//�Ƿ�ȫ������Ϊ��װ�ͻ�����
	ls_sql+=wheresql;

	ls_sql+="union all ";

	ls_sql+=" SELECT sum(jc_zcdd.hkze+jc_zcdd.zjhze) htze,count(distinct(crm_khxx.khbh)) khbhx";
	ls_sql+=" FROM crm_khxx,sq_dwxx,jc_zcdd";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
	ls_sql+=" and qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.zt='2'";//�Ƿ�ȫ������Ϊ��װ�ͻ�����
	ls_sql+=wheresql;
	ls_sql+=") ";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		maxkhsl=rs.getInt(1);//�Ҿӿͻ�
		maxhtje=rs.getDouble(2);//�Ҿ��ܶ�
	}
	rs.close();
	ps.close();

	alljjjzze=maxhtje+maxqye;//�ҾӺͼ�װ�ܶ�
%>

<CENTER >
<br>
<b>���������Ԥ��������<br>(ǩԼʱ�䣺<%=sjfw%>--<%=sjfw2%>)</B> </b></CENTER >
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="8%">����</td>
  <td  width="8%">����</td>
  <td  width="6%">��ͬ���</td>
  <td  width="7%">ռ�Ҿ��ܽ�����</td>
<td  width="6%">��������</td>
 <td  width="7%">ռ��װ�ͻ�������</td>
 <td  width="7%">ռ�Ҿӿͻ�������</td>
 <td  width="6%">������</td>
 <td  width="6%">������ռ�Ҿӻ��������</td>
 <td  width="6%">������ռ�ҾӺͼ�װ�ܻ��������</td>
  <td  width="7%">ռ����</td>
 
</tr>
<%
	if (maxkhsl==0 || maxhtje==0)
	{
		out.print("��ʱ��û��Ҫͳ�Ƶ����ݣ�");
		return;
	}
	 
	
	//out.println(ls_sql);

	ls_sql="SELECT dwmc,sum(jc_cgdd.zjhze) htze,count(distinct(crm_khxx.khbh)) khbhx";
	ls_sql+=" FROM crm_khxx,sq_dwxx,jc_cgdd";
	ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
	ls_sql+=" and qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.zt='2'";//�Ƿ�ȫ������Ϊ��װ�ͻ�����
	ls_sql+=wheresql;
	ls_sql+=" group by dwmc";
	ls_sql+=" order by sum(jc_cgdd.htze) desc";
	//out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	//out.print(ls_sql);
	while(rs.next())
	{
		hje=0;
		khbhx=0;
		dwmc=rs.getString("dwmc");
		htze=rs.getDouble("htze");
		khbhx=rs.getInt(3);
		row++;
		allqds+=htze;
		allkhbhx+=khbhx;
		hje=htze/khbhx;
		allhje+=hje;
		
		
	%>
<tr   align="center">
   <td  width="8%" ><%=row%></td>
   <td  width="8%" ><%=dwmc%></td>
   <td  width="6%" ><%=htze%></td>
   <td  width="6%" ><%=cf.formatDouble(htze*100/maxhtje)%>%</td>
   <td  width="6%" ><%=khbhx%></td>
   <td  width="6%" ><%=cf.formatDouble(khbhx*100/Xzqys)%>%</td>
   <td  width="6%" ><%=cf.formatDouble(khbhx*100/maxkhsl)%>%</td>
   <td  width="6%" ><%=cf.formatDouble(hje)%></td>
   <td  width="6%" ><%=cf.formatDouble((hje*100)/(maxhtje/maxkhsl))%>%</td><!-- ������ռ�Ҿӻ�������� -->
   <td  width="6%" ><%=cf.formatDouble((hje*100)/(alljjjzze/maxkhsl))%>%</td><!-- ������ռ�ҾӺͼ�װ�ܻ�������� -->
  <td  width="7%" align="left"><%=cf.formatDouble(htze*100/alljjjzze)%>%</td>
</tr>
<%
	}
	rs.close();
	ps.close();
%>
 <tr   align="center">
	<td  width="8%">�ܼ�</td>
	<td  width="7%">&nbsp;</td>
	<td  width="6%"><%=allqds%></td>
	<td  width="7%"><%=cf.formatDouble(allqds*100/maxhtje)%>%</td>
	<td  width="6%"><%=allkhbhx%></td>
    <td  width="6%" ><%=cf.formatDouble(allkhbhx*100/Xzqys)%>%</td>
    <td  width="6%" ><%=cf.formatDouble(allkhbhx*100/maxkhsl)%>%</td>
    <td  width="7%"><%=cf.formatDouble(allhje)%></td>
	<td  width="7%"><%=cf.formatDouble((allqds/allkhbhx)*100/(maxhtje/maxkhsl))%>%</td>
 	<td  width="7%"><%=cf.formatDouble((allqds/allkhbhx)*100/(alljjjzze/maxkhsl))%>%</td>
 	<td  width="7%"><%=cf.formatDouble(allqds*100/(alljjjzze))%>%</td>
</tr> 
</table> 

<CENTER >
<br>
<b>������ľ��Ԥ��������<br>(ǩԼʱ�䣺<%=sjfw%>--<%=sjfw2%>)</B> </b></CENTER >
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="8%">����</td>
  <td  width="8%">����</td>
  <td  width="6%">��ͬ���</td>
  <td  width="7%">ռ�Ҿ��ܽ�����</td>
  <td  width="6%">��������</td>
  <td  width="7%">ռ��װ�ͻ�������</td>
  <td  width="7%">ռ�Ҿӿͻ�������</td>
  <td  width="6%">������</td>
  <td  width="6%">������ռ�Ҿӻ��������</td>
  <td  width="6%">������ռ�ҾӺͼ�װ�ܻ��������</td>
  <td  width="7%">ռ����</td>
 
</tr>
<%
	
	double htze1=0;
	double allqds1=0;
    int row1=0;
	String dwmc1="";
	allkhbhx=0;
	allhje=0;
	ls_sql="SELECT dwmc,sum(jc_mmydd.zjhze) htze,count(distinct(crm_khxx.khbh)) khbhx";
	ls_sql+=" FROM crm_khxx,sq_dwxx,jc_mmydd";
	ls_sql+=" where jc_mmydd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
	ls_sql+=" and htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.zt='2'";//�Ƿ�ȫ������Ϊ��װ�ͻ�����
	ls_sql+=wheresql;
	ls_sql+=" group by dwmc";
	ls_sql+=" order by sum(jc_mmydd.htje) desc";
	//out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	//out.print(ls_sql);
	while(rs.next())
	{
		khbhx=0;
		hje=0;
		dwmc1=rs.getString("dwmc");
		htze1=rs.getDouble("htze");
		khbhx=rs.getInt(3);
		row1++;
		allqds1+=htze1;
		allkhbhx+=khbhx;
		hje=htze/khbhx;
		allhje+=hje;
		
		
	%>
<tr   align="center">
<td  width="8%" ><%=row1%></td>
  <td  width="8%" ><%=dwmc1%></td>
  <td  width="6%" ><%=htze1%></td>
  <td  width="6%" ><%=cf.formatDouble(htze1*100/maxhtje)%>%</td>
  <td  width="6%" ><%=khbhx%></td>
    <td  width="6%" ><%=cf.formatDouble(khbhx*100/Xzqys)%>%</td>
   <td  width="6%" ><%=cf.formatDouble(khbhx*100/maxkhsl)%>%</td>
   <td  width="6%" ><%=cf.formatDouble(hje)%></td>
   <td  width="6%" ><%=cf.formatDouble((hje*100)/(maxhtje/maxkhsl))%>%</td><!-- ������ռ�Ҿӻ�������� -->
   <td  width="6%" ><%=cf.formatDouble((hje*100)/(alljjjzze/maxkhsl))%>%</td><!-- ������ռ�ҾӺͼ�װ�ܻ�������� -->
  <td  width="7%" align="left"><%=cf.formatDouble(htze1*100/alljjjzze)%>%</td>
</tr>
<%
	}
	rs.close();
	ps.close();
%>
  <tr   align="center">
	<td  width="8%">�ܼ�</td>
	<td  width="7%">&nbsp;</td>
	<td  width="6%"><%=allqds1%></td>
	<td  width="7%"><%=cf.formatDouble(allqds1*100/maxhtje)%>%</td>
	<td  width="6%"><%=allkhbhx%></td>
    <td  width="6%" ><%=cf.formatDouble(allkhbhx*100/Xzqys)%>%</td>
    <td  width="6%" ><%=cf.formatDouble(allkhbhx*100/maxkhsl)%>%</td>
    <td  width="7%"><%=cf.formatDouble(allhje)%></td>
	<td  width="7%"><%=cf.formatDouble((allqds1/allkhbhx)*100/(maxhtje/maxkhsl))%>%</td>
 	<td  width="7%"><%=cf.formatDouble((allqds1/allkhbhx)*100/(alljjjzze/maxkhsl))%>%</td>
 	<td  width="7%"><%=cf.formatDouble(allqds1*100/(alljjjzze))%>%</td>
</tr> 
</table> 


<CENTER >
<br>
<b>������Ҿ�Ԥ��������<br>(ǩԼʱ�䣺<%=sjfw%>--<%=sjfw2%>)</B> </b></CENTER >
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="8%">����</td>
  <td  width="8%">����</td>
  <td  width="6%">��ͬ���</td>
  <td  width="7%">ռ�Ҿ��ܽ�����</td>
  <td  width="6%">��������</td>
  <td  width="7%">ռ��װ�ͻ�������</td>
  <td  width="7%">ռ�Ҿӿͻ�������</td>
  <td  width="6%">������</td>
  <td  width="6%">������ռ�Ҿӻ��������</td>
  <td  width="6%">������ռ�ҾӺͼ�װ�ܻ��������</td>
  <td  width="7%">ռ����</td>
 
</tr>
<%
	
	 double htze2=0;
     int row2=0;
	 String dwmc2="";
	 double allqds2=0;
	 allkhbhx=0;
	 allhje=0;
	ls_sql="SELECT dwmc,sum(jc_jjdd.zjhze) htze,count(distinct(crm_khxx.khbh)) khbhx";
	ls_sql+=" FROM crm_khxx,sq_dwxx,jc_jjdd";
	ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
	ls_sql+=" and qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.zt='2'";//�Ƿ�ȫ������Ϊ��װ�ͻ�����
	ls_sql+=wheresql;
	ls_sql+=" group by dwmc";
	ls_sql+=" order by sum(jc_jjdd.htze) desc";
	//out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	//out.print(ls_sql);
	while(rs.next())
	{
		khbhx=0;
		hje=0;
		dwmc2=rs.getString("dwmc");
		htze2=rs.getDouble("htze");
		khbhx=rs.getInt(3);
		row2++;
		allqds2+=htze2;
		allkhbhx+=khbhx;
		hje=htze/khbhx;
		allhje+=hje;
		
		
		
	%>
<tr   align="center">
<td  width="8%" ><%=row1%></td>
  <td  width="8%" ><%=dwmc2%></td>
  <td  width="6%" ><%=htze2%></td>
  <td  width="6%" ><%=cf.formatDouble(htze2*100/maxhtje)%>%</td>
  <td  width="6%" ><%=khbhx%></td>
    <td  width="6%" ><%=cf.formatDouble(khbhx*100/Xzqys)%>%</td>
   <td  width="6%" ><%=cf.formatDouble(khbhx*100/maxkhsl)%>%</td>
   <td  width="6%" ><%=cf.formatDouble(hje)%></td>
   <td  width="6%" ><%=cf.formatDouble((hje*100)/(maxhtje/maxkhsl))%>%</td><!-- ������ռ�Ҿӻ�������� -->
   <td  width="6%" ><%=cf.formatDouble((hje*100)/(alljjjzze/maxkhsl))%>%</td><!-- ������ռ�ҾӺͼ�װ�ܻ�������� -->
  <td  width="7%" align="left"><%=cf.formatDouble(htze2*100/alljjjzze)%>%</td>
</tr>
<%
	}
	rs.close();
	ps.close();
%>
 <tr   align="center">
	<td  width="8%">�ܼ�</td>
	<td  width="7%">&nbsp;</td>
	<td  width="6%"><%=allqds2%></td>
	<td  width="7%"><%=cf.formatDouble(allqds2*100/maxhtje)%>%</td>
	<td  width="6%"><%=allkhbhx%></td>
    <td  width="6%" ><%=cf.formatDouble(allkhbhx*100/Xzqys)%>%</td>
    <td  width="6%" ><%=cf.formatDouble(allkhbhx*100/maxkhsl)%>%</td>
    <td  width="7%"><%=cf.formatDouble(allhje)%></td>
	<td  width="7%"><%=cf.formatDouble((allqds2/allkhbhx)*100/(maxhtje/maxkhsl))%>%</td>
 	<td  width="7%"><%=cf.formatDouble((allqds2/allkhbhx)*100/(alljjjzze/maxkhsl))%>%</td>
 	<td  width="7%"><%=cf.formatDouble(allqds2*100/(alljjjzze))%>%</td>
</tr>  
</table> 

<CENTER >
<br>
<b>����������Ԥ��������<br>(ǩԼʱ�䣺<%=sjfw%>--<%=sjfw2%>)</B> </b></CENTER >
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="8%">����</td>
  <td  width="8%">����</td>
  <td  width="6%">��ͬ���</td>
  <td  width="7%">ռ�Ҿ��ܽ�����</td>
  <td  width="6%">��������</td>
  <td  width="7%">ռ��װ�ͻ�������</td>
  <td  width="7%">ռ�Ҿӿͻ�������</td>
  <td  width="6%">������</td>
  <td  width="6%">������ռ�Ҿӻ��������</td>
  <td  width="6%">������ռ�ҾӺͼ�װ�ܻ��������</td>
  <td  width="7%">ռ����</td>
 
</tr>
<%
	
	 double htze3=0;
     int row3=0;
	 String dwmc3="";
	 double allqds3=0;
	 allkhbhx=0;
	 allhje=0;
	ls_sql="SELECT dwmc,sum(jc_zcdd.hkze+NVL(jc_zcdd.zjhze,0)) htze,count(distinct(crm_khxx.khbh)) khbhx";
	ls_sql+=" FROM crm_khxx,sq_dwxx,jc_zcdd";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
	ls_sql+=" and qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.zt='2'";//�Ƿ�ȫ������Ϊ��װ�ͻ�����
	ls_sql+=wheresql;
	ls_sql+=" group by dwmc";
	ls_sql+=" order by htze desc";
	//out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	//out.print(ls_sql);
	while(rs.next())
	{
		khbhx=0;
		hje=0;
		dwmc3=rs.getString("dwmc");
		htze3=rs.getDouble("htze");
		khbhx=rs.getInt(3);//�ͻ���
		row3++;
		allqds3+=htze3;
		allkhbhx+=khbhx;
		hje=htze3/khbhx;//������
		allhje+=hje;//�������ܺ�
		
		
	%>
<tr   align="center">
<td  width="8%" ><%=row3%></td>
  <td  width="8%" ><%=dwmc3%></td>
  <td  width="6%" ><%=htze3%></td>
  <td  width="6%" ><%=cf.formatDouble(htze3*100/maxhtje)%>%</td>
  <td  width="6%" ><%=khbhx%></td>
   <td  width="6%" ><%=cf.formatDouble(khbhx*100/Xzqys)%>%</td>
   <td  width="6%" ><%=cf.formatDouble(khbhx*100/maxkhsl)%>%</td>
   <td  width="6%" ><%=cf.formatDouble(hje)%></td>
   <td  width="6%" ><%=cf.formatDouble((hje*100)/(maxhtje/maxkhsl))%>%</td><!-- ������ռ�Ҿӻ�������� -->
   <td  width="6%" ><%=cf.formatDouble((hje*100)/(alljjjzze/maxkhsl))%>%</td><!-- ������ռ�ҾӺͼ�װ�ܻ�������� -->
  <td  width="7%" align="left"><%=cf.formatDouble(htze3*100/alljjjzze)%>%</td>
</tr>
<%
	}
	rs.close();
	ps.close();
%>
 <tr   align="center">
	<td  width="8%">�ܼ�</td>
	<td  width="7%">&nbsp;</td>
	<td  width="6%"><%=allqds3%></td>
	<td  width="7%"><%=cf.formatDouble(allqds3*100/maxhtje)%>%</td>
	<td  width="6%"><%=allkhbhx%></td>
    <td  width="6%" ><%=cf.formatDouble(allkhbhx*100/Xzqys)%>%</td>
    <td  width="6%" ><%=cf.formatDouble(allkhbhx*100/maxkhsl)%>%</td>
    <td  width="7%"><%=cf.formatDouble(allhje)%></td>
	<td  width="7%"><%=cf.formatDouble((allqds3/allkhbhx)*100/(maxhtje/maxkhsl))%>%</td>
 	<td  width="7%"><%=cf.formatDouble((allqds3/allkhbhx)*100/(alljjjzze/maxkhsl))%>%</td>
 	<td  width="7%"><%=cf.formatDouble(allqds3*100/(alljjjzze))%>%</td>
</tr>  
</table> 
<br>
ע��δ��ʾ�������Ӧ����Ϊ�㣻   ռΪ��=����ͬ���/(��װ�ܶ�+�Ҿ��ܶ��
</body>
</html>

<%
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
