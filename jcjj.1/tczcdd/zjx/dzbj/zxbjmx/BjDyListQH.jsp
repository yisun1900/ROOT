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
String zjxxh=request.getParameter("zjxxh");


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
double tcnzjq=0;
double tcnzjh=0;

double tcwzj=0;
double htzjq=0;
double htzjh=0;

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
	ls_sql+=" FROM bj_khzcxmxjh,jxc_clxlbm";
    ls_sql+=" where bj_khzcxmxjh.tccplbbm=jxc_clxlbm.clxlbm(+) and bj_khzcxmxjh.zjxxh='"+zjxxh+"' and bj_khzcxmxjh.sfbxx='Y' and bj_khzcxmxjh.sjsl=0";
	ls_sql+=" order by jgwzbm,bj_khzcxmxjh.tcsjflbm";
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
	
	double zcsjcjq=0;//�����������
	ls_sql="SELECT sum(sjsfje)";
	ls_sql+=" FROM bj_khzcxmxjq";
    ls_sql+=" where bj_khzcxmxjq.khbjjbbm!=bj_khzcxmxjq.bjjbbm";
    ls_sql+=" and bj_khzcxmxjq.zjxxh='"+zjxxh+"'";
    ls_sql+=" and bj_khzcxmxjq.sfyxsj='Y' ";//�����Ƿ��շ�  Y���ǣ�N����
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcsjcjq=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	
	ls_sql="SELECT sum(bj_khppsjcjbq.sjsfje)";
	ls_sql+=" FROM bj_khppsjcjbq,bj_khzcxmxjq";
	ls_sql+=" where bj_khppsjcjbq.zjxxh=bj_khzcxmxjq.zjxxh";
	ls_sql+=" and bj_khppsjcjbq.jgwzbm=bj_khzcxmxjq.jgwzbm";
	ls_sql+=" and bj_khppsjcjbq.tccplbbm=bj_khzcxmxjq.tccplbbm";
	ls_sql+=" and bj_khppsjcjbq.khbjjbbm!=bj_khppsjcjbq.bjjbbm";
	ls_sql+=" and bj_khppsjcjbq.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_khzcxmxjq.sfyxsj='Y' ";//�����Ƿ��շ�  Y���ǣ�N����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcsjcjq+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double zcsjcjh=0;//�����������
	ls_sql="SELECT sum(sjsfje)";
	ls_sql+=" FROM bj_khzcxmxjh";
    ls_sql+=" where bj_khzcxmxjh.khbjjbbm!=bj_khzcxmxjh.bjjbbm";
    ls_sql+=" and bj_khzcxmxjh.zjxxh='"+zjxxh+"'";
    ls_sql+=" and bj_khzcxmxjh.sfyxsj='Y' ";//�����Ƿ��շ�  Y���ǣ�N����
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcsjcjh=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(bj_khppsjcjbh.sjsfje)";
	ls_sql+=" FROM bj_khppsjcjbh,bj_khzcxmxjh";
	ls_sql+=" where bj_khppsjcjbh.zjxxh=bj_khzcxmxjh.zjxxh";
	ls_sql+=" and bj_khppsjcjbh.jgwzbm=bj_khzcxmxjh.jgwzbm";
	ls_sql+=" and bj_khppsjcjbh.tccplbbm=bj_khzcxmxjh.tccplbbm";
	ls_sql+=" and bj_khppsjcjbh.khbjjbbm!=bj_khppsjcjbh.bjjbbm";
	ls_sql+=" and bj_khppsjcjbh.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_khzcxmxjh.sfyxsj='Y' ";//�����Ƿ��շ�  Y���ǣ�N����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcsjcjh+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//�ַ������ĳ����Ӽ�
	double zccljjq=0;
	ls_sql="SELECT sum(ROUND(dj*sl,2))";
	ls_sql+=" FROM bj_khzcxmq";
    ls_sql+=" where zjxxh='"+zjxxh+"' and zclx='2'";//1���ײ��ڣ�2���ײ����շѣ�3�����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zccljjq=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double zccljjh=0;
	ls_sql="SELECT sum(ROUND(dj*sl,2))";
	ls_sql+=" FROM bj_khzcxmh";
    ls_sql+=" where zjxxh='"+zjxxh+"' and zclx='2'";//1���ײ��ڣ�2���ײ����շѣ�3�����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zccljjh=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//С�����ĳ����Ӽ�
	double zcxlcljjq=0;

	String gettccplbbm=null;
	double getxlsl=0;
	ls_sql="SELECT tccplbbm,sum(sjsl)";
	ls_sql+=" FROM bj_khzcxmxjq";
    ls_sql+=" where zjxxh='"+zjxxh+"'";//1�������2���������3��������
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
				zcxlcljjq+=(getxlsl-gettcslxz)*getccbfjj;
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

	
	double zcxlcljjh=0;

	ls_sql="SELECT tccplbbm,sum(sjsl)";
	ls_sql+=" FROM bj_khzcxmxjh";
    ls_sql+=" where zjxxh='"+zjxxh+"'";//1�������2���������3��������
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
				zcxlcljjh+=(getxlsl-gettcslxz)*getccbfjj;
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
	double xsfzcq=0;
	ls_sql="SELECT sum(ROUND(dj*sl,2))";
	ls_sql+=" FROM bj_khzcxmq";
    ls_sql+=" where zjxxh='"+zjxxh+"' and zclx='1'";//1���ײ��ڣ�2���ײ����շѣ�3�����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xsfzcq=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double xsfzch=0;
	ls_sql="SELECT sum(ROUND(dj*sl,2))";
	ls_sql+=" FROM bj_khzcxmh";
    ls_sql+=" where zjxxh='"+zjxxh+"' and zclx='1'";//1���ײ��ڣ�2���ײ����շѣ�3�����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xsfzch=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	double zcjmjeq=0;//���ļ���
	ls_sql="SELECT sum(sjjmje)";
	ls_sql+=" FROM bj_khzcxmxjq";
    ls_sql+=" where bj_khzcxmxjq.zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcjmjeq=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double zcjmjeh=0;//���ļ���
	ls_sql="SELECT sum(sjjmje)";
	ls_sql+=" FROM bj_khzcxmxjh";
    ls_sql+=" where bj_khzcxmxjh.zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcjmjeh=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double dpsjq=0;//��������
	ls_sql="SELECT sum(ROUND(dj*sl,2))";
	ls_sql+=" FROM bj_khzcxmq";
    ls_sql+=" where zjxxh='"+zjxxh+"'";//1���ײ��ڣ�2���ײ��⣻3��������ꣻ4�������
	ls_sql+=" and ddcljjfs='1'";//0���ײ��ڲ��ϣ�1������������2����������շѣ�3���ײ�ѡ��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dpsjq=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double dpsjh=0;//��������
	ls_sql="SELECT sum(ROUND(dj*sl,2))";
	ls_sql+=" FROM bj_khzcxmh";
    ls_sql+=" where zjxxh='"+zjxxh+"'";//1���ײ��ڣ�2���ײ��⣻3��������ꣻ4�������
	ls_sql+=" and ddcljjfs='1'";//0���ײ��ڲ��ϣ�1������������2����������շѣ�3���ײ�ѡ��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dpsjh=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double dpdlsfq=0;//��������շ�
	ls_sql="SELECT sum(ROUND(dj*sl,2))";
	ls_sql+=" FROM bj_khzcxmq";
    ls_sql+=" where zjxxh='"+zjxxh+"'";//1���ײ��ڣ�2���ײ��⣻3��������ꣻ4�������
	ls_sql+=" and ddcljjfs='2'";//0���ײ��ڲ��ϣ�1������������2����������շѣ�3���ײ�ѡ��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dpdlsfq=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double dpdlsfh=0;//��������շ�
	ls_sql="SELECT sum(ROUND(dj*sl,2))";
	ls_sql+=" FROM bj_khzcxmh";
    ls_sql+=" where zjxxh='"+zjxxh+"'";//1���ײ��ڣ�2���ײ��⣻3��������ꣻ4�������
	ls_sql+=" and ddcljjfs='2'";//0���ײ��ڲ��ϣ�1������������2����������շѣ�3���ײ�ѡ��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dpdlsfh=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double xpxq=0;//ѡ����
	ls_sql="SELECT sum(ROUND(dj*sl,2))";
	ls_sql+=" FROM bj_khzcxmq";
	ls_sql+=" where zjxxh='"+zjxxh+"' and zclx='4'";//1���ײ��ڣ�2���ײ��⣻3��������ꣻ4�������
	ls_sql+=" and ddcljjfs='3'";//0���Ǵ����ϣ�1�����䣨����ۣ���2�����䣨�����Ƽۣ���3���ײ�ѡ��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xpxq=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double xpxh=0;//ѡ����
	ls_sql="SELECT sum(ROUND(dj*sl,2))";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and zclx='4'";//1���ײ��ڣ�2���ײ��⣻3��������ꣻ4�������
	ls_sql+=" and ddcljjfs='3'";//0���Ǵ����ϣ�1�����䣨����ۣ���2�����䣨�����Ƽۣ���3���ײ�ѡ��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xpxh=rs.getDouble(1);
	}
	rs.close();
	ps.close();



	//���̳����Ӽ�
	double gccljjq=0;

	String xmbh =null;
	String sfxzsl =null;
	double bzsl=0;
	double ccbfjj=0;
	ls_sql="SELECT bj_khgcxmxjq.xmbh,bj_khgcxmxjq.bzsl,bj_khgcxmxjq.sfxzsl,bj_bjxmmxq.zqdj";
	ls_sql+=" from  bj_khgcxmxjq,bj_bjxmmxq";
	ls_sql+=" where bj_khgcxmxjq.zjxxh=bj_bjxmmxq.zjxxh and bj_khgcxmxjq.xmbh=bj_bjxmmxq.xmbh ";
    ls_sql+=" and bj_khgcxmxjq.zjxxh='"+zjxxh+"' and bj_khgcxmxjq.tcnxmbz='Y'";//�ײ�����Ŀ��־
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmbh=rs.getString("xmbh");
		sfxzsl=rs.getString("sfxzsl");
		bzsl=rs.getDouble("bzsl");
		ccbfjj=rs.getDouble("zqdj");

		double sjsl=0;
		ls_sql="SELECT sum(bj_gclmxq.sl)";
		ls_sql+=" FROM bj_gclmxq";
		ls_sql+=" where zjxxh='"+zjxxh+"' and xmbh='"+xmbh+"'";
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


		ls_sql="update bj_khgcxmxjq set sjsl="+sjsl+",xjjsl="+xjjsl;
		ls_sql+=" where zjxxh='"+zjxxh+"' and xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		gccljjq+=ccbfjj*xjjsl;
		gccljjq=cf.round(gccljjq,2);

	}
	rs.close();
	ps.close();

	double gccljjh=0;

	ls_sql="SELECT bj_khgcxmxjh.xmbh,bj_khgcxmxjh.bzsl,bj_khgcxmxjh.sfxzsl,bj_bjxmmxh.zqdj";
	ls_sql+=" from  bj_khgcxmxjh,bj_bjxmmxh";
	ls_sql+=" where bj_khgcxmxjh.zjxxh=bj_bjxmmxh.zjxxh and bj_khgcxmxjh.xmbh=bj_bjxmmxh.xmbh ";
    ls_sql+=" and bj_khgcxmxjh.zjxxh='"+zjxxh+"' and bj_khgcxmxjh.tcnxmbz='Y'";//�ײ�����Ŀ��־
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmbh=rs.getString("xmbh");
		sfxzsl=rs.getString("sfxzsl");
		bzsl=rs.getDouble("bzsl");
		ccbfjj=rs.getDouble("zqdj");

		double sjsl=0;
		ls_sql="SELECT sum(bj_gclmxh.sl)";
		ls_sql+=" FROM bj_gclmxh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and xmbh='"+xmbh+"'";
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


		ls_sql="update bj_khgcxmxjh set sjsl="+sjsl+",xjjsl="+xjjsl;
		ls_sql+=" where zjxxh='"+zjxxh+"' and xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		gccljjh+=ccbfjj*xjjsl;
		gccljjh=cf.round(gccljjh,2);

	}
	rs.close();
	ps.close();

	//�ײ���ʩ�������
	double tcwgczjq=0;

	//1�������ࣨ�������շ���Ŀ��أ���2�������ࣨ�������շ���Ŀ�޹أ���3��������
	ls_sql="SELECT sum(bj_gclmxq.sl*bj_bjxmmxq.zqdj)";
	ls_sql+=" FROM bj_bjxmmxq,bj_gclmxq,bdm_xmdlbm";
	ls_sql+=" where bj_bjxmmxq.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_bjxmmxq.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
	ls_sql+=" and bj_bjxmmxq.zjxxh=bj_gclmxq.zjxxh and bj_bjxmmxq.dqbm=bj_gclmxq.dqbm and bj_bjxmmxq.xmbh=bj_gclmxq.xmbh";
	ls_sql+=" and (bj_bjxmmxq.tcnxmbz='N' OR bj_bjxmmxq.tcnxmbz is null)";//Y���ǣ�N����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcwgczjq=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	tcwgczjq=cf.round(tcwgczjq,2);

	double tcwgczjh=0;

	//1�������ࣨ�������շ���Ŀ��أ���2�������ࣨ�������շ���Ŀ�޹أ���3��������
	ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.zqdj)";
	ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
	ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
	ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.dqbm=bj_gclmxh.dqbm and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
	ls_sql+=" and (bj_bjxmmxh.tcnxmbz='N' OR bj_bjxmmxh.tcnxmbz is null)";//Y���ǣ�N����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcwgczjh=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	tcwgczjh=cf.round(tcwgczjh,2);


	double zctcjgq=0;//�Ҿ��ײ�
	ls_sql="SELECT sum(tcj)";
	ls_sql+=" FROM bj_khzctcmcq";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ls_sql+=" and lx='1'";//1���Ҿ��ײͣ�2�������ƻ�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zctcjgq=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double jkjhjgq=0;//�����ƻ�
	ls_sql="SELECT sum(tcj)";
	ls_sql+=" FROM bj_khzctcmcq";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ls_sql+=" and lx='2'";//1���Ҿ��ײͣ�2�������ƻ�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jkjhjgq=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double wntcjgq=0;//��ů�ײ�

	double bztcjg=0;
	double wntcpmzjdj=0;//ƽ�����ӵ���
	int sjmj=0;//ʵ�ʲ�ů���
	int bzmj=0;//���ڲ�ů���
	ls_sql="SELECT tcjg,bzmj,sjmj,pmzjdj";
	ls_sql+=" FROM bj_khwntcmcq";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ls_sql+=" and lx='1'";//1����ů�ײͣ�2�������ײ�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bztcjg=rs.getDouble("tcjg");
		wntcpmzjdj=rs.getDouble("pmzjdj");
		bzmj=rs.getInt("bzmj");
		sjmj=rs.getInt("sjmj");

		wntcjgq+=bztcjg;
		if (sjmj>bzmj)
		{
			wntcjgq+=(sjmj-bzmj)*wntcpmzjdj;
		}

		wntcjgq=cf.round(wntcjgq,2);
	}
	rs.close();
	ps.close();

	double jytcjgq=0;//�����ײ�

	bztcjg=0;
	wntcpmzjdj=0;//ƽ�����ӵ���
	sjmj=0;//ʵ�ʲ�ů���
	bzmj=0;//���ڲ�ů���
	ls_sql="SELECT tcjg,bzmj,sjmj,pmzjdj";
	ls_sql+=" FROM bj_khwntcmcq";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ls_sql+=" and lx='2'";//1����ů�ײͣ�2�������ײ�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bztcjg=rs.getDouble("tcjg");
		wntcpmzjdj=rs.getDouble("pmzjdj");
		bzmj=rs.getInt("bzmj");
		sjmj=rs.getInt("sjmj");

		jytcjgq+=bztcjg;
		if (sjmj>bzmj)
		{
			jytcjgq+=(sjmj-bzmj)*wntcpmzjdj;
		}

		jytcjgq=cf.round(jytcjgq,2);
	}
	rs.close();
	ps.close();


	double cltcjgq=0;//�����ײ�
	ls_sql="SELECT sum(tcjg)";
	ls_sql+=" FROM bj_khcltcmcq";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ls_sql+=" and lx='1'";//1�������ײ�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cltcjgq=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	double zctcjgh=0;//�Ҿ��ײ�
	ls_sql="SELECT sum(tcj)";
	ls_sql+=" FROM bj_khzctcmch";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ls_sql+=" and lx='1'";//1���Ҿ��ײͣ�2�������ƻ�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zctcjgh=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double jkjhjgh=0;//�����ƻ�
	ls_sql="SELECT sum(tcj)";
	ls_sql+=" FROM bj_khzctcmch";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ls_sql+=" and lx='2'";//1���Ҿ��ײͣ�2�������ƻ�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jkjhjgh=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double wntcjgh=0;//��ů�ײ�

	bztcjg=0;
	wntcpmzjdj=0;//ƽ�����ӵ���
	sjmj=0;//ʵ�ʲ�ů���
	bzmj=0;//���ڲ�ů���
	ls_sql="SELECT tcjg,bzmj,sjmj,pmzjdj";
	ls_sql+=" FROM bj_khwntcmch";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ls_sql+=" and lx='1'";//1����ů�ײͣ�2�������ײ�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bztcjg=rs.getDouble("tcjg");
		wntcpmzjdj=rs.getDouble("pmzjdj");
		bzmj=rs.getInt("bzmj");
		sjmj=rs.getInt("sjmj");

		wntcjgh+=bztcjg;
		if (sjmj>bzmj)
		{
			wntcjgh+=(sjmj-bzmj)*wntcpmzjdj;
		}

		wntcjgh=cf.round(wntcjgh,2);
	}
	rs.close();
	ps.close();

	double jytcjgh=0;//�����ײ�

	bztcjg=0;
	wntcpmzjdj=0;//ƽ�����ӵ���
	sjmj=0;//ʵ�ʲ�ů���
	bzmj=0;//���ڲ�ů���
	ls_sql="SELECT tcjg,bzmj,sjmj,pmzjdj";
	ls_sql+=" FROM bj_khwntcmch";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ls_sql+=" and lx='2'";//1����ů�ײͣ�2�������ײ�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bztcjg=rs.getDouble("tcjg");
		wntcpmzjdj=rs.getDouble("pmzjdj");
		bzmj=rs.getInt("bzmj");
		sjmj=rs.getInt("sjmj");

		jytcjgh+=bztcjg;
		if (sjmj>bzmj)
		{
			jytcjgh+=(sjmj-bzmj)*wntcpmzjdj;
		}

		jytcjgh=cf.round(jytcjgh,2);
	}
	rs.close();
	ps.close();


	double cltcjgh=0;//�����ײ�
	ls_sql="SELECT sum(tcjg)";
	ls_sql+=" FROM bj_khcltcmch";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ls_sql+=" and lx='1'";//1�������ײ�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cltcjgh=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//�ײͱ�׼�۸�������ӽ�����������ۣ��ַ������ĳ����Ӽۣ�С�����ĳ����Ӽۣ����շ�����-���ļ���+������Ĳ����+������ĳ����Ӽ�
	//�����̳����Ӽۣ��ײ���ʩ�������
	double tczeq=0;
	tczeq=tcjg+mjzjzj+zcsjcjq+zccljjq+zcxlcljjq+xsfzcq+gccljjq+tcwgczjq-zcjmjeq+dpsjq;
	tczeq=cf.round(tczeq,2);
	
	double tczeh=0;
	tczeh=tcjg+mjzjzj+zcsjcjh+zccljjh+zcxlcljjh+xsfzch+gccljjh+tcwgczjh-zcjmjeh+dpsjh;
	tczeh=cf.round(tczeh,2);
	
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
    <td ><strong>���ǰ�����</strong></td>
    <td ><strong>����󣭽��</strong></td>
    <td ><strong>���</strong></td>
    <td ><strong>��ע</strong></td>
  </tr>
  <tr align="center"  >
    <td width="5%"  >��</td>
    <td width="20%"  >�ײͱ�׼�۸�</td>
    <td width="13%"  ><%=tcjg%></td>
    <td width="13%"  ><%=tcjg%></td>
    <td width="13%"  >&nbsp;</td>
    <td width="36%" align="left" ><%=bjjbmc%></td>
  </tr>
  <tr align="center"  >
    <td>��</td>
    <td  >������ӽ��</td>
    <td  ><%=mjzjzj%></td>
    <td  ><%=mjzjzj%></td>
    <td  >&nbsp;</td>
    <td align="left" >�������<%=mjzj%>ƽ�ף�ÿƽ��<%=pmzjdj%>Ԫ</td>
  </tr>
  <tr align="center"  >
    <td rowspan="9"  >��</td>
    <td  >�����������</td>
    <td  ><%=zcsjcjq%></td>
    <td  ><%=zcsjcjh%></td>
    <td  ><%=cf.round(zcsjcjh-zcsjcjq,2)%></td>
    <td align="left" >&nbsp;</td>
  </tr>
  <tr align="center">
    <td >���ĳ����Ӽ�</td>
    <td ><%=cf.round(zccljjq+zcxlcljjq,2)%></td>
    <td ><%=cf.round(zccljjh+zcxlcljjh,2)%></td>
    <td ><%=cf.round(zccljjh+zcxlcljjh-(zccljjq+zcxlcljjq),2)%></td>
    <td align="left" >ʵ����������������������</td>
  </tr>
  <tr align="center"  >
    <td >���շ�����</td>
    <td ><%=xsfzcq%></td>
    <td ><%=xsfzch%></td>
    <td ><%=cf.round(xsfzch-xsfzcq,2)%></td>
    <td align="left">�ײ������շ�����</td>
  </tr>
  <tr align="center"  >
    <td >���ļ���</td>
    <td >-<%=zcjmjeq%></td>
    <td >-<%=zcjmjeh%></td>
    <td ><%=cf.round(-1*zcjmjeh+zcjmjeq,2)%></td>
    <td align="left" >���ı������˿�</td>
  </tr>
  <tr align="center"  >
    <td >��������</td>
    <td ><%=dpsjq%></td>
    <td ><%=dpsjh%></td>
    <td ><%=cf.round(dpsjh-dpsjq,2)%></td>
    <td align="left" >�ײͶ������������</td>
  </tr>
  <tr align="center"  >
    <td >��������շ�</td>
    <td ><%=dpdlsfq%></td>
    <td ><%=dpdlsfh%></td>
    <td ><%=cf.round(dpdlsfh-dpdlsfq,2)%></td>
    <td align="left" >��������շ�����</td>
  </tr>
  <tr align="center"  >
    <td >ѡ����</td>
    <td ><%=xpxq%></td>
    <td ><%=xpxh%></td>
    <td ><%=cf.round(xpxh-xpxq,2)%></td>
    <td align="left" >�ײ�ѡ������</td>
  </tr>


