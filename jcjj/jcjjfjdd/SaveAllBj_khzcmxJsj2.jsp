<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");

String[] cbjStr=request.getParameterValues("cbj");

String khbh=request.getParameter("khbh");
String[] xh=request.getParameterValues("xh");

if (xh==null)
{
	return;
}


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

	String fjtcbz="";
	ls_sql="select fjtcbz";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fjtcbz=cf.fillNull(rs.getString("fjtcbz"));
	}
	rs.close();
	ps.close();

	if (fjtcbz.equals("Y"))
	{
		out.println("���������");
		return ;
	}


	conn.setAutoCommit(false);

	for (int i=0;i<xh.length ;i++ )
	{
		double cbj=0;
		cbj=Double.parseDouble(cbjStr[i]);

		ls_sql="update bj_khzcmx set jsfs='1',cbj=? ";
		ls_sql+=" where xh="+xh[i];
		ls_sql+=" and khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,cbj);
		ps.executeUpdate();
		ps.close();
	}

/*
	jcjj.Fjdd fjdd=new jcjj.Fjdd();
	String retStr=fjdd.fj(conn,khbh,yhmc,dwbh);
	if (!retStr.equals(""))
	{
		conn.rollback();
		out.println(retStr);
		return;
	}
*/
	String lrr=yhmc;
	String lrbm=dwbh;
	String retStr="";

		String ssfgs=null;
//		String dwbh=null;
		String sjs=null;
