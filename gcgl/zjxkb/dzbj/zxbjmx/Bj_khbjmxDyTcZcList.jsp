<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>

<head>
<style>
@media print{
	INPUT {display:none}
}
.STYLE2 {font-size: 18px}
</style>

</head>


<%
String qydmbh=null;
String qydm=null;

String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

int row=0;
String xmbh=null;
String xmmc=null;

String jgwzmc=null;
String jldwmc=null;
double dj=0;
double qye=0;
String gycl=null;
String flmcgg=null;
String bjbz=null;
double xjqye=0;
double zjqye=0;

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
String ssfgs=null;
String clgw=null;
int fwmj=0;

String bjbbh=null;
String dqbm =null;
String hxbm =null;
String bjjbmc  =null;
String bjjbbm  =null;

try {
	conn=cf.getConnection();

	
	//��飺������Ŀ.��ѡ��
	String jgwzbm =null;
	String clxlmc =null;
	String cuowu ="";
	ls_sql="SELECT jgwzbm,clxlmc";
	ls_sql+=" FROM bj_khzcxmxj,jxc_clxlbm";
    ls_sql+=" where bj_khzcxmxj.tccplbbm=jxc_clxlbm.clxlbm(+) and bj_khzcxmxj.khbh='"+khbh+"' and bj_khzcxmxj.sfbxx='Y' and bj_khzcxmxj.sjsl=0";
	ls_sql+=" order by jgwzbm,bj_khzcxmxj.tcsjflbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jgwzbm=rs.getString("jgwzbm");
		clxlmc=rs.getString("clxlmc");
		cuowu+="���󣡡�"+jgwzbm+"��"+clxlmc+"���Ǳ�ѡ�û��ѡ������\\n";
    }
    %>
	<SCRIPT language=javascript>
	//out.println("<BR>���󣡡�"+jgwzbm+"��"+clxlmc+"���Ǳ�ѡ�û��ѡ������");
	alert("�����嵥������\r\n<%=cuowu%>")
	</SCRIPT>
	<%
   
	rs.close();
	ps.close();
	


	
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,crm_zxkhxx.bjjb,bjjbmc,ssfgs,fwmj,bjbbh,hxbm,zxdm";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
	   
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjbmc=cf.fillHtml(rs.getString("bjjbmc"));
		bjjbbm=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=rs.getString("ssfgs");
		fwmj=rs.getInt("fwmj");
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		qydmbh=cf.fillNull(rs.getString("zxdm"));
	}
	rs.close();
	ps.close();
	
	//��ѯǩԼ����
	ls_sql="SELECT dwmc from sq_dwxx";
    ls_sql+=" where dwbh='"+qydmbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qydm=cf.fillNull(rs.getString("dwmc"));
	}
	rs.close();
	ps.close();


	ls_sql="SELECT dqbm";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillHtml(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	//�ײͼ۸��bj_tcjgb��
	int tcfwmj=0;
	double tcjg=0;
	double pmzjdj=0;
	double tlgbzjj=0;
	ls_sql="SELECT fwmj,tcjg,pmzjdj,tlgbzjj";
	ls_sql+=" FROM bj_tcjgb";
    ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and hxbm='"+hxbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcfwmj=rs.getInt("fwmj");
		tcjg=rs.getDouble("tcjg");
		pmzjdj=rs.getDouble("pmzjdj");
		tlgbzjj=rs.getDouble("tlgbzjj");
	}
	rs.close();
	ps.close();

	int mjzj=fwmj-tcfwmj;//�������
	double mjzjzj=pmzjdj*mjzj;//������ӽ��

	double zcsjcj=0;

	//�����������
	String tcsjflbm =null;
	String tcsjflmc =null;
	String khbjjbbm =null;
	String getbjjbbm =null;
	double bzsl=0;
	double ccbfjj=0;
	double sjsl=0;
	double xjjsl=0;
	ls_sql="SELECT tcsjflmc,bj_khzcxmxj.tcsjflbm,bj_khzcxmxj.khbjjbbm,bjjbbm,bzsl,ccbfjj,sjsl,xjjsl";
	ls_sql+=" FROM bj_khzcxmxj,bj_tcsjflbm";
    ls_sql+=" where bj_khzcxmxj.tcsjflbm=bj_tcsjflbm.tcsjflbm and bj_khzcxmxj.khbjjbbm!=bj_khzcxmxj.bjjbbm";
    ls_sql+=" and bj_khzcxmxj.khbh='"+khbh+"' and bj_khzcxmxj.khbjjbbm!=bj_khzcxmxj.bjjbbm";
    ls_sql+=" and bj_khzcxmxj.sfyxsj='Y' ";//�����Ƿ��շ�  Y���ǣ�N����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		tcsjflmc=cf.fillNull(rs.getString("tcsjflmc"));
		tcsjflbm=cf.fillNull(rs.getString("tcsjflbm"));
		khbjjbbm=cf.fillNull(rs.getString("khbjjbbm"));
		getbjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		bzsl=rs.getDouble("bzsl");
		ccbfjj=rs.getDouble("ccbfjj");
		sjsl=rs.getDouble("sjsl");
		xjjsl=rs.getDouble("xjjsl");

		double sjcj=0;
		ls_sql="SELECT sjcj";
		ls_sql+=" FROM bj_tcsjcjb";
		ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+khbjjbbm+"' and bjjbbm1='"+getbjjbbm+"' and tcsjflbm='"+tcsjflbm+"'";
		ls_sql+=" and bjjbbm1>bjjbbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjcj=rs1.getDouble("sjcj");
		}
		else{
			out.println("����["+tcsjflmc+"]û���������");
			return;
		}
		rs1.close();
		ps1.close();

		zcsjcj+=sjsl*sjcj;
		zcsjcj=cf.round(zcsjcj,2);
	}
	rs.close();
	ps.close();

	//���ĳ����Ӽ�
	double zccljj=0;
	ls_sql="SELECT sum(ROUND(xjjsl*ccbfjj,2))";
	ls_sql+=" FROM bj_khzcxmxj";
    ls_sql+=" where khbh='"+khbh+"' and sfxzsl='1'";//1�������2���������3��������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zccljj=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//���շ�����
	double xsfzc=0;
	ls_sql="SELECT sum(jjje*sl)";
	ls_sql+=" FROM bj_khzcxm";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xsfzc=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	//���̳����Ӽ�
	double gccljj=0;

	String sfxzsl =null;
