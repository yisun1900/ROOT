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
double dj=0;
double sl=0;
double qye=0;
String gycl=null;
double xjqye=0;
double qxjqye=0;
double qzjqye=0;
double hzjqye=0;
double xjsl=0;
double allqye=0;
double allsl=0;

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

	//��ʼ��
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	//����ǰ�ܼ�
	//��ȡ���ӱ��۽��
	qzjqye=dzbj.getZjxQBjje(conn,khbh,zjxxh,"yz");

	//�������ܼ�
	hzjqye=dzbj.getZjxHBjje(conn,khbh,zjxxh,"yz");


%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 18px'>
<div align="center">
  <table width="100%" border="0">
    <tr> 
      <td width="48%" rowspan="2"><span lang=EN-US><img src="/images/tubiao.jpg" v:shapes="_x0000_i1025"></span><br></td>
	  <td width="20%" rowspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
      <td width="" style='FONT-SIZE: 14px'>��˾(�ܲ�)��ַ�������л��ȳǺ��ƴ�����¥  
    </tr>
    <tr>
     <td style='FONT-SIZE: 14px'>  �绰��0755-26948699 &nbsp;&nbsp;&nbsp; 0755-26948389   
    </tr>
    <tr>
      <td width="48%" style='FONT-SIZE: 19px'>http://www.szhaida.com</td>
       <td style='FONT-SIZE: 14px'> ���棺0755-26948608
    </tr>
    <tr> 
      <td colspan="4" >
        <div align="center">
          <hr>
          <b><font size="5">����ǰ��Ա�</font></b></div>
      </td>
    </tr>
  </table>
</div>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr> 
    <td>�ͻ�������<%=khxm%>(<%=lxfs%>)</td>
    <td>����ǰ����ܼƣ�<%=cf.formatDouble(qzjqye,"#########.##")%>Ԫ</td>
    <td>���������ܼƣ�<%=cf.formatDouble(hzjqye,"#########.##")%>Ԫ</td>
  </tr>
  <tr> 
    <td>���̵ص㣺<%=fwdz%></td>
    <td>�� �� ʦ��<%=sjs%></td>
    <td>���̵ȼ���<%=bjjb%></td>
  </tr>
</table>


<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"> 
    <td  width="4%" align="center">���</td>
    <td  width="7%" align="center">��Ŀ���</td>
    <td  width="15%" align="center">��Ŀ����</td>
    <td  width="7%" align="center">��λ</td>
    <td  width="8%" align="center">���ۣ�Ԫ��</td>
    <td  width="6%" align="center">����ǰ����</td>
    <td  width="8%" align="center">����ǰ��Ԫ��</td>
    <td  width="6%" align="center">����������</td>
    <td  width="8%" align="center">�������Ԫ��</td>
    <td  width="45%" align="center">��������������˵��</td>
  </tr>

