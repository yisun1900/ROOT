<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String khzq=request.getParameter("khzq");

String sjsjsbz=null;
String fgsbh=null;
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


double dzkhbl=0;//�곤���˱���
double khjlkhbl=0;//����ҵ�񿼺˱���
double zjkhbl=0;//�ͻ������˷���
double clykhbl=0;//����Ա���˱���
double xqzgkhbl=0;//С�����ܿ��˱���
double xqzzkhbl=0;//С���鳤���˱���
double xqzykhbl=0;//С��רԱ���˱���
double wlyxzgkhbl=0;//����Ӫ�����ܿ��˱���
double wztgykhbl=0;//��վ�ƹ�Ա���˱���

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
double zjjszxtc=0;  //�ͻ��������װ�����		
double zjycftc=0;   //�ͻ�����Զ�̷����		
double zjtcxj=0;    //�ͻ��������С��			
double zjtchj=0;    //�ͻ�������ɺϼ�			

double clyqyzxtc=0;  //�ͻ�����ǩԼװ�����		
double clyjszxtc=0;  //�ͻ��������װ�����		
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


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String lx="";

try {
	conn=cf.getConnection();

	ls_sql="select sjsjsbz,fgsbh,crm_khxx.dwbh,sjs,zjxm,khjl,clgw,hdbz,hdlxmc,fwmj,crm_khxx.bjjb,bjjbmc,khjsbz,gcjdbm";
	ls_sql+=" ,dianz,weny,xqzg,xqzz,xqzy,wlyxzg,yxzy,wzch,wysj,wzcxy,dhzy,wztgy,siji ";
	ls_sql+=" ,wdzgce,qye,suijin,sjf,sjhtsjf,zhljzjx ";
	ls_sql+=" from  crm_khxx,sq_dwxx,bdm_bjjbbm,dm_hdlxbm";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ls_sql+=" and  crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and  crm_khxx.hdbz=dm_hdlxbm.hdlxbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsjsbz=cf.fillNull(rs.getString("sjsjsbz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sjs=cf.fillNull(rs.getString("sjs"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		khjl=cf.fillNull(rs.getString("khjl"));
		clgw=cf.fillNull(rs.getString("clgw"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		hdlxmc=cf.fillNull(rs.getString("hdlxmc"));
		fwmj=rs.getInt("fwmj");
		bjjbbm=cf.fillNull(rs.getString("bjjb"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		khjsbz=cf.fillNull(rs.getString("khjsbz"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));

		dianz=cf.fillNull(rs.getString("dianz"));
		weny=cf.fillNull(rs.getString("weny"));
		xqzg=cf.fillNull(rs.getString("xqzg"));
		xqzz=cf.fillNull(rs.getString("xqzz"));
		xqzy=cf.fillNull(rs.getString("xqzy"));
		wlyxzg=cf.fillNull(rs.getString("wlyxzg"));
		yxzy=cf.fillNull(rs.getString("yxzy"));
		wzch=cf.fillNull(rs.getString("wzch"));
		wysj=cf.fillNull(rs.getString("wysj"));
		wzcxy=cf.fillNull(rs.getString("wzcxy"));
		dhzy=cf.fillNull(rs.getString("dhzy"));
		wztgy=cf.fillNull(rs.getString("wztgy"));
		siji=cf.fillNull(rs.getString("siji"));
		
		
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		suijin=rs.getDouble("suijin");
		sjf=rs.getDouble("sjf");
		sjhtsjf=rs.getDouble("sjhtsjf");
		zhljzjx=rs.getDouble("zhljzjx");

	}
	rs.close();
	ps.close();

	sjf=cf.round(sjf+sjhtsjf,2);


	if (!khjsbz.equals("N"))
	{
//		out.println("���󣡿ͻ��ѽ���");
//		return;
	}

	if (!gcjdbm.equals("5"))//1��δ������2�����̿�����6�����ι�����ɣ�3���������գ�4�������깤��5��������᣻7����ͬ�쳣��ֹ
	{
//		out.println("���󣡿ͻ�����δ���");
//		return;
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

	//�ͻ������˷���
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


	if (zjxbl>=2)//>2�����ͻ������0.2%
	{
		zjzxftcbl=cf.round(zjzxftcbl-0.2,2);
	}


	//�곤��ɣ�����������������������������ʼ

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
			zjjszxtc=0;  //�ͻ��������װ�����		
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
			zjjszxtc=cf.round((qye+zhljzjx)*zjzxftcbl/100-zjqyzxtc,2);  //�ͻ��������װ�����		
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_jrtcmxQd.jsp" name="insertform"  >
<div align="center">ǩ�����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">�������</td> 
  <td width="27%"> 
    <input type="text" name="khzq" value="<%=khzq%>" size="20" maxlength="11" >  </td>
  <td align="right" width="23%">�ͻ����</td> 
  <td width="27%"> 
    <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">�ص���־</td> 
  <td width="27%"> 
    <input type="text" name="hdbz" value="<%=hdbz%>" size="20" maxlength="1" >  </td>
  <td align="right" width="23%">�ײͿͻ�</td> 
  <td width="27%"> 
  <%
  cf.radioToken(out,"tckh","1+����&2+�ײ�",tckh);
  %></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">�곤</td> 
  <td width="27%"> 
    <input type="text" name="dianz" value="<%=dianz%>" size="20" maxlength="20" >  </td>
  <td align="right" width="23%">��Ա</td> 
  <td width="27%"> 
    <input type="text" name="weny" value="<%=weny%>" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">����ҵ��</td> 
  <td width="27%"> 
    <input type="text" name="khjl" value="<%=khjl%>" size="20" maxlength="20" >  </td>
  <td align="right" width="23%">���ʦ</td> 
  <td width="27%"> 
    <input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">����Ա</td> 
  <td width="27%"> 
    <input type="text" name="cly" value="<%=clgw%>" size="20" maxlength="20" >  </td>
  <td align="right" width="23%">�ͻ�����</td> 
  <td width="27%"> 
    <input type="text" name="zj" value="<%=zjxm%>" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">С������</td> 
  <td width="27%"> 
    <input type="text" name="xqzg" value="<%=xqzg%>" size="20" maxlength="20" >  </td>
  <td align="right" width="23%">С���鳤</td> 
  <td width="27%"> 
    <input type="text" name="xqzz" value="<%=xqzz%>" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">С��רԱ</td> 
  <td width="27%"> 
    <input type="text" name="xqzy" value="<%=xqzy%>" size="20" maxlength="20" >  </td>
  <td align="right" width="23%">����Ӫ������</td> 
  <td width="27%"> 
    <input type="text" name="wlyxzg" value="<%=wlyxzg%>" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">Ӫ��רԱ</td> 
  <td width="27%"> 
    <input type="text" name="yxzy" value="<%=yxzy%>" size="20" maxlength="20" >  </td>
  <td align="right" width="23%">��վ�߻�</td> 
  <td width="27%"> 
    <input type="text" name="wzch" value="<%=wzch%>" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">��ҳ���</td> 
  <td width="27%"> 
    <input type="text" name="wysj" value="<%=wysj%>" size="20" maxlength="20" >  </td>
  <td align="right" width="23%">��վ����Ա</td> 
  <td width="27%"> 
    <input type="text" name="wzcxy" value="<%=wzcxy%>" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">�绰רԱ</td> 
  <td width="27%"> 
    <input type="text" name="dhzy" value="<%=dhzy%>" size="20" maxlength="20" >  </td>
  <td align="right" width="23%">��վ�ƹ�Ա</td> 
  <td width="27%"> 
    <input type="text" name="wztgy" value="<%=wztgy%>" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">˾��</td> 
  <td width="27%"> 
    <input type="text" name="siji" value="<%=siji%>" size="20" maxlength="20" >  </td>
  <td align="right" width="23%">�������</td> 
  <td width="27%"> 
    <input type="text" name="fwmj" value="<%=fwmj%>" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">��Ʒ�</td> 
  <td width="27%"> 
    <input type="text" name="sjf" value="<%=sjf%>" size="20" maxlength="17" >
    ����������Ʒѣ�  </td>
  <td align="right" width="23%">Զ�̷�</td> 
  <td width="27%"> 
    <input type="text" name="ycf" value="<%=ycf%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">��ǰ���</td> 
  <td width="27%"> 
    <input type="text" name="zqje" value="<%=wdzgce%>" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">�ۿ�</td> 
  <td width="27%"> 
    <input type="text" name="zk" value="<%=cf.round(wdzgce-qye,2)%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">˰��</td> 
  <td width="27%"> 
    <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">�ۺ�������</td> 
  <td width="27%"> 
    <input type="text" name="zhjtjs" value="<%=qye%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">��������</td> 
  <td width="27%"> 
    <input type="text" name="zjxje" value="<%=zhljzjx%>" size="20" maxlength="17" >
    ����˰��  </td>
  <td align="right" width="23%">���������</td> 
  <td width="27%"> 
    <input type="text" name="zjxbl" value="<%=zjxbl%>" size="20" maxlength="17" >  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">�ײ�����������</td> 
  <td width="27%"> 
    <input type="text" name="tcwzczx" value="<%=tcwzczx%>" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">&nbsp;</td> 
  <td width="27%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�곤��Ʒ���ɱ���</td>
  <td><input type="text" name="dzsjftcbl" value="<%=dzsjftcbl%>" size="10" maxlength="17" >
  %</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">�곤ǩԼ��Ʒ����</td> 
  <td width="27%"> 
    <input type="text" name="dzqysjftc" value="<%=dzqysjftc%>" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">�곤������Ʒ����</td> 
  <td width="27%"> 
    <input type="text" name="dzjssjftc" value="<%=dzjssjftc%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">�곤װ�޷���ɱ���</td> 
  <td width="27%"> 
    <input type="text" name="dzzxftcbl" value="<%=dzzxftcbl%>" size="10" maxlength="17" >
    %  </td>
  <td align="right" width="23%">&nbsp;</td> 
  <td width="27%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�곤ǩԼװ�����</td>
  <td><input type="text" name="dzqyzxtc" value="<%=dzqyzxtc%>" size="20" maxlength="17" ></td>
  <td align="right">�곤����װ�����</td>
  <td><input type="text" name="dzjszxtc" value="<%=dzjszxtc%>" size="20" maxlength="17" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">�곤���С��</td> 
  <td width="27%"><input type="text" name="dztcxj" value="<%=dztcxj%>" size="20" maxlength="17" ></td>
  <td align="right" width="23%">&nbsp;</td> 
  <td width="27%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">�곤���˱���</td> 
  <td width="27%"> 
    <input type="text" name="dzkhbl" value="<%=dzkhbl%>" size="10" maxlength="17" >
    %  </td>
  <td align="right" width="23%">�곤����ܶ�</td> 
  <td width="27%"> 
    <input type="text" name="dztcze" value="<%=dztcze%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">��Աװ�޷���ɱ���</td> 
  <td width="27%"> 
    <input type="text" name="wyzxftcbl" value="<%=wyzxftcbl%>" size="10" maxlength="17" >
    %  </td>
  <td align="right" width="23%">&nbsp;</td> 
  <td width="27%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">��ԱǩԼװ�����</td> 
  <td width="27%"><input type="text" name="wyqyzxtc" value="<%=wyqyzxtc%>" size="20" maxlength="17" ></td>
  <td align="right" width="23%">��Ա����װ�����</td> 
  <td width="27%"><input type="text" name="wyjszxtc" value="<%=wyjszxtc%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����ҵ����Ʒ���ɱ���</td>
  <td><input type="text" name="khjlsjftcbl" value="<%=khjlsjftcbl%>" size="10" maxlength="17" >
  %</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">����ҵ��ǩԼ��Ʒ����</td> 
  <td width="27%"> 
    <input type="text" name="khjlqysjftc" value="<%=khjlqysjftc%>" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">����ҵ�������Ʒ����</td> 
  <td width="27%"> 
    <input type="text" name="khjljssjftc" value="<%=khjljssjftc%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">����ҵ��װ�޷���ɱ���</td> 
  <td width="27%"> 
    <input type="text" name="khjlzxftcbl" value="<%=khjlzxftcbl%>" size="10" maxlength="17" >
    %  </td>
  <td align="right" width="23%">&nbsp;</td> 
  <td width="27%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����ҵ��ǩԼװ�����</td>
  <td><input type="text" name="khjlqyzxtc" value="<%=khjlqyzxtc%>" size="20" maxlength="17" ></td>
  <td align="right">����ҵ�����װ�����</td>
  <td><input type="text" name="khjljszxtc" value="<%=khjljszxtc%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">����ҵ�����С��</td> 
  <td width="27%"><input type="text" name="khjltcxj" value="<%=khjltcxj%>" size="20" maxlength="17" ></td>
  <td align="right" width="23%">&nbsp;</td> 
  <td width="27%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">����ҵ�񿼺˱���</td> 
  <td width="27%"> 
    <input type="text" name="khjlkhbl" value="<%=khjlkhbl%>" size="10" maxlength="17" >
    %  </td>
  <td align="right" width="23%">����ҵ������ܶ�</td> 
  <td width="27%"> 
    <input type="text" name="khjltcze" value="<%=khjltcze%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">���ʦ��Ʒ���ɱ���</td> 
  <td width="27%"> 
    <input type="text" name="sjssjftcbl" value="<%=sjssjftcbl%>" size="10" maxlength="17" >
    %  </td>
  <td align="right" width="23%">&nbsp;</td> 
  <td width="27%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���ʦǩԼ��Ʒ����</td>
  <td><input type="text" name="sjsqysjftc" value="<%=sjsqysjftc%>" size="20" maxlength="17" ></td>
  <td align="right">���ʦ������Ʒ����</td>
  <td><input type="text" name="sjsjssjftc" value="<%=sjsjssjftc%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">���ʦװ�޷���ɱ���</td> 
  <td width="27%"><input type="text" name="sjszxftcbl" value="<%=sjszxftcbl%>" size="10" maxlength="17" >
    %</td>
  <td align="right" width="23%">&nbsp;</td> 
  <td width="27%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">���ʦǩԼװ�����</td> 
  <td width="27%"> 
    <input type="text" name="sjsqyzxtc" value="<%=sjsqyzxtc%>" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">���ʦ����װ�����</td> 
  <td width="27%"> 
    <input type="text" name="sjsjszxtc" value="<%=sjsjszxtc%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">���ʦԶ�̷���ɱ���</td> 
  <td width="27%"> 
    <input type="text" name="sjsycftcbl" value="<%=sjsycftcbl%>" size="10" maxlength="17" >
    %  </td>
  <td align="right" width="23%">���ʦԶ�̷����(����)</td> 
  <td width="27%"> 
    <input type="text" name="sjsycftc" value="<%=sjsycftc%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">���ʦ��ɺϼ�</td> 
  <td width="27%"> 
    <input type="text" name="sjstchj" value="<%=sjstchj%>" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">&nbsp;</td> 
  <td width="27%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ͻ�����װ�޷���ɱ���</td>
  <td><input type="text" name="zjzxftcbl" value="<%=zjzxftcbl%>" size="10" maxlength="17" >
    %</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">�ͻ�����ǩԼװ�����</td> 
  <td width="27%"> 
    <input type="text" name="zjqyzxtc" value="<%=zjqyzxtc%>" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">�ͻ��������װ�����</td> 
  <td width="27%"> 
    <input type="text" name="zjjszxtc" value="<%=zjjszxtc%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">�ͻ�����Զ�̷���ɱ���</td> 
  <td width="27%"> 
    <input type="text" name="zjycftcbl" value="<%=zjycftcbl%>" size="10" maxlength="17" >
    %</td>
  <td align="right" width="23%">�ͻ�����Զ�̷����</td> 
  <td width="27%"> 
    <input type="text" name="zjycftc" value="<%=zjycftc%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">�ͻ��������С��</td> 
  <td width="27%"> 
    <input type="text" name="zjtcxj" value="<%=zjtcxj%>" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">&nbsp;</td> 
  <td width="27%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">�ͻ������˷���</td> 
  <td width="27%"><input type="text" name="zjkhbl" value="<%=zjkhbl%>" size="10" maxlength="17" >
    %</td>
  <td align="right" width="23%">�ͻ�������ɺϼ�</td> 
  <td width="27%"><input type="text" name="zjtchj" value="<%=zjtchj%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����Աװ�޷���ɱ���</td>
  <td><input type="text" name="clyzxftcbl" value="<%=clyzxftcbl%>" size="10" maxlength="17" >
    %</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����ԱǩԼװ�����</td>
  <td><input type="text" name="clyqyzxtc" value="<%=clyqyzxtc%>" size="20" maxlength="17" >  </td>
  <td align="right">����Ա����װ�����</td>
  <td><input type="text" name="clyjszxtc" value="<%=clyjszxtc%>" size="20" maxlength="17" >  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">����Ա���˱���</td>
  <td><input name="clykhbl" type="text" value="<%=clykhbl%>" size="10" maxlength="17" >
    %</td>
  <td align="right">����Ա���</td>
  <td><input type="text" name="clytc" value="<%=clytc%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">С������װ�޷���ɱ���</td>
  <td><input type="text" name="xqzgzxftcbl" value="<%=xqzgzxftcbl%>" size="10" maxlength="17" >
    %</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">С������ǩԼװ�����</td> 
  <td width="27%"> 
    <input type="text" name="xqzgqyzxtc" value="<%=xqzgqyzxtc%>" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">С�����ܽ���װ�����</td> 
  <td width="27%"> 
    <input type="text" name="xqzgjszxtc" value="<%=xqzgjszxtc%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">С�����ܿ��˱���</td> 
  <td width="27%"> 
    <input type="text" name="xqzgkhbl" value="<%=xqzgkhbl%>" size="10" maxlength="17" >
    %  </td>
  <td align="right" width="23%">С���������</td> 
  <td width="27%"> 
    <input type="text" name="xqzgtc" value="<%=xqzgtc%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">С���鳤װ�޷���ɱ���</td> 
  <td width="27%"> 
    <input type="text" name="xqzzzxftcbl" value="<%=xqzzzxftcbl%>" size="10" maxlength="17" >
    % </td>
  <td align="right" width="23%">&nbsp;</td> 
  <td width="27%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">С���鳤ǩԼװ�����</td> 
  <td width="27%"><input type="text" name="xqzzqyzxtc" value="<%=xqzzqyzxtc%>" size="20" maxlength="17" ></td>
  <td align="right" width="23%">С���鳤����װ�����</td> 
  <td width="27%"><input type="text" name="xqzzjszxtc" value="<%=xqzzjszxtc%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">С���鳤���˱���</td> 
  <td width="27%"><input type="text" name="xqzzkhbl" value="<%=xqzzkhbl%>" size="10" maxlength="17" >
    % </td>
  <td align="right" width="23%">С���鳤���</td> 
  <td width="27%"><input type="text" name="xqzztc" value="<%=xqzztc%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">С��רԱװ�޷���ɱ���</td>
  <td><input type="text" name="xqzyzxftcbl" value="<%=xqzyzxftcbl%>" size="10" maxlength="17" >
    %</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">С��רԱǩԼװ�����</td> 
  <td width="27%"> 
    <input type="text" name="xqzyqyzxtc" value="<%=xqzyqyzxtc%>" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">С��רԱ����װ�����</td> 
  <td width="27%"> 
    <input type="text" name="xqzyjszxtc" value="<%=xqzyjszxtc%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">С��רԱ���˱���</td> 
  <td width="27%"> 
    <input type="text" name="xqzykhbl" value="<%=xqzykhbl%>" size="10" maxlength="17" >
    % </td>
  <td align="right" width="23%">С��רԱ���</td> 
  <td width="27%"> 
    <input type="text" name="xqzytc" value="<%=xqzytc%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">����Ӫ������װ�޷���ɱ���</td> 
  <td width="27%"> 
    <input type="text" name="wlyxzgzxftcbl" value="<%=wlyxzgzxftcbl%>" size="10" maxlength="17" >
    % </td>
  <td align="right" width="23%">&nbsp;</td> 
  <td width="27%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">����Ӫ������ǩԼװ�����</td> 
  <td width="27%"><input type="text" name="wlyxzgqyzxtc" value="<%=wlyxzgqyzxtc%>" size="20" maxlength="17" ></td>
  <td align="right" width="23%">����Ӫ�����ܽ���װ�����</td> 
  <td width="27%"><input type="text" name="wlyxzgjszxtc" value="<%=wlyxzgjszxtc%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">����Ӫ�����ܿ��˱���</td> 
  <td width="27%"><input type="text" name="wlyxzgkhbl" value="<%=wlyxzgkhbl%>" size="10" maxlength="17" >
    % </td>
  <td align="right" width="23%">����Ӫ���������</td> 
  <td width="27%"><input type="text" name="wlyxzgtc" value="<%=wlyxzgtc%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">Ӫ��רԱװ�޷���ɱ���</td>
  <td><input type="text" name="yxzyzxftcbl" value="<%=yxzyzxftcbl%>" size="10" maxlength="17" >
    % </td>
  <td align="right">Ӫ��רԱǩԼװ�����</td>
  <td><input type="text" name="yxzyqyzxtc" value="<%=yxzyqyzxtc%>" size="20" maxlength="17" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��վ�߻�װ�޷���ɱ���</td>
  <td><input type="text" name="wzchzxftcbl" value="<%=wzchzxftcbl%>" size="10" maxlength="17" >
    %</td>
  <td align="right">��վ�߻�ǩԼװ�����</td>
  <td><input type="text" name="wzchqyzxtc" value="<%=wzchqyzxtc%>" size="20" maxlength="17" ></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ҳ���װ�޷���ɱ���</td>
  <td><input type="text" name="wysjzxftcbl" value="<%=wysjzxftcbl%>" size="10" maxlength="17" >
    %</td>
  <td align="right">��ҳ���ǩԼװ�����</td>
  <td><input type="text" name="wysjqyzxtc" value="<%=wysjqyzxtc%>" size="20" maxlength="17" ></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��վ����Աװ�޷���ɱ���</td>
  <td><input type="text" name="wzcxyzxftcbl" value="<%=wzcxyzxftcbl%>" size="10" maxlength="17" >
    %</td>
  <td align="right">��վ����ԱǩԼװ�����</td>
  <td><input type="text" name="wzcxyqyzxtc" value="<%=wzcxyqyzxtc%>" size="20" maxlength="17" ></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�绰רԱװ�޷���ɱ���</td>
  <td><input type="text" name="dhzyzxftcbl" value="<%=dhzyzxftcbl%>" size="10" maxlength="17" >
    %</td>
  <td align="right">�绰רԱǩԼװ�����</td>
  <td><input type="text" name="dhzyqyzxtc" value="<%=dhzyqyzxtc%>" size="20" maxlength="17" ></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��վ�ƹ�Աװ�޷���ɱ���</td>
  <td><input type="text" name="wztgyzxftcbl" value="<%=wztgyzxftcbl%>" size="10" maxlength="17" >
    %</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">��վ�ƹ�ԱǩԼװ�����</td> 
  <td width="27%"> 
    <input type="text" name="wztgyqyzxtc" value="<%=wztgyqyzxtc%>" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">��վ�ƹ�Ա����װ�����</td> 
  <td width="27%"> 
    <input type="text" name="wztgyjszxtc" value="<%=wztgyjszxtc%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">��վ�ƹ�Ա���˱���</td> 
  <td width="27%"> 
    <input type="text" name="wztgykhbl" value="<%=wztgykhbl%>" size="10" maxlength="17" >
    % </td>
  <td align="right" width="23%">��վ�ƹ�Ա���</td> 
  <td width="27%"> 
    <input type="text" name="wztgytc" value="<%=wztgytc%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">˾��װ�޷���ɱ���</td> 
  <td width="27%"> 
    <input type="text" name="sjzxftcbl" value="<%=sjzxftcbl%>" size="10" maxlength="17" >
% </td>
  <td align="right" width="23%">˾��ǩԼװ�����</td> 
  <td width="27%"><input type="text" name="sjqyzxtc" value="<%=sjqyzxtc%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="23%"><span class="STYLE1">*</span>����</td> 
  <td width="27%"><%
	cf.radioToken(out, "lx","1+ǩ�����&2+�������",lx);
%></td>
  <td align="right" width="23%"><span class="STYLE1">*</span>��������</td> 
  <td width="27%"><input type="text" name="jjze" value="<%=jjze%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>¼����</td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span>¼��ʱ��</td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="71" rows="3"></textarea></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khzq)=="") {
		alert("������[��������]��");
		FormName.khzq.focus();
		return false;
	}

	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.hdbz)=="") {
		alert("������[�ص���־]��");
		FormName.hdbz.focus();
		return false;
	}
/*
	if(	javaTrim(FormName.tckh)=="") {
		alert("������[�ײͿͻ�]��");
		FormName.tckh.focus();
		return false;
	}
*/
	if(	javaTrim(FormName.fwmj)=="") {
		alert("������[�������]��");
		FormName.fwmj.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.sjf)=="") {
		alert("������[��Ʒ�]��");
		FormName.sjf.focus();
		return false;
	}
	if(!(isFloat(FormName.sjf, "��Ʒ�"))) {
		return false;
	}
	if(	javaTrim(FormName.ycf)=="") {
		alert("������[Զ�̷�]��");
		FormName.ycf.focus();
		return false;
	}
	if(!(isFloat(FormName.ycf, "Զ�̷�"))) {
		return false;
	}

	if(	javaTrim(FormName.zqje)=="") {
		alert("������[��ǰ���]��");
		FormName.zqje.focus();
		return false;
	}
	if(!(isFloat(FormName.zqje, "��ǰ���"))) {
		return false;
	}
	if(	javaTrim(FormName.zk)=="") {
		alert("������[�ۿ�]��");
		FormName.zk.focus();
		return false;
	}
	if(!(isFloat(FormName.zk, "�ۿ�"))) {
		return false;
	}
	if(	javaTrim(FormName.suijin)=="") {
		alert("������[˰��]��");
		FormName.suijin.focus();
		return false;
	}
	if(!(isFloat(FormName.suijin, "˰��"))) {
		return false;
	}
	if(	javaTrim(FormName.zhjtjs)=="") {
		alert("������[�ۺ�������]��");
		FormName.zhjtjs.focus();
		return false;
	}
	if(!(isFloat(FormName.zhjtjs, "�ۺ�������"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxje)=="") {
		alert("������[��������]��");
		FormName.zjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxje, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxbl)=="") {
		alert("������[���������]��");
		FormName.zjxbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxbl, "���������"))) {
		return false;
	}
	if(	javaTrim(FormName.tcwzczx)=="") {
		alert("������[�ײ�����������]��");
		FormName.tcwzczx.focus();
		return false;
	}
	if(!(isFloat(FormName.tcwzczx, "�ײ�����������"))) {
		return false;
	}
	if(	javaTrim(FormName.dzsjftcbl)=="") {
		alert("������[�곤��Ʒ���ɱ���]��");
		FormName.dzsjftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.dzsjftcbl, "�곤��Ʒ���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.dzqysjftc)=="") {
		alert("������[�곤ǩԼ��Ʒ����]��");
		FormName.dzqysjftc.focus();
		return false;
	}
	if(!(isFloat(FormName.dzqysjftc, "�곤ǩԼ��Ʒ����"))) {
		return false;
	}
	if(	javaTrim(FormName.dzjssjftc)=="") {
		alert("������[�곤������Ʒ����]��");
		FormName.dzjssjftc.focus();
		return false;
	}
	if(!(isFloat(FormName.dzjssjftc, "�곤������Ʒ����"))) {
		return false;
	}
	if(	javaTrim(FormName.dzzxftcbl)=="") {
		alert("������[�곤װ�޷���ɱ���]��");
		FormName.dzzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.dzzxftcbl, "�곤װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.dzqyzxtc)=="") {
		alert("������[�곤ǩԼװ�����]��");
		FormName.dzqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.dzqyzxtc, "�곤ǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.dzjszxtc)=="") {
		alert("������[�곤����װ�����]��");
		FormName.dzjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.dzjszxtc, "�곤����װ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.dztcxj)=="") {
		alert("������[�곤���С��]��");
		FormName.dztcxj.focus();
		return false;
	}
	if(!(isFloat(FormName.dztcxj, "�곤���С��"))) {
		return false;
	}
	if(	javaTrim(FormName.dzkhbl)=="") {
		alert("������[�곤���˱���]��");
		FormName.dzkhbl.focus();
		return false;
	}
	if(!(isFloat(FormName.dzkhbl, "�곤���˱���"))) {
		return false;
	}
	if(	javaTrim(FormName.dztcze)=="") {
		alert("������[�곤����ܶ�]��");
		FormName.dztcze.focus();
		return false;
	}
	if(!(isFloat(FormName.dztcze, "�곤����ܶ�"))) {
		return false;
	}
	if(	javaTrim(FormName.wyzxftcbl)=="") {
		alert("������[��Աװ�޷���ɱ���]��");
		FormName.wyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wyzxftcbl, "��Աװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.wyqyzxtc)=="") {
		alert("������[��ԱǩԼװ�����]��");
		FormName.wyqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wyqyzxtc, "��ԱǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.wyjszxtc)=="") {
		alert("������[��Ա����װ�����]��");
		FormName.wyjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wyjszxtc, "��Ա����װ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.khjlsjftcbl)=="") {
		alert("������[����ҵ����Ʒ���ɱ���]��");
		FormName.khjlsjftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.khjlsjftcbl, "����ҵ����Ʒ���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.khjlqysjftc)=="") {
		alert("������[����ҵ��ǩԼ��Ʒ����]��");
		FormName.khjlqysjftc.focus();
		return false;
	}
	if(!(isFloat(FormName.khjlqysjftc, "����ҵ��ǩԼ��Ʒ����"))) {
		return false;
	}
	if(	javaTrim(FormName.khjljssjftc)=="") {
		alert("������[����ҵ�������Ʒ����]��");
		FormName.khjljssjftc.focus();
		return false;
	}
	if(!(isFloat(FormName.khjljssjftc, "����ҵ�������Ʒ����"))) {
		return false;
	}
	if(	javaTrim(FormName.khjlzxftcbl)=="") {
		alert("������[����ҵ��װ�޷���ɱ���]��");
		FormName.khjlzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.khjlzxftcbl, "����ҵ��װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.khjlqyzxtc)=="") {
		alert("������[����ҵ��ǩԼװ�����]��");
		FormName.khjlqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.khjlqyzxtc, "����ҵ��ǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.khjljszxtc)=="") {
		alert("������[����ҵ�����װ�����]��");
		FormName.khjljszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.khjljszxtc, "����ҵ�����װ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.khjltcxj)=="") {
		alert("������[����ҵ�����С��]��");
		FormName.khjltcxj.focus();
		return false;
	}
	if(!(isFloat(FormName.khjltcxj, "����ҵ�����С��"))) {
		return false;
	}
	if(	javaTrim(FormName.khjlkhbl)=="") {
		alert("������[����ҵ�񿼺˱���]��");
		FormName.khjlkhbl.focus();
		return false;
	}
	if(!(isFloat(FormName.khjlkhbl, "����ҵ�񿼺˱���"))) {
		return false;
	}
	if(	javaTrim(FormName.khjltcze)=="") {
		alert("������[����ҵ������ܶ�]��");
		FormName.khjltcze.focus();
		return false;
	}
	if(!(isFloat(FormName.khjltcze, "����ҵ������ܶ�"))) {
		return false;
	}
	if(	javaTrim(FormName.sjssjftcbl)=="") {
		alert("������[���ʦ��Ʒ���ɱ���]��");
		FormName.sjssjftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjssjftcbl, "���ʦ��Ʒ���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsqysjftc)=="") {
		alert("������[���ʦǩԼ��Ʒ����]��");
		FormName.sjsqysjftc.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsqysjftc, "���ʦǩԼ��Ʒ����"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsjssjftc)=="") {
		alert("������[���ʦ������Ʒ����]��");
		FormName.sjsjssjftc.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsjssjftc, "���ʦ������Ʒ����"))) {
		return false;
	}
	if(	javaTrim(FormName.sjszxftcbl)=="") {
		alert("������[���ʦװ�޷���ɱ���]��");
		FormName.sjszxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjszxftcbl, "���ʦװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsqyzxtc)=="") {
		alert("������[���ʦǩԼװ�����]��");
		FormName.sjsqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsqyzxtc, "���ʦǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsjszxtc)=="") {
		alert("������[���ʦ����װ�����]��");
		FormName.sjsjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsjszxtc, "���ʦ����װ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsycftcbl)=="") {
		alert("������[���ʦԶ�̷���ɱ���]��");
		FormName.sjsycftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsycftcbl, "���ʦԶ�̷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsycftc)=="") {
		alert("������[���ʦԶ�̷����]��");
		FormName.sjsycftc.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsycftc, "���ʦԶ�̷����"))) {
		return false;
	}
	if(	javaTrim(FormName.sjstchj)=="") {
		alert("������[���ʦ��ɺϼ�]��");
		FormName.sjstchj.focus();
		return false;
	}
	if(!(isFloat(FormName.sjstchj, "���ʦ��ɺϼ�"))) {
		return false;
	}
	if(	javaTrim(FormName.zjzxftcbl)=="") {
		alert("������[�ͻ�����װ�޷���ɱ���]��");
		FormName.zjzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjzxftcbl, "�ͻ�����װ�޷���ɱ���"))) {
		return false;
	}
	if(!(isFloat(FormName.zjqyzxtc, "�ͻ�����ǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.zjjszxtc)=="") {
		alert("������[�ͻ��������װ�����]��");
		FormName.zjjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.zjjszxtc, "�ͻ��������װ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.zjycftcbl)=="") {
		alert("������[�ͻ�����Զ�̷���ɱ���]��");
		FormName.zjycftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjycftcbl, "�ͻ�����Զ�̷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.zjycftc)=="") {
		alert("������[�ͻ�����Զ�̷����]��");
		FormName.zjycftc.focus();
		return false;
	}
	if(!(isFloat(FormName.zjycftc, "�ͻ�����Զ�̷����"))) {
		return false;
	}
	if(	javaTrim(FormName.zjtcxj)=="") {
		alert("������[�ͻ��������С��]��");
		FormName.zjtcxj.focus();
		return false;
	}
	if(!(isFloat(FormName.zjtcxj, "�ͻ��������С��"))) {
		return false;
	}
	if(	javaTrim(FormName.zjkhbl)=="") {
		alert("������[�ͻ������˱���]��");
		FormName.zjkhbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjkhbl, "�ͻ������˱���"))) {
		return false;
	}

	if(	javaTrim(FormName.zjtchj)=="") {
		alert("������[�ͻ�������ɺϼ�]��");
		FormName.zjtchj.focus();
		return false;
	}
	if(!(isFloat(FormName.zjtchj, "�ͻ�������ɺϼ�"))) {
		return false;
	}
	if(	javaTrim(FormName.clyzxftcbl)=="") {
		alert("������[����Աװ�޷���ɱ���]��");
		FormName.clyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.clyzxftcbl, "����Աװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.clyqyzxtc)=="") {
		alert("������[����ԱǩԼװ�����]��");
		FormName.clyqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.clyqyzxtc, "����ԱǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.clyjszxtc)=="") {
		alert("������[����Ա����װ�����]��");
		FormName.clyjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.clyjszxtc, "����Ա����װ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.clykhbl)=="") {
		alert("������[����Ա���˱���]��");
		FormName.clykhbl.focus();
		return false;
	}
	if(!(isFloat(FormName.clykhbl, "����Ա���˱���"))) {
		return false;
	}
	if(	javaTrim(FormName.clytc)=="") {
		alert("������[����Ա���]��");
		FormName.clytc.focus();
		return false;
	}
	if(!(isFloat(FormName.clytc, "����Ա���"))) {
		return false;
	}
	
	if(	javaTrim(FormName.xqzgzxftcbl)=="") {
		alert("������[С������װ�޷���ɱ���]��");
		FormName.xqzgzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzgzxftcbl, "С������װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzgqyzxtc)=="") {
		alert("������[С������ǩԼװ�����]��");
		FormName.xqzgqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzgqyzxtc, "С������ǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzgjszxtc)=="") {
		alert("������[С�����ܽ���װ�����]��");
		FormName.xqzgjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzgjszxtc, "С�����ܽ���װ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzgkhbl)=="") {
		alert("������[С�����ܿ��˱���]��");
		FormName.xqzgkhbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzgkhbl, "С�����ܿ��˱���"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzgtc)=="") {
		alert("������[С���������]��");
		FormName.xqzgtc.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzgtc, "С���������"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzzzxftcbl)=="") {
		alert("������[С���鳤װ�޷���ɱ���]��");
		FormName.xqzzzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzzzxftcbl, "С���鳤װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzzqyzxtc)=="") {
		alert("������[С���鳤ǩԼװ�����]��");
		FormName.xqzzqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzzqyzxtc, "С���鳤ǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzzjszxtc)=="") {
		alert("������[С���鳤����װ�����]��");
		FormName.xqzzjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzzjszxtc, "С���鳤����װ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzzkhbl)=="") {
		alert("������[С���鳤���˱���]��");
		FormName.xqzzkhbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzzkhbl, "С���鳤���˱���"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzztc)=="") {
		alert("������[С���鳤���]��");
		FormName.xqzztc.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzztc, "С���鳤���"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzyzxftcbl)=="") {
		alert("������[С��רԱװ�޷���ɱ���]��");
		FormName.xqzyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzyzxftcbl, "С��רԱװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzyqyzxtc)=="") {
		alert("������[С��רԱǩԼװ�����]��");
		FormName.xqzyqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzyqyzxtc, "С��רԱǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzyjszxtc)=="") {
		alert("������[С��רԱ����װ�����]��");
		FormName.xqzyjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzyjszxtc, "С��רԱ����װ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzykhbl)=="") {
		alert("������[С��רԱ���˱���]��");
		FormName.xqzykhbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzykhbl, "С��רԱ���˱���"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzytc)=="") {
		alert("������[С��רԱ���]��");
		FormName.xqzytc.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzytc, "С��רԱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.wlyxzgzxftcbl)=="") {
		alert("������[����Ӫ������װ�޷���ɱ���]��");
		FormName.wlyxzgzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wlyxzgzxftcbl, "����Ӫ������װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.wlyxzgqyzxtc)=="") {
		alert("������[����Ӫ������ǩԼװ�����]��");
		FormName.wlyxzgqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wlyxzgqyzxtc, "����Ӫ������ǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.wlyxzgjszxtc)=="") {
		alert("������[����Ӫ�����ܽ���װ�����]��");
		FormName.wlyxzgjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wlyxzgjszxtc, "����Ӫ�����ܽ���װ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.wlyxzgkhbl)=="") {
		alert("������[����Ӫ�����ܿ��˱���]��");
		FormName.wlyxzgkhbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wlyxzgkhbl, "����Ӫ�����ܿ��˱���"))) {
		return false;
	}
	if(	javaTrim(FormName.wlyxzgtc)=="") {
		alert("������[����Ӫ���������]��");
		FormName.wlyxzgtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wlyxzgtc, "����Ӫ���������"))) {
		return false;
	}
	if(	javaTrim(FormName.yxzyzxftcbl)=="") {
		alert("������[Ӫ��רԱװ�޷���ɱ���]��");
		FormName.yxzyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.yxzyzxftcbl, "Ӫ��רԱװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.yxzyqyzxtc)=="") {
		alert("������[Ӫ��רԱǩԼװ�����]��");
		FormName.yxzyqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.yxzyqyzxtc, "Ӫ��רԱǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.wzchzxftcbl)=="") {
		alert("������[��վ�߻�װ�޷���ɱ���]��");
		FormName.wzchzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wzchzxftcbl, "��վ�߻�װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.wzchqyzxtc)=="") {
		alert("������[��վ�߻�ǩԼװ�����]��");
		FormName.wzchqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wzchqyzxtc, "��վ�߻�ǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.wysjzxftcbl)=="") {
		alert("������[��ҳ���װ�޷���ɱ���]��");
		FormName.wysjzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wysjzxftcbl, "��ҳ���װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.wysjqyzxtc)=="") {
		alert("������[��ҳ���ǩԼװ�����]��");
		FormName.wysjqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wysjqyzxtc, "��ҳ���ǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.wzcxyzxftcbl)=="") {
		alert("������[��վ����Աװ�޷���ɱ���]��");
		FormName.wzcxyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wzcxyzxftcbl, "��վ����Աװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.wzcxyqyzxtc)=="") {
		alert("������[��վ����ԱǩԼװ�����]��");
		FormName.wzcxyqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wzcxyqyzxtc, "��վ����ԱǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.dhzyzxftcbl)=="") {
		alert("������[�绰רԱװ�޷���ɱ���]��");
		FormName.dhzyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.dhzyzxftcbl, "�绰רԱװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.dhzyqyzxtc)=="") {
		alert("������[�绰רԱǩԼװ�����]��");
		FormName.dhzyqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.dhzyqyzxtc, "�绰רԱǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.wztgyzxftcbl)=="") {
		alert("������[��վ�ƹ�Աװ�޷���ɱ���]��");
		FormName.wztgyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wztgyzxftcbl, "��վ�ƹ�Աװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.wztgyqyzxtc)=="") {
		alert("������[��վ�ƹ�ԱǩԼװ�����]��");
		FormName.wztgyqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wztgyqyzxtc, "��վ�ƹ�ԱǩԼװ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.wztgyjszxtc)=="") {
		alert("������[��վ�ƹ�Ա����װ�����]��");
		FormName.wztgyjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wztgyjszxtc, "��վ�ƹ�Ա����װ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.wztgykhbl)=="") {
		alert("������[��վ�ƹ�Ա���˱���]��");
		FormName.wztgykhbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wztgykhbl, "��վ�ƹ�Ա���˱���"))) {
		return false;
	}
	if(	javaTrim(FormName.wztgytc)=="") {
		alert("������[��վ�ƹ�Ա���]��");
		FormName.wztgytc.focus();
		return false;
	}
	if(!(isFloat(FormName.wztgytc, "��վ�ƹ�Ա���"))) {
		return false;
	}
	if(	javaTrim(FormName.sjzxftcbl)=="") {
		alert("������[˾��װ�޷���ɱ���]��");
		FormName.sjzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjzxftcbl, "˾��װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sjqyzxtc)=="") {
		alert("������[˾��ǩԼװ�����]��");
		FormName.sjqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.sjqyzxtc, "˾��ǩԼװ�����"))) {
		return false;
	}

	if(	javaTrim(FormName.jjze)=="") {
		alert("������[�����ܶ�]��");
		FormName.jjze.focus();
		return false;
	}
	if(!(isFloat(FormName.jjze, "�����ܶ�"))) {
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("��ѡ��[����]��");
		FormName.lx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
