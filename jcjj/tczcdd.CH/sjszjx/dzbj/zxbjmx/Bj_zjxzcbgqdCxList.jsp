<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
String zjxxh=request.getParameter("zjxxh");
String khbh=request.getParameter("khbh");

String khxm=null;
String lxfs=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwmc=null;
String clgw=null;
String sgdmc=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String clxlmc=null;
String ppmc=null;
String bjjbmc=null;
String bjjbbm=null;
String xh=null;
String gg=null;
double dj=0;
String jldw=null;
double sl=0;
double je=0;
String ptcpsm=null;
String zclx=null;
String ddcljjfs=null;
String jgwzbm=null;
String tccplbbm=null;

double allsl=0;
double allje=0;
	String bjjb=null;

try {
	conn=cf.getConnection();


	ls_sql="SELECT hth,khxm,lxfs,fwdz,sjs,crm_khxx.bjjb,bjjbmc,sgdmc,dwmc,clgw";
	ls_sql+=" FROM crm_khxx,bdm_bjjbbm,sq_sgd,sq_dwxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth=cf.fillHtml(rs.getString("hth"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjbmc=cf.fillHtml(rs.getString("bjjbmc"));
		bjjb=rs.getString("bjjb");
		dwmc=cf.fillHtml(rs.getString("dwmc"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		clgw=cf.fillHtml(rs.getString("clgw"));
	}
	rs.close();
	ps.close();
%>

<html>
<head>
<style type="text/css">
<!--
.STYLE2 {font-size: 18px}
-->
</style>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
  <table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#FFFFFF">
      <td height="29" colspan="3" align="center" class="STYLE2" ><B>����ײ����ı����</B></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="37%" height="30"  >�ͻ�������<%=khxm%></td>
      <td width="40%"   >�ͻ��绰��<%=lxfs%></td>
      <td width="23%" >��ͬ�ţ�<%=hth%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="31"  >�ͻ���ַ��<%=fwdz%></td>
      <td  >ǩԼ����/���ʦ��<%=dwmc%>/<%=sjs%></td>
      <td  >���ۼ���<%=bjjbmc%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="29"  >ʩ���ӣ�<%=sgdmc%></td>
      <td  >���Ϲ��ʣ�<%=clgw%></td>
      <td  >&nbsp;</td>
    </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">��Ʒ���</td>
	<td  width="4%">Ʒ��</td>
	<td  width="2%">���ۼ���</td>
	<td  width="4%">�ͺ�</td>
	<td  width="4%">���</td>
	<td  width="2%">������λ</td>
	<td  width="2%">����</td>
	<td  width="2%">����</td>
	<td  width="3%">���</td>
	<td  width="8%">���ײ�Ʒ˵��</td>
</tr>
<%

		//�ͻ��ۿ�
	double zcsjzk=10;
	double zcjmzk=10;
	double zcsfzk=10;
	ls_sql="select zcsjzk,zcjmzk,zcsfzk ";
	ls_sql+=" from crm_khzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcsjzk=rs.getDouble("zcsjzk");
		zcjmzk=rs.getDouble("zcjmzk");
		zcsfzk=rs.getDouble("zcsfzk");
	}
	rs.close();
	ps.close();

	//���շ�����
	dzbj.Tc tc=new dzbj.Tc();
	double xsfzc=0;
	xsfzc=tc.getXsfzcZjx(conn,zjxxh,khbh,"yz");//��ȡ:���շ�����


	ls_sql="SELECT jxc_clxlbm.clxlmc,bj_zjxzcbgqd.ppmc,bj_zjxzcbgqd.bjjbbm,bdm_bjjbbm.bjjbmc,bj_zjxzcbgqd.xh,bj_zjxzcbgqd.gg,bj_zjxzcbgqd.dj,bj_zjxzcbgqd.jldw,bj_zjxzcbgqd.sl,ROUND(bj_zjxzcbgqd.dj*bj_zjxzcbgqd.sl,2) je,bj_zjxzcbgqd.ptcpsm";
	ls_sql+=" ,bj_zjxzcbgqd.zclx,bj_zjxzcbgqd.ddcljjfs,bj_zjxzcbgqd.jgwzbm,bj_zjxzcbgqd.tccplbbm ";
	ls_sql+=" FROM bdm_bjjbbm,bj_zjxzcbgqd,jxc_clxlbm  ";
	ls_sql+=" where bj_zjxzcbgqd.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and bj_zjxzcbgqd.tccplbbm=jxc_clxlbm.clxlbm(+)";
	ls_sql+=" and bj_zjxzcbgqd.khbh='"+khbh+"' and bj_zjxzcbgqd.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_zjxzcbgqd.tclx='1'";//1���ײͣ�2�������ײ�
	ls_sql+=" order by bj_zjxzcbgqd.ppmc,bj_zjxzcbgqd.xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		clxlmc=cf.fillHtml(rs.getString("clxlmc"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		bjjbmc=cf.fillHtml(rs.getString("bjjbmc"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		dj=rs.getDouble("dj");
		jldw=cf.fillNull(rs.getString("jldw"));
		sl=rs.getDouble("sl");
		je=rs.getDouble("je");
		ptcpsm=cf.fillHtml(rs.getString("ptcpsm"));
		zclx=cf.fillNull(rs.getString("zclx"));
		ddcljjfs=cf.fillNull(rs.getString("ddcljjfs"));
		jgwzbm=cf.fillNull(rs.getString("jgwzbm"));
		tccplbbm=cf.fillNull(rs.getString("tccplbbm"));

		//����������ۺ����
		if (xsfzc<0)
		{
			dj=cf.round(dj*zcsfzk/10,2);
			je=cf.round(je*zcsfzk/10,2);
		}


		if (zclx.equals("1") || zclx.equals("2"))//1���ײ��ڣ�2���ײ��⣻3�������ײ��ڣ�4�������ײ���
		{
			if (!bjjbbm.equals(bjjb))//����������
			{

				double sjcjQ=0;
				String bjjbbmQ="";
				double sjsfjeQ=0;
				ls_sql="SELECT sjcj,bjjbbm,sjsfje";
				ls_sql+=" FROM bj_khzcxmxjq ";
				ls_sql+=" where khbh='"+khbh+"' and zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
				ls_sql+=" and sfyxsj='Y' ";//�����Ƿ��շ�  Y���ǣ�N����
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					sjcjQ=rs1.getDouble("sjcj");
					bjjbbmQ=cf.fillNull(rs1.getString("bjjbbm"));
					sjsfjeQ=rs1.getDouble("sjsfje");
				}
				rs1.close();
				ps1.close();

				double sjcjH=0;
				String bjjbbmH="";
				double sjsfjeH=0;
				ls_sql="SELECT sjcj,bjjbbm,sjsfje";
				ls_sql+=" FROM bj_khzcxmxjh ";
				ls_sql+=" where khbh='"+khbh+"' and zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
				ls_sql+=" and sfyxsj='Y' ";//�����Ƿ��շ�  Y���ǣ�N����
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					sjcjH=rs1.getDouble("sjcj");
					bjjbbmH=cf.fillNull(rs1.getString("bjjbbm"));
					sjsfjeH=rs1.getDouble("sjsfje");
				}
				rs1.close();
				ps1.close();

				double sjcj=0;
				if (!bjjbbmQ.equals(bjjbbmH))//�������仯�����շ�
				{
					if (sl<0)//����:���Ż��ۿۼ���,�������Ż�
					{
						//�Ƿ�Ʒ�������Ż�
						int isPpsjcj=0;
						ls_sql="SELECT count(*)";
						ls_sql+=" FROM bj_khppsjcjb";
						ls_sql+=" where ppmc='"+ppmc+"' and khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
						ps1= conn.prepareStatement(ls_sql);
						rs1 =ps1.executeQuery();
						if (rs1.next())
						{
							isPpsjcj=rs1.getInt(1);
						}
						rs1.close();
						ps1.close();

						if (isPpsjcj>0)//������ʱ���д�Ʒ�������Ż�
						{
							ls_sql="SELECT sjcj";
							ls_sql+=" FROM bj_khppsjcjb";
							ls_sql+=" where ppmc='"+ppmc+"' and khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
							ps1= conn.prepareStatement(ls_sql);
							rs1 =ps1.executeQuery();
							if (rs1.next())
							{
								sjcj=rs1.getDouble("sjcj");
							}
							rs1.close();
							ps1.close();
						}
						else{
							sjcj=sjcjQ;
						}

						sjcj=cf.round(sjcj*zcsjzk/10,2);//�������
					}
					else{
						sjcj=sjcjH;
					}
				}
					

				dj+=sjcj;//�������շ����ļ۸�
				dj=cf.round(dj,2);

				je=cf.round(dj*sl,2);
			}
		}
		
		
		
		allsl+=sl;
		allje+=je;
		allsl=cf.round(allsl,2);
		allje=cf.round(allje,2);

		if (zclx.equals("3") || zclx.equals("4"))//1���ײ��ڣ�2���ײ��⣻3�������ײ��ڣ�4�������ײ���
		{
			if (ddcljjfs.equals("1") || ddcljjfs.equals("2"))//0���Ƕ�����ϣ�1�����䣨����ۣ���2�����䣨�����Ƽۣ���3���ײ�ѡ��
			{
				bjjbmc="��������";
			}
			else{
				bjjbmc="ѡ��";
			}
		}

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td><%=clxlmc%></td>
			<td><%=ppmc%></td>
			<td><%=bjjbmc%></td>
			<td><%=xh%></td>
			<td><%=gg%></td>
			<td><%=jldw%></td>
			<td><%=sl%></td>
			<td><%=dj%></td>
			<td><%=je%></td>
			<td><%=ptcpsm%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%>
