<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String xgjlh=request.getParameter("xgjlh");
String khbh=request.getParameter("khbh");
String khxm=cf.GB2Uni(request.getParameter("khxm"));
String fgsbh=request.getParameter("fgsbh");

String xgqcxhd=cf.GB2Uni(request.getParameter("xgqcxhd"));
String xgqcxhdbmxq=cf.GB2Uni(request.getParameter("xgqcxhdbmxq"));
String xgqcxhdbmzh=cf.GB2Uni(request.getParameter("xgqcxhdbmzh"));

String xghcxhd=cf.GB2Uni(request.getParameter("xghcxhd"));
String xghcxhdbmxq=cf.GB2Uni(request.getParameter("xghcxhdbmxq"));
String xghcxhdbmzh=cf.GB2Uni(request.getParameter("xghcxhdbmzh"));

String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	double suijinbfb=0;
	double zjxzkl=0;
	double wdzgce=0;
	double cdzwjmje=0;
	double glfjmje=0;
	double sjjmje=0;
	double xgqqye=0;
	double xgqguanlif=0;
	double xgqsuijin=0;
	int xgqpmjj=0;
	int fwmj=0;
	String xgqzxjwbm=null;
	String ssfgs=null;
	ls_sql="select fgsbh,suijinbfb,zjxzkl,wdzgce,cdzwjmje,glfjmje,sjjmje,qye,guanlif,suijin,pmjj,zxjwbm,fwmj";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=rs.getString("fgsbh");
		suijinbfb=rs.getDouble("suijinbfb");
		zjxzkl=rs.getDouble("zjxzkl");
		wdzgce=rs.getDouble("wdzgce");
		cdzwjmje=rs.getDouble("cdzwjmje");
		glfjmje=rs.getDouble("glfjmje");
		sjjmje=rs.getDouble("sjjmje");
		xgqqye=rs.getDouble("qye");
		xgqguanlif=rs.getDouble("guanlif");
		xgqsuijin=rs.getDouble("suijin");
		xgqpmjj=rs.getInt("pmjj");
		xgqzxjwbm=rs.getString("zxjwbm");
		fwmj=rs.getInt("fwmj");
	}
	rs.close();
	ps.close();
	
	/*检查促销活动是否可共享＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始*/
	String kgxqthd="";
	if (!xghcxhd.equals(""))
	{
		ls_sql="select kgxqthd";
		ls_sql+=" from  jc_cxhd";
		ls_sql+=" where cxhdmc ='"+xghcxhd+"' and fgsbh='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			kgxqthd=rs.getString(1);
		}
		rs.close();
		ps.close();

		if (kgxqthd.equals("1"))//1：不可共享；2：可共享
		{
			if (!xghcxhdbmxq.equals("") || !xghcxhdbmzh.equals(""))
			{
				out.println("<BR>错误！！！公司促销活动["+xghcxhd+"]不可共享其它活动");
				return;
			}
		}
	}

	if (!xghcxhdbmxq.equals(""))
	{
		ls_sql="select kgxqthd";
		ls_sql+=" from  jc_cxhd";
		ls_sql+=" where cxhdmc ='"+xghcxhdbmxq+"' and fgsbh='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			kgxqthd=rs.getString(1);
		}
		rs.close();
		ps.close();

		if (kgxqthd.equals("1"))//1：不可共享；2：可共享
		{
			if ( (!xghcxhd.equals("无活动") && !xghcxhd.equals("")) || !xghcxhdbmzh.equals(""))
			{
				out.println("<BR>错误！！！小区促销活动["+xghcxhdbmxq+"]不可共享其它活动");
				return;
			}
		}
	}

	if (!xghcxhdbmzh.equals(""))
	{
		ls_sql="select kgxqthd";
		ls_sql+=" from  jc_cxhd";
		ls_sql+=" where cxhdmc ='"+xghcxhdbmzh+"' and fgsbh='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			kgxqthd=rs.getString(1);
		}
		rs.close();
		ps.close();

		if (kgxqthd.equals("1"))//1：不可共享；2：可共享
		{
			if ((!xghcxhd.equals("无活动") && !xghcxhd.equals("")) || !xghcxhdbmxq.equals(""))
			{
				out.println("<BR>错误！！！展会促销活动["+xghcxhdbmzh+"]不可共享其它活动");
				return;
			}
		}
	}
	/*检查促销活动是否可共享=====================================结束*/

	//获取合同净值：合同净值＝工程费＋其它费（包括所有项）－活动赠送净值－特权赠送净值－赠送代金券
	dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();
	double htjz=dzbjje.getHtjz(conn,khbh,"yz");//合同净值
	if (htjz<0)
	{
		out.println("错误！合同净值为负值："+htjz);
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_zxkhxx set cxhdbm=?,cxhdbmxq=?,cxhdbmzh=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xghcxhd);
	ps.setString(2,xghcxhdbmxq);
	ps.setString(3,xghcxhdbmzh);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_khxx set cxhdbm=?,cxhdbmxq=?,cxhdbmzh=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xghcxhd);
	ps.setString(2,xghcxhdbmxq);
	ps.setString(3,xghcxhdbmzh);
	ps.executeUpdate();
	ps.close();

	double yjjzcs=0;//业绩净值参数
	ls_sql="SELECT yjjzcs";
	ls_sql+=" FROM crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yjjzcs=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	dzbj.Tzk tzk=new dzbj.Tzk();
	//根据促销活动，更新客户折扣
	tzk.updateHdZkl(conn,khbh,"yz");
	//更新报价折扣
	tzk.updateBjZkl(conn,khbh,"yz");

	//更新其它收费项目，调整收费百分比
	dzbj.NewDzbj newdzbj=new dzbj.NewDzbj();
	newdzbj.updateSfxm(conn,khbh,"yz");

	//获取电子报价金额
	double dzbjze=dzbjje.getAllBjje(conn,khbh,"yz");


	//修改：电子报价总额
	ls_sql="update crm_zxkhxx set dzbjze=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.executeUpdate();
	ps.close();
	

	//修改合同金额＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	//取电子报价数据＋＋＋＋＋＋＋＋＋开始
	double qye=0;
	double suijin=0;
	double guanlif=0;
	double zhgczjf=0;
	double zhqtsf=0;
	double zhwjrqyexm=0;
	double sjf=0;
	double zkl=0;

	double hdzsjz=0;
	double djjje=0;
	double djjbfb=0;
