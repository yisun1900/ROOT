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
.STYLE1 {
	font-size: 18px;
	font-weight: bold;
}
</style>

</head>


<%
String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=0;

String xh=null;
String jgwzmc=null;
String jldwmc=null;
double dj=0;
double sl=0;
double qye=0;
String gycl=null;
String flmcgg=null;
String bjbz=null;
double xjqye=0;
double zjqye=0;
double xjsl=0;
double allqye=0;
double allsl=0;
double allzj=0;
double tcnzj=0;

double tcwzj=0;
double htzj=0;

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
String bjjbbm=null;
String bjjbmc=null;
String ssfgs=null;
String dzbjbz=null;
int fwmj=0;
String bjbbh=null;
String dqbm =null;
String hxbm =null;

try {
	conn=cf.getConnection();

	//��飺������Ŀ.��ѡ��
	String jgwzbm =null;
	String clxlmc =null;
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

//		out.println("<BR>���󣡡�"+jgwzbm+"��"+clxlmc+"���Ǳ�ѡ�û��ѡ������");
	}
	rs.close();
	ps.close();


	
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,crm_zxkhxx.bjjb,bjjbmc,ssfgs,fwmj,bjbbh,hxbm";
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
	if (mjzj<0)
	{
		mjzj=0;
	}
	double mjzjzj=pmzjdj*mjzj;//������ӽ��
	mjzjzj=cf.round(mjzjzj,2);
	

	double zcsjcj=0;

	//�����������
	String tcsjflbm =null;
	String tcsjflmc =null;
	String khbjjbbm =null;
	String getbjjbbm =null;
	double bzsl=0;
	double ccbfjj=0;
	double sjsl=0;
	double sjjshsl=0;
	double xjjsl=0;
	ls_sql="SELECT tcsjflmc,bj_khzcxmxj.tcsjflbm,bj_khzcxmxj.khbjjbbm,bjjbbm,bzsl,ccbfjj,sjsl,sjjshsl,xjjsl";
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
		sjjshsl=rs.getDouble("sjjshsl");
		xjjsl=rs.getDouble("xjjsl");

		double sjcj=0;
		if (getbjjbbm.compareTo(khbjjbbm)>0)
		{
			ls_sql="SELECT sjcj";
			ls_sql+=" FROM bj_tcsjcjb";
			ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+khbjjbbm+"' and bjjbbm1='"+getbjjbbm+"' and tcsjflbm='"+tcsjflbm+"'";
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
		}
		zcsjcj+=sjjshsl*sjcj;//���������
		zcsjcj=cf.round(zcsjcj,2);

	}
	rs.close();
	ps.close();

	//�ַ������ĳ����Ӽ�
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

	//С�����ĳ����Ӽ�
	double zcxlcljj=0;

	String gettccplbbm=null;
	double getxlsl=0;
	ls_sql="SELECT tccplbbm,sum(sjsl)";
	ls_sql+=" FROM bj_khzcxmxj";
    ls_sql+=" where khbh='"+khbh+"'";//1�������2���������3��������
	ls_sql+=" group by tccplbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		gettccplbbm=rs.getString(1);
		getxlsl=rs.getDouble(2);

		double gettcslxz=0;//�ײ���������
		double getccbfjj=0;//�������ּӼ�
		String sfxzsl="";//�Ƿ���������  1�������ƣ�2�����ܳ�����3���ɳ�����Ӽ�
		ls_sql="SELECT tcslxz,ccbfjj,sfxzsl";
		ls_sql+=" FROM jxc_clxlbm";
		ls_sql+=" where clxlbm='"+gettccplbbm+"' and sfxzsl!='1'"; 
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			gettcslxz=rs1.getDouble("tcslxz");
			getccbfjj=rs1.getDouble("ccbfjj");
			sfxzsl=cf.fillNull(rs1.getString("sfxzsl"));

			if (sfxzsl.equals("3"))//3���ɳ�����Ӽ�
			{
				zcxlcljj+=(getxlsl-gettcslxz)*getccbfjj;
			}
			else if (sfxzsl.equals("2"))//2�����ܳ���
			{
				if (getxlsl>gettcslxz)
				{
					out.println("�������"+gettccplbbm+"��������������������["+getxlsl+"]���ܳ�����������["+gettcslxz+"]");
					return;
				}
			}
		}
		rs1.close();
		ps1.close();
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

	String xmbh =null;
	String sfxzsl =null;
