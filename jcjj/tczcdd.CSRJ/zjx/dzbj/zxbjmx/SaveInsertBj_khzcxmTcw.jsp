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
	ls_sql="select sfwc";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
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
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
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
		out.println("错误！已选择该主材");
		return;
	}

	String sfxzsl="";//是否限制数量  1:超量需加价；2：不可超量；3：无数量限制
	double bzsl=0;//标准数量
	double sjjmsl=0;//实际减免数量
	String tcsjflbm="";
	double ghzj=0;//更换折价
	double khzdsl=0;//可换最大数量
	String khbh=null;
	ls_sql="select khbh,sfxzsl,bzsl,sjjmsl,tcsjflbm,ghzj,khzdsl";
	ls_sql+=" FROM bj_khzcxmxjh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		tcsjflbm=cf.fillNull(rs.getString("tcsjflbm"));
		bzsl=rs.getDouble("bzsl");
		sjjmsl=rs.getDouble("sjjmsl");
		ghzj=rs.getDouble("ghzj");
		khzdsl=rs.getDouble("khzdsl");
	}
	rs.close();
	ps.close();

	bzsl=khzdsl;

	if (sfxzsl.equals("2"))//是否限制数量  1:超量需加价；2：不可超量；3：无数量限制
	{
		sfxzsl="1";
	}

	if (sjjmsl>0)
	{
		out.println("已被减免，不能再录入");
		return;
	}


	double tczcsl=0;//套餐外实际数量
	ls_sql="select sum(sl)";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx in('1')";//1：套餐内；2：套餐外收费；3：大店
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tczcsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (tczcsl>0)
	{
		out.println("错误！已选择套餐主材，不能再选择大店主材");
		return;
	}



	double tcnsjsl=0;//套餐内数量
	ls_sql="select sum(sl)";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='3'";
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
	//1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
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
	String sfxclxs="";
	double xdb=0;
	double sh=0;
	ls_sql="select sfkgdj,dj,sfxclxs,xdb,sh";
	ls_sql+=" from bj_tcwzck";
	ls_sql+=" where cpbm='"+cpbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfkgdj=cf.fillNull(rs.getString("sfkgdj"));
		dj=rs.getDouble("dj");
		sfxclxs=cf.fillNull(rs.getString("sfxclxs"));
		xdb=rs.getDouble("xdb");
		sh=rs.getDouble("sh");
	}
	rs.close();
	ps.close();

	double sjdj=0;//实际单价
	if (sfkgdj.equals("Y"))//是否可改单价  Y：是；N：否
	{
		sjdj=srdj;
	}
	else{
		sjdj=dj;
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


	if (sfxzsl.equals("1"))//是否限制数量  1:超量需加价；2：不可超量；3：无数量限制
	{
		if (tcnsjsl>=bzsl)//超出标准数量限制，全部按套餐外收费
		{
			ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj        ,tccldj,dj,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,lx ,ywdhslbz) ";
			ls_sql+=" select                ?+1 ,?    ,?   ,?     ,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,(?-"+ghzj+") ,?     ,? ,jsfs,jsj,jsbl,jjfs    ,sh,'N'   ,bz,sfkgdj,?   ,? ,?   ,?     ,?     ,'4','Y'";//1：原项目；2：增项；3：减项；4：新增项
			ls_sql+=" from bj_tcwzck";
			ls_sql+=" where cpbm='"+cpbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setString(2,zjxxh);
			ps.setString(3,khbh);
			ps.setString(4,jgwzbm);
			ps.setDouble(5,sjdj);
			ps.setDouble(6,sjdj);
			ps.setDouble(7,sjdj);
			ps.setString(8,"4");//主材类型  1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
			ps.setDouble(9,sl);
			ps.setDouble(10,xdsl);
			ps.setString(11,ptcpsm);
			ps.setString(12,bjjbbm);
			ps.executeUpdate();
			ps.close();

			//补差价不能小于0
			ls_sql=" update bj_khzcxmh set tcndj=0";
			ls_sql+=" where zjxxh='"+zjxxh+"' and sxh='"+(sxh+1)+"' and tcndj<0";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			

			%>
			<SCRIPT language=javascript >
			<!--
				alert("提醒！数量超过限制，需额外收费，收费数量:<%=sl%>");
			//-->
			</SCRIPT>
			<%
		}
		else if ((tcnsjsl+sl)<=bzsl)//未超出标准数量限制
		{
			//未超出标准数量限制，全部按套餐内补差价
			ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj        ,tccldj,dj           ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,lx ,ywdhslbz) ";
			ls_sql+=" select                ?+1,?     ,?   ,?     ,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,(?-"+ghzj+") ,?     ,(?-"+ghzj+") ,jsfs,jsj,jsbl,jjfs    ,sh,'N'   ,bz,sfkgdj,?   ,? ,?   ,?     ,?     ,'4,'Y''";//1：原项目；2：增项；3：减项；4：新增项
			ls_sql+=" from bj_tcwzck";
			ls_sql+=" where cpbm='"+cpbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setString(2,zjxxh);
			ps.setString(3,khbh);
			ps.setString(4,jgwzbm);
			ps.setDouble(5,sjdj);
			ps.setDouble(6,sjdj);
			ps.setDouble(7,sjdj);
			ps.setString(8,"3");//主材类型  1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
			ps.setDouble(9,sl);
			ps.setDouble(10,xdsl);
			ps.setString(11,ptcpsm);
			ps.setString(12,bjjbbm);
			ps.executeUpdate();
			ps.close();

			//补差价不能小于0
			ls_sql=" update bj_khzcxmh set tcndj=0,dj=0";
			ls_sql+=" where zjxxh='"+zjxxh+"' and sxh='"+(sxh+1)+"' and tcndj<0";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

		}
		else//部分超出标准数量限制
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

			//部分超出标准数量限制，(bzsl-tcnsjsl)部分按套餐内补差价
			ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj        ,tccldj,dj           ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,lx ,ywdhslbz) ";
			ls_sql+=" select                ?+1,?     ,?   ,?     ,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,(?-"+ghzj+") ,?     ,(?-"+ghzj+") ,jsfs,jsj,jsbl,jjfs    ,sh,'N'   ,bz,sfkgdj,?   ,? ,?   ,?     ,?     ,'4','Y'";//1：原项目；2：增项；3：减项；4：新增项
			ls_sql+=" from bj_tcwzck";
			ls_sql+=" where cpbm='"+cpbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setString(2,zjxxh);
			ps.setString(3,khbh);
			ps.setString(4,jgwzbm);
			ps.setDouble(5,sjdj);
			ps.setDouble(6,sjdj);
			ps.setDouble(7,sjdj);
			ps.setString(8,"3");//主材类型  1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
			ps.setDouble(9,bzsl-tcnsjsl);
			ps.setDouble(10,xdsl);
			ps.setString(11,ptcpsm);
			ps.setString(12,bjjbbm);
			ps.executeUpdate();
			ps.close();


			//补差价不能小于0
			ls_sql=" update bj_khzcxmh set tcndj=0,dj=0";
			ls_sql+=" where zjxxh='"+zjxxh+"' and sxh='"+(sxh+1)+"' and tcndj<0";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			//部分超出标准数量限制，(tcnsjsl+sl)-bzsl部分按套餐外收费
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

			ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj        ,tccldj,dj,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,lx ,ywdhslbz) ";
			ls_sql+=" select                ?+2,?     ,?   ,?     ,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,(?-"+ghzj+") ,?     ,? ,jsfs,jsj,jsbl,jjfs    ,sh,'N'   ,bz,sfkgdj,?   ,? ,?   ,?     ,?     ,'4','Y'";//1：原项目；2：增项；3：减项；4：新增项
			ls_sql+=" from bj_tcwzck";
			ls_sql+=" where cpbm='"+cpbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setString(2,zjxxh);
			ps.setString(3,khbh);
			ps.setString(4,jgwzbm);
			ps.setDouble(5,sjdj);
			ps.setDouble(6,sjdj);
			ps.setDouble(7,sjdj);
			ps.setString(8,"4");//主材类型  1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
			ps.setDouble(9,(tcnsjsl+sl)-bzsl);
			ps.setDouble(10,xdsl);
			ps.setString(11,ptcpsm);
			ps.setString(12,bjjbbm);
			ps.executeUpdate();
			ps.close();

			//补差价不能小于0
			ls_sql=" update bj_khzcxmh set tcndj=0";
			ls_sql+=" where zjxxh='"+zjxxh+"' and sxh='"+(sxh+2)+"' and tcndj<0";
			ps= conn.prepareStatement(ls_sql);
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
		//未超出标准数量限制，全部按套餐内补差价
		ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj        ,tccldj,dj           ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,lx ,ywdhslbz) ";
		ls_sql+=" select                ?+1,?     ,?   ,?     ,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,(?-"+ghzj+") ,?     ,(?-"+ghzj+") ,jsfs,jsj,jsbl,jjfs    ,sh,'N'   ,bz,sfkgdj,?   ,? ,?   ,?     ,?     ,'4','Y'";//1：原项目；2：增项；3：减项；4：新增项
		ls_sql+=" from bj_tcwzck";
		ls_sql+=" where cpbm='"+cpbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,sxh);
		ps.setString(2,zjxxh);
		ps.setString(3,khbh);
		ps.setString(4,jgwzbm);
		ps.setDouble(5,sjdj);
		ps.setDouble(6,sjdj);
		ps.setDouble(7,sjdj);
		ps.setString(8,"3");//主材类型  1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
		ps.setDouble(9,sl);
		ps.setDouble(10,xdsl);
		ps.setString(11,ptcpsm);
		ps.setString(12,bjjbbm);
		ps.executeUpdate();
		ps.close();

		//补差价不能小于0
		ls_sql=" update bj_khzcxmh set tcndj=0,dj=0";
		ls_sql+=" where zjxxh='"+zjxxh+"' and sxh='"+(sxh+1)+"' and tcndj<0";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else{
		//未超出标准数量限制，全部按套餐内补差价
		ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj        ,tccldj,dj           ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,lx ,ywdhslbz) ";
		ls_sql+=" select                ?+1,?     ,?   ,?     ,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,(?-"+ghzj+") ,?     ,(?-"+ghzj+") ,jsfs,jsj,jsbl,jjfs    ,sh,'N'   ,bz,sfkgdj,?   ,? ,?   ,?     ,?     ,'4','Y'";//1：原项目；2：增项；3：减项；4：新增项
		ls_sql+=" from bj_tcwzck";
		ls_sql+=" where cpbm='"+cpbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,sxh);
		ps.setString(2,zjxxh);
		ps.setString(3,khbh);
		ps.setString(4,jgwzbm);
		ps.setDouble(5,sjdj);
		ps.setDouble(6,sjdj);
		ps.setDouble(7,sjdj);
		ps.setString(8,"3");//主材类型  1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
		ps.setDouble(9,sl);
		ps.setDouble(10,xdsl);
		ps.setString(11,ptcpsm);
		ps.setString(12,bjjbbm);
		ps.executeUpdate();
		ps.close();

		//补差价不能小于0
		ls_sql=" update bj_khzcxmh set tcndj=0,dj=0";
		ls_sql+=" where zjxxh='"+zjxxh+"' and sxh='"+(sxh+1)+"' and tcndj<0";
		ps= conn.prepareStatement(ls_sql);
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
	double sjsl=0;//实际数量
	double sjjshsl=0;//实际加损耗数量
	ls_sql="select sum(sl),sum(ROUND(sl*(100+sh)/100,2))";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='3'";
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
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

	if (getsfxzsl.equals("2"))//是否限制数量  1:超量需加价；2：不可超量；3：无数量限制
	{
		getsfxzsl="1";
	}

	double xlsjsl=0;
	double xlsjjshsl=0;
	ls_sql="select sum(sl),sum(ROUND(sl*(100+sh)/100,2))";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and tccplbbm='"+tccplbbm+"' and zclx='3'";//1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
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
			ls_sql+=" where zjxxh='"+zjxxh+"' and tccplbbm='"+tccplbbm+"' and zclx='3'";//1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
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
	//检查：小类数量限制：＝＝＝＝＝＝＝＝＝＝＝＝结束
	
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		window.location="InsertBj_khzcxmTcw.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>";
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