//	double bzsl=0;
//	double ccbfjj=0;
	ls_sql="SELECT xmbh,bzsl,sfxzsl,ccbfjj";
	ls_sql+=" FROM bj_khgcxmxj";
    ls_sql+=" where khbh='"+khbh+"' and tcnxmbz='Y'";//�ײ�����Ŀ��־
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmbh=rs.getString("xmbh");
		sfxzsl=rs.getString("sfxzsl");
		bzsl=rs.getDouble("bzsl");
		ccbfjj=rs.getDouble("ccbfjj");

		sjsl=0;
		ls_sql="SELECT sum(bj_gclmx.sl)";
		ls_sql+=" FROM bj_gclmx";
		ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjsl=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();


		xjjsl=0;//�Ӽ�����

		if (sfxzsl.equals("1"))//1�������2���������3��������
		{
			if (sjsl>bzsl)
			{
				xjjsl=sjsl-bzsl;
			}
			else{
				xjjsl=0;
			}
		}
		else if (sfxzsl.equals("2"))//1�������2���������3��������
		{
			if (sjsl>bzsl)
			{
//				out.println("<BR>������Ŀ��š�"+xmbh+"���������[ʵ��������"+sjsl+"]����[��׼������"+bzsl+"]");
			}
		}


		ls_sql="update bj_khgcxmxj set sjsl="+sjsl+",xjjsl="+xjjsl;
		ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		gccljj+=ccbfjj*xjjsl;
		gccljj=cf.round(gccljj,2);

	}
	rs.close();
	ps.close();

	//�ײ���ʩ�������
	double tcwgczj=0;

	//1�������ࣨ�������շ���Ŀ��أ���2�������ࣨ�������շ���Ŀ�޹أ���3��������
	ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj)";
	ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
	ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
	ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
	ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	ls_sql+=" and (bj_bjxmmx.tcnxmbz='N' OR bj_bjxmmx.tcnxmbz is null)";//Y���ǣ�N����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcwgczj=rs.getDouble(1);
	}
	rs.close();
	ps.close();



	double tcze=0;
	tcze=tcjg+mjzjzj+zcsjcj+zccljj+xsfzc+gccljj+tcwgczj;
	tcze=cf.round(tcze,2);
  
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	double zhtcze=dzbj.getZhBzTCZj(conn,khbh,"yz");
	dzbj.updateTCSfxm(conn,khbh,"yz",tcze,zhtcze);
	
	
	
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,ssfgs,fwmj";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=rs.getString("ssfgs");
		fwmj=rs.getInt("fwmj");
	}
	rs.close();
	ps.close();


	//dzbj.Dzbj dzbj=new dzbj.Dzbj();
	//����:  lx 9�����ȫ����1����鵥�ۣ�2��������ƣ�3����鹤�ղ��ϼ�飻4����鱨�ۼ���5������ѡ��Ŀ��6����鲻������Ŀ��7����������Ŀ
	String retStr=dzbj.checkBjjb(conn,khbh,5);
	if (!retStr.equals("0"))
	{
		%>
		<SCRIPT language=javascript >
		<!--
		//	alert("���ӱ��ۼ�����\r\n<%=retStr%>");
		//-->
		</SCRIPT>
		<%
	}