<tr bgcolor="#FFFFFF"  align="center">
	<td>С��</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td><%=allsl%></td>
	<td>&nbsp;</td>
	<td><%=allje%></td>
	<td>&nbsp;</td>
</tr>
</table>

<%
	double alljmjeq=0;	
	ls_sql="SELECT sum(sjjmje)";
	ls_sql+=" FROM bj_khzcxmxjq ";
    ls_sql+=" where zjxxh='"+zjxxh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		alljmjeq=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double alljmjeh=0;	
	ls_sql="SELECT sum(sjjmje)";
	ls_sql+=" FROM bj_khzcxmxjh ";
    ls_sql+=" where zjxxh='"+zjxxh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		alljmjeh=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double sjjmslBgq=0;
	double sjjmjeBgq=0;
	double sjjmslBgh=0;
	double sjjmjeBgh=0;

	if (alljmjeh!=alljmjeq)
	{
		%>
		<center>���ǰ�����嵥</center>
		<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="8%">�ռ�</td>
			<td  width="12%">��Ʒ���</td>
			<td  width="8%">�Ƿ���������</td>
			<td  width="8%">������λ</td>
			<td  width="8%">��׼����</td>
			<td  width="8%">���������λ</td>
			<td  width="8%">���ⵥ��</td>
			<td  width="8%">��������</td>
			<td  width="8%">������</td>

		  </tr>
		<%
			String jgwzmc=null;
			String tccplbmc=null;
		//	String jldw=null;
			String sfxzsl=null;
			double bzsl=0;
			String jmjldw=null;
			double jmdj=0;
			double sjjmsl=0;
			double sjjmje=0;


			ls_sql="SELECT jgwzbm,clxlmc,DECODE(bj_khzcxmxjq.sfxzsl,'1','������Ӽ�','2','���ɳ���','3','����������') sfxzsl,jldw,jmjldw,bzsl,jmdj,sjjmsl,sjjmje";
			ls_sql+=" FROM bj_khzcxmxjq,jxc_clxlbm ";
			ls_sql+=" where bj_khzcxmxjq.tccplbbm=jxc_clxlbm.clxlbm";
			ls_sql+=" and bj_khzcxmxjq.zjxxh='"+zjxxh+"' ";
			ls_sql+=" and bj_khzcxmxjq.sjjmsl>0";
			ls_sql+=" order by bj_khzcxmxjq.jgwzbm,bj_khzcxmxjq.tccplbbm";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			while (rs.next())
			{
				jgwzmc=rs.getString("jgwzbm");
				tccplbmc=rs.getString("clxlmc");
				sfxzsl=rs.getString("sfxzsl");
				jldw=rs.getString("jldw");
				jmjldw=rs.getString("jmjldw");


				bzsl=rs.getDouble("bzsl");
				jmdj=rs.getDouble("jmdj");
				sjjmsl=rs.getDouble("sjjmsl");

				sjjmje=rs.getDouble("sjjmje");


				sjjmslBgq+=sjjmsl;
				sjjmjeBgq+=sjjmje;
				
				sjjmslBgq=cf.round(sjjmslBgq,2);
				sjjmjeBgq=cf.round(sjjmjeBgq,2);
				

				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF"  align="center"> 
					<td ><%=jgwzmc%></td>
				
					<td><%=tccplbmc%></td>
					<td><%=sfxzsl%></td>
					<td><%=jldw%></td>
					<td><%=bzsl%></td>
					<td><%=jmjldw%></td>
					<td><%=cf.formatDouble(jmdj*zcjmzk/10)%></td>
					<td><%=cf.formatDouble(sjjmsl)%></td>
					<td><%=cf.formatDouble(sjjmje*zcjmzk/10)%></td>
				  </tr>
				  
			
				<%
			}
			rs.close();
			ps.close();
		%> 
				
		  <tr bgcolor="#FFFFFF"  align="center"> 
			<td colspan="2">�ϼ�</td>

			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(sjjmslBgq)%></td>
			<td><%=cf.formatDouble(sjjmjeBgq*zcjmzk/10)%></td>
		   </tr>

		</table>



		<center>���������嵥</center>
		<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="8%">�ռ�</td>
			<td  width="12%">��Ʒ���</td>
			<td  width="8%">�Ƿ���������</td>
			<td  width="8%">������λ</td>
			<td  width="8%">��׼����</td>
			<td  width="8%">���������λ</td>
			<td  width="8%">���ⵥ��</td>
			<td  width="8%">��������</td>
			<td  width="8%">������</td>
		  </tr>

			
		<%

			ls_sql="SELECT jgwzbm,clxlmc,DECODE(bj_khzcxmxjh.sfxzsl,'1','������Ӽ�','2','���ɳ���','3','����������') sfxzsl,jldw,jmjldw,bzsl,jmdj,sjjmsl,sjjmje";
			ls_sql+=" FROM bj_khzcxmxjh,jxc_clxlbm ";
			ls_sql+=" where bj_khzcxmxjh.tccplbbm=jxc_clxlbm.clxlbm";
			ls_sql+=" and bj_khzcxmxjh.zjxxh='"+zjxxh+"' ";
			ls_sql+=" and bj_khzcxmxjh.sjjmsl>0";
			ls_sql+=" order by bj_khzcxmxjh.jgwzbm,bj_khzcxmxjh.tccplbbm";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			while (rs.next())
			{
				jgwzmc=rs.getString("jgwzbm");
				tccplbmc=rs.getString("clxlmc");
				sfxzsl=rs.getString("sfxzsl");
				jldw=rs.getString("jldw");
				jmjldw=rs.getString("jmjldw");


				bzsl=rs.getDouble("bzsl");
				jmdj=rs.getDouble("jmdj");
				sjjmsl=rs.getDouble("sjjmsl");

				sjjmje=rs.getDouble("sjjmje");


				sjjmslBgh+=sjjmsl;
				sjjmjeBgh+=sjjmje;
				
				sjjmslBgh=cf.round(sjjmslBgh,2);
				sjjmjeBgh=cf.round(sjjmjeBgh,2);

				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF"  align="center"> 
					<td ><%=jgwzmc%></td>
				
					<td><%=tccplbmc%></td>
					<td><%=sfxzsl%></td>
					<td><%=jldw%></td>
					<td><%=bzsl%></td>
					<td><%=jmjldw%></td>
					<td><%=cf.formatDouble(jmdj*zcjmzk/10)%></td>
					<td><%=cf.formatDouble(sjjmsl)%></td>
					<td><%=cf.formatDouble(sjjmje*zcjmzk/10)%></td>
				  </tr>
				  
			
				<%
			}
			rs.close();
			ps.close();
		%> 
				
		  <tr bgcolor="#FFFFFF"  align="center"> 
			<td colspan="2">�ϼ�</td>

			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(sjjmslBgh)%></td>
			<td><%=cf.formatDouble(sjjmjeBgh*zcjmzk/10)%></td>
		   </tr>

		</table>
		<%
	}

