<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%

String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");
String fssj=null;
String khxm=null;
double jzjje=0;
double zhguanlif=0;
double zjxsuijin=0;
double kglf=0;
double zjxrzf=0;
double zjxdjjje=0;
double kqtk=0;


double slys=0;
double dlys=0;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select crm_zjxdj.zjxxh,crm_zjxdj.khbh,crm_zjxdj.fssj,crm_khxx.khxm,jzjje,crm_zjxdj.zhguanlif,crm_zjxdj.zjxsuijin,crm_zjxdj.kglf,zjxrzf,zjxdjjje,crm_zjxdj.kqtk ";
	ls_sql+=" from  crm_zjxdj,crm_khxx";
	ls_sql+=" where crm_zjxdj.khbh=crm_khxx.khbh(+) ";
	ls_sql+=" and crm_zjxdj.zjxxh='"+zjxxh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fssj=cf.fillNull(rs.getDate("fssj"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		jzjje=rs.getDouble("jzjje");
		zhguanlif=rs.getDouble("zhguanlif");
		zjxsuijin=rs.getDouble("zjxsuijin");
		kglf=rs.getDouble("kglf");
		zjxrzf=rs.getDouble("zjxrzf");
		zjxdjjje=rs.getDouble("zjxdjjje");
		kqtk=rs.getDouble("kqtk");

	}
	rs.close();
	ps.close();


	ls_sql="SELECT sum(bj_gclmxq.sl*bj_bjxmmxq.zqdj) je";
	ls_sql+=" FROM bj_bjxmmxq,bj_gclmxq,bdm_xmdlbm ";
	ls_sql+=" where bj_bjxmmxq.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_bjxmmxq.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
	ls_sql+=" and bj_bjxmmxq.zjxxh=bj_gclmxq.zjxxh and bj_bjxmmxq.xmbh=bj_gclmxq.xmbh";
	ls_sql+=" and bj_bjxmmxq.xmdlbm='G0'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		slys=rs.getDouble("je");
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(bj_gclmxq.sl*bj_bjxmmxq.zqdj) je";
	ls_sql+=" FROM bj_bjxmmxq,bj_gclmxq,bdm_xmdlbm ";
	ls_sql+=" where bj_bjxmmxq.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_bjxmmxq.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
	ls_sql+=" and bj_bjxmmxq.zjxxh=bj_gclmxq.zjxxh and bj_bjxmmxq.xmbh=bj_gclmxq.xmbh";
	ls_sql+=" and bj_bjxmmxq.xmdlbm='H0'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dlys=rs.getDouble("je");
	}
	rs.close();
	ps.close();


%>
<html>
<head>
<title>ʩ��Ǣ�̱����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">

</head>

<body bgcolor="#FFFFFF">
<div align="center">
<p><b>
<font size="5">ʩ&nbsp;��&nbsp;Ǣ&nbsp;��&nbsp;��&nbsp;��&nbsp;�����г���֤������Ʒ�����</font>
</b></p>
</div>

<table width="100%"   border="0">
  <tr>
    <td width="50%">�ͻ����׷�����<%=khxm%></td>
    <td width="50%">����ǰ&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������&nbsp;��</td>
  </tr>
  <tr>
    <td>�������������ϼƽ�<%=cf.formatDouble(jzjje+zhguanlif+zjxsuijin+kglf+zjxrzf+zjxdjjje+kqtk)%>Ԫ</td>
    <td>������ڣ�<%=fssj%></td>
  </tr>
</table>
<HR>
<BR>
�������
<table width="100%" border="1" cellpadding="1" cellspacing="0"   style='FONT-SIZE: 14px'>
<tr bgcolor="#FFFFFF"  align="center"> 
    <td  width="10%">��Ŀ���</td>
    <td  width="40%">��Ŀ����</td>
    <td  width="10%">��λ</td>
	<td  width="10%">����</td>
    <td  width="10%">����</td>
    <td  width="20%">���</td>
  </tr>
