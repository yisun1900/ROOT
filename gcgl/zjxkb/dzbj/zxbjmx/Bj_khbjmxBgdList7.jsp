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
double cldj=0;
double rgdj=0;
double jxdj=0;
double zcf=0;
double shf=0;
double ysf=0;
double qtf=0;

double zjqSl=0;
double zjqZhJe=0;
double zjqZqJe=0;
double sl=0;
double zjhZhJe=0;
double zjhZqJe=0;
double zjsl=0;
double zhZjJe=0;
double zqZjJe=0;

String gycl=null;

double allZjqZhJe=0;
double allZjhZhJe=0;
double allzqqye=0;
double allZhZjJe=0;
double allZqZjJe=0;

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
    <td  width="10%">��Ŀ���</td>
    <td  width="22%">��Ŀ����</td>
    <td  width="5%">����</td>
    <td  width="5%">��λ</td>

	<td  width="5%">����</td>
	<td  width="5%">����</td>
	<td  width="5%">�˹�</td>
	<td  width="5%">���</td>
	
	<td  width="5%">����</td>
	<td  width="5%">��е</td>
	<td  width="5%">����</td>
	<td  width="6%">�ϼ�</td>

    <td  width="6%">��������</td>
    <td  width="8%">������Ԫ��</td>
  </tr>

