<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<table border="1" width="900%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
 <tr bgcolor="#FFFFFF" >
      <td colspan="194"> 
		<input type="button"  value="����" onClick="f_do(insertform)">
		<input type="reset"  value="����" name="reset">      
		</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="90px" rowspan="3" >���</td>
	<td  width="140px" rowspan="3">�������</td>
	<td  width="140px" rowspan="3">��ͬ��</td>
	<td  width="140px" rowspan="3">�ͻ�����</td>
	<td  width="3%" rowspan="3">���ݵ�ַ</td>
	<td  width="140px" rowspan="3">�������</td>
	<td  width="140px" rowspan="3">���ۼ���</td>

	<td  width="140px" rowspan="3">�ص���־</td>
	<td  width="140px" rowspan="3">�곤</td>
	<td  width="140px" rowspan="3">��Ա</td>
	<td  width="140px" rowspan="3">����ҵ��</td>
	<td  width="140px" rowspan="3">���ʦ</td>
	<td  width="140px" rowspan="3">����Ա</td>
	<td  width="140px" rowspan="3">�ͻ�����</td>
	<td  width="140px" rowspan="3">С������</td>
	<td  width="140px" rowspan="3">С���鳤</td>
	<td  width="140px" rowspan="3">С��רԱ</td>
	<td  width="140px" rowspan="3">����Ӫ������</td>
	<td  width="140px" rowspan="3">Ӫ��רԱ</td>
	<td  width="140px" rowspan="3">��վ�߻�</td>
	<td  width="140px" rowspan="3">��ҳ���</td>
	<td  width="140px" rowspan="3">��վ����Ա</td>
	<td  width="140px" rowspan="3">�绰רԱ</td>
	<td  width="140px" rowspan="3">��վ�ƹ�Ա</td>
	<td  width="140px" rowspan="3">˾��</td>


	<td  width="140px" rowspan="3">��Ʒ�</td>
	<td  width="140px" rowspan="3">Զ�̷�</td>
	<td  width="140px" rowspan="3">��ǰ���</td>
	<td  width="140px" rowspan="3">�ۿ�</td>
	<td  width="140px" rowspan="3">˰��</td>
	<td  width="140px" rowspan="3">�ۺ�������</td>
	<td  width="140px" rowspan="3">��������</td>
	<td  width="140px" rowspan="3">���������</td>
	<td  width="140px" rowspan="3">�ײ�����������</td>
	<td colspan="9">�곤</td>
	<td colspan="3">��Ա</td>
	<td colspan="9">����ҵ��</td>
	<td colspan="9">���ʦ</td>
	<td colspan="8">�ͻ�����</td>
	<td colspan="5">����Ա</td>
	<td colspan="5">С������</td>
	<td colspan="5">С���鳤</td>
	<td colspan="5">С��רԱ</td>
	<td colspan="5">����Ӫ������</td>
	<td colspan="2">Ӫ��רԱ</td>
	<td colspan="2">��վ�߻�</td>
	<td colspan="2">��ҳ���</td>
	<td colspan="2">��վ����Ա</td>
	<td colspan="2">�绰רԱ</td>
	<td colspan="5">��վ�ƹ�Ա</td>
	<td colspan="2">˾��</td>
	<td  width="140px" rowspan="3">�����ܶ�</td>

</tr>

<tr bgcolor="#CCCCCC"  align="center">
	<td colspan="3">��Ʒ�</td>
	<td colspan="3">װ�޷�</td>
	<td colspan="3">���С��</td>

	<td colspan="3">��Ա���</td>

	<td colspan="3">��Ʒ�</td>
	<td colspan="3">װ�޷�</td>
	<td colspan="3">���С��</td>

	<td colspan="3">��Ʒ�</td>
	<td colspan="3">װ�޷�</td>
	<td colspan="2">Զ�̷�</td>
	<td >��ɺϼ�</td>

	<td colspan="3">װ�޷�</td>
	<td colspan="2">Զ�̷�</td>
	<td colspan="3">���С��</td>

	<td colspan="3">װ�޷�</td>
	<td colspan="2">���С��</td>

	<td colspan="3">װ�޷�</td>
	<td colspan="2">���С��</td>

	<td colspan="3">װ�޷�</td>
	<td colspan="2">���С��</td>

	<td colspan="3">װ�޷�</td>
	<td colspan="2">���С��</td>

	<td colspan="3">װ�޷�</td>
	<td colspan="2">���С��</td>

	<td colspan="2">���С��</td>

	<td colspan="2">���С��</td>

	<td colspan="2">���С��</td>

	<td colspan="2">���С��</td>

	<td colspan="2">���С��</td>

	<td colspan="3">װ�޷�</td>
	<td colspan="2">���С��</td>

	<td colspan="2">���С��</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="140px">��ɱ���</td>
	<td  width="140px">ǩԼ���</td>
	<td  width="140px">�������</td>
	<td  width="140px">��ɱ���</td>
	<td  width="140px">ǩԼ���</td>
	<td  width="140px">�������</td>
	<td  width="140px">���С��</td>
	<td  width="140px">���˱���</td>
	<td  width="140px">����ܶ�</td>

	<td  width="140px">��ɱ���</td>
	<td  width="140px">ǩԼ���</td>
	<td  width="140px">�������</td>

	<td  width="140px">��ɱ���</td>
	<td  width="140px">ǩԼ���</td>
	<td  width="140px">�������</td>
	<td  width="140px">��ɱ���</td>
	<td  width="140px">ǩԼ���</td>
	<td  width="140px">�������</td>
	<td  width="140px">���С��</td>
	<td  width="140px">���˱���</td>
	<td  width="140px">����ܶ�</td>

	<td  width="140px">��ɱ���</td>
	<td  width="140px">ǩԼ���</td>
	<td  width="140px">�������</td>
	<td  width="140px">��ɱ���</td>
	<td  width="140px">ǩԼ���</td>
	<td  width="140px">�������</td>
	<td  width="140px">��ɱ���</td>
	<td  width="140px">�������</td>
	<td  width="140px">��ɺϼ�</td>

	<td  width="140px">��ɱ���</td>
	<td  width="140px">ǩԼ���</td>
	<td  width="140px">�������</td>
	<td  width="140px">��ɱ���</td>
	<td  width="140px">�������</td>
	<td  width="140px">���С��</td>
	<td  width="140px">���˷���</td>
	<td  width="140px">����ܶ�</td>

	<td  width="140px">��ɱ���</td>
	<td  width="140px">ǩԼ���</td>
	<td  width="140px">�������</td>
	<td  width="140px">���˱���</td>
	<td  width="140px">���</td>

	<td  width="140px">��ɱ���</td>
	<td  width="140px">ǩԼ���</td>
	<td  width="140px">�������</td>
	<td  width="140px">���˱���</td>
	<td  width="140px">���</td>

	<td  width="140px">��ɱ���</td>
	<td  width="140px">ǩԼ���</td>
	<td  width="140px">�������</td>
	<td  width="140px">���˱���</td>
	<td  width="140px">���</td>

	<td  width="140px">��ɱ���</td>
	<td  width="140px">ǩԼ���</td>
	<td  width="140px">�������</td>
	<td  width="140px">���˱���</td>
	<td  width="140px">���</td>

	<td  width="140px">��ɱ���</td>
	<td  width="140px">ǩԼ���</td>
	<td  width="140px">�������</td>
	<td  width="140px">���˱���</td>
	<td  width="140px">���</td>

	<td  width="140px">��ɱ���</td>
	<td  width="140px">ǩԼ���</td>

	<td  width="140px">��ɱ���</td>
	<td  width="140px">ǩԼ���</td>

	<td  width="140px">��ɱ���</td>
	<td  width="140px">ǩԼ���</td>

	<td  width="140px">��ɱ���</td>
	<td  width="140px">ǩԼ���</td>

	<td  width="140px">��ɱ���</td>
	<td  width="140px">ǩԼ���</td>

	<td  width="140px">��ɱ���</td>
	<td  width="140px">ǩԼ���</td>
	<td  width="140px">�������</td>
	<td  width="140px">���˱���</td>
	<td  width="140px">���</td>

	<td  width="140px">��ɱ���</td>
	<td  width="140px">ǩԼ���</td>