<tr align="center"  >
    <td >�ײ���ʩ�������</td>
    <td ><%=tcwgczjq%></td>
    <td ><%=tcwgczjh%></td>
    <td ><%=cf.round(tcwgczjh-tcwgczjq,2)%></td>
    <td align="left" >�ײ�������ʩ�����������</td>
  </tr>
  <tr align="center"  >
    <td >���̳����Ӽ�</td>
    <td ><%=gccljjq%></td>
    <td ><%=gccljjh%></td>
    <td ><%=cf.round(gccljjh-gccljjq,2)%></td>
    <td align="left" >ʵ����������������������</td>
  </tr>
 
<%
	double tczjh=tczeh;
	double tczjq=tczeq;

	String sfxmbm=null;
	String sfxmmc=null;

	double sfbfb=0;
	double sfje=0;
	double zqsfje=0;

	ls_sql="SELECT sfxmbm,sfxmmc,sfbfb,sfje,zqsfje";
	ls_sql+=" FROM bj_sfxmmxh  ";
    ls_sql+=" where bj_sfxmmxh.zjxxh='"+zjxxh+"' and bj_sfxmmxh.sfxmlx not in('5','6','7','8','A','B','C')";//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
    ls_sql+=" order by bj_sfxmmxh.sfxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sfxmbm=cf.fillHtml(rs.getString("sfxmbm"));
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		sfbfb=rs.getDouble("sfbfb");
		sfje=rs.getDouble("sfje");
		zqsfje=rs.getDouble("zqsfje");


		double sfjeq=0;
		double zqsfjeq=0;
		ls_sql="SELECT sfje,zqsfje";
		ls_sql+=" FROM bj_sfxmmxq  ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and sfxmbm='"+sfxmbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sfjeq=rs1.getDouble("sfje");
			zqsfjeq=rs1.getDouble("zqsfje");
		}
		rs1.close();
		ps1.close();
		
		
		tczjq+=zqsfjeq;
		tczjh+=zqsfje;

		%> 
	
		  <tr bgcolor="#FFFFFF" align="center"  height="31"> 
			<td>��</td>
			<td><%=sfxmmc%></td>
			<td><%=cf.formatDouble(zqsfjeq,"#########.##")%></td>
			<td><%=cf.formatDouble(zqsfje,"#########.##")%></td>
			<td><%=cf.formatDouble(zqsfje-zqsfjeq,"#########.##")%></td>
			<td align="left" >�� =���� + �� + �ۣ��� <%=sfbfb%>% ����·�������Ŀ</td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

	tczjq=cf.round(tczjq,2);
	tczjh=cf.round(tczjh,2);

