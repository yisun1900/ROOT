<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<%
String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

int row=0;

String xh=null;
String xmbh=null;
String xmmc=null;

String jgwzmc=null;
String oldjgwzmc="";
String jldwmc=null;
double zqdj=0;
double dj=0;
double ysl=0;
double yzqje=0;
double yje=0;
double sl=0;
double zqqye=0;
double qye=0;
double zjsl=0;
double zqzjje=0;
double zjje=0;

String gycl=null;

double allyzqje=0;
double allyje=0;
double allzqqye=0;
double allqye=0;
double allzqzjje=0;
double allzjje=0;

String khxm=null;
String lxfs=null;
String fwdz=null;
//String hth=null;
String sjs=null;
String kgrq=null;
String jyjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjb=null;


try {
	conn=cf.getConnection();
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb";
	ls_sql+=" FROM crm_khxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
	}
	rs.close();
	ps.close();

%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 18px'>
<center>
  <strong>���̱����</strong>
</center>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr> 
    <td>�ͻ�������<%=khxm%></td>
    <td>��ϵ��ʽ��<%=lxfs%></td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td>���̵ص㣺<%=fwdz%></td>
    <td>�� �� ʦ��<%=sjs%></td>
    <td>���̵ȼ���<%=bjjb%></td>
  </tr>
</table>


<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td  width="3%">���</td>
    <td  width="8%">��Ŀ���</td>
    <td  width="18%">��Ŀ����</td>
    <td  width="7%">�ײ��ڱ�־</td>
	<td  width="5%">��λ</td>
    <td  width="5%">����:Ԫ</td>
    <td  width="6%">��׼����</td>
    <td  width="6%">ԭ����</td>
    <td  width="6%">������</td>
    <td  width="6%">��������</td>
    <td  width="6%">�Ƽ�����</td>
    <td  width="9%">������Ԫ��</td>
  </tr>

