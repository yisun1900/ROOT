<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

	String[] sjs=request.getParameterValues("sjs");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");
	String lrjzbz=request.getParameter("jzbz");


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���ʦǩ����ϸ
  <BR>(ǩԼʱ�䣺<%=sjfw%>--<%=sjfw2%>)
  <BR>���н��Ϊ�������ܶ�������̽����ɽ�
  <BR>
  <font color="#CC0000">ע�⣺�������������ܶ�Ǳ���ǩԼ���ҾӵĶ�������������ǩ�ļ�װ��ͬ</font></font></b> 
</CENTER>
<table border="1" width="240%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td rowspan="2" width="1%">���</td>
    <td rowspan="2" width="2%">���ʦ</td>
    <td rowspan="2" width="3%">��ͬ��</td>
    <td rowspan="2" width="3%">����</td>
    <td rowspan="2" width="8%">���ݵ�ַ</td>
    <td rowspan="2" width="7%" >�����</td>
    <td rowspan="2" width="5%" >�����������ܶ� </td>
    <td rowspan="2" width="4%" >ǩԼ����</td>
    <td rowspan="2" width="3%" >ǩԼ����</td>
    <td rowspan="2" width="3%" >�״θ���װ��ʱ��</td>
    <td rowspan="2" width="3%" >�����״��ռ�װ��ʱ��</td>
    <td colspan="9" ><font color="#0000CC"><b>����Ʒ</b></font></td>
    <td colspan="5" ><font color="#CC0000"><b>����</b></font></td>
    <td rowspan="2" width="5%" ><b>�ܼ�</b></td>
  </tr>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="3%"><font color="#0000CC"><b>���񶩵�</b></font></td>
    <td  width="3%"><font color="#0000CC"><b>�������</b></font></td>
    <td  width="3%"><font color="#0000CC"><b>���񸴲�</b></font></td>
    <td  width="4%"><font color="#0000CC"><b>����ǩԼ��</b></font></td>
    <td  width="3%"><font color="#009900"><b>ľ�Ŷ�����</b></font></td>
    <td  width="4%"><font color="#009900"><b>ľ��ǩԼ��</b></font></td>
    <td  width="3%"><font color="#0000CC"><b>�Ҿ߶�����</b></font></td>
    <td  width="4%"><font color="#0000CC"><b>�Ҿ�ǩԼ��</b></font></td>
    <td  width="5%"><font color="#0000CC"><b><font color="#009900">����ƷС��</font></b></font></td>
    <td  width="4%"><font color="#CC0000"><b>�ذ�</b></font></td>
    <td  width="4%"><font color="#CC0000"><b>���</b></font></td>
    <td  width="4%"><font color="#CC0000"><b>��ש</b></font></td>
    <td  width="4%"><font color="#CC0000"><b>����</b></font></td>
    <td  width="5%"><font color="#CC0000"><b><font color="#009900">����С��</font></b></font></td>
  </tr>
  <%
String lssjs=null;
String lsdwbh=null;

String khbh=null;
String khxm=null;
String fwdz=null;
String hth=null;

double zjhze=0;

double xjzjhze=0;

double zjzjhze=0;


double zjcghtze=0;
double zjmmhtje=0;
double zjjjhtze=0;
double zjdzp=0;

double zjdbze=0;
double zjjjze=0;
double zjczze=0;
double zjqtze=0;
double zjzc=0;

double zjqb=0;

