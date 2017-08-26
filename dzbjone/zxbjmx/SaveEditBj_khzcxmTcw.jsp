<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

double sl=0;
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[数量]类型转换发生意外:"+e);
	return;
}

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String oldcpbm=cf.GB2Uni(request.getParameter("oldcpbm"));
String cpbm=cf.GB2Uni(request.getParameter("cpbm"));
String jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
String tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
String ptcpsm=cf.GB2Uni(request.getParameter("ptcpsm"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String oldsxh=cf.GB2Uni(request.getParameter("sxh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String getzxzt=null;//0：未分配店面；1: 分配店面；2: 店面退回客户；3：已签约；4：公司签单失败；5：重新分配店面
	ls_sql="SELECT zxzt";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
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


	String sfxzsl="";
	double bzsl=0;
	String tcsjflbm="";
	double ghzj=0;//更换折价
	double khzdsl=0;//可换最大数量
	ls_sql="select sfxzsl,bzsl,tcsjflbm,ghzj,khzdsl";
	ls_sql+=" FROM bj_khzcxmxj";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		tcsjflbm=cf.fillNull(rs.getString("tcsjflbm"));
		bzsl=rs.getDouble("bzsl");
		ghzj=rs.getDouble("ghzj");
		khzdsl=rs.getDouble("khzdsl");
	}
	rs.close();
	ps.close();

	bzsl=khzdsl;

	//是否要求相同品牌
	int sfyqxtpp=0;
	ls_sql="select count(*)";
	ls_sql+=" FROM bj_khzcxmxj";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"' and sfyqxtpp='Y'";//Y：是；N：否
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfyqxtpp=rs.getInt(1);
	}
	rs.close();
	ps.close();

	String getcpbm="";
	String zclx="";
	String sfxclxs="";
	double xdb=0;
	double sh=0;
	ls_sql="select cpbm,zclx,sfxclxs,xdb,sh";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where sxh="+oldsxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getcpbm=rs.getString(1);
		zclx=cf.fillNull(rs.getString("zclx"));
		sfxclxs=cf.fillNull(rs.getString("sfxclxs"));
		xdb=rs.getDouble("xdb");
		sh=rs.getDouble("sh");
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	if (getcpbm.equals(cpbm))//产品未发生变化
	{
		double xdsl=0;
		if (sfxclxs.equals("1"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
		{
			if (sl<0)
			{
				xdsl=java.lang.Math.floor(sl*xdb*(100+sh)/100);
			}
			else{
				xdsl=java.lang.Math.ceil(sl*xdb*(100+sh)/100);
			}
		}
		else if (sfxclxs.equals("2"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
		{
			if (sl<0)
			{
				xdsl=java.lang.Math.ceil(sl*xdb*(100+sh)/100);
			}
			else{
				xdsl=java.lang.Math.floor(sl*xdb*(100+sh)/100);
			}
		}
		else if (sfxclxs.equals("3"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
		{
			xdsl=cf.round(sl*xdb*(100+sh)/100,0);
		}
		else if (sfxclxs.equals("4"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
		{
			xdsl=cf.round(sl*xdb*(100+sh)/100,2);
		}

		ls_sql=" update bj_khzcxm set sl=?,xdsl=?,ptcpsm=?";
		ls_sql+=" where sxh="+oldsxh;
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,sl);
		ps.setDouble(2,xdsl);
		ps.setString(3,ptcpsm);
		ps.executeUpdate();
		ps.close();
	}
	else{//产品已更换
		//获取新产品信息
		String tccpdlbm=null;
//		String tccplbbm=null;
		String cpmc=null;
		String ppmc=null;
		String gysmc=null;
		String xh=null;
		String gg=null;
		String jldw=null;
		String xdjldw=null;



		String sfyx=null;
		java.sql.Date yxkssj=null;
		java.sql.Date yxjzsj=null;
		double dj=0;
		String jsfs=null;
		double jsj=0;
		double jsbl=0;
		String jjfs=null;

		String bz=null;
		String sfkgdj=null;

		String sfycx="";
		String cxkssj="";
		String cxjssj="";
		double cxj=0;
		double cxjsj=0;
		double cxjsbl=0;

		ls_sql=" select tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb ";
		ls_sql+=" ,sfxclxs,sfyx,yxkssj,yxjzsj,dj,jsfs,jsj,jsbl,jjfs,sh   ,bz,sfkgdj ";
		ls_sql+=" ,sfycx,cxkssj,cxjssj,cxj,cxjsj,cxjsbl";
		ls_sql+=" from bj_tcwzck";
		ls_sql+=" where cpbm='"+cpbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			sfycx=cf.fillNull(rs.getString("sfycx"));
			cxkssj=cf.fillNull(rs.getDate("cxkssj"));
			cxjssj=cf.fillNull(rs.getDate("cxjssj"));
			cxj=rs.getDouble("cxj");
			cxjsj=rs.getDouble("cxjsj");
			cxjsbl=rs.getDouble("cxjsbl");

			tccpdlbm=cf.fillNull(rs.getString("tccpdlbm"));
			tccplbbm=cf.fillNull(rs.getString("tccplbbm"));
			cpmc=cf.fillNull(rs.getString("cpmc"));
			ppmc=cf.fillNull(rs.getString("ppmc"));
			gysmc=cf.fillNull(rs.getString("gysmc"));
			xh=cf.fillNull(rs.getString("xh"));
			gg=cf.fillNull(rs.getString("gg"));
			jldw=cf.fillNull(rs.getString("jldw"));
			xdjldw=cf.fillNull(rs.getString("xdjldw"));
			xdb=rs.getDouble("xdb");

			sfxclxs=cf.fillNull(rs.getString("sfxclxs"));
			sfyx=cf.fillNull(rs.getString("sfyx"));
			yxkssj=rs.getDate("yxkssj");
			yxjzsj=rs.getDate("yxjzsj");
			dj=rs.getDouble("dj");
			jsfs=cf.fillNull(rs.getString("jsfs"));
			jsj=rs.getDouble("jsj");
			jsbl=rs.getDouble("jsbl");
			jjfs=cf.fillNull(rs.getString("jjfs"));
			sh=rs.getDouble("sh");

			bz=cf.fillNull(rs.getString("bz"));
			sfkgdj=cf.fillNull(rs.getString("sfkgdj"));
		}
		rs.close();
		ps.close();

		if (sfycx.equals("Y"))//Y：有促销；N：无促销
		{
			if (cxkssj.compareTo(cf.today())<=0 && cxjssj.compareTo(cf.today())>=0)
			{
				dj=cxj;
				jsj=cxjsj;
				jsbl=cxjsbl;
			}
			else{
				sfycx="N";
			}
		}

		double bcj=dj-ghzj;//升级补差价

		if (bcj<0)
		{
			bcj=0;
		}

		double xdsl=0;
		if (sfxclxs.equals("1"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
		{
			if (sl<0)
			{
				xdsl=java.lang.Math.floor(sl*xdb*(100+sh)/100);
			}
			else{
				xdsl=java.lang.Math.ceil(sl*xdb*(100+sh)/100);
			}
		}
		else if (sfxclxs.equals("2"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
		{
			if (sl<0)
			{
				xdsl=java.lang.Math.ceil(sl*xdb*(100+sh)/100);
			}
			else{
				xdsl=java.lang.Math.floor(sl*xdb*(100+sh)/100);
			}
		}
		else if (sfxclxs.equals("3"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
		{
			xdsl=cf.round(sl*xdb*(100+sh)/100,0);
		}
		else if (sfxclxs.equals("4"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
		{
			xdsl=cf.round(sl*xdb*(100+sh)/100,2);
		}

		ls_sql=" update bj_khzcxm set cpbm=?,tccpdlbm=?,tccplbbm=?,cpmc=?,ppmc=?,gysmc=?,xh=?,gg=?,jldw=?,xdjldw=? ";
		ls_sql+=" ,xdb=?,sfxclxs=?,sfyx=?,yxkssj=?,yxjzsj=?,tcndj=?,tccldj=?,dj=?,jsfs=?,jsj=? ";
		ls_sql+=" ,jsbl=?,ddcljjfs=?,sh=?,sfcscp=?,bz=?,sfkgdj=?";
		ls_sql+=" ,sl=?,xdsl=?,ptcpsm=?";
		ls_sql+=" where sxh="+oldsxh;
		ps= conn.prepareStatement(ls_sql);

		ps.setString(1,cpbm);
		ps.setString(2,tccpdlbm);
		ps.setString(3,tccplbbm);
		ps.setString(4,cpmc);
		ps.setString(5,ppmc);
		ps.setString(6,gysmc);
		ps.setString(7,xh);
		ps.setString(8,gg);
		ps.setString(9,jldw);
		ps.setString(10,xdjldw);

		ps.setDouble(11,xdb);
		ps.setString(12,sfxclxs);
		ps.setString(13,sfyx);
		ps.setDate(14,yxkssj);
		ps.setDate(15,yxjzsj);
		ps.setDouble(16,bcj);
		ps.setDouble(17,dj);
		if (zclx.equals("3"))//1：套餐内；2：套餐外；3：升级大店；4：独立收费
		{
			ps.setDouble(18,bcj);
		}
		else{
			ps.setDouble(18,dj);
		}
		ps.setString(19,jsfs);
		ps.setDouble(20,jsj);

		ps.setDouble(21,jsbl);
		ps.setString(22,jjfs);
		ps.setDouble(23,sh);
		ps.setString(24,"N");//Y：是；N：否
		ps.setString(25,bz);
		ps.setString(26,sfkgdj);

		ps.setDouble(27,sl);
		ps.setDouble(28,xdsl);
		ps.setString(29,ptcpsm);
		ps.executeUpdate();
		ps.close();
	}

	

	//因数量修改，大店内外发生，大店外改为大店内，或大店内改为大店外＋＋＋＋＋＋＋＋＋＋开始
	String getsxh="";
	double tcndj=0;
	double tccldj=0;
	double getsl=0;
	ls_sql="select sxh,sl,tcndj,tccldj,sfxclxs,xdb,sh";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getsxh=rs.getString("sxh");
		getsl=rs.getDouble("sl");
		tcndj=rs.getDouble("tcndj");
		tccldj=rs.getDouble("tccldj");
		sfxclxs=cf.fillNull(rs.getString("sfxclxs"));
		xdb=rs.getDouble("xdb");
		sh=rs.getDouble("sh");

		//客户主材小计汇总：＋＋＋＋＋＋＋＋＋＋＋＋开始
		double sjsl=0;//实际数量
		ls_sql="select sum(sl)";
		ls_sql+=" FROM bj_khzcxm";
		ls_sql+=" where sxh!='"+getsxh+"' and khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='3'";//1：套餐内；2：套餐外收费；3：大店
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjsl=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();


		if (sfxzsl.equals("1"))//1:超量需加价;2:不可超量;3:无数量限制
		{
			if ((sjsl+getsl)<=bzsl)//转为套餐内
			{
				ls_sql="update bj_khzcxm set zclx='3',dj=tcndj";
				ls_sql+=" where sxh='"+getsxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
			else if (sjsl>=bzsl)//全部转为套餐外
			{
				ls_sql="update bj_khzcxm set zclx='4',dj=tccldj";
				ls_sql+=" where sxh='"+getsxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
			else if (sjsl<bzsl)//(bzsl-sjsl)部分转为套餐内
			{
				double getxdsl=0;
				if (sfxclxs.equals("1"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
				{
					if ((sjsl+getsl-bzsl)<0)
					{
						getxdsl=java.lang.Math.floor((sjsl+getsl-bzsl)*xdb*(100+sh)/100);
					}
					else{
						getxdsl=java.lang.Math.ceil((sjsl+getsl-bzsl)*xdb*(100+sh)/100);
					}
				}
				else if (sfxclxs.equals("2"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
				{
					if ((sjsl+getsl-bzsl)<0)
					{
						getxdsl=java.lang.Math.ceil((sjsl+getsl-bzsl)*xdb*(100+sh)/100);
					}
					else{
						getxdsl=java.lang.Math.floor((sjsl+getsl-bzsl)*xdb*(100+sh)/100);
					}
				}
				else if (sfxclxs.equals("3"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
				{
					getxdsl=cf.round((sjsl+getsl-bzsl)*xdb*(100+sh)/100,0);
				}
				else if (sfxclxs.equals("4"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
				{
					getxdsl=cf.round((sjsl+getsl-bzsl)*xdb*(100+sh)/100,2);
				}

				ls_sql="update bj_khzcxm set zclx='4',dj=tccldj,sl="+(sjsl+getsl-bzsl)+",xdsl="+getxdsl;
				ls_sql+=" where sxh='"+getsxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();

				long newsxh=0;
				ls_sql="select NVL(max(sxh),0)";
				ls_sql+=" from  bj_khzcxm";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					newsxh=rs1.getLong(1);
				}
				rs1.close();
				ps1.close();

				newsxh++;

				if (sfxclxs.equals("1"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
				{
					if ((bzsl-sjsl)<0)
					{
						getxdsl=java.lang.Math.floor((bzsl-sjsl)*xdb*(100+sh)/100);
					}
					else{
						getxdsl=java.lang.Math.ceil((bzsl-sjsl)*xdb*(100+sh)/100);
					}
				}
				else if (sfxclxs.equals("1"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
				{
					if ((bzsl-sjsl)<0)
					{
						getxdsl=java.lang.Math.ceil((bzsl-sjsl)*xdb*(100+sh)/100);
					}
					else{
						getxdsl=java.lang.Math.floor((bzsl-sjsl)*xdb*(100+sh)/100);
					}
				}
				else if (sfxclxs.equals("1"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
				{
					getxdsl=cf.round((bzsl-sjsl)*xdb*(100+sh)/100,0);
				}
				else if (sfxclxs.equals("1"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
				{
					getxdsl=cf.round((bzsl-sjsl)*xdb*(100+sh)/100,2);
				}

				ls_sql=" insert into bj_khzcxm (sxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj   ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm) ";
				ls_sql+=" select                ?+1,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,tcndj,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,?   ,? ,?   ,ptcpsm,bjjbbm";
				ls_sql+=" from bj_khzcxm";
				ls_sql+=" where sxh='"+getsxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.setLong(1,newsxh);
				ps1.setString(2,"3");//主材类型  1：套餐内；2：套餐外收费；3：大店
				ps1.setDouble(3,bzsl-sjsl);
				ps1.setDouble(4,getxdsl);
				ps1.executeUpdate();
				ps1.close();
			}
		}
	}
	rs.close();
	ps.close();

	//因数量修改，大店内外发生，大店外改为大店内，或大店内改为大店外＝＝＝＝＝＝＝＝＝＝结束


	//检查：要求相同品牌＋＋＋＋＋＋＋＋＋＋＋＋开始
	if (sfyqxtpp>0)//升级分类:要求相同品牌
	{
		int ppsl=0;
		ls_sql="select count(distinct ppmc)";
		ls_sql+=" FROM bj_khzcxm";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm in (select tccplbbm from bj_khzcxmxj where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"' and sfyqxtpp='Y')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ppsl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (ppsl>1)
		{
			conn.rollback();
			out.println("错误！[升级分类]中要求同一品牌，实际选了["+ppsl+"]个品牌");
			return;
		}
	}
	//检查：要求相同品牌＝＝＝＝＝＝＝＝＝＝＝＝结束


	//客户主材小计汇总：＋＋＋＋＋＋＋＋＋＋＋＋开始
	double sjsl=0;//实际数量
	double sjjshsl=0;//实际加损耗数量
	ls_sql="select sum(sl),sum(ROUND(sl*(100+sh)/100,2))";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='3'";
	//1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsl=rs.getDouble(1);
		sjjshsl=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	if (sfxzsl.equals("2"))//1:超量需加价;2:不可超量;3:无数量限制
	{
		if (sjsl>bzsl)
		{
			conn.rollback();
			out.println("错误！不可超量，实际数量["+sjsl+"]不能超过标准数量["+bzsl+"]");
			return;
		}
	}

	ls_sql="select sum(sl),sum(ROUND(sl*(100+sh)/100,2))";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsl=rs.getDouble(1);
		sjjshsl=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="update bj_khzcxmxj set sjsl="+sjsl+",sjjshsl="+sjjshsl;
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//客户主材小计汇总：＝＝＝＝＝＝＝＝＝＝＝＝结束

	
	//检查：小类数量限制：＋＋＋＋＋＋＋＋＋＋＋＋开始
	double tcslxz=0;//套餐数量限制
	String clxlmc="";
	String getsfxzsl="";//是否限制数量  1：不限制；2：不能超量；3：可超量需加价
	ls_sql="select tcslxz,clxlmc,sfxzsl";
	ls_sql+=" FROM bj_khclxlxz";
	ls_sql+=" where khbh='"+khbh+"' and clxlbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcslxz=rs.getDouble("tcslxz");
		clxlmc=cf.fillNull(rs.getString("clxlmc"));
		getsfxzsl=cf.fillNull(rs.getString("sfxzsl"));
	}
	rs.close();
	ps.close();

	double xlsjsl=0;
	double xlsjjshsl=0;
	ls_sql="select sum(sl),sum(ROUND(sl*(100+sh)/100,2))";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and tccplbbm='"+tccplbbm+"' and zclx='3'";//1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xlsjsl=rs.getDouble(1);
		xlsjjshsl=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	if (getsfxzsl.equals("2"))//1：不限制；2：不能超量；3：可超量需加价
	{
		if (xlsjsl>tcslxz)
		{
			out.println("<P>类别【"+clxlmc+"】产品选择如下：");
			String getjgwzbm=null;
			String getcpmc=null;
			String getxh=null;
			getsl=0;
			ls_sql="select jgwzbm,cpmc,xh,sl";
			ls_sql+=" FROM bj_khzcxm";
			ls_sql+=" where khbh='"+khbh+"' and tccplbbm='"+tccplbbm+"' and zclx='3'";//1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				getjgwzbm=rs.getString("jgwzbm");
				getcpmc=rs.getString("cpmc");
				getxh=rs.getString("xh");
				getsl=rs.getDouble("sl");

				out.println("<BR>位置:"+getjgwzbm+"、产品名称:"+getcpmc+"、型号:"+getxh+"、数量:"+getsl);
			}
			rs.close();
			ps.close();

			conn.rollback();
			out.println("<P>错误！类别【"+clxlmc+"】限制总数量，总数量["+xlsjsl+"]不能超过限制数量["+tcslxz+"]");
			return;
		}
	}
	//检查：小类数量限制：＝＝＝＝＝＝＝＝＝＝＝＝结束
	
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>