<%

	String lx="&nbsp;";
	int i=0;
	String sfxzsl=null;
	String tcnxmbz=null;
	String tcnxmbzmc=null;
	double bzsl=0;
	double sjsl=0;
	double xjjsl=0;
	double xjsl=0;
	double xjqye=0;
	double allsl=0;
	String flmcgg=null;

	double sjslH=0;
	double xjjslH=0;
	double sjslQ=0;
	double xjjslQ=0;
	ls_sql="select bj_khgcxmxjh.sfxzsl,bj_khgcxmxjh.tcnxmbz,DECODE(bj_khgcxmxjh.tcnxmbz,'Y','��','N','�ײ���') tcnxmbzmc,bj_bjxmmxh.xmbh,bj_bjxmmxh.xmmc,bj_bjxmmxh.xmmc,jldwmc,bj_bjxmmxh.zqdj,bj_khgcxmxjh.bzsl,bj_khgcxmxjh.sjsl,bj_khgcxmxjh.xjjsl";
	ls_sql+=" from  bj_khgcxmxjh,bj_bjxmmxh,jdm_jldwbm";
	ls_sql+=" where bj_khgcxmxjh.zjxxh=bj_bjxmmxh.zjxxh and bj_khgcxmxjh.xmbh=bj_bjxmmxh.xmbh ";
	ls_sql+=" and bj_bjxmmxh.jldwbm=jdm_jldwbm.jldwbm ";
	ls_sql+=" and bj_khgcxmxjh.khbh='"+khbh+"' and bj_khgcxmxjh.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_khgcxmxjh.tcnxmbz='Y'";//�ײ�����Ŀ��־  Y���ǣ�N����
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		sfxzsl=cf.fillNull(rs1.getString("sfxzsl"));
		tcnxmbz=cf.fillNull(rs1.getString("tcnxmbz"));
		tcnxmbzmc=cf.fillNull(rs1.getString("tcnxmbzmc"));
		xmbh=rs1.getString("xmbh");
		xmmc=cf.fillHtml(rs1.getString("xmmc"));
		jldwmc=cf.fillHtml(rs1.getString("jldwmc"));
		zqdj=rs1.getDouble("zqdj");
		bzsl=rs1.getDouble("bzsl");
		sjslH=rs1.getDouble("sjsl");
		xjjslH=rs1.getDouble("xjjsl");

 
		//�����������Ŀ��ϸ
		sjslQ=0;
		xjjslQ=0;
		ls_sql="SELECT sjsl,xjjsl";
		ls_sql+=" FROM bj_khgcxmxjq";
		ls_sql+=" where zjxxh='"+zjxxh+"' and xmbh='"+xmbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sjslQ=rs.getDouble("sjsl");
			xjjslQ=rs.getDouble("xjjsl");
		}
		rs.close();
		ps.close();


		if (sfxzsl.equals("1"))//�Ƿ���������  1�������շѣ�2���������3��������
		{
			sl=xjjslH-xjjslQ;
		}
		else{
			sl=0;
		}

		if (sl==0)
		{
			continue;
		}

		qye=zqdj*sl;

		xjsl+=sl;
		xjqye+=qye;

		allsl+=sl;
		allqye+=qye;


		//�ж��������
		lx="&nbsp;";
		if (sl>0)
		{
			lx="<font color=\"#990000\">������</font>";
		}
		else if (sl<ysl)
		{
			lx="<font color=\"#0000CC\">������</font>";
		}


		row++;
		//���ÿ������
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td><%=row%></td>
			<td><%=xmbh%></td>
			<td><%=xmmc%></td>
			<td>�ײ�������</td>
			<td><%=jldwmc%></td>
			<td><%=zqdj%></td>
			<td><%=bzsl%></td>
			<td><%=sjslQ%></td>
			<td><%=sjslH%></td>
			<td><%=cf.formatDouble(sjslH-sjslQ)%></td>
			<td><%=cf.formatDouble(sl)%></td>
			<td><%=cf.formatDouble(qye,"#########.##")%></td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();


	//�����ɾ����Ŀ��ϸ
	ls_sql="select bj_khgcxmxjq.sfxzsl,bj_khgcxmxjq.tcnxmbz,DECODE(bj_khgcxmxjq.tcnxmbz,'Y','��','N','�ײ���') tcnxmbzmc,bj_bjxmmxq.xmbh,bj_bjxmmxq.xmmc,bj_bjxmmxq.xmmc,jldwmc,bj_bjxmmxq.zqdj,bj_khgcxmxjq.bzsl,bj_khgcxmxjq.sjsl,bj_khgcxmxjq.xjjsl";
	ls_sql+=" from  bj_khgcxmxjq,bj_bjxmmxq,jdm_jldwbm";
	ls_sql+=" where bj_khgcxmxjq.zjxxh=bj_bjxmmxq.zjxxh and bj_khgcxmxjq.xmbh=bj_bjxmmxq.xmbh ";
	ls_sql+=" and bj_bjxmmxq.jldwbm=jdm_jldwbm.jldwbm ";
	ls_sql+=" and bj_khgcxmxjq.khbh='"+khbh+"' and bj_khgcxmxjq.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_khgcxmxjq.xmbh not in(SELECT xmbh from bj_khgcxmxjh where zjxxh='"+zjxxh+"') ";
	ls_sql+=" and bj_khgcxmxjq.tcnxmbz='Y'";//�ײ�����Ŀ��־  Y���ǣ�N����
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		sfxzsl=cf.fillNull(rs1.getString("sfxzsl"));
		tcnxmbz=cf.fillNull(rs1.getString("tcnxmbz"));
		tcnxmbzmc=cf.fillNull(rs1.getString("tcnxmbzmc"));
		xmbh=rs1.getString("xmbh");
		xmmc=cf.fillHtml(rs1.getString("xmmc"));
		jldwmc=cf.fillHtml(rs1.getString("jldwmc"));
		zqdj=rs1.getDouble("zqdj");
		bzsl=rs1.getDouble("bzsl");
		sjslQ=rs1.getDouble("sjsl");
		xjjslQ=rs1.getDouble("xjjsl");

 
		//�����������Ŀ��ϸ
		sjslH=0;
		xjjslH=0;

		if (sfxzsl.equals("1"))//�Ƿ���������  1�������շѣ�2���������3��������
		{
			sl=xjjslH-xjjslQ;
		}
		else{
			sl=0;
		}


		if (sl==0)
		{
			continue;
		}

		qye=zqdj*sl;

		xjsl+=sl;
		xjqye+=qye;

		allsl+=sl;
		allqye+=qye;


		//�ж��������
		lx="&nbsp;";
		if (sl>0)
		{
			lx="<font color=\"#990000\">������</font>";
		}
		else if (sl<ysl)
		{
			lx="<font color=\"#0000CC\">������</font>";
		}


		row++;
		//���ÿ������
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td><%=row%></td>
			<td><%=xmbh%></td>
			<td><%=xmmc%></td>
			<td>�ײ�������</td>
			<td><%=jldwmc%></td>
			<td><%=zqdj%></td>
			<td><%=bzsl%></td>
			<td><%=sjslQ%></td>
			<td><%=sjslH%></td>
			<td><%=cf.formatDouble(sjslH-sjslQ)%></td>
			<td><%=cf.formatDouble(sl)%></td>
			<td><%=cf.formatDouble(qye,"#########.##")%></td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

	//�ײ�����Ŀ����
	ls_sql="SELECT bj_bjxmmxh.xmbh,xmmc,bj_bjxmmxh.zqdj,jldwmc,sum(bj_gclmxh.sl) sl";
	ls_sql+=" FROM bj_bjxmmxh,jdm_jldwbm,bj_gclmxh,bdm_xmdlbm  ";
	ls_sql+=" where bj_bjxmmxh.jldwbm=jdm_jldwbm.jldwbm ";
	ls_sql+=" and bj_bjxmmxh.zjxxh='"+zjxxh+"' ";
	ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
	ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
	ls_sql+=" and bj_bjxmmxh.tcnxmbz='N'";//�ײ�����Ŀ��־  Y���ǣ�N����
	ls_sql+=" group by bj_bjxmmxh.xmbh,xmmc,bj_bjxmmxh.zqdj,jldwmc";
	ls_sql+=" order by bj_bjxmmxh.xmbh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		xmbh=rs1.getString("xmbh");
		xmmc=cf.fillHtml(rs1.getString("xmmc"));
		jldwmc=cf.fillHtml(rs1.getString("jldwmc"));
		zqdj=rs1.getDouble("zqdj");
		sjslH=rs1.getDouble("sl");

		//�����������Ŀ��ϸ
		sjslQ=0;
		ls_sql="SELECT sum(sl) sl";
		ls_sql+=" FROM bj_gclmxq";
		ls_sql+=" where zjxxh='"+zjxxh+"' and xmbh='"+xmbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sjslQ=rs.getDouble("sl");
		}
		rs.close();
		ps.close();

		sl=sjslH-sjslQ;

		if (sl==0)
		{
			continue;
		}

		qye=zqdj*sl;

		xjsl+=sl;
		xjqye+=qye;

		allsl+=sl;
		allqye+=qye;


		//�ж��������
		lx="&nbsp;";
		if (sl>0)
		{
			lx="<font color=\"#990000\">������</font>";
		}
		else if (sl<ysl)
		{
			lx="<font color=\"#0000CC\">������</font>";
		}


		row++;
		//���ÿ������
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td><%=row%></td>
			<td><%=xmbh%></td>
			<td><%=xmmc%></td>
			<td>�ײ���</td>
			<td><%=jldwmc%></td>
			<td><%=zqdj%></td>
			<td><%=bzsl%></td>
			<td><%=sjslQ%></td>
			<td><%=sjslH%></td>
			<td><%=cf.formatDouble(sjslH-sjslQ)%></td>
			<td><%=cf.formatDouble(sl)%></td>
			<td><%=cf.formatDouble(qye,"#########.##")%></td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();


	//�����ɾ����Ŀ��ϸ
	ls_sql="SELECT bj_bjxmmxq.xmbh,xmmc,bj_bjxmmxq.zqdj,jldwmc,sum(bj_gclmxq.sl) sl";
	ls_sql+=" FROM bj_bjxmmxq,jdm_jldwbm,bj_gclmxq,bdm_xmdlbm  ";
	ls_sql+=" where bj_bjxmmxq.jldwbm=jdm_jldwbm.jldwbm ";
	ls_sql+=" and bj_bjxmmxq.zjxxh='"+zjxxh+"' ";
	ls_sql+=" and bj_bjxmmxq.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
	ls_sql+=" and bj_bjxmmxq.zjxxh=bj_gclmxq.zjxxh and bj_bjxmmxq.xmbh=bj_gclmxq.xmbh";
	ls_sql+=" and bj_bjxmmxq.tcnxmbz='N'";//�ײ�����Ŀ��־  Y���ǣ�N����
	ls_sql+=" and bj_bjxmmxq.xmbh not in(SELECT xmbh from bj_bjxmmxh where zjxxh='"+zjxxh+"') ";
	ls_sql+=" group by bj_bjxmmxq.xmbh,xmmc,bj_bjxmmxq.zqdj,jldwmc";
	ls_sql+=" order by bj_bjxmmxq.xmbh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		xmbh=rs1.getString("xmbh");
		xmmc=cf.fillHtml(rs1.getString("xmmc"));
		jldwmc=cf.fillHtml(rs1.getString("jldwmc"));
		zqdj=rs1.getDouble("zqdj");
		sjslQ=rs1.getDouble("sl");

		//�����������Ŀ��ϸ
		sjslH=0;
		ls_sql="SELECT sum(sl) sl";
		ls_sql+=" FROM bj_gclmxh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and xmbh='"+xmbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sjslH=rs.getDouble("sl");
		}
		rs.close();
		ps.close();

		sl=sjslH-sjslQ;

		if (sl==0)
		{
			continue;
		}

		qye=zqdj*sl;

		xjsl+=sl;
		xjqye+=qye;

		allsl+=sl;
		allqye+=qye;


		//�ж��������
		lx="&nbsp;";
		if (sl>0)
		{
			lx="<font color=\"#990000\">������</font>";
		}
		else if (sl<ysl)
		{
			lx="<font color=\"#0000CC\">������</font>";
		}


		row++;
		//���ÿ������
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td><%=row%></td>
			<td><%=xmbh%></td>
			<td><%=xmmc%></td>
			<td>�ײ���</td>
			<td><%=jldwmc%></td>
			<td><%=zqdj%></td>
			<td><%=bzsl%></td>
			<td><%=sjslQ%></td>
			<td><%=sjslH%></td>
			<td><%=cf.formatDouble(sjslH-sjslQ)%></td>
			<td><%=cf.formatDouble(sl)%></td>
			<td><%=cf.formatDouble(qye,"#########.##")%></td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();
