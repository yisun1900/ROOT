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
.STYLE2 {font-size: 14px}
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
String zxzt ="";

try {
	conn=cf.getConnection();

	//��飺������Ŀ.��ѡ��
	String jgwzbm =null;
	String clxlmc =null;
	String bxxtx ="";
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

		bxxtx+="\\r\\n���󣡡�"+jgwzbm+"��"+clxlmc+"���Ǳ�ѡ�û��ѡ������";
	}
	rs.close();
	ps.close();

	if (!bxxtx.equals(""))
	{
		%>
		<SCRIPT language=javascript >
			alert("<%=bxxtx%>");
		</SCRIPT>
		<%
	}


	
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,crm_zxkhxx.bjjb,bjjbmc,ssfgs,fwmj,bjbbh,hxbm,zxzt";
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
		zxzt=cf.fillNull(rs.getString("zxzt"));
	}
	rs.close();
	ps.close();

	if (!zxzt.equals("3"))//0��δ������棻1: ������棻2: �����˻ؿͻ���3����ǩԼ��4����˾ǩ��ʧ�ܣ�5�����·������
	{
		String getjgwzbm =null;
		String getcpbm =null;
		String getcpmc =null;
		int gqsl=0;
		ls_sql="SELECT jgwzbm,cpbm,cpmc";
		ls_sql+=" FROM bj_khzcxm";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and ((sfyx='2') OR (sfyx='3' and (yxkssj>TRUNC(SYSDATE) OR yxjzsj<TRUNC(SYSDATE))))";
		ls_sql+=" order by jgwzbm,cpbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getjgwzbm=rs.getString("jgwzbm");
			getcpbm=rs.getString("cpbm");
			getcpmc=rs.getString("cpmc");

			gqsl++;

			out.println("<BR>�������ġ�"+getjgwzbm+"��"+getcpmc+"���ѹ������ڣ�������ѡ��");
		}
		rs.close();
		ps.close();

		if (gqsl>0)
		{
			return;
		}
	}


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

	//�ײͼ۸��bj_khtcjgb��
	int tcfwmj=0;
	double tcjg=0;
	double pmzjdj=0;
	double tlgbzjj=0;
	ls_sql="SELECT fwmj,tcjg,pmzjdj,tlgbzjj";
	ls_sql+=" FROM bj_khtcjgb";
	ls_sql+=" where khbh='"+khbh+"'";
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
	
	double zcsjcj=0;//�����������
	ls_sql="SELECT sum(sjsfje)";
	ls_sql+=" FROM bj_khzcxmxj";
    ls_sql+=" where bj_khzcxmxj.khbjjbbm!=bj_khzcxmxj.bjjbbm";
    ls_sql+=" and bj_khzcxmxj.khbh='"+khbh+"'";
    ls_sql+=" and bj_khzcxmxj.sfyxsj='Y' ";//�����Ƿ��շ�  Y���ǣ�N����
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcsjcj=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(bj_khppsjcjb.sjsfje)";
	ls_sql+=" FROM bj_khppsjcjb,bj_khzcxmxj";
    ls_sql+=" where bj_khppsjcjb.khbh=bj_khzcxmxj.khbh";
    ls_sql+=" and bj_khppsjcjb.jgwzbm=bj_khzcxmxj.jgwzbm";
    ls_sql+=" and bj_khppsjcjb.tccplbbm=bj_khzcxmxj.tccplbbm";
    ls_sql+=" and bj_khppsjcjb.khbjjbbm!=bj_khppsjcjb.bjjbbm";
    ls_sql+=" and bj_khppsjcjb.khbh='"+khbh+"'";
    ls_sql+=" and bj_khzcxmxj.sfyxsj='Y' ";//�����Ƿ��շ�  Y���ǣ�N����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcsjcj+=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	//�ַ������ĳ����Ӽ�
	double zccljj=0;
	ls_sql="SELECT sum(ROUND(dj*sl,2))";
	ls_sql+=" FROM bj_khzcxm";
    ls_sql+=" where khbh='"+khbh+"' and zclx='2'";//1���ײ��ڣ�2���ײ����շѣ�3�����
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
		ls_sql+=" FROM bj_khclxlxz";
		ls_sql+=" where khbh='"+khbh+"' and clxlbm='"+gettccplbbm+"' and sfxzsl!='1'"; 
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
	//����Ƿ�©���۸�
	int sfcount=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and zclx='1'";//1���ײ��ڣ�2���ײ����շѣ�3�����
	ls_sql+=" and tccplbbm=64 and dj=0";//ǽ��ı�ֽ
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfcount=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (sfcount>0)
	{
		out.println("����ǽ��ı�ֽ����Ϊ0");
		return;
	}

	double xsfzc=0;
	ls_sql="SELECT sum(ROUND(dj*sl,2))";
	ls_sql+=" FROM bj_khzcxm";
    ls_sql+=" where khbh='"+khbh+"' and zclx='1'";//1���ײ��ڣ�2���ײ����շѣ�3�����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xsfzc=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	double zcjmje=0;//���ļ���
	ls_sql="SELECT sum(sjjmje)";
	ls_sql+=" FROM bj_khzcxmxj";
    ls_sql+=" where bj_khzcxmxj.khbh='"+khbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcjmje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double dpsj=0;//��������
	ls_sql="SELECT sum(ROUND(dj*sl,2))";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"'";//1���ײ��ڣ�2���ײ��⣻3��������ꣻ4�������
	ls_sql+=" and ddcljjfs='1'";//0���ײ��ڲ��ϣ�1������������2����������շѣ�3���ײ�ѡ��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dpsj=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	double dpdlsf=0;//��������շ�
	ls_sql="SELECT sum(ROUND(dj*sl,2))";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"'";//1���ײ��ڣ�2���ײ��⣻3��������ꣻ4�������
	ls_sql+=" and ddcljjfs='2'";//0���ײ��ڲ��ϣ�1������������2����������շѣ�3���ײ�ѡ��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dpdlsf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double xpx=0;//ѡ����
	ls_sql="SELECT sum(ROUND(dj*sl,2))";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and zclx='4'";//1���ײ��ڣ�2���ײ��⣻3��������ꣻ4�������
	ls_sql+=" and ddcljjfs='3'";//0���Ǵ����ϣ�1�����䣨����ۣ���2�����䣨�����Ƽۣ���3���ײ�ѡ��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xpx=rs.getDouble(1);
	}
	rs.close();
	ps.close();





	//���̳����Ӽ�
	double gccljj=0;

	String xmbh =null;
	String sfxzsl =null;
	double bzsl=0;
	double ccbfjj=0;
	ls_sql="SELECT bj_khgcxmxj.xmbh,bj_khgcxmxj.bzsl,bj_khgcxmxj.sfxzsl,bj_bjxmmx.zqdj";
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
		ccbfjj=rs.getDouble("zqdj");

		double sjsl=0;
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


		double xjjsl=0;//�Ӽ�����

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
	ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.zqdj)";
	ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
	ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
	ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
	ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	ls_sql+=" and (bj_bjxmmx.tcnxmbz='N' OR bj_bjxmmx.tcnxmbz is null)";//Y���ǣ�N����
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcwgczj=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	tcwgczj=cf.round(tcwgczj,2);


	double zctcjg=0;//�Ҿ��ײ�
	ls_sql="SELECT sum(tcj)";
	ls_sql+=" FROM bj_khzctcmc";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and lx='1'";//1���Ҿ��ײͣ�2�������ƻ�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zctcjg=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double jkjhjg=0;//�����ƻ�
	ls_sql="SELECT sum(tcj)";
	ls_sql+=" FROM bj_khzctcmc";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and lx='2'";//1���Ҿ��ײͣ�2�������ƻ�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jkjhjg=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double wntcjg=0;//��ů�ײ�

	double bztcjg=0;
	double wntcpmzjdj=0;//ƽ�����ӵ���
	int sjmj=0;//ʵ�ʲ�ů���
	int bzmj=0;//���ڲ�ů���
	ls_sql="SELECT tcjg,bzmj,sjmj,pmzjdj";
	ls_sql+=" FROM bj_khwntcmc";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and lx='1'";//1����ů�ײͣ�2�������ײ�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bztcjg=rs.getDouble("tcjg");
		wntcpmzjdj=rs.getDouble("pmzjdj");
		bzmj=rs.getInt("bzmj");
		sjmj=rs.getInt("sjmj");

		wntcjg+=bztcjg;
		if (sjmj>bzmj)
		{
			wntcjg+=(sjmj-bzmj)*wntcpmzjdj;
		}

		wntcjg=cf.round(wntcjg,2);
	}
	rs.close();
	ps.close();

	double jytcjg=0;//�����ײ�

	bztcjg=0;
	wntcpmzjdj=0;//ƽ�����ӵ���
	sjmj=0;//ʵ�ʲ�ů���
	bzmj=0;//���ڲ�ů���
	ls_sql="SELECT tcjg,bzmj,sjmj,pmzjdj";
	ls_sql+=" FROM bj_khwntcmc";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and lx='2'";//1����ů�ײͣ�2�������ײ�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bztcjg=rs.getDouble("tcjg");
		wntcpmzjdj=rs.getDouble("pmzjdj");
		bzmj=rs.getInt("bzmj");
		sjmj=rs.getInt("sjmj");

		jytcjg+=bztcjg;
		if (sjmj>bzmj)
		{
			jytcjg+=(sjmj-bzmj)*wntcpmzjdj;
		}

		jytcjg=cf.round(jytcjg,2);
	}
	rs.close();
	ps.close();


	double cltcjg=0;//�����ײ�
	ls_sql="SELECT sum(tcjg)";
	ls_sql+=" FROM bj_khcltcmc";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and lx='1'";//1�������ײ�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cltcjg=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	//�ײͱ�׼�۸�������ӽ�����������ۣ��ַ������ĳ����Ӽۣ�С�����ĳ����Ӽۣ����շ�����-���ļ���+������Ĳ����+������ĳ����Ӽ�
	//�����̳����Ӽۣ��ײ���ʩ�������
	double tcze=0;
	tcze=tcjg+mjzjzj+zcsjcj+zccljj+zcxlcljj+xsfzc+gccljj+tcwgczj-zcjmje+dpsj;
	tcze=cf.round(tcze,2);

	int rowspan=6;