<%

	String lx=null;
	String lxmc=null;

	double allje=0;
	double zxxj=0;

	int row=0;

	String xmbh=null;
	String xmmc=null;
	String jldwmc=null;
	double zqdj=0;
	double zqsl=0;
	double zhsl=0;
	double zjqje=0;//������Ʒǰ���
	double zjhje=0;//������Ʒ����
	//1�������ࣨ�������շ���Ŀ��أ���2�������ࣨ�������շ���Ŀ�޹أ���3��������
	ls_sql="SELECT bj_bjxmmxh.xmbh,bj_bjxmmxh.xmmc,jldwmc,bj_bjxmmxh.zqdj,sum(bj_gclmxh.sl) sl,sum(bj_gclmxh.sl*bj_bjxmmxh.zqdj) je";
	ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm,jdm_jldwbm";
	ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_bjxmmxh.xmdlbm!='G0' and bj_bjxmmxh.xmdlbm!='H0' ";
	ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
	ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
	ls_sql+=" and bj_bjxmmxh.jldwbm=jdm_jldwbm.jldwbm(+) ";
	ls_sql+=" group by bj_bjxmmxh.xmbh,bj_bjxmmxh.xmmc,jldwmc,bj_bjxmmxh.zqdj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmbh=rs.getString("xmbh");
		xmmc=rs.getString("xmmc");
		jldwmc=rs.getString("jldwmc");
		zqdj=rs.getDouble("zqdj");
		zhsl=rs.getDouble("sl");
		zjhje=rs.getDouble("je");

		zjqje=0;//������Ʒǰ���
		ls_sql="SELECT sum(bj_gclmxq.sl) sl,sum(bj_gclmxq.sl*bj_bjxmmxq.zqdj) je";
		ls_sql+=" FROM bj_bjxmmxq,bj_gclmxq";
		ls_sql+=" where bj_bjxmmxq.zjxxh='"+zjxxh+"'";
		ls_sql+=" and bj_bjxmmxq.zjxxh=bj_gclmxq.zjxxh and bj_bjxmmxq.xmbh=bj_gclmxq.xmbh";
		ls_sql+=" and bj_bjxmmxq.xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zqsl=rs1.getDouble("sl");
			zjqje=rs1.getDouble("je");
		}
		rs1.close();
		ps1.close();

		double je=0;
		double sl=0;
		if (zhsl>zqsl)//����
		{
			sl=zhsl-zqsl;
			sl=cf.round(sl,2);

			je=zjhje-zjqje;
			je=cf.round(je,2);

			%>
			<tr align="center"> 
			  <td><%=xmbh%></td>
			  <td><%=xmmc%></td>
			  <td><%=jldwmc%></td>
			  <td><%=sl%></td>
			  <td><%=zqdj%></td>
			  <td><%=je%></td>
			</tr>
			<%
		}

		zxxj+=je;
		allje+=je;

		row++;

	}
	rs.close();
	ps.close();
%>
</table>
�������<%=cf.formatDouble(zxxj)%>Ԫ

<P>
���̼��
<table width="100%" border="1" cellpadding="1" cellspacing="0"  style='FONT-SIZE: 14px'>
<tr bgcolor="#FFFFFF"  align="center"> 
    <td  width="10%">��Ŀ���</td>
    <td  width="40%">��Ŀ����</td>
    <td  width="10%">��λ</td>
	<td  width="10%">����</td>
    <td  width="10%">����</td>
    <td  width="20%">���</td>
  </tr>
<%
	double jxxj=0;

	ls_sql="SELECT bj_bjxmmxq.xmbh,bj_bjxmmxq.xmmc,jldwmc,bj_bjxmmxq.zqdj,sum(bj_gclmxq.sl) sl,sum(bj_gclmxq.sl*bj_bjxmmxq.zqdj) je";
	ls_sql+=" FROM bj_bjxmmxq,bj_gclmxq,bdm_xmdlbm,jdm_jldwbm";
	ls_sql+=" where bj_bjxmmxq.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_bjxmmxq.xmdlbm!='G0' and bj_bjxmmxq.xmdlbm!='H0' ";
	ls_sql+=" and bj_bjxmmxq.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
	ls_sql+=" and bj_bjxmmxq.zjxxh=bj_gclmxq.zjxxh and bj_bjxmmxq.xmbh=bj_gclmxq.xmbh";
	ls_sql+=" and bj_bjxmmxq.jldwbm=jdm_jldwbm.jldwbm(+) ";
	ls_sql+=" group by bj_bjxmmxq.xmbh,bj_bjxmmxq.xmmc,jldwmc,bj_bjxmmxq.zqdj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmbh=rs.getString("xmbh");
		xmmc=rs.getString("xmmc");
		jldwmc=rs.getString("jldwmc");
		zqdj=rs.getDouble("zqdj");
		zqsl=rs.getDouble("sl");
		zjqje=rs.getDouble("je");

		zjhje=0;//������Ʒ����
		ls_sql="SELECT sum(bj_gclmxh.sl) sl,sum(bj_gclmxh.sl*bj_bjxmmxh.zqdj) je";
		ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh";
		ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
		ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
		ls_sql+=" and bj_bjxmmxh.xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zhsl=rs1.getDouble("sl");
			zjhje=rs1.getDouble("je");
		}
		rs1.close();
		ps1.close();

		double je=0;
		double sl=0;
		if (zqsl>zhsl)//����
		{
			sl=zhsl-zqsl;
			sl=cf.round(sl,2);

			je=zjhje-zjqje;
			je=cf.round(je,2);

			%>
			<tr align="center"> 
			  <td><%=xmbh%></td>
			  <td><%=xmmc%></td>
			  <td><%=jldwmc%></td>
			  <td><%=sl%></td>
			  <td><%=zqdj%></td>
			  <td><%=je%></td>
			</tr>
			<%
		}

		jxxj+=je;
	}
	rs.close();
	ps.close();