%>
  <tr bgcolor="#FFFFFF" align="center"> 
	<td colspan="5"><B>������ĿС��</B></td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td><%=cf.formatDouble(xjsl)%></td>
	<td><%=cf.formatDouble(xjqye,"#########.##")%></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="6"> 
      <div align="center"><b><font size="2">�ۺ�ȡ��</font></b></div>
    </td>
  </tr>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td align="center" width="22%" >��Ŀ����</td>
    <td align="center" width="10%" >ԭ���</td>
    <td align="center" width="10%">�½��</td>
    <td align="center" width="10%">��ǰ�������</td>
    <td align="center" width="10%">�ۺ��������</td>
    <td align="left" width="48%">&nbsp;</td>
  </tr>
  <%  
	double ZqZjxqQtsf=0;//��ǰԭ���
	double ZqZjxhQtsf=0;//�ۺ�ԭ���
	double ZhZjxqQtsf=0;//��ǰ�½��
	double ZhZjxhQtsf=0;//�ۺ��½��

	double ZqZjxQtsf=0;//��ǰ�������
	double ZhZjxQtsf=0;//�ۺ��������


	double allZqZjxqQtsf=0;
	double allZqZjxhQtsf=0;
	double allZhZjxqQtsf=0;
	double allZhZjxhQtsf=0;

	double allZqZjxQtsf=0;
	double allZhZjxQtsf=0;

	String sfxmbm=null;
	String sfxmmc=null;
	String bz=null;
	String color=null;


	double allZqZjxqQtsfSdl=0;
	double allZqZjxhQtsfSdl=0;
	double allZhZjxqQtsfSdl=0;
	double allZhZjxhQtsfSdl=0;

	double allZqZjxQtsfSdl=0;
	double allZhZjxQtsfSdl=0;

	ls_sql="SELECT sfxmbm,sfxmmc,zqsfje,sfje,bz";
	ls_sql+=" FROM bj_sfxmmxh  ";
    ls_sql+=" where bj_sfxmmxh.khbh='"+khbh+"' and zjxxh='"+zjxxh+"'";
    ls_sql+=" and sfxmlx in('D','E')";//D��ˮ��·��E��ˮ��·Ԥ��
    ls_sql+=" order by bj_sfxmmxh.sfxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sfxmbm=cf.fillHtml(rs.getString("sfxmbm"));
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		bz=cf.fillHtml(rs.getString("bz"));
		ZqZjxhQtsf=rs.getDouble("zqsfje");
		ZhZjxhQtsf=rs.getDouble("sfje");

		ZqZjxqQtsf=0;
		ZhZjxqQtsf=0;
		ls_sql="SELECT zqsfje,sfje";
		ls_sql+=" FROM bj_sfxmmxq  ";
		ls_sql+=" where khbh='"+khbh+"' and zjxxh='"+zjxxh+"' and sfxmbm='"+sfxmbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ZqZjxqQtsf=rs1.getDouble("zqsfje");
			ZhZjxqQtsf=rs1.getDouble("sfje");
		}
		rs1.close();
		ps1.close();

		ZqZjxQtsf=ZqZjxhQtsf-ZqZjxqQtsf;
		ZhZjxQtsf=ZhZjxhQtsf-ZhZjxqQtsf;

		if (ZhZjxhQtsf!=ZhZjxqQtsf)
		{
			color="#FF0000";
		}
		else{
			color="#000000";
		}



		if (ZhZjxQtsf!=0)
		{
			allZqZjxhQtsf+=ZqZjxhQtsf;
			allZhZjxhQtsf+=ZhZjxhQtsf;
			allZqZjxqQtsf+=ZqZjxqQtsf;
			allZhZjxqQtsf+=ZhZjxqQtsf;

			allZqZjxQtsf+=ZqZjxQtsf;
			allZhZjxQtsf+=ZhZjxQtsf;

			allZqZjxhQtsfSdl+=ZqZjxhQtsf;
			allZhZjxhQtsfSdl+=ZhZjxhQtsf;
			allZqZjxqQtsfSdl+=ZqZjxqQtsf;
			allZhZjxqQtsfSdl+=ZhZjxqQtsf;

			allZqZjxQtsfSdl+=ZqZjxQtsf;
			allZhZjxQtsfSdl+=ZhZjxQtsf;

			%> 
			<tr bgcolor="#FFFFFF" align="center"> 
			<td><%=sfxmmc%></td>
			<td><font color="<%=color%>"><%=cf.formatDouble(ZhZjxqQtsf,"#########.##")%></font></td>
			<td><font color="<%=color%>"><%=cf.formatDouble(ZhZjxhQtsf,"#########.##")%></font></td>
			<td><font color="<%=color%>"><%=cf.formatDouble(ZqZjxQtsf,"#########.##")%></font></td>
			<td><font color="<%=color%>"><%=cf.formatDouble(ZhZjxQtsf,"#########.##")%></font></td>
			<td align="left" width="48%"><%=bz%></td>
			</tr>
			<%
		}

	}
	rs.close();
	ps.close();

	//�����������շ�
	ls_sql="SELECT sfxmbm,sfxmmc,zqsfje,sfje,bz";
	ls_sql+=" FROM bj_sfxmmxq  ";
    ls_sql+=" where bj_sfxmmxq.khbh='"+khbh+"' and zjxxh='"+zjxxh+"'";
    ls_sql+=" and bj_sfxmmxq.sfxmbm not in(SELECT sfxmbm FROM bj_sfxmmxh where bj_sfxmmxh.khbh='"+khbh+"' and zjxxh='"+zjxxh+"')";
    ls_sql+=" and sfxmlx in('D','E')";//D��ˮ��·��E��ˮ��·Ԥ��
    ls_sql+=" order by bj_sfxmmxq.sfxmbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sfxmbm=cf.fillHtml(rs.getString("sfxmbm"));
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		bz=cf.fillHtml(rs.getString("bz"));
		ZqZjxqQtsf=rs.getDouble("zqsfje");
		ZhZjxqQtsf=rs.getDouble("sfje");

		ZqZjxhQtsf=0;
		ZhZjxhQtsf=0;

		ZqZjxQtsf=ZqZjxhQtsf-ZqZjxqQtsf;
		ZhZjxQtsf=ZhZjxhQtsf-ZhZjxqQtsf;

		if (ZhZjxhQtsf!=ZhZjxqQtsf)
		{
			color="#FF0000";
		}
		else{
			color="#000000";
		}


		allZqZjxhQtsf+=ZqZjxhQtsf;
		allZhZjxhQtsf+=ZhZjxhQtsf;
		allZqZjxqQtsf+=ZqZjxqQtsf;
		allZhZjxqQtsf+=ZhZjxqQtsf;

		allZqZjxQtsf+=ZqZjxQtsf;
		allZhZjxQtsf+=ZhZjxQtsf;

		allZqZjxhQtsfSdl+=ZqZjxhQtsf;
		allZhZjxhQtsfSdl+=ZhZjxhQtsf;
		allZqZjxqQtsfSdl+=ZqZjxqQtsf;
		allZhZjxqQtsfSdl+=ZhZjxqQtsf;

		allZqZjxQtsfSdl+=ZqZjxQtsf;
		allZhZjxQtsfSdl+=ZhZjxQtsf;

		%> 
		<tr bgcolor="#FFFFFF" align="center"> 
		<td><%=sfxmmc%></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(ZhZjxqQtsf,"#########.##")%></font></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(ZhZjxhQtsf,"#########.##")%></font></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(ZqZjxQtsf,"#########.##")%></font></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(ZhZjxQtsf,"#########.##")%></font></td>
		<td align="left" width="48%"><%=bz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%>
  <tr bgcolor="#FFFFFF" align="center"> 
    <td><B>ˮ��·С��</B></td>
    <td ><%=cf.formatDouble(allZhZjxqQtsfSdl,"#########.##")%></td>
    <td><%=cf.formatDouble(allZhZjxhQtsfSdl,"#########.##")%></td>
    <td><%=cf.formatDouble(allZqZjxQtsfSdl,"#########.##")%></td>
    <td><%=cf.formatDouble(allZhZjxQtsfSdl,"#########.##")%></td>
    <td >&nbsp;</td>
  </tr>