%>


<center>�����ײͱ��</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
    <td  width="15%" >�ײ�����</td>
    <td  width="8%" >�۸�</td>
    <td  width="15%" >��Ʒ����</td>
    <td  width="15%" >Ʒ��</td>
    <td  width="20%" >�ͺ�</td>
	<td  width="15%" >���</td>
    <td  width="6%" >��λ</td>
    <td  width="6%" >����</td>
  </tr>

	
<%
	int i=0;
	String tcbm=null;
	String tcmc=null;
	double yj=0;
	double tcj=0;
	double alltcj=0;
	String bz=null;
	ls_sql="SELECT tcbm,tcmc,yj,tcj,bz";
	ls_sql+=" FROM bj_khzctcmch ";
    ls_sql+=" where zjxxh='"+zjxxh+"' ";
	ls_sql+=" order by tcbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		tcbm=rs.getString("tcbm");
		tcmc=rs.getString("tcmc");
		yj=rs.getDouble("yj");
		tcj=rs.getDouble("tcj");
		bz=cf.fillHtml(rs.getString("bz"));

		int zjx=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khzctcmcq ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and tcbm='"+tcbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zjx=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (zjx!=0)
		{
			continue;
		}

		alltcj+=tcj;

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khzctcmxh";
		ls_sql+=" where zjxxh='"+zjxxh+"'";
		ls_sql+=" and tcbm='"+tcbm+"'";
		ls_sql+=" order by cpbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count==0)
		{
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td ><%=tcmc%></td>
				<td ><%=tcj%></td>
				<td colspan="6" align="left"><B>δѡ������</B></td>
			  </tr>
			<%
			continue;
		}

		String cpbm=null;
		String cpmc=null;
