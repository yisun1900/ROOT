<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;


String zjxxh=null;
String jgwzbm=null;
String cpbm=null;
zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
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

double srdj=0;
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  srdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际单价]类型转换发生意外:"+e);
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

	String sfwc="";
	String khbh="";
	ls_sql="select sfwc,khbh";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
		khbh=rs.getString("khbh");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N：未完成；Y：完成
	{
		out.println("错误！增减项已完成，不能再修改");
		return;
	}

	int sfxz=0;//套餐外实际数量
	ls_sql="select count(*) ";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and cpbm='"+cpbm+"'";//1：套餐内；2：套餐外收费；3：大店
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志  Y：有数量；N：数量为0
	ps= conn.prepareStatement(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfxz=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (sfxz>0)
	{
//		out.println("错误！已选择该主材");
//		return;
	}

	double tcwsjsl=0;//套餐外实际数量
	ls_sql="select sum(sl)";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='3'";//1：套餐内；2：套餐外收费；3：大店
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志  Y：有数量；N：数量为0
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

	
	String khbjjbbm=null;
	ls_sql="SELECT bjjb";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbjjbbm=rs.getString("bjjb");
	}
	rs.close();
	ps.close();

	String sfxzsl="";//是否限制数量  1:超量需加价；2：不可超量；3：无数量限制
	double bzsl=0;//标准数量
	double sjjmsl=0;//实际减免数量
	String tcsjflbm="";
	String getbjjbbm="";
	ls_sql="select sfxzsl,bzsl,sjjmsl,tcsjflbm,bjjbbm";
	ls_sql+=" FROM bj_khzcxmxjh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
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




	double tcnsjsl=0;//套餐内数量
	ls_sql="select sum(sl)";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1：套餐内；2：套餐外收费；3：大店
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志  Y：有数量；N：数量为0
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
	ls_sql+=" FROM bj_khzcxmxjh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"' and sfyqxtpp='Y'";//Y：是；N：否
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfyqxtpp=rs.getInt(1);
	}
	rs.close();
	ps.close();


	String sfkgdj=null;
	double dj=0;
	double tccldj=0;
	String ppmc=null;
	String sfxclxs="";
	double xdb=0;
	double sh=0;
	ls_sql="select sfkgdj,dj,tccldj,ppmc,sfxclxs,xdb,sh";
	ls_sql+=" from bj_tczcbj";
	ls_sql+=" where cpbm='"+cpbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfkgdj=cf.fillNull(rs.getString("sfkgdj"));
		dj=rs.getDouble("dj");
		tccldj=rs.getDouble("tccldj");
		ppmc=cf.fillNull(rs.getString("ppmc"));
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
	ls_sql+=" from  bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sxh=rs.getLong(1);
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	double sjdj=0;//实际单价

	if (sfxzsl.equals("1"))//是否限制数量  1:超量需加价；2：不可超量；3：无数量限制
	{
		if (tcnsjsl>=bzsl)
		{
			
			if (sfkgdj.equals("Y"))//是否可改单价  Y：是；N：否
			{
				sjdj=srdj;
			}
			else{
				sjdj=tccldj;
			}
			//超出标准数量限制，全部按套餐外收费
			ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj    ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,lx ,ywdhslbz) ";
			ls_sql+=" select                ?+1,?     ,?   ,?     ,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,dj   ,tccldj,?     ,'1' ,jsj,0   ,'0'     ,sh,sfcscp,bz,sfkgdj,?   ,? ,?   ,?     ,?     ,'4','Y'";//1：原项目；2：增项；3：减项；4：新增项
			ls_sql+=" from bj_tczcbj";
			ls_sql+=" where cpbm='"+cpbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setString(2,zjxxh);
			ps.setString(3,khbh);
			ps.setString(4,jgwzbm);
			ps.setDouble(5,sjdj);
			ps.setString(6,"2");//主材类型  1：套餐内；2：套餐外收费；3：大店
			ps.setDouble(7,sl);
			ps.setDouble(8,xdsl);
			ps.setString(9,ptcpsm);
			ps.setString(10,bjjbbm);
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
			
			if (sfkgdj.equals("Y"))//是否可改单价  Y：是；N：否
			{
				sjdj=srdj;
			}
			else{
				sjdj=dj;
			}
			//未超出标准数量限制，全部按套餐内收费
			ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,lx ,ywdhslbz) ";
			ls_sql+=" select                ?+1,?     ,?   ,?     ,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,dj   ,tccldj,? ,'1' ,jsj,0   ,'0'     ,sh,sfcscp,bz,sfkgdj,?   ,? ,?   ,?     ,?     ,'4','Y'";//1：原项目；2：增项；3：减项；4：新增项
			ls_sql+=" from bj_tczcbj";
			ls_sql+=" where cpbm='"+cpbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setString(2,zjxxh);
			ps.setString(3,khbh);
			ps.setString(4,jgwzbm);
			ps.setDouble(5,sjdj);
			ps.setString(6,"1");//主材类型  1：套餐内；2：套餐外收费；3：大店
			ps.setDouble(7,sl);
			ps.setDouble(8,xdsl);
			ps.setString(9,ptcpsm);
			ps.setString(10,bjjbbm);
			ps.executeUpdate();
			ps.close();

		}
		else
		{
			//部分超出标准数量限制，(bzsl-tcnsjsl)部分套餐内收费
			
			if (sfkgdj.equals("Y"))//是否可改单价  Y：是；N：否
			{
				sjdj=srdj;
			}
			else{
				sjdj=dj;
			}

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

			ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,lx ,ywdhslbz) ";
			ls_sql+=" select                ?+1,?     ,?   ,?     ,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,dj   ,tccldj,? ,'1' ,jsj,0   ,'0'     ,sh,sfcscp,bz,sfkgdj,?   ,? ,?   ,?     ,?     ,'4','Y'";//1：原项目；2：增项；3：减项；4：新增项
			ls_sql+=" from bj_tczcbj";
			ls_sql+=" where cpbm='"+cpbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setString(2,zjxxh);
			ps.setString(3,khbh);
			ps.setString(4,jgwzbm);
			ps.setDouble(5,sjdj);
			ps.setString(6,"1");//主材类型  1：套餐内；2：套餐外收费；3：大店
			ps.setDouble(7,bzsl-tcnsjsl);
			ps.setDouble(8,xdsl);
			ps.setString(9,ptcpsm);
			ps.setString(10,bjjbbm);
			ps.executeUpdate();
			ps.close();

			//部分超出标准数量限制，(tcnsjsl+sl)-bzsl部分套餐外收费
			
			if (sfkgdj.equals("Y"))//是否可改单价  Y：是；N：否
			{
				sjdj=srdj;
			}
			else{
				sjdj=tccldj;
			}

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

			ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj    ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,lx ,ywdhslbz) ";
			ls_sql+=" select                ?+2,?     ,?   ,?     ,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,dj   ,tccldj,?     ,'1' ,jsj,0   ,'0'     ,sh,sfcscp,bz,sfkgdj,?   ,? ,?   ,?     ,?     ,'4','Y'";//1：原项目；2：增项；3：减项；4：新增项
			ls_sql+=" from bj_tczcbj";
			ls_sql+=" where cpbm='"+cpbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setString(2,zjxxh);
			ps.setString(3,khbh);
			ps.setString(4,jgwzbm);
			ps.setDouble(5,sjdj);
			ps.setString(6,"2");//主材类型  1：套餐内；2：套餐外收费；3：大店
			ps.setDouble(7,(tcnsjsl+sl)-bzsl);
			ps.setDouble(8,xdsl);
			ps.setString(9,ptcpsm);
			ps.setString(10,bjjbbm);
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
		
		if (sfkgdj.equals("Y"))//是否可改单价  Y：是；N：否
		{
			sjdj=srdj;
		}
		else{
			sjdj=dj;
		}
		ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,lx ,ywdhslbz) ";
		ls_sql+=" select                ?+1,?     ,?   ,?     ,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,dj   ,tccldj,? ,'1' ,jsj,0   ,'0'     ,sh,sfcscp,bz,sfkgdj,?   ,? ,?   ,?     ,?     ,'4','Y'";//1：原项目；2：增项；3：减项；4：新增项
		ls_sql+=" from bj_tczcbj";
		ls_sql+=" where cpbm='"+cpbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,sxh);
		ps.setString(2,zjxxh);
		ps.setString(3,khbh);
		ps.setString(4,jgwzbm);
		ps.setDouble(5,sjdj);
		ps.setString(6,"1");//主材类型  1：套餐内；2：套餐外收费；3：大店
		ps.setDouble(7,sl);
		ps.setDouble(8,xdsl);
		ps.setString(9,ptcpsm);
		ps.setString(10,bjjbbm);
		ps.executeUpdate();
		ps.close();

	}
	else{
		//全部按套餐内收费
		
		if (sfkgdj.equals("Y"))//是否可改单价  Y：是；N：否
		{
			sjdj=srdj;
		}
		else{
			sjdj=dj;
		}
		ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,lx ,ywdhslbz) ";
		ls_sql+=" select                ?+1,?     ,?   ,?     ,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,dj   ,tccldj,? ,'1' ,jsj,0   ,'0'     ,sh,sfcscp,bz,sfkgdj,?   ,? ,?   ,?     ,?     ,'4','Y'";//1：原项目；2：增项；3：减项；4：新增项
		ls_sql+=" from bj_tczcbj";
		ls_sql+=" where cpbm='"+cpbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,sxh);
		ps.setString(2,zjxxh);
		ps.setString(3,khbh);
		ps.setString(4,jgwzbm);
		ps.setDouble(5,sjdj);
		ps.setString(6,"1");//主材类型  1：套餐内；2：套餐外收费；3：大店
		ps.setDouble(7,sl);
		ps.setDouble(8,xdsl);
		ps.setString(9,ptcpsm);
		ps.setString(10,bjjbbm);
		ps.executeUpdate();
		ps.close();
	}


	//检查：要求相同品牌＋＋＋＋＋＋＋＋＋＋＋＋开始
	if (sfyqxtpp>0)//升级分类:要求相同品牌
	{
		int ppsl=0;
		ls_sql="select count(distinct ppmc)";
		ls_sql+=" FROM (";
		ls_sql+=" select ppmc";
		ls_sql+=" FROM bj_khzcxmh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm in (select tccplbbm from bj_khzcxmxjh where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"' and sfyqxtpp='Y')";
		ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
		ls_sql+=" group by ppmc";//1：原项目；2：增项；3：减项；4：新增项
		ls_sql+=" having sum(xdsl)!=0";//1：原项目；2：增项；3：减项；4：新增项
		ls_sql+=" )";
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
		ls_sql+=" FROM bj_khzcxmh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1：套餐内；2：套餐外收费；3：大店
		ls_sql+=" and ppmc not in ( ";
		ls_sql+=" select ppmc ";
		ls_sql+=" from bj_khppsjcjbh ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
		ls_sql+=" ) ";
		ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sjsfsl=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql="select sum(sl)";
		ls_sql+=" FROM bj_khzcxmh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1：套餐内；2：套餐外收费；3：大店
		ls_sql+=" and ppmc='"+ppmc+"'";
		ls_sql+=" and ppmc in ( ";
		ls_sql+=" select ppmc ";
		ls_sql+=" from bj_khppsjcjbh ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
		ls_sql+=" ) ";
		ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
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
	ls_sql=" update bj_khppsjcjbh set sjsfsl=?,sjsfje=sjcj*?"; 
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and ppmc='"+ppmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,ppsjsfsl);
	ps.setDouble(2,ppsjsfsl);
	ps.executeUpdate();
	ps.close();


	double sjsl=0;//实际数量
	ls_sql="select sum(sl)";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1：套餐内；2：套餐外收费；3：大店
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
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
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsl=rs.getDouble(1);
		sjjshsl=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="update bj_khzcxmxjh set sjsl="+sjsl+",sjjshsl="+sjjshsl;
	ls_sql+=" ,sjsfsl="+sjsfsl+",sjsfje=sjcj*"+sjsfsl;
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
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
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1：套餐内；2：套餐外收费；3：大店
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
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
			ls_sql+=" FROM bj_khzcxmh";
			ls_sql+=" where zjxxh='"+zjxxh+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1：套餐内；2：套餐外收费；3：大店
			ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
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
	ls_sql="select sum(xdsl)";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and tccplbbm in('1','94') and zclx='1'";//1：套餐内；2：套餐外收费；3：大店
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bizhisl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double qtchsl=0;//墙体彩绘
	ls_sql="select sum(xdsl)";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and tccplbbm in(97) and zclx='1'";//1：套餐内；2：套餐外收费；3：大店
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
		window.location="InsertBj_khzcxm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>";
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