/*
	if (zctcjg!=0)
	{
		rowspan++;
	}
	if (jkjhjg!=0)
	{
		rowspan++;
	}
	if (wntcjg!=0)
	{
		rowspan++;
	}
	if (jytcjg!=0)
	{
		rowspan++;
	}
	if (cltcjg!=0)
	{
		rowspan++;
	}
*/	
%>
<body >

<div align="center" class="STYLE1"><%=bjjbmc%>��ݼ�װ�ײ��ܼ�&nbsp;LWTC-06</div>
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
    <td rowspan="<%=rowspan%>"  >��</td>
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
    <td >���ļ���</td>
    <td ><%=-1*zcjmje%></td>
    <td align="left" >���ı������˿�</td>
  </tr>
  <tr align="center"  >
    <td >��������</td>
    <td ><%=dpsj%></td>
    <td align="left" >�ײͶ������������</td>
  </tr>
  <tr align="center"  >
    <td >�ײ���ʩ�������</td>
    <td ><%=cf.round(tcwgczj+gccljj,2)%></td>
    <td align="left" >�ײ�������ʩ�����������</td>
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
    <td><% if("0006923".equals(khbh))
	       out.print("313081.89");
			else
			out.print(tczj);%></td>
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
		    <td><%=cf.formatDouble(tcnzj,"#########.##")%></td>
		    <td align="left" >�� = �� + �� + ��</td>
  </tr>
		<%
	}
	rs.close();
	ps.close();

	tcnzj=cf.round(tcnzj,2);

	if (!zxzt.equals("3"))//0��δ������棻1: ������棻2: �����˻ؿͻ���3����ǩԼ��4����˾ǩ��ʧ�ܣ�5�����·������
	{
/*
		ls_sql="update jc_zcdd set sfjrht='Y'";
		ls_sql+=" where  khbh='"+khbh+"'";
		//1������Ʒ��3����¼��ͬ��4���п�涩����5����׼�ײͣ�6���Ҿ߽����ײͣ�7����ů�����ײͣ�8�������ײͣ�9���������ģ�A:����������B:��������շѡ�C:ѡ������
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update jc_zczjx set sfjrht='Y'";
		ls_sql+=" where  khbh='"+khbh+"' and ddbh in(select ddbh from jc_zcdd where khbh='"+khbh+"' and sfjrht='Y')";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
*/
	}

	ls_sql="SELECT sum(wdzje+zqzjhze)";
	ls_sql+=" FROM jc_zcdd  ";
    ls_sql+=" where khbh='"+khbh+"'";//1��ϵͳ����Ʒ�ƶ�����2��ϵͳ������Ʒ�ƶ�����3����¼��ͬ��4���п�涩����5���ײͷֽⶩ��
	ls_sql+=" and clzt>='09' and clzt not in('98','99')";//09����ͬ�����
	ls_sql+=" and sfjrht='Y'";//�Ƿ�����ͬ  Y�����룻N��������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcwzj=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	
	htzj=tcnzj+tcwzj;
	htzj=cf.round(htzj,2);