String qydm=null;
String qyrq=null;
String cxhdbm=null;
String jzkscsj=null;
String cwjzkscsj=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int row=0;
	for (int i=0;i<sjs.length ;i++ )
	{
		xjzjhze=0;
		double xjcghtze=0;
		double xjmmhtje=0;
		double xjjjhtze=0;
		double xjdzp=0;

		double xjdbze=0;
		double xjjjze=0;
		double xjczze=0;
		double xjqtze=0;
		double xjzc=0;

		double xjqb=0;

		sjs[i]=cf.GB2Uni(sjs[i]);
		int pos=sjs[i].indexOf("+");
		lssjs=sjs[i].substring(0,pos);
		lsdwbh=sjs[i].substring(pos+1);

		
		
		ls_sql=" SELECT distinct khbh,qyrq";
		ls_sql+=" from ";
		ls_sql+=" ( ";
		
		ls_sql+=" SELECT crm_khxx.khbh,crm_khxx.qyrq";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.sjs='"+lssjs+"' and crm_khxx.dwbh='"+lsdwbh+"'";
		ls_sql+=" and crm_khxx.zt in('2','5')";
		ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		if (!lrjzbz.equals("0"))
		{
			ls_sql+=" and  crm_khxx.jzbz='"+lrjzbz+"'";
		}
		if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}

	
		ls_sql+=" UNION ALL";
		
		ls_sql+=" SELECT crm_khxx.khbh,crm_khxx.qyrq";
		ls_sql+=" FROM crm_khxx,jc_mmydd";
		ls_sql+=" where jc_mmydd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.sjs='"+lssjs+"' and crm_khxx.dwbh='"+lsdwbh+"'";
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}
		ls_sql+=" and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_mmydd.htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	
		ls_sql+=" UNION ALL";
		
		ls_sql+=" SELECT crm_khxx.khbh,crm_khxx.qyrq";
		ls_sql+=" FROM crm_khxx,jc_cgdd";
		ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.sjs='"+lssjs+"' and crm_khxx.dwbh='"+lsdwbh+"'";
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}
		ls_sql+=" and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	
		ls_sql+=" UNION ALL";
		
		ls_sql+=" SELECT crm_khxx.khbh,crm_khxx.qyrq";
		ls_sql+=" FROM crm_khxx,jc_jjdd";
		ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.sjs='"+lssjs+"' and crm_khxx.dwbh='"+lsdwbh+"'";
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}
		ls_sql+=" and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	
		ls_sql+=" UNION ALL";
		
		ls_sql+=" SELECT crm_khxx.khbh,crm_khxx.qyrq";
		ls_sql+=" FROM crm_khxx,jc_zcdd";
		ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.sjs='"+lssjs+"' and crm_khxx.dwbh='"+lsdwbh+"'";
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}
		ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

		ls_sql+=" ) ";

		ls_sql+=" order by qyrq";

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			row++;

			khbh=cf.fillNull(rs.getString("khbh"));
			qyrq=cf.fillHtml(rs.getDate("qyrq"));


			zjhze=0;

			ls_sql="SELECT hth,khxm,fwdz,crm_khxx.cxhdbm,NVL(zjxje,0)+qye zjhze,a.dwmc qydm,qyrq,jzkscsj,cwjzkscsj";
			ls_sql+=" FROM crm_khxx,sq_dwxx a";
			ls_sql+=" where crm_khxx.dwbh=a.dwbh(+)";
			ls_sql+=" and crm_khxx.khbh='"+khbh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				khxm=cf.fillNull(rs1.getString("khxm"));
				fwdz=cf.fillNull(rs1.getString("fwdz"));
				hth=cf.fillHtml(rs1.getString("hth"));
				cxhdbm=cf.fillHtml(rs1.getString("cxhdbm"));
				zjhze=rs1.getDouble("zjhze");
				qydm=cf.fillNull(rs1.getString("qydm"));
				qyrq=cf.fillHtml(rs1.getDate("qyrq"));
				jzkscsj=cf.fillHtml(rs1.getDate("jzkscsj"));
				cwjzkscsj=cf.fillHtml(rs1.getDate("cwjzkscsj"));
			}
			rs1.close();
			ps1.close();

			xjzjhze+=zjhze;
			zjzjhze+=zjhze;

			//����
			String sccsj="&nbsp;";
			String sfcsj="&nbsp;";
			String qhtsj="&nbsp;";
			double cghtze=0;
			ls_sql="SELECT sccsj,sfcsj,qhtsj,jc_cgdd.zjhze htze";
			ls_sql+=" FROM jc_cgdd";
			ls_sql+=" where khbh='"+khbh+"'";
			ls_sql+=" and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				sccsj=cf.fillHtml(rs1.getDate("sccsj"));
				sfcsj=cf.fillHtml(rs1.getDate("sfcsj"));
				qhtsj=cf.fillHtml(rs1.getDate("qhtsj"));
				cghtze=rs1.getDouble("htze");
			}
			rs1.close();
			ps1.close();

			xjcghtze+=cghtze;
			zjcghtze+=cghtze;

			//ľ��
			String htrq="&nbsp;";
			double mmhtje=0;
			ls_sql="SELECT htrq,jc_mmydd.zjhze htze";
			ls_sql+=" FROM jc_mmydd";
			ls_sql+=" where khbh='"+khbh+"'";
			ls_sql+=" and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_mmydd.htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				htrq=cf.fillHtml(rs1.getDate("htrq"));
				mmhtje=rs1.getDouble("htze");
			}
			rs1.close();
			ps1.close();

			xjmmhtje+=mmhtje;
			zjmmhtje+=mmhtje;

			//�Ҿ�
			qhtsj="&nbsp;";
			double jjhtze=0;
			ls_sql="SELECT qhtsj,jc_jjdd.zjhze htze";
			ls_sql+=" FROM jc_jjdd";
			ls_sql+=" where khbh='"+khbh+"'";
			ls_sql+=" and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				qhtsj=cf.fillHtml(rs1.getDate("qhtsj"));
				jjhtze=rs1.getDouble("htze");
			}
			rs1.close();
			ps1.close();

			xjjjhtze+=jjhtze;
			zjjjhtze+=jjhtze;

			//����
			double dbze=0;
			ls_sql="SELECT sum(jc_zcdd.hkze+jc_zcdd.zjhze) htze";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where khbh='"+khbh+"' and zcxlbm='�ذ�'";//1003:�ذ�
			ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				dbze=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			xjdbze+=dbze;
			zjdbze+=dbze;

			double jjze=0;
			ls_sql="SELECT sum(jc_zcdd.hkze+jc_zcdd.zjhze) htze";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where khbh='"+khbh+"' and zcxlbm='���'";//0901:���
			ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				jjze=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			xjjjze+=jjze;
			zjjjze+=jjze;

			double czze=0;
			ls_sql="SELECT sum(jc_zcdd.hkze+jc_zcdd.zjhze) htze";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where khbh='"+khbh+"' and zcxlbm='��ש'";//1001:��ש
			ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				czze=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			xjczze+=czze;
			zjczze+=czze;

			double qtze=0;
			ls_sql="SELECT sum(jc_zcdd.hkze+jc_zcdd.zjhze) htze";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where khbh='"+khbh+"' and zcxlbm not in('�ذ�','���','��ש')";//����
			ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				qtze=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			xjqtze+=qtze;
			zjqtze+=qtze;

			double dzp=cghtze+mmhtje+jjhtze;
			double zc=dbze+jjze+czze+qtze;
			double qb=zjhze+dzp+zc;

			xjdzp+=dzp;
			xjzc+=zc;
			xjqb+=qb;

			zjdzp+=dzp;
			zjzc+=zc;
			zjqb+=qb;



			%> 
  <tr bgcolor="#FFFFFF"  align="center"> 
    <td ><%=row%></td>
    <td ><%=lssjs%></td>
    <td ><%=hth%></td>
    <td align="center"><%=khxm%></td>
    <td ><A target='_blank' HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>"><%=fwdz%></A></td>
    <td ><%=cxhdbm%></td>
    <td align="right"><%=cf.formatDouble(zjhze)%></td>
    <td ><%=qydm%></td>
    <td ><%=qyrq%></td>
    <td ><%=jzkscsj%></td>
    <td ><%=cwjzkscsj%></td>
    <td ><font color="#0000CC"><%=qhtsj%></font></td>
    <td ><font color="#0000CC"><%=sccsj%></font></td>
    <td ><font color="#0000CC"><%=sfcsj%></font></td>
    <td align="right"><font color="#0000CC"><%=cf.formatDouble(cghtze)%></font></td>
    <td ><font color="#009900"><%=htrq%></font></td>
    <td align="right"><font color="#009900"><%=cf.formatDouble(mmhtje)%></font></td>
    <td ><font color="#0000CC"><%=qhtsj%></font></td>
    <td align="right"><font color="#0000CC"><%=cf.formatDouble(jjhtze)%></font></td>
    <td align="right"><font color="#009900"><%=cf.formatDouble(dzp)%></font></td>
    <td align="right"><font color="#CC0000"><%=cf.formatDouble(dbze)%></font></td>
    <td align="right"><font color="#CC0000"><%=cf.formatDouble(jjze)%></font></td>
    <td align="right"><font color="#CC0000"><%=cf.formatDouble(czze)%></font></td>
    <td align="right"><font color="#CC0000"><%=cf.formatDouble(qtze)%></font></td>
    <td align="right"><font color="#009900"><%=cf.formatDouble(zc)%></font></td>
    <td align="right"><%=cf.formatDouble(qb)%></td>
    <%
		}
		rs.close();
		ps.close();

		if (zjzjhze>0)
		{
			%> 
  <tr bgcolor="#E8E8FF"  align="center" height="25"> 
    <td align="center" colspan="3"><B>[<%=lssjs%>]С ��</B></td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td align="right"><%=cf.formatDouble(xjzjhze)%></td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td align="right"><font color="#0000CC"><b><%=cf.formatDouble(xjcghtze)%></b></font></td>
    <td >&nbsp;</td>
    <td align="right"><font color="#009900"><b><%=cf.formatDouble(xjmmhtje)%></b></font></td>
    <td >&nbsp;</td>
    <td align="right"><font color="#0000CC"><b><%=cf.formatDouble(xjjjhtze)%></b></font></td>
    <td align="right"><font color="#009900"><b><%=cf.formatDouble(xjdzp)%></b></font></td>
    <td align="right"><font color="#CC0000"><b><%=cf.formatDouble(xjdbze)%></b></font></td>
    <td align="right"><font color="#CC0000"><b><%=cf.formatDouble(xjjjze)%></b></font></td>
    <td align="right"><font color="#CC0000"><b><%=cf.formatDouble(xjczze)%></b></font></td>
    <td align="right"><font color="#CC0000"><b><%=cf.formatDouble(xjqtze)%></b></font></td>
    <td align="right"><font color="#009900"><b><%=cf.formatDouble(xjzc)%></b></font></td>
    <td align="right"><%=cf.formatDouble(xjqb)%></td>
    <%
		}

	}