//		String fjtcbz="";
		String sfyckh="";
		String clgw="";
		ls_sql="select ssfgs,zxdm,sjs,fjtcbz,sfyckh,clgw";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			ssfgs=rs.getString("ssfgs");
			dwbh=rs.getString("zxdm");
			sjs=rs.getString("sjs");
			fjtcbz=cf.fillNull(rs.getString("fjtcbz"));
			sfyckh=cf.fillNull(rs.getString("sfyckh"));//�Ƿ�Զ�̿ͻ� 
			clgw=cf.fillNull(rs.getString("clgw"));
		}
		rs.close();
		ps.close();

		if (fjtcbz.equals("Y"))
		{
			conn.rollback();
			out.println("�����ѷֽ�");
			return;
		}



		//��ȡ����С������������������������������ʼ
		int jcddblxs=-100;//���ɶ�������С��  2��2λС����1��1λС����0��������λ��-1������ʮλ��-2��������λ��-3������ǧλ
		int jcddmxblxs=-100;//���ɶ�����ϸ����С��  2��2λС����1��1λС����0��������λ��-1������ʮλ��-2��������λ��-3������ǧλ
		String dxpzcsq=""; 
		ls_sql =" select NVL(jcddblxs,-100),NVL(jcddmxblxs,-100),dxpzcsq";
		ls_sql+=" from sq_dwxx";
		ls_sql+=" where dwbh='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jcddblxs=rs.getInt(1);
			jcddmxblxs=rs.getInt(2);
			dxpzcsq=cf.fillNull(rs.getString("dxpzcsq"));
		}
		rs.close();
		ps.close();

		if (jcddblxs==-100)
		{
			conn.rollback();
			out.println("����û�����á����ɶ�������С��λ����������ϵ����Ա");
			return;
		}

		if (jcddmxblxs==-100)
		{
			conn.rollback();
			out.println("����û�����á����ɶ�����ϸ����С����������ϵ����Ա");
			return;
		}
		//��ȡ����С������������������������������������



		ls_sql="update crm_zxkhxx set fjtcbz='Y'";//M������ֽ⣻N���ȴ��ֽ⣻Y���ֽ����
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();



		//�����ֽ⣫����������������������ʼ

		String zcdlbm=null;
		String ppmc=null;
		String gys=null;

		//1��ԭ��Ŀ��2��������3��ɾ��

		//������δ�ֽ�
		ls_sql="SELECT distinct zcdlbm,ppbm,gys";
		ls_sql+=" FROM bj_khzcmx ";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" order by zcdlbm,ppbm,gys";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			zcdlbm=rs1.getString("zcdlbm");
			ppmc=rs1.getString("ppbm");
			gys=rs1.getString("gys");



			String sfxcl="N";//�Ƿ������
			String gysjsfs="";//��Ӧ�̽��㷽ʽ  1����ͳһ�������㣻2��ͳһ��������
			String jsjhqsj="";//����ۻ�ȡʱ��  1��¼�붩����2������ȷ�ϣ�3�����ͻ�֪ͨ��4������
			double fdbl=0;//����Ʒ���̽������
			double cxfdbl=0;//����Ʒ���̽������
			double azfjsbl=0;//��װ�ѽ������
			double ycfjsbl=0;//Զ�̷ѽ������


			String sfycx=null;//�Ƿ��н׶α���
			String cxkssj=null;//��ʼʱ��
			String cxjzsj=null;//����ʱ��
			double fdblls=0;//����Ʒ���̽������(�׶�)
			double cxfdblls=0;//����Ʒ���̽������(�׶�)
			double azfjsblls=0;//��װ�ѽ������(�׶�)
			double ycfjsblls=0;//Զ�̷ѽ������(�׶�)


			ls_sql="select sfxcl,gysjsfs,jsjhqsj   ,fdbl  ,cxfdbl  ,azfjsbl  ,ycfjsbl ";
			ls_sql+="       ,sfycx,cxkssj,cxjzsj   ,fdblls,cxfdblls,azfjsblls,ycfjsblls";

			ls_sql+=" from jxc_ppgysdzb  ";
			ls_sql+=" where cllx='1' ";//1�����ģ�2�����ģ�3��ͨ��

			ls_sql+=" and ppmc='"+ppmc+"'";
			ls_sql+=" and gysmc='"+gys+"'";
			ls_sql+=" and ssfgs='"+dxpzcsq+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sfxcl=cf.fillNull(rs.getString("sfxcl"));
				gysjsfs=cf.fillNull(rs.getString("gysjsfs"));
				jsjhqsj=cf.fillNull(rs.getString("jsjhqsj"));

				fdbl=rs.getDouble("fdbl");
				cxfdbl=rs.getDouble("cxfdbl");
				azfjsbl = rs.getDouble("azfjsbl");			    
				ycfjsbl = rs.getDouble("ycfjsbl");			    

				sfycx=cf.fillNull(rs.getString("sfycx"));
				cxkssj=cf.fillNull(rs.getDate("cxkssj"));
				cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));

				fdblls=rs.getDouble("fdblls");
				cxfdblls=rs.getDouble("cxfdblls");
				azfjsblls=rs.getDouble("azfjsblls");
				ycfjsblls=rs.getDouble("ycfjsblls");
			}
			rs.close();
			ps.close();

			if (gysjsfs.equals(""))
			{
				gysjsfs="1";//��Ӧ�̽��㷽ʽ  1����ͳһ�������㣻2��ͳһ��������
			}

			if (jsjhqsj.equals(""))
			{
				jsjhqsj="1";//����ۻ�ȡʱ��  1��¼�붩����2������ȷ�ϣ�3�����ͻ�֪ͨ��4������
			}

			if (sfycx==null)
			{
				conn.rollback();
				out.println("������Ʒ�ƹ�Ӧ�̶��ձ�:"+ls_sql);
				return;
			}

			//�Ƿ��н׶α�������ʼʱ��<=���죬and������ʱ��>=���� 
			if (sfycx.equals("Y") && cxkssj.compareTo(cf.today())<=0 &&  cxjzsj.compareTo(cf.today())>=0)
			{
				fdbl=fdblls;
				cxfdbl=cxfdblls;
				azfjsbl=azfjsblls;
				ycfjsbl=ycfjsblls;
			}


			String scsmc=null;
			ls_sql="select scsmc";
			ls_sql+=" from jxc_ppxx  ";
			ls_sql+=" where ppmc='"+ppmc+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				scsmc = rs.getString("scsmc");			    
			}
			rs.close();
			ps.close();


			String xclbz="1";//��Ʒ���� 1���Ƕ���ʽ��Ʒ��2������ʽ��Ʒ
			if (sfxcl.equals("Y"))
			{
				xclbz="2";
			}



			String ddbh=null;
			int count=0;
			ls_sql="select NVL(max(substr(ddbh,8,2)),0)";
			ls_sql+=" from  jc_zcdd";
			ls_sql+=" where khbh='"+khbh+"'  ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			ddbh=khbh+cf.addZero(count+1,2);

			String ddlx=null;
			ddlx="1";//1������Ʒ
			String sfkgsl="Y";//�Ƿ�ɸ�����  Y�����ԣ�N����

			ls_sql="insert into jc_zcdd ( ddbh,khbh,clgw,ztjjgw,xmzy,jjsjs,khjl,ddshbz,kjxsj,htshsj";
			ls_sql+=" ,qhtsj,zcdlbm,zcxlbm,ppbm,gys,ppmc,zczkl,dzyy,xclbz,ddlx ";
			ls_sql+=" ,wdzje,hkze,cbze,htcxhdje,zjxcxhdje,qtycf,sfyyh,yhkssj,yhjzsj,yhnr ";
			ls_sql+=" ,gysjsfs,jsjhqsj,fdbl,khfdbl,tcjrbl,tjpfdbl,tjpkhfdbl,tjptcjrbl,azfjsbl,ycfjsbl ";
			ls_sql+=" ,zjxxh,sfkgsl,fgsbh,qddm,jzsjs,dwbh,lrr,lrsj,bz ";

			ls_sql+=" ,zqclf,zhclf,ycf,qtf,  zqzjxclf,zhzjxclf,zjxycf,zjxqtf,zjxcbze,zqzjhze ";
			ls_sql+=" ,zjhze,sfjs,clzt,sfjrht,jmje,zsje,htyjjrje,zjxzsje,zjxyjjrje,sfck";
			ls_sql+=" ,ycksl,yckje,tbhzt,sskje,shsskje,zcpclf,tjpclf,fjddbz ,sgdje,zjxsgdje) ";
			ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,? ";
			ls_sql+=" ,?,?,?,?,?,?,?,?,?,?  ";
			ls_sql+=" ,?,?,?,?,?,?,?,?,?,?";
			ls_sql+=" ,?,?,?,?,?,?,?,?,?,?  "; 
			ls_sql+=" ,?,?,?,?,?,?,?,SYSDATE,? ";

			ls_sql+=" ,0,0,0,0   ,0,0,0,0,0,0";
			ls_sql+=" ,0,'N','07','N',0,0,0,0,0,'1'  "; //1��δ���⣻2�����ֳ��⣻3���ѳ���
			ls_sql+=" ,0,0,'00',0,0,0,0,'Y',0,0 ) "; //�ֽⶩ����־  N����Y����
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ddbh);
			ps.setString(2,khbh);
			ps.setString(3,clgw);
			ps.setString(4,"");
			ps.setString(5,"");
			ps.setString(6,"");
			ps.setString(7,"");
			ps.setString(8,"");
			ps.setDate(9,null);
			ps.setDate(10,null);

			ps.setDate(11,cf.getDate());
			ps.setString(12,zcdlbm);
			ps.setString(13,"a");
			ps.setString(14,ppmc);
			ps.setString(15,gys);
			ps.setString(16,scsmc);
			ps.setDouble(17,10);
			ps.setString(18,"");
			ps.setString(19,xclbz);
			ps.setString(20,ddlx);

			ps.setDouble(21,0);
			ps.setDouble(22,0);
			ps.setDouble(23,0);
			ps.setDouble(24,0);
			ps.setDouble(25,0);
			ps.setDouble(26,0);
			ps.setString(27,"N");
			ps.setDate(28,null);
			ps.setDate(29,null);
			ps.setString(30,"");

			ps.setString(31,gysjsfs);
			ps.setString(32,jsjhqsj);
			ps.setDouble(33,fdbl);
			ps.setDouble(34,0);
			ps.setDouble(35,100);
			ps.setDouble(36,cxfdbl);
			ps.setDouble(37,0);
			ps.setDouble(38,100);
			ps.setDouble(39,azfjsbl);
			ps.setDouble(40,ycfjsbl);

			ps.setString(41,"");
			ps.setString(42,sfkgsl);
			ps.setString(43,ssfgs);
			ps.setString(44,dwbh);
			ps.setString(45,sjs);
			ps.setString(46,lrbm);
			ps.setString(47,lrr);
			ps.setString(48,"");

			ps.executeUpdate();
			ps.close();




			long sxh=0;
			ls_sql="select NVL(max(xh),0)";
			ls_sql+=" from  jc_zcddmx";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sxh=rs.getLong(1);
			}
			rs.close();
			ps.close();


			String getxh="";
			ls_sql =" select  xh";
			ls_sql+=" from  bj_khzcmx ";
			ls_sql+=" where khbh='"+khbh+"'";
			ls_sql+=" and ppbm='"+ppmc+"' and gys='"+gys+"' and zcdlbm='"+zcdlbm+"'";
			ls_sql+=" order by xh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			while (rs.next())
			{
				getxh=rs.getString("xh");

				sxh++;

				ls_sql ="insert into jc_zcddmx  (xh,ddbh,khbh,zcbm,xsxh,cltxm,zcmc,zcdlbm,zcxlbm,dwbh,gys  ,ppmc,zclbbm,xinghao,gg  ,zcysbm,cz,jldwbm,dzbjjldw,sfbhpj,pjts,lsj,yhj  ,bzcbj,bzcxhdbl,sfycx,cxkssj,cxjzsj,cxj,cxcbj,lscxhdbl  ,xzjg,zqdj,dpzk,dj ,tcyhj,dzbjxsj,czpmtcj  ,jsfs,jsbl,cbj    ,jgfs,sl,zqje,je,ycf,qtfy,azf,jgf,qtfyje    ,zjhsl,zqzjhje,zjhje,zjhycf,zjhqtfy   ,cxhdbz,cxhdbl,cxhdje,zjhcxhdje    ,zcpzwzbm,lx,lrr,lrsj   ,sxbz,sxhtyy,fgsbh,qddm,jzsjs,bz       ,bzjsbl,cxjsbl,sxh,sftjcp,zdxsj,bzyjjrbl,yjjrbl,htyjjrje,zjhyjjrje,sfzp,zsdj,SGDDJ)"; 
				ls_sql+=" select                 ? ,?   ,?   ,zcbm,xsxh,''   ,zcmc,zcdlbm,zcxlbm,ppbm,gys  ,ppmc,zclbbm,xinghao,gg  ,zcysbm,cz,jldwbm,jldwbm  ,'N'    ,0   ,0 ,0    ,cbj  ,0       ,'N'  ,''    ,''    ,0  ,0    ,0         ,xzjg,zqdj,dpzk,dj ,0    ,0      ,0        ,jsfs,jsbl,cbj    ,jgfs,sl,zqje,je,ycf,qtfy,0  ,0  ,qtfyje    ,sl   ,zqje   ,je   ,ycf   ,qtfyje    ,cxhdbz,cxhdbl,cxhdje,cxhdje       ,zcpzwzbm,'1',? ,SYSDATE,sxbz,sxhtyy,?    ,?   ,?    ,bz       ,jsbl  ,0     ,'' ,'N'   ,0    ,0       ,0     ,0       ,0        ,'N' ,0,0";//xzjg 1:�����޼ۣ�2:������
				ls_sql+=" from  bj_khzcmx ";
				ls_sql+=" where xh='"+getxh+"'";
				ps2= conn.prepareStatement(ls_sql);
				ps2.setLong(1,sxh);
				ps2.setString(2,ddbh);
				ps2.setString(3,khbh);
				ps2.setString(4,lrr);
				ps2.setString(5,ssfgs);
				ps2.setString(6,dwbh);
				ps2.setString(7,sjs);
				ps2.executeUpdate();
				ps2.close();


				ls_sql=" update  bj_khzcmx set fjddbh=?,ddmxxh=?";
				ls_sql+=" where xh='"+getxh+"'";
				ps2= conn.prepareStatement(ls_sql);
				ps2.setString(1,ddbh);
				ps2.setLong(2,sxh);
				ps2.executeUpdate();
				ps2.close();
			}
			rs.close();
			ps.close();

			//��ɶ�������������������������������ʼ

			//���ݽ�������������ۣ�����������������������������������ʼ
			ls_sql="update jc_zcddmx set sftjp='N'";//N����Y���ؼ�Ʒ
			ls_sql+=" where  ddbh='"+ddbh+"'";
			ls_sql+=" and sftjp is null";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			
			//����Ʒ:���ý������
			ls_sql="update jc_zcddmx set jsbl="+fdbl;
			ls_sql+=" where  ddbh='"+ddbh+"'";
			ls_sql+=" and jsfs='3'";//1������ۣ�2�����������3��ȡ��Ӧ�̽������
			ls_sql+=" and sftjp='N'";//N����Y���ؼ�Ʒ
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			
			//�ؼ�Ʒ:���ý������
			ls_sql="update jc_zcddmx set jsbl="+cxfdbl;
			ls_sql+=" where  ddbh='"+ddbh+"'";
			ls_sql+=" and jsfs='3'";//1������ۣ�2�����������3��ȡ��Ӧ�̽������
			ls_sql+=" and sftjp='Y'";//N����Y���ؼ�Ʒ
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			

			//���ý����
			ls_sql="update jc_zcddmx set cbj=jsbl/100*dj";
			ls_sql+=" where  ddbh='"+ddbh+"'";
			ls_sql+=" and jsfs in('2','3')";//1������ۣ�2�����������3����Ӧ��ͳһ����
			ls_sql+=" and xzjg not in('4')";//0:��д��Ŀ��1:�����޼ۣ�2:�����ۣ�3: �г���ۣ�4: �ײͼ�
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			
/*

			//��С��λ��������������������������������������ʼ
			ls_sql="update jc_zcddmx set je=ROUND(je,"+jcddmxblxs+"),ycf=ROUND(ycf,"+jcddmxblxs+"),qtfyje=ROUND(qtfyje,"+jcddmxblxs+")";
			ls_sql+=" ,zjhje=ROUND(zjhje,"+jcddmxblxs+"),zjhycf=ROUND(zjhycf,"+jcddmxblxs+"),zjhqtfy=ROUND(zjhqtfy,"+jcddmxblxs+")";
			ls_sql+=" ,cxhdje=ROUND( cxhdje,"+jcddmxblxs+"),zjhcxhdje=ROUND( zjhcxhdje,"+jcddmxblxs+")";
			ls_sql+=" where  ddbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			//��С��λ������������������������������������


			double wdzje=0;
			double hkze=0;
			double cxhdje=0;
			double zqclf=0;
			double zhclf=0;
			double ycf=0;
			double qtf=0;
			double zsje=0;
			double htyjjrje=0;
			ls_sql =" select sum(zqje+ycf+qtfyje),sum(je+ycf+qtfyje),sum(cxhdje),sum(zqje),sum(je),sum(ycf),sum(qtfyje),sum(zsdj*sl),sum(htyjjrje)";
			ls_sql+=" from jc_zcddmx";
			ls_sql+=" where ddbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				wdzje=rs.getDouble(1);
				hkze=rs.getDouble(2);
				cxhdje=rs.getDouble(3);
				zqclf=rs.getDouble(4);
				zhclf=rs.getDouble(5);
				ycf=rs.getDouble(6);
				qtf=rs.getDouble(7);
				zsje=rs.getDouble(8);
				htyjjrje=rs.getDouble(9);
			}
			rs.close();
			ps.close();

			double cbze=0;
			ls_sql =" select sum(cbj*sl) ";
			ls_sql+=" from jc_zcddmx";
			ls_sql+=" where ddbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				cbze=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			
			double zczkl=10;
			if (zqclf==0)
			{
				zczkl=10;
			}
			else{
				zczkl=zhclf*10/zqclf;
			}

			//�������
			String sxhtsfysh="M";//M��������ˣ�Y����д��ͬ����ˣ�N����д��ͬδ��ˣ�S����������ˣ�T������δ���

			ls_sql="update jc_zcdd set clzt='09',zczkl='"+zczkl+"',sxhtsfysh='"+sxhtsfysh+"',cbze="+cbze+",wdzje="+wdzje+",hkze=ROUND("+hkze+","+jcddblxs+")-jmje,htcxhdje=ROUND("+cxhdje+","+jcddblxs+")";
			ls_sql+=" ,zqclf="+zqclf+",zhclf="+zhclf+",ycf=qtycf+"+ycf+",qtf="+qtf+",zsje="+zsje+",htyjjrje="+htyjjrje;
			ls_sql+=" where  ddbh='"+ddbh+"' and clzt='07'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			//���ɶ���
			ls_sql="insert into jc_jcdd (gjz,lx,czlx,ddbh,khbh,fgsbh,qddm,jzsjs,khjl,clgw,ztjjgw,xmzy,jjsjs,zcdlbm,zcxlbm,pdgc,pdgcmc,gys,ppmc,zqje,zhje,cbje,fssj)";
			ls_sql+=" select ddbh,'4','1',ddbh,khbh,fgsbh,qddm,jzsjs,khjl,clgw,ztjjgw,xmzy,'',zcdlbm,zcxlbm,'',ppbm,gys,ppmc,wdzje,hkze,cbze,qhtsj";
			ls_sql+=" from jc_zcdd";
			ls_sql+=" where  ddbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();


			
			//��ɶ�������������������������������ʼ
*/
		}
		rs1.close();
		ps1.close();