%>
<body >

<TABLE border="0" cellspacing="0" cellpadding="0" width="100%" cellspacing="0 style='FONT-SIZE: 14px'">

<THEAD bgcolor="#FFFFFF" style="display:table-header-group;font-weight:bold">
<tr><td>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

  <tr bgcolor="#FFFFFF"> 
    <td colspan="8" align="center" class="STYLE2" ><B>ȫװ���ײ�������ϸ&nbsp;LWTC-02</B></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="3" >�ͻ�������<%=khxm%></td>
    <td colspan="3" >���̸����ˣ�</td>
    <td width="27%" >�� �� ʦ��<%=sjs%></td>
	<td width="21%" >�Ƶ����ڣ�<%=cf.today()%></td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="12"  >�ͻ���ַ��<%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="6" >�ͻ��绰��<%=lxfs%></td>
    <td align="left" >����ʱ�䣺</td>
	<td >���������<%=fwmj%></td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="6" >ǩԼ���棺&nbsp;<%=qydm%></td>
    <td align="left" >���Ϲ��ʣ�&nbsp;</td>
	<td >�ײͼ���&nbsp;</td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td  width="6%" align="center">�ռ�</td>
    <td  width="10%" align="center">��Ʒ���</td>
    <td  width="10%" align="center">Ʒ��</td>
    <td  width="10%" align="center">�ͺ�</td>
	<td  width="10%" align="center">���</td>
    <td  width="8%" align="center">��λ</td>
    <td  width="8%" align="center">������ʵ�ʣ�</td>
    <td  width="25%" align="center">���ײ�Ʒ˵��</td>
    <td  width="8%" align="center">����</td>
  </tr>

	
<%
	int i=0;
	String tccplbbm=null;
	String tccplbmc=null;
	String oldjgwzmc="";
	ls_sql="SELECT distinct bj_khzcxmxj.jgwzbm ";
	ls_sql+=" FROM bj_khzcxmxj ";
    ls_sql+=" where bj_khzcxmxj.khbh='"+khbh+"'";
	ls_sql+=" order by bj_khzcxmxj.jgwzbm ";