%>
  <tr align="center"  >
	<td>��</td>
	<td>�ײ�����������</td>
	<td><% if("0006923".equals(khbh))
	       out.print("80224.1");
			else
			out.print(tcwzj);%></td>
	<td align="left" >���ƹ���ѡ�˰�𣬲��μ��κλ</td>
  </tr>
  <tr align="center"  >
    <td>��</td>
    <td>��ͬ�ܼ�</td>
    <td><% if("0006923".equals(khbh))
	       out.print("393305.99");
			else
			out.print(htzj);%></td>
    <td align="left" >�� = �� + ��</td>
  </tr>
<%
	if (zctcjg!=0)
	{
		%>
		  <tr align="center"  >
		    <td>&nbsp;</td>
		    <td >��������շ�</td>
		    <td ><%=dpdlsf%></td>
		    <td align="left" >��������շ�����</td>
  </tr>
		  <tr align="center"  >
		    <td>&nbsp;</td>
		    <td >ѡ����</td>
		    <td ><%=xpx%></td>
		    <td align="left" >�ײ�ѡ������</td>
  </tr>
		  <tr align="center"  >
			<td>&nbsp;</td>
			<td >�Ҿ��ײ�</td>
			<td ><%=zctcjg%></td>
			<td align="left" >&nbsp;</td>
		  </tr>
		<%
	}
	if (jkjhjg!=0)
	{
		%>
		  <tr align="center"  >
			<td>&nbsp;</td>
			<td >�����ƻ�</td>
			<td ><%=jkjhjg%></td>
			<td align="left" >&nbsp;</td>
		  </tr>
		<%
	}
	if (wntcjg!=0)
	{
		%>
		  <tr align="center"  >
			<td>&nbsp;</td>
			<td >��ů�ײ�</td>
			<td ><%=wntcjg%></td>
			<td align="left" >&nbsp;</td>
		  </tr>
		<%
	}
	if (jytcjg!=0)
	{
		%>
		  <tr align="center"  >
			<td>&nbsp;</td>
			<td >�����ƻ�</td>
			<td ><%=jytcjg%></td>
			<td align="left" >&nbsp;</td>
		  </tr>
		<%
	}
	if (cltcjg!=0)
	{
		%>
		  <tr align="center"  >
			<td>&nbsp;</td>
			<td >ɫ�ʼƻ�</td>
			<td ><%=cltcjg%></td>
			<td align="left" >&nbsp;</td>
		  </tr>
		<%
	}

%>
</table>
<p class="STYLE2">ע�����ײͱ�׼�۸񣻢�������ӽ��������������+���ĳ����Ӽ�+���շ�����+���ļ���+��������+�ײ���ʩ�������+���̳����Ӽۣ���Զ�̷ѣ����ײ��ܼۣ��޹���ѣ���˰�𣻢��ײ����ܼۣ����ײ����������ģ����ͬ�ܼ�</p>
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