<%
//ԭ�С�δɾ��������Ϣ����������������������������������������������������������������
	String lx="&nbsp;";
	int i=0;
	ls_sql="SELECT bj_fjxxq.jgwzbm";
	ls_sql+=" FROM bj_fjxxq ";
    ls_sql+=" where khbh='"+khbh+"' and zjxxh='"+zjxxh+"' and jgwzbm in(SELECT jgwzbm FROM bj_fjxxh where khbh='"+khbh+"' and zjxxh='"+zjxxh+"')";
	ls_sql+=" order by bj_fjxxq.xuhao ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");

		double xjZjqZhJe=0;
		double xjZjhZhJe=0;
		double xjzqqye=0;
		double xjZhZjJe=0;
		double xjZqZjJe=0;
		
		//�������
		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td colspan="15"> 
			  <b><i><font size="3">�ṹλ�ã�<%=jgwzmc%></font></i></b>
			</td>
		  </tr>
		<%

		//�����������Ŀ��ϸ
		String xsxmbh=null;
		ls_sql="SELECT bj_bjxmmxh.xh xh,bj_bjxmmxh.xmbh,bj_bjxmmxh.xmbh xsxmbh,xmmc,jldwmc,bj_bjxmmxh.zqdj,bj_bjxmmxh.dj";
		ls_sql+=" ,bj_bjxmmxh.cldj,bj_bjxmmxh.rgdj,bj_bjxmmxh.jxdj,bj_bjxmmxh.zcf,bj_bjxmmxh.shf,bj_bjxmmxh.ysf,bj_bjxmmxh.qtf";
		ls_sql+=" ,bj_gclmxh.sl,bj_gclmxh.sl*bj_bjxmmxh.dj as je,bj_gclmxh.sl*bj_bjxmmxh.zqdj as zqje";
		ls_sql+=" FROM bj_bjxmmxh,jdm_jldwbm,bj_gclmxh,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmxh.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmxh.khbh='"+khbh+"' and bj_gclmxh.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmxh.zjxxh='"+zjxxh+"' and bj_gclmxh.zjxxh='"+zjxxh+"'";
		ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmxh.khbh=bj_gclmxh.khbh and bj_bjxmmxh.dqbm=bj_gclmxh.dqbm and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
		ls_sql+=" order by bj_bjxmmxh.xmpx";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			xh=cf.fillHtml(rs.getString("xh"));
			xmbh=cf.fillHtml(rs.getString("xmbh"));
			xsxmbh=cf.fillHtml(rs.getString("xsxmbh"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			zqdj=rs.getDouble("zqdj");
			dj=rs.getDouble("dj");

			cldj=rs.getDouble("cldj");
			rgdj=rs.getDouble("rgdj");
			jxdj=rs.getDouble("jxdj");
			zcf=rs.getDouble("zcf");
			shf=rs.getDouble("shf");
			ysf=rs.getDouble("ysf");
			qtf=rs.getDouble("qtf");

			sl=rs.getDouble("sl");
			zjhZhJe=rs.getDouble("je");
			zjhZqJe=rs.getDouble("zqje");


			//��ȡ����ǰ��Ŀ��ϸ
			zjqSl=-1;
			zjqZhJe=-1;
			zjqZqJe=-1;

			ls_sql="SELECT sl";
			ls_sql+=" FROM bj_gclmxq ";
			ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzmc+"' and xmbh='"+xmbh+"' and zjxxh='"+zjxxh+"'";
		//	out.println(ls_sql);
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				zjqSl=rs2.getDouble(1);
			}
			rs2.close();
			ps2.close();

			zjqZhJe=zjqSl*dj;
			zjqZhJe=cf.round(zjqZhJe,2);
			zjqZqJe=zjqSl*zqdj;
			zjqZqJe=cf.round(zjqZqJe,2);


			//�ж��������
			lx="&nbsp;";
			if (zjqSl==-1)
			{
				lx="<font color=\"#FF0000\">������</font>";
				zjqSl=0;
				zjqZhJe=0;
				zjqZqJe=0;
			}
			else{
				if (sl>zjqSl)
				{
					lx="<font color=\"#990000\">������</font>";
				}
				else if (sl<zjqSl)
				{
					lx="<font color=\"#0000CC\">������</font>";
				}
				else{
					continue;
				}
			}

			zjsl=sl-zjqSl;
			zhZjJe=zjhZhJe-zjqZhJe;
			zqZjJe=zjhZqJe-zjqZqJe;

			xjZjqZhJe+=zjqZhJe;
			xjZjhZhJe+=zjhZhJe;
			xjZhZjJe+=zhZjJe;
			xjZqZjJe+=zqZjJe;

			allZjqZhJe+=zjqZhJe;
			allZjhZhJe+=zjhZhJe;
			allZhZjJe+=zhZjJe;
			allZqZjJe+=zqZjJe;


			row++;
			//���ÿ������
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td><%=row%></td>
				<td><%=xsxmbh%></td>
				<td><%=xmmc%></td>
				<td><%=lx%></td>
				<td><%=jldwmc%></td>

				<td><%=zcf%></td>
				<td><%=cldj%></td>
				<td><%=rgdj%></td>
				<td><%=shf%></td>
				<td><%=ysf%></td>
				<td><%=jxdj%></td>
				<td><%=qtf%></td>

				<td><%=zqdj%></td>
				<td><%=cf.formatDouble(zjsl)%></td>
				<td><%=cf.formatDouble(zqZjJe,"#########.##")%></td>
			  </tr>
			<%
		}
		rs.close();
		ps.close();


		//�����ɾ����Ŀ��ϸ
		ls_sql="SELECT bj_bjxmmxq.xh xh,trim(bj_bjxmmxq.xmbh)||DECODE(bjlx,'1','','2','��') xmbh,xmmc,jldwmc,bj_bjxmmxq.zqdj,bj_bjxmmxq.dj,bj_gclmxq.sl,bj_gclmxq.sl*bj_bjxmmxq.dj as je,bj_gclmxq.sl*bj_bjxmmxq.zqdj as zqje";
		ls_sql+=" ,bj_bjxmmxq.cldj,bj_bjxmmxq.rgdj,bj_bjxmmxq.jxdj,bj_bjxmmxq.zcf,bj_bjxmmxq.shf,bj_bjxmmxq.ysf,bj_bjxmmxq.qtf";
		ls_sql+=" FROM bj_bjxmmxq,jdm_jldwbm,bj_gclmxq,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmxq.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmxq.khbh='"+khbh+"' and bj_gclmxq.jgwzbm='"+jgwzmc+"' and bj_bjxmmxq.zjxxh='"+zjxxh+"' and bj_gclmxq.zjxxh='"+zjxxh+"'";
		ls_sql+=" and bj_bjxmmxq.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmxq.khbh=bj_gclmxq.khbh and bj_bjxmmxq.dqbm=bj_gclmxq.dqbm and bj_bjxmmxq.xmbh=bj_gclmxq.xmbh";
		ls_sql+=" and bj_bjxmmxq.xmbh not in(select xmbh from bj_gclmxh where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzmc+"')";
		ls_sql+=" order by bj_bjxmmxq.xmpx";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			xh=cf.fillHtml(rs.getString("xh"));
			xmbh=cf.fillHtml(rs.getString("xmbh"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			zqdj=rs.getDouble("zqdj");
			dj=rs.getDouble("dj");

			cldj=rs.getDouble("cldj");
			rgdj=rs.getDouble("rgdj");
			jxdj=rs.getDouble("jxdj");
			zcf=rs.getDouble("zcf");
			shf=rs.getDouble("shf");
			ysf=rs.getDouble("ysf");
			qtf=rs.getDouble("qtf");

			zjqSl=rs.getDouble("sl");
			zjqZhJe=rs.getDouble("je");
			zjqZqJe=rs.getDouble("zqje");

			sl=0;
			zjhZhJe=0;
			zjhZqJe=0;

			zjsl=sl-zjqSl;//��������������������������ǰ����
			zqZjJe=zjhZqJe-zjqZqJe;//��������ǰ����������ǰ������ǰ��ǰ��
			zhZjJe=zjhZhJe-zjqZhJe;//�������ۺ���������ۺ������ǰ�ۺ��

			xjZjqZhJe+=zjqZhJe;
			xjZjhZhJe+=zjhZhJe;

			xjZqZjJe+=zqZjJe;
			xjZhZjJe+=zhZjJe;

			allZjhZhJe+=zjhZhJe;
			allZjqZhJe+=zjqZhJe;

			allZqZjJe+=zqZjJe;
			allZhZjJe+=zhZjJe;

			lx="<font color=\"#CC33CC\">������</font>";

			row++;


			//���ÿ������
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td><%=row%></td>
				<td><%=xmbh%></td>
				<td ><%=xmmc%></td>
				<td><%=lx%></td>
				<td><%=jldwmc%></td>

				<td><%=zcf%></td>
				<td><%=cldj%></td>
				<td><%=rgdj%></td>
				<td><%=shf%></td>
				<td><%=ysf%></td>
				<td><%=jxdj%></td>
				<td><%=qtf%></td>

				<td><%=zqdj%></td>
				<td><%=cf.formatDouble(zjsl)%></td>
				<td><%=cf.formatDouble(zqZjJe,"#########.##")%></td>
			  </tr>
			<%
		}
		ps.close();
		rs.close();

		//���С��
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td colspan="5">С ��</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td>&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(xjZqZjJe,"#########.##")%></td>
		  </tr>
		<%

	
	}
	rs1.close();
	ps1.close();