//		String ppmc=null;
//		String xh=null;
//		String gg=null;
//		String jldw=null;
//		double sl=0;
		ls_sql="SELECT cpbm,cpmc,ppmc,xh,gg,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,lrr,lrsj,bz";
		ls_sql+=" FROM bj_khzctcmxh";
		ls_sql+=" where zjxxh='"+zjxxh+"'";
		ls_sql+=" and tcbm='"+tcbm+"'";
		ls_sql+=" order by cpbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cpbm=rs1.getString("cpbm");
			cpmc=rs1.getString("cpmc");
			ppmc=rs1.getString("ppmc");
			xh=cf.fillNull(rs1.getString("xh"));
			gg=cf.fillHtml(rs1.getString("gg"));
			jldw=rs1.getString("jldw");
			sl=rs1.getDouble("sl");

			if (sl==0)
			{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td rowspan="<%=count%>"><%=tcmc%></td>
					<td rowspan="<%=count%>"><%=tcj%></td>
					<td><%=cpmc%></td>
					<td colspan="5" align="left"><B>δѡ������</B></td>
				  </tr>
				<%
			}
			else{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td rowspan="<%=count%>"><%=tcmc%></td>
					<td rowspan="<%=count%>"><%=tcj%></td>
					<td><%=cpmc%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=jldw%></td>
					<td><%=cf.formatDouble(sl)%></td>
				  </tr>
				<%
			}


		}

		while (rs1.next())
		{
			cpbm=rs1.getString("cpbm");
			cpmc=rs1.getString("cpmc");
			ppmc=rs1.getString("ppmc");
			xh=cf.fillNull(rs1.getString("xh"));
			gg=cf.fillHtml(rs1.getString("gg"));
			jldw=rs1.getString("jldw");
			sl=rs1.getDouble("sl");

			if (sl==0)
			{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td><%=cpmc%></td>
					<td colspan="5" align="left"><B>δѡ������</B></td>
				  </tr>
				<%
			}
			else{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td><%=cpmc%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=jldw%></td>
					<td><%=cf.formatDouble(sl)%></td>
				  </tr>
				<%
			}

		}
		rs1.close();
		ps1.close();
	}
	rs.close();
	ps.close();

	ls_sql="SELECT tcbm,tcmc,yj,tcj,bz";
	ls_sql+=" FROM bj_khzctcmcq ";
    ls_sql+=" where zjxxh='"+zjxxh+"' ";
	ls_sql+=" order by tcbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		tcbm=rs.getString("tcbm");
		tcmc=rs.getString("tcmc");
		yj=rs.getDouble("yj");
		tcj=rs.getDouble("tcj");
		bz=cf.fillHtml(rs.getString("bz"));

		tcj=-1*tcj;

		int zjx=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khzctcmch ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and tcbm='"+tcbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zjx=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (zjx!=0)
		{
			continue;
		}

		alltcj+=tcj;

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khzctcmxq";
		ls_sql+=" where zjxxh='"+zjxxh+"'";
		ls_sql+=" and tcbm='"+tcbm+"'";
		ls_sql+=" order by cpbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count==0)
		{
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td ><%=tcmc%></td>
				<td ><%=tcj%></td>
				<td colspan="6" align="left"><B>δѡ������</B></td>
			  </tr>
			<%
			continue;
		}

		String cpbm=null;
		String cpmc=null;