%>
</table>
���̼��<%=cf.formatDouble(jxxj)%>Ԫ


<P>
��·������Ŀ�������ǰ��·�����<%=dlys%>Ԫ��
<table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
<tr bgcolor="#FFFFFF"  align="center"> 
    <td  width="10%">��Ŀ���</td>
    <td  width="40%">��Ŀ����</td>
    <td  width="10%">��λ</td>
	<td  width="10%">����</td>
    <td  width="10%">����</td>
    <td  width="20%">���</td>
  </tr>
<%
	double dlxj=0;
	ls_sql="SELECT bj_bjxmmxh.xmbh,bj_bjxmmxh.xmmc,jldwmc,bj_bjxmmxh.zqdj,sum(bj_gclmxh.sl) sl,sum(bj_gclmxh.sl*bj_bjxmmxh.zqdj) je";
	ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm,jdm_jldwbm";
	ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
	ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
	ls_sql+=" and bj_bjxmmxh.jldwbm=jdm_jldwbm.jldwbm(+) ";
	ls_sql+=" and bj_bjxmmxh.xmdlbm='H0'  and bj_gclmxh.sl!=0";
	ls_sql+=" group by bj_bjxmmxh.xmbh,bj_bjxmmxh.xmmc,jldwmc,bj_bjxmmxh.zqdj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmbh=rs.getString("xmbh");
		xmmc=rs.getString("xmmc");
		jldwmc=rs.getString("jldwmc");
		zqdj=rs.getDouble("zqdj");
		zhsl=rs.getDouble("sl");
		zjhje=rs.getDouble("je");


		%>
		<tr align="center"> 
		  <td><%=xmbh%></td>
		  <td><%=xmmc%></td>
		  <td><%=jldwmc%></td>
		  <td><%=zhsl%></td>
		  <td><%=zqdj%></td>
		  <td><%=zjhje%></td>
		</tr>
		<%

		dlxj+=zjhje;
		allje+=zjhje;

		row++;

	}
	rs.close();
	ps.close();

	%>
	<tr align="center"> 
	  <td>С ��</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td><%=dlxj%></td>
	</tr>
	<%

	dlxj=cf.round(dlxj-dlys,2);

%>
</table>
��·���������ϼƣ�<%=dlxj%>Ԫ

<P>
ˮ·������Ŀ�������ǰˮ·�����<%=slys%>Ԫ��
<table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
<tr bgcolor="#FFFFFF"  align="center"> 
    <td  width="10%">��Ŀ���</td>
    <td  width="40%">��Ŀ����</td>
    <td  width="10%">��λ</td>
	<td  width="10%">����</td>
    <td  width="10%">����</td>
    <td  width="20%">���</td>
  </tr>