//ԭ�з�����Ϣ������������������������������������������������������������������������������������

//����������Ϣ����������������������������������������������������������������
	i=0;
	ls_sql="SELECT bj_fjxxh.jgwzbm";
	ls_sql+=" FROM bj_fjxxh ";
    ls_sql+=" where khbh='"+khbh+"' and zjxxh='"+zjxxh+"' and jgwzbm not in(SELECT jgwzbm FROM bj_fjxxq where khbh='"+khbh+"' and zjxxh='"+zjxxh+"')";
	ls_sql+=" order by bj_fjxxh.xuhao ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");

		double xjZjqZhJe=0;
		double xjZjhZhJe=0;
		double xjZhZjJe=0;
		double xjZqZjJe=0;
		
		lx="<font color=\"#FF0000\">����������</font>";

		//�������
		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td colspan="15"> 
			  <b><i><font size="3">�ṹλ�ã�<%=jgwzmc%></font></i><font color="#FF0000">���������䣩</font></b>
			</td>
		  </tr>
		<%

		//�����Ŀ��ϸ
		ls_sql="SELECT bj_bjxmmxh.xh xh,bj_bjxmmxh.xmbh xmbh,xmmc,jldwmc,bj_bjxmmxh.zqdj,bj_bjxmmxh.dj,bj_gclmxh.sl";
		ls_sql+=" ,bj_bjxmmxh.cldj,bj_bjxmmxh.rgdj,bj_bjxmmxh.jxdj,bj_bjxmmxh.zcf,bj_bjxmmxh.shf,bj_bjxmmxh.ysf,bj_bjxmmxh.qtf";
		ls_sql+=" FROM bj_bjxmmxh,jdm_jldwbm,bj_gclmxh  ";
		ls_sql+=" where bj_bjxmmxh.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmxh.khbh='"+khbh+"' and bj_bjxmmxh.zjxxh='"+zjxxh+"' and bj_gclmxh.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmxh.khbh=bj_gclmxh.khbh and bj_bjxmmxh.dqbm=bj_gclmxh.dqbm and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh";
		ls_sql+=" order by bj_bjxmmxh.xh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			xh=cf.fillHtml(rs.getString("xh"));
			xmbh=cf.fillHtml(rs.getString("xmbh"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			zqdj=rs.getDouble("zqdj");
			dj=rs.getDouble("dj");

			cldj=rs.getDouble("cldj");
			rgdj=rs.getDouble("rgdj");
			jxdj=rs.getDouble("jxdj");
			zcf=rs.getDouble("zcf");
			shf=rs.getDouble("shf");
			ysf=rs.getDouble("ysf");
			qtf=rs.getDouble("qtf");

			sl=rs.getDouble("sl");

			zjhZqJe=sl*zqdj;//������-��ǰ���
			cf.round(zjhZqJe,2);

			zjhZhJe=sl*dj;//������-�ۺ���
			cf.round(zjhZhJe,2);

			zjqSl=0;//����ǰ-����
			zjqZhJe=0;//����ǰ-��ǰ���
			zjqZqJe=0;//����ǰ-�ۺ���

			zjsl=sl-zjqSl;//��������������������������ǰ����
			zqZjJe=zjhZqJe-zjqZqJe;//��������ǰ����������ǰ������ǰ��ǰ��
			zhZjJe=zjhZhJe-zjqZhJe;//�������ۺ���������ۺ������ǰ�ۺ��


			xjZjqZhJe+=zjqZhJe;
			xjZjhZhJe+=zjhZhJe;

			xjZqZjJe+=zqZjJe;
			xjZhZjJe+=zhZjJe;

			allZjhZhJe+=zjhZhJe;
			allZjqZhJe+=zjqZhJe;

			allZqZjJe+=zqZjJe;
			allZhZjJe+=zhZjJe;

			row++;

			//���ÿ������
			%> 
			  <tr bgcolor="#FFFFFF" align="center" > 
				<td><%=row%></td>
				<td ><%=xmbh%></td>
				<td><%=xmmc%></td>
				<td><%=lx%></td>
				<td><%=jldwmc%></td>

				<td><%=zcf%></td>
				<td><%=cldj%></td>
				<td><%=rgdj%></td>
				<td><%=shf%></td>
				<td><%=ysf%></td>
				<td><%=jxdj%></td>
				<td><%=qtf%></td>

				<td><%=zqdj%></td>
				<td><%=cf.formatDouble(zjsl)%></td>
				<td><%=cf.formatDouble(zhZjJe,"#########.##")%></td>
			  </tr>
			<%
		}
		ps.close();
		rs.close();

		//���С��
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td colspan="5">С ��</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td>&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(xjZhZjJe,"#########.##")%></td>
		  </tr>
		<%

	}
	rs1.close();
	ps1.close();
