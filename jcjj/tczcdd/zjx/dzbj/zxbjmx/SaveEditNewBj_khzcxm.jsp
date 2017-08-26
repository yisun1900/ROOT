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

String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
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


	String khbh="";
	String sfxzsl="";
	double bzsl=0;
	String tcsjflbm="";
	ls_sql="select khbh,sfxzsl,bzsl,tcsjflbm";
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
	}
	rs.close();
	ps.close();

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

	String getcpbm="";
	String zclx="";
	String sfkgdj=null;
	String lx=null;
	String ppmc=null;
	String sfxclxs="";
	double xdb=0;
	double sh=0;
	ls_sql="select cpbm,zclx,sfkgdj,lx,ppmc,sfxclxs,xdb,sh";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and sxh="+oldsxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getcpbm=rs.getString(1);
		zclx=cf.fillNull(rs.getString("zclx"));
		sfkgdj=cf.fillNull(rs.getString("sfkgdj"));
		lx=cf.fillNull(rs.getString("lx"));//1：原项目；2：增项；3：减项；4：新增项
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

	conn.setAutoCommit(false);


	if (sfkgdj.equals("Y") && lx.equals("4"))//是否可改单价  Y：是；N：否
	{
		double sjdj=0;//实际单价
		sjdj=srdj;

		ls_sql=" update bj_khzcxmh set sl=?,xdsl=?,ptcpsm=?,dj=?";
		ls_sql+=" where zjxxh='"+zjxxh+"' and sxh="+oldsxh;
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,sl);
		ps.setDouble(2,xdsl);
		ps.setString(3,ptcpsm);
		ps.setDouble(4,sjdj);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql=" update bj_khzcxmh set sl=?,xdsl=?,ptcpsm=?";
		ls_sql+=" where zjxxh='"+zjxxh+"' and sxh="+oldsxh;
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,sl);
		ps.setDouble(2,xdsl);
		ps.setString(3,ptcpsm);
		ps.executeUpdate();
		ps.close();
	}




	//因数量修改，套餐内外发生变化，套餐外改为套餐内，或套餐内改为套餐外＋＋＋＋＋＋＋＋＋＋开始
	String getsxh="";
	double tcndj=0;
	double tccldj=0;
	double getsl=0;

	ls_sql="select sxh,sl,tcndj,tccldj,sfxclxs,xdb,sh";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
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
		ls_sql+=" FROM bj_khzcxmh";
		ls_sql+=" where sxh!='"+getsxh+"' and zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1：套餐内；2：套餐外收费；3：大店
		ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
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
				ls_sql="update bj_khzcxmh set zclx='1',dj=tcndj";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sxh='"+getsxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
			else if (sjsl>=bzsl)//全部转为套餐外
			{
				ls_sql="update bj_khzcxmh set zclx='2',dj=tccldj";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sxh='"+getsxh+"'";
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

				ls_sql="update bj_khzcxmh set zclx='2',dj=tccldj,sl="+(sjsl+getsl-bzsl)+",xdsl="+getxdsl;
				ls_sql+=" where zjxxh='"+zjxxh+"' and sxh='"+getsxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();

				long newsxh=0;
				ls_sql="select NVL(max(sxh),0)";
				ls_sql+=" from  bj_khzcxmh";
				ls_sql+=" where zjxxh='"+zjxxh+"'";
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

				ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj   ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,lx,ywdhslbz) ";
				ls_sql+=" select                 ?+1,zjxxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,tcndj,'1' ,jsj,0   ,'0'     ,sh,sfcscp,bz,sfkgdj,?   ,? ,?   ,ptcpsm,bjjbbm,lx,'Y'";
				ls_sql+=" from bj_khzcxmh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sxh='"+getsxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.setLong(1,newsxh);
				ps1.setString(2,"1");//1：套餐主材数量内；2：套餐主材数量外；3：顶配升级主材数量内；4：顶配升级主材数量外、顶配独立收费、选配主材
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
			getsl=0;
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