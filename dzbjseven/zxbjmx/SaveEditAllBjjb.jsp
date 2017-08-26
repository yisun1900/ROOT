<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String lrr=(String)session.getAttribute("yhmc");
String ygbh=(String)session.getAttribute("ygbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String oldbjjb=cf.GB2Uni(request.getParameter("oldbjjb"));
String bjjb=cf.GB2Uni(request.getParameter("bjjb"));
String czfs=cf.GB2Uni(request.getParameter("czfs"));
String xmclfs=cf.GB2Uni(request.getParameter("xmclfs"));
String hxbm=cf.GB2Uni(request.getParameter("hxbm"));

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


	String getzxzt=null;//0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过
	String bjbbh=null;
	String ssfgs=null;
	int fwmj=0;
	ls_sql="SELECT zxzt,bjbbh,ssfgs,fwmj";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
		bjbbh=rs.getString("bjbbh");
		ssfgs=rs.getString("ssfgs");
		fwmj=rs.getInt("fwmj");
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

		

		if (lx.equals("1"))//1：非套餐；2：套餐
		{
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
		else
		{//套餐，需要取：套餐标准主材项目、套餐标准工程项目

			ls_sql="delete from bj_fjxx ";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			
			ls_sql="insert into bj_fjxx (khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,fjzcxq,bz,xuhao,fjlx)";
			ls_sql+=" select                ?,jgwzmc,fjmj,0  ,0      ,0      ,jgwzmc   ,''    ,'',xuhao,fjlx";
			ls_sql+=" from bdm_hxfjdzb  ";
			ls_sql+=" where hxbm='"+hxbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();

			ls_sql="delete from bj_bjxmmx ";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="delete from bj_gclmx ";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

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


			//增加报价项目，来源：套餐标准工程项目＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="insert into bj_bjxmmx (xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,clcb,rgcb,jxcb,cbenj,sgcbj,sgdbj,zqdj,zk,dj,sfyxdz,zdzk,gycl,flmcgg,bz,dqbm,bjjb,xmlx,jzbz,xmpx,sfzgzc,glxmbh,bjlx,sfbxx,lrr,lrsj   ,sfxycl,sfxyyjd,tcnxmbz ) ";
			ls_sql+=" select   ?+rownum,?,bj_jzbjb.xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clbj,rgbj,jxbj,zcf,shf,ysf,qtf,clcb,rgcb,jxcb,cbenj,sgcbj,sgdbj,bj  ,10,bj,sfyxdz,zdzk,gycl,flmcgg,bz,bj_jzbjb.dqbm,?,'1','1',?,'N'  ,glxmbh,'1' ,sfbxx,?  ,SYSDATE,sfxycl,sfxyyjd,'Y'";//1：需要；2：不需要
			ls_sql+=" from bj_jzbjb,tc_csrjbzgcxm ";
			ls_sql+=" where bj_jzbjb.dqbm='"+dqbm+"' and bj_jzbjb.bjjbbm='"+bjjb+"' and bj_jzbjb.bjbbh='"+bjbbh+"'";
			ls_sql+=" and tc_csrjbzgcxm.dqbm='"+dqbm+"' and tc_csrjbzgcxm.bjbbh='"+bjbbh+"'";
			ls_sql+=" and tc_csrjbzgcxm.bjjbbm='"+bjjb+"'";
			ls_sql+=" and bj_jzbjb.xmbh=tc_csrjbzgcxm.xmbh ";
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

			//客户套餐价格表＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhjgb "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhjgb (khbh,tcmc,mjpmdj,tnzxjjmj,cfdj,cfbzmj,cfccmjdj,wsjdj,wsjbzmj,wsjccmjdj,tlgbzjmj)"; 
			ls_sql+=" select                     ?,tcmc,mjpmdj,tnzxjjmj,cfdj,cfbzmj,cfccmjdj,wsjdj,wsjbzmj,wsjccmjdj,tlgbzjmj";
			ls_sql+=" from tc_csrjtcjgb";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
			//客户套餐价格表＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//增加:客户橱柜价格表（tc_csrjkhcgjmj）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhcgjmj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhcgjmj (khbh,tccplbbm,jgwzbm        ,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,sjjmsl,sjjmje,sfxzsl,tcnbz,sfbxx,bzsl,zdsl,sjsl,lrr      ,lrsj)"; 
			ls_sql+=" select                       ?,tccplbbm,bj_fjxx.jgwzbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,0     ,0     ,sfxzsl,tcnbz,sfbxx,bzsl,bzsl,0   ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjcgjmj,bj_fjxx";
			ls_sql+=" where tc_csrjcgjmj.dqbm='"+dqbm+"' and tc_csrjcgjmj.bjjbbm='"+bjjb+"'";
			ls_sql+=" and bj_fjxx.khbh='"+khbh+"'";
			ls_sql+=" and bj_fjxx.fjlx=1";//1：厨房；2：卫生间；3：卧室；4：客厅；5：餐厅；6：阳台
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
			//增加:客户橱柜价格表（tc_csrjkhcgjmj）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//增加:客户木门价格表（tc_khmmjgb）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhmmjmj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhmmjmj (khbh,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,sjjmsl,sjjmje,sfxzsl,tcnbz,sfbxx,bzmj,bzsl,mtmzjmj,zdsl,sjsl,lrr      ,lrsj)"; 
			ls_sql+=" select                       ?,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,0     ,0     ,sfxzsl,tcnbz,sfbxx,bzmj,bzsl,mtmzjmj,0   ,0   ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjmmjmj";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();

			ls_sql="update tc_csrjkhmmjmj set zdsl=bzsl+FLOOR(("+fwmj+"-bzmj)/mtmzjmj)"; //最大数量
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			//增加:客户木门价格表（tc_khmmjgb）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//客户洁具价格表（tc_khjjjgb）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhjjjmj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhjjjmj (khbh,tccplbbm,jgwzbm        ,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,sjjmsl,sjjmje,sfxzsl,bzsl,tcnbz,sfbxx,sjsl,lrr      ,lrsj)"; 
			ls_sql+=" select                       ?,tccplbbm,bj_fjxx.jgwzbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,0     ,0     ,sfxzsl,bzsl,tcnbz,sfbxx,0   ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjjjjmj,bj_fjxx";
			ls_sql+=" where tc_csrjjjjmj.dqbm='"+dqbm+"' and tc_csrjjjjmj.bjjbbm='"+bjjb+"'";
			ls_sql+=" and bj_fjxx.khbh='"+khbh+"'";
			ls_sql+=" and bj_fjxx.fjlx=2";//1：厨房；2：卫生间；3：卧室；4：客厅；5：餐厅；6：阳台
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
			//客户洁具价格表（tc_khjjjgb）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//客户磁砖价格表（tc_khczjgb）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhczjmj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhczjmj (khbh,tccplbbm,jgwzbm        ,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,sjjmsl,sjjmje,sjsl,lrr      ,lrsj)"; 
			ls_sql+=" select                       ?,tccplbbm,bj_fjxx.jgwzbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,0     ,0     ,0   ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjczjmj,bj_fjxx";
			ls_sql+=" where tc_csrjczjmj.dqbm='"+dqbm+"' and tc_csrjczjmj.bjjbbm='"+bjjb+"'";
			ls_sql+=" and tc_csrjczjmj.tccplbbm not in(25,26)";//大地砖/大地砖踢脚线
			ls_sql+=" and bj_fjxx.khbh='"+khbh+"'";
			ls_sql+=" and bj_fjxx.fjlx in(1,2)";//1：厨房；2：卫生间；3：卧室；4：客厅；5：餐厅；6：阳台
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhczjmj (khbh,tccplbbm,jgwzbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,sjjmsl,sjjmje,sjsl,lrr      ,lrsj)"; 
			ls_sql+=" select                       ?,tccplbbm,'其它',tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,0     ,0     ,0   ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjczjmj";
			ls_sql+=" where tc_csrjczjmj.dqbm='"+dqbm+"' and tc_csrjczjmj.bjjbbm='"+bjjb+"'";
			ls_sql+=" and tc_csrjczjmj.tccplbbm in(25,26)";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
			//客户磁砖价格表（tc_khczjgb）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//客户铝扣板价格表（tc_khlkbjgb）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhlkbjmj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhlkbjmj (khbh,tccplbbm,jgwzbm        ,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,sjjmsl,sjjmje,sjsl,lrr      ,lrsj)"; 
			ls_sql+=" select                        ?,tccplbbm,bj_fjxx.jgwzbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,0     ,0     ,0    ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjlkbjmj,bj_fjxx";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ls_sql+=" and bj_fjxx.khbh='"+khbh+"'";
			ls_sql+=" and bj_fjxx.fjlx in(1,2)";//1：厨房；2：卫生间；3：卧室；4：客厅；5：餐厅；6：阳台
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
			//客户铝扣板价格表（tc_khlkbjgb）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//客户地板减免价（tc_csrjkhdbjmj）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhdbjmj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhdbjmj (khbh,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,sjjmsl,sjjmje,sjsl,lrr      ,lrsj)"; 
			ls_sql+=" select                       ?,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,0     ,0     ,0   ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjdbjmj";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
			//客户地板减免价（tc_csrjkhdbjmj）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//增加:客户衣柜减免价（tc_csrjkhygjmj）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhygjmj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhygjmj (khbh,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,sjjmsl,sjjmje,tcnbz,sfbxx,sfxzsl,fjbzmj,dyygpm,pmzjmj,zdpms,sjpms,lrr      ,lrsj)"; 
			ls_sql+=" select                       ?,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,0     ,0     ,tcnbz,sfbxx,sfxzsl,fjbzmj,dyygpm,pmzjmj,0    ,0    ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjygjmj";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();

			ls_sql="update tc_csrjkhygjmj set zdpms=dyygpm+FLOOR(("+fwmj+"-fjbzmj)/pmzjmj)"; //最大数量
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			//增加:客户衣柜减免价（tc_csrjkhygjmj）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//客户五金电器减免价＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhwjdqjmj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhwjdqjmj (khbh,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,sjjmsl,sjjmje,sfxzsl,bzsl,tcnbz,sfbxx,sjsl,lrr      ,lrsj)"; 
			ls_sql+=" select                         ?,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,0     ,0     ,sfxzsl,bzsl,tcnbz,sfbxx,0   ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjwjdqjmj";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
			//v＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//增加:客户过门石减免价＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhgmsjmj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhgmsjmj (khbh,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,sjjmsl,sjjmje,tcnbz,sfbxx,sfxzsl,fjbzmj,dypm,pmzjmj,zdpms,sjpms,lrr      ,lrsj)"; 
			ls_sql+=" select                        ?,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,0     ,0     ,tcnbz,sfbxx,sfxzsl,fjbzmj,dypm,pmzjmj,0    ,0    ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjgmsjmj";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();

			ls_sql="update tc_csrjkhgmsjmj set zdpms=dypm+FLOOR(("+fwmj+"-fjbzmj)/pmzjmj)"; //最大数量
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			//增加:客户过门石减免价＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
			
			
			//增加:客户常用套餐外项目（tc_khcytcwxm）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhcytcwxm "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhcytcwxm (khbh,tccplbbm,tccpdlbm,sjsl,lrr      ,lrsj)"; 
			ls_sql+=" select                         ?,tccplbbm,tccpdlbm,0   ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjcytcwxm";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
			//增加:客户常用套餐外项目（tc_khcytcwxm）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束


			//客户标准项目＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhbzxm "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhbzxm (khbh,xmmc,ppmc,xh,jldw,bhsl,bz,lrr,lrsj)"; 
			ls_sql+=" select                      ?,xmmc,ppmc,xh,jldw,bhsl,bz,?  ,SYSDATE";
			ls_sql+=" from tc_csrjbzxm";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setString(2,lrr);
			ps.executeUpdate();
			ps.close();
			//客户标准项目＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束


			//客户工程项目小计＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhgcxmxj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhgcxmxj (khbh,xmbh,bzsl,sfxzsl,sjsl,xjjsl,tcnxmbz)"; 
			ls_sql+=" select                        ?,xmbh,bzsl,sfxzsl,0   ,0    ,'Y'";
			ls_sql+=" from tc_csrjbzgcxm";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
			//客户工程项目小计＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

				
			ls_sql="delete from tc_csrjkhzcqd "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			if (hxbm.equals("13") || hxbm.equals("14") || hxbm.equals("15"))
			{
				ls_sql="delete from tc_csrjkhmmjmj "; 
				ls_sql+=" where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="delete from tc_csrjkhczjmj "; 
				ls_sql+=" where khbh='"+khbh+"'";
				ls_sql+=" and tccplbbm in(25,26)";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="delete from tc_csrjkhdbjmj "; 
				ls_sql+=" where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="delete from tc_csrjkhygjmj "; 
				ls_sql+=" where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="delete from tc_csrjkhwjdqjmj "; 
				ls_sql+=" where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="delete from tc_csrjkhgmsjmj "; 
				ls_sql+=" where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}


			ls_sql="delete from bj_khglxmb";
			ls_sql+=" where  khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

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

			ls_sql="delete from bj_sfxmmx";
			ls_sql+=" where  khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into bj_sfxmmx (khbh,sfxmbm,sfxmmc,sflx,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfbfb,zqsfje   ,dxzkl,sfje,bz,sfkdz,zdzk,sfxmlx,sfcysgdjs,dj  ,jldw,sl,sfssjf,cbjbfb,sgcbjbfb,gcjcbjbfb,sffqsk,cbjjsfs,sfjrhtjz ) ";
			ls_sql+=" select               ?   ,sfxmbm,sfxmmc,sflx,sfbxx,sfjrqye,jrsjbz,jrglfbz,0    ,gdje     ,10   ,gdje,bz,sfkdz,zdzk,sfxmlx,sfcysgdjs,gdje,jldw,1 ,sfssjf,cbjbfb,sgcbjbfb,gcjcbjbfb,sffqsk,cbjjsfs,sfjrhtjz";
			ls_sql+=" from bdm_sfxmbm ";
			ls_sql+=" where dqbm='"+dqbm+"' and sfbxx='1' and sfxmbm not in(select sfxmbm from bj_sfxmmx where khbh='"+khbh+"')";//1：必选；2：非必选；
			ls_sql+=" and (sfxsq='1' OR (sfxsq='2' and sfxmbm in(select sfxmbm from sq_sfxmsq where ygbh='"+ygbh+"')))";//1：不需授权；2：需授权使用
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
		}
	}
	else{//保留现有报价项目及工程量，只更新报价级别
		if (lx.equals("1"))//1：非套餐；2：套餐
		{
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
		else{//套餐＋＋＋＋＋＋＋＋＋＋＋＋
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



			//处理套餐项


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


			//增加报价项目，来源：套餐标准工程项目＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="insert into bj_bjxmmx (xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,clcb,rgcb,jxcb,cbenj,sgcbj,sgdbj,zqdj,zk,dj,sfyxdz,zdzk,gycl,flmcgg,bz,dqbm,bjjb,xmlx,jzbz,xmpx,sfzgzc,glxmbh,bjlx,sfbxx,lrr,lrsj   ,sfxycl,sfxyyjd,tcnxmbz ) ";
			ls_sql+=" select   ?+rownum,?,bj_jzbjb.xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clbj,rgbj,jxbj,zcf,shf,ysf,qtf,clcb,rgcb,jxcb,cbenj,sgcbj,sgdbj,bj  ,10,bj,sfyxdz,zdzk,gycl,flmcgg,bz,bj_jzbjb.dqbm,?,'1','1',?,'N'  ,glxmbh,'1' ,sfbxx,?  ,SYSDATE,sfxycl,sfxyyjd,'Y'";//1：需要；2：不需要
			ls_sql+=" from bj_jzbjb,tc_csrjbzgcxm ";
			ls_sql+=" where bj_jzbjb.dqbm='"+dqbm+"' and bj_jzbjb.bjjbbm='"+bjjb+"' and bj_jzbjb.bjbbh='"+bjbbh+"'";
			ls_sql+=" and tc_csrjbzgcxm.dqbm='"+dqbm+"' and tc_csrjbzgcxm.bjbbh='"+bjbbh+"'";
			ls_sql+=" and tc_csrjbzgcxm.bjjbbm='"+bjjb+"'";
			ls_sql+=" and bj_jzbjb.xmbh=tc_csrjbzgcxm.xmbh ";
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

			//客户套餐价格表＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhjgb "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhjgb (khbh,tcmc,mjpmdj,tnzxjjmj,cfdj,cfbzmj,cfccmjdj,wsjdj,wsjbzmj,wsjccmjdj,tlgbzjmj)"; 
			ls_sql+=" select                     ?,tcmc,mjpmdj,tnzxjjmj,cfdj,cfbzmj,cfccmjdj,wsjdj,wsjbzmj,wsjccmjdj,tlgbzjmj";
			ls_sql+=" from tc_csrjtcjgb";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
			//客户套餐价格表＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//增加:客户橱柜价格表（tc_csrjkhcgjmj）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhcgjmj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhcgjmj (khbh,tccplbbm,jgwzbm        ,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,sjjmsl,sjjmje,sfxzsl,tcnbz,sfbxx,bzsl,zdsl,sjsl,lrr      ,lrsj)"; 
			ls_sql+=" select                       ?,tccplbbm,bj_fjxx.jgwzbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,0     ,0     ,sfxzsl,tcnbz,sfbxx,bzsl,bzsl,0   ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjcgjmj,bj_fjxx";
			ls_sql+=" where tc_csrjcgjmj.dqbm='"+dqbm+"' and tc_csrjcgjmj.bjjbbm='"+bjjb+"'";
			ls_sql+=" and bj_fjxx.khbh='"+khbh+"'";
			ls_sql+=" and bj_fjxx.fjlx=1";//1：厨房；2：卫生间；3：卧室；4：客厅；5：餐厅；6：阳台
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
			//增加:客户橱柜价格表（tc_csrjkhcgjmj）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//增加:客户木门价格表（tc_khmmjgb）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhmmjmj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhmmjmj (khbh,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,sjjmsl,sjjmje,sfxzsl,tcnbz,sfbxx,bzmj,bzsl,mtmzjmj,zdsl,sjsl,lrr      ,lrsj)"; 
			ls_sql+=" select                       ?,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,0     ,0     ,sfxzsl,tcnbz,sfbxx,bzmj,bzsl,mtmzjmj,0   ,0   ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjmmjmj";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();

			ls_sql="update tc_csrjkhmmjmj set zdsl=bzsl+FLOOR(("+fwmj+"-bzmj)/mtmzjmj)"; //最大数量
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			//增加:客户木门价格表（tc_khmmjgb）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//客户洁具价格表（tc_khjjjgb）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhjjjmj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhjjjmj (khbh,tccplbbm,jgwzbm        ,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,sjjmsl,sjjmje,sfxzsl,bzsl,tcnbz,sfbxx,sjsl,lrr      ,lrsj)"; 
			ls_sql+=" select                       ?,tccplbbm,bj_fjxx.jgwzbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,0     ,0     ,sfxzsl,bzsl,tcnbz,sfbxx,0   ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjjjjmj,bj_fjxx";
			ls_sql+=" where tc_csrjjjjmj.dqbm='"+dqbm+"' and tc_csrjjjjmj.bjjbbm='"+bjjb+"'";
			ls_sql+=" and bj_fjxx.khbh='"+khbh+"'";
			ls_sql+=" and bj_fjxx.fjlx=2";//1：厨房；2：卫生间；3：卧室；4：客厅；5：餐厅；6：阳台
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
			//客户洁具价格表（tc_khjjjgb）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//客户磁砖价格表（tc_khczjgb）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhczjmj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhczjmj (khbh,tccplbbm,jgwzbm        ,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,sjjmsl,sjjmje,sjsl,lrr      ,lrsj)"; 
			ls_sql+=" select                       ?,tccplbbm,bj_fjxx.jgwzbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,0     ,0     ,0   ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjczjmj,bj_fjxx";
			ls_sql+=" where tc_csrjczjmj.dqbm='"+dqbm+"' and tc_csrjczjmj.bjjbbm='"+bjjb+"'";
			ls_sql+=" and tc_csrjczjmj.tccplbbm not in(25,26)";//大地砖/大地砖踢脚线
			ls_sql+=" and bj_fjxx.khbh='"+khbh+"'";
			ls_sql+=" and bj_fjxx.fjlx in(1,2)";//1：厨房；2：卫生间；3：卧室；4：客厅；5：餐厅；6：阳台
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhczjmj (khbh,tccplbbm,jgwzbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,sjjmsl,sjjmje,sjsl,lrr      ,lrsj)"; 
			ls_sql+=" select                       ?,tccplbbm,'其它',tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,0     ,0     ,0   ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjczjmj";
			ls_sql+=" where tc_csrjczjmj.dqbm='"+dqbm+"' and tc_csrjczjmj.bjjbbm='"+bjjb+"'";
			ls_sql+=" and tc_csrjczjmj.tccplbbm in(25,26)";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
			//客户磁砖价格表（tc_khczjgb）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//客户铝扣板价格表（tc_khlkbjgb）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhlkbjmj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhlkbjmj (khbh,tccplbbm,jgwzbm        ,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,sjjmsl,sjjmje,sjsl,lrr      ,lrsj)"; 
			ls_sql+=" select                        ?,tccplbbm,bj_fjxx.jgwzbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,0     ,0     ,0    ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjlkbjmj,bj_fjxx";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ls_sql+=" and bj_fjxx.khbh='"+khbh+"'";
			ls_sql+=" and bj_fjxx.fjlx in(1,2)";//1：厨房；2：卫生间；3：卧室；4：客厅；5：餐厅；6：阳台
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
			//客户铝扣板价格表（tc_khlkbjgb）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//客户地板减免价（tc_csrjkhdbjmj）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhdbjmj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhdbjmj (khbh,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,sjjmsl,sjjmje,sjsl,lrr      ,lrsj)"; 
			ls_sql+=" select                       ?,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,0     ,0     ,0   ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjdbjmj";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
			//客户地板减免价（tc_csrjkhdbjmj）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//增加:客户衣柜减免价（tc_csrjkhygjmj）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhygjmj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhygjmj (khbh,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,sjjmsl,sjjmje,tcnbz,sfbxx,sfxzsl,fjbzmj,dyygpm,pmzjmj,zdpms,sjpms,lrr      ,lrsj)"; 
			ls_sql+=" select                       ?,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,0     ,0     ,tcnbz,sfbxx,sfxzsl,fjbzmj,dyygpm,pmzjmj,0    ,0    ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjygjmj";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();

			ls_sql="update tc_csrjkhygjmj set zdpms=dyygpm+FLOOR(("+fwmj+"-fjbzmj)/pmzjmj)"; //最大数量
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			//增加:客户衣柜减免价（tc_csrjkhygjmj）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//客户五金电器减免价＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhwjdqjmj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhwjdqjmj (khbh,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,sjjmsl,sjjmje,sfxzsl,bzsl,tcnbz,sfbxx,sjsl,lrr      ,lrsj)"; 
			ls_sql+=" select                         ?,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,0     ,0     ,sfxzsl,bzsl,tcnbz,sfbxx,0   ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjwjdqjmj";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
			//v＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//增加:客户过门石减免价＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhgmsjmj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhgmsjmj (khbh,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,sjjmsl,sjjmje,tcnbz,sfbxx,sfxzsl,fjbzmj,dypm,pmzjmj,zdpms,sjpms,lrr      ,lrsj)"; 
			ls_sql+=" select                        ?,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,0     ,0     ,tcnbz,sfbxx,sfxzsl,fjbzmj,dypm,pmzjmj,0    ,0    ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjgmsjmj";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();

			ls_sql="update tc_csrjkhgmsjmj set zdpms=dypm+FLOOR(("+fwmj+"-fjbzmj)/pmzjmj)"; //最大数量
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			//增加:客户过门石减免价＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
			
			
			//增加:客户常用套餐外项目（tc_khcytcwxm）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhcytcwxm "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhcytcwxm (khbh,tccplbbm,tccpdlbm,sjsl,lrr      ,lrsj)"; 
			ls_sql+=" select                         ?,tccplbbm,tccpdlbm,0   ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjcytcwxm";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
			//增加:客户常用套餐外项目（tc_khcytcwxm）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束


			//客户标准项目＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhbzxm "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhbzxm (khbh,xmmc,ppmc,xh,jldw,bhsl,bz,lrr,lrsj)"; 
			ls_sql+=" select                      ?,xmmc,ppmc,xh,jldw,bhsl,bz,?  ,SYSDATE";
			ls_sql+=" from tc_csrjbzxm";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setString(2,lrr);
			ps.executeUpdate();
			ps.close();
			//客户标准项目＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束


			//客户工程项目小计＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhgcxmxj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhgcxmxj (khbh,xmbh,bzsl,sfxzsl,sjsl,xjjsl,tcnxmbz)"; 
			ls_sql+=" select                        ?,xmbh,bzsl,sfxzsl,0   ,0    ,'Y'";
			ls_sql+=" from tc_csrjbzgcxm";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();

			ls_sql="update bj_bjxmmx set tcnxmbz='Y'";
			ls_sql+=" where khbh='"+khbh+"'";
			ls_sql+=" and xmbh in(select xmbh from tc_csrjkhgcxmxj where khbh='"+khbh+"')";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			
			//客户工程项目小计＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

				
			ls_sql="delete from tc_csrjkhzcqd "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			if (hxbm.equals("13") || hxbm.equals("14") || hxbm.equals("15"))
			{
				ls_sql="delete from tc_csrjkhmmjmj "; 
				ls_sql+=" where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="delete from tc_csrjkhczjmj "; 
				ls_sql+=" where khbh='"+khbh+"'";
				ls_sql+=" and tccplbbm in(25,26)";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="delete from tc_csrjkhdbjmj "; 
				ls_sql+=" where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="delete from tc_csrjkhygjmj "; 
				ls_sql+=" where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="delete from tc_csrjkhwjdqjmj "; 
				ls_sql+=" where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="delete from tc_csrjkhgmsjmj "; 
				ls_sql+=" where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}


			ls_sql="delete from bj_khglxmb";
			ls_sql+=" where  khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

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

			ls_sql="delete from bj_sfxmmx";
			ls_sql+=" where  khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into bj_sfxmmx (khbh,sfxmbm,sfxmmc,sflx,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfbfb,zqsfje   ,dxzkl,sfje,bz,sfkdz,zdzk,sfxmlx,sfcysgdjs,dj  ,jldw,sl,sfssjf,cbjbfb,sgcbjbfb,gcjcbjbfb,sffqsk,cbjjsfs,sfjrhtjz ) ";
			ls_sql+=" select               ?   ,sfxmbm,sfxmmc,sflx,sfbxx,sfjrqye,jrsjbz,jrglfbz,0    ,gdje     ,10   ,gdje,bz,sfkdz,zdzk,sfxmlx,sfcysgdjs,gdje,jldw,1 ,sfssjf,cbjbfb,sgcbjbfb,gcjcbjbfb,sffqsk,cbjjsfs,sfjrhtjz";
			ls_sql+=" from bdm_sfxmbm ";
			ls_sql+=" where dqbm='"+dqbm+"' and sfbxx='1' and sfxmbm not in(select sfxmbm from bj_sfxmmx where khbh='"+khbh+"')";//1：必选；2：非必选；
			ls_sql+=" and (sfxsq='1' OR (sfxsq='2' and sfxmbm in(select sfxmbm from sq_sfxmsq where ygbh='"+ygbh+"')))";//1：不需授权；2：需授权使用
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();


		}
	}


	//处理删除项工程量
	ls_sql="delete from bj_gclmx ";
	ls_sql+=" where  khbh='"+khbh+"' and xmbh not in(select xmbh from bj_bjxmmx where khbh='"+khbh+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_gclmx ";
	ls_sql+=" where  khbh='"+khbh+"' and jgwzbm not in(select jgwzbm from bj_fjxx where khbh='"+khbh+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	//初始化
	dzbj.Tzk tzk=new dzbj.Tzk();
	//更新报价折扣
	tzk.updateBjZkl(conn,khbh,"yz");

	//更新其它收费项目，调整收费百分比
	dzbj.NewDzbj dzbj=new dzbj.NewDzbj();
	dzbj.updateSfxm(conn,khbh,"csrj");

	//获取电子报价金额
	dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();
	double dzbjze=dzbjje.getAllBjje(conn,khbh,"yz");

	//修改：电子报价总额
	ls_sql="update crm_zxkhxx set dzbjze=?,bjjb=?,hxbm=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.setString(2,bjjb);
	ps.setString(3,hxbm);
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