<%
	double slxj=0;
	ls_sql="SELECT bj_bjxmmxh.xmbh,bj_bjxmmxh.xmmc,jldwmc,bj_bjxmmxh.zqdj,sum(bj_gclmxh.sl) sl,sum(bj_gclmxh.sl*bj_bjxmmxh.zqdj) je";
	ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm,jdm_jldwbm";
	ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
	ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
	ls_sql+=" and bj_bjxmmxh.jldwbm=jdm_jldwbm.jldwbm(+) ";
	ls_sql+=" and bj_bjxmmxh.xmdlbm='G0'  and bj_gclmxh.sl!=0";
	ls_sql+=" group by bj_bjxmmxh.xmbh,bj_bjxmmxh.xmmc,jldwmc,bj_bjxmmxh.zqdj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmbh=rs.getString("xmbh");
		xmmc=rs.getString("xmmc");
		jldwmc=rs.getString("jldwmc");
		zqdj=rs.getDouble("zqdj");
		zhsl=rs.getDouble("sl");
		zjhje=rs.getDouble("je");


		%>
		<tr align="center"> 
		  <td><%=xmbh%></td>
		  <td><%=xmmc%></td>
		  <td><%=jldwmc%></td>
		  <td><%=zhsl%></td>
		  <td><%=zqdj%></td>
		  <td><%=zjhje%></td>
		</tr>
		<%

		slxj+=zjhje;
		allje+=zjhje;

		row++;

	}
	rs.close();
	ps.close();

	%>
	<tr align="center"> 
	  <td>С ��</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td><%=slxj%></td>
	</tr>
	<%

	slxj=cf.round(slxj-slys,2);

	double qtxj=zhguanlif+zjxsuijin+kglf+zjxrzf+zjxdjjje-kqtk;

%>
</table>
ˮ·���������ϼƣ�<%=slxj%>Ԫ
<P>

����������ã�<%=cf.formatDouble(qtxj)%>
<table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
<tr bgcolor="#FFFFFF"  align="center"> 
    <td  width="25%">��Ŀ</td>
    <td  width="10%">����</td>
	<td  width="55%">���㷽��</td>
    <td  width="10%">�ϼƽ��</td>
  </tr>
<%
	double kh_glfbfb=0;
	double kh_suijinbfb=0;

	ls_sql="select glfbfb,suijinbfb";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kh_glfbfb=rs.getDouble("glfbfb");
		kh_suijinbfb=rs.getDouble("suijinbfb");
	}
	rs.close();
	ps.close();

	double djjbfb=0;
	double rzfbfb=0;
	ls_sql="select djjbfb,rzfbfb ";
	ls_sql+=" from  crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		djjbfb=rs.getDouble("djjbfb");//����ȯ�ٷֱ�
		rzfbfb=rs.getDouble("rzfbfb");//��֤�Ѱٷֱ�
	}
	rs.close();
	ps.close();

	if (zhguanlif!=0)
	{
		%>
		<tr align="center"> 
			<td>�����</td>
			<td><%=kh_glfbfb%>%</td>
			<td>���������ϼƽ��*<%=kh_glfbfb%>%</td>
			<td><%=zhguanlif%></td>
		</tr>
		<%
	}

	if (zhguanlif!=0)
	{
		%>
		<tr align="center"> 
			<td>˰��</td>
			<td><%=kh_suijinbfb%>%</td>
			<td>(���������ϼƽ��+�����)*<%=kh_suijinbfb%>%</td>
			<td><%=zjxsuijin%></td>
		</tr>
		<%
	}

	if (zjxrzf!=0)
	{
		%>
		<tr align="center"> 
			<td>������֤��</td>
			<td><%=rzfbfb%>%</td>
			<td>���̼���*<%=rzfbfb%>%</td>
			<td><%=zjxrzf%></td>
		</tr>
		<%
	}

	if (zjxdjjje!=0)
	{
		%>
		<tr align="center"> 
			<td>�������ȯ</td>
			<td><%=djjbfb%>%</td>
			<td>���̺ϼƼ���*<%=djjbfb%>%</td>
			<td><%=zjxdjjje%></td>
		</tr>
		<%
	}
%>
</table>
<table width="100%"   border="0">
	<tr>
	  <td width="25%">������</td>
	  <td width="25%">��װ���ʦ��</td>
	  <td width="25%">��Ŀ�ܼң�</td>
	  <td width="25%">�ͻ���</td>
	</tr>
	<tr>
      <td>���ڣ�</td>
	  <td>���ڣ�</td>
	  <td>���ڣ�</td>
	  <td>���ڣ�</td>
  </tr>
	<tr>
	  <td height="45" colspan="4" valign="top">��ע�� </td>
  </tr>
	<tr>
	  <td colspan="2">����ǰ����ҵ�񲿼���ȷ�ϣ�</td>
	  <td colspan="2">������ֹ�˾����һ������ȷ�ϣ�</td>
  </tr>
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
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>