</table>

<BR>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td align="center" width="22%" >��Ŀ����</td>
    <td align="center" width="10%" >ԭ���</td>
    <td align="center" width="10%">�½��</td>
    <td align="center" width="10%">��ǰ�������</td>
    <td align="center" width="10%">�ۺ��������</td>
    <td align="left" width="48%">&nbsp;</td>
  </tr>
<%
	double allZqZjxqQtsfQt=0;
	double allZqZjxhQtsfQt=0;
	double allZhZjxqQtsfQt=0;
	double allZhZjxhQtsfQt=0;

	double allZqZjxQtsfQt=0;
	double allZhZjxQtsfQt=0;

	ls_sql="SELECT sfxmbm,sfxmmc,zqsfje,sfje,bz";
	ls_sql+=" FROM bj_sfxmmxh  ";
    ls_sql+=" where bj_sfxmmxh.khbh='"+khbh+"' and zjxxh='"+zjxxh+"'";
    ls_sql+=" and sfxmlx not in('5','D','E')";//D��ˮ��·��E��ˮ��·Ԥ��
    ls_sql+=" order by bj_sfxmmxh.sfxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sfxmbm=cf.fillHtml(rs.getString("sfxmbm"));
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		bz=cf.fillHtml(rs.getString("bz"));
		ZqZjxhQtsf=rs.getDouble("zqsfje");
		ZhZjxhQtsf=rs.getDouble("sfje");

		ZqZjxqQtsf=0;
		ZhZjxqQtsf=0;
		ls_sql="SELECT zqsfje,sfje";
		ls_sql+=" FROM bj_sfxmmxq  ";
		ls_sql+=" where khbh='"+khbh+"' and zjxxh='"+zjxxh+"' and sfxmbm='"+sfxmbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ZqZjxqQtsf=rs1.getDouble("zqsfje");
			ZhZjxqQtsf=rs1.getDouble("sfje");
		}
		rs1.close();
		ps1.close();

		ZqZjxQtsf=ZqZjxhQtsf-ZqZjxqQtsf;
		ZhZjxQtsf=ZhZjxhQtsf-ZhZjxqQtsf;

		if (ZhZjxhQtsf!=ZhZjxqQtsf)
		{
			color="#FF0000";
		}
		else{
			color="#000000";
		}



		if (ZhZjxQtsf!=0)
		{
			allZqZjxhQtsf+=ZqZjxhQtsf;
			allZhZjxhQtsf+=ZhZjxhQtsf;
			allZqZjxqQtsf+=ZqZjxqQtsf;
			allZhZjxqQtsf+=ZhZjxqQtsf;

			allZqZjxQtsf+=ZqZjxQtsf;
			allZhZjxQtsf+=ZhZjxQtsf;

			allZqZjxhQtsfQt+=ZqZjxhQtsf;
			allZhZjxhQtsfQt+=ZhZjxhQtsf;
			allZqZjxqQtsfQt+=ZqZjxqQtsf;
			allZhZjxqQtsfQt+=ZhZjxqQtsf;

			allZqZjxQtsfQt+=ZqZjxQtsf;
			allZhZjxQtsfQt+=ZhZjxQtsf;

			%> 
			<tr bgcolor="#FFFFFF" align="center"> 
			<td><%=sfxmmc%></td>
			<td><font color="<%=color%>"><%=cf.formatDouble(ZhZjxqQtsf,"#########.##")%></font></td>
			<td><font color="<%=color%>"><%=cf.formatDouble(ZhZjxhQtsf,"#########.##")%></font></td>
			<td><font color="<%=color%>"><%=cf.formatDouble(ZqZjxQtsf,"#########.##")%></font></td>
			<td><font color="<%=color%>"><%=cf.formatDouble(ZhZjxQtsf,"#########.##")%></font></td>
			<td align="left" width="48%"><%=bz%></td>
			</tr>
			<%
		}

	}
	rs.close();
	ps.close();

	//�����������շ�
	ls_sql="SELECT sfxmbm,sfxmmc,zqsfje,sfje,bz";
	ls_sql+=" FROM bj_sfxmmxq  ";
    ls_sql+=" where bj_sfxmmxq.khbh='"+khbh+"' and zjxxh='"+zjxxh+"'";
    ls_sql+=" and bj_sfxmmxq.sfxmbm not in(SELECT sfxmbm FROM bj_sfxmmxh where bj_sfxmmxh.khbh='"+khbh+"' and zjxxh='"+zjxxh+"')";
    ls_sql+=" and sfxmlx not in('5','D','E')";//D��ˮ��·��E��ˮ��·Ԥ��
    ls_sql+=" order by bj_sfxmmxq.sfxmbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sfxmbm=cf.fillHtml(rs.getString("sfxmbm"));
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		bz=cf.fillHtml(rs.getString("bz"));
		ZqZjxqQtsf=rs.getDouble("zqsfje");
		ZhZjxqQtsf=rs.getDouble("sfje");

		ZqZjxhQtsf=0;
		ZhZjxhQtsf=0;

		ZqZjxQtsf=ZqZjxhQtsf-ZqZjxqQtsf;
		ZhZjxQtsf=ZhZjxhQtsf-ZhZjxqQtsf;

		if (ZhZjxhQtsf!=ZhZjxqQtsf)
		{
			color="#FF0000";
		}
		else{
			color="#000000";
		}


		allZqZjxhQtsf+=ZqZjxhQtsf;
		allZhZjxhQtsf+=ZhZjxhQtsf;
		allZqZjxqQtsf+=ZqZjxqQtsf;
		allZhZjxqQtsf+=ZhZjxqQtsf;

		allZqZjxQtsf+=ZqZjxQtsf;
		allZhZjxQtsf+=ZhZjxQtsf;

		allZqZjxhQtsfQt+=ZqZjxhQtsf;
		allZhZjxhQtsfQt+=ZhZjxhQtsf;
		allZqZjxqQtsfQt+=ZqZjxqQtsf;
		allZhZjxqQtsfQt+=ZhZjxqQtsf;

		allZqZjxQtsfQt+=ZqZjxQtsf;
		allZhZjxQtsfQt+=ZhZjxQtsf;

		%> 
		<tr bgcolor="#FFFFFF" align="center"> 
		<td><%=sfxmmc%></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(ZhZjxqQtsf,"#########.##")%></font></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(ZhZjxhQtsf,"#########.##")%></font></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(ZqZjxQtsf,"#########.##")%></font></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(ZhZjxQtsf,"#########.##")%></font></td>
		<td align="left" width="48%"><%=bz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%>
  <tr bgcolor="#FFFFFF" align="center"> 
    <td><B>��������С��</B></td>
    <td ><%=cf.formatDouble(allZhZjxqQtsfQt,"#########.##")%></td>
    <td><%=cf.formatDouble(allZhZjxhQtsfQt,"#########.##")%></td>
    <td><%=cf.formatDouble(allZqZjxQtsfQt,"#########.##")%></td>
    <td><%=cf.formatDouble(allZhZjxQtsfQt,"#########.##")%></td>
    <td >&nbsp;</td>
  </tr>
