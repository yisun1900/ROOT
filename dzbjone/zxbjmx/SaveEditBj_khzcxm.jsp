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
	String khbjjbbm=null;
	String ssfgs=null;
	ls_sql="SELECT zxzt,bjjb,ssfgs";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
		khbjjbbm=rs.getString("bjjb");
		ssfgs=rs.getString("ssfgs");
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

	String sfxzsl="";
	double bzsl=0;
	String tcsjflbm="";
	ls_sql="select sfxzsl,bzsl,tcsjflbm";
	ls_sql+=" FROM bj_khzcxmxj";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		tcsjflbm=cf.fillNull(rs.getString("tcsjflbm"));
		bzsl=rs.getDouble("bzsl");
	}
	rs.close();
	ps.close();

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
	String ppmc=null;
	String sfxclxs="";
	double xdb=0;
	double sh=0;
	ls_sql="select cpbm,zclx,ppmc,sfxclxs,xdb,sh";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where sxh="+oldsxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getcpbm=rs.getString(1);
		zclx=cf.fillNull(rs.getString("zclx"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
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
		String sku=null;
		String tccpdlbm=null;
//		String tccplbbm=null;
//		String tcsjflbm=null;
		String cpmc=null;
//		String ppmc=null;
		String gysmc=null;
		String xh=null;
		String gg=null;

		String jldw=null;
		String xdjldw=null;

		String sfyx=null;
		java.sql.Date yxkssj=null;
		java.sql.Date yxjzsj=null;
		double dj=0;
		double tccldj=0;
		double jsj=0;

		String sfcscp=null;
		String bz=null;
		String sfkgdj=null;

		ls_sql=" select sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg  ";
		ls_sql+=" ,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,dj,tccldj,jsj    ,sh,sfcscp,bz,sfkgdj ";
		ls_sql+=" from bj_tczcbj";
		ls_sql+=" where cpbm='"+cpbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			sku=cf.fillNull(rs.getString("sku"));
			tccpdlbm=cf.fillNull(rs.getString("tccpdlbm"));
			tccplbbm=cf.fillNull(rs.getString("tccplbbm"));
			tcsjflbm=cf.fillNull(rs.getString("tcsjflbm"));
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
			tccldj=rs.getDouble("tccldj");
			jsj=rs.getDouble("jsj");

			sh=rs.getDouble("sh");
			sfcscp=cf.fillNull(rs.getString("sfcscp"));
			bz=cf.fillNull(rs.getString("bz"));
			sfkgdj=cf.fillNull(rs.getString("sfkgdj"));
		}
		rs.close();
		ps.close();

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

		ls_sql=" update bj_khzcxm set cpbm=?,sku=?,tccpdlbm=?,tccplbbm=?,tcsjflbm=?,cpmc=?,ppmc=?,gysmc=?,xh=?,gg=? ";
		ls_sql+=" ,jldw=?,xdjldw=?,xdb=?,sfxclxs=?,sfyx=?,yxkssj=?,yxjzsj=?,tcndj=?,tccldj=?,dj=? ";
		ls_sql+=" ,jsfs=?,jsj=?,jsbl=?,sh=?,sfcscp=?,bz=?,sfkgdj=?";
		ls_sql+=" ,sl=?,xdsl=?,ptcpsm=?";
		ls_sql+=" where sxh="+oldsxh;
		ps= conn.prepareStatement(ls_sql);

		ps.setString(1,cpbm);
		ps.setString(2,sku);
		ps.setString(3,tccpdlbm);
		ps.setString(4,tccplbbm);
		ps.setString(5,tcsjflbm);
		ps.setString(6,cpmc);
		ps.setString(7,ppmc);
		ps.setString(8,gysmc);
		ps.setString(9,xh);
		ps.setString(10,gg);

		ps.setString(11,jldw);
		ps.setString(12,xdjldw);
		ps.setDouble(13,xdb);
		ps.setString(14,sfxclxs);
		ps.setString(15,sfyx);
		ps.setDate(16,yxkssj);
		ps.setDate(17,yxjzsj);

		ps.setDouble(18,dj);
		ps.setDouble(19,tccldj);
		if (zclx.equals("1"))//1：套餐内；2：套餐外；3：升级大店；4：独立收费
		{
			ps.setDouble(20,dj);
		}
		else{
			ps.setDouble(20,tccldj);
		}

		ps.setString(21,"1");//1：结算价；2：结算比例
		ps.setDouble(22,jsj);
		ps.setDouble(23,0);
		ps.setDouble(24,sh);
		ps.setString(25,sfcscp);
		ps.setString(26,bz);
		ps.setString(27,sfkgdj);
		
		ps.setDouble(28,sl);
		ps.setDouble(29,xdsl);
		ps.setString(30,ptcpsm);
		ps.executeUpdate();
		ps.close();
	}


	//因数量修改，套餐内外发生，套餐外改为套餐内，或套餐内改为套餐外＋＋＋＋＋＋＋＋＋＋开始
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

		//获取本小类不收费主材数量
		double sjsl=0;//套餐内数量
		ls_sql="select sum(sl)";
		ls_sql+=" FROM bj_khzcxm";
		ls_sql+=" where sxh!='"+getsxh+"' and khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1：套餐内；2：套餐外收费；3：大店
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
			if ((sjsl+getsl)<=bzsl)//套餐内数量＋本条数量<标准数量，转为套餐内
			{
				ls_sql="update bj_khzcxm set zclx='1',dj=tcndj";
				ls_sql+=" where sxh='"+getsxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
			else if (sjsl>=bzsl)//全部转为套餐外
			{
				ls_sql="update bj_khzcxm set zclx='2',dj=tccldj";
				ls_sql+=" where sxh='"+getsxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
			else if (sjsl<bzsl)//不收费数量<标准数量，(bzsl-sjsl)部分转为套餐内不收费
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

				ls_sql="update bj_khzcxm set zclx='2',dj=tccldj,sl="+(sjsl+getsl-bzsl)+",xdsl="+getxdsl;
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
				ls_sql+=" select                ?+1,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,tcndj,'1' ,jsj,0   ,'0'     ,sh,sfcscp,bz,sfkgdj,?   ,? ,?   ,ptcpsm,bjjbbm";
				ls_sql+=" from bj_khzcxm";
				ls_sql+=" where sxh='"+getsxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.setLong(1,newsxh);
				ps1.setString(2,"1");//主材类型  1：套餐内；2：套餐外收费；3：大店
				ps1.setDouble(3,bzsl-sjsl);
				ps1.setDouble(4,getxdsl);
				ps1.executeUpdate();
				ps1.close();
			}
		}
	}
	rs.close();
	ps.close();
	//因数量修改，套餐内外发生，套餐外改为套餐内，或套餐内改为套餐外＝＝＝＝＝＝＝＝＝＝结束




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
	double sjsfsl=0;//升级收费数量
	double ppsjsfsl=0;//品牌升级收费数量
	if (!khbjjbbm.equals(bjjbbm))//升级
	{
		ls_sql="select sum(sl)";
		ls_sql+=" FROM bj_khzcxm";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1：套餐内；2：套餐外收费；3：大店
		ls_sql+=" and ppmc not in ( ";
		ls_sql+=" select ppmc ";
		ls_sql+=" from bj_tcppsjcjb ";
		ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+khbjjbbm+"' and bjjbbm1='"+bjjbbm+"' and tcsjflbm='"+tcsjflbm+"'";
		ls_sql+=" and yxkssj<=TRUNC(SYSDATE) and yxjzsj>=TRUNC(SYSDATE)";
		ls_sql+=" ) ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sjsfsl=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql="select sum(sl)";
		ls_sql+=" FROM bj_khzcxm";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1：套餐内；2：套餐外收费；3：大店
		ls_sql+=" and ppmc='"+ppmc+"'";
		ls_sql+=" and ppmc in ( ";
		ls_sql+=" select ppmc ";
		ls_sql+=" from bj_tcppsjcjb ";
		ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+khbjjbbm+"' and bjjbbm1='"+bjjbbm+"' and tcsjflbm='"+tcsjflbm+"'";
		ls_sql+=" and yxkssj<=TRUNC(SYSDATE) and yxjzsj>=TRUNC(SYSDATE)";
		ls_sql+=" ) ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ppsjsfsl=rs.getDouble(1);
		}
		rs.close();
		ps.close();

	}

	//客户品牌升级差价表（bj_khppsjcjb）
	ls_sql=" delete from bj_khppsjcjb "; 
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and ppmc='"+ppmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (ppsjsfsl>0)
	{
		//客户品牌升级差价表（bj_khppsjcjb）
		ls_sql=" insert into bj_khppsjcjb (khbh,jgwzbm,tccplbbm,ppmc,jldw,sjsfsl,sjcj,sjsfje,tcsjflbm,khbjjbbm,bjjbbm) "; 
		ls_sql+=" select                   ?   ,?     ,?       ,ppmc,jldw,?     ,sjcj,?*sjcj,tcsjflbm,bjjbbm  ,bjjbbm1 ";
		ls_sql+=" from bj_tcppsjcjb ";
		ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+khbjjbbm+"' and bjjbbm1='"+bjjbbm+"' and tcsjflbm='"+tcsjflbm+"' and ppmc='"+ppmc+"'";
		ls_sql+=" and yxkssj<=TRUNC(SYSDATE) and yxjzsj>=TRUNC(SYSDATE)";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,jgwzbm);
		ps.setString(3,tccplbbm);
		ps.setDouble(4,ppsjsfsl);
		ps.setDouble(5,ppsjsfsl);
		ps.executeUpdate();
		ps.close();
	}

	double sjsl=0;//实际数量
	ls_sql="select sum(sl)";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1：套餐内；2：套餐外收费；3：大店
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsl=rs.getDouble(1);
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

	double sjjshsl=0;//实际加损耗数量
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
	ls_sql+=" ,sjsfsl="+sjsfsl+",sjsfje=sjcj*"+sjsfsl;
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
	ls_sql+=" where khbh='"+khbh+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1：套餐内；2：套餐外收费；3：大店
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
			ls_sql+=" where khbh='"+khbh+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1：套餐内；2：套餐外收费；3：大店
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

	//97:墙体彩绘
	//1:壁纸
	//94:西境壁纸
	double bizhisl=0;//壁纸数量
	ls_sql="select sum(sl)";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and tccplbbm in(1,94) and zclx='1'";//1：套餐内；2：套餐外收费；3：大店
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bizhisl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double qtchsl=0;//墙体彩绘
	ls_sql="select sum(sl)";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and tccplbbm in(97) and zclx='1'";//1：套餐内；2：套餐外收费；3：大店
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qtchsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (bizhisl>0 && qtchsl>0)
	{
		conn.rollback();
		out.println("<P>错误！壁纸、墙体彩绘只能二选一");
		return;
	}

	//D 北舒E 南韵 F 西境
	if (khbjjbbm.equals("F") && qtchsl>8)
	{
		conn.rollback();
		out.println("<P>错误！西境墙体彩绘最多8平米");
		return;
	}
	else if (khbjjbbm.equals("E") && qtchsl>6)
	{
		conn.rollback();
		out.println("<P>错误！南韵墙体彩绘最多6平米");
		return;
	}
	else if (khbjjbbm.equals("D") && qtchsl>6)
	{
		conn.rollback();
		out.println("<P>错误！北舒墙体彩绘最多6平米");
		return;
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