/*
		//����ë�����㣫��������������������������ʼ
		double zxmle=0;
		double zxhtjz=0;
		ls_sql="SELECT zxmle,zxhtjz";
		ls_sql+=" FROM crm_khqye";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if(rs.next())
		{
			zxmle=rs.getDouble(1);//����ë����
			zxhtjz=rs.getInt(2);//���º�ͬ��ֵ
		}
		rs.close();
		ps.close();

		double zczxje=0;
		double zczxcb=0;
		ls_sql="SELECT sum(hkze+zjhze),sum(cbze+ycf+qtf+zjxcbze+zjxycf+zjxqtf)";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09����ͬ�����
		ls_sql+=" and jc_zcdd.fjddbz='Y'";//�ֽⶩ����־  N����Y����
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if(rs.next())
		{
			zczxje=rs.getDouble(1);//�������۶�
			zczxcb=rs.getInt(2);//���ĳɱ���
		}
		rs.close();
		ps.close();

		double sfje=0;
		ls_sql="SELECT sum(sfje)";
		ls_sql+=" FROM bj_sfxmmx";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and sfxmlx in('8','4')";//8����˾������˰��
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sfje=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		zczxje=cf.round(zczxje+sfje,2);



		double zczxml=0;//��������ë��
		if (zczxje!=0)
		{
			zczxml=cf.round((zczxje-zczxcb)*100/zczxje,2);
		}

		double khzxml=0;//�ͻ�����ë��
		if ((zczxje+zxhtjz)!=0)
		{
			khzxml=cf.round((zczxje-zczxcb+zxmle)*100/(zczxje+zxhtjz),2);
		}


		ls_sql="update crm_khqye set zchtje=?,zchtcb=?,zczxje=?,zczxcb=?,zchtml=?,zczxml=?,khhtml=?,khzxml=?";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,zczxje);
		ps.setDouble(2,zczxcb);
		ps.setDouble(3,zczxje);
		ps.setDouble(4,zczxcb);
		ps.setDouble(5,zczxml);
		ps.setDouble(6,zczxml);
		ps.setDouble(7,khzxml);
		ps.setDouble(8,khzxml);
		ps.executeUpdate();
		ps.close();
		
		//����ë�����㣽����������������������������
*/
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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