//		String ppmc=null;
//		String xh=null;
//		String gg=null;
//		String jldw=null;
//		double sl=0;
		ls_sql="SELECT cpbm,cpmc,ppmc,xh,gg,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,lrr,lrsj,bz";
		ls_sql+=" FROM bj_khzctcmxq";
		ls_sql+=" where zjxxh='"+zjxxh+"'";
		ls_sql+=" and tcbm='"+tcbm+"'";
		ls_sql+=" order by cpbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cpbm=rs1.getString("cpbm");
			cpmc=rs1.getString("cpmc");
			ppmc=rs1.getString("ppmc");
			xh=cf.fillNull(rs1.getString("xh"));
			gg=cf.fillHtml(rs1.getString("gg"));
			jldw=rs1.getString("jldw");
			sl=rs1.getDouble("sl");

			if (sl==0)
			{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td rowspan="<%=count%>"><%=tcmc%></td>
					<td rowspan="<%=count%>"><%=tcj%></td>
					<td><%=cpmc%></td>
					<td colspan="5" align="left"><B>δѡ������</B></td>
				  </tr>
				<%
			}
			else{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td rowspan="<%=count%>"><%=tcmc%></td>
					<td rowspan="<%=count%>"><%=tcj%></td>
					<td><%=cpmc%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=jldw%></td>
					<td><%=cf.formatDouble(sl)%></td>
				  </tr>
				<%
			}


		}

		while (rs1.next())
		{
			cpbm=rs1.getString("cpbm");
			cpmc=rs1.getString("cpmc");
			ppmc=rs1.getString("ppmc");
			xh=cf.fillNull(rs1.getString("xh"));
			gg=cf.fillHtml(rs1.getString("gg"));
			jldw=rs1.getString("jldw");
			sl=rs1.getDouble("sl");

			if (sl==0)
			{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td><%=cpmc%></td>
					<td colspan="5" align="left"><B>δѡ������</B></td>
				  </tr>
				<%
			}
			else{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td><%=cpmc%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=jldw%></td>
					<td><%=cf.formatDouble(sl)%></td>
				  </tr>
				<%
			}

		}
		rs1.close();
		ps1.close();
	}
	rs.close();
	ps.close();