//	double bzsl=0;
//	double ccbfjj=0;
	ls_sql="SELECT bj_khgcxmxj.xmbh,bj_khgcxmxj.bzsl,bj_khgcxmxj.sfxzsl,bj_bjxmmx.dj";
	ls_sql+=" from  bj_khgcxmxj,bj_bjxmmx";
	ls_sql+=" where bj_khgcxmxj.khbh=bj_bjxmmx.khbh and bj_khgcxmxj.xmbh=bj_bjxmmx.xmbh ";
    ls_sql+=" and bj_khgcxmxj.khbh='"+khbh+"' and bj_khgcxmxj.tcnxmbz='Y'";//�ײ�����Ŀ��־
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmbh=rs.getString("xmbh");
		sfxzsl=rs.getString("sfxzsl");
		bzsl=rs.getDouble("bzsl");
		ccbfjj=rs.getDouble("dj");

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
	tcze=tcjg+mjzjzj+zcsjcj+zccljj+zcxlcljj+xsfzc+gccljj+tcwgczj;
	tcze=cf.round(tcze,2);
	

	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	double zhtcze=dzbj.getZhBzTCZj(conn,khbh,"yz");
	dzbj.updateTCSfxm(conn,khbh,"yz",tcze,zhtcze);

%>
<body >

<div align="center" class="STYLE1"><%=bjjbmc%>�ײ��ܼ�&nbsp;LWTC-06</div>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

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
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 14px'>
  <tr align="center"  >
    <td ><strong>���</strong></td>
    <td ><strong>��Ŀ</strong></td>
    <td ><strong>��Ԫ��</strong></td>
    <td ><strong>��ע</strong></td>
  </tr>
  <tr align="center"  >
    <td width="5%"  >��</td>
    <td width="25%"  >�ײͱ�׼�۸�</td>
    <td width="20%"  ><%=tcjg%></td>
    <td width="50%" align="left" ><%=bjjbmc%></td>
  </tr>
  <tr align="center"  >
    <td>��</td>
    <td  >������ӽ��</td>
    <td  ><%=mjzjzj%></td>
    <td align="left" >�������<%=mjzj%>ƽ�ף�ÿƽ��<%=pmzjdj%>Ԫ</td>
  </tr>
  <tr align="center"  >
    <td rowspan="5"  >��</td>
    <td  >�����������</td>
    <td  ><%=zcsjcj%></td>
    <td align="left" >&nbsp;</td>
  </tr>
  <tr align="center">
    <td >���ĳ����Ӽ�</td>
    <td ><%=cf.round(zccljj+zcxlcljj,2)%></td>
    <td align="left" >ʵ����������������������</td>
  </tr>
  <tr align="center"  >
    <td >���շ�����</td>
    <td ><%=xsfzc%></td>
    <td align="left">�ײ������շ�����</td>
  </tr>
  <tr align="center"  >
    <td >�ײ���ʩ�������</td>
    <td ><%=tcwgczj%></td>
    <td align="left" >�ײ�������ʩ�����������</td>
  </tr>
  <tr align="center"  >
    <td >���̳����Ӽ�</td>
    <td ><%=gccljj%></td>
    <td align="left" >ʵ����������������������</td>
  </tr>
 
<%
	double tczj=tcze;

	String sfxmbm=null;
	String sfxmmc=null;

	double sfbfb=0;
	double sfje=0;
	double zqsfje=0;

	ls_sql="SELECT sfxmbm,sfxmmc,sfbfb,sfje,zqsfje";
	ls_sql+=" FROM bj_sfxmmx  ";
    ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and bj_sfxmmx.sfxmlx not in('5','6','7','8','A','B','C')";//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
    ls_sql+=" order by bj_sfxmmx.sfxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sfxmbm=cf.fillHtml(rs.getString("sfxmbm"));
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		sfbfb=rs.getDouble("sfbfb");
		sfje=rs.getDouble("sfje");
		zqsfje=rs.getDouble("zqsfje");

		tczj+=zqsfje;

		%> 
	
		  <tr bgcolor="#FFFFFF" align="center"  height="31"> 
			<td>��</td>
			<td><%=sfxmmc%></td>
			<td><%=cf.formatDouble(zqsfje,"#########.##")%></td>
			<td align="left" >�� =���� + �� + �ۣ��� <%=sfbfb%>% ����·�������Ŀ</td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

	tczj=cf.round(tczj,2);

