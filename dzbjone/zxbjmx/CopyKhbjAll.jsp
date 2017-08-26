<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");

String drkhbh=request.getParameter("drkhbh");//导入客户
String dqbm=request.getParameter("dqbm");

String khbh=request.getParameter("khbh");//被拷贝客户

if (khbh.equals(drkhbh))
{
	out.println("错误！同一个客户不能互相复制");
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;

String ls_sql=null;
int count=0;
String wybh=null;
String xmbh=null;
try {
	conn=cf.getConnection();

	String getzxzt=null;//0：未分配店面；1: 分配店面；2: 店面退回客户；3：已签约；4：公司签单失败；5：重新分配店面
	ls_sql="SELECT zxzt";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
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

	//判断地区、报价级别是否一致
	String drbjjb=null;
	String drjzbz=null;
	String ssfgs=null;
	String drbjbbh=null;
	String drhxbm=null;
	ls_sql="select bjjb,jzbz,ssfgs,bjbbh,hxbm";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		drbjjb=rs.getString("bjjb");
		drjzbz=rs.getString("jzbz");
		ssfgs=rs.getString("ssfgs");
		drbjbbh=rs.getString("bjbbh");
		drhxbm=rs.getString("hxbm");
	}
	rs.close();
	ps.close();

	String drdqbm=null;
	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		drdqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();

	//被拷贝客户
	String mqbjjb=null;
	ls_sql="select bjjb";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mqbjjb=rs.getString("bjjb");
	}
	rs.close();
	ps.close();



	if (!drbjjb.equals(mqbjjb))
	{
		out.println("错误！不能拷贝，两者的报价级别不一致");
		return;
	}

	ls_sql=" select count(distinct bjjb)";
	ls_sql+=" from bj_bjxmmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>1)
	{
		out.println("错误！不能拷贝，报价明细中[报价级别]不一致");
		return;
	}


	//电子报价版本是否已停用
	int bjtyMark=0;
	ls_sql="select count(*)";
	ls_sql+=" from  bj_dzbjbb";
	ls_sql+=" where bjbbh='"+drbjbbh+"' and dqbm='"+drdqbm+"' and sfzybb='4'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjtyMark=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);


	//清除报价
	ls_sql=" delete from bj_bjxmmx ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_khglxmb ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_fjxx ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_gclmx ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_sfxmmx ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_khglfxb ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_khgcxmxj ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_khzcxmxj ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_khzcxm ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//房间信息
	ls_sql="insert into bj_fjxx (khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,xuhao,bz,fjzcxq) ";
	ls_sql+=" select     '"+drkhbh+"',jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,xuhao,bz,fjzcxq";
	ls_sql+=" from bj_fjxx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//工程量明细
	ls_sql="insert into bj_gclmx (khbh,dqbm,xmbh,jgwzbm,sl,bz,fjnxh)";
	ls_sql+=" select      '"+drkhbh+"',dqbm,xmbh,jgwzbm,sl,bz,fjnxh";
	ls_sql+=" from bj_gclmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//其它收费项目明细
	String getsfxmbm=null;
	double getsl=0;
	double getdxzkl=0;
	ls_sql="select sfxmbm,sl,dxzkl";
	ls_sql+=" from bj_sfxmmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getsfxmbm=rs.getString("sfxmbm");
		getsl=rs.getDouble("sl");
		getdxzkl=rs.getDouble("dxzkl");

		ls_sql="insert into bj_sfxmmx (khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfkdz,zdzk,sfbfb,dj,jldw,sl,zqsfje,dxzkl,sfje,bz,sfssjf,cbjbfb,sgcbjbfb,gcjcbjbfb,sffqsk,cbjjsfs,sfjrhtjz)";
		ls_sql+=" select       '"+drkhbh+"',sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfkdz,zdzk,0,gdje,jldw,"+getsl+","+getsl+"*gdje,"+getdxzkl+","+getsl+"*gdje*"+getdxzkl+"/10,bz,sfssjf,cbjbfb,sgcbjbfb,gcjcbjbfb,sffqsk,cbjjsfs,sfjrhtjz";
		ls_sql+=" from bdm_sfxmbm ";
		ls_sql+=" where sfxmbm='"+getsfxmbm+"' and dqbm='"+drdqbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();
 
	long xh=0;
	ls_sql="select NVL(max(xh),0)";
	ls_sql+=" from  bj_bjxmmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getLong(1);
	}
	rs.close();
	ps.close();

	//报价项目明细
	//用项目编号和地区编码重新取数据，wybh可能已发生变化

	String getxmbh=null;
	double getzk=0;
	int getxmpx=0;
	ls_sql="select xmbh,zk,xmpx";
	ls_sql+=" from bj_bjxmmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and bjlx='1'";//1:标准项目;2:自定义项目
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		getxmbh=rs1.getString("xmbh");
		getzk=rs1.getDouble("zk");
		getxmpx=rs1.getInt("xmpx");

		xh++;

		String tcnxmbz="N";//套餐内项目标志
		ls_sql="select count(*)";
		ls_sql+=" from  bj_tcbzgcxm";
		ls_sql+=" where bjbbh='"+drbjbbh+"' and dqbm='"+drdqbm+"' and bjjbbm='"+drbjjb+"' and hxbm='"+drhxbm+"' and xmbh='"+getxmbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count>0)
		{
			tcnxmbz="Y";
		}

		String glxmbh="";

		if (bjtyMark>0)//已停用，从表[bj_jzbjb1]取数据而非表[bj_jzbjb]
		{
			//关联项目编号
			ls_sql="select glxmbh";
			ls_sql+=" from  bj_jzbjb1";
			ls_sql+=" where dqbm='"+drdqbm+"' and bjjbbm='"+drbjjb+"' and xmbh='"+getxmbh+"' and bj_jzbjb1.bjbbh='"+drbjbbh+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				glxmbh=cf.fillNull(rs.getString("glxmbh"));
			}
			rs.close();
			ps.close();

			ls_sql="insert into bj_bjxmmx (xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,zqdj,zk,dj,clcb,rgcb,jxcb,cbenj,sgcbj,sgdbj,sfyxdz,zdzk,gycl,flmcgg,bz,dqbm,bjjb,bjlx,xmlx,jzbz,xmpx,sfzgzc,glxmbh,sfbxx,lrr,lrsj,sfxycl,sfxyyjd,tcnxmbz ) ";
			ls_sql+=" select                   ?,?,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clbj,rgbj,jxbj,zcf,shf,ysf,qtf,bj  ,?,bj,clcb,rgcb,jxcb,cbenj,sgcbj,sgdbj,sfyxdz,zdzk,gycl,flmcgg,bz,dqbm,?,'1','1','1',?,'N',glxmbh,sfbxx,'"+yhdlm+"',SYSDATE,sfxycl,sfxyyjd,'"+tcnxmbz+"'";//1：需要；2：不需要
			ls_sql+=" from bj_jzbjb1 ";
			ls_sql+=" where dqbm='"+drdqbm+"' and bjjbbm='"+drbjjb+"' and xmbh='"+getxmbh+"' and bj_jzbjb1.bjbbh='"+drbjbbh+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,xh);
			ps.setString(2,drkhbh);
			ps.setDouble(3,getzk);
			ps.setString(4,drbjjb);
			ps.setInt(5,getxmpx);
			ps.executeUpdate();
			ps.close();


			//客户工料分析表（bj_khglfxb）
			ls_sql="delete from bj_khglfxb ";
			ls_sql+=" where khbh='"+drkhbh+"' and xmbh='"+getxmbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into bj_khglfxb (khbh,glbxh,dqbm,bjjb  ,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx) ";
			ls_sql+="                   select ?,glbxh,dqbm,bjjbbm,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx ";
			ls_sql+=" from bj_jzglfxb1 ";
			ls_sql+=" where dqbm='"+drdqbm+"' and bjbbh='"+drbjbbh+"' and xmbh='"+getxmbh+"' and bjjbbm='"+drbjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,drkhbh);
			ps.executeUpdate();
			ps.close();

		}
		else{//未停用，从表[bj_jzbjb]取数据而非表[bj_jzbjb1]
			//关联项目编号
			ls_sql="select glxmbh";
			ls_sql+=" from  bj_jzbjb";
			ls_sql+=" where dqbm='"+drdqbm+"' and bjjbbm='"+drbjjb+"' and xmbh='"+getxmbh+"' and bj_jzbjb.bjbbh='"+drbjbbh+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				glxmbh=cf.fillNull(rs.getString("glxmbh"));
			}
			rs.close();
			ps.close();

			ls_sql="insert into bj_bjxmmx (xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,zqdj,zk,dj,clcb,rgcb,jxcb,cbenj,sgcbj,sgdbj,sfyxdz,zdzk,gycl,flmcgg,bz,dqbm,bjjb,bjlx,xmlx,jzbz,xmpx,sfzgzc,glxmbh,sfbxx,lrr,lrsj,sfxycl,sfxyyjd,tcnxmbz ) ";
			ls_sql+=" select                   ?,?,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clbj,rgbj,jxbj,zcf,shf,ysf,qtf,bj  ,?,bj,clcb,rgcb,jxcb,cbenj,sgcbj,sgdbj,sfyxdz,zdzk,gycl,flmcgg,bz ,dqbm,?   ,'1' ,'1' ,'1' ,?   ,'N',glxmbh,sfbxx,'"+yhdlm+"',SYSDATE,sfxycl,sfxyyjd,'"+tcnxmbz+"'";//1：需要；2：不需要
			ls_sql+=" from bj_jzbjb";
			ls_sql+=" where dqbm='"+drdqbm+"' and bjjbbm='"+drbjjb+"' and xmbh='"+getxmbh+"' and bj_jzbjb.bjbbh='"+drbjbbh+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,xh);
			ps.setString(2,drkhbh);
			ps.setDouble(3,getzk);
			ps.setString(4,drbjjb);
			ps.setInt(5,getxmpx);
			ps.executeUpdate();
			ps.close();


			//客户工料分析表（bj_khglfxb）
			ls_sql="delete from bj_khglfxb ";
			ls_sql+=" where khbh='"+drkhbh+"' and xmbh='"+getxmbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into bj_khglfxb (khbh,glbxh,dqbm,bjjb  ,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx) ";
			ls_sql+="                   select ?,glbxh,dqbm,bjjbbm,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx ";
			ls_sql+=" from bj_jzglfxb ";
			ls_sql+=" where dqbm='"+drdqbm+"' and bjbbh='"+drbjbbh+"' and xmbh='"+getxmbh+"' and bjjbbm='"+drbjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,drkhbh);
			ps.executeUpdate();
			ps.close();

		}
	}
	rs1.close();
	ps1.close();

	ls_sql="insert into         bj_bjxmmx(xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clcb,rgcb,jxcb,cbenj,sgcbj,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,zqdj,zk,dj,sgdbj,sfyxdz,zdzk,gycl,flmcgg,bz,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,xmpx,glxmbh,lrr,lrsj,tcnxmbz)";
	ls_sql+=" select   "+xh+"+rownum,'"+drkhbh+"',xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clcb,rgcb,jxcb,cbenj,sgcbj,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,zqdj,zk,dj,sgdbj,sfyxdz,zdzk,gycl,flmcgg,bz,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,xmpx,glxmbh,lrr,lrsj,tcnxmbz";
	ls_sql+=" from bj_bjxmmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and bjlx='2'";//1:标准项目;2:自定义项目
	ls_sql+=" order by bj_bjxmmx.xh";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_khglxmb (khbh,xmbh,glxmbh)";
	ls_sql+=" select        '"+drkhbh+"',xmbh,glxmbh ";
	ls_sql+=" from bj_khglxmb ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into      bj_khgcxmxj (khbh,xmbh,bzsl,sfxzsl,ccbfjj,sjsl,xjjsl,tcnxmbz)";
	ls_sql+=" select               '"+drkhbh+"',xmbh,bzsl,sfxzsl,ccbfjj,sjsl,xjjsl,tcnxmbz";
	ls_sql+=" from bj_khgcxmxj ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into      bj_khzcxmxj (khbh,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,sfxzsl,bzsl,sfyqxtpp,sjsl,sjjshsl,khbjjbbm,bjjbbm)";
	ls_sql+=" select              '"+drkhbh+"',jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,sfxzsl,bzsl,sfyqxtpp,sjsl,sjjshsl,khbjjbbm,bjjbbm";
	ls_sql+=" from bj_khzcxmxj ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into      bj_khzcxm (khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,dj,jsj,sh,sfcscp,bz,sl,ptcpsm,bjjbbm)";
	ls_sql+=" select            '"+drkhbh+"',jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,dj,jsj,sh,sfcscp,bz,sl,ptcpsm,bjjbbm";
	ls_sql+=" from bj_khzcxm ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	//修改：电子报价总额
	ls_sql="update crm_zxkhxx set sfzdzbj='Y'";
	ls_sql+=" where  khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();



	//复制主材
	//复制主材
	int zcxh=0;
	ls_sql="select NVL(max(xh),0)";
	ls_sql+=" from  bj_khzcmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql ="delete from bj_khzcmx ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql ="insert into bj_khzcmx (xh,khbh,zcbm,xsxh,zcmc,zcdlbm,zcxlbm,ppbm,gys,ppmc,zclbbm,xinghao,gg,zcysbm,cz,zdxsj,zcpzwzbm,xzjg,jldwbm,zqdj,dpzk,dj,sfzp,zsdj,jgfs,jsfs,cbj,jsbl,sl,zqje,je,ycf,qtfy,qtfyje,cxhdbz,cxhdbl,cxhdje,yjjrbl,yjjrje,sxbz,sxhtyy,sftjp,fjddbh,ddmxxh,lrr,lrsj   ,bz)";
	ls_sql+="        select   ?+rownum,?   ,zcbm,xsxh,zcmc,zcdlbm,zcxlbm,ppbm,gys,ppmc,zclbbm,xinghao,gg,zcysbm,cz,zdxsj,zcpzwzbm,xzjg,jldwbm,zqdj,dpzk,dj,sfzp,zsdj,jgfs,jsfs,cbj,jsbl,sl,zqje,je,ycf,qtfy,qtfyje,cxhdbz,cxhdbl,cxhdje,yjjrbl,yjjrje,sxbz,sxhtyy,sftjp,''    ,''    ,?  ,SYSDATE,bz";
	ls_sql+=" FROM bj_khzcmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,zcxh);
	ps.setString(2,drkhbh);
	ps.setString(3,yhmc);
	ps.executeUpdate();
	ps.close();

	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("报价复制成功！");
	window.close();
	//-->
	</SCRIPT>
	<%


}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>" + ls_sql);
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