//	double htjz=0;
	double sgcbj=0;
	double mle=0;
	double mll=0;
	double yjjz=0;
	double cbj=0;
	double gcjcbj=0;

	qye=dzbjje.getZhBjje(conn,khbh,"sxyd")-sjjmje-glfjmje-cdzwjmje;//获取『折后』电子报价金额，直接费＋其它收费

	suijin=dzbjje.getZhSuijinJe(conn,khbh,"yz");//获取折后『税金金额』

	guanlif=dzbjje.getZhGlfJe(conn,khbh,"yz")-glfjmje;//获取折后『管理费金额』

	zhgczjf=dzbjje.getZhGczjf(conn,khbh,"yz")-cdzwjmje;//工程直接费－折后

	zhqtsf=dzbjje.getZhJrQtsf(conn,khbh,"yz");//记入业绩其它费－折后，不包括税金、管理费、设计费

	zhwjrqyexm=dzbjje.getZhWjrJe(conn,khbh);//获取折后『不记入业绩其它费』，不包括税金、管理费、设计费

	sjf=dzbjje.getZhSjf(conn,khbh);//获取折后『设计费』


	if (wdzgce!=0)
	{
		zkl=cf.round(qye*10/wdzgce,2);
	}
	else{
		zkl=10;
	}


	hdzsjz=dzbjje.getZsjz(conn,khbh);//活动赠送净值+特权赠送净值


	djjje=dzbjje.getHtDjj(conn,khbh,"yz");//代金券金额
	djjbfb=dzbjje.getDjjbfb(conn,khbh,"yz");//代金券百分比


	htjz=dzbjje.getHtjz(conn,khbh,"yz");//合同净值＝工程费＋记入业绩其它费（包括所有记入项）－赠送净值－赠送代金券

	sgcbj=dzbjje.getSgcbj(conn,khbh,"yz");//施工成本价＝工程项施工成本价＋其它项施工成本（不含：管理费、税金）
	
	mle=cf.round(htjz-sgcbj,2);//毛利额=合同净值－施工成本价
	mll=cf.round(mle/htjz*100,2);//毛利率＝毛利额÷合同净值

	yjjz=cf.round((mle-zhwjrqyexm)*100/yjjzcs,2);//业绩净值=毛利额÷核算净值参数

	cbj=dzbjje.getCbj(conn,khbh,"yz");//成本价＝工程项成本价＋其它项成本（不含：管理费、税金）
	gcjcbj=dzbjje.getGcjcbj(conn,khbh,"yz");//工程基础报价＝工程项工程基础报价＋其它项工程基础报价（不含：管理费、税金）

	//取电子报价数据===============结束



	String zxjwbm=null;
	ls_sql="select zxjwbm";
	ls_sql+=" from  dm_zxjwbm";
	ls_sql+=" where  qd<"+qye+" and "+qye+"<=zd";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zxjwbm=rs.getString("zxjwbm");
	}
	rs.close();
	ps.close();

	int pmjj=0;
	if (fwmj==0)
	{
		pmjj=0;
	}
	else{
		pmjj=(int)qye/fwmj;
	}

	//更新：客户信息
	ls_sql="update crm_khxx ";
	ls_sql+=" set zkl=?,qye=?,zhgczjf=?,guanlif=?,suijin=?,sjf=?,zhwjrqyexm=?,zhqtsf=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zkl);
	ps.setDouble(2,qye);
	ps.setDouble(3,zhgczjf);
	ps.setDouble(4,guanlif);
	ps.setDouble(5,suijin);
	ps.setDouble(6,sjf);
	ps.setDouble(7,zhwjrqyexm);
	ps.setDouble(8,zhqtsf);
	ps.executeUpdate();
	ps.close();

	
	ls_sql=" update crm_khqye set hdzsjz=?,djjje=?,djjbfb=?,htjz=?,sgcbj=?,mle=?,mll=?,yjjz=?,cbj=?,gcjcbj=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setDouble(1,hdzsjz);
	ps.setDouble(2,djjje);
	ps.setDouble(3,djjbfb);
	ps.setDouble(4,htjz);
	ps.setDouble(5,sgcbj);
	ps.setDouble(6,mle);
	ps.setDouble(7,mll);
	ps.setDouble(8,yjjz);
	ps.setDouble(9,cbj);
	ps.setDouble(10,gcjcbj);
	ps.executeUpdate();
	ps.close();

	//修改合同金额＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束



	//修改增减项＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始

	String zjxxh=null;
	String lx=null;
	double gczxzq=0;
	double gcjxzq=0;
	double zjje=0;
	double zqsdlzjx=0;
	double zqqtsf=0;
	double zqwjrqyexm=0;
	double zqsjf=0;
	double zqguanlif=0;
	double zqzjxsuijin=0;
	double zjxrzf=0;
	double zjxdjjje=0;
	double kglf=0;
	double kqtk=0;

	double zxcbj=cbj;
	double zxgcjcbj=gcjcbj;
	double zxsgcbj=sgcbj;

	double zxhtjz=htjz;
	double zxmle=mle;
	double zxmll=mll;
	double zxyjjz=yjjz;

	ls_sql="select zjxxh,lx";
	ls_sql+=" ,gczxzq,gcjxzq,zjje,zqsdlzjx,zqqtsf,zqwjrqyexm,zqsjf,zqguanlif,zqzjxsuijin,zjxrzf,zjxdjjje,kglf,kqtk";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by zjxxh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		zjxxh=rs1.getString("zjxxh");
		lx=cf.fillNull(rs1.getString("lx"));
		gczxzq=rs1.getDouble("gczxzq");
		gcjxzq=rs1.getDouble("gcjxzq");
		zjje=rs1.getDouble("zjje");
		zqsdlzjx=rs1.getDouble("zqsdlzjx");
		zqqtsf=rs1.getDouble("zqqtsf");
		zqwjrqyexm=rs1.getDouble("zqwjrqyexm");
		zqsjf=rs1.getDouble("zqsjf");
		zqguanlif=rs1.getDouble("zqguanlif");
		zqzjxsuijin=rs1.getDouble("zqzjxsuijin");
		zjxrzf=rs1.getDouble("zjxrzf");
		zjxdjjje=rs1.getDouble("zjxdjjje");
		kglf=rs1.getDouble("kglf");
		kqtk=rs1.getDouble("kqtk");

		if (lx.equals("2"))//1：工程增减项；2：工程增减项无明细；3：套餐退补货；4：套餐调换产品
		{
			//客户折扣
			String zklx="";//折扣类型  1：整单打折；2：单项打折；3：部分费用打折
			double zdzk=10;//整单折扣
			double gcfqdzk=10;//工程费签单折扣
			double glfzk=10;//管理费折扣
			double sjzk=10;//税金折扣
			double sjfzk=10;//设计费折扣
			double qtsfxmzk=10;//其它收费项目折扣
			String zjxzklx="";//增减项折扣 1：同合同；2：独立折扣

			//客户增减项折扣
			double gczjxfzk=10;
			double glfzjxzk=10;
			double sjzjxzk=10;
			double sjfzjxzk=10;
			double qtsfxmzjxzk=10;

			ls_sql="select zklx,zdzk,gcfqdzk,glfzk,sjzk,sjfzk,qtsfxmzk,zjxzklx";
			ls_sql+=" from crm_khzk";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zklx=cf.fillNull(rs.getString("zklx"));
				zdzk=rs.getDouble("zdzk");
				gcfqdzk=rs.getDouble("gcfqdzk");
				glfzk=rs.getDouble("glfzk");
				sjzk=rs.getDouble("sjzk");
				sjfzk=rs.getDouble("sjfzk");
				qtsfxmzk=rs.getDouble("qtsfxmzk");
				zjxzklx=cf.fillNull(rs.getString("zjxzklx"));
			}
			rs.close();
			ps.close();


			if (zjxzklx.equals("1"))//增减项折扣 1：同合同；2：独立折扣
			{
				if (zklx.equals("1"))//折扣类型  1：整单打折；2：单项打折；3：部分费用打折
				{
					gczjxfzk=zdzk;//整单折扣
					glfzjxzk=zdzk;
					sjzjxzk=zdzk;
					sjfzjxzk=zdzk;
					qtsfxmzjxzk=zdzk;
				}
				else{//折扣类型 2：单项打折；3：部分费用打折

					gczjxfzk=gcfqdzk;//工程费签单折扣
					glfzjxzk=glfzk;//管理费折扣
					sjzjxzk=sjzk;//税金折扣
					sjfzjxzk=sjfzk;//设计费折扣
					qtsfxmzjxzk=qtsfxmzk;//其它收费项目折扣
				}
			}
			else{//增减项折扣  2：独立折扣
				ls_sql="select gczjxfzk,glfzjxzk,sjzjxzk,sjfzjxzk,qtsfxmzjxzk ";
				ls_sql+=" from crm_khzjxzk";
				ls_sql+=" where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					gczjxfzk=rs.getDouble("gczjxfzk");
					glfzjxzk=rs.getDouble("glfzjxzk");
					sjzjxzk=rs.getDouble("sjzjxzk");
					sjfzjxzk=rs.getDouble("sjfzjxzk");
					qtsfxmzjxzk=rs.getDouble("qtsfxmzjxzk");
				}
				rs.close();
				ps.close();
			}


			
			double gczxzh=gczxzq*gczjxfzk/10;//工程增项－折后
			double gcjxzh=gcjxzq*gczjxfzk/10;//工程减项－折后
			double jzjje=zjje*gczjxfzk/10;//增减工程费－折后
			double zhsdlzjx=zqsdlzjx*gczjxfzk/10;//水电路增减项－折后
			zhqtsf=zqqtsf*qtsfxmzjxzk/10;//记入业绩其它费－折后，不包括税金、管理费、设计费
			zhwjrqyexm=zqwjrqyexm*qtsfxmzjxzk/10;//不记入业绩其它费－折后，不包括税金、管理费、设计费
			double zhsjf=zqsjf*sjfzjxzk/10;//设计费－折后
			double zhguanlif=zqguanlif*glfzjxzk/10;//折后-增减项管理费
			double zjxsuijin=zqzjxsuijin*sjzjxzk/10;  //折后-增减项税金

			double zhzjze=0;//增减总额－折后
			zhzjze=jzjje+zhguanlif+zjxsuijin+zhsjf  +zhqtsf+zhwjrqyexm+zjxrzf+zjxdjjje+kglf+kqtk;
			

			//增减项发生额
			ls_sql="update crm_zjxdj set jzjje=?,zhguanlif=?,zjxsuijin=?";
			ls_sql+=" ,gczxzh=?,gcjxzh=?,zjxdjjje=?";
			ls_sql+=" ,zhzjze=?  ,zhqtsf=?  ,zhwjrqyexm=?,zhsjf=?";
			ls_sql+=" where  zjxxh='"+zjxxh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,jzjje);
			ps.setDouble(2,zhguanlif);
			ps.setDouble(3,zjxsuijin);
			ps.setDouble(4,gczxzh);
			ps.setDouble(5,gcjxzh);
			ps.setDouble(6,zjxdjjje);
			ps.setDouble(7,zhzjze);
			ps.setDouble(8,zhqtsf);
			ps.setDouble(9,zhwjrqyexm);
			ps.setDouble(10,zhsjf);
			ps.executeUpdate();
			ps.close();
		}
		else
		{
			//初始化
			dzbj.Zjx zjx=new dzbj.Zjx();
			//更新变更前报价折扣
			zjx.updateZjxBjZklZjxQ(conn,khbh,zjxxh,"yz");
			//更新变更前其它收费项目，调整收费百分比
			zjx.updateZjxSfxmZjxQ(conn,khbh,zjxxh,"yz");

			//更新变更后报价折扣
			zjx.updateZjxBjZkl(conn,khbh,zjxxh,"yz");
			//更新变更后其它收费项目，调整收费百分比
			zjx.updateZjxSfxm(conn,khbh,zjxxh,"yz");


			double gczxzh=zjx.getZhGcZx(conn,khbh,zjxxh,"yz");//工程增项－折后

			double gcjxzh=zjx.getZhGcJx(conn,khbh,zjxxh,"yz");//工程减项－折后

			double jzjje=zjx.getZhZjxGcf(conn,khbh,zjxxh,"yz");//增减工程费－折后

			double zhsdlzjx=zjx.getZhSdlZjx(conn,khbh,zjxxh,"yz");//水电路增减项－折后

	//		double zhwjrqyexm=0;//不记入业绩其它费－折后

			zhqtsf=zjx.getZjxZhJrQtsf(conn,khbh,zjxxh,"yz");//记入业绩其它费－折后，不包括税金、管理费、设计费

			zhwjrqyexm=zjx.getZjxZhWjrJe(conn,khbh,zjxxh,"yz");//不记入业绩其它费－折后，不包括税金、管理费、设计费

			double zhsjf=zjx.getZhZJxSjf(conn,khbh,zjxxh,"yz");//设计费－折后

			double zhguanlif=zjx.getZjxZhGlf(conn,khbh,zjxxh,"yz");//折后-增减项管理费

			double zjxsuijin=zjx.getZjxZhSuijin(conn,khbh,zjxxh,"yz");  //折后-增减项税金

			kglf=zjx.getKglf(conn,khbh,zjxxh,"yz");//减项扣管理费=折前工程减项（非净减项）*减项扣管理费百分比（sq_dwxx设置）
			zjxrzf=zjx.getZjxRzf(conn,khbh,zjxxh,"yz");//增减项认证费=折后工程减项（非净减项）*认证费百分比（签单登记录入）
			zjxdjjje=zjx.getZjxDjjje(conn,khbh,zjxxh,"yz");//本次增减项代金券＝折前净减项*代金券百分比（签单登记录入）



			double zhzjze=0;//增减总额－折后
			zhzjze=jzjje+zhguanlif+zjxsuijin+zhsjf  +zhqtsf+zhwjrqyexm+zjxrzf+zjxdjjje+kglf+kqtk;

			zxcbj=zjx.getCbj(conn,khbh,zjxxh,"yz");//成本价＝工程项成本价＋其它项成本（不含：管理费、税金）
			zxgcjcbj=zjx.getGcjcbj(conn,khbh,zjxxh,"yz");//工程基础报价＝工程项工程基础报价＋其它项工程基础报价（不含：管理费、税金）

			zxhtjz=zjx.getHtjz(conn,khbh,zjxxh,"yz");//合同净值＝工程费＋记入业绩其它费（包括所有记入项）－赠送净值－赠送代金券
			zxsgcbj=zjx.getSgcbj(conn,khbh,zjxxh,"yz");//施工成本价＝工程项施工成本价＋其它项施工成本（不含：管理费、税金）
			zxmle=cf.round(zxhtjz-zxsgcbj,2);//毛利额=合同净值－施工成本价
			zxmll=cf.round(zxmle/zxhtjz*100,2);//毛利率＝毛利额÷合同净值
			
			double wjryjje=0;//未记入业绩项目
			ls_sql="SELECT sum(sfje)";
			ls_sql+=" FROM bj_sfxmmxh";
			ls_sql+=" where zjxxh='"+zjxxh+"' and sfjrqye='2'";
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				wjryjje=rs.getDouble(1);
			}
			rs.close();
			ps.close();
			

			yjjzcs=0;//业绩净值参数
			mll=0;//合同毛利率
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


		
			zxyjjz=zjx.getYjjz(conn,khbh,zjxxh,"csrj");//业绩净值
			zxyjjz=cf.round(zxyjjz*100/yjjzcs,2);//业绩净值=毛利额÷核算净值参数

			//增减项发生额
			ls_sql="update crm_zjxdj set jzjje=?,zhguanlif=?,zjxsuijin=?";
			ls_sql+=" ,gczxzh=?,gcjxzh=?,kglf=?,zjxrzf=?,zjxdjjje=?";
			ls_sql+=" ,zhzjze=?  ,zhqtsf=?  ,zhwjrqyexm=?,zhsjf=?";
			ls_sql+=" where  zjxxh='"+zjxxh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,jzjje);
			ps.setDouble(2,zhguanlif);
			ps.setDouble(3,zjxsuijin);
			ps.setDouble(4,gczxzh);
			ps.setDouble(5,gcjxzh);
			ps.setDouble(6,kglf);
			ps.setDouble(7,zjxrzf);
			ps.setDouble(8,zjxdjjje);
			ps.setDouble(9,zhzjze);
			ps.setDouble(10,zhqtsf);
			ps.setDouble(11,zhwjrqyexm);
			ps.setDouble(12,zhsjf);
			ps.executeUpdate();
			ps.close();
		}

	}
	rs1.close();
	ps1.close();
	
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


	ls_sql=" update cw_qmjzmx set cxhdbm=?,cxhdbmxq=?,cxhdbmzh=?,qye=?,guanlif=?,suijin=?,zhwjrqyexm=? ,zhzjxje=?,zjxsuijin=?,zjxguanlif=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setString(1,xghcxhd);
	ps.setString(2,xghcxhdbmxq);
	ps.setString(3,xghcxhdbmzh);
	ps.setDouble(4,qye);
	ps.setDouble(5,guanlif);
	ps.setDouble(6,suijin);
	ps.setDouble(7,zhwjrqyexm);
	ps.setDouble(8,alljzjje);
	ps.setDouble(9,allzjxsuijin);
	ps.setDouble(10,allzhguanlif);
	ps.executeUpdate();
	ps.close();
	//修改增减项＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	ls_sql ="insert into cw_cxhdxgjl (xgjlh,khbh,khxm,fgsbh,xgqcxhd,xgqcxhdbmxq,xgqcxhdbmzh,xghcxhd,xghcxhdbmxq,xghcxhdbmzh,lrr,lrsj,lrbm,bz ";
	ls_sql+=" ,xgqwdzgce,xgqqye,xgqpmjj,xgqzxjwbm,xgqsuijin,xgqguanlif  ,xghwdzgce,xghqye,xghpmjj,xghzxjwbm,xghsuijin,xghguanlif)";
	ls_sql+=" values(?,?,?,?,?,?,?,?,?,?   ,?,SYSDATE,?,?    ,?,?,?,?,?,?   ,?,?,?,?,?,?)";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xgjlh);
	ps.setString(2,khbh);
	ps.setString(3,khxm);
	ps.setString(4,fgsbh);
	ps.setString(5,xgqcxhd);
	ps.setString(6,xgqcxhdbmxq);
	ps.setString(7,xgqcxhdbmzh);
	ps.setString(8,xghcxhd);
	ps.setString(9,xghcxhdbmxq);
	ps.setString(10,xghcxhdbmzh);

	ps.setString(11,lrr);
	ps.setString(12,lrbm);
	ps.setString(13,bz);

	ps.setDouble(14,wdzgce);
	ps.setDouble(15,xgqqye);
	ps.setInt(16,xgqpmjj);
	ps.setString(17,xgqzxjwbm);
	ps.setDouble(18,xgqsuijin);
	ps.setDouble(19,xgqguanlif);

	ps.setDouble(20,wdzgce);
	ps.setDouble(21,qye);
	ps.setInt(22,pmjj);
	ps.setString(23,zxjwbm);
	ps.setDouble(24,suijin);
	ps.setDouble(25,guanlif);

	ps.executeUpdate();
	ps.close();


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
	out.print("<BR>存盘失败,发生意外: " + e);
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
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>