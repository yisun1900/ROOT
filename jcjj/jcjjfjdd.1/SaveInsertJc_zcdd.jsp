<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));

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


	String ssfgs=null;
	String dwbh=null;
	String sjs=null;
	String fjtcbz="";
	String sfyckh="";
	ls_sql="select fgsbh,dwbh,sjs,fjtcbz,sfyckh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=rs.getString("fgsbh");
		dwbh=rs.getString("dwbh");
		sjs=rs.getString("sjs");
		fjtcbz=cf.fillNull(rs.getString("fjtcbz"));
		sfyckh=cf.fillNull(rs.getString("sfyckh"));//�Ƿ�Զ�̿ͻ� 
	}
	rs.close();
	ps.close();


	String clgw="";
	ls_sql="select clgw";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clgw=cf.fillNull(rs.getString("clgw"));
	}
	rs.close();
	ps.close();

	if (fjtcbz.equals("Y"))
	{
		out.println("�����ѷֽⶩ��");
		return;
	}

	//��ȡ����С������������������������������ʼ
	int jcddblxs=-100;//���ɶ�������С��  2��2λС����1��1λС����0��������λ��-1������ʮλ��-2��������λ��-3������ǧλ
	int jcddmxblxs=-100;//���ɶ�����ϸ����С��  2��2λС����1��1λС����0��������λ��-1������ʮλ��-2��������λ��-3������ǧλ
	ls_sql =" select NVL(jcddblxs,-100),NVL(jcddmxblxs,-100)";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jcddblxs=rs.getInt(1);
		jcddmxblxs=rs.getInt(2);
	}
	rs.close();
	ps.close();

	if (jcddblxs==-100)
	{
		out.println("<BR>����û�����á����ɶ�������С��λ����������ϵ����Ա");
		return;
	}

	if (jcddmxblxs==-100)
	{
		out.println("<BR>����û�����á����ɶ�����ϸ����С����������ϵ����Ա");
		return;
	}
	//��ȡ����С������������������������������������


	conn.setAutoCommit(false);

	ls_sql="update crm_khxx set fjtcbz='Y'";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();



	//�ײͶ����ֽ⣫����������������������ʼ
	String ddcljjfs=null;
	String ppmc=null;
	String gysmc=null;
	String ddlx=null;

	ls_sql="SELECT distinct ddcljjfs,ppmc,gysmc";
	ls_sql+=" FROM bj_khzcxm ";
    ls_sql+=" where bj_khzcxm.khbh='"+khbh+"' and bj_khzcxm.sfcscp='N'";
	ls_sql+=" order by ddcljjfs,ppmc,gysmc";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		ddcljjfs=rs1.getString("ddcljjfs");//0���ײ��ڲ��ϣ�1������������2����������շѣ�3���ײ�ѡ��
		ppmc=rs1.getString("ppmc");
		gysmc=rs1.getString("gysmc");

		if (ddcljjfs.equals("0"))
		{
			ddlx="5";//5����׼�ײͣ�6���Ҿ߽����ײͣ�7����ů�����ײͣ�8�������ײͣ�9���������ģ�A:����������B:��������շѡ�C:ѡ������
		}
		else if (ddcljjfs.equals("1"))
		{
			ddlx="A";
		}
		else if (ddcljjfs.equals("2"))
		{
			ddlx="B";
		}
		else if (ddcljjfs.equals("3"))
		{
			ddlx="C";
		}

		double tcycf=0;//�ײ�Զ�̷�
		String sfxcl="N";//�Ƿ������
		String sfkgtcsl="N";//�Ƿ�ɸ�����
		ls_sql =" select tcycf,sfxcl,sfkgtcsl";
		ls_sql+=" from jxc_ppgysdzb";
		ls_sql+=" where ssfgs='"+ssfgs+"' and ppmc='"+ppmc+"' and gysmc='"+gysmc+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tcycf=rs.getDouble("tcycf");
			sfxcl=cf.fillNull(rs.getString("sfxcl"));
			sfkgtcsl=cf.fillNull(rs.getString("sfkgtcsl"));
		}
		rs.close();
		ps.close();
		if (sfkgtcsl.equals(""))
		{
			sfkgtcsl="N";
		}

		double qtycf=0;
		if (sfyckh.equals("Y"))//�Ƿ�Զ�̿ͻ�   Y���ǣ�N����
		{
			double allqtycf=0;
			ls_sql =" select sum(qtycf)";
			ls_sql+=" from  jc_zcdd";
			ls_sql+=" where khbh='"+khbh+"' and gys='"+gysmc+"' and clzt not in('98','99')";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				allqtycf=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			if (allqtycf<=0)
			{
				ls_sql=" update jc_zcdd set ycf=ycf-qtycf,qtycf=0";
				ls_sql+=" where khbh='"+khbh+"' and gys='"+gysmc+"' and clzt in('98','99')";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				qtycf=tcycf;
			}
		}

		String sfkgsl=sfkgtcsl;//�Ƿ�ɸ�����
		String xclbz="1";//��Ʒ���� 1���Ƕ���ʽ��Ʒ��2������ʽ��Ʒ
		if (sfxcl.equals("Y"))
		{
			xclbz="2";
		}


		String cldlmc=null;
		ls_sql="SELECT cldlmc";
		ls_sql+=" FROM bj_khzcxm,jxc_cldlbm ";
		ls_sql+=" where bj_khzcxm.tccpdlbm=jxc_cldlbm.cldlbm and bj_khzcxm.khbh='"+khbh+"' and bj_khzcxm.ppmc='"+ppmc+"' and bj_khzcxm.gysmc='"+gysmc+"'";
		ls_sql+=" and bj_khzcxm.ddcljjfs='"+ddcljjfs+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			cldlmc=rs.getString("cldlmc");
		}
		rs.close();
		ps.close();


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

		ls_sql="insert into jc_zcdd ( ddbh,khbh,clgw,ztjjgw,xmzy,jjsjs,khjl,ddshbz,kjxsj,htshsj";
		ls_sql+=" ,qhtsj,jhtzshsj,zcdlbm,zcxlbm,ppbm,gys,ppmc,zczkl,dzyy,xclbz ";
		ls_sql+=" ,wdzje,hkze,cbze,htcxhdje,zjxcxhdje,sfyyh,yhkssj,yhjzsj,yhnr,fgsbh ";
		ls_sql+=" ,qddm,jzsjs,dwbh,lrr,lrsj,bz,sfkgsl,qtycf ";
		ls_sql+=" ,zqclf,zhclf,ycf,qtf,  zqzjxclf,zhzjxclf,zjxycf,zjxqtf ";
		ls_sql+=" ,zjxcbze,zqzjhze,zjhze,sfjs,clzt,ddlx,sfjrht,jmje )";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?    ,?,?,?,?,?,?,?,?,?,?";
		ls_sql+=" ,?,?,?,?,SYSDATE,?,?,?    ";
		ls_sql+=" ,0,0,0,0   ,0,0,0,0   ,0,0,0,'N','07',?,'N',0) ";
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
		ps.setDate(12,null);
		ps.setString(13,cldlmc);
		ps.setString(14,"a");
		ps.setString(15,ppmc);
		ps.setString(16,gysmc);
		ps.setString(17,ppmc);
		ps.setDouble(18,10);
		ps.setString(19,"");
		ps.setString(20,xclbz);

		ps.setDouble(21,0);
		ps.setDouble(22,0);
		ps.setDouble(23,0);
		ps.setDouble(24,0);
		ps.setDouble(25,0);
		ps.setString(26,"N");
		ps.setDate(27,null);
		ps.setDate(28,null);
		ps.setString(29,"");
		ps.setString(30,ssfgs);

		ps.setString(31,dwbh);
		ps.setString(32,sjs);
		ps.setString(33,lrbm);
		ps.setString(34,yhmc);
		ps.setString(35,"");
		ps.setString(36,sfkgsl);
		ps.setDouble(37,qtycf);
		ps.setString(38,ddlx);

		ps.executeUpdate();
		ps.close();

		long xh=0;
		ls_sql="select NVL(max(xh),0)";
		ls_sql+=" from  jc_zcddmx";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xh=rs.getLong(1);
		}
		rs.close();
		ps.close();
		xh++;


		if (ddcljjfs.equals("2") || ddcljjfs.equals("3"))//0���ײ����ģ�1�������������ģ�2����������շ����ģ�3���ײ�ѡ������
		{
			ls_sql ="insert into jc_zcddmx  (xh,ddbh,khbh,zcbm,zcmc,zcdlbm           ,zcxlbm,dwbh,gys  ,ppmc,zclbbm,xinghao,gg  ,zcysbm,jldwbm,sfbhpj,pjts,lsj,yhj  ,bzcbj,bzcxhdbl,sfycx,cxkssj,cxjzsj,cxj,cxcbj,lscxhdbl  ,xzjg,dj,cbj,sl  ,je      ,ycf,qtfy,qtfyje,zjhsl,zjhje  ,zjhycf,zjhqtfy  ,zcpzwzbm,cxhdbz,cxhdbl,cxhdje,lx,lrr,lrsj   ,sxbz,sxhtyy,fgsbh,qddm,jzsjs,bz       ,bzjsbl,cxjsbl,jsfs,jsbl,zclx,ddcljjfs,sxh,zjhcxhdje,sftjcp,zqdj,dpzk,zqje   ,zqzjhje,bjjbbm)"; 
			ls_sql+=" select           ?+rownum,?   ,?   ,cpbm,cpmc,jxc_cldlbm.cldlmc,clxlmc,ppmc,gysmc,ppmc,''    ,xh     ,gg  ,''    ,xdjldw,'N'    ,0   ,0 ,0    ,jsj  ,0       ,'N'  ,''    ,''    ,0  ,0    ,0         ,'1' ,dj,jsj,xdsl,xdsl*dj ,0  ,0   ,0     ,xdsl ,xdsl*dj,0     ,0        ,jgwzbm  ,'N'   ,0     ,0     ,'1',? ,SYSDATE,'1',''     ,?    ,?   ,?    ,ptcpsm   ,jsbl  ,0     ,jsfs,jsbl,zclx,ddcljjfs,sxh,0        ,'N'   ,dj  ,10  ,xdsl*dj,xdsl*dj,bjjbbm";//xzjg 1:�����޼ۣ�2:������
			ls_sql+=" from  bj_khzcxm,jxc_cldlbm,jxc_clxlbm";
			ls_sql+=" where khbh='"+khbh+"' and ppmc='"+ppmc+"' and gysmc='"+gysmc+"'";
			ls_sql+=" and bj_khzcxm.tccpdlbm=jxc_cldlbm.cldlbm(+) and bj_khzcxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
			ls_sql+=" and bj_khzcxm.ddcljjfs='"+ddcljjfs+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,xh);
			ps.setString(2,ddbh);
			ps.setString(3,khbh);

			ps.setString(4,yhmc);
			ps.setString(5,ssfgs);
			ps.setString(6,dwbh);
			ps.setString(7,sjs);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql ="insert into jc_zcddmx  (xh,ddbh,khbh,zcbm,zcmc,zcdlbm           ,zcxlbm,dwbh,gys  ,ppmc,zclbbm,xinghao,gg  ,zcysbm,jldwbm,sfbhpj,pjts,lsj,yhj  ,bzcbj,bzcxhdbl,sfycx,cxkssj,cxjzsj,cxj,cxcbj,lscxhdbl  ,xzjg,dj,cbj,sl  ,je,ycf,qtfy,qtfyje,zjhsl,zjhje,zjhycf,zjhqtfy  ,zcpzwzbm,cxhdbz,cxhdbl,cxhdje,lx,lrr,lrsj   ,sxbz,sxhtyy,fgsbh,qddm,jzsjs,bz       ,bzjsbl,cxjsbl,jsfs,jsbl,zclx,ddcljjfs,sxh,zjhcxhdje,sftjcp,zqdj,dpzk,zqje,zqzjhje,bjjbbm)"; 
			ls_sql+=" select           ?+rownum,?   ,?   ,cpbm,cpmc,jxc_cldlbm.cldlmc,clxlmc,ppmc,gysmc,ppmc,''    ,xh     ,gg  ,''    ,xdjldw,'N'    ,0   ,0 ,0    ,jsj  ,0       ,'N'  ,''    ,''    ,0  ,0    ,0         ,'1' ,0 ,jsj,xdsl,0 ,0  ,0   ,0     ,xdsl ,0    ,0     ,0        ,jgwzbm  ,'N'   ,0     ,0     ,'1',? ,SYSDATE,'1',''     ,?    ,?   ,?    ,ptcpsm   ,jsbl  ,0     ,jsfs,jsbl,zclx,ddcljjfs,sxh,0        ,'N'   ,0   ,10  ,0   ,0      ,bjjbbm";//xzjg 1:�����޼ۣ�2:������
			ls_sql+=" from  bj_khzcxm,jxc_cldlbm,jxc_clxlbm";
			ls_sql+=" where khbh='"+khbh+"' and ppmc='"+ppmc+"' and gysmc='"+gysmc+"'";
			ls_sql+=" and bj_khzcxm.tccpdlbm=jxc_cldlbm.cldlbm(+) and bj_khzcxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
			ls_sql+=" and bj_khzcxm.ddcljjfs='"+ddcljjfs+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,xh);
			ps.setString(2,ddbh);
			ps.setString(3,khbh);

			ps.setString(4,yhmc);
			ps.setString(5,ssfgs);
			ps.setString(6,dwbh);
			ps.setString(7,sjs);
			ps.executeUpdate();
			ps.close();
		}




		ls_sql=" update  bj_khzcxm set fjddbh=?";
		ls_sql+=" where khbh='"+khbh+"' and ppmc='"+ppmc+"' and gysmc='"+gysmc+"'";
		ls_sql+=" and bj_khzcxm.ddcljjfs='"+ddcljjfs+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ddbh);
		ps.executeUpdate();
		ps.close();

		if (sfkgsl.equals("N") || ddlx.equals("C"))//�Ƿ�ɸ����� Y�����ԣ�N����
		{
			//��С��λ��������������������������������������ʼ
			ls_sql="update jc_zcddmx set je=ROUND(je,"+jcddmxblxs+"),ycf=ROUND(ycf,"+jcddmxblxs+"),qtfyje=ROUND(qtfyje,"+jcddmxblxs+")";
			ls_sql+=" ,zjhje=ROUND(zjhje,"+jcddmxblxs+"),zjhycf=ROUND(zjhycf,"+jcddmxblxs+"),zjhqtfy=ROUND(zjhqtfy,"+jcddmxblxs+")";
			ls_sql+=" ,cxhdje=ROUND( cxhdje,"+jcddmxblxs+"),zjhcxhdje=ROUND( zjhcxhdje,"+jcddmxblxs+"),sxbz='1'";//1������д��2����д
			ls_sql+=" where  ddbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			//��С��λ������������������������������������

			double wdzje=0;
			double hkze=0;
			double cxhdje=0;
			double cbze=0;
			double zqclf=0;
			double zhclf=0;
			double ycf=0;
			double qtf=0;
			ls_sql =" select sum(zqje+ycf+qtfyje),sum(je+ycf+qtfyje),sum(cxhdje),sum(cbj*sl),sum(zqje),sum(je),sum(ycf),sum(qtfyje)";
			ls_sql+=" from jc_zcddmx";
			ls_sql+=" where ddbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				wdzje=rs.getDouble(1);
				hkze=rs.getDouble(2);
				cxhdje=rs.getDouble(3);
				cbze=rs.getDouble(4);
				zqclf=rs.getDouble(5);
				zhclf=rs.getDouble(6);
				ycf=rs.getDouble(7);
				qtf=rs.getDouble(8);
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

			if (ddlx.equals("C"))//C:ѡ������
			{
				ls_sql="update jc_zcdd set clzt='30',zczkl='"+zczkl+"',sxhtsfysh='M',cbze="+cbze+",wdzje="+wdzje+",hkze=ROUND("+hkze+","+jcddblxs+"),htcxhdje=ROUND("+cxhdje+","+jcddblxs+")";
				ls_sql+=" ,zqclf="+zqclf+",zhclf="+zhclf+",ycf=qtycf+"+ycf+",qtf="+qtf;
				ls_sql+=" where  ddbh='"+ddbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
			else{
				ls_sql="update jc_zcdd set clzt='09',zczkl='"+zczkl+"',sxhtsfysh='M',cbze="+cbze+",wdzje="+wdzje+",hkze=ROUND("+hkze+","+jcddblxs+"),htcxhdje=ROUND("+cxhdje+","+jcddblxs+")";
				ls_sql+=" ,zqclf="+zqclf+",zhclf="+zhclf+",ycf=qtycf+"+ycf+",qtf="+qtf;
				ls_sql+=" where  ddbh='"+ddbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}


			//���ɶ���
			ls_sql="insert into jc_jcdd (gjz,lx,czlx,ddbh,khbh,fgsbh,qddm,jzsjs,khjl,clgw,ztjjgw,xmzy,jjsjs,zcdlbm,zcxlbm,pdgc,pdgcmc,gys,ppmc,zqje,zhje,cbje,fssj)";
			ls_sql+=" select ddbh,'4','1',ddbh,khbh,fgsbh,qddm,jzsjs,khjl,clgw,ztjjgw,xmzy,'',zcdlbm,zcxlbm,'',ppbm,gys,ppmc,wdzje,hkze,cbze,qhtsj";
			ls_sql+=" from jc_zcdd";
			ls_sql+=" where  ddbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		
		
	}
	rs1.close();
	ps1.close();
	//�ײͶ����ֽ⣽������������������������


	//�Ҿ��ײͶ����ֽ⣫����������������������ʼ
//	String ppmc=null;
//	String gysmc=null;

	double tcjg=0;
	ls_sql="SELECT tcj";
	ls_sql+=" FROM bj_khxzjjtc ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		tcjg=rs2.getDouble("tcj");


		ls_sql="SELECT distinct ppmc,gysmc";
		ls_sql+=" FROM bj_khxzjj ";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and ppmc is not null";
		ls_sql+=" order by ppmc,gysmc";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			ppmc=rs1.getString("ppmc");
			gysmc=rs1.getString("gysmc");


			double tcycf=0;//�ײ�Զ�̷�
			String sfxcl="N";//�Ƿ������
			String sfkgtcsl="N";//�Ƿ�ɸ�����
			String cldlmc="";
			ls_sql =" select cldl";
			ls_sql+=" from jxc_ppxx";
			ls_sql+=" where ppmc='"+ppmc+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				cldlmc=rs.getString("cldl");
			}
			rs.close();
			ps.close();



			double qtycf=0;

			String sfkgsl=sfkgtcsl;//�Ƿ�ɸ�����
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

			ls_sql="insert into jc_zcdd ( ddbh,khbh,clgw,ztjjgw,xmzy,jjsjs,khjl,ddshbz,kjxsj,htshsj";
			ls_sql+=" ,qhtsj,jhtzshsj,zcdlbm,zcxlbm,ppbm,gys,ppmc,zczkl,dzyy,xclbz ";
			ls_sql+=" ,wdzje,hkze,cbze,htcxhdje,zjxcxhdje,sfyyh,yhkssj,yhjzsj,yhnr,fgsbh ";
			ls_sql+=" ,qddm,jzsjs,dwbh,lrr,lrsj,bz,sfkgsl,qtycf ";
			ls_sql+=" ,zqclf,zhclf,ycf,qtf,  zqzjxclf,zhzjxclf,zjxycf,zjxqtf ";
			ls_sql+=" ,zjxcbze,zqzjhze,zjhze,sfjs,clzt,ddlx,sfjrht,jmje,zctclx,zctcmc,zctcje )";
			ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?    ,?,?,?,?,?,?,?,?,?,?";
			ls_sql+=" ,?,?,?,?,SYSDATE,?,?,?    ";
			ls_sql+=" ,0,0,0,0   ,0,0,0,0   ,0,0,0,'N','07','6','N',0,?,?,?) ";
			//1������Ʒ��2��ϵͳ������Ʒ�ƶ�����3����¼��ͬ��4���п�涩����5���ײͷֽⶩ����6�������ײͷֽⶩ��
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
			ps.setDate(12,null);
			ps.setString(13,cldlmc);
			ps.setString(14,"�Ҿ��ײ�");
			ps.setString(15,ppmc);
			ps.setString(16,gysmc);
			ps.setString(17,ppmc);
			ps.setDouble(18,10);
			ps.setString(19,"");
			ps.setString(20,xclbz);

			ps.setDouble(21,0);
			ps.setDouble(22,0);
			ps.setDouble(23,0);
			ps.setDouble(24,0);
			ps.setDouble(25,0);
			ps.setString(26,"N");
			ps.setDate(27,null);
			ps.setDate(28,null);
			ps.setString(29,"");
			ps.setString(30,ssfgs);

			ps.setString(31,dwbh);
			ps.setString(32,sjs);
			ps.setString(33,lrbm);
			ps.setString(34,yhmc);
			ps.setString(35,"");
			ps.setString(36,sfkgsl);
			ps.setDouble(37,qtycf);
			ps.setString(38,"");
			ps.setString(39,"�Ҿ��ײ�");
			ps.setDouble(40,tcjg);

			ps.executeUpdate();
			ps.close();

			long xh=0;
			ls_sql="select NVL(max(xh),0)";
			ls_sql+=" from  jc_zcddmx";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				xh=rs.getLong(1);
			}
			rs.close();
			ps.close();
			xh++;

			ls_sql ="insert into jc_zcddmx  (xh,ddbh,khbh,zcbm,zcmc,zcdlbm  ,zcxlbm  ,dwbh,gys  ,ppmc,zclbbm,xinghao,gg  ,zcysbm,jldwbm,sfbhpj,pjts,lsj,yhj  ,bzcbj,bzcxhdbl,sfycx,cxkssj,cxjzsj,cxj,cxcbj,lscxhdbl  ,xzjg,dj  ,cbj,sl,je              ,ycf,qtfy,qtfyje,zjhsl,zjhje           ,zjhycf,zjhqtfy  ,zcpzwzbm,cxhdbz,cxhdbl,cxhdje,lx,lrr,lrsj   ,sxbz,sxhtyy,fgsbh,qddm,jzsjs,bz   ,bzjsbl,cxjsbl,jsfs,jsbl,zclx,ddcljjfs,sxh,zjhcxhdje,sftjcp,zqdj,dpzk,zqje            ,zqzjhje         ,zctcbz)"; 
			ls_sql+=" select           ?+rownum,?   ,?   ,cpbm,cpmc,?       ,?       ,ppmc,gysmc,ppmc,''    ,xh     ,gg  ,''    ,jldw  ,'N'    ,0   ,0 ,0    ,jsj  ,0       ,'N'  ,''    ,''    ,0  ,0    ,0         ,'1' ,tcdj,jsj,sl,ROUND(tcdj*sl,2),0  ,0   ,0     ,sl   ,ROUND(tcdj*sl,2),0     ,0        ,jgwzbm  ,'N'   ,0     ,0     ,'1',? ,SYSDATE,'1',''     ,?    ,?   ,?    ,bz   ,0     ,0     ,?   ,0   ,''  ,''      ,'' ,0        ,'N'   ,tcdj,10  ,ROUND(tcdj*sl,2),ROUND(tcdj*sl,2),'Y'";//xzjg 1:�����޼ۣ�2:������
			ls_sql+=" from  bj_khxzjj";
			ls_sql+=" where khbh='"+khbh+"' and ppmc='"+ppmc+"' and gysmc='"+gysmc+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,xh);
			ps.setString(2,ddbh);
			ps.setString(3,khbh);
			ps.setString(4,cldlmc);
			ps.setString(5,"�Ҿ��ײ�");

			ps.setString(6,yhmc);
			ps.setString(7,ssfgs);
			ps.setString(8,dwbh);
			ps.setString(9,sjs);
			ps.setString(10,"1");//1������ۣ�2���������
			ps.executeUpdate();
			ps.close();


			ls_sql=" update  bj_khxzjj set fjddbh=?";
			ls_sql+=" where khbh='"+khbh+"' and ppmc='"+ppmc+"' and gysmc='"+gysmc+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ddbh);
			ps.executeUpdate();
			ps.close();

			if (sfkgsl.equals("N"))//�Ƿ�ɸ����� Y�����ԣ�N����
			{
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
				double cbze=0;
				double zqclf=0;
				double zhclf=0;
				double ycf=0;
				double qtf=0;
				ls_sql =" select sum(zqje+ycf+qtfyje),sum(je+ycf+qtfyje),sum(cxhdje),sum(cbj*sl),sum(zqje),sum(je),sum(ycf),sum(qtfyje)";
				ls_sql+=" from jc_zcddmx";
				ls_sql+=" where ddbh='"+ddbh+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					wdzje=rs.getDouble(1);
					hkze=rs.getDouble(2);
					cxhdje=rs.getDouble(3);
					cbze=rs.getDouble(4);
					zqclf=rs.getDouble(5);
					zhclf=rs.getDouble(6);
					ycf=rs.getDouble(7);
					qtf=rs.getDouble(8);
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

				ls_sql="update jc_zcdd set clzt='09',zczkl='"+zczkl+"',sxhtsfysh='M',cbze="+cbze+",wdzje="+wdzje+",hkze=ROUND("+hkze+","+jcddblxs+"),htcxhdje=ROUND("+cxhdje+","+jcddblxs+")";
				ls_sql+=" ,zqclf="+zqclf+",zhclf="+zhclf+",ycf=qtycf+"+ycf+",qtf="+qtf;
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
			}
			
			
		}
		rs1.close();
		ps1.close();
	}
	rs2.close();
	ps2.close();

	//�Ҿ��ײͶ����ֽ⣽������������������������

	//�����ײͶ����ֽ⣫����������������������ʼ
