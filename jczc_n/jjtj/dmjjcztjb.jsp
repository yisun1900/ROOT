<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='290401'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[����ҵ��ͳ��(��)]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'����[����ҵ��ͳ��(��)]��"+xtrzyhmc+"') ";
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

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");

String wheresql="";
String wheresql1="";
String wheresql2="";

if (!(fgs.equals("")))
{
	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	wheresql1+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
	wheresql2+=" and  (fgsbh='"+fgs+"')";
}

if (!(dwbh.equals("")))
{
	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	wheresql1+=" and  sq_dwxx.dwbh='"+dwbh+"'";
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
<style type="text/css">
<!--
.STYLE1 {
	FONT-WEIGHT: bold;
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: black 1px solid;
	BORDER-BOTTOM: black 1px solid;
	POSITION: relative;
	BACKGROUND-COLOR: #CC6600;
}
.STYLE2 {
	BORDER-LEFT: #000000 1px solid;
	BORDER-BOTTOM: #000000 1px solid;
	POSITION: relative;
	BACKGROUND-COLOR: #CC6600;
}
.STYLE3 {
	FONT-WEIGHT: bold;
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: black 1px solid;
	BORDER-BOTTOM: black 1px solid;
	LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft);
	POSITION: relative;
	BACKGROUND-COLOR: #efe1ff;
}
.STYLE4 {
	BORDER-RIGHT: #000 1px solid;
	BORDER-BOTTOM: #000 1px solid;
}
.STYLE_TR {
	FONT-WEIGHT: bold;
	Z-INDEX: 5; 
	POSITION: relative;
	TOP: expression(this.offsetParent.scrollTop)
}
.STYLE_TAB {
	DISPLAY: inline;
	BORDER-COLLAPSE: collapse;
}
.STYLE_DIV {
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: #808080 2px solid;
	DISPLAY: inline;
	OVERFLOW: auto;
	BORDER-LEFT: #808080 2px solid;
	WIDTH: 100%;
	CURSOR: default;
	BORDER-BOTTOM: #808080 2px solid;
	HEIGHT:95%;
}
-->
</style>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>����ҵ��ͳ��</B>��ҵ�����㷽�����ۺ��ܶ�-�˵��ܶ�+�ۺ��������ܶ<BR>
  <b>(ͳ��ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</b>
</CENTER>
<DIV onselectstart="return false" class="STYLE_DIV">
<table border="1" width="980" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px' class="STYLE_TAB">
  <tr bgcolor="#CCCCCC"  align="center"class="STYLE_TR"> 
    <td  width="40" class="STYLE1">���</td>
    <td  width="120" class="STYLE1">�ֹ�˾</td>
    <td  width="170" class="STYLE1">����</td>
    <td  width="100" class="STYLE2">��װǩԼ��</td>
    <td  width="100" class="STYLE2">��װǩԼ��</td>
    <td  width="100" class="STYLE2">����ǩԼ��</td>
    <td  width="100" class="STYLE2">����ǩԼ��</td>
    <td  width="100" class="STYLE2">����ƽ������</td>
    <td  width="100" class="STYLE2">����Ԥ����</td>
    <td  width="100" class="STYLE2">����ʵ�տ�</td>
    <td  width="70" class="STYLE2">���ı���</td>
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
	int jjqys=0;
	double jjqye=0;
	int zcqys=0;
	double zcqye=0;
	double jcqye=0;
	int xjjzqys=0;
	double xjjzqye=0;	
	double xjjjqye=0;
	int xjzcqys=0;
	int allxjzcqys=0;
	double xjzcqye=0;
	double allxjzcqye=0;
	int zjjzqys=0;
	double zjjzqye=0;	
	int zjjjqys=0;
	double zjjjqye=0;
	int zjzcqys=0;
	double zjzcqye=0;

	double zjjcqye=0;
	double zcsxe=0;//����ʵ����
	double xjzcsxe=0;//�ֹ�˾����ʵ���ܶ�
	double allzcsxe=0;//����ʵ���ܶ�

	double zcyfk=0;//����Ԥ����
	double xjzcyfk=0;//�ֹ�˾����Ԥ����
	double allzcyfk=0;//����Ԥ����
	
	//�����ܽ�����
	//ǩ��
	double allzcqde=0;
	int allzcqds=0;
	ls_sql="SELECT sum(jc_zcdd.hkze) htze,count(distinct jc_zcdd.khbh) zcqys";
	ls_sql+=" FROM jc_zcdd";
	ls_sql+=" where (1=1) ";
	ls_sql+=wheresql2;
	ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='98'";//09����ͬ�����
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if(rs1.next())
	{
		allzcqde=rs1.getDouble(1);//���Ľ��
		allzcqds=rs1.getInt(2);//��������
	}
	rs1.close();
	ps1.close();

	//�˵�
	double allzctde=0;
	int allzctds=0;
	ls_sql="SELECT sum(jc_zcdd.hkze+zjhze) htze,count(distinct jc_zcdd.khbh) zcqys";
	ls_sql+=" FROM jc_zcdd";
	ls_sql+=" where (1=1) ";
	ls_sql+=wheresql2;
	ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_zcdd.clzt='99'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if(rs1.next())
	{
		allzctde=rs1.getDouble(1);//���Ľ��
		allzctds=rs1.getInt(2);//��������
	}
	rs1.close();
	ps1.close();

	//������
	double allzczjx=0;
	ls_sql="SELECT sum(jc_zczjx.zjxze) zjxze";
	ls_sql+=" FROM jc_zczjx";
	ls_sql+=" where (1=1) ";
	ls_sql+=wheresql2;
	ls_sql+=" and jc_zczjx.clzt not in('00')";
	ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if(rs1.next())
	{
		allzczjx=rs1.getDouble(1);//���Ľ��
	}
	rs1.close();
	ps1.close();

	allxjzcqys=allzcqds-allzctds;
	allxjzcqye=allzcqde-allzctde+allzczjx;


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
		xjzcsxe=0;
		xjzcyfk=0;
		xjzcqys=0;//����������
		xjzcqye=0;//���������ܶ�

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


//�ֹ�˾ҵ��ͳ��----------------------------



//����ҵ��ͳ��++++++++++++++++++++++++++++
		ls_sql=" select dwbh,dmmc,sum(jzqys) jzqys,TRUNC(sum(jzqye)) jzqye";
		ls_sql+=" from ( ";

		ls_sql+=" SELECT crm_khxx.dwbh dwbh,sq_dwxx.dwmc dmmc,count(*) jzqys,sum(qye) jzqye ";
		ls_sql+=" FROM crm_khxx,sq_dwxx";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) ";
		ls_sql+=" and crm_khxx.zt!='3' and crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=wheresql;
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" group by crm_khxx.dwbh,sq_dwxx.dwmc ";

		ls_sql+=" UNION ALL";
		ls_sql+=" SELECT sq_dwxx.dwbh dwbh,sq_dwxx.dwmc dmmc,0 jzqys,0 jzqye ";
		ls_sql+=" FROM sq_dwxx";
		ls_sql+=" where  sq_dwxx.dwlx='F2' and sq_dwxx.cxbz='N' and sq_dwxx.ssfgs='"+fgsbh+"'";
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

			//���Ľ�����
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
			zcqye=zcqde-zctde+zczjx;//�ۺ��ܶ�-�˵��ܶ�+�ۺ��������ܶ�

			//����ʵ�տ�
			ls_sql="SELECT sum(cw_khfkjl.fkje) fkje ";
			ls_sql+=" FROM crm_khxx,cw_khfkjl";
			ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and crm_khxx.dwbh='"+dmbh+"'";
			ls_sql+=" and (cw_khfkjl.skdd='1' OR (cw_khfkjl.skdd='2' and cw_khfkjl.dsksjbz='Y'))  ";
			ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and cw_khfkjl.fklxbm='23'  ";
			ls_sql+=" and cw_khfkjl.scbz='N'  ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcsxe=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();		
			xjzcsxe+=zcsxe;
			allzcsxe+=zcsxe;

			//����Ԥ����
			ls_sql="SELECT sum(cw_khfkjl.fkje) fkje ";
			ls_sql+=" FROM crm_khxx,cw_khfkjl";
			ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and crm_khxx.dwbh='"+dmbh+"'";
			ls_sql+=" and (cw_khfkjl.skdd='1' OR (cw_khfkjl.skdd='2' and cw_khfkjl.dsksjbz='Y'))  ";
			ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and cw_khfkjl.fklxbm='62'  ";
			ls_sql+=" and cw_khfkjl.scbz='N'  ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if(rs1.next())
			{
				zcyfk=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();		
			xjzcyfk+=zcyfk;
			allzcyfk+=zcyfk;


			double dmzcebl=0;//���Ķ����

			int pjde=0;

			if (xjzcqye==0)
			{
				dmzcebl=0;
			}
			else{
				dmzcebl=zcqye*100.0/xjzcqye;
			}

			if (zcqys==0)
			{
				pjde=0;
			}
			else{
				pjde=(int)(zcqye/zcqys);
			}
			
			%> 
			  <tr align="center" > 
				<td  class="STYLE3"><%=row%></td>
				<td  class="STYLE3"><%=fgsmc%></td>
				<td  class="STYLE3"><%=dmmc%></td>
				<td  align="right" class="STYLE4"><%=cf.formatDouble(jzqye)%></td>
				<td  align="right" class="STYLE4"><%=jzqys%></td>

				<!-- ��������������: --> 
				<td  align="right" class="STYLE4"><%=zcqys%></td>
				<td  align="right" class="STYLE4"><%=cf.formatDouble(zcqye)%></td>
				<td  align="right" class="STYLE4"><%=cf.formatDouble(pjde)%></td>
				<td  align="right" class="STYLE4">
				<A HREF="ViewZcyfk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=dmbh%>" target="_blank">
					<%=cf.formatDouble(zcyfk)%>
				</A>
				</td>
				<td  align="right" class="STYLE4">
				<A HREF="ViewZcfk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=dmbh%>" target="_blank">
					<%=cf.formatDouble(zcsxe)%>
				</A>
				</td>
				<td  align="right" class="STYLE4"><%=cf.formatDouble(dmzcebl)%>%</td>
			  </tr>
			  <%	
		}
		rs.close();
		ps.close();

		int pjde=0;
		double dmzcebl=0;//���Ķ����
		if (allxjzcqye==0)
		{
			dmzcebl=0;
		}
		else{
			dmzcebl=xjzcqye*100.0/allxjzcqye;
		}

		if (xjzcqys==0)
		{
			pjde=0;
		}
		else{
			pjde=(int)(xjzcqye/xjzcqys);
		}

		%> 
		  <tr align="center" > 
			<td colspan="3" class="STYLE3"><font color="#000099"><b><%=fgsmc%>С ��</b></font></td>
			<td  align="right" class="STYLE4"><font color="#000099"><b><%=cf.formatDouble(xjjzqye)%></b></font></td>
			<td  align="right" class="STYLE4"><font color="#000099"><b><%=xjjzqys%></b></font></td>
			<!-- ��������������: --> 
			<td  align="right" class="STYLE4"><font color="#000099"><b><%=xjzcqys%></b></font></td>
			<td  align="right" class="STYLE4"><font color="#000099"><b><%=cf.formatDouble(xjzcqye)%></b></font></td>
			<td  align="right" class="STYLE4"><font color="#000099"><b><%=cf.formatDouble(pjde)%></b></font></td>

			<td  align="right" class="STYLE4"><font color="#000099"><b>
			<%=cf.formatDouble(xjzcyfk)%>
			</b></font></td>

			<td  align="right" class="STYLE4"><font color="#000099"><b>
			<%=cf.formatDouble(xjzcsxe)%>
			</b></font></td>
			<td  align="right" class="STYLE4"><font color="#000099"><b><%=cf.formatDouble(dmzcebl)%>%</b></font></td>
		  </tr>
		  <%

	}
	rs2.close();
	ps2.close();