<%
//ԭ�С�δɾ��������Ϣ����������������������������������������������������������������
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

		xjsl=0;
		xjqye=0;
		qxjqye=0;
		
		//�������
		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td colspan="10"> 
			  <div align="center"><b><i><font size="3">�ṹλ�ã�<%=jgwzmc%></font></i></b></div>
			</td>
		  </tr>
		<%

		//�����������Ŀ��ϸ
		ls_sql="SELECT bj_bjxmmxh.xh xh,trim(bj_bjxmmxh.xmbh)||DECODE(bjlx,'1','','2','��') xmbh,xmmc,jldwmc,bj_bjxmmxh.dj,bj_gclmxh.sl,bj_gclmxh.sl*bj_bjxmmxh.dj as je,gycl";
		ls_sql+=" FROM bj_bjxmmxh,jdm_jldwbm,bj_gclmxh,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmxh.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmxh.khbh='"+khbh+"' and bj_gclmxh.jgwzbm='"+jgwzmc+"' and bj_bjxmmxh.zjxxh='"+zjxxh+"' and bj_gclmxh.zjxxh='"+zjxxh+"'";
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
			xmmc=cf.fillHtml(rs.getString("xmmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			dj=rs.getDouble("dj");
			sl=rs.getDouble("sl");
			qye=rs.getDouble("je");
			gycl=cf.fillHtml(rs.getString("gycl"));



			//��ȡ����ǰ��Ŀ��ϸ
			double qsl=0;
			double qje=0;

			ls_sql="SELECT sl,sl*"+dj;
			ls_sql+=" FROM bj_gclmxq ";
			ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzmc+"' and xmbh='"+xmbh+"' and zjxxh='"+zjxxh+"'";
		//	out.println(ls_sql);
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				qsl=rs2.getDouble(1);
				qje=rs2.getDouble(2);
			}
			rs2.close();
			ps2.close();

			qxjqye+=qje;


			xjsl+=sl;
			xjqye+=qye;
			allsl+=sl;
			allqye+=qye;

			//�ж��������
			if (sl>qsl && qsl==0)
			{
				xmmc="<font color=\"#FF0000\">"+xmmc+"������++��</font>";
			}
			else if (sl>qsl && qsl!=0)
			{
				xmmc="<font color=\"#990000\">"+xmmc+"������++��</font>";
			}
			else if (sl<qsl){
				if (qsl!=sl)
				{
					xmmc="<font color=\"#0000CC\">"+xmmc+"������--��</font>";
				}
			}

			row++;
			//���ÿ������
			%> 
			  <tr bgcolor="#FFFFFF"> 
				<td align="center" width="4%"><%=row%></td>
				<td align="center" width="8%"><%=xmbh%></td>
				<td align="center" width="15%"><%=xmmc%></td>
				<td align="center" width="6%"><%=jldwmc%></td>
				<td align="center" width="8%"><%=dj%></td>
				<td align="center" width="6%"><%=cf.formatDouble(qsl)%></td>
				<td align="center" width="8%"><%=cf.formatDouble(qje,"#########.##")%></td>
				<td align="center" width="6%"><%=cf.formatDouble(sl)%></td>
				<td align="center" width="8%"><%=cf.formatDouble(qye,"#########.##")%></td>
				<td align="left" width="45%"><%=gycl%></td>
			  </tr>
			<%
		}
		rs.close();
		ps.close();


		//�����ɾ����Ŀ��ϸ
		ls_sql="SELECT bj_bjxmmxq.xh xh,trim(bj_bjxmmxq.xmbh)||DECODE(bjlx,'1','','2','��') xmbh,xmmc,jldwmc,bj_bjxmmxq.dj,bj_gclmxq.sl,bj_gclmxq.sl*bj_bjxmmxq.dj as je,gycl";
		ls_sql+=" FROM bj_bjxmmxq,jdm_jldwbm,bj_gclmxq,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmxq.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmxq.khbh='"+khbh+"' and bj_gclmxq.jgwzbm='"+jgwzmc+"' and bj_bjxmmxq.zjxxh='"+zjxxh+"' and bj_gclmxq.zjxxh='"+zjxxh+"'";
		ls_sql+=" and bj_bjxmmxq.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmxq.khbh=bj_gclmxq.khbh and bj_bjxmmxq.dqbm=bj_gclmxq.dqbm and bj_bjxmmxq.xmbh=bj_gclmxq.xmbh";
		ls_sql+=" and bj_bjxmmxq.xmbh not in(select xmbh from bj_bjxmmxh where zjxxh='"+zjxxh+"' )";
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
			dj=rs.getDouble("dj");
			sl=rs.getDouble("sl");
			qye=rs.getDouble("je");
			gycl=cf.fillHtml(rs.getString("gycl"));

			xmmc="<font color=\"#CC33CC\">"+xmmc+"��ɾ��--��</font>";

			qxjqye+=qye;

			row++;
			//���ÿ������
			%> 
			  <tr bgcolor="#FFFFFF"> 
				<td align="center" width="4%"><%=row%></td>
				<td align="center" width="8%"><%=xmbh%></td>
				<td align="center" width="15%"><%=xmmc%></td>
				<td align="center" width="6%"><%=jldwmc%></td>
				<td align="center" width="8%"><%=dj%></td>
				<td align="center" width="6%">0</td>
				<td align="center" width="8%">0</td>
				<td align="center" width="6%"><%=cf.formatDouble(sl)%></td>
				<td align="center" width="8%"><%=cf.formatDouble(qye,"#########.##")%></td>
				<td align="left" width="45%"><%=gycl%></td>
			  </tr>
			<%
		}
		ps.close();
		rs.close();


		//���С��
		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td align="center" colspan="5">С ��</td>
			<td align="center" width="6%">&nbsp;</td>
			<td align="center" width="8%"><%=cf.formatDouble(qxjqye,"#########.##")%>Ԫ</td>
			<td align="center" width="6%">&nbsp;</td>
			<td align="center" width="8%"><%=cf.formatDouble(xjqye,"#########.##")%>Ԫ</td>
			<td align="left" width="45%">&nbsp;</td>
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

		xjsl=0;
		xjqye=0;
		
		//�������
		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td colspan="10"> 
			  <div align="center"><b><i><font size="3">�ṹλ�ã�<%=jgwzmc%></font></i><font color="#FF0000">������++��</font></b></div>
			</td>
		  </tr>
		<%

		//�����Ŀ��ϸ
		ls_sql="SELECT bj_bjxmmxh.xh xh,trim(bj_bjxmmxh.xmbh)||DECODE(bjlx,'1','','2','��') xmbh,xmmc,jldwmc,bj_bjxmmxh.dj,bj_gclmxh.sl,bj_gclmxh.sl*bj_bjxmmxh.dj as je,gycl";
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
			dj=rs.getDouble("dj");
			sl=rs.getDouble("sl");
			qye=rs.getDouble("je");
			gycl=cf.fillHtml(rs.getString("gycl"));


			xjsl+=sl;
			xjqye+=qye;
			allsl+=sl;
			allqye+=qye;

			row++;
			//���ÿ������
			%> 
			  <tr bgcolor="#FFFFFF"> 
				<td align="center" width="4%"><%=row%></td>
				<td align="center" width="7%"><%=xmbh%></td>
				<td align="center" width="15%"><%=xmmc%></td>
				<td align="center" width="7%"><%=jldwmc%></td>
				<td align="center" width="8%"><%=dj%></td>
				<td align="center" width="6%"><%=cf.formatDouble(sl)%></td>
				<td align="center" width="6%">0</td>
				<td align="center" width="8%">0</td>
				<td align="center" width="8%"><%=cf.formatDouble(qye,"#########.##")%></td>
				<td align="left" width="45%"><%=gycl%></td>
			  </tr>
			<%
		}
		ps.close();
		rs.close();

		//���С��
		%> 
		  <tr bgcolor="#FFFFFF" align="right"> 
			<td colspan="10"><b><i><font size="3"><%=oldjgwzmc%>С�ƣ�<%=cf.formatDouble(xjqye,"#########.##")%>Ԫ&nbsp;&nbsp;&nbsp;&nbsp;</font></i></b></td>
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

		xjsl=0;
		xjqye=0;
		
		//�������
		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td colspan="10"> 
			  <div align="center"><b><i><font size="3">�ṹλ�ã�<%=jgwzmc%></font></i><font color="#CC33CC">��ɾ��--��</font></b></div>
			</td>
		  </tr>
		<%

		//�����Ŀ��ϸ
		ls_sql="SELECT bj_bjxmmxq.xh xh,trim(bj_bjxmmxq.xmbh)||DECODE(bjlx,'1','','2','��') xmbh,xmmc,jldwmc,bj_bjxmmxq.dj,bj_gclmxq.sl,bj_gclmxq.sl*bj_bjxmmxq.dj as je,gycl";
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
			dj=rs.getDouble("dj");
			sl=rs.getDouble("sl");
			qye=rs.getDouble("je");
			gycl=cf.fillHtml(rs.getString("gycl"));


			xjsl+=sl;
			xjqye+=qye;
			allsl+=sl;
			allqye+=qye;

			row++;
			//���ÿ������
			%> 
			  <tr bgcolor="#FFFFFF"> 
				<td align="center" width="4%"><%=row%></td>
				<td align="center" width="7%"><%=xmbh%></td>
				<td align="center" width="15%"><%=xmmc%></td>
				<td align="center" width="7%"><%=jldwmc%></td>
				<td align="center" width="8%"><%=dj%></td>
				<td align="center" width="6%"><%=cf.formatDouble(sl)%></td>
				<td align="center" width="8%"><%=dj%></td>
				<td align="center" width="6%">0</td>
				<td align="center" width="8%">0</td>
				<td align="left" width="45%"><%=gycl%></td>
			  </tr>
			<%
		}
		ps.close();
		rs.close();

		//���С��
		%> 
		  <tr bgcolor="#FFFFFF" align="right"> 
			<td colspan="10"><b><i><font size="3"><%=oldjgwzmc%>С�ƣ�<%=cf.formatDouble(xjqye,"#########.##")%>Ԫ&nbsp;&nbsp;&nbsp;&nbsp;</font></i></b></td>
		  </tr>
		<%
	
	}
	rs1.close();
	ps1.close();
