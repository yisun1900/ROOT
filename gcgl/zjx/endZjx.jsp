<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String zjxxh=request.getParameter("zjxxh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sfwc="";
	String khbh=null;
	double zjxjme=10;
	double glfjmje=10;
	double sjjmje=10;

	double kqtk=10;
	ls_sql="select sfwc,khbh,zjxjme,glfjmje,sjjmje,kqtk";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
		khbh=rs.getString("khbh");
		zjxjme=rs.getDouble("zjxjme");
		glfjmje=rs.getDouble("glfjmje");
		sjjmje=rs.getDouble("sjjmje");

		kqtk=rs.getDouble("kqtk");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N：未完成；Y：完成
	{
		out.println("错误！增减项已完成，不能再修改");
		return;
	}


	String fgsbh=null;
	String bjjb = null;
	ls_sql="select fgsbh,bjjb";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=rs.getString("fgsbh");
		bjjb=rs.getString("bjjb");
	}
	rs.close();
	ps.close();

	String lx="";
	ls_sql="select lx";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" where bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lx=rs.getString("lx");
	}
	rs.close();
	ps.close();


	double jxglfbfb=0;
	ls_sql="select jxglfbfb";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jxglfbfb=rs.getDouble("jxglfbfb");//减项扣管理费百分比
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  bj_khzctcmxh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and cpbm is null ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("错误！主材套餐中多选一项目，未选择型号");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_zjxdj set sfwc='Y'";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();



	//工程超量加价
	double gccljj=0;

	String xmbh =null;
	String sfxzsl =null;
	double bzsl=0;
	double ccbfjj=0;
	ls_sql="SELECT bj_khgcxmxjh.xmbh,bj_khgcxmxjh.bzsl,bj_khgcxmxjh.sfxzsl,bj_bjxmmxh.zqdj";
	ls_sql+=" from  bj_khgcxmxjh,bj_bjxmmxh";
	ls_sql+=" where bj_khgcxmxjh.zjxxh=bj_bjxmmxh.zjxxh and bj_khgcxmxjh.xmbh=bj_bjxmmxh.xmbh ";
    ls_sql+=" and bj_khgcxmxjh.zjxxh='"+zjxxh+"' and bj_khgcxmxjh.tcnxmbz='Y'";//套餐内项目标志
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


		double xjjsl=0;//加价数量

		if (sfxzsl.equals("1"))//1：可增项；2：不可增项；3：不控制
		{
			if (sjsl>bzsl)
			{
				xjjsl=sjsl-bzsl;
			}
			else{
				xjjsl=0;
			}
		}
		else if (sfxzsl.equals("2"))//1：可增项；2：不可增项；3：不控制
		{
			if (sjsl>bzsl)
			{
//				out.println("<BR>错误！项目编号『"+xmbh+"』不可增项，[实际数量："+sjsl+"]超出[标准数量："+bzsl+"]");
			}
		}


		ls_sql="update bj_khgcxmxjh set sjsl="+sjsl+",xjjsl="+xjjsl;
		ls_sql+=" where zjxxh='"+zjxxh+"' and xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		gccljj+=ccbfjj*xjjsl;
		gccljj=cf.round(gccljj,2);

	}
	rs.close();
	ps.close();

	
	
	//获取最新工程总价＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始

	//初始化
	dzbj.Zjx zjx=new dzbj.Zjx();
	//更新报价折扣
	zjx.updateZjxBjZkl(conn,khbh,zjxxh,"yz");
	//更新其它收费项目，调整收费百分比
	zjx.updateZjxSfxm(conn,khbh,zjxxh,"yz");


	double gczxzq=zjx.getZqGcZx(conn,khbh,zjxxh,"yz");//工程增项－折前
	double gczxzh=zjx.getZhGcZx(conn,khbh,zjxxh,"yz");//工程增项－折后

	double gcjxzq=zjx.getZqGcJx(conn,khbh,zjxxh,"yz");//工程减项－折前
	double gcjxzh=zjx.getZhGcJx(conn,khbh,zjxxh,"yz");//工程减项－折后


	double zjje=zjx.getZqZjxGcf(conn,khbh,zjxxh,"yz");//增减工程费－折前
	double jzjje=zjx.getZhZjxGcf(conn,khbh,zjxxh,"yz");//增减工程费－折后



	double zqsdlzjx=zjx.getZqSdlZjx(conn,khbh,zjxxh,"yz");//水电路增减项－折前
	double zhsdlzjx=zjx.getZhSdlZjx(conn,khbh,zjxxh,"yz");//水电路增减项－折后





	double zqqtsf=0;//记入业绩其它费－折前
	double zhqtsf=0;//记入业绩其它费－折后
	String qtsfsm=null;//记入业绩其它费项目
	double zqwjrqyexm=0;//不记入业绩其它费－折前
	double zhwjrqyexm=0;//不记入业绩其它费－折后
	String wjrqyexmsm=null;//不记入业绩其它费项目

	zqqtsf=zjx.getZjxZqJrQtsf(conn,khbh,zjxxh,"yz");//记入业绩其它费－折前，不包括税金、管理费、设计费
	zhqtsf=zjx.getZjxZhJrQtsf(conn,khbh,zjxxh,"yz");//记入业绩其它费－折后，不包括税金、管理费、设计费
	qtsfsm=zjx.getZjxJrQtsfsm(conn,khbh,zjxxh,"yz");//记入业绩其它费项目，不包括税金、管理费、设计费

	zqwjrqyexm=zjx.getZjxZqWjrJe(conn,khbh,zjxxh,"yz");//不记入业绩其它费－折前，不包括税金、管理费、设计费
	zhwjrqyexm=zjx.getZjxZhWjrJe(conn,khbh,zjxxh,"yz");//不记入业绩其它费－折后，不包括税金、管理费、设计费
	wjrqyexmsm=zjx.getZjxWjrJeMc(conn,khbh,zjxxh,"yz");//不记入业绩其它费项目，不包括税金、管理费、设计费

	double zqsjf=zjx.getZqZJxSjf(conn,khbh,zjxxh,"yz");//设计费－折前
	double zhsjf=zjx.getZhZJxSjf(conn,khbh,zjxxh,"yz");//设计费－折后

	double zqguanlif=zjx.getZjxZqGlf(conn,khbh,zjxxh,"yz");//折前-增减项管理费
	double zhguanlif=zjx.getZjxZhGlf(conn,khbh,zjxxh,"yz");//折后-增减项管理费

	double zqzjxsuijin=zjx.getZjxZqSuijin(conn,khbh,zjxxh,"yz");//折前-增减项税金
	double zjxsuijin=zjx.getZjxZhSuijin(conn,khbh,zjxxh,"yz");  //折后-增减项税金

	double kglf=zjx.getKglf(conn,khbh,zjxxh,"yz");//减项扣管理费=折前工程减项（非净减项）*减项扣管理费百分比（sq_dwxx设置）
	double zjxrzf=zjx.getZjxRzf(conn,khbh,zjxxh,"yz");//增减项认证费=折后工程减项（非净减项）*认证费百分比（签单登记录入）
	double zjxdjjje=zjx.getZjxDjjje(conn,khbh,zjxxh,"yz");//本次增减项代金券＝折前净减项*代金券百分比（签单登记录入）



	double zqzjze=0;//增减总额－折前
	double zhzjze=0;//增减总额－折后
	zqzjze= zjje+zqguanlif+zqzjxsuijin+zqsjf+zqqtsf+zqwjrqyexm+zjxrzf+zjxdjjje+kglf+kqtk;
	zhzjze=jzjje+zhguanlif+zjxsuijin+zhsjf  +zhqtsf+zhwjrqyexm+zjxrzf+zjxdjjje+kglf+kqtk;

	double zxcbj=zjx.getCbj(conn,khbh,zjxxh,"yz");//成本价＝工程项成本价＋其它项成本（不含：管理费、税金）
	double zxgcjcbj=zjx.getGcjcbj(conn,khbh,zjxxh,"yz");//工程基础报价＝工程项工程基础报价＋其它项工程基础报价（不含：管理费、税金）

	double zxhtjz=zjx.getHtjz(conn,khbh,zjxxh,"yz");//合同净值＝工程费＋记入业绩其它费（包括所有记入项）－赠送净值－赠送代金券
	double zxsgcbj=zjx.getSgcbj(conn,khbh,zjxxh,"yz");//施工成本价＝工程项施工成本价＋其它项施工成本（不含：管理费、税金）
	double zxmle=cf.round(zxhtjz-zxsgcbj,2);//毛利额=合同净值－施工成本价
	double zxmll=cf.round(zxmle/zxhtjz*100,2);//毛利率＝毛利额÷合同净值
	
	double yjjzcs=0;//业绩净值参数
	double mll=0;//合同毛利率
	ls_sql="SELECT yjjzcs,mll";
	ls_sql+=" FROM crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yjjzcs=rs.getDouble(1);
		mll=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	double zxyjjz=zjx.getYjjz(conn,khbh,zjxxh,"yz");//业绩净值
	zxyjjz=cf.round(zxyjjz*100/yjjzcs,2);//业绩净值=毛利额÷核算净值参数

	String kzdzfs="";
	double zdmll=0;
	double zdzkl=0;
	ls_sql="SELECT kzdzfs,zkl,zdmll";
	ls_sql+=" FROM sq_yhxx";
    ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kzdzfs=cf.fillNull(rs.getString("kzdzfs"));
		zdzkl=rs.getDouble("zkl");//最低折扣
		zdmll=rs.getDouble("zdmll");//签单最低毛利率
	}
	rs.close();
	ps.close();



	//增减项发生额
	ls_sql="update crm_zjxdj set zjje=?,jzjje=?,zqguanlif=?,zhguanlif=?,zqzjxsuijin=?,zjxsuijin=?,shbz='M'";//N：未审核；Y：审核；M：不需审核
	ls_sql+=" ,gczxzq=?,gcjxzq=?,gczxzh=?,gcjxzh=?,kglf=?,zjxrzf=?,zjxdjjje=?";
	ls_sql+=" ,zqzjze=?,zhzjze=?  ,zqqtsf=?,zhqtsf=?,qtsfsm=?  ,zqwjrqyexm=?,zhwjrqyexm=?,wjrqyexmsm=?,zqsjf=?,zhsjf=?";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zjje);
	ps.setDouble(2,jzjje);
	ps.setDouble(3,zqguanlif);
	ps.setDouble(4,zhguanlif);
	ps.setDouble(5,zqzjxsuijin);
	ps.setDouble(6,zjxsuijin);

	ps.setDouble(7,gczxzq);
	ps.setDouble(8,gcjxzq);
	ps.setDouble(9,gczxzh);
	ps.setDouble(10,gcjxzh);

	ps.setDouble(11,kglf);
	ps.setDouble(12,zjxrzf);
	ps.setDouble(13,zjxdjjje);

	ps.setDouble(14,zqzjze);
	ps.setDouble(15,zhzjze);

	ps.setDouble(16,zqqtsf);
	ps.setDouble(17,zhqtsf);
	ps.setString(18,qtsfsm);

	ps.setDouble(19,zqwjrqyexm);
	ps.setDouble(20,zhwjrqyexm);
	ps.setString(21,wjrqyexmsm);

	ps.setDouble(22,zqsjf);
	ps.setDouble(23,zhsjf);

	ps.executeUpdate();
	ps.close();

	double tcwsgzj=0;
	double tcwgccljj=0;
	double tcsgze=0;

	if (lx.equals("2"))//1：非套餐；2：套餐
	{
		dzbj.Tc tc=new dzbj.Tc();

		tcwsgzj=tc.getSgzjH(conn,zjxxh,khbh,"yz");//获取:套餐外施工项造价
		tcwgccljj=tc.getGccljjH(conn,zjxxh,khbh,"yz");//获取:工程超量加价
		tcsgze=tc.getSgzeH(conn,zjxxh,khbh,"yz");//获取:施工总额

		ls_sql=" update crm_tckhqyeh set tcwsgzj=?,tcwgccljj=?,tcsgze=?";
		ls_sql+=" where  zjxxh='"+zjxxh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,tcwsgzj);
		ps.setDouble(2,tcwgccljj);
		ps.setDouble(3,tcsgze);
		ps.executeUpdate();
		ps.close();

		
		tcwsgzj=tc.getSgzjZjx(conn,zjxxh,khbh,"yz");//获取:套餐外施工项造价
		tcwgccljj=tc.getGccljjZjx(conn,zjxxh,khbh,"yz");//获取:工程超量加价
		tcsgze=tc.getSgzeZjx(conn,zjxxh,khbh,"yz");//获取:施工总额

		ls_sql=" insert into crm_zjxtckhqye (zjxxh,khbh,tcbzjg,tcmjzjje,tczcsjcj,tczccljj,tcxsfzc,tczcjm,tcdpsj,tcdpdlsf,tcxpx,tcwsgzj,tcwgccljj,tcwzjzc,tcsgze,tcqtsf,zctcje,wntcje,jytcje,sctcje,jktcje)  ";
		ls_sql+=" values ( ?,?   ,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,zjxxh);
		ps.setString(2,khbh);
		ps.setDouble(3,0);
		ps.setDouble(4,0);
		ps.setDouble(5,0);
		ps.setDouble(6,0);
		ps.setDouble(7,0);
		ps.setDouble(8,0);
		ps.setDouble(9,0);
		ps.setDouble(10,0);
		ps.setDouble(11,0);
		ps.setDouble(12,tcwsgzj);
		ps.setDouble(13,tcwgccljj);
		ps.setDouble(14,0);
		ps.setDouble(15,tcsgze);
		ps.setDouble(16,0);
		ps.setDouble(17,0);
		ps.setDouble(18,0);
		ps.setDouble(19,0);
		ps.setDouble(20,0);
		ps.setDouble(21,0);
		ps.executeUpdate();
		ps.close();
	}


	String isShbz="N";//是否需审核

	if (kzdzfs.equals("1"))//1：控制毛利率；2：控制折扣
	{
		if (zxmll<zdmll || zxmll>100)//超过权限
		{
			if ((mll-zxmll)>1)//毛利降低一个点
			{
				isShbz="Y";//需审核
			}
		}

	}

	if (isShbz.equals("Y"))//需审核
	{
		ls_sql="update crm_zjxdj set shbz='N'";//N：未审核；Y：审核；M：不需审核
		ls_sql+=" where  zjxxh='"+zjxxh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		out.println("提醒！经系统核算不通过请上级审批");
	}
	else{//不需审核，汇总
		//更新增减项汇总信息＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		double allzjxje=0;
		double alljzjje=0;
		double allzqzjxsuijin=0;
		double allzjxsuijin=0;
		double allzqguanlif=0;
		double allzhguanlif=0;
		double allkglf=0;
		double allkqtk=0;
		double allzjxrzf=0;
		double allzjxdjjje=0;

		double zqljzjx=0;
		double zhljzjx=0;
		double zqqtsfzjx=0;
		double zhqtsfzjx=0;
		double zqwjrzjx=0;
		double zhwjrzjx=0;
		double zqsjfzjx=0;
		double zhsjfzjx=0;
		
		ls_sql="select sum(zjje),sum(jzjje),sum(zqzjxsuijin),sum(zjxsuijin),sum(zqguanlif),sum(zhguanlif),sum(kglf),sum(kqtk),sum(zjxrzf)";
		ls_sql+=" ,sum(zqzjze),sum(zhzjze),sum(zqqtsf),sum(zhqtsf),sum(zqwjrqyexm),sum(zhwjrqyexm),sum(zqsjf),sum(zhsjf),sum(zjxdjjje)";
		ls_sql+=" from  crm_zjxdj";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and sfwc='Y'";//N：未完成；Y：已完成
		ls_sql+=" and (shbz='Y' OR shbz='M') ";//N：未审核；Y：审核通过；S：审核未通过；M：不需审核 
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			allzjxje=rs.getDouble(1);
			alljzjje=rs.getDouble(2);
			allzqzjxsuijin=rs.getDouble(3);
			allzjxsuijin=rs.getDouble(4);
			allzqguanlif=rs.getDouble(5);
			allzhguanlif=rs.getDouble(6);
			allkglf=rs.getDouble(7);
			allkqtk=rs.getDouble(8);
			allzjxrzf=rs.getDouble(9);

			zqljzjx=rs.getDouble(10);
			zhljzjx=rs.getDouble(11);
			zqqtsfzjx=rs.getDouble(12);
			zhqtsfzjx=rs.getDouble(13);
			zqwjrzjx=rs.getDouble(14);
			zhwjrzjx=rs.getDouble(15);
		
			zqsjfzjx=rs.getDouble(16);
			zhsjfzjx=rs.getDouble(17);
			allzjxdjjje=rs.getDouble(18);
		
		}
		rs.close();
		ps.close();


		ls_sql="update crm_khxx set zjxje=?,zhzjxje=?,zqzjxsuijin=?,zjxsuijin=?,zqzjxguanlif=?,zjxguanlif=?,kglf=?,kqtk=?";
		ls_sql+=" ,zqljzjx=?,zhljzjx=?,zqqtsfzjx=?,zhqtsfzjx=?,zqwjrzjx=?,zhwjrzjx=?,zqsjfzjx=?,zhsjfzjx=?";
		ls_sql+=" ,qtsfsm=?,wjrqyexmsm=?";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,allzjxje);
		ps.setDouble(2,alljzjje);
		ps.setDouble(3,allzqzjxsuijin);
		ps.setDouble(4,allzjxsuijin);
		ps.setDouble(5,allzqguanlif);
		ps.setDouble(6,allzhguanlif);
		ps.setDouble(7,allkglf);
		ps.setDouble(8,allkqtk);

		ps.setDouble(9,zqljzjx);
		ps.setDouble(10,zhljzjx);
		ps.setDouble(11,zqqtsfzjx);
		ps.setDouble(12,zhqtsfzjx);
		ps.setDouble(13,zqwjrzjx);
		ps.setDouble(14,zhwjrzjx);
		ps.setDouble(15,zqsjfzjx);
		ps.setDouble(16,zhsjfzjx);

		ps.setString(17,qtsfsm);
		ps.setString(18,wjrqyexmsm);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_khqye set zjxrzf=?,zjxdjjje=?,zxcbj=?,zxgcjcbj=?,zxsgcbj=?,zxhtjz=?,zxmle=?,zxmll=?,zxyjjz=?";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,allzjxrzf);
		ps.setDouble(2,allzjxdjjje);
		ps.setDouble(3,zxcbj);
		ps.setDouble(4,zxgcjcbj);
		ps.setDouble(5,zxsgcbj);
		ps.setDouble(6,zxhtjz);
		ps.setDouble(7,zxmle);
		ps.setDouble(8,zxmll);
		ps.setDouble(9,zxyjjz);
		ps.executeUpdate();
		ps.close();

		ls_sql=" update cw_qmjzmx set zjxje=?,zhzjxje=?,zqzjxsuijin=?,zjxsuijin=?,zqzjxguanlif=?,zjxguanlif=?,kglf=?,kqtk=?";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,allzjxje);
		ps.setDouble(2,alljzjje);
		ps.setDouble(3,allzqzjxsuijin);
		ps.setDouble(4,allzjxsuijin);
		ps.setDouble(5,allzqguanlif);
		ps.setDouble(6,allzhguanlif);
		ps.setDouble(7,allkglf);
		ps.setDouble(8,allkqtk);
		ps.executeUpdate();
		ps.close();


		if (lx.equals("2"))//1：非套餐；2：套餐
		{
			tcwsgzj=0;
			tcwgccljj=0;
			tcsgze=0;
			
			ls_sql="select sum(tcwsgzj),sum(tcwgccljj),sum(tcsgze) ";
			ls_sql+=" from  crm_zjxtckhqye,crm_zjxdj";
			ls_sql+=" where crm_zjxtckhqye.zjxxh=crm_zjxdj.zjxxh and crm_zjxtckhqye.khbh='"+khbh+"'";
			ls_sql+=" and crm_zjxdj.sfwc='Y'";//N：未完成；Y：已完成
			ls_sql+=" and (crm_zjxdj.shbz='Y' OR crm_zjxdj.shbz='M') ";//N：未审核；Y：审核通过；S：审核未通过；M：不需审核 
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				tcwsgzj=rs.getDouble(1);
				tcwgccljj=rs.getDouble(2);
				tcsgze=rs.getDouble(3);
			}
			rs.close();
			ps.close();

		
			ls_sql=" update crm_tckhqye set tcwsgzjzjx=?,tcwgccljjzjx=?,tcsgzezjx=? ";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,tcwsgzj);
			ps.setDouble(2,tcwgccljj);
			ps.setDouble(3,tcsgze);
			ps.executeUpdate();
			ps.close();

		}
		
		
		//更新增减项汇总信息＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝完成

	}


	
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>