//	out.println(ls_sql);
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		jgwzmc=rs2.getString("jgwzbm");


		//������[��Ʒ���]����
		int cplbsl=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khzcxmxj";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cplbsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		//������[��������Ŀ�Ĳ�Ʒ���]����
		int zccplbsl=0;
		ls_sql="SELECT count(distinct tccplbbm)";
		ls_sql+=" FROM bj_khzcxm";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zccplbsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		//������[������Ŀ]����
		int fjxmsl=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khzcxm,jxc_clxlbm";
		ls_sql+=" where bj_khzcxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
		ls_sql+=" and bj_khzcxm.khbh='"+khbh+"' and bj_khzcxm.jgwzbm='"+jgwzmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			fjxmsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		int hbsl=0;//��һ��Ӧ�ϲ�����
		if (fjxmsl==0)//����������������Ŀ
		{
			hbsl=cplbsl;
		}
		else{
			hbsl=(cplbsl-zccplbsl)+fjxmsl;
		}

		if (fjxmsl==0)//����������������Ŀ
		{
			//������[��Ʒ���]
			ls_sql="SELECT distinct bj_khzcxmxj.tccplbbm,clxlmc";
			ls_sql+=" FROM bj_khzcxmxj,jxc_clxlbm ";
			ls_sql+=" where bj_khzcxmxj.tccplbbm=jxc_clxlbm.clxlbm(+) ";
			ls_sql+=" and bj_khzcxmxj.khbh='"+khbh+"'";
			ls_sql+=" and bj_khzcxmxj.jgwzbm='"+jgwzmc+"'";
			ls_sql+=" order by bj_khzcxmxj.tccplbbm";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			while (rs1.next())
			{
				tccplbbm=rs1.getString("tccplbbm");
				tccplbmc=rs1.getString("clxlmc");

				if (!oldjgwzmc.equals(jgwzmc))//�����һ��
				{
					oldjgwzmc=jgwzmc;

					%> 
					  <tr bgcolor="#FFFFFF"> 
						<td align="center" rowspan="<%=hbsl%>"><%=jgwzmc%></td>
						<td align="center"><%=tccplbmc%></td>
						<td colspan="7">δѡ���κ�����</td>
					  </tr>
					<%
				}
				else{
					%> 
					  <tr bgcolor="#FFFFFF"> 
						<td align="center"><%=tccplbmc%></td>
						<td colspan="7">δѡ���κ�����</td>
					  </tr>
					<%
				}
			}
			rs1.close();
			ps1.close();

		}
		else{//����������������Ŀ
			//������[��Ʒ���]
			ls_sql="SELECT distinct bj_khzcxmxj.tccplbbm,clxlmc";
			ls_sql+=" FROM bj_khzcxmxj,jxc_clxlbm ";
			ls_sql+=" where bj_khzcxmxj.tccplbbm=jxc_clxlbm.clxlbm(+) ";
			ls_sql+=" and bj_khzcxmxj.khbh='"+khbh+"'";
			ls_sql+=" and bj_khzcxmxj.jgwzbm='"+jgwzmc+"'";
			ls_sql+=" order by bj_khzcxmxj.tccplbbm";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			while (rs1.next())
			{
				tccplbbm=rs1.getString("tccplbbm");
				tccplbmc=rs1.getString("clxlmc");

			
				//�����[������Ŀ]����
				int lbzcsl=0;
				ls_sql="SELECT count(*)";
				ls_sql+=" FROM bj_khzcxm";
				ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzmc+"' and tccplbbm='"+tccplbbm+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					lbzcsl=rs.getInt(1);
				}
				rs.close();
				ps.close();

				if (lbzcsl==0)//�����[������Ŀ]δѡ��
				{
					if (!oldjgwzmc.equals(jgwzmc))//�����һ��
					{
						oldjgwzmc=jgwzmc;

						%> 
						  <tr bgcolor="#FFFFFF"> 
							<td align="center" rowspan="<%=hbsl%>"><%=jgwzmc%></td>
							<td align="center"><%=tccplbmc%></td>
							<td colspan="7">δѡ���κ�����</td>
						  </tr>
						<%
					}
					else{
						%> 
						  <tr bgcolor="#FFFFFF"> 
							<td align="center"><%=tccplbmc%></td>
							<td colspan="7">δѡ���κ�����</td>
						  </tr>
						<%
					}
				}
				else{//�����[������Ŀ]ѡ��
					//�����Ŀ��ϸ
					String ppmc=null;
					String xh=null;
					String gg=null;
					String jldw=null;
					double sl=0;
					String ptcpsm=null;
					ls_sql="SELECT ppmc,xh,gg,jldw,sl,ptcpsm,bjjbmc";
					ls_sql+=" FROM bj_khzcxm,bdm_bjjbbm";
					ls_sql+=" where bj_khzcxm.bjjbbm=bdm_bjjbbm.bjjbbm";
					ls_sql+=" and bj_khzcxm.khbh='"+khbh+"' and bj_khzcxm.jgwzbm='"+jgwzmc+"' and bj_khzcxm.tccplbbm='"+tccplbbm+"'";
					ls_sql+=" order by xh";
				//	out.println(ls_sql);
					ps= conn.prepareStatement(ls_sql);
					rs =ps.executeQuery();
					while (rs.next())
					{
						ppmc=rs.getString("ppmc");
						xh=cf.fillHtml(rs.getString("xh"));
						gg=cf.fillHtml(rs.getString("gg"));
						jldw=rs.getString("jldw");
						sl=rs.getDouble("sl");
						ptcpsm=cf.fillHtml(rs.getString("ptcpsm"));
						bjjbmc=rs.getString("bjjbmc");

						row++;

						if (!oldjgwzmc.equals(jgwzmc))//��ʼ�·���
						{
							oldjgwzmc=jgwzmc;

							//���ÿ������
							%> 
							  <tr bgcolor="#FFFFFF"> 
								<td align="center" rowspan="<%=hbsl%>"><%=jgwzmc%></td>
								<td align="center"><%=tccplbmc%></td>
								<td align="center"><%=ppmc%></td>
								<td align="center"><%=xh%></td>
								<td align="center"><%=gg%></td>
								<td align="center"><%=jldw%></td>
								<td align="center"><%=cf.formatDouble(sl)%></td>
								<td align="left" ><%=ptcpsm%></td>
								<td align="center"><%=bjjbmc%></td>
							  </tr>
							<%
						}
						else{
							//���ÿ������
							%> 
							  <tr bgcolor="#FFFFFF"> 
								<td align="center"><%=tccplbmc%></td>
								<td align="center"><%=ppmc%></td>
								<td align="center"><%=xh%></td>
								<td align="center"><%=gg%></td>
								<td align="center"><%=jldw%></td>
								<td align="center"><%=cf.formatDouble(sl)%></td>
								<td align="left" ><%=ptcpsm%></td>
								<td align="center"><%=bjjbmc%></td>
							  </tr>
							<%
						}
					}
					rs.close();
					ps.close();
				}
			}
			rs1.close();
			ps1.close();
		}
	}
	rs2.close();
	ps2.close();
%> 
  		

</table>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="42">�ͻ�ǩ�֣�            </td>
    <td colspan="2" height="42">���ʦǩ�֣�</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="42">���ڣ�</td>
    <td colspan="2" height="42">���ڣ�</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="42">����Աǩ�֣�</td>
    <td colspan="2" height="42">���澭��ǩ�֣�</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="42">���ڣ�</td>
    <td colspan="2" height="42">���ڣ�</td>
  </tr>
</table>

</td></tr>
</TBODY>

</table>


</body>
</html>

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
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>






