<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>计算工资</title>
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

	ls_sql="delete from rs_ygzbjtzjl ";
	ls_sql+=" where jlh='"+khzq+"' and ssfgs='"+ssfgs+"' and lx='2'";//1：录入；2：工资3：提成
	ps1= conn.prepareStatement(ls_sql);
	ps1.executeUpdate();
	ps1.close();

	ls_sql="delete from rs_gzmxb";
	ls_sql+=" where khzq='"+khzq+"' and ssfgs='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into rs_gzmxb (khzq,ssfgs,ygbh        ,bianhao        ,yhmc        ,xzzwbm        ,zwbm        ,dwbh        ,lx                      ,txbz                         ,jbgz                  ,gwgz                  ,glgz                  ,jtbt                  ,dhbt                  ,cb                  ,buzhu                  ,dixin,dxsf    ,jxgzjs                ,jxfz,jxgz     ,khyj,bqyjze,sqyj,khgz,yjkhkk    ,cqts,sjts,bjts,kgts,cjts,jbts,sjkk,bjkk,kgkk,cjkk,qqkk,jbf    ,kbx,jf,kzbj,qtkk,yfgz,ksk,sfgz,lrr,lrsj   ,bz) ";
	ls_sql+=" select              ?   ,?    ,sq_yhxx.ygbh,sq_yhxx.bianhao,sq_yhxx.yhmc,sq_yhxx.xzzwbm,sq_yhxx.zwbm,sq_yhxx.dwbh,NVL(rs_ygjbgzb.gzlb,'1'),NVL(rs_ygjbgzb.txbz,'N')     ,NVL(rs_ygjbgzb.jbgz,0),NVL(rs_ygjbgzb.gwgz,0),NVL(rs_ygjbgzb.glgz,0),NVL(rs_ygjbgzb.jtbt,0),NVL(rs_ygjbgzb.dhbt,0),NVL(rs_ygjbgzb.cb,0),NVL(rs_ygjbgzb.buzhu,0),0    ,0       ,NVL(rs_ygjbgzb.khgz,0),0   ,0        ,0   ,0     ,0   ,0   ,0         ,0   ,0   ,0   ,0   ,0   ,0   ,0   ,0   ,0   ,0   ,0   ,0      ,0  ,0 ,0   ,0   ,0   ,0  ,0   ,?  ,SYSDATE,''";
	ls_sql+=" from sq_yhxx,rs_ygjbgzb";
	ls_sql+=" where sq_yhxx.ygbh=rs_ygjbgzb.ygbh(+)";
	ls_sql+=" and sq_yhxx.ssfgs='"+ssfgs+"'";
	ls_sql+=" and sq_yhxx.sfzszg in('Y','N')";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khzq);
	ps.setString(2,ssfgs);
	ps.setString(3,lrr);
	ps.executeUpdate();
	ps.close();


	int row=0;


	String ygbh=null;
	String bianhao=null;
	String getyhmc=null;
	String xzzwbm=null;
	String zwbm=null;
	String zwmc=null;
	String getdwbh=null;
	String dwmc=null;
	String lx=null;
	String lxmc=null;
	String txbz=null;
	String txbzmc=null;

	double jbgz=0;
	double gwgz=0;
	double glgz=0;
	double jtbt=0;
	double dhbt=0;
	double cb=0;
	double buzhu=0;
	double dixin=0;//底薪
	double dxsf=0;

	double jxgzjs=0;
	double jxfz=0;
	double jxgz=0;

	double khyj=0;
	double bqyjze=0;
	double sqyj=0;
	double khgz=0;
	double yjkhkk=0;

	double cqts=0;
	double sjts=0;
	double bjts=0;
	double kgts=0;
	double cjts=0;
	double jbts=0;

	double sjkk=0;
	double bjkk=0;
	double cjkk=0;
	double kgkk=0;
	double qqkk=0;
	double jbf=0;

	double kbx=0;

	double jf=0;
	double kzbj=0;
	double qtkk=0;

	double yfgz=0;
	double ksk=0;
	double sfgz=0;

	
	
	ls_sql="select ygbh,bianhao,yhmc,xzzwbm,rs_gzmxb.zwbm,zwmc,rs_gzmxb.dwbh,dwmc,lx,DECODE(lx,'1','固定工资','2','浮动') lxmc,txbz,DECODE(txbz,'N','未停薪','Y','停薪') txbzmc";
	ls_sql+=" ,jbgz,gwgz,glgz,jtbt,dhbt,cb,buzhu,dixin,dxsf  ,jxgzjs,jxfz,jxgz  ,khyj,bqyjze,sqyj,khgz,yjkhkk  ";
	ls_sql+=" ,cqts,sjts,bjts,kgts,cjts,jbts,sjkk,bjkk,cjkk,kgkk,qqkk,jbf ";
	ls_sql+=" ,kbx,jf,kzbj,qtkk,yfgz,ksk,sfgz ";
	ls_sql+=" from rs_gzmxb,sq_dwxx,dm_zwbm";
	ls_sql+=" where rs_gzmxb.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and rs_gzmxb.zwbm=dm_zwbm.zwbm(+)";
	ls_sql+=" and rs_gzmxb.khzq='"+khzq+"' and rs_gzmxb.ssfgs='"+ssfgs+"'";
    ls_sql+=" order by rs_gzmxb.dwbh,rs_gzmxb.xzzwbm,rs_gzmxb.ygbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ygbh=cf.fillNull(rs.getString("ygbh"));
		bianhao=cf.fillNull(rs.getString("bianhao"));
		getyhmc=cf.fillNull(rs.getString("yhmc"));
		xzzwbm=cf.fillHtml(rs.getString("xzzwbm"));
		zwbm=cf.fillNull(rs.getString("zwbm"));
		zwmc=cf.fillHtml(rs.getString("zwmc"));
		getdwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		lx=cf.fillNull(rs.getString("lx"));
		lxmc=cf.fillNull(rs.getString("lxmc"));
		txbz=cf.fillNull(rs.getString("txbz"));
		txbzmc=cf.fillNull(rs.getString("txbzmc"));

		jbgz=rs.getDouble("jbgz");
		gwgz=rs.getDouble("gwgz");
		glgz=rs.getDouble("glgz");
		jtbt=rs.getDouble("jtbt");
		dhbt=rs.getDouble("dhbt");
		cb=rs.getDouble("cb");
		buzhu=rs.getDouble("buzhu");
		dixin=rs.getDouble("dixin");
		dxsf=rs.getDouble("dxsf");

		jxgzjs=rs.getDouble("jxgzjs");
		jxfz=rs.getDouble("jxfz");
		jxgz=rs.getDouble("jxgz");

		khyj=rs.getDouble("khyj");
		bqyjze=rs.getDouble("bqyjze");
		sqyj=rs.getDouble("sqyj");
		khgz=rs.getDouble("khgz");
		yjkhkk=rs.getDouble("yjkhkk");

		cqts=rs.getDouble("cqts");
		sjts=rs.getDouble("sjts");
		bjts=rs.getDouble("bjts");
		kgts=rs.getDouble("kgts");
		cjts=rs.getDouble("cjts");
		jbts=rs.getDouble("jbts");
		sjkk=rs.getDouble("sjkk");
		bjkk=rs.getDouble("bjkk");
		kgkk=rs.getDouble("kgkk");
		cjkk=rs.getDouble("cjkk");
		qqkk=rs.getDouble("qqkk");
		jbf=rs.getDouble("jbf");

		kbx=rs.getDouble("kbx");

		jf=rs.getDouble("jf");
		kzbj=rs.getDouble("kzbj");
		qtkk=rs.getDouble("qtkk");

		yfgz=rs.getDouble("yfgz");
		ksk=rs.getDouble("ksk");
		sfgz=rs.getDouble("sfgz");



		//考核业绩
		ls_sql=" SELECT byrw";
		ls_sql+=" FROM cw_jryjkh";
		ls_sql+=" where khzq='"+khzq+"' and ygbh='"+ygbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			khyj=rs1.getDouble("byrw");
		}
		rs1.close();
		ps1.close();


		
		//扣保险
		double grjbfe=0;
		double grjgjj=0;
		ls_sql=" SELECT grjbfe,grjgjj";
		ls_sql+=" FROM rs_ygsbxx";
		ls_sql+=" where ygbh='"+ygbh+"'";
		ls_sql+=" and sfcjbx='Y'";//Y：参保；N：未办理；T：停保；Z：转出
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			grjbfe=rs1.getDouble("grjbfe");
			grjgjj=rs1.getDouble("grjgjj");
		}
		rs1.close();
		ps1.close();

		kbx=cf.round(-1*(grjbfe+grjgjj),2);

		
		//奖罚记录
		ls_sql=" SELECT sum(jfje)";
		ls_sql+=" FROM rs_jfjl";
		ls_sql+=" where ygbh='"+ygbh+"'";
		ls_sql+=" and zt='1'";//1：未支付；2：已支付
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			jf=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		//底薪
		dixin=cf.round(jbgz+gwgz+glgz+jtbt+dhbt+cb+buzhu,2);


		//本期业绩总额
		//考核工资
		//业绩考核扣款
		sqyj=0;//连续3期业绩
		if (lx.equals("2") && zwbm.equals("04"))//04:家装设计师;2：浮动工资
		{
			//签单
			int qys=0;
			double qye=0;
			ls_sql=" SELECT count(*),sum(crm_khqye.yjjz)";
			ls_sql+=" FROM crm_khxx,crm_khqye";
			ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh";
			ls_sql+=" and crm_khxx.zt in('2','3','5')";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";//首次付家装款时间
			ls_sql+=" and crm_khxx.sjs='"+getyhmc+"'";
			ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				qys=rs1.getInt(1);
				qye=rs1.getDouble(2);
			}
			rs1.close();
			ps1.close();

			//退单
			int tds=0;
			double tde=0;
			ls_sql=" SELECT count(*),sum(crm_khqye.yjjz)";
			ls_sql+=" FROM crm_khxx,crm_khqye";
			ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh";
			ls_sql+=" and crm_khxx.zt='3'";//3：退单客户
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"' and yjjzsj is not null ";//首次付家装款时间
			ls_sql+=" and crm_khxx.sjs='"+getyhmc+"'";
			ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tds=rs1.getInt(1);
				tde=rs1.getDouble(2);
			}
			rs1.close();
			ps1.close();


			//折前折后业绩
			double yj=0;
			yj=cf.round(qye-tde,2);

			bqyjze=yj;

			//连续3期业绩
			int jxqs=0;
			ls_sql=" SELECT sum(bqyjze)";
			ls_sql+=" FROM rs_gzmxb";
			ls_sql+=" where ssfgs='"+ssfgs+"' and ygbh='"+ygbh+"'";
			ls_sql+=" order by lrsj desc";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			while (rs1.next())
			{
				sqyj+=rs1.getDouble(1);
				jxqs++;

				if (jxqs>=2)
				{
					break;
				}
			}
			rs1.close();
			ps1.close();

			sqyj+=bqyjze;
			sqyj=cf.round(sqyj,2);

			
			//业绩考核扣款
			if (bqyjze<khyj)//业绩净值小于3万：半薪
			{
				yjkhkk=-1*dixin/2;
			}
			if (sqyj==0)//连续3期不签单：停薪
			{
				yjkhkk=-1*dixin;
			}

			yjkhkk=cf.round(yjkhkk,2);//业绩考核扣款
		}
		else if (lx.equals("2"))//2：浮动工资
		{
			if (xzzwbm.equals("精品业务员"))
			{
				//签单
				int qys=0;
				double qye=0;
			ls_sql=" SELECT count(*),sum(crm_khqye.yjjz)";
			ls_sql+=" FROM crm_khxx,crm_khqye";
			ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh";
				ls_sql+=" and crm_khxx.zt in('2','3','5')";
				ls_sql+=" and crm_khxx.fgsbh='"+ssfgs+"'";
				ls_sql+=" and crm_khxx.ywy='"+getyhmc+"'";
				ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					qys=rs1.getInt(1);
					qye=rs1.getDouble(2);
				}
				rs1.close();
				ps1.close();

				//退单
				int tds=0;
				double tde=0;
			ls_sql=" SELECT count(*),sum(crm_khqye.yjjz)";
			ls_sql+=" FROM crm_khxx,crm_khqye";
			ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh";
				ls_sql+=" and crm_khxx.zt='3'";//3：退单客户
				ls_sql+=" and crm_khxx.fgsbh='"+ssfgs+"' and yjjzsj is not null ";//首次付家装款时间
				ls_sql+=" and crm_khxx.ywy='"+getyhmc+"'";
				ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					tds=rs1.getInt(1);
					tde=rs1.getDouble(2);
				}
				rs1.close();
				ps1.close();


				//折前折后业绩
				double yj=0;
				yj=cf.round(qye-tde,2);

				bqyjze=yj;

				//连续3期业绩
				int jxqs=0;
				ls_sql=" SELECT sum(bqyjze)";
				ls_sql+=" FROM rs_gzmxb";
				ls_sql+=" where ssfgs='"+ssfgs+"' and ygbh='"+ygbh+"'";
				ls_sql+=" order by lrsj desc";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				while (rs1.next())
				{
					sqyj+=rs1.getDouble(1);
					jxqs++;

					if (jxqs>=2)
					{
						break;
					}
				}
				rs1.close();
				ps1.close();

				sqyj+=bqyjze;

				sqyj=cf.round(sqyj,2);

				
				//业绩考核扣款
				if (bqyjze<khyj)//业绩净值小于3万：半薪
				{
					yjkhkk=-1*dixin/2;
				}
				if (sqyj==0)//连续3期不签单：停薪
				{
					yjkhkk=-1*dixin;
				}

				yjkhkk=cf.round(yjkhkk,2);//业绩考核扣款
			}
			else if (xzzwbm.equals("电话营销专员") || xzzwbm.equals("电话营销部经理") || xzzwbm.equals("网络营销专员") || xzzwbm.equals("网销部经理"))
			{
				//签单
				int qys=0;
				double qye=0;
			ls_sql=" SELECT count(*),sum(crm_khqye.yjjz)";
			ls_sql+=" FROM crm_khxx,crm_khqye";
			ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh";
				ls_sql+=" and crm_khxx.zt in('2','3','5')";
				ls_sql+=" and crm_khxx.fgsbh='"+ssfgs+"'";
				ls_sql+=" and crm_khxx.ywy='"+getyhmc+"'";
				ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					qys=rs1.getInt(1);
					qye=rs1.getDouble(2);
				}
				rs1.close();
				ps1.close();

				//退单
				int tds=0;
				double tde=0;
			ls_sql=" SELECT count(*),sum(crm_khqye.yjjz)";
			ls_sql+=" FROM crm_khxx,crm_khqye";
			ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh";
				ls_sql+=" and crm_khxx.zt='3'";//3：退单客户
				ls_sql+=" and crm_khxx.fgsbh='"+ssfgs+"' and yjjzsj is not null ";//首次付家装款时间
				ls_sql+=" and crm_khxx.ywy='"+getyhmc+"'";
				ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					tds=rs1.getInt(1);
					tde=rs1.getDouble(2);
				}
				rs1.close();
				ps1.close();


				//折前折后业绩
				double yj=0;
				yj=cf.round(qye-tde,2);

				bqyjze=yj;

				//连续3期业绩
				int jxqs=0;
				ls_sql=" SELECT sum(bqyjze)";
				ls_sql+=" FROM rs_gzmxb";
				ls_sql+=" where ssfgs='"+ssfgs+"' and ygbh='"+ygbh+"'";
				ls_sql+=" order by lrsj desc";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				while (rs1.next())
				{
					sqyj+=rs1.getDouble(1);
					jxqs++;

					if (jxqs>=2)
					{
						break;
					}
				}
				rs1.close();
				ps1.close();

				sqyj+=bqyjze;

				sqyj=cf.round(sqyj,2);
				
			}
			else if (xzzwbm.equals("监理"))
			{
			}
			else if (xzzwbm.equals("设计部经理"))
			{
				//签单
				int qys=0;
				double qye=0;
			ls_sql=" SELECT count(*),sum(crm_khqye.yjjz)";
			ls_sql+=" FROM crm_khxx,crm_khqye";
			ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh";
				ls_sql+=" and crm_khxx.zt in('2','3','5')";
				ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"')";//首次付家装款时间
				ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					qys=rs1.getInt(1);
					qye=rs1.getDouble(2);
				}
				rs1.close();
				ps1.close();

				//退单
				int tds=0;
				double tde=0;
			ls_sql=" SELECT count(*),sum(crm_khqye.yjjz)";
			ls_sql+=" FROM crm_khxx,crm_khqye";
			ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh";
				ls_sql+=" and crm_khxx.zt='3'";//3：退单客户
				ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"')";//首次付家装款时间
				ls_sql+=" and yjjzsj is not null ";//首次付家装款时间
				ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					tds=rs1.getInt(1);
					tde=rs1.getDouble(2);
				}
				rs1.close();
				ps1.close();


				//折前折后业绩
				double yj=0;
				yj=cf.round(qye-tde,2);

				bqyjze=yj;

				//连续3期业绩
				int jxqs=0;
				ls_sql=" SELECT sum(bqyjze)";
				ls_sql+=" FROM rs_gzmxb";
				ls_sql+=" where ssfgs='"+ssfgs+"' and ygbh='"+ygbh+"'";
				ls_sql+=" order by lrsj desc";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				while (rs1.next())
				{
					sqyj+=rs1.getDouble(1);
					jxqs++;

					if (jxqs>=2)
					{
						break;
					}
				}
				rs1.close();
				ps1.close();

				sqyj+=bqyjze;
				sqyj=cf.round(sqyj,2);

				
				//考核工资
				ls_sql=" SELECT khgz";
				ls_sql+=" FROM rs_dztcbl";
				ls_sql+=" where fgsbh='"+ssfgs+"'";
				ls_sql+=" and qd<="+bqyjze;
				ls_sql+=" and zd>"+bqyjze;
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					khgz=rs1.getDouble(1);
				}
				rs1.close();
				ps1.close();
			}
			else if (xzzwbm.equals("区域副总经理"))
			{
				//签单
				int qys=0;
				double qye=0;
			ls_sql=" SELECT count(*),sum(crm_khqye.yjjz)";
			ls_sql+=" FROM crm_khxx,crm_khqye";
			ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh";
				ls_sql+=" and crm_khxx.zt in('2','3','5')";
				ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"')";//首次付家装款时间
				ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					qys=rs1.getInt(1);
					qye=rs1.getDouble(2);
				}
				rs1.close();
				ps1.close();

				//退单
				int tds=0;
				double tde=0;
			ls_sql=" SELECT count(*),sum(crm_khqye.yjjz)";
			ls_sql+=" FROM crm_khxx,crm_khqye";
			ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh";
				ls_sql+=" and crm_khxx.zt='3'";//3：退单客户
				ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"')";//首次付家装款时间
				ls_sql+=" and yjjzsj is not null ";//首次付家装款时间
				ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					tds=rs1.getInt(1);
					tde=rs1.getDouble(2);
				}
				rs1.close();
				ps1.close();


				//折前折后业绩
				double yj=0;
				yj=cf.round(qye-tde,2);

				bqyjze=yj;

				//连续3期业绩
				int jxqs=0;
				ls_sql=" SELECT sum(bqyjze)";
				ls_sql+=" FROM rs_gzmxb";
				ls_sql+=" where ssfgs='"+ssfgs+"' and ygbh='"+ygbh+"'";
				ls_sql+=" order by lrsj desc";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				while (rs1.next())
				{
					sqyj+=rs1.getDouble(1);
					jxqs++;

					if (jxqs>=2)
					{
						break;
					}
				}
				rs1.close();
				ps1.close();

				sqyj+=bqyjze;
				sqyj=cf.round(sqyj,2);

				
				//考核工资
				ls_sql=" SELECT khgz";
				ls_sql+=" FROM rs_qfztcbl";
				ls_sql+=" where fgsbh='"+ssfgs+"'";
				ls_sql+=" and qd<="+bqyjze;
				ls_sql+=" and zd>"+bqyjze;
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					khgz=rs1.getDouble(1);
				}
				rs1.close();
				ps1.close();
			}
			else if (xzzwbm.equals("区域总经理"))
			{
				//签单
				int qys=0;
				double qye=0;
			ls_sql=" SELECT count(*),sum(crm_khqye.yjjz)";
			ls_sql+=" FROM crm_khxx,crm_khqye";
			ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh";
				ls_sql+=" and crm_khxx.zt in('2','3','5')";
				ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"')";//首次付家装款时间
				ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					qys=rs1.getInt(1);
					qye=rs1.getDouble(2);
				}
				rs1.close();
				ps1.close();

				//退单
				int tds=0;
				double khzqtde=0;
				double tde=0;
			ls_sql=" SELECT count(*),sum(crm_khqye.yjjz)";
			ls_sql+=" FROM crm_khxx,crm_khqye";
			ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh";
				ls_sql+=" and crm_khxx.zt='3'";//3：退单客户
				ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"')";//首次付家装款时间
				ls_sql+=" and yjjzsj is not null ";//首次付家装款时间
				ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					tds=rs1.getInt(1);
					tde=rs1.getDouble(2);
				}
				rs1.close();
				ps1.close();


				//折前折后业绩
				double yj=0;
				yj=cf.round(qye-tde,2);

				bqyjze=yj;

				//连续3期业绩
				int jxqs=0;
				ls_sql=" SELECT sum(bqyjze)";
				ls_sql+=" FROM rs_gzmxb";
				ls_sql+=" where ssfgs='"+ssfgs+"' and ygbh='"+ygbh+"'";
				ls_sql+=" order by lrsj desc";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				while (rs1.next())
				{
					sqyj+=rs1.getDouble(1);
					jxqs++;

					if (jxqs>=2)
					{
						break;
					}
				}
				rs1.close();
				ps1.close();

				sqyj+=bqyjze;
				sqyj=cf.round(sqyj,2);

				
				//考核工资
				ls_sql=" SELECT khgz";
				ls_sql+=" FROM rs_qztcbl";
				ls_sql+=" where fgsbh='"+ssfgs+"'";
				ls_sql+=" and qd<="+bqyjze;
				ls_sql+=" and zd>"+bqyjze;
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					khgz=rs1.getDouble(1);
				}
				rs1.close();
				ps1.close();
			}
			else if (xzzwbm.equals("市场部经理"))
			{
				//签单
				int qys=0;
				double qye=0;
			ls_sql=" SELECT count(*),sum(crm_khqye.yjjz)";
			ls_sql+=" FROM crm_khxx,crm_khqye";
			ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh";
				ls_sql+=" and crm_khxx.zt in('2','3','5')";
				ls_sql+=" and crm_khxx.ywybm='"+getdwbh+"'";
				ls_sql+=" and crm_khxx.ywy is not null";
				ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					qys=rs1.getInt(1);
					qye=rs1.getDouble(2);
				}
				rs1.close();
				ps1.close();

				//退单
				int tds=0;
				double tde=0;
			ls_sql=" SELECT count(*),sum(crm_khqye.yjjz)";
			ls_sql+=" FROM crm_khxx,crm_khqye";
			ls_sql+=" where crm_khxx.khbh=crm_khqye.khbh";
				ls_sql+=" and crm_khxx.zt='3'";//3：退单客户
				ls_sql+=" and crm_khxx.ywybm='"+getdwbh+"'";
				ls_sql+=" and crm_khxx.ywy is not null";
				ls_sql+=" and yjjzsj is not null ";//首次付家装款时间
				ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD')";
				ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+tcjzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					tds=rs1.getInt(1);
					tde=rs1.getDouble(2);
				}
				rs1.close();
				ps1.close();


				//折前折后业绩
				double yj=0;
				yj=cf.round(qye-tde,2);

				bqyjze=yj;

				//连续3期业绩
				int jxqs=0;
				ls_sql=" SELECT sum(bqyjze)";
				ls_sql+=" FROM rs_gzmxb";
				ls_sql+=" where ssfgs='"+ssfgs+"' and ygbh='"+ygbh+"'";
				ls_sql+=" order by lrsj desc";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				while (rs1.next())
				{
					sqyj+=rs1.getDouble(1);
					jxqs++;

					if (jxqs>=2)
					{
						break;
					}
				}
				rs1.close();
				ps1.close();

				sqyj+=bqyjze;
				sqyj=cf.round(sqyj,2);

				
				//考核工资
				ls_sql=" SELECT khgz";
				ls_sql+=" FROM rs_scbjltcbl";
				ls_sql+=" where fgsbh='"+ssfgs+"'";
				ls_sql+=" and qd<="+bqyjze;
				ls_sql+=" and zd>"+bqyjze;
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					khgz=rs1.getDouble(1);
				}
				rs1.close();
				ps1.close();
			}
		}

		//底薪
		dixin=cf.round(jbgz+gwgz+glgz+jtbt+dhbt+cb+buzhu+khgz,2);

		

		//出勤天数
		ls_sql=" SELECT cqts,sjts,bjts,kgts,cjts,jbts";
		ls_sql+=" FROM rs_cqtjb";
		ls_sql+=" where khzq='"+khzq+"' and ygbh='"+ygbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cqts=rs1.getDouble("cqts");
			sjts=rs1.getDouble("sjts");
			bjts=rs1.getDouble("bjts");
			kgts=rs1.getDouble("kgts");
			cjts=rs1.getDouble("cjts");
			jbts=rs1.getDouble("jbts");
		}
		rs1.close();
		ps1.close();

		//缺勤扣款
		double sjmtkk=0;
		double bjmtkk=0;
		double kgmtkk=0;
		double cjmtkk=0;
		double jbmtbk=0;
		ls_sql=" SELECT sjmtkk,bjmtkk,kgmtkk,cjmtkk,jbmtbk";
		ls_sql+=" FROM rs_kqkkbz";
		ls_sql+=" where ssfgs='"+ssfgs+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjmtkk=rs1.getDouble("sjmtkk");
			bjmtkk=rs1.getDouble("bjmtkk");
			kgmtkk=rs1.getDouble("kgmtkk");
			cjmtkk=rs1.getDouble("cjmtkk");
			jbmtbk=rs1.getDouble("jbmtbk");
		}
		rs1.close();
		ps1.close();

		sjkk=cf.round(-1*sjmtkk*(dixin+yjkhkk)*sjts/qqts,2);
		bjkk=cf.round(-1*bjmtkk*(dixin+yjkhkk)*bjts/qqts,2);
		kgkk=cf.round(-1*kgmtkk*(dixin+yjkhkk)*kgts/qqts,2);
		cjkk=cf.round(-1*cjmtkk*(dixin+yjkhkk)*cjts/qqts,2);
		jbf=cf.round(jbmtbk*(dixin+yjkhkk)*jbts/qqts,2);

		qqkk=cf.round(sjkk+bjkk+kgkk+cjkk,2);

		

		//应发工资
		yfgz=cf.round(jbgz+gwgz+glgz+jtbt+dhbt+cb+buzhu+dxsf  +jxgz   +khgz+yjkhkk  +qqkk+jbf  +kbx +jf+qtkk,2);


		if (zwbm.equals("04"))//04:家装设计师
		{
			//质保金标准
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

			//扣质保金
			if (zbj<zbjfd)
			{
				kzbj=cf.round(yfgz*kzbjbl/100,2);

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
			ls_sql+=" values ( ?,?,?,?,?,TRUNC(SYSDATE),?,?,?,'2' ) ";
			ps1= conn.prepareStatement(ls_sql);
			ps1.setLong(1,xuhao);
			ps1.setString(2,ygbh);
			ps1.setString(3,getyhmc);
			ps1.setDouble(4,-1*kzbj);
			ps1.setString(5,lrr);
			ps1.setString(6,"计算工资");
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

			//员工社保信息
			ls_sql="update sq_yhxx set zbj="+allje;
			ls_sql+=" where ygbh="+ygbh;
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}



		//个税扣税比例
		double gzxx=0;
		double gzsx=0;
		double gsbl=0;//个税比率
		double gdsj=0;//速算扣除数
		ls_sql=" SELECT gzxx,gzsx,gsbl,gdsj";
		ls_sql+=" FROM rs_ksbl";
		ls_sql+=" where ssfgs='"+ssfgs+"'";
		ls_sql+=" and gzxx<="+yfgz;
		ls_sql+=" and gzsx>"+yfgz;
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
	
		//扣个税
		ksk=cf.round(-1*((yfgz-gzxx)*gsbl/100+gdsj),2);
	
		//实发工资
		sfgz=cf.round(yfgz+kzbj+ksk,2);
		
		ls_sql="update rs_gzmxb set khyj=?,cqts=?,sjts=?,bjts=?,kgts=?,cjts=?,jbts=?,sjkk=?,bjkk=?,cjkk=?,kgkk=?,qqkk=?,jbf=?";
		ls_sql+=" ,kbx=?,jf=?,yfgz=?,kzbj=?,ksk=?,sfgz=?,dixin=? ";
		ls_sql+=" ,bqyjze=?,sqyj=?,yjkhkk=?,khgz=?";
		ls_sql+=" where khzq='"+khzq+"' and ssfgs='"+ssfgs+"' and ygbh='"+ygbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDouble(1,khyj);
		ps1.setDouble(2,cqts);
		ps1.setDouble(3,sjts);
		ps1.setDouble(4,bjts);
		ps1.setDouble(5,kgts);
		ps1.setDouble(6,cjts);
		ps1.setDouble(7,jbts);
		ps1.setDouble(8,sjkk);
		ps1.setDouble(9,bjkk);
		ps1.setDouble(10,kgkk);
		ps1.setDouble(11,cjkk);
		ps1.setDouble(12,qqkk);
		ps1.setDouble(13,jbf);

		ps1.setDouble(14,kbx);
		ps1.setDouble(15,jf);
		ps1.setDouble(16,yfgz);
		ps1.setDouble(17,kzbj);
		ps1.setDouble(18,ksk);
		ps1.setDouble(19,sfgz);
		ps1.setDouble(20,dixin);

		ps1.setDouble(21,bqyjze);
		ps1.setDouble(22,sqyj);
		ps1.setDouble(23,yjkhkk);
		ps1.setDouble(24,khgz);
		ps1.executeUpdate();
		ps1.close();
		
	}
	rs.close();
	ps.close();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("计算完成！");
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

</body>
</html>