</table>

<BR>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td align="center" width="22%" >��Ŀ����</td>
    <td align="center" width="10%" >ԭ���</td>
    <td align="center" width="10%">�½��</td>
    <td align="center" width="10%">��ǰ�������</td>
    <td align="center" width="10%">�ۺ��������</td>
    <td align="left" width="48%">&nbsp;</td>
  </tr>

<%
	double allZqZjxqQtsfGlf=0;
	double allZqZjxhQtsfGlf=0;
	double allZhZjxqQtsfGlf=0;
	double allZhZjxhQtsfGlf=0;
	double allZqZjxQtsfGlf=0;
	double allZhZjxQtsfGlf=0;

	double sfbfb=0;

	ls_sql="SELECT sfxmbm,sfxmmc,zqsfje,sfje,bz,sfbfb";
	ls_sql+=" FROM bj_sfxmmxh  ";
    ls_sql+=" where bj_sfxmmxh.khbh='"+khbh+"' and zjxxh='"+zjxxh+"'";
    ls_sql+=" and sfxmlx='5'";//5�����̹����
    ls_sql+=" order by bj_sfxmmxh.sfxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sfxmbm=cf.fillHtml(rs.getString("sfxmbm"));
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		bz=cf.fillHtml(rs.getString("bz"));
		ZqZjxhQtsf=rs.getDouble("zqsfje");
		ZhZjxhQtsf=rs.getDouble("sfje");
		sfbfb=rs.getDouble("sfbfb");

		ZqZjxqQtsf=0;
		ZhZjxqQtsf=0;
		ls_sql="SELECT zqsfje,sfje";
		ls_sql+=" FROM bj_sfxmmxq  ";
		ls_sql+=" where khbh='"+khbh+"' and zjxxh='"+zjxxh+"' and sfxmbm='"+sfxmbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ZqZjxqQtsf=rs1.getDouble("zqsfje");
			ZhZjxqQtsf=rs1.getDouble("sfje");
		}
		rs1.close();
		ps1.close();

		ZqZjxQtsf=ZqZjxhQtsf-ZqZjxqQtsf;
		ZhZjxQtsf=ZhZjxhQtsf-ZhZjxqQtsf;

		if (ZhZjxhQtsf!=ZhZjxqQtsf)
		{
			color="#FF0000";
		}
		else{
			color="#000000";
		}



		if (ZhZjxQtsf!=0)
		{
			allZqZjxhQtsf+=ZqZjxhQtsf;
			allZhZjxhQtsf+=ZhZjxhQtsf;
			allZqZjxqQtsf+=ZqZjxqQtsf;
			allZhZjxqQtsf+=ZhZjxqQtsf;

			allZqZjxQtsf+=ZqZjxQtsf;
			allZhZjxQtsf+=ZhZjxQtsf;

			allZqZjxhQtsfGlf+=ZqZjxhQtsf;
			allZhZjxhQtsfGlf+=ZhZjxhQtsf;
			allZqZjxqQtsfGlf+=ZqZjxqQtsf;
			allZhZjxqQtsfGlf+=ZhZjxqQtsf;

			allZqZjxQtsfGlf+=ZqZjxQtsf;
			allZhZjxQtsfGlf+=ZhZjxQtsf;

			%> 
			<tr bgcolor="#FFFFFF" align="center"> 
			<td><%=sfxmmc%></td>
			<td><font color="<%=color%>"><%=cf.formatDouble(ZhZjxqQtsf,"#########.##")%></font></td>
			<td><font color="<%=color%>"><%=cf.formatDouble(ZhZjxhQtsf,"#########.##")%></font></td>
			<td><font color="<%=color%>"><%=cf.formatDouble(ZqZjxQtsf,"#########.##")%></font></td>
			<td><font color="<%=color%>"><%=cf.formatDouble(ZhZjxQtsf,"#########.##")%></font></td>
			<td align="left" width="48%"><%=bz%></td>
			</tr>
			<%
		}

	}
	rs.close();
	ps.close();

	//�����������շ�
	ls_sql="SELECT sfxmbm,sfxmmc,zqsfje,sfje,bz";
	ls_sql+=" FROM bj_sfxmmxq  ";
    ls_sql+=" where bj_sfxmmxq.khbh='"+khbh+"' and zjxxh='"+zjxxh+"'";
    ls_sql+=" and bj_sfxmmxq.sfxmbm not in(SELECT sfxmbm FROM bj_sfxmmxh where bj_sfxmmxh.khbh='"+khbh+"' and zjxxh='"+zjxxh+"')";
    ls_sql+=" and sfxmlx='5'";//5�����̹����
    ls_sql+=" order by bj_sfxmmxq.sfxmbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sfxmbm=cf.fillHtml(rs.getString("sfxmbm"));
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		bz=cf.fillHtml(rs.getString("bz"));
		ZqZjxqQtsf=rs.getDouble("zqsfje");
		ZhZjxqQtsf=rs.getDouble("sfje");

		ZqZjxhQtsf=0;
		ZhZjxhQtsf=0;

		ZqZjxQtsf=ZqZjxhQtsf-ZqZjxqQtsf;
		ZhZjxQtsf=ZhZjxhQtsf-ZhZjxqQtsf;

		if (ZhZjxhQtsf!=ZhZjxqQtsf)
		{
			color="#FF0000";
		}
		else{
			color="#000000";
		}


		allZqZjxhQtsf+=ZqZjxhQtsf;
		allZhZjxhQtsf+=ZhZjxhQtsf;
		allZqZjxqQtsf+=ZqZjxqQtsf;
		allZhZjxqQtsf+=ZhZjxqQtsf;

		allZqZjxQtsf+=ZqZjxQtsf;
		allZhZjxQtsf+=ZhZjxQtsf;

		allZqZjxhQtsfGlf+=ZqZjxhQtsf;
		allZhZjxhQtsfGlf+=ZhZjxhQtsf;
		allZqZjxqQtsfGlf+=ZqZjxqQtsf;
		allZhZjxqQtsfGlf+=ZhZjxqQtsf;

		allZqZjxQtsfGlf+=ZqZjxQtsf;
		allZhZjxQtsfGlf+=ZhZjxQtsf;

		%> 
		<tr bgcolor="#FFFFFF" align="center"> 
		<td><%=sfxmmc%></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(ZhZjxqQtsf,"#########.##")%></font></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(ZhZjxhQtsf,"#########.##")%></font></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(ZqZjxQtsf,"#########.##")%></font></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(ZhZjxQtsf,"#########.##")%></font></td>
		<td align="left" width="48%"><%=bz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%>

