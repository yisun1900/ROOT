<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>���㹤��</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">


<%
String lrr=(String)session.getAttribute("yhmc");

String ssfgs=request.getParameter("ssfgs");
String khzq=request.getParameter("khzq");



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;



try {
	conn=cf.getConnection();

	String tcqssj=null;
	String tcjzsj=null;
	double qqts=0;
	ls_sql="select TO_CHAR(ksrq,'YYYY-MM-DD'),TO_CHAR(zzrq,'YYYY-MM-DD'),qqts ";
	ls_sql+=" from  rs_gzb";
	ls_sql+=" where khzq='"+khzq+"' and ssfgs='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcqssj=rs.getString(1);
		tcjzsj=rs.getString(2);
		qqts=rs.getDouble(3);
	}
	rs.close();
	ps.close();




	String tcjssz="";
	String sjsjb="";
	String tcblbz="";
	String zckhbz="";
	String jstcblkb="";
	String sctcsj="";
	String jstcsj="";
	double ywykd=0;//ҵ��Ա�۵�
	double sjssjfbl=0;
	double sjssjfecbl=0;
	double sjszcbl=0;
	double scbdhbl=0;
	double scbxqbl=0;
	double dhyxbl=0;
	double wlyxbl=0;
	double jltcbl=0;
	double dzzcbl=0;
	double dzsjfbl=0;
	double qzzcbl=0;
	double qzsjfbl=0;
	double qfzzcbl=0;
	double qfzsjfbl=0;
	double qtmdje=0;
	ls_sql="select tcjssz,sjsjb,tcblbz,zckhbz,jstcblkb,sctcsj,jstcsj,ywykd,sjssjfbl,sjssjfecbl,sjszcbl,scbdhbl,scbxqbl,dhyxbl,wlyxbl,jltcbl,dzzcbl,dzsjfbl,qzzcbl,qzsjfbl,qfzzcbl,qfzsjfbl,qtmdje ";
	ls_sql+=" from  rs_tccs";
	ls_sql+=" where fgsbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcjssz=cf.fillNull(rs.getString("tcjssz"));
		sjsjb=cf.fillNull(rs.getString("sjsjb"));
		tcblbz=cf.fillNull(rs.getString("tcblbz"));
		zckhbz=cf.fillNull(rs.getString("zckhbz"));
		jstcblkb=cf.fillNull(rs.getString("jstcblkb"));
		sctcsj=cf.fillNull(rs.getString("sctcsj"));
		jstcsj=cf.fillNull(rs.getString("jstcsj"));
		ywykd=rs.getDouble("ywykd");
		sjssjfbl=rs.getDouble("sjssjfbl");
		sjssjfecbl=rs.getDouble("sjssjfecbl");
		sjszcbl=rs.getDouble("sjszcbl");
		scbdhbl=rs.getDouble("scbdhbl");
		scbxqbl=rs.getDouble("scbxqbl");
		dhyxbl=rs.getDouble("dhyxbl");
		wlyxbl=rs.getDouble("wlyxbl");
		jltcbl=rs.getDouble("jltcbl");
		dzzcbl=rs.getDouble("dzzcbl");
		dzsjfbl=rs.getDouble("dzsjfbl");
		qzzcbl=rs.getDouble("qzzcbl");
		qzsjfbl=rs.getDouble("qzsjfbl");
		qfzzcbl=rs.getDouble("qfzzcbl");
		qfzsjfbl=rs.getDouble("qfzsjfbl");
		qtmdje=rs.getDouble("qtmdje");
	}
	rs.close();
	ps.close();






	//ǩ�������ϸ
	ls_sql="delete from rs_qdtcmx";
	ls_sql+=" where khzq='"+khzq+"' and ssfgs='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//���������ϸ
	ls_sql="delete from rs_jstcmx";
	ls_sql+=" where khzq='"+khzq+"' and ssfgs='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//�˵������ϸ
	ls_sql="delete from rs_tdtcmx";
	ls_sql+=" where khzq='"+khzq+"' and ssfgs='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//��Ʒ������ϸ
	ls_sql="delete from rs_sjftcmx";
	ls_sql+=" where khzq='"+khzq+"' and ssfgs='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//���������ϸ
	ls_sql="delete from rs_zctcmx";
	ls_sql+=" where khzq='"+khzq+"' and ssfgs='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//�����ϸ��
	ls_sql="delete from rs_tcmxb";
	ls_sql+=" where khzq='"+khzq+"' and ssfgs='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="delete from rs_ygzbjtzjl ";
	ls_sql+=" where jlh='"+khzq+"' and ssfgs='"+ssfgs+"' and lx='3'";//1��¼�룻2������3�����
	ps1= conn.prepareStatement(ls_sql);
	ps1.executeUpdate();
	ps1.close();

	String ygbh=null;
	String bianhao=null;
	String getyhmc=null;
	String xzzwbm=null;
	String zwbm=null;
	String getdwbh=null;

	ls_sql="select ygbh,bianhao,yhmc,xzzwbm,zwbm,dwbh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where ssfgs='"+ssfgs+"'";
    ls_sql+=" and (zwbm='04' OR (zwbm!='04' and sfzszg in('Y','N')) )";
    ls_sql+=" order by ygbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ygbh=cf.fillNull(rs.getString("ygbh"));
		bianhao=cf.fillNull(rs.getString("bianhao"));
		getyhmc=cf.fillNull(rs.getString("yhmc"));
		xzzwbm=cf.fillHtml(rs.getString("xzzwbm"));
		zwbm=cf.fillNull(rs.getString("zwbm"));
		getdwbh=cf.fillNull(rs.getString("dwbh"));


		if (zwbm.equals("04"))//04:��װ���ʦ
		{
			//���������ϸ����������������������������ʼ

			//�����տ���
			double zcje=0;
			ls_sql=" SELECT sum(cw_khfkjl.fkje) ";
			ls_sql+=" from crm_khxx,cw_khfkjl";
			ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh(+)";
			ls_sql+=" and crm_khxx.fgsbh='"+ssfgs+"'";
			ls_sql+=" and crm_khxx.sjs='"+getyhmc+"'";

			ls_sql+=" and cw_khfkjl.scbz='N'";//N��δɾ����Y����ɾ��
			ls_sql+=" and cw_khfkjl.fklxbm='23'";//23:����

			ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
			ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
			ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zcje=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			double tcje=cf.round(zcje*sjszcbl/100,2);

			ls_sql =" insert into rs_zctcmx (khzq,ssfgs,ygbh,bianhao,yhmc,xzzwbm,zwbm,dwbh,tcjs,tcbl,tcje,bz)";
			ls_sql+=" values(                ?   ,?    ,?   ,?      ,?   ,?     ,?   ,?   ,?   ,?   ,?   ,'') ";
			ps2= conn.prepareStatement(ls_sql);
			ps2.setString(1,khzq);
			ps2.setString(2,ssfgs);
			ps2.setString(3,ygbh);
			ps2.setString(4,bianhao);
			ps2.setString(5,getyhmc);
			ps2.setString(6,xzzwbm);
			ps2.setString(7,zwbm);
			ps2.setString(8,getdwbh);

			ps2.setDouble(9,zcje);
			ps2.setDouble(10,sjszcbl);
			ps2.setDouble(11,tcje);
			ps2.executeUpdate();
			ps2.close();
			//���������ϸ������������������������������
			
			//ǩ�������ϸ����������������������������ʼ
			//ǩ��
			double xjqdqye=0;
			double xjqdyjjz=0;
			ls_sql=" SELECT sum(crm_khxx.qye),sum(crm_khqye.yjjz)";
			ls_sql+=" from crm_khxx,crm_khqye";
			ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
			ls_sql+=" and crm_khxx.zt in('2','3')";
			ls_sql+=" and crm_khxx.fgsbh='"+ssfgs+"'";
			ls_sql+=" and crm_khxx.sjs='"+getyhmc+"'";
			ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				xjqdqye=rs1.getDouble(1);
				xjqdyjjz=rs1.getDouble(2);
			}
			rs1.close();
			ps1.close();

			//�˵�
			double xjtdqye=0;
			double xjtdyjjz=0;
			ls_sql=" SELECT sum(crm_khxx.qye),sum(crm_khqye.yjjz)";
			ls_sql+=" from crm_khxx,crm_khqye";
			ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
			ls_sql+=" and crm_khxx.zt='3'";//3���˵��ͻ�
			ls_sql+=" and yjjzsj is not null ";//�״θ���װ��ʱ��
			ls_sql+=" and crm_khxx.fgsbh='"+ssfgs+"'";
			ls_sql+=" and crm_khxx.sjs='"+getyhmc+"'";
			ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				xjtdqye=rs1.getDouble(1);
				xjtdyjjz=rs1.getDouble(2);
			}
			rs1.close();
			ps1.close();


			//ҵ���ܶ�
			double xjqye=0;
			double xjyjjz=0;
			xjqye=cf.round(xjqdqye-xjtdqye,2);
			xjyjjz=cf.round(xjqdyjjz-xjtdyjjz,2);


			
			//ǩ����ϸ
			String khbh=null;
			String ywy=null;
			double qye=0;
			double yjjz=0;
			if (sctcsj.equals("1"))//1������ҵ��ʱ�䣻2������ʱ��
			{
				ls_sql=" SELECT crm_khxx.khbh,crm_khxx.ywy,crm_khxx.qye,crm_khqye.yjjz";
				ls_sql+=" from crm_khxx,crm_khqye";
				ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
				ls_sql+=" and crm_khxx.zt in('2','3')";
				ls_sql+=" and crm_khxx.fgsbh='"+ssfgs+"'";
				ls_sql+=" and crm_khxx.sjs='"+getyhmc+"'";

				ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

				ls_sql+=" and crm_khxx.sjsjsbz='0'";//0��δ��ɣ�1��ǩ����ɣ�2��������
			}
			else{
				ls_sql=" SELECT crm_khxx.khbh,crm_khxx.ywy,crm_khxx.qye,crm_khqye.yjjz";
				ls_sql+=" from crm_khxx,crm_khqye";
				ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
				ls_sql+=" and crm_khxx.zt in('2','3')";
				ls_sql+=" and crm_khxx.fgsbh='"+ssfgs+"'";
				ls_sql+=" and crm_khxx.sjs='"+getyhmc+"'";

				ls_sql+=" and crm_khxx.gcjdbm!='1'";//1��δ������2�����̿�����6�����ι�����ɣ�3���������գ�4�������깤��5��������᣻7����ͬ�쳣��ֹ
				ls_sql+=" and crm_khxx.sjkgrq>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.sjkgrq<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

				ls_sql+=" and crm_khxx.sjsjsbz='0'";//0��δ��ɣ�1��ǩ����ɣ�2��������
			}
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			while (rs1.next())
			{
				khbh=rs1.getString("khbh");
				ywy=cf.fillNull(rs1.getString("ywy"));
				qye=rs1.getDouble("qye");
				yjjz=rs1.getDouble("yjjz");

				double tcjs=0;
				if (tcjssz.equals("1"))//1��ǩԼ�2��ҵ����ֵ
				{
					tcjs=qye;
				}
				else
				{
					tcjs=yjjz;
				}

				//ǩ����ɱ�������������������ʼ
				double tcbfb=0;//��ɱ���
				if (tcblbz.equals("1"))//1��ÿ���������������2����ǩ���ܶ�������
				{
					if (tcjssz.equals("1"))//1��ǩԼ�2��ҵ����ֵ
					{
						ls_sql=" SELECT tcbfb";
						ls_sql+=" FROM rs_sjsjztcbl";
						ls_sql+=" where fgsbh='"+ssfgs+"'";
						ls_sql+=" and qd<="+qye;
						ls_sql+=" and zd>"+qye;
						ps2= conn.prepareStatement(ls_sql);
						rs2 =ps2.executeQuery();
						if (rs2.next())
						{
							tcbfb=rs2.getDouble("tcbfb");
						}
						rs2.close();
						ps2.close();
					}
					else{
						ls_sql=" SELECT tcbfb";
						ls_sql+=" FROM rs_sjsjztcbl";
						ls_sql+=" where fgsbh='"+ssfgs+"'";
						ls_sql+=" and qd<="+yjjz;
						ls_sql+=" and zd>"+yjjz;
						ps2= conn.prepareStatement(ls_sql);
						rs2 =ps2.executeQuery();
						if (rs2.next())
						{
							tcbfb=rs2.getDouble("tcbfb");
						}
						rs2.close();
						ps2.close();
					}
				}
				else{
					if (tcjssz.equals("1"))//1��ǩԼ�2��ҵ����ֵ
					{
						ls_sql=" SELECT tcbfb";
						ls_sql+=" FROM rs_sjsjztcbl";
						ls_sql+=" where fgsbh='"+ssfgs+"'";
						ls_sql+=" and qd<="+xjqye;
						ls_sql+=" and zd>"+xjqye;
						ps2= conn.prepareStatement(ls_sql);
						rs2 =ps2.executeQuery();
						if (rs2.next())
						{
							tcbfb=rs2.getDouble("tcbfb");
						}
						rs2.close();
						ps2.close();
					}
					else
					{
						ls_sql=" SELECT tcbfb";
						ls_sql+=" FROM rs_sjsjztcbl";
						ls_sql+=" where fgsbh='"+ssfgs+"'";
						ls_sql+=" and qd<="+xjyjjz;
						ls_sql+=" and zd>"+xjyjjz;
						ps2= conn.prepareStatement(ls_sql);
						rs2 =ps2.executeQuery();
						if (rs2.next())
						{
							tcbfb=rs2.getDouble("tcbfb");
						}
						rs2.close();
						ps2.close();
					}
				}
				//ǩ����ɱ���������������������


				//���Ŀ�����ɱ�������������������ʼ
				//�����տ���
				double khzcje=0;
				ls_sql=" SELECT sum(cw_khfkjl.fkje) ";
				ls_sql+=" from cw_khfkjl";
				ls_sql+=" where cw_khfkjl.khbh='"+khbh+"'";

				ls_sql+=" and cw_khfkjl.scbz='N'";//N��δɾ����Y����ɾ��
				ls_sql+=" and cw_khfkjl.fklxbm='23'";//23:����

				ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
				ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps2= conn.prepareStatement(ls_sql);
				rs2 =ps2.executeQuery();
				if (rs2.next())
				{
					khzcje=rs2.getDouble(1);
				}
				rs2.close();
				ps2.close();

				
				double zctcbl=0;
				if (zckhbz.equals("1"))//1�����Ķ�ˡ�2��������ȿ���
				{
					ls_sql=" SELECT tcbfb";
					ls_sql+=" FROM rs_sjszckhbz";
					ls_sql+=" where fgsbh='"+ssfgs+"'";
					ls_sql+=" and qd<="+khzcje;
					ls_sql+=" and zd>"+khzcje;
					ps2= conn.prepareStatement(ls_sql);
					rs2 =ps2.executeQuery();
					if (rs2.next())
					{
						zctcbl=rs2.getDouble("tcbfb");
					}
					rs2.close();
					ps2.close();

				}
				else{
					//�������
					double zcpb=0;
					if (qye!=0)
					{
						zcpb=cf.round(khzcje*100/qye,2);
					}

					ls_sql=" SELECT tcbfb";
					ls_sql+=" FROM rs_sjszckhbz";
					ls_sql+=" where fgsbh='"+ssfgs+"'";
					ls_sql+=" and qd<="+zcpb;
					ls_sql+=" and zd>"+zcpb;
					ps2= conn.prepareStatement(ls_sql);
					rs2 =ps2.executeQuery();
					if (rs2.next())
					{
						zctcbl=rs2.getDouble("tcbfb");
					}
					rs2.close();
					ps2.close();
				}
				//���Ŀ�����ɱ���������������������

				double tcbl=0;
				if (!ywy.equals(""))
				{
					tcbl=tcbfb-ywykd+zctcbl;//��ɱ���-ҵ��Ա�۵�+���Ŀ���
				}
				else{
					tcbl=tcbfb+zctcbl;//��ɱ���-ҵ��Ա�۵�+���Ŀ���
				}

				tcje=cf.round(tcjs*tcbl/100,2);
				
				ls_sql =" insert into rs_qdtcmx (khzq,ssfgs,ygbh,bianhao,yhmc,xzzwbm,zwbm,dwbh,khbh,qye,zcje,tcjs,tcbl,qdtcbl,ywykd,zckhtcbl,tcje,bz)";
				ls_sql+=" values(                ?   ,?    ,?   ,?      ,?   ,?     ,?   ,?   ,?   ,?  ,?   ,?   ,?   ,?     ,?    ,?       ,?   ,'') ";
				ps2= conn.prepareStatement(ls_sql);
				ps2.setString(1,khzq);
				ps2.setString(2,ssfgs);
				ps2.setString(3,ygbh);
				ps2.setString(4,bianhao);
				ps2.setString(5,getyhmc);
				ps2.setString(6,xzzwbm);
				ps2.setString(7,zwbm);
				ps2.setString(8,getdwbh);

				ps2.setString(9,khbh);
				ps2.setDouble(10,qye);
				ps2.setDouble(11,khzcje);
				ps2.setDouble(12,tcjs);
				ps2.setDouble(13,tcbl);
				ps2.setDouble(14,tcbfb);
				ps2.setDouble(15,ywykd);
				ps2.setDouble(16,zctcbl);
				ps2.setDouble(17,tcje);
				ps2.executeUpdate();
				ps2.close();
			}
			rs1.close();
			ps1.close();
			//ǩ�������ϸ������������������������������

			
			//���������ϸ����������������������������ʼ
		
			//������ϸ
			double zjxje=0;
			double zxyjjz=0;
			double sjssctcbl=0;
			double sjssctcje=0;
			if (jstcsj.equals("1"))//1��ʩ���ӽ���ʱ�䣻2���ͻ�����ʱ��
			{
				ls_sql=" SELECT crm_khxx.khbh,crm_khxx.ywy,sjstcbl,qdsyjsje,crm_khxx.qye,crm_khxx.zhljzjx,crm_khqye.zxyjjz";
				ls_sql+=" from crm_khxx,crm_khqye,cw_sgdwgjs";
				ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
				ls_sql+=" and crm_khxx.zt in('2')";
				ls_sql+=" and crm_khxx.fgsbh='"+ssfgs+"'";
				ls_sql+=" and crm_khxx.sjs='"+getyhmc+"'";

				ls_sql+=" and crm_khxx.gdjsjlh=cw_sgdwgjs.jsjlh(+)";
				ls_sql+=" and crm_khxx.gdjsjd in('Y','Z')";//Y���깤���㣻Z���깤���������
				ls_sql+=" and cw_sgdwgjs.jsrq>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and cw_sgdwgjs.jsrq<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

				ls_sql+=" and crm_khxx.sjsjsbz='1'";//0��δ��ɣ�1��ǩ����ɣ�2��������
			}
			else{
				ls_sql=" SELECT crm_khxx.khbh,crm_khxx.ywy,sjstcbl,qdsyjsje,crm_khxx.qye,crm_khxx.zhljzjx,crm_khqye.zxyjjz";
				ls_sql+=" from crm_khxx,crm_khqye";
				ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
				ls_sql+=" and crm_khxx.zt in('2')";
				ls_sql+=" and crm_khxx.fgsbh='"+ssfgs+"'";
				ls_sql+=" and crm_khxx.sjs='"+getyhmc+"'";

				ls_sql+=" and crm_khxx.khjsbz='Y'";//N��δ���㣻Y���ѽ��㣻2������ͬ�⣻3��������ͬ��
				ls_sql+=" and crm_khxx.khjssj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.khjssj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

				ls_sql+=" and crm_khxx.sjsjsbz='1'";//0��δ��ɣ�1��ǩ����ɣ�2��������
			}
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			while (rs1.next())
			{
				khbh=rs1.getString("khbh");
				ywy=cf.fillNull(rs1.getString("ywy"));
				qye=rs1.getDouble("qye");
				zjxje=rs1.getDouble("zjxje");
				zxyjjz=rs1.getDouble("zxyjjz");
				sjssctcbl=rs.getDouble("sjstcbl");
				sjssctcje=rs.getDouble("qdsyjsje");

				double tcjs=0;
				if (tcjssz.equals("1"))//1��ǩԼ�2��ҵ����ֵ
				{
					tcjs=qye+zjxje;
				}
				else
				{
					tcjs=zxyjjz;
				}

				double tcbl=0;
				double tcbfb=0;//��ɱ���
				double khzcje=0;
				double zctcbl=0;
				if (jstcblkb.equals("1"))//1��ȡǩ����ɡ�2�����¼���
				{
					tcbl=sjssctcbl;
				}
				else{
					
					//��ɱ�������������������ʼ
					if (tcblbz.equals("1"))//1��ÿ���������������2����ǩ���ܶ�������
					{
						if (tcjssz.equals("1"))//1��ǩԼ�2��ҵ����ֵ
						{
							ls_sql=" SELECT tcbfb";
							ls_sql+=" FROM rs_sjsjztcbl";
							ls_sql+=" where fgsbh='"+ssfgs+"'";
							ls_sql+=" and qd<="+(qye+zjxje);
							ls_sql+=" and zd>"+(qye+zjxje);
							ps2= conn.prepareStatement(ls_sql);
							rs2 =ps2.executeQuery();
							if (rs2.next())
							{
								tcbfb=rs2.getDouble("tcbfb");
							}
							rs2.close();
							ps2.close();
						}
						else{
							ls_sql=" SELECT tcbfb";
							ls_sql+=" FROM rs_sjsjztcbl";
							ls_sql+=" where fgsbh='"+ssfgs+"'";
							ls_sql+=" and qd<="+zxyjjz;
							ls_sql+=" and zd>"+zxyjjz;
							ps2= conn.prepareStatement(ls_sql);
							rs2 =ps2.executeQuery();
							if (rs2.next())
							{
								tcbfb=rs2.getDouble("tcbfb");
							}
							rs2.close();
							ps2.close();
						}
					}
					else{
						if (tcjssz.equals("1"))//1��ǩԼ�2��ҵ����ֵ
						{
							ls_sql=" SELECT tcbfb";
							ls_sql+=" FROM rs_sjsjztcbl";
							ls_sql+=" where fgsbh='"+ssfgs+"'";
							ls_sql+=" and qd<="+xjqye;
							ls_sql+=" and zd>"+xjqye;
							ps2= conn.prepareStatement(ls_sql);
							rs2 =ps2.executeQuery();
							if (rs2.next())
							{
								tcbfb=rs2.getDouble("tcbfb");
							}
							rs2.close();
							ps2.close();
						}
						else
						{
							ls_sql=" SELECT tcbfb";
							ls_sql+=" FROM rs_sjsjztcbl";
							ls_sql+=" where fgsbh='"+ssfgs+"'";
							ls_sql+=" and qd<="+xjyjjz;
							ls_sql+=" and zd>"+xjyjjz;
							ps2= conn.prepareStatement(ls_sql);
							rs2 =ps2.executeQuery();
							if (rs2.next())
							{
								tcbfb=rs2.getDouble("tcbfb");
							}
							rs2.close();
							ps2.close();
						}
					}
					//��ɱ���������������������

					//���Ŀ�����ɱ�������������������ʼ
					//�����տ���
					ls_sql=" SELECT sum(cw_khfkjl.fkje) ";
					ls_sql+=" from cw_khfkjl";
					ls_sql+=" where cw_khfkjl.khbh='"+khbh+"'";

					ls_sql+=" and cw_khfkjl.scbz='N'";//N��δɾ����Y����ɾ��
					ls_sql+=" and cw_khfkjl.fklxbm='23'";//23:����

					ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
					ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
					ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
					ps2= conn.prepareStatement(ls_sql);
					rs2 =ps1.executeQuery();
					if (rs2.next())
					{
						khzcje=rs2.getDouble(1);
					}
					rs2.close();
					ps2.close();

					
					if (zckhbz.equals("1"))//1�����Ķ�ˡ�2��������ȿ���
					{
						ls_sql=" SELECT tcbfb";
						ls_sql+=" FROM rs_sjszckhbz";
						ls_sql+=" where fgsbh='"+ssfgs+"'";
						ls_sql+=" and qd<="+khzcje;
						ls_sql+=" and zd>"+khzcje;
						ps2= conn.prepareStatement(ls_sql);
						rs2 =ps2.executeQuery();
						if (rs2.next())
						{
							zctcbl=rs2.getDouble("tcbfb");
						}
						rs2.close();
						ps2.close();

					}
					else{
						//�������
						double zcpb=0;
						if ((qye+zjxje)!=0)
						{
							zcpb=cf.round(khzcje*100/(qye+zjxje),2);
						}

						ls_sql=" SELECT tcbfb";
						ls_sql+=" FROM rs_sjszckhbz";
						ls_sql+=" where fgsbh='"+ssfgs+"'";
						ls_sql+=" and qd<="+zcpb;
						ls_sql+=" and zd>"+zcpb;
						ps2= conn.prepareStatement(ls_sql);
						rs2 =ps2.executeQuery();
						if (rs2.next())
						{
							zctcbl=rs2.getDouble("tcbfb");
						}
						rs2.close();
						ps2.close();
					}
					//���Ŀ�����ɱ���������������������

					if (!ywy.equals(""))
					{
						tcbl=tcbfb-ywykd+zctcbl;//��ɱ���-ҵ��Ա�۵�+���Ŀ���
					}
					else{
						tcbl=tcbfb+zctcbl;//��ɱ���-ҵ��Ա�۵�+���Ŀ���
					}
				}



				tcje=cf.round(tcjs*tcbl/100-sjssctcje,2);
				
				ls_sql =" insert into rs_jstcmx (khzq,ssfgs,ygbh,bianhao,yhmc,xzzwbm,zwbm,dwbh,khbh,qye,zjxje,zcje,tcjs,tcbl,qdtcbl,ywykd,zckhtcbl,sctcbl,sctcje,tcje,bz)";
				ls_sql+=" values(                ?   ,?    ,?   ,?      ,?   ,?     ,?   ,?   ,?   ,?  ,?    ,?   ,?   ,?   ,?     ,?    ,?       ,?     ,?     ,?   ,'') ";
				ps2= conn.prepareStatement(ls_sql);
				ps2.setString(1,khzq);
				ps2.setString(2,ssfgs);
				ps2.setString(3,ygbh);
				ps2.setString(4,bianhao);
				ps2.setString(5,getyhmc);
				ps2.setString(6,xzzwbm);
				ps2.setString(7,zwbm);
				ps2.setString(8,getdwbh);

				ps2.setString(9,khbh);
				ps2.setDouble(10,qye);
				ps2.setDouble(11,zjxje);
				ps2.setDouble(12,khzcje);
				ps2.setDouble(13,tcjs);
				ps2.setDouble(14,tcbl);
				ps2.setDouble(15,tcbfb);
				ps2.setDouble(16,ywykd);
				ps2.setDouble(17,zctcbl);
				ps2.setDouble(18,sjssctcbl);
				ps2.setDouble(19,sjssctcje);
				ps2.setDouble(20,tcje);
				ps2.executeUpdate();
				ps2.close();
			}
			rs1.close();
			ps1.close();
			//���������ϸ������������������������������

			
			//�˵������ϸ����������������������������ʼ
		
			//�˵���ϸ
			sjssctcbl=0;
			sjssctcje=0;
			ls_sql=" SELECT crm_khxx.khbh,sjstcbl,qdsyjsje";
			ls_sql+=" from crm_khxx,crm_khqye";
			ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
			ls_sql+=" and crm_khxx.zt='3'";//3���˵��ͻ�
			ls_sql+=" and yjjzsj is not null ";//�״θ���װ��ʱ��
			ls_sql+=" and crm_khxx.fgsbh='"+ssfgs+"'";
			ls_sql+=" and crm_khxx.sjs='"+getyhmc+"'";
			ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and crm_khxx.sjsjsbz='1'";//0��δ��ɣ�1��ǩ����ɣ�2��������
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			while (rs1.next())
			{
				khbh=rs1.getString("khbh");
				sjssctcbl=rs.getDouble("sjstcbl");
				sjssctcje=rs.getDouble("qdsyjsje");

				tcje=-1*sjssctcje;
				
				ls_sql =" insert into rs_tdtcmx (khzq,ssfgs,ygbh,bianhao,yhmc,xzzwbm,zwbm,dwbh,khbh,sctcbl,sctcje,tcje,bz)";
				ls_sql+=" values(                ?   ,?    ,?   ,?      ,?   ,?     ,?   ,?   ,?   ,?     ,?     ,?   ,'') ";
				ps2= conn.prepareStatement(ls_sql);
				ps2.setString(1,khzq);
				ps2.setString(2,ssfgs);
				ps2.setString(3,ygbh);
				ps2.setString(4,bianhao);
				ps2.setString(5,getyhmc);
				ps2.setString(6,xzzwbm);
				ps2.setString(7,zwbm);
				ps2.setString(8,getdwbh);

				ps2.setString(9,khbh);
				ps2.setDouble(10,sjssctcbl);
				ps2.setDouble(11,sjssctcje);
				ps2.setDouble(12,tcje);
				ps2.executeUpdate();
				ps2.close();
			}
			rs1.close();
			ps1.close();
			//�˵������ϸ������������������������������

			//��Ʒ������ϸ����������������������������ʼ
			//ǩ����ϸ
			if (sctcsj.equals("1"))//1������ҵ��ʱ�䣻2������ʱ��
			{
				ls_sql =" SELECT khbh";
				ls_sql+=" FROM ";
				ls_sql+=" ( ";
				ls_sql+=" SELECT crm_khxx.khbh";
				ls_sql+=" from crm_khxx";
				ls_sql+=" where crm_khxx.zt in('2','3')";
				ls_sql+=" and crm_khxx.fgsbh='"+ssfgs+"'";
				ls_sql+=" and crm_khxx.sjs='"+getyhmc+"'";

				ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

				ls_sql+=" and crm_khxx.sjsjsbz='0'";//0��δ��ɣ�1��ǩ����ɣ�2��������

				ls_sql+=" UNION ALL ";
			
				ls_sql+=" SELECT rs_sjftcsqb.khbh";
				ls_sql+=" from crm_zxkhxx,rs_sjftcsqb";
				ls_sql+=" where crm_zxkhxx.khbh=rs_sjftcsqb.khbh(+)";

				ls_sql+=" and crm_zxkhxx.ssfgs='"+ssfgs+"'";
				ls_sql+=" and crm_zxkhxx.sjs='"+getyhmc+"'";

				ls_sql+=" and rs_sjftcsqb.sqlx='1'";//1����һ����ɣ�2���ڶ������
				ls_sql+=" and rs_sjftcsqb.clzt='2'";//1�����룻2������ͬ�⣻3��������ͬ�⣻4������
				
				ls_sql+=" ) ";
			}
			else{
				ls_sql =" SELECT khbh";
				ls_sql+=" FROM ";
				ls_sql+=" ( ";
				ls_sql+=" SELECT crm_khxx.khbh";
				ls_sql+=" from crm_khxx";
				ls_sql+=" where crm_khxx.zt in('2','3')";
				ls_sql+=" and crm_khxx.fgsbh='"+ssfgs+"'";
				ls_sql+=" and crm_khxx.sjs='"+getyhmc+"'";

				ls_sql+=" and crm_khxx.gcjdbm!='1'";//1��δ������2�����̿�����6�����ι�����ɣ�3���������գ�4�������깤��5��������᣻7����ͬ�쳣��ֹ
				ls_sql+=" and crm_khxx.sjkgrq>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.sjkgrq<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

				ls_sql+=" and crm_khxx.sjsjsbz='0'";//0��δ��ɣ�1��ǩ����ɣ�2��������

				ls_sql+=" UNION ALL ";
			
				ls_sql+=" SELECT rs_sjftcsqb.khbh";
				ls_sql+=" from crm_zxkhxx,rs_sjftcsqb";
				ls_sql+=" where crm_zxkhxx.khbh=rs_sjftcsqb.khbh(+)";

				ls_sql+=" and crm_zxkhxx.ssfgs='"+ssfgs+"'";
				ls_sql+=" and crm_zxkhxx.sjs='"+getyhmc+"'";

				ls_sql+=" and rs_sjftcsqb.sqlx='2'";//1����һ����ɣ�2���ڶ������
				ls_sql+=" and rs_sjftcsqb.clzt='2'";//1�����룻2������ͬ�⣻3��������ͬ�⣻4������
				
				ls_sql+=" ) ";
			}
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			while (rs1.next())
			{
				khbh=rs1.getString("khbh");

				//ʵ����Ʒ�
				double sssjf=0;
				ls_sql=" SELECT sum(cw_khfkjl.fkje) ";
				ls_sql+=" from cw_khfkjl";
				ls_sql+=" where cw_khfkjl.khbh='"+khbh+"'";

				ls_sql+=" and cw_khfkjl.scbz='N'";//N��δɾ����Y����ɾ��
				ls_sql+=" and cw_khfkjl.fklxbm='53'";//53����Ʒ�

				ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
				ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps2= conn.prepareStatement(ls_sql);
				rs2 =ps1.executeQuery();
				if (rs2.next())
				{
					sssjf=rs2.getDouble(1);
				}
				rs2.close();
				ps2.close();

				double tcjs=sssjf;

				double tcbl=sjssjfbl;


				tcje=cf.round(tcjs*tcbl/100,2);

				if (tcje!=0)
				{
					ls_sql =" insert into rs_sjftcmx (khzq,ssfgs,ygbh,bianhao,yhmc,xzzwbm,zwbm,dwbh,khbh,tcjs,tcbl,tcje,bz)";
					ls_sql+=" values(                ?   ,?    ,?   ,?      ,?   ,?     ,?   ,?   ,?    ,?   ,?   ,?   ,'') ";
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,khzq);
					ps2.setString(2,ssfgs);
					ps2.setString(3,ygbh);
					ps2.setString(4,bianhao);
					ps2.setString(5,getyhmc);
					ps2.setString(6,xzzwbm);
					ps2.setString(7,zwbm);
					ps2.setString(8,getdwbh);

					ps2.setString(9,khbh);
					ps2.setDouble(10,tcjs);
					ps2.setDouble(11,tcbl);
					ps2.setDouble(12,tcje);
					ps2.executeUpdate();
					ps2.close();
				}
				
			}
			rs1.close();
			ps1.close();


			//������ϸ
			double sjfsctcje=0;
			if (jstcsj.equals("1"))//1��ʩ���ӽ���ʱ�䣻2���ͻ�����ʱ��
			{
				ls_sql=" SELECT crm_khxx.khbh,crm_khxx.sjfsctcje ";
				ls_sql+=" from crm_khxx,crm_khqye,cw_sgdwgjs";
				ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
				ls_sql+=" and crm_khxx.zt in('2')";
				ls_sql+=" and crm_khxx.fgsbh='"+ssfgs+"'";
				ls_sql+=" and crm_khxx.sjs='"+getyhmc+"'";

				ls_sql+=" and crm_khxx.gdjsjlh=cw_sgdwgjs.jsjlh(+)";
				ls_sql+=" and crm_khxx.gdjsjd in('Y','Z')";//Y���깤���㣻Z���깤���������
				ls_sql+=" and cw_sgdwgjs.jsrq>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and cw_sgdwgjs.jsrq<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

				ls_sql+=" and crm_khxx.sjsjsbz='1'";//0��δ��ɣ�1��ǩ����ɣ�2��������
			}
			else{
				ls_sql=" SELECT crm_khxx.khbh,crm_khxx.sjfsctcje ";
				ls_sql+=" from crm_khxx,crm_khqye";
				ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
				ls_sql+=" and crm_khxx.zt in('2')";
				ls_sql+=" and crm_khxx.fgsbh='"+ssfgs+"'";
				ls_sql+=" and crm_khxx.sjs='"+getyhmc+"'";

				ls_sql+=" and crm_khxx.khjsbz='Y'";//N��δ���㣻Y���ѽ��㣻2������ͬ�⣻3��������ͬ��
				ls_sql+=" and crm_khxx.khjssj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.khjssj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

				ls_sql+=" and crm_khxx.sjsjsbz='1'";//0��δ��ɣ�1��ǩ����ɣ�2��������
			}
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			while (rs1.next())
			{
				khbh=rs1.getString("khbh");
				sjfsctcje=rs1.getDouble("sjfsctcje");

				//ʵ����Ʒ�
				double sssjf=0;
				ls_sql=" SELECT sum(cw_khfkjl.fkje) ";
				ls_sql+=" from cw_khfkjl";
				ls_sql+=" where cw_khfkjl.khbh='"+khbh+"'";

				ls_sql+=" and cw_khfkjl.scbz='N'";//N��δɾ����Y����ɾ��
				ls_sql+=" and cw_khfkjl.fklxbm='53'";//53����Ʒ�

				ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
				ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps2= conn.prepareStatement(ls_sql);
				rs2 =ps2.executeQuery();
				if (rs2.next())
				{
					sssjf=rs2.getDouble(1);
				}
				rs2.close();
				ps2.close();

				double tcjs=sssjf;

				double tcbl=sjssjfecbl;


				tcje=cf.round(tcjs*tcbl/100-sjfsctcje,2);
				
				if (tcje!=0)
				{
					ls_sql =" insert into rs_sjftcmx (khzq,ssfgs,ygbh,bianhao,yhmc,xzzwbm,zwbm,dwbh,khbh,tcjs,tcbl,tcje,bz)";
					ls_sql+=" values(                ?   ,?    ,?   ,?      ,?   ,?     ,?   ,?   ,?    ,?   ,?   ,?   ,'') ";
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,khzq);
					ps2.setString(2,ssfgs);
					ps2.setString(3,ygbh);
					ps2.setString(4,bianhao);
					ps2.setString(5,getyhmc);
					ps2.setString(6,xzzwbm);
					ps2.setString(7,zwbm);
					ps2.setString(8,getdwbh);

					ps2.setString(9,khbh);
					ps2.setDouble(10,tcjs);
					ps2.setDouble(11,tcbl);
					ps2.setDouble(12,tcje);
					ps2.executeUpdate();
					ps2.close();
				}
			}
			rs1.close();
			ps1.close();
			//��Ʒ������ϸ������������������������������


		}
		else 
		{
			if (xzzwbm.equals("��Ʒҵ��Ա"))
			{
				//ǩ�������ϸ����������������������������ʼ

				//ǩ����ϸ
				String khbh=null;
				String ywy=null;
				double qye=0;
				double yjjz=0;
				if (sctcsj.equals("1"))//1������ҵ��ʱ�䣻2������ʱ��
				{
					ls_sql=" SELECT crm_khxx.khbh,crm_khxx.ywy,crm_khxx.qye,crm_khqye.yjjz";
					ls_sql+=" from crm_khxx,crm_khqye";
					ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
					ls_sql+=" and crm_khxx.zt in('2','3')";
					ls_sql+=" and crm_khxx.fgsbh='"+ssfgs+"'";//�״θ���װ��ʱ��
					ls_sql+=" and crm_khxx.ywy='"+getyhmc+"'";

					ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
					ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

					ls_sql+=" and crm_khxx.sjsjsbz='0'";//0��δ��ɣ�1��ǩ����ɣ�2��������
				}
				else{
					ls_sql=" SELECT crm_khxx.khbh,crm_khxx.ywy,crm_khxx.qye,crm_khqye.yjjz";
					ls_sql+=" from crm_khxx,crm_khqye";
					ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
					ls_sql+=" and crm_khxx.zt in('2','3')";
					ls_sql+=" and crm_khxx.fgsbh='"+ssfgs+"'";//�״θ���װ��ʱ��
					ls_sql+=" and crm_khxx.ywy='"+getyhmc+"'";

					ls_sql+=" and crm_khxx.gcjdbm!='1'";//1��δ������2�����̿�����6�����ι�����ɣ�3���������գ�4�������깤��5��������᣻7����ͬ�쳣��ֹ
					ls_sql+=" and crm_khxx.sjkgrq>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
					ls_sql+=" and crm_khxx.sjkgrq<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

					ls_sql+=" and crm_khxx.sjsjsbz='0'";//0��δ��ɣ�1��ǩ����ɣ�2��������
				}
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				while (rs1.next())
				{
					khbh=rs1.getString("khbh");
					ywy=cf.fillNull(rs1.getString("ywy"));
					qye=rs1.getDouble("qye");
					yjjz=rs1.getDouble("yjjz");

					int isScdm=0;
					ls_sql=" SELECT count(*)";
					ls_sql+=" from crm_khxxly";
					ls_sql+=" where khbh='"+khbh+"'";
					ls_sql+=" and xxlybm='16'";//16:�г�����
					ps2= conn.prepareStatement(ls_sql);
					rs2 =ps2.executeQuery();
					if (rs2.next())
					{
						isScdm=rs2.getInt(1);
					}
					rs2.close();
					ps2.close();

					double tcjs=0;
					if (tcjssz.equals("1"))//1��ǩԼ�2��ҵ����ֵ
					{
						tcjs=qye;
					}
					else
					{
						tcjs=yjjz;
					}


					double tcbl=0;
					if (isScdm>0)
					{
						tcbl=scbxqbl;//�г���С��������ɱ���
					}
					else{
						tcbl=scbdhbl;//�г����绰������ɱ���
					}

					double tcje=cf.round(tcjs*tcbl/100,2);
					
					ls_sql =" insert into rs_qdtcmx (khzq,ssfgs,ygbh,bianhao,yhmc,xzzwbm,zwbm,dwbh,khbh,qye,zcje,tcjs,tcbl,qdtcbl,ywykd,zckhtcbl,tcje,bz)";
					ls_sql+=" values(                ?   ,?    ,?   ,?      ,?   ,?     ,?   ,?   ,?   ,?  ,?   ,?   ,?   ,?     ,?    ,?       ,?   ,'') ";
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,khzq);
					ps2.setString(2,ssfgs);
					ps2.setString(3,ygbh);
					ps2.setString(4,bianhao);
					ps2.setString(5,getyhmc);
					ps2.setString(6,xzzwbm);
					ps2.setString(7,zwbm);
					ps2.setString(8,getdwbh);

					ps2.setString(9,khbh);
					ps2.setDouble(10,qye);
					ps2.setDouble(11,0);
					ps2.setDouble(12,tcjs);
					ps2.setDouble(13,tcbl);
					ps2.setDouble(14,0);
					ps2.setDouble(15,0);
					ps2.setDouble(16,0);
					ps2.setDouble(17,tcje);
					ps2.executeUpdate();
					ps2.close();
				}
				rs1.close();
				ps1.close();
				//ǩ�������ϸ������������������������������
			}
			else if (xzzwbm.equals("�绰Ӫ��רԱ"))
			{
				//ǩ�������ϸ����������������������������ʼ

				//ǩ����ϸ
				String khbh=null;
				String ywy=null;
				double qye=0;
				double yjjz=0;
				if (sctcsj.equals("1"))//1������ҵ��ʱ�䣻2������ʱ��
				{
					ls_sql=" SELECT crm_khxx.khbh,crm_khxx.ywy,crm_khxx.qye,crm_khqye.yjjz";
					ls_sql+=" from crm_khxx,crm_khqye";
					ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
					ls_sql+=" and crm_khxx.zt in('2','3')";
					ls_sql+=" and crm_khxx.fgsbh='"+ssfgs+"'";//�״θ���װ��ʱ��
					ls_sql+=" and crm_khxx.ywy='"+getyhmc+"'";

					ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
					ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

					ls_sql+=" and crm_khxx.sjsjsbz='0'";//0��δ��ɣ�1��ǩ����ɣ�2��������
				}
				else{
					ls_sql=" SELECT crm_khxx.khbh,crm_khxx.ywy,crm_khxx.qye,crm_khqye.yjjz";
					ls_sql+=" from crm_khxx,crm_khqye";
					ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
					ls_sql+=" and crm_khxx.zt in('2','3')";
					ls_sql+=" and crm_khxx.fgsbh='"+ssfgs+"'";//�״θ���װ��ʱ��
					ls_sql+=" and crm_khxx.ywy='"+getyhmc+"'";

					ls_sql+=" and crm_khxx.gcjdbm!='1'";//1��δ������2�����̿�����6�����ι�����ɣ�3���������գ�4�������깤��5��������᣻7����ͬ�쳣��ֹ
					ls_sql+=" and crm_khxx.sjkgrq>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
					ls_sql+=" and crm_khxx.sjkgrq<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

					ls_sql+=" and crm_khxx.sjsjsbz='0'";//0��δ��ɣ�1��ǩ����ɣ�2��������
				}
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				while (rs1.next())
				{
					khbh=rs1.getString("khbh");
					ywy=cf.fillNull(rs1.getString("ywy"));
					qye=rs1.getDouble("qye");
					yjjz=rs1.getDouble("yjjz");


					double tcjs=0;
					if (tcjssz.equals("1"))//1��ǩԼ�2��ҵ����ֵ
					{
						tcjs=qye;
					}
					else
					{
						tcjs=yjjz;
					}


					double tcbl=dhyxbl;

					double tcje=cf.round(tcjs*tcbl/100,2);
					
					ls_sql =" insert into rs_qdtcmx (khzq,ssfgs,ygbh,bianhao,yhmc,xzzwbm,zwbm,dwbh,khbh,qye,zcje,tcjs,tcbl,qdtcbl,ywykd,zckhtcbl,tcje,bz)";
					ls_sql+=" values(                ?   ,?    ,?   ,?      ,?   ,?     ,?   ,?   ,?   ,?  ,?   ,?   ,?   ,?     ,?    ,?       ,?   ,'') ";
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,khzq);
					ps2.setString(2,ssfgs);
					ps2.setString(3,ygbh);
					ps2.setString(4,bianhao);
					ps2.setString(5,getyhmc);
					ps2.setString(6,xzzwbm);
					ps2.setString(7,zwbm);
					ps2.setString(8,getdwbh);

					ps2.setString(9,khbh);
					ps2.setDouble(10,qye);
					ps2.setDouble(11,0);
					ps2.setDouble(12,tcjs);
					ps2.setDouble(13,tcbl);
					ps2.setDouble(14,0);
					ps2.setDouble(15,0);
					ps2.setDouble(16,0);
					ps2.setDouble(17,tcje);
					ps2.executeUpdate();
					ps2.close();
				}
				rs1.close();
				ps1.close();
				//ǩ�������ϸ������������������������������
			}
			else if (xzzwbm.equals("����Ӫ��רԱ"))
			{
				//ǩ�������ϸ����������������������������ʼ

				//ǩ����ϸ
				String khbh=null;
				String ywy=null;
				double qye=0;
				double yjjz=0;
				if (sctcsj.equals("1"))//1������ҵ��ʱ�䣻2������ʱ��
				{
					ls_sql=" SELECT crm_khxx.khbh,crm_khxx.ywy,crm_khxx.qye,crm_khqye.yjjz";
					ls_sql+=" from crm_khxx,crm_khqye";
					ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
					ls_sql+=" and crm_khxx.zt in('2','3')";
					ls_sql+=" and crm_khxx.fgsbh='"+ssfgs+"'";//�״θ���װ��ʱ��
					ls_sql+=" and crm_khxx.ywy='"+getyhmc+"'";

					ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
					ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

					ls_sql+=" and crm_khxx.sjsjsbz='0'";//0��δ��ɣ�1��ǩ����ɣ�2��������
				}
				else{
					ls_sql=" SELECT crm_khxx.khbh,crm_khxx.ywy,crm_khxx.qye,crm_khqye.yjjz";
					ls_sql+=" from crm_khxx,crm_khqye";
					ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
					ls_sql+=" and crm_khxx.zt in('2','3')";
					ls_sql+=" and crm_khxx.fgsbh='"+ssfgs+"'";//�״θ���װ��ʱ��
					ls_sql+=" and crm_khxx.ywy='"+getyhmc+"'";

					ls_sql+=" and crm_khxx.gcjdbm!='1'";//1��δ������2�����̿�����6�����ι�����ɣ�3���������գ�4�������깤��5��������᣻7����ͬ�쳣��ֹ
					ls_sql+=" and crm_khxx.sjkgrq>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
					ls_sql+=" and crm_khxx.sjkgrq<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

					ls_sql+=" and crm_khxx.sjsjsbz='0'";//0��δ��ɣ�1��ǩ����ɣ�2��������
				}
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				while (rs1.next())
				{
					khbh=rs1.getString("khbh");
					ywy=cf.fillNull(rs1.getString("ywy"));
					qye=rs1.getDouble("qye");
					yjjz=rs1.getDouble("yjjz");


					double tcjs=0;
					if (tcjssz.equals("1"))//1��ǩԼ�2��ҵ����ֵ
					{
						tcjs=qye;
					}
					else
					{
						tcjs=yjjz;
					}


					double tcbl=wlyxbl;

					double tcje=cf.round(tcjs*tcbl/100,2);
					
					ls_sql =" insert into rs_qdtcmx (khzq,ssfgs,ygbh,bianhao,yhmc,xzzwbm,zwbm,dwbh,khbh,qye,zcje,tcjs,tcbl,qdtcbl,ywykd,zckhtcbl,tcje,bz)";
					ls_sql+=" values(                ?   ,?    ,?   ,?      ,?   ,?     ,?   ,?   ,?   ,?  ,?   ,?   ,?   ,?     ,?    ,?       ,?   ,'') ";
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,khzq);
					ps2.setString(2,ssfgs);
					ps2.setString(3,ygbh);
					ps2.setString(4,bianhao);
					ps2.setString(5,getyhmc);
					ps2.setString(6,xzzwbm);
					ps2.setString(7,zwbm);
					ps2.setString(8,getdwbh);

					ps2.setString(9,khbh);
					ps2.setDouble(10,qye);
					ps2.setDouble(11,0);
					ps2.setDouble(12,tcjs);
					ps2.setDouble(13,tcbl);
					ps2.setDouble(14,0);
					ps2.setDouble(15,0);
					ps2.setDouble(16,0);
					ps2.setDouble(17,tcje);
					ps2.executeUpdate();
					ps2.close();
				}
				rs1.close();
				ps1.close();
				//ǩ�������ϸ������������������������������
			}
			else if (xzzwbm.equals("��Ʋ�����"))
			{
				//ǩ�������ϸ����������������������������ʼ

				//ǩ��
				double xjqdqye=0;
				double xjqdyjjz=0;
				ls_sql=" SELECT sum(crm_khxx.qye),sum(crm_khqye.yjjz)";
				ls_sql+=" from crm_khxx,crm_khqye";
				ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
				ls_sql+=" and crm_khxx.zt in('2','3')";
				ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"')";//�״θ���װ��ʱ��
				ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					xjqdqye=rs1.getDouble(1);
					xjqdyjjz=rs1.getDouble(2);
				}
				rs1.close();
				ps1.close();

				//�˵�
				double xjtdqye=0;
				double xjtdyjjz=0;
				ls_sql=" SELECT sum(crm_khxx.qye),sum(crm_khqye.yjjz)";
				ls_sql+=" from crm_khxx,crm_khqye";
				ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
				ls_sql+=" and crm_khxx.zt='3'";//3���˵��ͻ�
				ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"')";//�״θ���װ��ʱ��
				ls_sql+=" and yjjzsj is not null ";//�״θ���װ��ʱ��
				ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					xjtdqye=rs1.getDouble(1);
					xjtdyjjz=rs1.getDouble(2);
				}
				rs1.close();
				ps1.close();


				//ҵ���ܶ�
				double xjqye=0;
				double xjyjjz=0;
				xjqye=cf.round(xjqdqye-xjtdqye,2);
				xjyjjz=cf.round(xjqdyjjz-xjtdyjjz,2);

				//ǩ����ϸ
				String khbh=null;
				String ywy=null;
				double qye=0;
				double yjjz=0;
				ls_sql=" SELECT crm_khxx.khbh,crm_khxx.ywy,crm_khxx.qye,crm_khqye.yjjz";
				ls_sql+=" from crm_khxx,crm_khqye";
				ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
				ls_sql+=" and crm_khxx.zt in('2','3')";
				ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"')";//�״θ���װ��ʱ��

				ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				while (rs1.next())
				{
					khbh=rs1.getString("khbh");
					ywy=cf.fillNull(rs1.getString("ywy"));
					qye=rs1.getDouble("qye");
					yjjz=rs1.getDouble("yjjz");


					double tcjs=0;
					if (tcjssz.equals("1"))//1��ǩԼ�2��ҵ����ֵ
					{
						tcjs=qye;
					}
					else
					{
						tcjs=yjjz;
					}


					double tcbl=0;
					if (tcjssz.equals("1"))//1��ǩԼ�2��ҵ����ֵ
					{
						ls_sql=" SELECT tcbfb";
						ls_sql+=" FROM rs_dztcbl";
						ls_sql+=" where fgsbh='"+ssfgs+"'";
						ls_sql+=" and qd<="+xjqye;
						ls_sql+=" and zd>"+xjqye;
					}
					else{
						ls_sql=" SELECT tcbfb";
						ls_sql+=" FROM rs_dztcbl";
						ls_sql+=" where fgsbh='"+ssfgs+"'";
						ls_sql+=" and qd<="+xjyjjz;
						ls_sql+=" and zd>"+xjyjjz;
					}
					ps2= conn.prepareStatement(ls_sql);
					rs2 =ps2.executeQuery();
					if (rs2.next())
					{
						tcbl=rs2.getDouble("tcbfb");
					}
					rs2.close();
					ps2.close();

					double tcje=cf.round(tcjs*tcbl/100,2);
					
					ls_sql =" insert into rs_qdtcmx (khzq,ssfgs,ygbh,bianhao,yhmc,xzzwbm,zwbm,dwbh,khbh,qye,zcje,tcjs,tcbl,qdtcbl,ywykd,zckhtcbl,tcje,bz)";
					ls_sql+=" values(                ?   ,?    ,?   ,?      ,?   ,?     ,?   ,?   ,?   ,?  ,?   ,?   ,?   ,?     ,?    ,?       ,?   ,'') ";
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,khzq);
					ps2.setString(2,ssfgs);
					ps2.setString(3,ygbh);
					ps2.setString(4,bianhao);
					ps2.setString(5,getyhmc);
					ps2.setString(6,xzzwbm);
					ps2.setString(7,zwbm);
					ps2.setString(8,getdwbh);

					ps2.setString(9,khbh);
					ps2.setDouble(10,qye);
					ps2.setDouble(11,0);
					ps2.setDouble(12,tcjs);
					ps2.setDouble(13,tcbl);
					ps2.setDouble(14,0);
					ps2.setDouble(15,0);
					ps2.setDouble(16,0);
					ps2.setDouble(17,tcje);
					ps2.executeUpdate();
					ps2.close();
				}
				rs1.close();
				ps1.close();
				//ǩ�������ϸ������������������������������
			}
			else if (xzzwbm.equals("�����ܾ���"))
			{
				//ǩ�������ϸ����������������������������ʼ
				//ǩ��
				double xjqdqye=0;
				double xjqdyjjz=0;
				ls_sql=" SELECT sum(crm_khxx.qye),sum(crm_khqye.yjjz)";
				ls_sql+=" from crm_khxx,crm_khqye";
				ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
				ls_sql+=" and crm_khxx.zt in('2','3')";
					ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"')";
				ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					xjqdqye=rs1.getDouble(1);
					xjqdyjjz=rs1.getDouble(2);
				}
				rs1.close();
				ps1.close();

				//�˵�
				double xjtdqye=0;
				double xjtdyjjz=0;
				ls_sql=" SELECT sum(crm_khxx.qye),sum(crm_khqye.yjjz)";
				ls_sql+=" from crm_khxx,crm_khqye";
				ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
				ls_sql+=" and crm_khxx.zt='3'";//3���˵��ͻ�
					ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"')";
				ls_sql+=" and yjjzsj is not null ";//�״θ���װ��ʱ��
				ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					xjtdqye=rs1.getDouble(1);
					xjtdyjjz=rs1.getDouble(2);
				}
				rs1.close();
				ps1.close();


				//ҵ���ܶ�
				double xjqye=0;
				double xjyjjz=0;
				xjqye=cf.round(xjqdqye-xjtdqye,2);
				xjyjjz=cf.round(xjqdyjjz-xjtdyjjz,2);


				//ǩ����ϸ
				String khbh=null;
				String ywy=null;
				double qye=0;
				double yjjz=0;
					ls_sql=" SELECT crm_khxx.khbh,crm_khxx.ywy,crm_khxx.qye,crm_khqye.yjjz";
					ls_sql+=" from crm_khxx,crm_khqye";
					ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
					ls_sql+=" and crm_khxx.zt in('2','3')";
					ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"')";

					ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
					ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

					ls_sql+=" and crm_khxx.sjsjsbz='0'";//0��δ��ɣ�1��ǩ����ɣ�2��������
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				while (rs1.next())
				{
					khbh=rs1.getString("khbh");
					ywy=cf.fillNull(rs1.getString("ywy"));
					qye=rs1.getDouble("qye");
					yjjz=rs1.getDouble("yjjz");


					double tcjs=0;
					if (tcjssz.equals("1"))//1��ǩԼ�2��ҵ����ֵ
					{
						tcjs=qye;
					}
					else
					{
						tcjs=yjjz;
					}


					double tcbl=0;
					if (tcjssz.equals("1"))//1��ǩԼ�2��ҵ����ֵ
					{
						ls_sql=" SELECT tcbfb";
						ls_sql+=" FROM rs_qztcbl";
						ls_sql+=" where fgsbh='"+ssfgs+"'";
						ls_sql+=" and qd<="+xjqye;
						ls_sql+=" and zd>"+xjqye;
					}
					else{
						ls_sql=" SELECT tcbfb";
						ls_sql+=" FROM rs_qztcbl";
						ls_sql+=" where fgsbh='"+ssfgs+"'";
						ls_sql+=" and qd<="+xjyjjz;
						ls_sql+=" and zd>"+xjyjjz;
					}
					ps2= conn.prepareStatement(ls_sql);
					rs2 =ps2.executeQuery();
					if (rs2.next())
					{
						tcbl=rs2.getDouble("tcbfb");
					}
					rs2.close();
					ps2.close();

					double tcje=cf.round(tcjs*tcbl/100,2);
					
					ls_sql =" insert into rs_qdtcmx (khzq,ssfgs,ygbh,bianhao,yhmc,xzzwbm,zwbm,dwbh,khbh,qye,zcje,tcjs,tcbl,qdtcbl,ywykd,zckhtcbl,tcje,bz)";
					ls_sql+=" values(                ?   ,?    ,?   ,?      ,?   ,?     ,?   ,?   ,?   ,?  ,?   ,?   ,?   ,?     ,?    ,?       ,?   ,'') ";
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,khzq);
					ps2.setString(2,ssfgs);
					ps2.setString(3,ygbh);
					ps2.setString(4,bianhao);
					ps2.setString(5,getyhmc);
					ps2.setString(6,xzzwbm);
					ps2.setString(7,zwbm);
					ps2.setString(8,getdwbh);

					ps2.setString(9,khbh);
					ps2.setDouble(10,qye);
					ps2.setDouble(11,0);
					ps2.setDouble(12,tcjs);
					ps2.setDouble(13,tcbl);
					ps2.setDouble(14,0);
					ps2.setDouble(15,0);
					ps2.setDouble(16,0);
					ps2.setDouble(17,tcje);
					ps2.executeUpdate();
					ps2.close();
				}
				rs1.close();
				ps1.close();
				//ǩ�������ϸ������������������������������
			}
			else if (xzzwbm.equals("�����ܾ���"))
			{
				//ǩ�������ϸ����������������������������ʼ
				//ǩ��
				double xjqdqye=0;
				double xjqdyjjz=0;
				ls_sql=" SELECT sum(crm_khxx.qye),sum(crm_khqye.yjjz)";
				ls_sql+=" from crm_khxx,crm_khqye";
				ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
				ls_sql+=" and crm_khxx.zt in('2','3')";
					ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"')";
				ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					xjqdqye=rs1.getDouble(1);
					xjqdyjjz=rs1.getDouble(2);
				}
				rs1.close();
				ps1.close();

				//�˵�
				double xjtdqye=0;
				double xjtdyjjz=0;
				ls_sql=" SELECT sum(crm_khxx.qye),sum(crm_khqye.yjjz)";
				ls_sql+=" from crm_khxx,crm_khqye";
				ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
				ls_sql+=" and crm_khxx.zt='3'";//3���˵��ͻ�
					ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"')";
				ls_sql+=" and yjjzsj is not null ";//�״θ���װ��ʱ��
				ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					xjtdqye=rs1.getDouble(1);
					xjtdyjjz=rs1.getDouble(2);
				}
				rs1.close();
				ps1.close();


				//ҵ���ܶ�
				double xjqye=0;
				double xjyjjz=0;
				xjqye=cf.round(xjqdqye-xjtdqye,2);
				xjyjjz=cf.round(xjqdyjjz-xjtdyjjz,2);


				//ǩ����ϸ
				String khbh=null;
				String ywy=null;
				double qye=0;
				double yjjz=0;
				ls_sql=" SELECT crm_khxx.khbh,crm_khxx.ywy,crm_khxx.qye,crm_khqye.yjjz";
				ls_sql+=" from crm_khxx,crm_khqye";
				ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
				ls_sql+=" and crm_khxx.zt in('2','3')";
				ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"')";

				ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

				ls_sql+=" and crm_khxx.sjsjsbz='0'";//0��δ��ɣ�1��ǩ����ɣ�2��������
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				while (rs1.next())
				{
					khbh=rs1.getString("khbh");
					ywy=cf.fillNull(rs1.getString("ywy"));
					qye=rs1.getDouble("qye");
					yjjz=rs1.getDouble("yjjz");


					double tcjs=0;
					if (tcjssz.equals("1"))//1��ǩԼ�2��ҵ����ֵ
					{
						tcjs=qye;
					}
					else
					{
						tcjs=yjjz;
					}


					double tcbl=0;
					if (tcjssz.equals("1"))//1��ǩԼ�2��ҵ����ֵ
					{
						ls_sql=" SELECT tcbfb";
						ls_sql+=" FROM rs_qfztcbl";
						ls_sql+=" where fgsbh='"+ssfgs+"'";
						ls_sql+=" and qd<="+xjqye;
						ls_sql+=" and zd>"+xjqye;
					}
					else{
						ls_sql=" SELECT tcbfb";
						ls_sql+=" FROM rs_qfztcbl";
						ls_sql+=" where fgsbh='"+ssfgs+"'";
						ls_sql+=" and qd<="+xjyjjz;
						ls_sql+=" and zd>"+xjyjjz;
					}
					ps2= conn.prepareStatement(ls_sql);
					rs2 =ps2.executeQuery();
					if (rs2.next())
					{
						tcbl=rs2.getDouble("tcbfb");
					}
					rs2.close();
					ps2.close();

					double tcje=cf.round(tcjs*tcbl/100,2);
					
					ls_sql =" insert into rs_qdtcmx (khzq,ssfgs,ygbh,bianhao,yhmc,xzzwbm,zwbm,dwbh,khbh,qye,zcje,tcjs,tcbl,qdtcbl,ywykd,zckhtcbl,tcje,bz)";
					ls_sql+=" values(                ?   ,?    ,?   ,?      ,?   ,?     ,?   ,?   ,?   ,?  ,?   ,?   ,?   ,?     ,?    ,?       ,?   ,'') ";
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,khzq);
					ps2.setString(2,ssfgs);
					ps2.setString(3,ygbh);
					ps2.setString(4,bianhao);
					ps2.setString(5,getyhmc);
					ps2.setString(6,xzzwbm);
					ps2.setString(7,zwbm);
					ps2.setString(8,getdwbh);

					ps2.setString(9,khbh);
					ps2.setDouble(10,qye);
					ps2.setDouble(11,0);
					ps2.setDouble(12,tcjs);
					ps2.setDouble(13,tcbl);
					ps2.setDouble(14,0);
					ps2.setDouble(15,0);
					ps2.setDouble(16,0);
					ps2.setDouble(17,tcje);
					ps2.executeUpdate();
					ps2.close();
				}
				rs1.close();
				ps1.close();
				//ǩ�������ϸ������������������������������
			}
			else if (xzzwbm.equals("�г�������"))
			{
				//ǩ�������ϸ����������������������������ʼ
				//ǩ��
				double xjqdqye=0;
				double xjqdyjjz=0;
				ls_sql=" SELECT sum(crm_khxx.qye),sum(crm_khqye.yjjz)";
				ls_sql+=" from crm_khxx,crm_khqye";
				ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
				ls_sql+=" and crm_khxx.zt in('2','3')";
				ls_sql+=" and crm_khxx.ywybm='"+getdwbh+"'";
				ls_sql+=" and crm_khxx.ywy is not null";
				ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					xjqdqye=rs1.getDouble(1);
					xjqdyjjz=rs1.getDouble(2);
				}
				rs1.close();
				ps1.close();

				//�˵�
				double xjtdqye=0;
				double xjtdyjjz=0;
				ls_sql=" SELECT sum(crm_khxx.qye),sum(crm_khqye.yjjz)";
				ls_sql+=" from crm_khxx,crm_khqye";
				ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
				ls_sql+=" and crm_khxx.zt='3'";//3���˵��ͻ�
				ls_sql+=" and crm_khxx.ywybm='"+getdwbh+"'";
				ls_sql+=" and crm_khxx.ywy is not null";
				ls_sql+=" and yjjzsj is not null ";//�״θ���װ��ʱ��
				ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					xjtdqye=rs1.getDouble(1);
					xjtdyjjz=rs1.getDouble(2);
				}
				rs1.close();
				ps1.close();


				//ҵ���ܶ�
				double xjqye=0;
				double xjyjjz=0;
				xjqye=cf.round(xjqdqye-xjtdqye,2);
				xjyjjz=cf.round(xjqdyjjz-xjtdyjjz,2);



				//ǩ����ϸ
				String khbh=null;
				String ywy=null;
				double qye=0;
				double yjjz=0;

				ls_sql=" SELECT crm_khxx.khbh,crm_khxx.ywy,crm_khxx.qye,crm_khqye.yjjz";
				ls_sql+=" from crm_khxx,crm_khqye";
				ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
				ls_sql+=" and crm_khxx.zt in('2','3')";
				ls_sql+=" and crm_khxx.ywybm='"+getdwbh+"'";
				ls_sql+=" and crm_khxx.ywy is not null";

				ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				while (rs1.next())
				{
					khbh=rs1.getString("khbh");
					ywy=cf.fillNull(rs1.getString("ywy"));
					qye=rs1.getDouble("qye");
					yjjz=rs1.getDouble("yjjz");



					double tcjs=0;
					if (tcjssz.equals("1"))//1��ǩԼ�2��ҵ����ֵ
					{
						tcjs=qye;
					}
					else
					{
						tcjs=yjjz;
					}


					double tcbl=0;
					if (tcjssz.equals("1"))//1��ǩԼ�2��ҵ����ֵ
					{
						ls_sql=" SELECT tcbfb";
						ls_sql+=" FROM rs_scbjltcbl";
						ls_sql+=" where fgsbh='"+ssfgs+"'";
						ls_sql+=" and qd<="+xjqye;
						ls_sql+=" and zd>"+xjqye;
					}
					else{
						ls_sql=" SELECT tcbfb";
						ls_sql+=" FROM rs_scbjltcbl";
						ls_sql+=" where fgsbh='"+ssfgs+"'";
						ls_sql+=" and qd<="+xjyjjz;
						ls_sql+=" and zd>"+xjyjjz;
					}
					ps2= conn.prepareStatement(ls_sql);
					rs2 =ps2.executeQuery();
					if (rs2.next())
					{
						tcbl=rs2.getDouble("tcbfb");
					}
					rs2.close();
					ps2.close();

					double tcje=cf.round(tcjs*tcbl/100,2);
					
					ls_sql =" insert into rs_qdtcmx (khzq,ssfgs,ygbh,bianhao,yhmc,xzzwbm,zwbm,dwbh,khbh,qye,zcje,tcjs,tcbl,qdtcbl,ywykd,zckhtcbl,tcje,bz)";
					ls_sql+=" values(                ?   ,?    ,?   ,?      ,?   ,?     ,?   ,?   ,?   ,?  ,?   ,?   ,?   ,?     ,?    ,?       ,?   ,'') ";
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,khzq);
					ps2.setString(2,ssfgs);
					ps2.setString(3,ygbh);
					ps2.setString(4,bianhao);
					ps2.setString(5,getyhmc);
					ps2.setString(6,xzzwbm);
					ps2.setString(7,zwbm);
					ps2.setString(8,getdwbh);

					ps2.setString(9,khbh);
					ps2.setDouble(10,qye);
					ps2.setDouble(11,0);
					ps2.setDouble(12,tcjs);
					ps2.setDouble(13,tcbl);
					ps2.setDouble(14,0);
					ps2.setDouble(15,0);
					ps2.setDouble(16,0);
					ps2.setDouble(17,tcje);
					ps2.executeUpdate();
					ps2.close();
				}
				rs1.close();
				ps1.close();
				//ǩ�������ϸ������������������������������
			}
			else if (xzzwbm.equals("�绰Ӫ��������"))
			{
				//ǩ�������ϸ����������������������������ʼ
				//ǩ��
				double xjqdqye=0;
				double xjqdyjjz=0;
				ls_sql=" SELECT sum(crm_khxx.qye),sum(crm_khqye.yjjz)";
				ls_sql+=" from crm_khxx,crm_khqye";
				ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
				ls_sql+=" and crm_khxx.zt in('2','3')";
				ls_sql+=" and crm_khxx.ywybm='"+getdwbh+"'";
				ls_sql+=" and crm_khxx.ywy is not null";
				ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					xjqdqye=rs1.getDouble(1);
					xjqdyjjz=rs1.getDouble(2);
				}
				rs1.close();
				ps1.close();

				//�˵�
				double xjtdqye=0;
				double xjtdyjjz=0;
				ls_sql=" SELECT sum(crm_khxx.qye),sum(crm_khqye.yjjz)";
				ls_sql+=" from crm_khxx,crm_khqye";
				ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
				ls_sql+=" and crm_khxx.zt='3'";//3���˵��ͻ�
				ls_sql+=" and crm_khxx.ywybm='"+getdwbh+"'";
				ls_sql+=" and crm_khxx.ywy is not null";
				ls_sql+=" and yjjzsj is not null ";//�״θ���װ��ʱ��
				ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					xjtdqye=rs1.getDouble(1);
					xjtdyjjz=rs1.getDouble(2);
				}
				rs1.close();
				ps1.close();


				//ҵ���ܶ�
				double xjqye=0;
				double xjyjjz=0;
				xjqye=cf.round(xjqdqye-xjtdqye,2);
				xjyjjz=cf.round(xjqdyjjz-xjtdyjjz,2);

				//ǩ����ϸ
				String khbh=null;
				String ywy=null;
				double qye=0;
				double yjjz=0;
				ls_sql=" SELECT crm_khxx.khbh,crm_khxx.ywy,crm_khxx.qye,crm_khqye.yjjz";
				ls_sql+=" from crm_khxx,crm_khqye";
				ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
				ls_sql+=" and crm_khxx.zt in('2','3')";
				ls_sql+=" and crm_khxx.ywybm='"+getdwbh+"'";
				ls_sql+=" and crm_khxx.ywy is not null";

				ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

				ls_sql+=" and crm_khxx.sjsjsbz='0'";//0��δ��ɣ�1��ǩ����ɣ�2��������
				ls_sql+=" and crm_khxx.ywy is not null";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				while (rs1.next())
				{
					khbh=rs1.getString("khbh");
					ywy=cf.fillNull(rs1.getString("ywy"));
					qye=rs1.getDouble("qye");
					yjjz=rs1.getDouble("yjjz");


					double tcjs=0;
					if (tcjssz.equals("1"))//1��ǩԼ�2��ҵ����ֵ
					{
						tcjs=qye;
					}
					else
					{
						tcjs=yjjz;
					}


					double tcbl=0;
					if (tcjssz.equals("1"))//1��ǩԼ�2��ҵ����ֵ
					{
						ls_sql=" SELECT tcbfb";
						ls_sql+=" FROM rs_dhyxjltcbl";
						ls_sql+=" where fgsbh='"+ssfgs+"'";
						ls_sql+=" and qd<="+xjqye;
						ls_sql+=" and zd>"+xjqye;
					}
					else{
						ls_sql=" SELECT tcbfb";
						ls_sql+=" FROM rs_dhyxjltcbl";
						ls_sql+=" where fgsbh='"+ssfgs+"'";
						ls_sql+=" and qd<="+xjyjjz;
						ls_sql+=" and zd>"+xjyjjz;
					}
					ps2= conn.prepareStatement(ls_sql);
					rs2 =ps2.executeQuery();
					if (rs2.next())
					{
						tcbl=rs2.getDouble("tcbfb");
					}
					rs2.close();
					ps2.close();

					double tcje=cf.round(tcjs*tcbl/100,2);
					
					ls_sql =" insert into rs_qdtcmx (khzq,ssfgs,ygbh,bianhao,yhmc,xzzwbm,zwbm,dwbh,khbh,qye,zcje,tcjs,tcbl,qdtcbl,ywykd,zckhtcbl,tcje,bz)";
					ls_sql+=" values(                ?   ,?    ,?   ,?      ,?   ,?     ,?   ,?   ,?   ,?  ,?   ,?   ,?   ,?     ,?    ,?       ,?   ,'') ";
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,khzq);
					ps2.setString(2,ssfgs);
					ps2.setString(3,ygbh);
					ps2.setString(4,bianhao);
					ps2.setString(5,getyhmc);
					ps2.setString(6,xzzwbm);
					ps2.setString(7,zwbm);
					ps2.setString(8,getdwbh);

					ps2.setString(9,khbh);
					ps2.setDouble(10,qye);
					ps2.setDouble(11,0);
					ps2.setDouble(12,tcjs);
					ps2.setDouble(13,tcbl);
					ps2.setDouble(14,0);
					ps2.setDouble(15,0);
					ps2.setDouble(16,0);
					ps2.setDouble(17,tcje);
					ps2.executeUpdate();
					ps2.close();
				}
				rs1.close();
				ps1.close();
				//ǩ�������ϸ������������������������������
			}
			else if (xzzwbm.equals("����������"))
			{
				//ǩ�������ϸ����������������������������ʼ
				//ǩ��
				double xjqdqye=0;
				double xjqdyjjz=0;
				ls_sql=" SELECT sum(crm_khxx.qye),sum(crm_khqye.yjjz)";
				ls_sql+=" from crm_khxx,crm_khqye";
				ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
				ls_sql+=" and crm_khxx.zt in('2','3')";
				ls_sql+=" and crm_khxx.ywybm='"+getdwbh+"'";
				ls_sql+=" and crm_khxx.ywy is not null";
				ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					xjqdqye=rs1.getDouble(1);
					xjqdyjjz=rs1.getDouble(2);
				}
				rs1.close();
				ps1.close();

				//�˵�
				double xjtdqye=0;
				double xjtdyjjz=0;
				ls_sql=" SELECT sum(crm_khxx.qye),sum(crm_khqye.yjjz)";
				ls_sql+=" from crm_khxx,crm_khqye";
				ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
				ls_sql+=" and crm_khxx.zt='3'";//3���˵��ͻ�
				ls_sql+=" and crm_khxx.ywybm='"+getdwbh+"'";
				ls_sql+=" and crm_khxx.ywy is not null";
				ls_sql+=" and yjjzsj is not null ";//�״θ���װ��ʱ��
				ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					xjtdqye=rs1.getDouble(1);
					xjtdyjjz=rs1.getDouble(2);
				}
				rs1.close();
				ps1.close();


				//ҵ���ܶ�
				double xjqye=0;
				double xjyjjz=0;
				xjqye=cf.round(xjqdqye-xjtdqye,2);
				xjyjjz=cf.round(xjqdyjjz-xjtdyjjz,2);

				//ǩ����ϸ
				String khbh=null;
				String ywy=null;
				double qye=0;
				double yjjz=0;
				ls_sql=" SELECT crm_khxx.khbh,crm_khxx.ywy,crm_khxx.qye,crm_khqye.yjjz";
				ls_sql+=" from crm_khxx,crm_khqye";
				ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
				ls_sql+=" and crm_khxx.zt in('2','3')";
				ls_sql+=" and crm_khxx.ywybm='"+getdwbh+"'";
				ls_sql+=" and crm_khxx.ywy is not null";

				ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

				ls_sql+=" and crm_khxx.sjsjsbz='0'";//0��δ��ɣ�1��ǩ����ɣ�2��������
				ls_sql+=" and crm_khxx.ywy is not null";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				while (rs1.next())
				{
					khbh=rs1.getString("khbh");
					ywy=cf.fillNull(rs1.getString("ywy"));
					qye=rs1.getDouble("qye");
					yjjz=rs1.getDouble("yjjz");


					double tcjs=0;
					if (tcjssz.equals("1"))//1��ǩԼ�2��ҵ����ֵ
					{
						tcjs=qye;
					}
					else
					{
						tcjs=yjjz;
					}


					double tcbl=0;
					if (tcjssz.equals("1"))//1��ǩԼ�2��ҵ����ֵ
					{
						ls_sql=" SELECT tcbfb";
						ls_sql+=" FROM rs_wlyxjltcbl";
						ls_sql+=" where fgsbh='"+ssfgs+"'";
						ls_sql+=" and qd<="+xjqye;
						ls_sql+=" and zd>"+xjqye;
					}
					else{
						ls_sql=" SELECT tcbfb";
						ls_sql+=" FROM rs_wlyxjltcbl";
						ls_sql+=" where fgsbh='"+ssfgs+"'";
						ls_sql+=" and qd<="+xjyjjz;
						ls_sql+=" and zd>"+xjyjjz;
					}
					ps2= conn.prepareStatement(ls_sql);
					rs2 =ps2.executeQuery();
					if (rs2.next())
					{
						tcbl=rs2.getDouble("tcbfb");
					}
					rs2.close();
					ps2.close();

					double tcje=cf.round(tcjs*tcbl/100,2);
					
					ls_sql =" insert into rs_qdtcmx (khzq,ssfgs,ygbh,bianhao,yhmc,xzzwbm,zwbm,dwbh,khbh,qye,zcje,tcjs,tcbl,qdtcbl,ywykd,zckhtcbl,tcje,bz)";
					ls_sql+=" values(                ?   ,?    ,?   ,?      ,?   ,?     ,?   ,?   ,?   ,?  ,?   ,?   ,?   ,?     ,?    ,?       ,?   ,'') ";
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,khzq);
					ps2.setString(2,ssfgs);
					ps2.setString(3,ygbh);
					ps2.setString(4,bianhao);
					ps2.setString(5,getyhmc);
					ps2.setString(6,xzzwbm);
					ps2.setString(7,zwbm);
					ps2.setString(8,getdwbh);

					ps2.setString(9,khbh);
					ps2.setDouble(10,qye);
					ps2.setDouble(11,0);
					ps2.setDouble(12,tcjs);
					ps2.setDouble(13,tcbl);
					ps2.setDouble(14,0);
					ps2.setDouble(15,0);
					ps2.setDouble(16,0);
					ps2.setDouble(17,tcje);
					ps2.executeUpdate();
					ps2.close();
				}
				rs1.close();
				ps1.close();
				//ǩ�������ϸ������������������������������
			}
			else if (xzzwbm.equals("����"))
			{
				//���������ϸ����������������������������ʼ
		
				//������ϸ
				String khbh=null;
				double qye=0;
				double zjxje=0;
				double zxyjjz=0;
				if (jstcsj.equals("1"))//1��ʩ���ӽ���ʱ�䣻2���ͻ�����ʱ��
				{
					ls_sql=" SELECT crm_khxx.khbh,crm_khxx.qye,crm_khxx.zhljzjx,crm_khqye.zxyjjz";
					ls_sql+=" from crm_khxx,crm_khqye,cw_sgdwgjs";
					ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
					ls_sql+=" and crm_khxx.zt in('2')";
					ls_sql+=" and crm_khxx.fgsbh='"+ssfgs+"'";//�״θ���װ��ʱ��
					ls_sql+=" and crm_khxx.zjxm='"+getyhmc+"'";

					ls_sql+=" and crm_khxx.gdjsjlh=cw_sgdwgjs.jsjlh(+)";
					ls_sql+=" and crm_khxx.gdjsjd in('Y','Z')";//Y���깤���㣻Z���깤���������
					ls_sql+=" and cw_sgdwgjs.jsrq>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
					ls_sql+=" and cw_sgdwgjs.jsrq<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				}
				else{
					ls_sql=" SELECT crm_khxx.khbh,crm_khxx.qye,crm_khxx.zhljzjx,crm_khqye.zxyjjz";
					ls_sql+=" from crm_khxx,crm_khqye";
					ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
					ls_sql+=" and crm_khxx.zt in('2')";
					ls_sql+=" and crm_khxx.fgsbh='"+ssfgs+"'";//�״θ���װ��ʱ��
					ls_sql+=" and crm_khxx.zjxm='"+getyhmc+"'";

					ls_sql+=" and crm_khxx.khjsbz='Y'";//N��δ���㣻Y���ѽ��㣻2������ͬ�⣻3��������ͬ��
					ls_sql+=" and crm_khxx.khjssj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
					ls_sql+=" and crm_khxx.khjssj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

				}
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				while (rs1.next())
				{
					khbh=rs1.getString("khbh");
					qye=rs1.getDouble("qye");
					zjxje=rs1.getDouble("zjxje");
					zxyjjz=rs1.getDouble("zxyjjz");

					double tcjs=0;
					if (tcjssz.equals("1"))//1��ǩԼ�2��ҵ����ֵ
					{
						tcjs=qye+zjxje;
					}
					else
					{
						tcjs=zxyjjz;
					}

					double tcbl=jltcbl;

			
					double tcje=cf.round(tcjs*tcbl/100,2);
					
					ls_sql =" insert into rs_jstcmx (khzq,ssfgs,ygbh,bianhao,yhmc,xzzwbm,zwbm,dwbh,khbh,qye,zjxje,zcje,tcjs,tcbl,qdtcbl,ywykd,zckhtcbl,sctcbl,sctcje,tcje,bz)";
					ls_sql+=" values(                ?   ,?    ,?   ,?      ,?   ,?     ,?   ,?   ,?   ,?  ,?    ,?   ,?   ,?   ,?     ,?    ,?       ,?     ,?     ,?   ,'') ";
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,khzq);
					ps2.setString(2,ssfgs);
					ps2.setString(3,ygbh);
					ps2.setString(4,bianhao);
					ps2.setString(5,getyhmc);
					ps2.setString(6,xzzwbm);
					ps2.setString(7,zwbm);
					ps2.setString(8,getdwbh);

					ps2.setString(9,khbh);
					ps2.setDouble(10,qye);
					ps2.setDouble(11,zjxje);
					ps2.setDouble(12,0);
					ps2.setDouble(13,tcjs);
					ps2.setDouble(14,tcbl);
					ps2.setDouble(15,0);
					ps2.setDouble(16,0);
					ps2.setDouble(17,0);
					ps2.setDouble(18,0);
					ps2.setDouble(19,0);
					ps2.setDouble(20,tcje);
					ps2.executeUpdate();
					ps2.close();
				}
				rs1.close();
				ps1.close();
				//���������ϸ������������������������������
			}
			else if (xzzwbm.equals("���̲�����"))
			{
				//���������ϸ����������������������������ʼ
				//ǩ��
				double xjqdqye=0;
				double xjzhljzjx=0;
				double xjqdyjjz=0;
				if (jstcsj.equals("1"))//1��ʩ���ӽ���ʱ�䣻2���ͻ�����ʱ��
				{
					ls_sql=" SELECT sum(crm_khxx.qye),sum(crm_khxx.zhljzjx),sum(crm_khqye.yjjz)";
					ls_sql+=" from crm_khxx,crm_khqye,cw_sgdwgjs";
					ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
					ls_sql+=" and crm_khxx.zt in('2')";
					ls_sql+=" and crm_khxx.fgsbh='"+ssfgs+"'";//�״θ���װ��ʱ��
					ls_sql+=" and crm_khxx.zjxm in(select yhmc from sq_yhxx where dwbh='"+getdwbh+"' and zwbm='05')";

					ls_sql+=" and crm_khxx.gdjsjlh=cw_sgdwgjs.jsjlh(+)";
					ls_sql+=" and crm_khxx.gdjsjd in('Y','Z')";//Y���깤���㣻Z���깤���������
					ls_sql+=" and cw_sgdwgjs.jsrq>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
					ls_sql+=" and cw_sgdwgjs.jsrq<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

				}
				else{
					ls_sql=" SELECT sum(crm_khxx.qye),sum(crm_khxx.zhljzjx),sum(crm_khqye.yjjz)";
					ls_sql+=" from crm_khxx,crm_khqye";
					ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
					ls_sql+=" and crm_khxx.zt in('2')";
					ls_sql+=" and crm_khxx.fgsbh='"+ssfgs+"'";//�״θ���װ��ʱ��
					ls_sql+=" and crm_khxx.zjxm in(select yhmc from sq_yhxx where dwbh='"+getdwbh+"' and zwbm='05')";

					ls_sql+=" and crm_khxx.khjsbz='Y'";//N��δ���㣻Y���ѽ��㣻2������ͬ�⣻3��������ͬ��
					ls_sql+=" and crm_khxx.khjssj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
					ls_sql+=" and crm_khxx.khjssj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

				}
				
				
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					xjqdqye=rs1.getDouble(1);
					xjzhljzjx=rs1.getDouble(2);
					xjqdyjjz=rs1.getDouble(3);
				}
				rs1.close();
				ps1.close();


				//ҵ���ܶ�
				double xjqye=xjqdqye+xjzhljzjx;
				double xjyjjz=xjqdyjjz;

		
				//������ϸ
				String khbh=null;
				double qye=0;
				double zjxje=0;
				double zxyjjz=0;
				if (jstcsj.equals("1"))//1��ʩ���ӽ���ʱ�䣻2���ͻ�����ʱ��
				{
					ls_sql=" SELECT crm_khxx.khbh,crm_khxx.qye,crm_khxx.zhljzjx,crm_khqye.zxyjjz";
					ls_sql+=" from crm_khxx,crm_khqye,cw_sgdwgjs";
					ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
					ls_sql+=" and crm_khxx.zt in('2')";
					ls_sql+=" and crm_khxx.fgsbh='"+ssfgs+"'";//�״θ���װ��ʱ��
					ls_sql+=" and crm_khxx.zjxm in(select yhmc from sq_yhxx where dwbh='"+getdwbh+"' and zwbm='05')";

					ls_sql+=" and crm_khxx.gdjsjlh=cw_sgdwgjs.jsjlh(+)";
					ls_sql+=" and crm_khxx.gdjsjd in('Y','Z')";//Y���깤���㣻Z���깤���������
					ls_sql+=" and cw_sgdwgjs.jsrq>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
					ls_sql+=" and cw_sgdwgjs.jsrq<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

				}
				else{
					ls_sql=" SELECT crm_khxx.khbh,crm_khxx.qye,crm_khxx.zhljzjx,crm_khqye.zxyjjz";
					ls_sql+=" from crm_khxx,crm_khqye";
					ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
					ls_sql+=" and crm_khxx.zt in('2')";
					ls_sql+=" and crm_khxx.fgsbh='"+ssfgs+"'";//�״θ���װ��ʱ��
					ls_sql+=" and crm_khxx.zjxm in(select yhmc from sq_yhxx where dwbh='"+getdwbh+"' and zwbm='05')";

					ls_sql+=" and crm_khxx.khjsbz='Y'";//N��δ���㣻Y���ѽ��㣻2������ͬ�⣻3��������ͬ��
					ls_sql+=" and crm_khxx.khjssj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
					ls_sql+=" and crm_khxx.khjssj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

				}
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				while (rs1.next())
				{
					khbh=rs1.getString("khbh");
					qye=rs1.getDouble("qye");
					zjxje=rs1.getDouble("zjxje");
					zxyjjz=rs1.getDouble("zxyjjz");

					double tcjs=0;
					if (tcjssz.equals("1"))//1��ǩԼ�2��ҵ����ֵ
					{
						tcjs=qye+zjxje;
					}
					else
					{
						tcjs=zxyjjz;
					}

					double tcbl=0;
					if (tcjssz.equals("1"))//1��ǩԼ�2��ҵ����ֵ
					{
						ls_sql=" SELECT tcbfb";
						ls_sql+=" FROM rs_gcbjltcbl";
						ls_sql+=" where fgsbh='"+ssfgs+"'";
						ls_sql+=" and qd<="+xjqye;
						ls_sql+=" and zd>"+xjqye;
					}
					else{
						ls_sql=" SELECT tcbfb";
						ls_sql+=" FROM rs_gcbjltcbl";
						ls_sql+=" where fgsbh='"+ssfgs+"'";
						ls_sql+=" and qd<="+xjyjjz;
						ls_sql+=" and zd>"+xjyjjz;
					}
					ps2= conn.prepareStatement(ls_sql);
					rs2 =ps2.executeQuery();
					if (rs2.next())
					{
						tcbl=rs2.getDouble("tcbfb");
					}
					rs2.close();
					ps2.close();

			
					double tcje=cf.round(tcjs*tcbl/100,2);
					
					ls_sql =" insert into rs_jstcmx (khzq,ssfgs,ygbh,bianhao,yhmc,xzzwbm,zwbm,dwbh,khbh,qye,zjxje,zcje,tcjs,tcbl,qdtcbl,ywykd,zckhtcbl,sctcbl,sctcje,tcje,bz)";
					ls_sql+=" values(                ?   ,?    ,?   ,?      ,?   ,?     ,?   ,?   ,?   ,?  ,?    ,?   ,?   ,?   ,?     ,?    ,?       ,?     ,?     ,?   ,'') ";
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,khzq);
					ps2.setString(2,ssfgs);
					ps2.setString(3,ygbh);
					ps2.setString(4,bianhao);
					ps2.setString(5,getyhmc);
					ps2.setString(6,xzzwbm);
					ps2.setString(7,zwbm);
					ps2.setString(8,getdwbh);

					ps2.setString(9,khbh);
					ps2.setDouble(10,qye);
					ps2.setDouble(11,zjxje);
					ps2.setDouble(12,0);
					ps2.setDouble(13,tcjs);
					ps2.setDouble(14,tcbl);
					ps2.setDouble(15,0);
					ps2.setDouble(16,0);
					ps2.setDouble(17,0);
					ps2.setDouble(18,0);
					ps2.setDouble(19,0);
					ps2.setDouble(20,tcje);
					ps2.executeUpdate();
					ps2.close();
				}
				rs1.close();
				ps1.close();
				//���������ϸ������������������������������
			}
			else if (xzzwbm.equals("����Ա"))
			{
			}
			else if (xzzwbm.equals("���ϲ�����"))
			{
			}
			else if (xzzwbm.equals("�������� "))
			{
				//ǩ����ϸ
				String khbh=null;
				String ywy=null;
				double qye=0;
				double yjjz=0;
				ls_sql=" SELECT crm_khxx.khbh,crm_khxx.ywy,crm_khxx.qye,crm_khqye.yjjz";
				ls_sql+=" from crm_khxx,crm_khqye";
				ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh(+)";
				ls_sql+=" and crm_khxx.zt in('2','3')";
				ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"')";

				ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

				ls_sql+=" and crm_khxx.sjsjsbz='0'";//0��δ��ɣ�1��ǩ����ɣ�2��������
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				while (rs1.next())
				{
					khbh=rs1.getString("khbh");
					ywy=cf.fillNull(rs1.getString("ywy"));
					qye=rs1.getDouble("qye");
					yjjz=rs1.getDouble("yjjz");


					double tcjs=0;
					double tcbl=0;

					double tcje=qtmdje;
					
					ls_sql =" insert into rs_qdtcmx (khzq,ssfgs,ygbh,bianhao,yhmc,xzzwbm,zwbm,dwbh,khbh,qye,zcje,tcjs,tcbl,qdtcbl,ywykd,zckhtcbl,tcje,bz)";
					ls_sql+=" values(                ?   ,?    ,?   ,?      ,?   ,?     ,?   ,?   ,?   ,?  ,?   ,?   ,?   ,?     ,?    ,?       ,?   ,'') ";
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,khzq);
					ps2.setString(2,ssfgs);
					ps2.setString(3,ygbh);
					ps2.setString(4,bianhao);
					ps2.setString(5,getyhmc);
					ps2.setString(6,xzzwbm);
					ps2.setString(7,zwbm);
					ps2.setString(8,getdwbh);

					ps2.setString(9,khbh);
					ps2.setDouble(10,qye);
					ps2.setDouble(11,0);
					ps2.setDouble(12,tcjs);
					ps2.setDouble(13,tcbl);
					ps2.setDouble(14,0);
					ps2.setDouble(15,0);
					ps2.setDouble(16,0);
					ps2.setDouble(17,tcje);
					ps2.executeUpdate();
					ps2.close();
				}
				rs1.close();
				ps1.close();
			}
		}

		

		//Ӧ�����
		double qdtcje=0;
		double jstcje=0;
		double tdtcje=0;
		double sjftcje=0;
		double zctcje=0;
		double qtkk=0;

		ls_sql=" SELECT sum(tcje)";
		ls_sql+=" FROM rs_qdtcmx";
		ls_sql+=" where ssfgs='"+ssfgs+"'";
		ls_sql+=" and khzq='"+khzq+"'";
		ls_sql+=" and ygbh='"+ygbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			qdtcje=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		ls_sql=" SELECT sum(tcje)";
		ls_sql+=" FROM rs_jstcmx";
		ls_sql+=" where ssfgs='"+ssfgs+"'";
		ls_sql+=" and khzq='"+khzq+"'";
		ls_sql+=" and ygbh='"+ygbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			jstcje=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		ls_sql=" SELECT sum(tcje)";
		ls_sql+=" FROM rs_tdtcmx";
		ls_sql+=" where ssfgs='"+ssfgs+"'";
		ls_sql+=" and khzq='"+khzq+"'";
		ls_sql+=" and ygbh='"+ygbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tdtcje=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		ls_sql=" SELECT sum(tcje)";
		ls_sql+=" FROM rs_sjftcmx";
		ls_sql+=" where ssfgs='"+ssfgs+"'";
		ls_sql+=" and khzq='"+khzq+"'";
		ls_sql+=" and ygbh='"+ygbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjftcje=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		ls_sql=" SELECT sum(tcje)";
		ls_sql+=" FROM rs_zctcmx";
		ls_sql+=" where ssfgs='"+ssfgs+"'";
		ls_sql+=" and khzq='"+khzq+"'";
		ls_sql+=" and ygbh='"+ygbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zctcje=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		double yftc=cf.round(qdtcje+jstcje+tdtcje+sjftcje+zctcje+qtkk,2);

		double kzbj=0;
		if (zwbm.equals("04"))//04:��װ���ʦ
		{
			//�ʱ����׼
			double zbjfd=0;
			double kzbjbl=0;
			ls_sql=" SELECT zbjfd,kzbjbl";
			ls_sql+=" FROM rs_zbjbz";
			ls_sql+=" where ssfgs='"+ssfgs+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zbjfd=rs1.getDouble("zbjfd");
				kzbjbl=rs1.getDouble("kzbjbl");
			}
			rs1.close();
			ps1.close();

			double zbj=0;
			ls_sql=" SELECT zbj";
			ls_sql+=" FROM sq_yhxx";
			ls_sql+=" where ygbh='"+ygbh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zbj=rs1.getDouble("zbj");
			}
			rs1.close();
			ps1.close();

			//���ʱ���
			if (zbj<zbjfd)
			{
				kzbj=cf.round(yftc*kzbjbl/100,2);

				if (kzbj>zbjfd-zbj)
				{
					kzbj=zbjfd-zbj;
				}
			}

		}

		kzbj=-1*kzbj;

		if (kzbj!=0)
		{
			long xuhao=0;
			ls_sql="select max(NVL(xuhao,0))";
			ls_sql+=" from  rs_ygzbjtzjl";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				xuhao=rs1.getLong(1);
			}
			rs1.close();
			ps1.close();

			xuhao++;

			ls_sql="insert into rs_ygzbjtzjl ( xuhao,ygbh,yhmc,je,lrr,lrsj,bz,jlh,ssfgs,lx ) ";
			ls_sql+=" values ( ?,?,?,?,?,TRUNC(SYSDATE),?,?,?,'3' ) ";
			ps1= conn.prepareStatement(ls_sql);
			ps1.setLong(1,xuhao);
			ps1.setString(2,ygbh);
			ps1.setString(3,getyhmc);
			ps1.setDouble(4,-1*kzbj);
			ps1.setString(5,lrr);
			ps1.setString(6,"���㹤��");
			ps1.setString(7,khzq);
			ps1.setString(8,ssfgs);
			ps1.executeUpdate();
			ps1.close();

			double allje=0;
			ls_sql="select sum(je)";
			ls_sql+=" from  rs_ygzbjtzjl";
			ls_sql+=" where ygbh="+ygbh;
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				allje=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			//Ա���籣��Ϣ
			ls_sql="update sq_yhxx set zbj="+allje;
			ls_sql+=" where ygbh="+ygbh;
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}



		//��˰��˰����
		double gzxx=0;
		double gzsx=0;
		double gsbl=0;//��˰����
		double gdsj=0;//����۳���
		ls_sql=" SELECT gzxx,gzsx,gsbl,gdsj";
		ls_sql+=" FROM rs_ksbl";
		ls_sql+=" where ssfgs='"+ssfgs+"'";
		ls_sql+=" and gzxx<="+yftc;
		ls_sql+=" and gzsx>"+yftc;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			gzxx=rs1.getDouble("gzxx");
			gzsx=rs1.getDouble("gzsx");
			gsbl=rs1.getDouble("gsbl");
			gdsj=rs1.getDouble("gdsj");
		}
		rs1.close();
		ps1.close();
	
		//�۸�˰
		double ksk=cf.round(-1*((yftc-gzxx)*gsbl/100+gdsj),2);
		//ʵ������
		double sftc=cf.round(yftc+kzbj+ksk,2);


		if (qdtcje!=0 || jstcje!=0 || tdtcje!=0 || sjftcje!=0 || zctcje!=0 )
		{
			ls_sql =" insert into rs_tcmxb (khzq,ssfgs,ygbh,bianhao,yhmc,xzzwbm,zwbm,dwbh   ,qdtcje,jstcje,tdtcje,sjftcje,zctcje,qtkk,yftc,kzbj,ksk,sftc,bz)";
			ls_sql+=" values(               ?   ,?    ,?   ,?      ,?   ,?     ,?   ,?      ,?     ,?     ,?     ,?      ,?     ,?   ,?   ,?   ,?  ,?   ,'') ";
			ps1= conn.prepareStatement(ls_sql);
			ps1.setString(1,khzq);
			ps1.setString(2,ssfgs);
			ps1.setString(3,ygbh);
			ps1.setString(4,bianhao);
			ps1.setString(5,getyhmc);
			ps1.setString(6,xzzwbm);
			ps1.setString(7,zwbm);
			ps1.setString(8,getdwbh);

			ps1.setDouble(9,qdtcje);
			ps1.setDouble(10,jstcje);
			ps1.setDouble(11,tdtcje);
			ps1.setDouble(12,sjftcje);
			ps1.setDouble(13,zctcje);
			ps1.setDouble(14,qtkk);
			ps1.setDouble(15,yftc);
			ps1.setDouble(16,kzbj);
			ps1.setDouble(17,ksk);
			ps1.setDouble(18,sftc);
			ps1.executeUpdate();
			ps1.close();
		}
		
	}
	rs.close();
	ps.close();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("������ɣ�");
	window.close();
	//-->
	</SCRIPT>
	<%
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
		if (rs2 != null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

</body>
</html>