%>
  <tr align="center"  >
    <td>��</td>
    <td  >�ײ��ܼ�</td>
    <td><%=tczjq%></td>
    <td><%=tczjh%></td>
    <td><%=cf.round(tczjh-tczjq,2)%></td>
    <td align="left" >�� = �� + �� + �� + ��</td>
  </tr>

<%
	tcnzjq=tczjq;
	tcnzjh=tczjh;


	ls_sql="SELECT sfxmbm,sfxmmc,sfbfb,sfje,zqsfje";
	ls_sql+=" FROM bj_sfxmmxh  ";
    ls_sql+=" where bj_sfxmmxh.zjxxh='"+zjxxh+"' and bj_sfxmmxh.sfxmlx in('5')";//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
    ls_sql+=" order by bj_sfxmmxh.sfxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sfxmbm=cf.fillHtml(rs.getString("sfxmbm"));
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		sfbfb=rs.getDouble("sfbfb");
		sfje=rs.getDouble("sfje");
		zqsfje=rs.getDouble("zqsfje");

		double sfjeq=0;
		double zqsfjeq=0;
		ls_sql="SELECT sfje,zqsfje";
		ls_sql+=" FROM bj_sfxmmxq  ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and sfxmbm='"+sfxmbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sfjeq=rs1.getDouble("sfje");
			zqsfjeq=rs1.getDouble("zqsfje");
		}
		rs1.close();
		ps1.close();

		tcnzjq+=zqsfjeq;
		tcnzjh+=zqsfje;

		%> 
	
		  <tr bgcolor="#FFFFFF" align="center"  height="31"> 
			<td>��</td>
			<td><%=sfxmmc%></td>
			<td><%=cf.formatDouble(zqsfjeq,"#########.##")%></td>
			<td><%=cf.formatDouble(zqsfje,"#########.##")%></td>
			<td><%=cf.formatDouble(zqsfje-zqsfjeq,"#########.##")%></td>
			<td align="left" >�� = �� �� <%=sfbfb%>%</td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sfxmbm,sfxmmc,sfbfb,sfje,zqsfje";
	ls_sql+=" FROM bj_sfxmmxh  ";
    ls_sql+=" where bj_sfxmmxh.zjxxh='"+zjxxh+"' and bj_sfxmmxh.sfxmlx in('6')";//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹���ѣ�6������˰��7����˾�����Ĺ���ѣ�8����˾������˰��A���Թ����Ĺ���ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
    ls_sql+=" order by bj_sfxmmxh.sfxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sfxmbm=cf.fillHtml(rs.getString("sfxmbm"));
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		sfbfb=rs.getDouble("sfbfb");
		sfje=rs.getDouble("sfje");
		zqsfje=rs.getDouble("zqsfje");

		double sfjeq=0;
		double zqsfjeq=0;
		ls_sql="SELECT sfje,zqsfje";
		ls_sql+=" FROM bj_sfxmmxq  ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and sfxmbm='"+sfxmbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sfjeq=rs1.getDouble("sfje");
			zqsfjeq=rs1.getDouble("zqsfje");
		}
		rs1.close();
		ps1.close();

		tcnzjq+=zqsfjeq;
		tcnzjh+=zqsfje;

		%> 
	
		  <tr bgcolor="#FFFFFF" align="center"  height="31"> 
			<td>��</td>
			<td><%=sfxmmc%></td>
			<td><%=cf.formatDouble(zqsfjeq,"#########.##")%></td>
			<td><%=cf.formatDouble(zqsfje,"#########.##")%></td>
			<td><%=cf.formatDouble(zqsfje-zqsfjeq,"#########.##")%></td>
			<td align="left" >�� =( �� + �� ) �� <%=sfbfb%>%</td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

	tcnzjq=cf.round(tcnzjq,2);
	tcnzjh=cf.round(tcnzjh,2);


	ls_sql="SELECT sum(wdzje)";
	ls_sql+=" FROM jc_zcdd  ";
    ls_sql+=" where khbh='"+khbh+"'";//1��ϵͳ����Ʒ�ƶ�����2��ϵͳ������Ʒ�ƶ�����3����¼��ͬ��4���п�涩����5���ײͷֽⶩ��
	ls_sql+=" and clzt>='09' and clzt not in('98','99')";//09����ͬ�����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcwzj=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(zqzjxze)";
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
	
	htzjq=tcnzjq+tcwzj;
	htzjh=tcnzjh+tcwzj;