</table>

<BR>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td align="center" width="22%" >��Ŀ����</td>
    <td align="center" width="10%" >ԭ���</td>
    <td align="center" width="10%">�½��</td>
    <td align="center" width="10%">��ǰ�������</td>
    <td align="center" width="10%">�ۺ��������</td>
    <td align="left" width="48%">&nbsp;</td>
  </tr>

  <tr bgcolor="#FFFFFF" align="center"> 
    <td><B>�ۺ�ȡ�Ѻϼ�</B></td>
    <td ><%=cf.formatDouble(allZhZjxqQtsf,"#########.##")%></td>
    <td><%=cf.formatDouble(allZhZjxhQtsf,"#########.##")%></td>
    <td><%=cf.formatDouble(allZqZjxQtsf,"#########.##")%></td>
    <td><%=cf.formatDouble(allZhZjxQtsf,"#########.##")%></td>
    <td >&nbsp;</td>
  </tr>
</table>
<BR>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"  > 
    <td><B><font size="3">������ܼƣ�</font><%=cf.formatDouble(allzjje+allZhZjxQtsf,"#########.##")%></B></td>
  </tr>
</table>
<table width="100%" border="0">
  <tr> 
    <td height="33">�׷�ǩ�֣�</td>
    <td height="33">�ҷ�ǩ�֣�</td>
  </tr>

</table>

</body>
</html>

<%
}
catch (Exception e) {
	out.print("��������: " + e);
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