%>
  <tr align="center"  >
    <td>��</td>
    <td  >�ײ��ܼ�</td>
    <td><%=tczj%></td>
    <td align="left" >�� = �� + �� + �� + ��</td>
  </tr>

<%
	tcnzj=tczj;


	ls_sql="SELECT sfxmbm,sfxmmc,sfbfb,sfje,zqsfje";
	ls_sql+=" FROM bj_sfxmmx  ";
    ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and bj_sfxmmx.sfxmlx in('5')";//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
    ls_sql+=" order by bj_sfxmmx.sfxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sfxmbm=cf.fillHtml(rs.getString("sfxmbm"));
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		sfbfb=rs.getDouble("sfbfb");
		sfje=rs.getDouble("sfje");
		zqsfje=rs.getDouble("zqsfje");

		tcnzj+=zqsfje;

		%> 
	
		  <tr bgcolor="#FFFFFF" align="center"  height="31"> 
			<td>��</td>
			<td><%=sfxmmc%></td>
			<td><%=cf.formatDouble(zqsfje,"#########.##")%></td>
			<td align="left" >�� = �� �� <%=sfbfb%>%</td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sfxmbm,sfxmmc,sfbfb,sfje,zqsfje";
	ls_sql+=" FROM bj_sfxmmx  ";
    ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and bj_sfxmmx.sfxmlx in('6')";//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
    ls_sql+=" order by bj_sfxmmx.sfxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sfxmbm=cf.fillHtml(rs.getString("sfxmbm"));
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		sfbfb=rs.getDouble("sfbfb");
		sfje=rs.getDouble("sfje");
		zqsfje=rs.getDouble("zqsfje");

		tcnzj+=zqsfje;

		%> 
	
		  <tr bgcolor="#FFFFFF" align="center"  height="31"> 
			<td>��</td>
			<td><%=sfxmmc%></td>
			<td><%=cf.formatDouble(zqsfje,"#########.##")%></td>
			<td align="left" >�� =( �� + �� ) �� <%=sfbfb%>%</td>
		  </tr>
		  <tr align="center"  >
            <td>��</td>
		    <td>�ײ����ܼ�</td>
		    <td><%=tcnzj%></td>
		    <td align="left" >�� = �� + �� + ��</td>
  </tr>
		<%
	}
	rs.close();
	ps.close();

	tcnzj=cf.round(tcnzj,2);

	ls_sql="SELECT sum(hkze+zjhze)";
	ls_sql+=" FROM jc_zcdd  ";
    ls_sql+=" where khbh='"+khbh+"' and ddlx!='5'";//1��ϵͳ����Ʒ�ƶ�����2��ϵͳ������Ʒ�ƶ�����3����¼��ͬ��4���п�涩����5���ײͷֽⶩ��
	ls_sql+=" and clzt>='09' and clzt!='98'";//09����ͬ�����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcwzj=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(zjxze)";
	ls_sql+=" FROM jc_zczjx  ";
    ls_sql+=" where khbh='"+khbh+"' and clzt not in('00','99')";//00��¼��δ��ɣ�01��¼������ɣ�02����ȷ�ϣ�03�����ͻ���04�������ѽ��գ�99���˵�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcwzj+=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	
	htzj=tcnzj+tcwzj;
%>
  <tr align="center"  >
	<td>��</td>
	<td>�ײ�����������</td>
	<td><%=tcwzj%></td>
	<td align="left" >���ƹ���ѡ�˰�𣬲��μ��κλ</td>
  </tr>
  <tr align="center"  >
    <td>��</td>
    <td>��ͬ�ܼ�</td>
    <td><%=htzj%></td>
    <td align="left" >�� = �� + ��</td>
  </tr>
</table>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="6" height="42">�׷�ǩ�֣�</td>
    <td colspan="6" height="42">�ҷ�ǩ�֣�</td>
  </tr>
   <tr bgcolor="#FFFFFF"> 
  <td colspan="6" >���ڣ�</td>
    <td colspan="6" >���ڣ�</td>
  </tr>
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>