%> 
  <tr bgcolor="#CCCCCC"  align="center" height="25"> 
    <td align="center" colspan="3"><B>�� ��</B></td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td align="right"><%=cf.formatDouble(zjzjhze)%></td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td align="right"><font color="#0000CC"><b><%=cf.formatDouble(zjcghtze)%></b></font></td>
    <td >&nbsp;</td>
    <td align="right"><font color="#009900"><b><%=cf.formatDouble(zjmmhtje)%></b></font></td>
    <td >&nbsp;</td>
    <td align="right"><font color="#0000CC"><b><%=cf.formatDouble(zjjjhtze)%></b></font></td>
    <td align="right"><font color="#009900"><b><%=cf.formatDouble(zjdzp)%></b></font></td>
    <td align="right"><font color="#CC0000"><b><%=cf.formatDouble(zjdbze)%></b></font></td>
    <td align="right"><font color="#CC0000"><b><%=cf.formatDouble(zjjjze)%></b></font></td>
    <td align="right"><font color="#CC0000"><b><%=cf.formatDouble(zjczze)%></b></font></td>
    <td align="right"><font color="#CC0000"><b><%=cf.formatDouble(zjqtze)%></b></font></td>
    <td align="right"><font color="#009900"><b><%=cf.formatDouble(zjzc)%></b></font></td>
    <td align="right"><%=cf.formatDouble(zjqb)%></td>
</table>
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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