//����������Ϣ������������������������������������������������������������������������������������

//ɾ��������Ϣ����������������������������������������������������������������
	i=0;
	ls_sql="SELECT bj_fjxxq.jgwzbm";
	ls_sql+=" FROM bj_fjxxq ";
    ls_sql+=" where khbh='"+khbh+"' and zjxxh='"+zjxxh+"' and jgwzbm not in(SELECT jgwzbm FROM bj_fjxxh where khbh='"+khbh+"' and zjxxh='"+zjxxh+"')";
	ls_sql+=" order by bj_fjxxq.xuhao ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");

		double xjZjqZhJe=0;
		double xjZjhZhJe=0;
		double xjZhZjJe=0;
		double xjZqZjJe=0;
		
		lx="<font color=\"#CC33CC\">��ɾ������</font>";

		//�������
		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td colspan="15"> 
			  <b><i><font size="3">�ṹλ�ã�<%=jgwzmc%></font></i><font color="#CC33CC">��ɾ�����䣩</font></b>
			</td>
		  </tr>
		<%

		//�����Ŀ��ϸ
		ls_sql="SELECT bj_bjxmmxq.xh xh,trim(bj_bjxmmxq.xmbh)||DECODE(bjlx,'1','','2','��') xmbh,xmmc,jldwmc,bj_bjxmmxq.zqdj,bj_bjxmmxq.dj,bj_gclmxq.sl";
		ls_sql+=" ,bj_bjxmmxq.cldj,bj_bjxmmxq.rgdj,bj_bjxmmxq.jxdj,bj_bjxmmxq.zcf,bj_bjxmmxq.shf,bj_bjxmmxq.ysf,bj_bjxmmxq.qtf";
		ls_sql+=" FROM bj_bjxmmxq,jdm_jldwbm,bj_gclmxq  ";
		ls_sql+=" where bj_bjxmmxq.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmxq.khbh='"+khbh+"' and bj_bjxmmxq.zjxxh='"+zjxxh+"' and bj_gclmxq.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmxq.khbh=bj_gclmxq.khbh and bj_bjxmmxq.xmbh=bj_gclmxq.xmbh and bj_bjxmmxq.dqbm=bj_gclmxq.dqbm and bj_bjxmmxq.zjxxh=bj_gclmxq.zjxxh";
		ls_sql+=" order by bj_bjxmmxq.xh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			xh=cf.fillHtml(rs.getString("xh"));
			xmbh=cf.fillHtml(rs.getString("xmbh"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			zqdj=rs.getDouble("zqdj");
			dj=rs.getDouble("dj");

			cldj=rs.getDouble("cldj");
			rgdj=rs.getDouble("rgdj");
			jxdj=rs.getDouble("jxdj");
			zcf=rs.getDouble("zcf");
			shf=rs.getDouble("shf");
			ysf=rs.getDouble("ysf");
			qtf=rs.getDouble("qtf");

			zjqSl=rs.getDouble("sl");//����ǰ-����

			zjqZqJe=zjqSl*zqdj;//����ǰ-��ǰ���
			cf.round(zjqZqJe,2);
			zjqZhJe=zjqSl*dj;//����ǰ-�ۺ���
			cf.round(zjqZhJe,2);

			sl=0;//������-����
			zjhZqJe=0;//������-��ǰ���
			zjhZhJe=0;//������-�ۺ���

			zjsl=sl-zjqSl;//��������������������������ǰ����
			zqZjJe=zjhZqJe-zjqZqJe;//��������ǰ����������ǰ������ǰ��ǰ��
			zhZjJe=zjhZhJe-zjqZhJe;//�������ۺ���������ۺ������ǰ�ۺ��

			xjZjqZhJe+=zjqZhJe;
			xjZjhZhJe+=zjhZhJe;

			xjZqZjJe+=zqZjJe;
			xjZhZjJe+=zhZjJe;

			allZjhZhJe+=zjhZhJe;
			allZjqZhJe+=zjqZhJe;

			allZqZjJe+=zqZjJe;
			allZhZjJe+=zhZjJe;

			row++;
			//���ÿ������
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td ><%=row%></td>
				<td><%=xmbh%></td>
				<td><%=xmmc%></td>
				<td><%=lx%></td>
				<td><%=jldwmc%></td>

				<td><%=zcf%></td>
				<td><%=cldj%></td>
				<td><%=rgdj%></td>
				<td><%=shf%></td>
				<td><%=ysf%></td>
				<td><%=jxdj%></td>
				<td><%=qtf%></td>

				<td><%=zqdj%></td>
				<td><%=cf.formatDouble(zjsl)%></td>
				<td><%=cf.formatDouble(zqZjJe,"#########.##")%></td>
			  </tr>
			<%
		}
		ps.close();
		rs.close();

		//���С��
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td colspan="5">С ��</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td>&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td >&nbsp;</td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(xjZqZjJe,"#########.##")%></td>
		  </tr>
		<%
	}
	rs1.close();
	ps1.close();