</tr>
<%
String fgsbh=request.getParameter("fgsbh");
String khzq=request.getParameter("khzq");

String tcqssj=cf.executeQuery("select TO_CHAR(khqssj,'YYYY-MM-DD') from cw_jrkhzq where khzq='"+khzq+"' and fgsbh='"+fgsbh+"'");
String tcjzsj=cf.executeQuery("select TO_CHAR(khjzsj,'YYYY-MM-DD') from cw_jrkhzq where khzq='"+khzq+"' and fgsbh='"+fgsbh+"'");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String khbh=null;
String hth=null;
String khxm=null;
String fwdz=null;
String sjsjsbz=null;
String sjsjsbzmc=null;
String dwbh=null;
String khjsbz=null;
String gcjdbm=null;
String hdbz=null;
String hdlxmc=null;
String sjs=null;
String khjl=null;
String clgw=null;
String zjxm=null;
int fwmj=0;
String bjjbbm="";
String bjjbmc="";
String tckh="";//1�����ײͣ�2���ײ�
String lx="";

String dianz=null;//�곤
String weny=null;//��Ա
String xqzg=null;//С������
String xqzz=null;//С���鳤
String xqzy=null;//С��רԱ
String wlyxzg=null;//����Ӫ������
String yxzy=null;//Ӫ��רԱ
String wzch=null;//��վ�߻�
String wysj=null;//��ҳ���
String wzcxy=null;//��վ����Ա
String dhzy=null;//�绰רԱ
String wztgy=null;//��վ�ƹ�Ա
String siji=null;//˾��

double wdzgce=0;
double qye=0;
double suijin=0;
double sjf=0;
double sjhtsjf=0;
double zhljzjx=0;

double ycf=0;//Զ�̷�
double zjxbl=0;//���������
double dgzcje=0;//�������Ľ��
double tcwzczx=0;//�ײ�����������

String bgcolor="";

//��ɱ���
double dzsjftcbl=0;
double dzzxftcbl=0;
double wyzxftcbl=0;
double khjlsjftcbl=0;
double khjlzxftcbl=0;
double sjssjftcbl=0;
double sjszxftcbl=0;
double sjsycftcbl=0;
double zjzxftcbl=0;
double zjycftcbl=0;

double clyzxftcbl=0;
double xqzgzxftcbl=0;
double xqzzzxftcbl=0;
double xqzyzxftcbl=0;
double wlyxzgzxftcbl=0;
double yxzyzxftcbl=0;
double wzchzxftcbl=0;
double wysjzxftcbl=0;
double wzcxyzxftcbl=0;
double dhzyzxftcbl=0;
double wztgyzxftcbl=0;
double sjzxftcbl=0;
//��ɱ���

try {
	conn=cf.getConnection();

	//��ɱ���
	ls_sql="select clyzxftcbl,dzsjftcbl,dzzxftcbl,wyzxftcbl,khjlsjftcbl,khjlzxftcbl,sjssjftcbl,sjszxftcbl,sjsycftcbl,zjzxftcbl,zjycftcbl,xqzgzxftcbl,xqzzzxftcbl,xqzyzxftcbl,wlyxzgzxftcbl,yxzyzxftcbl,wzchzxftcbl,wysjzxftcbl,wzcxyzxftcbl,dhzyzxftcbl,wztgyzxftcbl,sjzxftcbl ";
	ls_sql+=" from  cw_jrtcbl";
	ls_sql+=" where fgsbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clyzxftcbl=rs.getDouble("clyzxftcbl");
		dzsjftcbl=rs.getDouble("dzsjftcbl");
		dzzxftcbl=rs.getDouble("dzzxftcbl");
		wyzxftcbl=rs.getDouble("wyzxftcbl");
		khjlsjftcbl=rs.getDouble("khjlsjftcbl");
		khjlzxftcbl=rs.getDouble("khjlzxftcbl");
		sjssjftcbl=rs.getDouble("sjssjftcbl");
		sjszxftcbl=rs.getDouble("sjszxftcbl");
		sjsycftcbl=rs.getDouble("sjsycftcbl");
		zjzxftcbl=rs.getDouble("zjzxftcbl");
		zjycftcbl=rs.getDouble("zjycftcbl");
		xqzgzxftcbl=rs.getDouble("xqzgzxftcbl");
		xqzzzxftcbl=rs.getDouble("xqzzzxftcbl");
		xqzyzxftcbl=rs.getDouble("xqzyzxftcbl");
		wlyxzgzxftcbl=rs.getDouble("wlyxzgzxftcbl");
		yxzyzxftcbl=rs.getDouble("yxzyzxftcbl");
		wzchzxftcbl=rs.getDouble("wzchzxftcbl");
		wysjzxftcbl=rs.getDouble("wysjzxftcbl");
		wzcxyzxftcbl=rs.getDouble("wzcxyzxftcbl");
		dhzyzxftcbl=rs.getDouble("dhzyzxftcbl");
		wztgyzxftcbl=rs.getDouble("wztgyzxftcbl");
		sjzxftcbl=rs.getDouble("sjzxftcbl");
	}
	rs.close();
	ps.close();


	int row=0;

	ls_sql="select khbh,hth,khxm,fwdz,crm_khxx.sjsjsbz,DECODE(crm_khxx.sjsjsbz,'0','δ���','1','ǩ�����','2','�������') sjsjsbzmc,fgsbh,crm_khxx.dwbh,sjs,zjxm,khjl,clgw,hdbz,hdlxmc,fwmj,crm_khxx.bjjb,bjjbmc,khjsbz,gcjdbm";
	ls_sql+=" ,dianz,weny,xqzg,xqzz,xqzy,wlyxzg,yxzy,wzch,wysj,wzcxy,dhzy,wztgy,siji ";
	ls_sql+=" ,wdzgce,qye,suijin,sjf,sjhtsjf,zhljzjx ";

	ls_sql+=" from  crm_khxx,sq_dwxx,bdm_bjjbbm,dm_hdlxbm";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and  crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and  crm_khxx.hdbz=dm_hdlxbm.hdlxbm(+)";
	
	ls_sql+=" and crm_khxx.fgsbh='"+fgsbh+"'";

	ls_sql+=" and ";
	ls_sql+=" ( ";

	ls_sql+=" ( ";//ǩ���ͻ�
	ls_sql+=" crm_khxx.zt!='3'";//2����װ�ͻ���3���˵��ͻ���4�����ɿͻ���5����ƿͻ�
	ls_sql+=" and crm_khxx.sjsjsbz='0'";//0��δ��ɣ�1��ǩ����ɣ�2���������
	ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+"','YYYY-MM-DD') ";
	ls_sql+=" ) ";

	ls_sql+=" OR ";
	ls_sql+=" ( ";//�˵��ͻ�
	ls_sql+=" crm_khxx.zt='3'";//2����װ�ͻ���3���˵��ͻ���4�����ɿͻ���5����ƿͻ�
	ls_sql+=" and crm_khxx.sjsjsbz='1'";//0��δ��ɣ�1��ǩ����ɣ�2���������
	ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+tcjzsj+"','YYYY-MM-DD') ";
	ls_sql+=" ) ";

	ls_sql+=" OR ";
	ls_sql+=" ( ";//����ͻ�
	ls_sql+=" crm_khxx.zt='2'";//2����װ�ͻ���3���˵��ͻ���4�����ɿͻ���5����ƿͻ�
	ls_sql+=" and crm_khxx.sjsjsbz='1'";//0��δ��ɣ�1��ǩ����ɣ�2���������
	ls_sql+=" and crm_khxx.gdjsjd='8'";//8���깤����
	ls_sql+=" and crm_khxx.khjsbz='Y'";//'N','δ����','Y','�ѽ���','S','�����'
	ls_sql+=" ) ";

	ls_sql+=" ) ";
    ls_sql+=" order by crm_khxx.dwbh,sjs,khxm";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		khbh=cf.fillNull(rs1.getString("khbh"));
		hth=cf.fillNull(rs1.getString("hth"));
		khxm=cf.fillNull(rs1.getString("khxm"));
		fwdz=cf.fillNull(rs1.getString("fwdz"));
		sjsjsbz=cf.fillNull(rs1.getString("sjsjsbz"));
		sjsjsbzmc=cf.fillNull(rs1.getString("sjsjsbzmc"));
		fgsbh=cf.fillNull(rs1.getString("fgsbh"));
		dwbh=cf.fillNull(rs1.getString("dwbh"));
		sjs=cf.fillNull(rs1.getString("sjs"));
		zjxm=cf.fillNull(rs1.getString("zjxm"));
		khjl=cf.fillNull(rs1.getString("khjl"));
		clgw=cf.fillNull(rs1.getString("clgw"));
		hdbz=cf.fillNull(rs1.getString("hdbz"));
		hdlxmc=cf.fillNull(rs1.getString("hdlxmc"));
		fwmj=rs1.getInt("fwmj");
		bjjbbm=cf.fillNull(rs1.getString("bjjb"));
		bjjbmc=cf.fillNull(rs1.getString("bjjbmc"));
		khjsbz=cf.fillNull(rs1.getString("khjsbz"));
		gcjdbm=cf.fillNull(rs1.getString("gcjdbm"));

		dianz=cf.fillNull(rs1.getString("dianz"));
		weny=cf.fillNull(rs1.getString("weny"));
		xqzg=cf.fillNull(rs1.getString("xqzg"));
		xqzz=cf.fillNull(rs1.getString("xqzz"));
		xqzy=cf.fillNull(rs1.getString("xqzy"));
		wlyxzg=cf.fillNull(rs1.getString("wlyxzg"));
		yxzy=cf.fillNull(rs1.getString("yxzy"));
		wzch=cf.fillNull(rs1.getString("wzch"));
		wysj=cf.fillNull(rs1.getString("wysj"));
		wzcxy=cf.fillNull(rs1.getString("wzcxy"));
		dhzy=cf.fillNull(rs1.getString("dhzy"));
		wztgy=cf.fillNull(rs1.getString("wztgy"));
		siji=cf.fillNull(rs1.getString("siji"));
		
		
		wdzgce=rs1.getDouble("wdzgce");
		qye=rs1.getDouble("qye");
		suijin=rs1.getDouble("suijin");
		sjf=rs1.getDouble("sjf");
		sjhtsjf=rs1.getDouble("sjhtsjf");
		zhljzjx=rs1.getDouble("zhljzjx");


		sjf=cf.round(sjf+sjhtsjf,2);


		//Զ�̷�
		ls_sql="select sum(sfje)";
		ls_sql+=" from  bj_sfxmmx";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and sfxmbm in('02','03','04','05','08','09','10','11','12','14')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ycf=rs.getDouble(1);
		}
		rs.close();
		ps.close();


		//���������
		if (qye!=0)
		{
			zjxbl=cf.round(zhljzjx*100/qye,2);
		}
		else{
			zjxbl=0;
		}

		if (sjsjsbz.equals("2"))//0��δ��ɣ�1��ǩ����ɣ�2���������
		{
			out.println("�����ѽ������");
			return;
		}

		if (sjsjsbz.equals("0"))
		{
			lx="1";//1��ǩ����ɣ�2���������
		}
		else if (sjsjsbz.equals("1"))
		{
			lx="2";//1��ǩ����ɣ�2���������
		}

		ls_sql="select lx";
		ls_sql+=" from  bdm_bjjbbm";
		ls_sql+=" where bjjbbm='"+bjjbbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tckh=rs.getString("lx");
		}
		rs.close();
		ps.close();

		//�ײ�����������
		if (tckh.equals("2"))
		{
			suijin=cf.round(wdzgce*0.033,2); //�ײͣ���ǰ����0.033

			//�������� �ײ�ֻ������
			ls_sql="select tcwsgzjzjx+tcwgccljjzjx";
			ls_sql+=" from  crm_tckhqye";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				zhljzjx=rs.getDouble(1);
			}
			rs.close();
			ps.close();


			ls_sql="SELECT sum(hkze+zjhze)";
			ls_sql+=" FROM jc_zcdd  ";
			ls_sql+=" where khbh='"+khbh+"'";//1��ϵͳ����Ʒ�ƶ�����2��ϵͳ������Ʒ�ƶ�����3����¼��ͬ��4���п�涩����5���ײͷֽⶩ��
			ls_sql+=" and clzt>='09' and clzt not in('98','99')";//09����ͬ�����
			ls_sql+=" and sfjrht='Y'";//�Ƿ�����ͬ  Y�����룻N��������
			ls_sql+=" and ddlx not in('1','3','4','9')";//1������Ʒ��3����¼��ͬ��4���п�涩����5����׼�ײͣ�6���Ҿ߽����ײͣ�7����ů�����ײͣ�8�������ײͣ�9���������ģ�A:����������B:��������շѡ�C:ѡ������
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				tcwzczx=rs.getDouble(1);
			}
			rs.close();
			ps.close();
		}
		
		qye=cf.round(qye-suijin,2);



		double dzkhbl=0;//�곤���˱���
		double khjlkhbl=0;//����ҵ�񿼺˱���
		double zjkhbl=0;//�ͻ��������˷���
		double clykhbl=0;//����Ա���˱���
		double xqzgkhbl=0;//С�����ܿ��˱���
		double xqzzkhbl=0;//С���鳤���˱���
		double xqzykhbl=0;//С��רԱ���˱���
		double wlyxzgkhbl=0;//����Ӫ�����ܿ��˱���
		double wztgykhbl=0;//��վ�ƹ�Ա���˱���


		//�곤���˱���
		ls_sql="select dzkhbl";
		ls_sql+=" from  cw_jryjkh";
		ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"' and yhmc='"+dianz+"' and zw='41'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			dzkhbl=rs.getDouble("dzkhbl");
		}
		rs.close();
		ps.close();

		//����ҵ�񿼺˱���
		ls_sql="select dzkhbl";
		ls_sql+=" from  cw_jryjkh";
		ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"' and yhmc='"+khjl+"' and zw='03'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khjlkhbl=rs.getDouble("dzkhbl");
		}
		rs.close();
		ps.close();

		//�ͻ��������˷���
		ls_sql="select khfs";
		ls_sql+=" from  cw_jrzjyjkh";
		ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"' and yhmc='"+zjxm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zjkhbl=rs.getDouble("khfs");
		}
		rs.close();
		ps.close();

		//����Ա���˱���
		ls_sql="select dzkhbl";
		ls_sql+=" from  cw_jryjkh";
		ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"' and yhmc='"+clgw+"' and zw='08'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			clykhbl=rs.getDouble("dzkhbl");
		}
		rs.close();
		ps.close();

		//С�����ܿ��˱���
		ls_sql="select dzkhbl";
		ls_sql+=" from  cw_jryjkh";
		ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"' and yhmc='"+xqzg+"' and zw='42'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xqzgkhbl=rs.getDouble("dzkhbl");
		}
		rs.close();
		ps.close();

		//С���鳤���˱���
		ls_sql="select dzkhbl";
		ls_sql+=" from  cw_jryjkh";
		ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"' and yhmc='"+xqzz+"' and zw='43'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xqzzkhbl=rs.getDouble("dzkhbl");
		}
		rs.close();
		ps.close();

		//С��רԱ���˱���
		ls_sql="select dzkhbl";
		ls_sql+=" from  cw_jryjkh";
		ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"' and yhmc='"+xqzy+"' and zw='44'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xqzykhbl=rs.getDouble("dzkhbl");
		}
		rs.close();
		ps.close();

		//����Ӫ�����ܿ��˱���
		ls_sql="select dzkhbl";
		ls_sql+=" from  cw_jryjkh";
		ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"' and yhmc='"+wlyxzg+"' and zw='45'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			wlyxzgkhbl=rs.getDouble("dzkhbl");
		}
		rs.close();
		ps.close();

		//��վ�ƹ�Ա���˱���
		ls_sql="select dzkhbl";
		ls_sql+=" from  cw_jryjkh";
		ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"' and yhmc='"+wztgy+"' and zw='46'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			wztgykhbl=rs.getDouble("dzkhbl");
		}
		rs.close();
		ps.close();


		if (zjxbl>=2)//>2�����ͻ�������0.2%
		{
//			zjzxftcbl=cf.round(zjzxftcbl-0.2,2);
		}

		//���
		double dzqysjftc=0;//�곤ǩԼ��Ʒ����
		double dzjssjftc=0;//�곤������Ʒ����
		double dzqyzxtc=0;//�곤ǩԼװ�����
		double dzjszxtc=0;//�곤����װ�����
		double dztcxj=0;//�곤���С��
		double dztcze=0;//�곤����ܶ�

		double wyqyzxtc=0;//��ԱǩԼװ�����
		double wyjszxtc=0;//��Ա����װ�����


		double khjlqysjftc=0;  //����ҵ��ǩԼ��Ʒ����	
		double khjljssjftc=0;  //����ҵ�������Ʒ����	
		double khjlqyzxtc=0;   //����ҵ��ǩԼװ�����	    
		double khjljszxtc=0;   //����ҵ�����װ�����	    
		double khjltcxj=0;     //����ҵ�����С��	        
		double khjltcze=0;     //����ҵ������ܶ�	      

		double sjsqysjftc=0;    //���ʦǩԼ��Ʒ����	
		double sjsjssjftc=0;    //���ʦ������Ʒ����	
		double sjsqyzxtc=0; //���ʦǩԼװ�����	
		double sjsjszxtc=0; //���ʦ����װ�����	
		double sjsycftc=0;      //���ʦԶ�̷����	  
		double sjstchj=0;   //���ʦ��ɺϼ�	    

		double zjqyzxtc=0;  //�ͻ�����ǩԼװ�����		
		double zjjszxtc=0;  //�ͻ���������װ�����		
		double zjycftc=0;   //�ͻ�����Զ�̷����		
		double zjtcxj=0;    //�ͻ��������С��			
		double zjtchj=0;    //�ͻ�������ɺϼ�			

		double clyqyzxtc=0;  //�ͻ�����ǩԼװ�����		
		double clyjszxtc=0;  //�ͻ���������װ�����		
		double clytc=0;   //�ͻ�����Զ�̷����		

		double xqzgqyzxtc=0;    //С������ǩԼװ�����	
		double xqzgjszxtc=0;    //С�����ܽ���װ�����	
		double xqzgtc=0;    //С���������			
					   
		double xqzzqyzxtc=0;    //С���鳤ǩԼװ�����	
		double xqzzjszxtc=0;    //С���鳤����װ�����	
		double xqzztc=0;    //С���鳤���			
					   
		double xqzyqyzxtc=0;    //С��רԱǩԼװ�����	
		double xqzyjszxtc=0;    //С��רԱ����װ�����	
		double xqzytc=0;    //С��רԱ���			

		double wlyxzgqyzxtc=0;    //����Ӫ������ǩԼװ�����	
		double wlyxzgjszxtc=0;    //����Ӫ�����ܽ���װ�����	
		double wlyxzgtc=0;		  //����Ӫ���������			


		double yxzyqyzxtc=0;    //     Ӫ��רԱǩԼװ�����	
					   
		double wzchqyzxtc=0;    //     ��վ�߻�ǩԼװ�����	
					   
		double wysjqyzxtc=0;    //     ��ҳ���ǩԼװ�����	
					   
		double wzcxyqyzxtc=0;    //    ��վ����ԱǩԼװ�����	
					   
		double dhzyqyzxtc=0;    //     �绰רԱǩԼװ�����	
					   
		double wztgyqyzxtc=0;    //    ��վ�ƹ�ԱǩԼװ�����	
		double wztgyjszxtc=0;    //    ��վ�ƹ�Ա����װ�����	
		double wztgytc=0;    //        ��վ�ƹ�Ա���			
					   
		double sjqyzxtc=0;    //       ˾��ǩԼװ�����	

		double jjze=0;//��������

		if (sjsjsbz.equals("0"))//0��δ��ɣ�1��ǩ����ɣ�2���������
		{
			if (!dianz.equals(""))
			{
				dzqysjftc=cf.round(sjf*dzsjftcbl/200,2);//�곤ǩԼ��Ʒ����
				dzjssjftc=0;//�곤������Ʒ����
				dzqyzxtc=cf.round(qye*dzzxftcbl/200,2);//�곤ǩԼװ�����
				dzjszxtc=0;//�곤����װ�����
				dztcxj=cf.round(dzqysjftc+dzqyzxtc,2);//�곤���С��
				dztcze=cf.round(dztcxj*dzkhbl/100,2);//�곤����ܶ�
			}

			if (!weny.equals(""))
			{
				wyqyzxtc=cf.round(qye*wyzxftcbl/200,2);//��ԱǩԼװ�����
				wyjszxtc=0;//��Ա����װ�����
			}


			if (!khjl.equals(""))
			{
				khjlqysjftc=cf.round(sjf*khjlsjftcbl/200,2);  //����ҵ��ǩԼ��Ʒ����	
				khjljssjftc=0;  //����ҵ�������Ʒ����
				khjlqyzxtc=cf.round(qye*khjlzxftcbl/200,2);   //����ҵ��ǩԼװ�����	    
				khjljszxtc=0;   //����ҵ�����װ�����	 
				khjltcxj=cf.round(khjlqysjftc+khjlqyzxtc,2);     //����ҵ�����С��	        
				khjltcze=cf.round(dztcxj*khjlkhbl/100,2);     //����ҵ������ܶ�	    
			}
			
			if (!sjs.equals(""))
			{
				sjsqysjftc=cf.round(sjf*sjssjftcbl/200,2);    //���ʦǩԼ��Ʒ����	
				sjsjssjftc=0;    //���ʦ������Ʒ����	
				sjsqyzxtc=cf.round(qye*sjszxftcbl/200,2); //���ʦǩԼװ�����	
				sjsjszxtc=0; //���ʦ����װ�����	
				sjsycftc=cf.round(ycf*sjsycftcbl/100,2);      //���ʦԶ�̷����	 
				sjstchj=cf.round(sjsqysjftc+sjsqyzxtc+sjsycftc,2);   //���ʦ��ɺϼ�	    
			}

			if (!zjxm.equals(""))
			{
				zjqyzxtc=cf.round(qye*zjzxftcbl/200,2);  //�ͻ�����ǩԼװ�����		
				zjjszxtc=0;  //�ͻ���������װ�����		
				zjycftc=cf.round(ycf*zjycftcbl/100,2);   //�ͻ�����Զ�̷����		
				zjtcxj=cf.round(zjqyzxtc+zjycftc,2);    //�ͻ��������С��			
				zjtchj=cf.round(zjtcxj*zjkhbl/100,2);    //�ͻ�������ɺϼ�			
			}

			if (!clgw.equals(""))
			{
				clyqyzxtc=cf.round(qye*clyzxftcbl/200,2);  //����ԱǩԼװ�����		
				clyjszxtc=0;  //����Ա����װ�����		
				clytc=cf.round(clyqyzxtc*clykhbl/100,2);    //����Ա���			
			}

			if (!xqzg.equals(""))
			{
				xqzgqyzxtc=cf.round(qye*xqzgzxftcbl/200,2);    //С������ǩԼװ�����	
				xqzgjszxtc=0;    //С�����ܽ���װ�����	
				xqzgtc=cf.round(xqzgqyzxtc*xqzgkhbl/100,2);    //С���������			
			}
						   
			if (!xqzz.equals(""))
			{
				xqzzqyzxtc=cf.round(qye*xqzzzxftcbl/200,2);    //С���鳤ǩԼװ�����	
				xqzzjszxtc=0;    //С���鳤����װ�����	
				xqzztc=cf.round(xqzzqyzxtc*xqzzkhbl/100,2);    //С���鳤���			
			}
						   
			if (!xqzy.equals(""))
			{
				xqzyqyzxtc=cf.round(qye*xqzyzxftcbl/200,2);    //С��רԱǩԼװ�����	
				xqzyjszxtc=0;    //С��רԱ����װ�����	
				xqzytc=cf.round(xqzyqyzxtc*xqzykhbl/100,2);    //С��רԱ���			
			}

			if (!wlyxzg.equals(""))
			{
				wlyxzgqyzxtc=cf.round(qye*wlyxzgzxftcbl/200,2);  //����Ӫ������ǩԼװ�����	
				wlyxzgjszxtc=0;  //����Ӫ�����ܽ���װ�����	
				wlyxzgtc=cf.round(wlyxzgqyzxtc*wlyxzgkhbl/100,2);      //����Ӫ���������			
			}

			if (!yxzy.equals(""))
			{
				yxzyqyzxtc=cf.round(qye*yxzyzxftcbl/100,2);     //Ӫ��רԱǩԼװ�����	
			}
						   
			if (!wzch.equals(""))
			{
				wzchqyzxtc=cf.round(qye*wzchzxftcbl/100,2);     //��վ�߻�ǩԼװ�����	
			}
						   
			if (!wysj.equals(""))
			{
				wysjqyzxtc=cf.round(qye*wysjzxftcbl/100,2);     //��ҳ���ǩԼװ�����	
			}
						   
			if (!wzcxy.equals(""))
			{
				wzcxyqyzxtc=cf.round(qye*wzcxyzxftcbl/100,2);    //��վ����ԱǩԼװ�����	
			}
						   
			if (!dhzy.equals(""))
			{
				dhzyqyzxtc=cf.round(qye*dhzyzxftcbl/100,2);     //�绰רԱǩԼװ�����	
			}
						   
			if (!wztgy.equals(""))
			{
				wztgyqyzxtc=cf.round(qye*wztgyzxftcbl/200,2);    //��վ�ƹ�ԱǩԼװ�����	
				wztgyjszxtc=0;    //��վ�ƹ�Ա����װ�����	
				wztgytc=cf.round(wztgyqyzxtc*wztgykhbl/100,2);         //��վ�ƹ�Ա���			
			}
						   
			if (!siji.equals(""))
			{
				sjqyzxtc=cf.round(qye*sjzxftcbl/200,2);       //˾��ǩԼװ�����		
			}
		}
		else if (sjsjsbz.equals("1"))//0��δ��ɣ�1��ǩ����ɣ�2���������
		{
			ls_sql="select dzqysjftc,dzqyzxtc,wyqyzxtc,khjlqysjftc,khjlqyzxtc,sjsqysjftc,sjsqyzxtc,zjqyzxtc,xqzgqyzxtc,xqzzqyzxtc,xqzyqyzxtc ";
			ls_sql+=" ,wlyxzgqyzxtc,wztgyqyzxtc,sjqyzxtc";
			ls_sql+=" from  cw_jrtcmx";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				dzqysjftc=rs.getDouble("dzqysjftc");//�곤ǩԼ��Ʒ����
				dzqyzxtc=rs.getDouble("dzqyzxtc");//�곤ǩԼװ�����
				wyqyzxtc=rs.getDouble("wyqyzxtc");//��ԱǩԼװ�����
				khjlqysjftc=rs.getDouble("khjlqysjftc");//����ҵ��ǩԼ��Ʒ����
				khjlqyzxtc=rs.getDouble("khjlqyzxtc");//����ҵ��ǩԼװ�����
				sjsqysjftc=rs.getDouble("sjsqysjftc");//���ʦǩԼ��Ʒ����
				sjsqyzxtc=rs.getDouble("sjsqyzxtc");//���ʦǩԼװ�����
				zjqyzxtc=rs.getDouble("zjqyzxtc");//�ͻ�����ǩԼװ�����
				xqzgqyzxtc=rs.getDouble("xqzgqyzxtc");//С������ǩԼװ�����
				xqzzqyzxtc=rs.getDouble("xqzzqyzxtc");//С���鳤ǩԼװ�����
				xqzyqyzxtc=rs.getDouble("xqzyqyzxtc");//С��רԱǩԼװ�����
				wlyxzgqyzxtc=rs.getDouble("wlyxzgqyzxtc");//����Ӫ������ǩԼװ�����
				wztgyqyzxtc=rs.getDouble("wztgyqyzxtc");//��վ�ƹ�ԱǩԼװ�����
				sjqyzxtc=rs.getDouble("sjqyzxtc");//˾��ǩԼװ�����
			}
			rs.close();
			ps.close();

			if (!dianz.equals(""))
			{
				dzjssjftc=cf.round(sjf*dzsjftcbl/100-dzqysjftc,2);//�곤������Ʒ����
				dzjszxtc=cf.round((qye+zhljzjx)*dzzxftcbl/100-dzqyzxtc,2);//�곤����װ�����
				dztcxj=cf.round(dzjssjftc+dzjszxtc,2);//�곤���С��
				dztcze=cf.round(dztcxj*dzkhbl/100,2);//�곤����ܶ�
			}

			if (!weny.equals(""))
			{
				wyjszxtc=cf.round((qye+zhljzjx)*wyzxftcbl/100-wyqyzxtc,2);//��Ա����װ�����
			}

			if (!khjl.equals(""))
			{
				khjljssjftc=cf.round(sjf*khjlsjftcbl/100-khjlqysjftc,2);  //����ҵ�������Ʒ����
				khjljszxtc=cf.round((qye+zhljzjx)*khjlzxftcbl/100-khjlqyzxtc,2);   //����ҵ�����װ�����	 
				khjltcxj=cf.round(khjljssjftc+khjljszxtc,2);     //����ҵ�����С��	        
				khjltcze=cf.round(khjltcxj*khjlkhbl/100,2);     //����ҵ������ܶ�	        
			}
			
			if (!sjs.equals(""))
			{
				sjsjssjftc=cf.round(sjf*sjssjftcbl/100-sjsqysjftc,2);    //���ʦ������Ʒ����	
				sjsjszxtc=cf.round((qye+zhljzjx)*sjszxftcbl/100-sjsqyzxtc,2); //���ʦ����װ�����	
				sjsycftc=0;      //���ʦԶ�̷����	    
				sjstchj=cf.round(sjsjssjftc+sjsjszxtc+sjsycftc,2);   //���ʦ��ɺϼ�	    
			}

			if (!zjxm.equals(""))
			{
				zjjszxtc=cf.round((qye+zhljzjx)*zjzxftcbl/100-zjqyzxtc,2);  //�ͻ���������װ�����		
				zjycftc=0;   //�ͻ�����Զ�̷����		
				zjtcxj=cf.round(zjjszxtc+zjycftc,2);    //�ͻ��������С��			
				zjtchj=cf.round(zjtcxj*zjkhbl/100,2);    //�ͻ�������ɺϼ�			
			}

			if (!clgw.equals(""))
			{
				clyjszxtc=cf.round(qye*clyzxftcbl/100,2)-clyqyzxtc;  //����Ա����װ�����
				clytc=cf.round(clyjszxtc*clykhbl/100,2);    //����Ա���			
			}

			if (!xqzg.equals(""))
			{
				xqzgjszxtc=cf.round((qye+zhljzjx)*xqzgzxftcbl/100-xqzgqyzxtc,2);    //С�����ܽ���װ�����	
				xqzgtc=cf.round(xqzgjszxtc*xqzgkhbl/100,2);    //С���������			
			}
						   
			if (!xqzz.equals(""))
			{
				xqzzjszxtc=cf.round((qye+zhljzjx)*xqzzzxftcbl/100-xqzzqyzxtc,2);    //С���鳤����װ�����	
				xqzztc=cf.round(xqzzjszxtc*xqzzkhbl/100,2);    //С���鳤���			
			}
						   
			if (!xqzy.equals(""))
			{
				xqzyjszxtc=cf.round((qye+zhljzjx)*xqzyzxftcbl/100-xqzyqyzxtc,2);    //С��רԱ����װ�����	
				xqzytc=cf.round(xqzyjszxtc*xqzykhbl/100,2);    //С��רԱ���			
			}

			if (!wlyxzg.equals(""))
			{
				wlyxzgjszxtc=cf.round((qye+zhljzjx)*wlyxzgzxftcbl/100-wlyxzgqyzxtc,2);  //����Ӫ�����ܽ���װ�����	
				wlyxzgtc=cf.round(wlyxzgjszxtc*wlyxzgkhbl/100,2);      //����Ӫ���������		
			}
			

			
			yxzyzxftcbl=0;
			yxzyqyzxtc=0;     //Ӫ��רԱǩԼװ�����	
						   
			wzchzxftcbl=0;
			wzchqyzxtc=0;     //��վ�߻�ǩԼװ�����	
						   
			wysjzxftcbl=0;
			wysjqyzxtc=0;     //��ҳ���ǩԼװ�����	
						   
			wzcxyzxftcbl=0;
			wzcxyqyzxtc=0;    //��վ����ԱǩԼװ�����	
						   
			dhzyzxftcbl=0;
			dhzyqyzxtc=0;     //�绰רԱǩԼװ�����	
						   
			if (!wztgy.equals(""))
			{
				wztgyjszxtc=cf.round((qye+zhljzjx)*wztgyzxftcbl/100-wztgyqyzxtc,2);    //��վ�ƹ�Ա����װ�����	
				wztgytc=cf.round(wztgyjszxtc*wztgykhbl/100,2);         //��վ�ƹ�Ա���		
			}
			
			sjzxftcbl=0;
			sjqyzxtc=0;//˾��ǩԼװ�����
						   
		}


		jjze=dztcze+wyjszxtc+khjltcze+sjstchj+zjtchj+clytc+xqzgtc+xqzztc+xqzytc+wlyxzgtc+yxzyqyzxtc+wzchqyzxtc+wysjqyzxtc+wzcxyqyzxtc+dhzyqyzxtc+wztgytc+sjqyzxtc;
		jjze=cf.round(jjze,2);

		
		
		
		
		
		
		row++;

		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			<td ><%=row%></td>
			<td ><%=sjsjsbzmc%>
				<input name="khbh" type="hidden" value="<%=khbh%>">
			</td>
			<td ><%=hth%></td>
			<td ><A target='_blank' HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>"><%=khxm%></A></td>
			<td ><%=fwdz%></td>
			<td ><%=fwmj%></td>
			<td ><%=bjjbmc%></td>
			<td ><%=hdlxmc%>
				<input name="hdbz" type="hidden" value="<%=hdbz%>">
				<input name="tckh" type="hidden" value="<%=tckh%>">
			</td>
			<td ><%=dianz%></td>
			<td ><%=weny%></td>
			<td ><%=khjl%></td>
			<td ><%=sjs%></td>
			<td ><%=clgw%></td>
			<td ><%=zjxm%></td>
			<td ><%=xqzg%></td>
			<td ><%=xqzz%></td>
			<td ><%=xqzy%></td>
			<td ><%=wlyxzg%></td>
			<td ><%=yxzy%></td>
			<td ><%=wzch%></td>
			<td ><%=wysj%></td>
			<td ><%=wzcxy%></td>
			<td ><%=dhzy%></td>
			<td ><%=wztgy%></td>
			<td ><%=siji%></td>

			<td ><%=sjf%></td>
			<td ><%=ycf%></td>
			<td ><%=wdzgce%></td>
			<td ><%=cf.round(wdzgce-qye,2)%></td>
			<td ><%=suijin%></td>
			<td ><%=qye%></td>
			<td ><%=zhljzjx%></td>
			<td ><%=zjxbl%>%</td>
			<td ><%=tcwzczx%></td>
		
			<td ><%=dzsjftcbl%>%</td>
			<td ><%=dzqysjftc%></td>
			<td ><%=dzjssjftc%></td>
			<td ><%=dzzxftcbl%>%</td>
			<td ><%=dzqyzxtc%></td>
			<td ><%=dzjszxtc%></td>
			<td ><%=dztcxj%></td>
			<td ><%=dzkhbl%>%</td>
			<td ><%=dztcze%></td>
		
			<td ><%=wyzxftcbl%>%</td>
			<td ><%=wyqyzxtc%></td>
			<td ><%=wyjszxtc%></td>
		
			<td ><%=khjlsjftcbl%>%</td>
			<td ><%=khjlqysjftc%></td>
			<td ><%=khjljssjftc%></td>
			<td ><%=khjlzxftcbl%>%</td>
			<td ><%=khjlqyzxtc%></td>
			<td ><%=khjljszxtc%></td>
			<td ><%=khjltcxj%></td>
			<td ><%=khjlkhbl%>%</td>
			<td ><%=khjltcze%></td>
		
			<td ><%=sjssjftcbl%>%</td>
			<td ><%=sjsqysjftc%></td>
			<td ><%=sjsjssjftc%></td>
			<td ><%=sjszxftcbl%>%</td>
			<td ><%=sjsqyzxtc%></td>
			<td ><%=sjsjszxtc%></td>
			<td ><%=sjsycftcbl%></td>
			<td ><%=sjsycftc%>%</td>
			<td ><%=sjstchj%></td>
		
			<td ><%=zjzxftcbl%>%</td>
			<td ><%=zjqyzxtc%></td>
			<td ><%=zjjszxtc%></td>
			<td ><%=zjycftcbl%>%</td>
			<td ><%=zjycftc%></td>
			<td ><%=zjtcxj%></td>
			<td ><%=zjkhbl%></td>
			<td ><%=zjtchj%>%</td>
		
			<td ><%=clyzxftcbl%>%</td>
			<td ><%=clyqyzxtc%></td>
			<td ><%=clyjszxtc%></td>
			<td ><%=clykhbl%></td>
			<td ><%=clytc%>%</td>
		
			<td ><%=xqzgzxftcbl%>%</td>
			<td ><%=xqzgqyzxtc%></td>
			<td ><%=xqzgjszxtc%></td>
			<td ><%=xqzgkhbl%></td>
			<td ><%=xqzgtc%>%</td>
		
			<td ><%=xqzzzxftcbl%>%</td>
			<td ><%=xqzzqyzxtc%></td>
			<td ><%=xqzzjszxtc%></td>
			<td ><%=xqzzkhbl%></td>
			<td ><%=xqzztc%>%</td>
		
			<td ><%=xqzyzxftcbl%>%</td>
			<td ><%=xqzyqyzxtc%></td>
			<td ><%=xqzyjszxtc%></td>
			<td ><%=xqzykhbl%></td>
			<td ><%=xqzytc%>%</td>
		
			<td ><%=wlyxzgzxftcbl%>%</td>
			<td ><%=wlyxzgqyzxtc%></td>
			<td ><%=wlyxzgjszxtc%></td>
			<td ><%=wlyxzgkhbl%></td>
			<td ><%=wlyxzgtc%>%</td>
		
			<td ><%=yxzyzxftcbl%>%</td>
			<td ><%=yxzyqyzxtc%></td>
		
			<td ><%=wzchzxftcbl%>%</td>
			<td ><%=wzchqyzxtc%></td>
		
			<td ><%=wysjzxftcbl%>%</td>
			<td ><%=wysjqyzxtc%></td>
		
			<td ><%=wzcxyzxftcbl%>%</td>
			<td ><%=wzcxyqyzxtc%></td>
		
			<td ><%=dhzyzxftcbl%>%</td>
			<td ><%=dhzyqyzxtc%></td>
		
			<td ><%=wztgyzxftcbl%>%</td>
			<td ><%=wztgyqyzxtc%></td>
			<td ><%=wztgyjszxtc%></td>
			<td ><%=wztgykhbl%></td>
			<td ><%=wztgytc%>%</td>
		
			<td ><%=sjzxftcbl%>%</td>
			<td ><%=sjqyzxtc%></td>
		
		</tr>
		<%
	}
	rs1.close();
	ps1.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>ls_sql=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
 <tr bgcolor="#FFFFFF" >
      <td colspan="194"> 
		<input name="khzq" type="hidden" value="<%=khzq%>">
		<input name="fgsbh" type="hidden" value="<%=fgsbh%>">
		<input type="button"  value="����" onClick="f_do(insertform)">
		<input type="reset"  value="����" name="reset">      </td>
    </tr>
	</table>


<script>
function onclickTr(obj)
{
	if (obj.style.background=='#ff33ff')
	{
		obj.style.background='#FFFFFF';
	}
	else
	{
		obj.style.background='#FF33FF';
	}
}
function inTr(obj)
{
	if (obj.style.background!='#ff33ff')
	{
		obj.style.background='#FFFF33';
	}
}
function outTr(obj)
{
	if (obj.style.background=='#ffff33')
	{
		obj.style.background='#FFFFFF';
	}
}

//-->
</script>

</body>
</html>