%> 
  		
  <tr bgcolor="#FFFFFF" align="center"> 
	<td><B>С ��</B></td>
	<td><B><%=alltcj%></B></td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
  </tr>

  <tr bgcolor="#FFFFFF" align="center"> 
	<td><B>������ܼ�</B></td>
	<td><B><%=cf.round(alltcj+allje+(sjjmjeBgq-sjjmjeBgh)*zcjmzk/10,2)%></B></td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
  </tr>

</table>

<%
}
catch (Exception e) {
	out.print("��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
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
<BR>
˵����&nbsp;1���˵�������ǩ���󣬹˿Ͷ�ԭǩԼ�ײ����Ľ��б��ʱʹ�á�ʵ�ʰ�װ�����Ա������ȷ�ϲ�ƷΪ׼��
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2�����ʦ��˿�ȷ�����ı���ͺż����������Ѷ����ӹ���Ʒ��������б����
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3�����˿͡����ʦǩ��ȷ�Ϻ��ɲ���Ա���˵����ݰ��Ŷ�����
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4���˿ͶԴ˵�ǩ��ȷ�Ϻ󣬹˿ͱ��뽫�˵����漰�����ı��������ڴ�

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF">
    <td width="50%"  height="42">�ͻ�ǩ�֣� </td>
    <td width="50%"  height="42">���ʦǩ�֣�</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td  height="42">���ڣ�</td>
    <td  height="42">���ڣ�</td>
  </tr>
</table>
</body>
</html>