//ɾ��������Ϣ������������������������������������������������������������������������������������
%> 
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5"> 
      <div align="center"><b><i><font size="3">�����շ���Ŀ</font></i></b></div>
    </td>
  </tr>
  <%  
	double sfje=0;
	double allsfje=0;
	String sfxmmc=null;
	String bz=null;
	ls_sql="SELECT sfxmmc,sfje,bz";
	ls_sql+=" FROM bj_sfxmmxh  ";
    ls_sql+=" where bj_sfxmmxh.khbh='"+khbh+"' and zjxxh='"+zjxxh+"'";
    ls_sql+=" order by bj_sfxmmxh.sfxmbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		bz=cf.fillHtml(rs.getString("bz"));
		sfje=rs.getDouble("sfje");

		allsfje+=sfje;

		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td align="center" width="11%" >&nbsp;</td>
			<td align="center" width="15%" ><%=sfxmmc%></td>
			<td align="center" width="21%" >&nbsp;</td>
			<td align="center" width="8%"><%=cf.formatDouble(sfje,"#########.##")%></td>
			<td align="left" width="45%"><%=bz%></td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();
%> 
  <tr bgcolor="#FFFFFF" align="right"> 
    <td colspan="5"><i><b><font size="3">�����շ�С�ƣ�<%=cf.formatDouble(allsfje,"#########.##")%>Ԫ&nbsp;&nbsp;&nbsp;&nbsp;</font></b></i></td>
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