%>
  <tr align="center"  >
	<td>��</td>
	<td>�ײ�����������</td>
	<td><%=tcwzj%></td>
	<td><%=tcwzj%></td>
	<td>&nbsp;</td>
	<td align="left" >���ƹ���ѡ�˰�𣬲��μ��κλ</td>
  </tr>
  <tr align="center"  >
    <td>��</td>
    <td>�ܼ�</td>
    <td><%=htzjq%></td>
    <td><%=htzjh%></td>
    <td><%=cf.round(htzjh-htzjq,2)%></td>
    <td align="left" >�� = �� + ��</td>
  </tr>
<%
	if (zctcjgq!=0 || zctcjgh!=0)
	{
		%>
		  <tr align="center"  >
			<td>&nbsp;</td>
			<td >�Ҿ��ײ�</td>
			<td ><%=zctcjgq%></td>
			<td ><%=zctcjgh%></td>
			<td><%=cf.round(zctcjgh-zctcjgq,2)%></td>
			<td align="left" >&nbsp;</td>
		  </tr>
		<%
	}
	if (jkjhjgq!=0 || jkjhjgh!=0)
	{
		%>
		  <tr align="center"  >
			<td>&nbsp;</td>
			<td >�����ƻ�</td>
			<td ><%=jkjhjgq%></td>
			<td ><%=jkjhjgh%></td>
			<td><%=cf.round(jkjhjgh-jkjhjgq,2)%></td>
			<td align="left" >&nbsp;</td>
		  </tr>
		<%
	}
	if (wntcjgq!=0 || wntcjgh!=0)
	{
		%>
		  <tr align="center"  >
			<td>&nbsp;</td>
			<td >��ů�ײ�</td>
			<td ><%=wntcjgq%></td>
			<td ><%=wntcjgh%></td>
			<td><%=cf.round(wntcjgh-wntcjgq,2)%></td>
			<td align="left" >&nbsp;</td>
		  </tr>
		<%
	}
	if (jytcjgq!=0 || jytcjgh!=0)
	{
		%>
		  <tr align="center"  >
			<td>&nbsp;</td>
			<td >�����ƻ�</td>
			<td ><%=jytcjgq%></td>
			<td ><%=jytcjgh%></td>
			<td><%=cf.round(jytcjgh-jytcjgq,2)%></td>
			<td align="left" >&nbsp;</td>
		  </tr>
		<%
	}
	if (cltcjgq!=0 || cltcjgh!=0)
	{
		%>
		  <tr align="center"  >
			<td>&nbsp;</td>
			<td >ɫ�ʼƻ�</td>
			<td ><%=cltcjgq%></td>
			<td ><%=cltcjgh%></td>
			<td><%=cf.round(cltcjgh-cltcjgq,2)%></td>
			<td align="left" >&nbsp;</td>
		  </tr>
		<%
	}

%>
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






