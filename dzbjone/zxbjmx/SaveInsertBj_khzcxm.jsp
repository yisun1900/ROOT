<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;


String khbh=null;
String jgwzbm=null;
String cpbm=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
cpbm=cf.GB2Uni(request.getParameter("cpbm"));
double sl=0;
String ptcpsm=null;
String bjjbbm=null;
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
ptcpsm=cf.GB2Uni(request.getParameter("ptcpsm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));

String tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
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

	String sfxzsl="";//是否限制数量  1:超量需加价；2：不可超量；3：无数量限制
	double bzsl=0;//标准数量
	double sjjmsl=0;//实际减免数量
	String tcsjflbm="";
	String getbjjbbm="";
	ls_sql="select sfxzsl,bzsl,sjjmsl,tcsjflbm,bjjbbm";
	ls_sql+=" FROM bj_khzcxmxj";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		tcsjflbm=cf.fillNull(rs.getString("tcsjflbm"));
		bzsl=rs.getDouble("bzsl");
		sjjmsl=rs.getDouble("sjjmsl");
		getbjjbbm=cf.fillNull(rs.getString("bjjbbm"));
	}
	rs.close();
	ps.close();

	if (!getbjjbbm.equals(bjjbbm))
	{
		out.println("错误！套餐报价级别与主材不正确，套餐报价级别["+getbjjbbm+"]，而选择主材级别["+bjjbbm+"]，请关掉录入窗口，重新打开");
		return;
	}

	if (sjjmsl>0)
	{
		out.println("已被减免，不能再录入");
		return;
	}

	double tcwsjsl=0;//套餐外实际数量
	ls_sql="select sum(sl)";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='3'";//1：套餐内；2：套餐外收费；3：大店
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcwsjsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (tcwsjsl>0)
	{
		out.println("错误！已选择大店主材，不能再选择套餐主材");
		return;
	}

	double tcnsjsl=0;//套餐内数量
	ls_sql="select sum(sl)";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1：套餐内；2：套餐外收费；3：大店
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcnsjsl=rs.getDouble(1);
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

	String ppmc=null;
	String sfxclxs="";
	double xdb=0;
	double sh=0;
	ls_sql=" select ppmc,sfxclxs,xdb,sh";
	ls_sql+=" from bj_tczcbj";
	ls_sql+=" where cpbm='"+cpbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ppmc=rs.getString("ppmc");
		sfxclxs=cf.fillNull(rs.getString("sfxclxs"));
		xdb=rs.getDouble("xdb");
		sh=rs.getDouble("sh");
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

	
	
	long sxh=0;
	ls_sql="select NVL(max(sxh),0)";
	ls_sql+=" from  bj_khzcxm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sxh=rs.getLong(1);
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	if (sfxzsl.equals("1"))//是否限制数量  1:超量需加价；2：不可超量；3：无数量限制
	{
		if (tcnsjsl>=bzsl)
		{
			//超出标准数量限制，全部按套餐外收费
			ls_sql=" insert into bj_khzcxm (sxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj    ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm) ";
			ls_sql+=" select                ?+1,?   ,?     ,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,dj   ,tccldj,tccldj,'1' ,jsj,0   ,'0'     ,sh,sfcscp,bz,sfkgdj,?   ,? ,?   ,?     ,?  ";
			ls_sql+=" from bj_tczcbj";
			ls_sql+=" where cpbm='"+cpbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setString(2,khbh);
			ps.setString(3,jgwzbm);
			ps.setString(4,"2");//主材类型  1：套餐内；2：套餐外收费；3：大店
			ps.setDouble(5,sl);
			ps.setDouble(6,xdsl);
			ps.setString(7,ptcpsm);
			ps.setString(8,bjjbbm);
			ps.executeUpdate();
			ps.close();

			%>
			<SCRIPT language=javascript >
			<!--
				alert("提醒！数量超过限制，需收费，收费数量:<%=sl%>");
			//-->
			</SCRIPT>
			<%
		}
		else if ((tcnsjsl+sl)<=bzsl)
		{
			//未超出标准数量限制，全部按套餐内收费
			ls_sql=" insert into bj_khzcxm (sxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm) ";
			ls_sql+=" select                ?+1,?   ,?     ,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,dj   ,tccldj,dj,'1' ,jsj,0   ,'0'     ,sh,sfcscp,bz,sfkgdj,?   ,? ,?   ,?     ,?  ";
			ls_sql+=" from bj_tczcbj";
			ls_sql+=" where cpbm='"+cpbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setString(2,khbh);
			ps.setString(3,jgwzbm);
			ps.setString(4,"1");//主材类型  1：套餐内；2：套餐外收费；3：大店
			ps.setDouble(5,sl);
			ps.setDouble(6,xdsl);
			ps.setString(7,ptcpsm);
			ps.setString(8,bjjbbm);
			ps.executeUpdate();
			ps.close();

		}
		else
		{
			if (sfxclxs.equals("1"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
			{
				if ((bzsl-tcnsjsl)<0)
				{
					xdsl=java.lang.Math.floor((bzsl-tcnsjsl)*xdb*(100+sh)/100);
				}
				else{
					xdsl=java.lang.Math.ceil((bzsl-tcnsjsl)*xdb*(100+sh)/100);
				}
			}
			else if (sfxclxs.equals("2"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
			{
				if ((bzsl-tcnsjsl)<0)
				{
					xdsl=java.lang.Math.ceil((bzsl-tcnsjsl)*xdb*(100+sh)/100);
				}
				else{
					xdsl=java.lang.Math.floor((bzsl-tcnsjsl)*xdb*(100+sh)/100);
				}
			}
			else if (sfxclxs.equals("3"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
			{
				xdsl=cf.round((bzsl-tcnsjsl)*xdb*(100+sh)/100,0);
			}
			else if (sfxclxs.equals("4"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
			{
				xdsl=cf.round((bzsl-tcnsjsl)*xdb*(100+sh)/100,2);
			}

			//部分超出标准数量限制，(bzsl-tcnsjsl)部分套餐内收费
			ls_sql=" insert into bj_khzcxm (sxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm) ";
			ls_sql+=" select                ?+1,?   ,?     ,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,dj   ,tccldj,dj,'1' ,jsj,0   ,'0'     ,sh,sfcscp,bz,sfkgdj,?   ,? ,?   ,?     ,?  ";
			ls_sql+=" from bj_tczcbj";
			ls_sql+=" where cpbm='"+cpbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setString(2,khbh);
			ps.setString(3,jgwzbm);
			ps.setString(4,"1");//主材类型  1：套餐内；2：套餐外收费；3：大店
			ps.setDouble(5,bzsl-tcnsjsl);
			ps.setDouble(6,xdsl);
			ps.setString(7,ptcpsm);
			ps.setString(8,bjjbbm);
			ps.executeUpdate();
			ps.close();

			if (sfxclxs.equals("1"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
			{
				if (((tcnsjsl+sl)-bzsl)<0)
				{
					xdsl=java.lang.Math.floor(((tcnsjsl+sl)-bzsl)*xdb*(100+sh)/100);
				}
				else{
					xdsl=java.lang.Math.ceil(((tcnsjsl+sl)-bzsl)*xdb*(100+sh)/100);
				}
			}
			else if (sfxclxs.equals("2"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
			{
				if (((tcnsjsl+sl)-bzsl)<0)
				{
					xdsl=java.lang.Math.ceil(((tcnsjsl+sl)-bzsl)*xdb*(100+sh)/100);
				}
				else{
					xdsl=java.lang.Math.floor(((tcnsjsl+sl)-bzsl)*xdb*(100+sh)/100);
				}
			}
			else if (sfxclxs.equals("3"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
			{
				xdsl=cf.round(((tcnsjsl+sl)-bzsl)*xdb*(100+sh)/100,0);
			}
			else if (sfxclxs.equals("4"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
			{
				xdsl=cf.round(((tcnsjsl+sl)-bzsl)*xdb*(100+sh)/100,2);
			}

			//部分超出标准数量限制，(tcnsjsl+sl)-bzsl部分套餐外收费
			ls_sql=" insert into bj_khzcxm (sxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj    ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm) ";
			ls_sql+=" select                ?+2,?   ,?     ,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,dj   ,tccldj,tccldj,'1' ,jsj,0   ,'0'     ,sh,sfcscp,bz,sfkgdj,?   ,? ,?   ,?     ,?  ";
			ls_sql+=" from bj_tczcbj";
			ls_sql+=" where cpbm='"+cpbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setString(2,khbh);
			ps.setString(3,jgwzbm);
			ps.setString(4,"2");//主材类型  1：套餐内；2：套餐外收费；3：大店
			ps.setDouble(5,(tcnsjsl+sl)-bzsl);
			ps.setDouble(6,xdsl);
			ps.setString(7,ptcpsm);
			ps.setString(8,bjjbbm);
			ps.executeUpdate();
			ps.close();

			%>
			<SCRIPT language=javascript >
			<!--
				alert("提醒！数量超过限制，部分需收费，收费数量:<%=((tcnsjsl+sl)-bzsl)%>");
			//-->
			</SCRIPT>
			<%
		}

	}
	else if (sfxzsl.equals("2"))//是否限制数量  1:超量需加价；2：不可超量；3：无数量限制
	{
		//全部按套餐内收费
		ls_sql=" insert into bj_khzcxm (sxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm) ";
		ls_sql+=" select                ?+1,?   ,?     ,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,dj   ,tccldj,dj,'1' ,jsj,0   ,'0'     ,sh,sfcscp,bz,sfkgdj,?   ,? ,?   ,?     ,?  ";
		ls_sql+=" from bj_tczcbj";
		ls_sql+=" where cpbm='"+cpbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,sxh);
		ps.setString(2,khbh);
		ps.setString(3,jgwzbm);
		ps.setString(4,"1");//主材类型  1：套餐内；2：套餐外收费；3：大店
		ps.setDouble(5,sl);
		ps.setDouble(6,xdsl);
		ps.setString(7,ptcpsm);
		ps.setString(8,bjjbbm);
		ps.executeUpdate();
		ps.close();

	}
	else{
		//全部按套餐内收费
		ls_sql=" insert into bj_khzcxm (sxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm) ";
		ls_sql+=" select                ?+1,?   ,?     ,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,dj   ,tccldj,dj,'1' ,jsj,0   ,'0'     ,sh,sfcscp,bz,sfkgdj,?   ,? ,?   ,?     ,?  ";
		ls_sql+=" from bj_tczcbj";
		ls_sql+=" where cpbm='"+cpbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,sxh);
		ps.setString(2,khbh);
		ps.setString(3,jgwzbm);
		ps.setString(4,"1");//主材类型  1：套餐内；2：套餐外收费；3：大店
		ps.setDouble(5,sl);
		ps.setDouble(6,xdsl);
		ps.setString(7,ptcpsm);
		ps.setString(8,bjjbbm);
		ps.executeUpdate();
		ps.close();
	}


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
		//不含品牌升级
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

		//含品牌升级
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
			double getsl=0;
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
	//98:开关彩绘
	double bizhisl=0;//壁纸数量
	ls_sql="select sum(sl)";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and tccplbbm in('1','94') and zclx='1'";//1：套餐内；2：套餐外收费；3：大店
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
	
	double qtckgsl=0;//开关彩绘
	ls_sql="select sum(sl)";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and tccplbbm in(98) and zclx='1'";//1：套餐内；2：套餐外收费；3：大店
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qtckgsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	//D 北舒E 南韵 F 西境
	if (khbjjbbm.equals("F") && qtckgsl>2)
	{
		conn.rollback();
		out.println("<P>错误！西境开关彩绘最多2个");
		return;
	}
	else if (khbjjbbm.equals("E") && qtckgsl>1)
	{
		conn.rollback();
		out.println("<P>错误！南韵开关彩绘最多1个");
		return;
	}
	else if (khbjjbbm.equals("D") && qtckgsl>1)
	{
		conn.rollback();
		out.println("<P>错误！北舒开关彩绘最多1个");
		return;
	}
	
	//东捷客户判断开关面板与置物篮数量
	if(khbjjbbm.equals("L"))
	{
		double kgsl=0;//开关数量
		ls_sql="select sum(sl)";
		ls_sql+=" FROM bj_khzcxm";
		ls_sql+=" where khbh='"+khbh+"' and tccplbbm in('25','26','27','28','29','30','31','32','33') and zclx='1'";//1：套餐内；2：套餐外收费；3：大店
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			kgsl=rs.getDouble(1);
		}
		rs.close();
		ps.close();
	
		double zhiwusl=0;//置物篮数量
		ls_sql="select sum(sl)";
		ls_sql+=" FROM bj_khzcxm";
		ls_sql+=" where khbh='"+khbh+"' and tccplbbm in(100) and zclx='1'";//1：套餐内；2：套餐外收费；3：大店
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zhiwusl=rs.getDouble(1);
		}
		rs.close();
		ps.close();
	
		if (kgsl>0 && zhiwusl>0)
		{
			conn.rollback();
			out.println("<P>错误！开关面板和置物篮只能二选一");
			return;
		}
	}
	
	//检查：小类数量限制：＝＝＝＝＝＝＝＝＝＝＝＝结束
	
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		window.location="InsertBj_khzcxm.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>";
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);

	%>
	<SCRIPT language=javascript >
	<!--
		alert("！！！存盘失败，请重新选择");
		window.close();
	//-->
	</SCRIPT>
	<%

	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>