//	String ppmc=null;
//	String gysmc=null;

	String tcbm=null;
	String tcmc=null;
	tcjg=0;
	String lx=null;
	ls_sql="SELECT tcbm,tcmc,tcj,lx";
	ls_sql+=" FROM bj_khzctcmc ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		tcbm=rs2.getString("tcbm");
		tcmc=rs2.getString("tcmc");
		tcjg=rs2.getDouble("tcj");
		lx=rs2.getString("lx");

		tcjg=0;

		int firstDd=0;//�Ƿ�ͬһ�ײͷֽ�ĵ�һ������
		ls_sql="SELECT distinct ppmc,gysmc";
		ls_sql+=" FROM bj_khzctcmx ";
		ls_sql+=" where khbh='"+khbh+"' and tcbm='"+tcbm+"'";
		ls_sql+=" and ppmc is not null";
		ls_sql+=" order by ppmc,gysmc";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			ppmc=rs1.getString("ppmc");
			gysmc=rs1.getString("gysmc");


			double tcycf=0;//�ײ�Զ�̷�
			String sfxcl="N";//�Ƿ������
			String sfkgtcsl="N";//�Ƿ�ɸ�����
			String cldlmc="";
			ls_sql =" select cldl";
			ls_sql+=" from jxc_ppxx";
			ls_sql+=" where ppmc='"+ppmc+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				cldlmc=rs.getString("cldl");
			}
			rs.close();
			ps.close();


			ls_sql =" select tcycf,sfxcl";
			ls_sql+=" from jxc_ppgysdzb";
			ls_sql+=" where ssfgs='"+ssfgs+"' and ppmc='"+ppmc+"' and gysmc='"+gysmc+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				tcycf=rs.getDouble("tcycf");
				sfxcl=cf.fillNull(rs.getString("sfxcl"));
			}
			rs.close();
			ps.close();


			double qtycf=0;
			if (sfyckh.equals("Y"))//�Ƿ�Զ�̿ͻ�   Y���ǣ�N����
			{
				double allqtycf=0;
				ls_sql =" select sum(qtycf)";
				ls_sql+=" from  jc_zcdd";
				ls_sql+=" where khbh='"+khbh+"' and gys='"+gysmc+"' and clzt not in('98','99')";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					allqtycf=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				if (allqtycf<=0)
				{
					ls_sql=" update jc_zcdd set ycf=ycf-qtycf,qtycf=0";
					ls_sql+=" where khbh='"+khbh+"' and gys='"+gysmc+"' and clzt in('98','99')";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					qtycf=tcycf;
				}
			}

			String sfkgsl=sfkgtcsl;//�Ƿ�ɸ�����
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

			ls_sql="insert into jc_zcdd ( ddbh,khbh,clgw,ztjjgw,xmzy,jjsjs,khjl,ddshbz,kjxsj,htshsj";
			ls_sql+=" ,qhtsj,jhtzshsj,zcdlbm,zcxlbm,ppbm,gys,ppmc,zczkl,dzyy,xclbz ";
			ls_sql+=" ,wdzje,hkze,cbze,htcxhdje,zjxcxhdje,sfyyh,yhkssj,yhjzsj,yhnr,fgsbh ";
			ls_sql+=" ,qddm,jzsjs,dwbh,lrr,lrsj,bz,sfkgsl,qtycf ";
			ls_sql+=" ,zqclf,zhclf,ycf,qtf,  zqzjxclf,zhzjxclf,zjxycf,zjxqtf ";
			ls_sql+=" ,zjxcbze,zqzjhze,zjhze,sfjs,clzt,ddlx,sfjrht,jmje,zctclx,zctcmc,zctcje )";
			ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?    ,?,?,?,?,?,?,?,?,?,?";
			ls_sql+=" ,?,?,?,?,SYSDATE,?,?,?    ";
			ls_sql+=" ,0,0,0,0   ,0,0,0,0   ,0,0,0,'N','07','6','N',0,?,?,?) ";
			//1������Ʒ��2��ϵͳ������Ʒ�ƶ�����3����¼��ͬ��4���п�涩����5���ײͷֽⶩ����6�������ײͷֽⶩ��
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
			ps.setDate(12,null);
			ps.setString(13,cldlmc);
			ps.setString(14,"�����ײ�");
			ps.setString(15,ppmc);
			ps.setString(16,gysmc);
			ps.setString(17,ppmc);
			ps.setDouble(18,10);
			ps.setString(19,"");
			ps.setString(20,xclbz);

			ps.setDouble(21,0);
			ps.setDouble(22,0);
			ps.setDouble(23,0);
			ps.setDouble(24,0);
			ps.setDouble(25,0);
			ps.setString(26,"N");
			ps.setDate(27,null);
			ps.setDate(28,null);
			ps.setString(29,"");
			ps.setString(30,ssfgs);

			ps.setString(31,dwbh);
			ps.setString(32,sjs);
			ps.setString(33,lrbm);
			ps.setString(34,yhmc);
			ps.setString(35,"");
			ps.setString(36,sfkgsl);
			ps.setDouble(37,qtycf);
			ps.setString(38,lx);
			ps.setString(39,tcbm+":"+tcmc);
			ps.setDouble(40,tcjg);

			ps.executeUpdate();
			ps.close();

			long xh=0;
			ls_sql="select NVL(max(xh),0)";
			ls_sql+=" from  jc_zcddmx";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				xh=rs.getLong(1);
			}
			rs.close();
			ps.close();
			xh++;

			ls_sql ="insert into jc_zcddmx  (xh,ddbh,khbh,zcbm,zcmc,zcdlbm  ,zcxlbm  ,dwbh,gys  ,ppmc,zclbbm,xinghao,gg  ,zcysbm,jldwbm,sfbhpj,pjts,lsj,yhj  ,bzcbj,bzcxhdbl,sfycx,cxkssj,cxjzsj,cxj,cxcbj,lscxhdbl  ,xzjg,dj  ,cbj,sl,je              ,ycf,qtfy,qtfyje,zjhsl,zjhje           ,zjhycf,zjhqtfy  ,zcpzwzbm,cxhdbz,cxhdbl,cxhdje,lx,lrr,lrsj   ,sxbz,sxhtyy,fgsbh,qddm,jzsjs,bz   ,bzjsbl,cxjsbl,jsfs,jsbl,zclx,ddcljjfs,sxh,zjhcxhdje,sftjcp,zqdj,dpzk,zqje            ,zqzjhje         ,zctcbz)"; 
			ls_sql+=" select           ?+rownum,?   ,?   ,cpbm,cpmc,?       ,?       ,ppmc,gysmc,ppmc,''    ,xh     ,gg  ,''    ,jldw  ,'N'    ,0   ,0 ,0    ,jsj  ,0       ,'N'  ,''    ,''    ,0  ,0    ,0         ,'1' ,tcdj,jsj,sl,ROUND(tcdj*sl,2),0  ,0   ,0     ,sl   ,ROUND(tcdj*sl,2),0     ,0        ,''      ,'N'   ,0     ,0     ,'1',? ,SYSDATE,'1',''     ,?    ,?   ,?    ,bz   ,0     ,0     ,?   ,0   ,''  ,''      ,'' ,0        ,'N'   ,tcdj,10  ,ROUND(tcdj*sl,2),ROUND(tcdj*sl,2),'Y'";//xzjg 1:�����޼ۣ�2:������
			ls_sql+=" from  bj_khzctcmx";
			ls_sql+=" where khbh='"+khbh+"' and ppmc='"+ppmc+"' and gysmc='"+gysmc+"'";
			ls_sql+=" and tcbm='"+tcbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,xh);
			ps.setString(2,ddbh);
			ps.setString(3,khbh);
			ps.setString(4,cldlmc);
			ps.setString(5,"�����ײ�");

			ps.setString(6,yhmc);
			ps.setString(7,ssfgs);
			ps.setString(8,dwbh);
			ps.setString(9,sjs);
			ps.setString(10,"1");//1������ۣ�2���������
			ps.executeUpdate();
			ps.close();


			ls_sql=" update  bj_khzctcmx set fjddbh=?";
			ls_sql+=" where khbh='"+khbh+"' and ppmc='"+ppmc+"' and gysmc='"+gysmc+"'";
			ls_sql+=" and tcbm='"+tcbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ddbh);
			ps.executeUpdate();
			ps.close();

			if (sfkgsl.equals("N"))//�Ƿ�ɸ����� Y�����ԣ�N����
			{
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
				double cbze=0;
				double zqclf=0;
				double zhclf=0;
				double ycf=0;
				double qtf=0;
				ls_sql =" select sum(zqje+ycf+qtfyje),sum(je+ycf+qtfyje),sum(cxhdje),sum(cbj*sl),sum(zqje),sum(je),sum(ycf),sum(qtfyje)";
				ls_sql+=" from jc_zcddmx";
				ls_sql+=" where ddbh='"+ddbh+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					wdzje=rs.getDouble(1);
					hkze=rs.getDouble(2);
					cxhdje=rs.getDouble(3);
					cbze=rs.getDouble(4);
					zqclf=rs.getDouble(5);
					zhclf=rs.getDouble(6);
					ycf=rs.getDouble(7);
					qtf=rs.getDouble(8);
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

				ls_sql="update jc_zcdd set clzt='09',zczkl='"+zczkl+"',sxhtsfysh='M',cbze="+cbze+",wdzje="+wdzje+",hkze=ROUND("+hkze+","+jcddblxs+"),htcxhdje=ROUND("+cxhdje+","+jcddblxs+")";
				ls_sql+=" ,zqclf="+zqclf+",zhclf="+zhclf+",ycf=qtycf+"+ycf+",qtf="+qtf;
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
			}
			
			
		}
		rs1.close();
		ps1.close();
	}
	rs2.close();
	ps2.close();

	//�����ײͶ����ֽ⣽������������������������

	//��ů�ײͶ����ֽ⣫����������������������ʼ
	tcmc=null;
	tcjg=0;
	lx=null;
	ls_sql="SELECT tcmc,tcjg,lx";
	ls_sql+=" FROM bj_khwntcmc ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		tcmc=rs2.getString("tcmc");
		tcjg=rs2.getDouble("tcjg");
		lx=rs2.getString("lx");

		tcjg=0;

		int firstDd=0;
		ls_sql="SELECT distinct ppmc,gysmc";
		ls_sql+=" FROM bj_khwntcmx ";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcmc='"+tcmc+"'";
		ls_sql+=" and ppmc is not null";
		ls_sql+=" order by ppmc,gysmc";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			ppmc=rs1.getString("ppmc");
			gysmc=rs1.getString("gysmc");


			double tcycf=0;//�ײ�Զ�̷�
			String sfxcl="N";//�Ƿ������
			String sfkgtcsl="N";//�Ƿ�ɸ�����
			String cldlmc="";
			ls_sql =" select cldl";
			ls_sql+=" from jxc_ppxx";
			ls_sql+=" where ppmc='"+ppmc+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				cldlmc=rs.getString("cldl");
			}
			rs.close();
			ps.close();


			ls_sql =" select tcycf,sfxcl";
			ls_sql+=" from jxc_ppgysdzb";
			ls_sql+=" where ssfgs='"+ssfgs+"' and ppmc='"+ppmc+"' and gysmc='"+gysmc+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				tcycf=rs.getDouble("tcycf");
				sfxcl=cf.fillNull(rs.getString("sfxcl"));
			}
			rs.close();
			ps.close();

			double qtycf=0;
			if (sfyckh.equals("Y"))//�Ƿ�Զ�̿ͻ�   Y���ǣ�N����
			{
				double allqtycf=0;
				ls_sql =" select sum(qtycf)";
				ls_sql+=" from  jc_zcdd";
				ls_sql+=" where khbh='"+khbh+"' and gys='"+gysmc+"' and clzt not in('98','99')";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					allqtycf=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				if (allqtycf<=0)
				{
					ls_sql=" update jc_zcdd set ycf=ycf-qtycf,qtycf=0";
					ls_sql+=" where khbh='"+khbh+"' and gys='"+gysmc+"' and clzt in('98','99')";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					qtycf=tcycf;
				}
			}

			String sfkgsl=sfkgtcsl;//�Ƿ�ɸ�����
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

			ls_sql="insert into jc_zcdd ( ddbh,khbh,clgw,ztjjgw,xmzy,jjsjs,khjl,ddshbz,kjxsj,htshsj";
			ls_sql+=" ,qhtsj,jhtzshsj,zcdlbm,zcxlbm,ppbm,gys,ppmc,zczkl,dzyy,xclbz ";
			ls_sql+=" ,wdzje,hkze,cbze,htcxhdje,zjxcxhdje,sfyyh,yhkssj,yhjzsj,yhnr,fgsbh ";
			ls_sql+=" ,qddm,jzsjs,dwbh,lrr,lrsj,bz,sfkgsl,qtycf ";
			ls_sql+=" ,zqclf,zhclf,ycf,qtf,  zqzjxclf,zhzjxclf,zjxycf,zjxqtf ";
			ls_sql+=" ,zjxcbze,zqzjhze,zjhze,sfjs,clzt,ddlx,sfjrht,jmje,zctclx,zctcmc,zctcje )";
			ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?    ,?,?,?,?,?,?,?,?,?,?";
			ls_sql+=" ,?,?,?,?,SYSDATE,?,?,?    ";
			ls_sql+=" ,0,0,0,0   ,0,0,0,0   ,0,0,0,'N','07','7','N',0,?,?,?) ";
			//5���ײͷֽⶩ����6�������ײͷֽⶩ����7����ů�ײͷֽⶩ����8�������ײͷֽⶩ��
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
			ps.setDate(12,null);
			ps.setString(13,cldlmc);
			ps.setString(14,"��ů�ײ�");
			ps.setString(15,ppmc);
			ps.setString(16,gysmc);
			ps.setString(17,ppmc);
			ps.setDouble(18,10);
			ps.setString(19,"");
			ps.setString(20,xclbz);

			ps.setDouble(21,0);
			ps.setDouble(22,0);
			ps.setDouble(23,0);
			ps.setDouble(24,0);
			ps.setDouble(25,0);
			ps.setString(26,"N");
			ps.setDate(27,null);
			ps.setDate(28,null);
			ps.setString(29,"");
			ps.setString(30,ssfgs);

			ps.setString(31,dwbh);
			ps.setString(32,sjs);
			ps.setString(33,lrbm);
			ps.setString(34,yhmc);
			ps.setString(35,"");
			ps.setString(36,sfkgsl);
			ps.setDouble(37,qtycf);
			ps.setString(38,lx);
			ps.setString(39,tcmc);
			ps.setDouble(40,tcjg);

			ps.executeUpdate();
			ps.close();

			long xh=0;
			ls_sql="select NVL(max(xh),0)";
			ls_sql+=" from  jc_zcddmx";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				xh=rs.getLong(1);
			}
			rs.close();
			ps.close();
			xh++;

			ls_sql ="insert into jc_zcddmx  (xh,ddbh,khbh,zcbm,zcmc,zcdlbm  ,zcxlbm  ,dwbh,gys  ,ppmc,zclbbm,xinghao,gg  ,zcysbm,jldwbm,sfbhpj,pjts,lsj,yhj  ,bzcbj,bzcxhdbl,sfycx,cxkssj,cxjzsj,cxj,cxcbj,lscxhdbl  ,xzjg,dj  ,cbj,sl,je              ,ycf,qtfy,qtfyje,zjhsl,zjhje           ,zjhycf,zjhqtfy  ,zcpzwzbm,cxhdbz,cxhdbl,cxhdje,lx,lrr,lrsj   ,sxbz,sxhtyy,fgsbh,qddm,jzsjs,bz   ,bzjsbl,cxjsbl,jsfs,jsbl,zclx,ddcljjfs,sxh,zjhcxhdje,sftjcp,zqdj,dpzk,zqje            ,zqzjhje         ,zctcbz)"; 
			ls_sql+=" select           ?+rownum,?   ,?   ,cpbm,cpmc,?       ,?       ,ppmc,gysmc,ppmc,''    ,xh     ,gg  ,''    ,jldw  ,'N'    ,0   ,0 ,0    ,jsj  ,0       ,'N'  ,''    ,''    ,0  ,0    ,0         ,'1' ,tcdj,jsj,sl,ROUND(tcdj*sl,2),0  ,0   ,0     ,sl   ,ROUND(tcdj*sl,2),0     ,0        ,''      ,'N'   ,0     ,0     ,'1',? ,SYSDATE,'1',''     ,?    ,?   ,?    ,bz   ,0     ,0     ,?   ,0   ,''  ,''      ,'' ,0        ,'N'   ,tcdj,10  ,ROUND(tcdj*sl,2),ROUND(tcdj*sl,2),'Y'";//xzjg 1:�����޼ۣ�2:������
			ls_sql+=" from  bj_khwntcmx";
			ls_sql+=" where khbh='"+khbh+"' and ppmc='"+ppmc+"' and gysmc='"+gysmc+"'";
			ls_sql+=" and tcmc='"+tcmc+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,xh);
			ps.setString(2,ddbh);
			ps.setString(3,khbh);
			ps.setString(4,cldlmc);
			ps.setString(5,"��ů�ײ�");

			ps.setString(6,yhmc);
			ps.setString(7,ssfgs);
			ps.setString(8,dwbh);
			ps.setString(9,sjs);
			ps.setString(10,"1");//1������ۣ�2���������
			ps.executeUpdate();
			ps.close();


			ls_sql=" update  bj_khwntcmx set fjddbh=?";
			ls_sql+=" where khbh='"+khbh+"' and ppmc='"+ppmc+"' and gysmc='"+gysmc+"'";
			ls_sql+=" and tcmc='"+tcmc+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ddbh);
			ps.executeUpdate();
			ps.close();

			if (sfkgsl.equals("N"))//�Ƿ�ɸ����� Y�����ԣ�N����
			{
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
				double cbze=0;
				double zqclf=0;
				double zhclf=0;
				double ycf=0;
				double qtf=0;
				ls_sql =" select sum(zqje+ycf+qtfyje),sum(je+ycf+qtfyje),sum(cxhdje),sum(cbj*sl),sum(zqje),sum(je),sum(ycf),sum(qtfyje)";
				ls_sql+=" from jc_zcddmx";
				ls_sql+=" where ddbh='"+ddbh+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					wdzje=rs.getDouble(1);
					hkze=rs.getDouble(2);
					cxhdje=rs.getDouble(3);
					cbze=rs.getDouble(4);
					zqclf=rs.getDouble(5);
					zhclf=rs.getDouble(6);
					ycf=rs.getDouble(7);
					qtf=rs.getDouble(8);
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

				ls_sql="update jc_zcdd set clzt='09',zczkl='"+zczkl+"',sxhtsfysh='M',cbze="+cbze+",wdzje="+wdzje+",hkze=ROUND("+hkze+","+jcddblxs+"),htcxhdje=ROUND("+cxhdje+","+jcddblxs+")";
				ls_sql+=" ,zqclf="+zqclf+",zhclf="+zhclf+",ycf=qtycf+"+ycf+",qtf="+qtf;
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
			}
			
			
		}
		rs1.close();
		ps1.close();
	}
	rs2.close();
	ps2.close();

	//��ů�ײͶ����ֽ⣽������������������������


	//�����ײͶ����ֽ⣫����������������������ʼ
	tcmc=null;
	tcjg=0;
	lx=null;
	ls_sql="SELECT tcmc,tcjg,lx";
	ls_sql+=" FROM bj_khcltcmc ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		tcmc=rs2.getString("tcmc");
		tcjg=rs2.getDouble("tcjg");
		lx=rs2.getString("lx");

		int firstDd=0;
		ls_sql="SELECT distinct ppmc,gysmc";
		ls_sql+=" FROM bj_khcltcmx ";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcmc='"+tcmc+"'";
		ls_sql+=" and ppmc is not null";
		ls_sql+=" order by ppmc,gysmc";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			ppmc=rs1.getString("ppmc");
			gysmc=rs1.getString("gysmc");

			firstDd++;
			if (firstDd>1)//��һ�������ֽ��ײͽ��
			{
				tcjg=0;
			}

			double tcycf=0;//�ײ�Զ�̷�
			String sfxcl="N";//�Ƿ������
			String sfkgtcsl="N";//�Ƿ�ɸ�����
			String cldlmc="";
			ls_sql =" select cldl";
			ls_sql+=" from jxc_ppxx";
			ls_sql+=" where ppmc='"+ppmc+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				cldlmc=rs.getString("cldl");
			}
			rs.close();
			ps.close();


			ls_sql =" select tcycf,sfxcl";
			ls_sql+=" from jxc_ppgysdzb";
			ls_sql+=" where ssfgs='"+ssfgs+"' and ppmc='"+ppmc+"' and gysmc='"+gysmc+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				tcycf=rs.getDouble("tcycf");
				sfxcl=cf.fillNull(rs.getString("sfxcl"));
			}
			rs.close();
			ps.close();

			double qtycf=0;
			if (sfyckh.equals("Y"))//�Ƿ�Զ�̿ͻ�   Y���ǣ�N����
			{
				double allqtycf=0;
				ls_sql =" select sum(qtycf)";
				ls_sql+=" from  jc_zcdd";
				ls_sql+=" where khbh='"+khbh+"' and gys='"+gysmc+"' and clzt not in('98','99')";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					allqtycf=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				if (allqtycf<=0)
				{
					ls_sql=" update jc_zcdd set ycf=ycf-qtycf,qtycf=0";
					ls_sql+=" where khbh='"+khbh+"' and gys='"+gysmc+"' and clzt in('98','99')";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					qtycf=tcycf;
				}
			}

			String sfkgsl=sfkgtcsl;//�Ƿ�ɸ�����
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

			ls_sql="insert into jc_zcdd ( ddbh,khbh,clgw,ztjjgw,xmzy,jjsjs,khjl,ddshbz,kjxsj,htshsj";
			ls_sql+=" ,qhtsj,jhtzshsj,zcdlbm,zcxlbm,ppbm,gys,ppmc,zczkl,dzyy,xclbz ";
			ls_sql+=" ,wdzje,hkze,cbze,htcxhdje,zjxcxhdje,sfyyh,yhkssj,yhjzsj,yhnr,fgsbh ";
			ls_sql+=" ,qddm,jzsjs,dwbh,lrr,lrsj,bz,sfkgsl,qtycf ";
			ls_sql+=" ,zqclf,zhclf,ycf,qtf,  zqzjxclf,zhzjxclf,zjxycf,zjxqtf ";
			ls_sql+=" ,zjxcbze,zqzjhze,zjhze,sfjs,clzt,ddlx,sfjrht,jmje,zctclx,zctcmc,zctcje )";
			ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?    ,?,?,?,?,?,?,?,?,?,?";
			ls_sql+=" ,?,?,?,?,SYSDATE,?,?,?    ";
			ls_sql+=" ,0,0,0,0   ,0,0,0,0   ,0,0,0,'N','07','8','N',0,?,?,?) ";
			//5���ײͷֽⶩ����6�������ײͷֽⶩ����7����ů�ײͷֽⶩ����8�������ײͷֽⶩ��
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
			ps.setDate(12,null);
			ps.setString(13,cldlmc);
			ps.setString(14,"�����ײ�");
			ps.setString(15,ppmc);
			ps.setString(16,gysmc);
			ps.setString(17,ppmc);
			ps.setDouble(18,10);
			ps.setString(19,"");
			ps.setString(20,xclbz);

			ps.setDouble(21,0);
			ps.setDouble(22,0);
			ps.setDouble(23,0);
			ps.setDouble(24,0);
			ps.setDouble(25,0);
			ps.setString(26,"N");
			ps.setDate(27,null);
			ps.setDate(28,null);
			ps.setString(29,"");
			ps.setString(30,ssfgs);

			ps.setString(31,dwbh);
			ps.setString(32,sjs);
			ps.setString(33,lrbm);
			ps.setString(34,yhmc);
			ps.setString(35,"");
			ps.setString(36,sfkgsl);
			ps.setDouble(37,qtycf);
			ps.setString(38,lx);
			ps.setString(39,tcmc);
			ps.setDouble(40,tcjg);

			ps.executeUpdate();
			ps.close();

			long xh=0;
			ls_sql="select NVL(max(xh),0)";
			ls_sql+=" from  jc_zcddmx";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				xh=rs.getLong(1);
			}
			rs.close();
			ps.close();
			xh++;

			ls_sql ="insert into jc_zcddmx  (xh,ddbh,khbh,zcbm,zcmc,zcdlbm  ,zcxlbm  ,dwbh,gys  ,ppmc,zclbbm,xinghao,gg  ,zcysbm,jldwbm,sfbhpj,pjts,lsj,yhj  ,bzcbj,bzcxhdbl,sfycx,cxkssj,cxjzsj,cxj,cxcbj,lscxhdbl  ,xzjg,dj  ,cbj,sl,je ,ycf,qtfy,qtfyje,zjhsl,zjhje ,zjhycf,zjhqtfy  ,zcpzwzbm,cxhdbz,cxhdbl,cxhdje,lx,lrr,lrsj   ,sxbz,sxhtyy,fgsbh,qddm,jzsjs,bz   ,bzjsbl,cxjsbl,jsfs,jsbl,zclx,ddcljjfs,sxh,zjhcxhdje,sftjcp,zqdj,dpzk,zqje,zqzjhje,zctcbz)"; 
			ls_sql+=" select           ?+rownum,?   ,?   ,cpbm,cpmc,?       ,?       ,ppmc,gysmc,ppmc,''    ,xh     ,gg  ,''    ,jldw  ,'N'    ,0   ,0 ,0    ,jsj  ,0       ,'N'  ,''    ,''    ,0  ,0    ,0         ,'1' ,0   ,jsj,sl,0  ,0  ,0   ,0     ,sl   ,0     ,0     ,0        ,''      ,'N'   ,0     ,0     ,'1',? ,SYSDATE,'1',''     ,?    ,?   ,?    ,bz   ,0     ,0     ,?   ,0   ,''  ,''      ,'' ,0        ,'N'   ,0   ,10  ,0   ,0      ,'Y'";//xzjg 1:�����޼ۣ�2:������
			ls_sql+=" from  bj_khcltcmx";
			ls_sql+=" where khbh='"+khbh+"' and ppmc='"+ppmc+"' and gysmc='"+gysmc+"'";
			ls_sql+=" and tcmc='"+tcmc+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,xh);
			ps.setString(2,ddbh);
			ps.setString(3,khbh);
			ps.setString(4,cldlmc);
			ps.setString(5,"�����ײ�");

			ps.setString(6,yhmc);
			ps.setString(7,ssfgs);
			ps.setString(8,dwbh);
			ps.setString(9,sjs);
			ps.setString(10,"1");//1������ۣ�2���������
			ps.executeUpdate();
			ps.close();


			ls_sql=" update  bj_khcltcmx set fjddbh=?";
			ls_sql+=" where khbh='"+khbh+"' and ppmc='"+ppmc+"' and gysmc='"+gysmc+"'";
			ls_sql+=" and tcmc='"+tcmc+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ddbh);
			ps.executeUpdate();
			ps.close();

			if (sfkgsl.equals("N"))//�Ƿ�ɸ����� Y�����ԣ�N����
			{
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
				double cbze=0;
				double zqclf=0;
				double zhclf=0;
				double ycf=0;
				double qtf=0;
				ls_sql =" select sum(zqje+ycf+qtfyje),sum(je+ycf+qtfyje),sum(cxhdje),sum(cbj*sl),sum(zqje),sum(je),sum(ycf),sum(qtfyje)";
				ls_sql+=" from jc_zcddmx";
				ls_sql+=" where ddbh='"+ddbh+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					wdzje=rs.getDouble(1);
					hkze=rs.getDouble(2);
					cxhdje=rs.getDouble(3);
					cbze=rs.getDouble(4);
					zqclf=rs.getDouble(5);
					zhclf=rs.getDouble(6);
					ycf=rs.getDouble(7);
					qtf=rs.getDouble(8);
				}
				rs.close();
				ps.close();

				//�ϼƣ������ֽ��ײͽ��
				wdzje+=tcjg;
				hkze+=tcjg;
				zqclf+=tcjg;
				zhclf+=tcjg;


				double zczkl=10;
				if (zqclf==0)
				{
					zczkl=10;
				}
				else{
					zczkl=zhclf*10/zqclf;
				}

				ls_sql="update jc_zcdd set clzt='09',zczkl='"+zczkl+"',sxhtsfysh='M',cbze="+cbze+",wdzje="+wdzje+",hkze=ROUND("+hkze+","+jcddblxs+"),htcxhdje=ROUND("+cxhdje+","+jcddblxs+")";
				ls_sql+=" ,zqclf="+zqclf+",zhclf="+zhclf+",ycf=qtycf+"+ycf+",qtf="+qtf;
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
			}
			
			
		}
		rs1.close();
		ps1.close();
	}
	rs2.close();
	ps2.close();

	//�����ײͶ����ֽ⣽������������������������


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
	out.print("����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
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