//ɾ��������Ϣ������������������������������������������������������������������������������������
%> 
  <tr bgcolor="#FFFFFF" align="center"> 
	<td colspan="5">�� �ƣ�<%=cf.formatDouble(allZhZjJe,"#########.##")%></td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td>&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td>&nbsp;</td>
	<td><%=cf.formatDouble(allZqZjJe,"#########.##")%></td>
  </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5"> 
      <div align="center"><b><i><font size="3">�ۺ�ȡ��</font></i></b></div>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="center" width="25%" >��Ŀ����</td>
    <td align="center" width="12%" >ԭ���</td>
    <td align="center" width="12%">�½��</td>
    <td align="center" width="12%">�������</td>
    <td align="left" width="50%">&nbsp;</td>
  </tr>
  <%  
	double sfjeq=0;
	double sfjeh=0;
	double allsfjeq=0;
	double allsfjeh=0;
	allZhZjJe=0;
	String sfxmbm=null;
	String sfxmmc=null;
	String bz=null;
	String color=null;
	ls_sql="SELECT sfxmbm,sfxmmc,zqsfje,bz";
	ls_sql+=" FROM bj_sfxmmxh  ";
    ls_sql+=" where bj_sfxmmxh.khbh='"+khbh+"' and zjxxh='"+zjxxh+"'";
    ls_sql+=" order by bj_sfxmmxh.sfxmbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sfxmbm=cf.fillHtml(rs.getString("sfxmbm"));
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		bz=cf.fillHtml(rs.getString("bz"));
		sfjeh=rs.getDouble("zqsfje");

		sfjeq=0;
		ls_sql="SELECT zqsfje";
		ls_sql+=" FROM bj_sfxmmxq  ";
		ls_sql+=" where khbh='"+khbh+"' and zjxxh='"+zjxxh+"' and sfxmbm='"+sfxmbm+"'";
	//	out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sfjeq=rs1.getDouble("zqsfje");
		}
		rs1.close();
		ps1.close();

		zhZjJe=sfjeh-sfjeq;

		if (zhZjJe==0)
		{
			continue;
		}

		if (sfjeh!=sfjeq)
		{
			color="#FF0000";
		}
		else{
			color="#000000";
			continue;
		}


		allsfjeh+=sfjeh;
		allsfjeq+=sfjeq;
		allZhZjJe+=zhZjJe;

		%> 
		<tr bgcolor="#FFFFFF" align="center"> 
		<td><%=sfxmmc%></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(sfjeq,"#########.##")%></font></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(sfjeh,"#########.##")%></font></td>
		<td><font color="<%=color%>"><%=cf.formatDouble(zhZjJe,"#########.##")%></font></td>
		<td align="left" width="50%"><%=bz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%> 
  <tr bgcolor="#FFFFFF" align="center"> 
    <td>�ϼ�</td>
    <td ><%=cf.formatDouble(allsfjeq,"#########.##")%></td>
    <td><%=cf.formatDouble(allsfjeh,"#########.##")%></td>
    <td><%=cf.formatDouble(allZhZjJe,"#########.##")%></td>
    <td >&nbsp;</td>
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