//����ҵ��ͳ��--------------------------------

	//�ܼ�
	


	int pjde=0;

	if (zjzcqys==0)
	{
		pjde=0;
	}
	else{
		pjde=(int)(zjzcqye/zjzcqys);
	}

%> 
  <tr align="center" > 
    <td colspan="3" class="STYLE3"><b>�� ��</b></td>
    <td  align="right" class="STYLE4"><b><%=cf.formatDouble(zjjzqye)%></b></td>
    <td  align="right" class="STYLE4"><b><%=zjjzqys%></b></td>
    <!-- ��������������: --> 
    <td  align="right" class="STYLE4"><b><%=zjzcqys%></b></td>
    <td  align="right" class="STYLE4"><b><%=cf.formatDouble(zjzcqye)%></b></td>
	<td  align="right" class="STYLE4"><b><%=cf.formatDouble(pjde)%></b></td>
    <td  align="right" class="STYLE4"><b><%=cf.formatDouble(allzcyfk)%></b></td>
    <td  align="right" class="STYLE4"><b><%=cf.formatDouble(allzcsxe)%></b></td>
	<td >&nbsp;</td>
  </tr>
</table>
</DIV>
<br>
<BR><b>[���ı���]</b>�������[���ı���]�����Ƿֹ�˾����ǩԼ��ֹ�˾��[���ı���]�Ļ����Ǽ��ŵ�����ǩԼ��<b>��</b>

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
