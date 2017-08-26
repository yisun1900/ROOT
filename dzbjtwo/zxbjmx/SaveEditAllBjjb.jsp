<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String ygbh=(String)session.getAttribute("ygbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String oldbjjb=cf.GB2Uni(request.getParameter("oldbjjb"));
String bjjb=cf.GB2Uni(request.getParameter("bjjb"));
String jzbz=cf.GB2Uni(request.getParameter("jzbz"));
String czfs=cf.GB2Uni(request.getParameter("czfs"));
String xmclfs=cf.GB2Uni(request.getParameter("xmclfs"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String xmbh=null;
String ckxm=null;
String bjlx=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;

double clbj=0;
double rgbj=0;
double jxbj=0;
double zcf=0;
double shf=0;
double ysf=0;
double qtf=0;
double bj=0;

double sgdbj=0;
double sgcbj=0;

double clcb=0;
double rgcb=0;
double jxcb=0;
double cbenj=0;
String gycl=null;
String bz=null;


try {
	conn=cf.getConnection();

	if (oldbjjb.equals(bjjb))
	{
		out.println("请选择不同的报价级别");
		return;
	}

	String oldlx="";
	ls_sql="select lx";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" where bjjbbm='"+oldbjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		oldlx=rs.getString("lx");
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

	if (oldlx.equals("2") || lx.equals("2"))//1：非套餐；2：套餐，涉及套餐要重新做报价
	{
		czfs="1";//1:删除现有报价项目及工程量
	}

	String getzxzt=null;//0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过
	String bjbbh=null;
	String ssfgs=null;
	String hxbm=null;
	ls_sql="SELECT zxzt,bjbbh,ssfgs,hxbm";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
		bjbbh=rs.getString("bjbbh");
		ssfgs=rs.getString("ssfgs");
		hxbm=rs.getString("hxbm");
	}
	rs.close();
	ps.close();


	if (getzxzt.equals("3"))
	{
		int czbzsq=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM cw_czbjsqjl";
		ls_sql+=" where khbh='"+khbh+"' and wcbz='1'";//1：未完成；2：完成；3：业绩结转
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			czbzsq=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (czbzsq==0)
		{
			out.println("错误！客户已签单，不能再修改报价");
			return;
		}
	}
	else if (getzxzt.equals("2") || getzxzt.equals("4"))
	{
		out.println("错误！客户签单失败，不能再修改报价");
		return;
	}

	String dqbm=null;
	ls_sql="SELECT dqbm";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();

	//电子报价版本是否已停用
	int bjtyMark=0;
	ls_sql="select count(*)";
	ls_sql+=" from  bj_dzbjbb";
	ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and sfzybb='4'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjtyMark=rs.getInt(1);
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	if (czfs.equals("1"))//1:删除现有报价项目及工程量
	{
		//客户报价项目明细
		ls_sql="delete from bj_bjxmmx";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//客户关联项目表
		ls_sql="delete from bj_khglxmb";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//房间信息
		ls_sql="delete from bj_fjxx";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//工程量明细
		ls_sql="delete from bj_gclmx";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//其它收费项目明细（bj_sfxmmx）
		ls_sql="delete from bj_sfxmmx";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//客户工料分析表
		ls_sql="delete from bj_khglfxb";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//客户工程项目小计
		ls_sql="delete from bj_khgcxmxj";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//客户主材项目小计
		ls_sql="delete from bj_khzcxmxj";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//客户主材项目
		ls_sql="delete from bj_khzcxm";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		//删除临时报价＋＋＋＋＋＋＋＋＋＋＋＋开始

		//临时报价--项目明细
		ls_sql="delete from bj_mbbjxmmx ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		//临时报价--工料分析表
		ls_sql="delete from bj_mbglfxb ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		//临时报价--房间信息
		ls_sql="delete from bj_mbfjxx ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		//临时报价--工程量明细
		ls_sql="delete from bj_mbgclmx ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		//临时报价--主材用量
		ls_sql="delete from bj_mbzcyl ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		//临时报价--其它收费项目明细
		ls_sql="delete from bj_mbsfxmmx ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql=" delete from bj_mbkhgcxmxj ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql=" delete from bj_mbkhzcxmxj ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql=" delete from bj_mbkhzcxm ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//删除临时报价========================完成

		
		long xh=0;
		ls_sql="select NVL(max(xh)+1,0)";
		ls_sql+=" from  bj_bjxmmx";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xh=rs.getLong(1);
		}
		rs.close();
		ps.close();

		int xmpx=0;//项目排序
		ls_sql="select NVL(max(xmpx)+1,0)";
		ls_sql+=" from  bj_bjxmmx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xmpx=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (lx.equals("1"))//1：非套餐；2：套餐
		{
			ls_sql="insert into bj_bjxmmx (xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,clcb,rgcb,jxcb,cbenj,sgcbj,sgdbj,zqdj,zk,dj,sfyxdz,zdzk,gycl,flmcgg,bz,dqbm,bjjb,xmlx,jzbz,xmpx,sfzgzc,glxmbh,bjlx,sfbxx,lrr,lrsj,sfxycl,sfxyyjd ) ";
			ls_sql+=" select            ?+rownum,?,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clbj,rgbj,jxbj,zcf,shf,ysf,qtf,clcb,rgcb,jxcb,cbenj,sgcbj,sgdbj,bj  ,10,bj,sfyxdz,zdzk,gycl,flmcgg,bz,dqbm,?   ,'1' ,'1' ,?   ,'N'   ,glxmbh,'1' ,sfbxx,?  ,SYSDATE,sfxycl,sfxyyjd";//1：需要；2：不需要
			ls_sql+=" from bj_jzbjb ";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and bjbbh='"+bjbbh+"' and sfbxx in('1','2') ";//1：必报项；2：必列项；3：可选项；9：作废项
			ls_sql+=" and xmbh not in(select xmbh from bj_bjxmmx where khbh='"+khbh+"') ";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,xh);
			ps.setString(2,khbh);
			ps.setString(3,bjjb);
			ps.setInt(4,xmpx);
			ps.setString(5,yhdlm);
			ps.executeUpdate();
			ps.close();

			//客户工料分析表（bj_khglfxb）
			ls_sql="delete from bj_khglfxb ";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into bj_khglfxb (khbh,glbxh,dqbm,bjjb  ,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx) ";
			ls_sql+="                   select ?,glbxh,dqbm,bjjbbm,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx ";
			ls_sql+=" from bj_jzglfxb";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ls_sql+=" and xmbh in(select xmbh from bj_bjxmmx where khbh='"+khbh+"' )";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
		}
		else{//套餐，需要取：套餐标准主材项目、套餐标准工程项目
		
			//增加报价项目，来源：套餐标准工程项目＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="insert into bj_bjxmmx (xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,cldj,rgdj,jxdj,clcb,rgcb,jxcb,dj,gycl,flmcgg,bz,dqbm,bjjb,xmlx,cbenj,sgdbj,jzbz,xmpx,sfzgzc,glxmbh,bjlx,sfbxx,lrr,lrsj,sfxycl,sfxyyjd,tcnxmbz ) ";
			ls_sql+=" select   ?+rownum,?,bj_jzbjb.xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,clbj,rgbj,jxbj,clcb,rgcb,jxcb,bj,gycl,flmcgg,bz,bj_jzbjb.dqbm,?,'1',cbenj,sgdbj,'1',?,'N',glxmbh,'1',sfbxx,?,SYSDATE,sfxycl,sfxyyjd,'Y'";//1：需要；2：不需要
			ls_sql+=" from bj_jzbjb,bj_tcbzgcxm ";
			ls_sql+=" where bj_jzbjb.dqbm='"+dqbm+"' and bj_jzbjb.bjjbbm='"+bjjb+"' and bj_jzbjb.bjbbh='"+bjbbh+"'";
			ls_sql+=" and bj_tcbzgcxm.dqbm='"+dqbm+"' and bj_tcbzgcxm.bjbbh='"+bjbbh+"'";
			ls_sql+=" and bj_tcbzgcxm.bjjbbm='"+bjjb+"' and bj_tcbzgcxm.hxbm='"+hxbm+"'";
			ls_sql+=" and bj_jzbjb.xmbh=bj_tcbzgcxm.xmbh ";
			ls_sql+=" and bj_jzbjb.xmbh not in(select xmbh from bj_bjxmmx where khbh='"+khbh+"') ";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,xh);
			ps.setString(2,khbh);
			ps.setString(3,bjjb);
			ps.setInt(4,xmpx);
			ps.setString(5,yhdlm);
			ps.executeUpdate();
			ps.close();
			//增加报价项目，来源：套餐标准工程项目＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//客户工料分析表（bj_khglfxb）
			ls_sql="delete from bj_khglfxb ";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into bj_khglfxb (khbh,glbxh,dqbm,bjjb,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx) ";
			ls_sql+="                   select ?,glbxh,dqbm,bjjbbm,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx ";
			ls_sql+=" from bj_jzglfxb ";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ls_sql+=" and xmbh in(select xmbh from bj_bjxmmx where khbh='"+khbh+"' )";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();

			//增加房间，来源：套餐标准主材项目＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			int xuhao=0;
			ls_sql="SELECT max(xuhao)";
			ls_sql+=" FROM bj_fjxx";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				xuhao=rs.getInt(1);
			}
			rs.close();
			ps.close();

			//房间信息，从套餐标准主材项目建立
			ls_sql="insert into bj_fjxx ( khbh,jgwzbm,xuhao,oldjgwzbm ) ";
			ls_sql+=" select ?,jgwzbm,?+rownum,jgwzbm ";
			ls_sql+=" from ( ";
			ls_sql+=" select distinct jgwzbm ";
			ls_sql+=" from bj_tcbzzcxm";
			ls_sql+=" where bj_tcbzzcxm.dqbm='"+dqbm+"' and bj_tcbzzcxm.bjbbh='"+bjbbh+"'";
			ls_sql+=" and bj_tcbzzcxm.bjjbbm='"+bjjb+"' and bj_tcbzzcxm.hxbm='"+hxbm+"'";
			ls_sql+=" ) ";
			ls_sql+=" where jgwzbm not in(select jgwzbm from bj_fjxx where khbh='"+khbh+"') ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setInt(2,xuhao);
			ps.executeUpdate();
			ps.close();
			//增加房间，来源：套餐标准主材项目＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//客户工程项目小计，来源：套餐标准工程项目＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from bj_khgcxmxj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into bj_khgcxmxj (khbh,xmbh,bzsl,sfxzsl,ccbfjj,sjsl,xjjsl,tcnxmbz) "; 
			ls_sql+=" select ?,xmbh,bzsl,sfxzsl,ccbfjj,0,0,'Y'";
			ls_sql+=" from bj_tcbzgcxm";
			ls_sql+=" where bj_tcbzgcxm.dqbm='"+dqbm+"' and bj_tcbzgcxm.bjjbbm='"+bjjb+"' and bj_tcbzgcxm.bjbbh='"+bjbbh+"'";
			ls_sql+=" and bj_tcbzgcxm.hxbm='"+hxbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();

			int count=0;
			ls_sql="select count(*)";
			ls_sql+=" from  bj_khgcxmxj";
			ls_sql+=" where khbh='"+khbh+"'  ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();
			if (count==0)
			{
				conn.rollback();
				out.println("错误！【套餐标准工程项目】未初始化");
				return;
			}


			//客户工程项目小计，来源：套餐标准工程项目＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//增加客户主材项目小计，来源：套餐标准主材项目＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from bj_khzcxmxj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into bj_khzcxmxj (khbh,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,bzsl,sfxzsl,ccbfjj,sjsl,sjjshsl,xjjsl,khbjjbbm,bjjbbm,sfyqxtpp) "; 
			ls_sql+=" select ?,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,bzsl,sfxzsl,ccbfjj,0,0,0,bjjbbm,bjjbbm,sfyqxtpp";
			ls_sql+=" from bj_tcbzzcxm";
			ls_sql+=" where bj_tcbzzcxm.dqbm='"+dqbm+"' and bj_tcbzzcxm.bjjbbm='"+bjjb+"' and bj_tcbzzcxm.bjbbh='"+bjbbh+"'";
			ls_sql+=" and bj_tcbzzcxm.hxbm='"+hxbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();

			ls_sql="select count(*)";
			ls_sql+=" from  bj_khzcxmxj";
			ls_sql+=" where khbh='"+khbh+"'  ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();
			if (count==0)
			{
				conn.rollback();
				out.println("错误！【套餐标准主材项目】未初始化");
				return;
			}
			//增加客户主材项目小计，来源：套餐标准主材项目＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

		
			ls_sql="delete from bj_khzcxm "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			String getjgwzbm=null;
			String gettccplbbm=null;
			double bzsl=0;
			String sfxzsl=null;
			ls_sql="select jgwzbm,tccplbbm,bzsl,sfxzsl";
			ls_sql+=" from  bj_khzcxmxj";
			ls_sql+=" where khbh='"+khbh+"' and sfbxx='Y'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				getjgwzbm=rs.getString("jgwzbm");
				gettccplbbm=rs.getString("tccplbbm");
				bzsl=rs.getDouble("bzsl");
				sfxzsl=rs.getString("sfxzsl");

			
				count=0;
				ls_sql="select count(*)";
				ls_sql+=" from  bj_tczcbj";
				ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and tccplbbm='"+gettccplbbm+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					count=rs1.getInt(1);
				}
				rs1.close();
				ps1.close();

				if (count==1)
				{
					ls_sql="insert into bj_khzcxm (khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,dj,jsj,jjje,sh,sfcscp,xuhao,bz,sfxclxs,sl,ptcpsm,bjjbbm) ";
					ls_sql+=" select ?,?,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,dj,jsj,jjje,sh,sfcscp,xuhao,bz,sfxclxs,?,?,?  ";
					ls_sql+=" from bj_tczcbj";
					ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and tccplbbm='"+gettccplbbm+"'";
					ps1= conn.prepareStatement(ls_sql);
					ps1.setString(1,khbh);
					ps1.setString(2,getjgwzbm);
					ps1.setDouble(3,bzsl);
					ps1.setString(4,"");
					ps1.setString(5,bjjb);
					ps1.executeUpdate();
					ps1.close();

					double sjsl=0;
					double sjjshsl=0;
					double xjjsl=0;
					ls_sql="select sum(sl),sum(ROUND(sl*(100+sh)/100,2))";
					ls_sql+=" FROM bj_khzcxm";
					ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+getjgwzbm+"' and tccplbbm='"+gettccplbbm+"'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						sjsl=rs1.getDouble(1);
						sjjshsl=rs1.getDouble(2);
					}
					rs1.close();
					ps1.close();

					if (sfxzsl.equals("1"))//1：可增项；2：不可增项；3：不控制
					{
						if (sjsl>bzsl)
						{
							xjjsl=sjsl-bzsl;
						}
					}
					else if (sfxzsl.equals("2"))//1：可增项；2：不可增项；3：不控制
					{
						if (sjsl>bzsl)
						{
							conn.rollback();
							out.println("错误！不可增项，实际数量["+sjsl+"]不能超过标准数量["+bzsl+"]");
							return;
						}
					}

					ls_sql="update bj_khzcxmxj set sjsl="+sjsl+",sjjshsl="+sjjshsl+",xjjsl="+xjjsl;
					ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+getjgwzbm+"' and tccplbbm='"+gettccplbbm+"'";
					ps1= conn.prepareStatement(ls_sql);
					ps1.executeUpdate();
					ps1.close();
				}
			
			
			}
			rs.close();
			ps.close();
		
		
		}

		ls_sql="insert into bj_khglxmb (khbh,xmbh,glxmbh) ";
		ls_sql+=" select ?,xmbh,glxmbh";
		ls_sql+=" from bj_glxmb ";
		ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and bjbbh='"+bjbbh+"' ";
		ls_sql+=" and xmbh in ";
		ls_sql+=" ( ";
		ls_sql+=" select xmbh ";
		ls_sql+=" from bj_jzbjb ";
		ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and bjbbh='"+bjbbh+"' and sfbxx in('1','2') ";//1：必报项；2：必列项；3：可选项；9：作废项
		ls_sql+=" and xmbh not in(select xmbh from bj_bjxmmx where khbh='"+khbh+"') ";
		ls_sql+=" ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_sfxmmx (khbh,sfxmbm,sfxmmc,sflx,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfbfb,zqsfje   ,dxzkl,sfje,bz,sfkdz,zdzk,sfxmlx,sfcysgdjs,dj  ,jldw,sl,sfssjf,cbjbfb,sgcbjbfb,gcjcbjbfb ) ";
		ls_sql+=" select               ?   ,sfxmbm,sfxmmc,sflx,sfbxx,sfjrqye,jrsjbz,jrglfbz,0    ,gdje     ,10   ,gdje,bz,sfkdz,zdzk,sfxmlx,sfcysgdjs,gdje,jldw,1 ,sfssjf,cbjbfb,sgcbjbfb,gcjcbjbfb";
		ls_sql+=" from bdm_sfxmbm ";
		ls_sql+=" where dqbm='"+dqbm+"' and sfbxx='1' and sfxmbm not in(select sfxmbm from bj_sfxmmx where khbh='"+khbh+"')";//1：必选；2：?潜匮。?
		ls_sql+=" and (sfxsq='1' OR (sfxsq='2' and sfxmbm in(select sfxmbm from sq_sfxmsq where ygbh='"+ygbh+"')))";//1：不需授权；2：需授权使用
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.executeUpdate();
		ps.close();

	}
	else{//保留现有报价项目及工程量，只更新报价级别
		//更新报价
		//报价项目明细
		ls_sql="select bj_bjxmmx.xmbh";
		ls_sql+=" from  bj_bjxmmx";
		ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"' and bjlx='1'";
		ls_sql+=" order by bj_bjxmmx.xh";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			xmbh=rs1.getString("xmbh");


			if (bjtyMark>0)//已停用，从表[bj_jzbjb1]取数据而非表[bj_jzbjb]
			{
				ls_sql="select bj_jzbjb1.xmmc,bj_jzbjb1.clbj,bj_jzbjb1.rgbj,bj_jzbjb1.jxbj,bj_jzbjb1.zcf,bj_jzbjb1.shf,bj_jzbjb1.ysf,bj_jzbjb1.qtf,bj_jzbjb1.bj   ,bj_jzbjb1.sgcbj,bj_jzbjb1.sgdbj,bj_jzbjb1.clcb,bj_jzbjb1.rgcb,bj_jzbjb1.jxcb,bj_jzbjb1.cbenj,bj_jzbjb1.gycl,bj_jzbjb1.bz";
				ls_sql+=" from  bj_jzbjb1";
				ls_sql+=" where bjbbh='"+bjbbh+"' and bjjbbm='"+bjjb+"' and xmbh='"+xmbh+"' and dqbm='"+dqbm+"'";
			}
			else{
				ls_sql="select bj_jzbjb.xmmc,bj_jzbjb.clbj,bj_jzbjb.rgbj,bj_jzbjb.jxbj,bj_jzbjb.zcf,bj_jzbjb.shf,bj_jzbjb.ysf,bj_jzbjb.qtf,bj_jzbjb.bj   ,bj_jzbjb.sgcbj,bj_jzbjb.sgdbj,bj_jzbjb.clcb,bj_jzbjb.rgcb,bj_jzbjb.jxcb,bj_jzbjb.cbenj,bj_jzbjb.gycl,bj_jzbjb.bz";
				ls_sql+=" from  bj_jzbjb";
				ls_sql+=" where bjbbh='"+bjbbh+"' and bjjbbm='"+bjjb+"' and xmbh='"+xmbh+"' and dqbm='"+dqbm+"'";
			}
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				xmmc=rs.getString("xmmc");
				clbj=rs.getDouble("clbj");
				rgbj=rs.getDouble("rgbj");
				jxbj=rs.getDouble("jxbj");
				zcf=rs.getDouble("zcf");
				shf=rs.getDouble("shf");
				ysf=rs.getDouble("ysf");
				qtf=rs.getDouble("qtf");
				bj=rs.getDouble("bj");

				sgcbj=rs.getDouble("sgcbj");
				sgdbj=rs.getDouble("sgdbj");

				clcb=rs.getDouble("clcb");
				rgcb=rs.getDouble("rgcb");
				jxcb=rs.getDouble("jxcb");
				cbenj=rs.getDouble("cbenj");

				gycl=cf.fillNull(rs.getString("gycl"));
				bz=cf.fillNull(rs.getString("bz"));
			}
			else{
				rs.close();
				ps.close();

				if (xmclfs.equals("1"))//系统自动删除
				{
					ls_sql="delete from bj_gclmx ";
					ls_sql+=" where xmbh='"+xmbh+"'";
					ls_sql+=" and khbh='"+khbh+"' and dqbm='"+dqbm+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();


					ls_sql="delete from bj_khglfxb ";
					ls_sql+=" where xmbh='"+xmbh+"'";
					ls_sql+=" and khbh='"+khbh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					
					ls_sql="delete from bj_khglxmb ";
					ls_sql+=" where xmbh='"+xmbh+"'";
					ls_sql+=" and khbh='"+khbh+"' ";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					ls_sql="delete from bj_bjxmmx ";
					ls_sql+=" where xmbh='"+xmbh+"'";
					ls_sql+=" and khbh='"+khbh+"' ";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					out.println("<BR>提醒！项目编号["+xmbh+"]在新的报价中不存在，系统自动删除该项目");
				}
				else{
					rs1.close();
					ps1.close();

					conn.rollback();
					out.println("<BR>错误！项目编号["+xmbh+"]不存在，在新的报价中，该项目可能已作废，<BR><B><font size=\"5\" color=\"#FF0000\">修改方式：在工程预算价中，把不存在的项目删除即可</font></B>");
					return;
				}

			}
			rs.close();
			ps.close();

			ls_sql="update bj_bjxmmx";
			ls_sql+=" set bjjb='"+bjjb+"',xmmc='"+xmmc+"',cldj="+clbj+",rgdj="+rgbj+",jxdj="+jxbj+",zcf="+zcf+",shf="+shf+",ysf="+ysf+",qtf="+qtf+",zqdj="+bj+",dj=zk/10*"+bj+"    ,sgcbj="+sgcbj+",sgdbj="+sgdbj+"   ,clcb="+clcb+",rgcb="+rgcb+",jxcb="+jxcb+",cbenj="+cbenj+",gycl='"+gycl+"',bz='"+bz+"'";
			ls_sql+=" where  khbh='"+khbh+"' and xmbh='"+xmbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

		}
		rs1.close();
		ps1.close();

		ls_sql="select bj_bjxmmx.xmbh";
		ls_sql+=" from  bj_bjxmmx";
		ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"' and bjlx='2'";//1:标准项目;2:自定义项目
		ls_sql+=" order by bj_bjxmmx.xh";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			xmbh=rs1.getString("xmbh");

			out.println("<BR>提醒！自定义项目["+xmbh+"]被删除");
		}
		rs1.close();
		ps1.close();
	}



	//初始化
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	//更新报价折扣
	dzbj.updateBjZkl(conn,khbh,"yz");
	//更新其它收费项目，调整收费百分比
	dzbj.updateSfxm(conn,khbh,"yz");
	//获取电子报价金额
	double dzbjze=dzbj.getAllBjje(conn,khbh,"yz");


	//修改：电子报价总额
	ls_sql="update crm_zxkhxx set dzbjze=?,jzbz=?,bjjb=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.setString(2,jzbz);
	ps.setString(3,bjjb);
	ps.executeUpdate();
	ps.close();

	conn.commit();


	out.println("<P>存盘成功！");
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
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

