<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");

String bjjbbm = request.getParameter("bjjbbm");
String dqbm=request.getParameter("dqbm");
String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));

String[] xmbh=request.getParameterValues("xmbh");
String[] glflbm=request.getParameterValues("glflbm");
String[] wlllbz=request.getParameterValues("wlllbz");
String[] lx=request.getParameterValues("lx");
String[] glfxclbm=request.getParameterValues("glfxclbm");
String[] glfxclmc=request.getParameterValues("glfxclmc");
String[] jldwbm=request.getParameterValues("jldwbm");
String[] xhlstr=request.getParameterValues("xhl");
String[] djstr=request.getParameterValues("dj");
String[] bz=request.getParameterValues("bz");
String[] jqsflstr=request.getParameterValues("jqsfl");
String[] bsflstr=request.getParameterValues("bsfl");
String[] tvocsflstr=request.getParameterValues("tvocsfl");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double dj=0;
double xhl=0;
double jqsfl=0;
double bsfl=0;
double tvocsfl=0;

try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	//删除旧的
	String lsxmbh="";
	for (int i=0;i<xmbh.length ;i++ )
	{
		if (lsxmbh.equals(xmbh[i]))
		{
			lsxmbh=xmbh[i];
		}
		else{
			ls_sql="delete from bj_jzglfxb ";
			ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh[i]+"' and bjjbbm='"+bjjbbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}


	//不能放在循环里，否则太慢
	int glbxh=0;
	ls_sql="select NVL(max(TO_NUMBER(glbxh)),0)";
	ls_sql+=" from  bj_jzglfxb";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		glbxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	for (int i=0;i<xmbh.length ;i++ )
	{
		//[报价级别]是否为空
		if (bjjbbm.equals(""))
		{
			conn.rollback();
			out.println("<BR>项目编号["+xmbh[i]+"]存盘失败！[报价级别]为空");
			return;
		}

		//[工料分类]是否为空
		if (glflbm[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>项目编号["+xmbh[i]+"]存盘失败！[工料分类]为空");
			return;
		}

		if (glflbm[i].equals("1"))//1:辅材费
		{
			//[物料编码]是否为空
			if (glfxclbm[i].equals(""))
			{
				conn.rollback();
				out.println("<BR>存盘失败！[材料编码]为空");
				return;
			}

			String getglfxclmc="";
			String getjldwbm="";
			double cbj=0;
			ls_sql="SELECT jxc_clbm.clmc,jxc_clbm.jldwbm,jxc_cljgb.cbj";
			ls_sql+=" FROM jxc_clbm,jxc_cljgb ";
			ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm and jxc_clbm.cllb='1' and jxc_cljgb.sfyh='Y'";
			ls_sql+=" and jxc_cljgb.dqbm='"+dqbm+"' and jxc_clbm.clbm='"+cf.GB2Uni(glfxclbm[i])+"'";
			ls_sql+=" order by jxc_clbm.clmc";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				getglfxclmc=rs.getString("clmc");
				getjldwbm=rs.getString("jldwbm");
				cbj=rs.getDouble("cbj");
			}
			rs.close();
			ps.close();

			if (getglfxclmc.equals(""))
			{
				conn.rollback();
				out.println("错误！材料编码不存在："+cf.GB2Uni(glfxclbm[i]));
				return;
			}

			if (!getglfxclmc.equals(cf.GB2Uni(glfxclmc[i])))
			{
				conn.rollback();
				out.println("错误！材料名称["+cf.GB2Uni(glfxclmc[i])+"]不正确，正确材料名称为："+getglfxclmc);
				return;
			}
		}
		else{
			//[物料编码]是否为空
			if (!glfxclbm[i].equals("") )
			{
				conn.rollback();
				out.println("<BR>存盘失败！非[材料类]，不能录入[材料编码]");
				return;
			}
		}


		//[工料名称]是否为空
		if (glfxclmc[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>项目编号["+xmbh[i]+"]存盘失败！[工料名称]为空");
			return;
		}
		//[计量单位]是否为空
		if (jldwbm[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>项目编号["+xmbh[i]+"]存盘失败！[计量单位]为空");
			return;
		}
		//[消耗量]是否为空
		if (xhlstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>项目编号["+xmbh[i]+"]存盘失败！[消耗量]为空");
			return;
		}
		//[单价]是否为空
		if (djstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>项目编号["+xmbh[i]+"]存盘失败！[单价]为空");
			return;
		}

		xhl=0;
		try{
			xhl=java.lang.Double.parseDouble(xhlstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>项目编号["+xmbh[i]+"]存盘失败！工料名称为["+cf.GB2Uni(glfxclmc[i])+"]的[单价]输入不正确:"+xhlstr[i].trim());
			return;
		}

		dj=0;
		try{
			dj=java.lang.Double.parseDouble(djstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>项目编号["+xmbh[i]+"]存盘失败！工料名称为["+cf.GB2Uni(glfxclmc[i])+"]的[单价]输入不正确:"+djstr[i].trim());
			return;
		}

		jqsfl=0;
		try{
			jqsfl=Double.parseDouble(jqsflstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>项目编号["+xmbh[i]+"]存盘失败！工料名称为["+cf.GB2Uni(glfxclmc[i])+"]的[甲醛释放量]输入不正确:"+jqsflstr[i].trim());
			return;
		}

		bsfl=0;
		try{
			bsfl=Double.parseDouble(bsflstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>项目编号["+xmbh[i]+"]存盘失败！工料名称为["+cf.GB2Uni(glfxclmc[i])+"]的[苯释放量]输入不正确:"+bsflstr[i].trim());
			return;
		}

		tvocsfl=0;
		try{
			tvocsfl=Double.parseDouble(tvocsflstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>项目编号["+xmbh[i]+"]存盘失败！工料名称为["+cf.GB2Uni(glfxclmc[i])+"]的[TVOC释放量]输入不正确:"+tvocsflstr[i].trim());
			return;
		}

		glbxh++;

		//家装工料分析表
		ls_sql="insert into bj_jzglfxb(glbxh,bjbbh,dqbm,xmbh,glflbm,wlllbz,lx,glfxclbm,glfxclmc,jldwbm,xhl,dj,lrr,lrsj,bjjbbm,bz,jqsfl,bsfl,tvocsfl)";
		ls_sql+=" values("+glbxh+",'"+bjbbh+"','"+dqbm+"','"+xmbh[i]+"','"+glflbm[i]+"','"+cf.GB2Uni(wlllbz[i])+"','"+lx[i]+"','"+cf.GB2Uni(glfxclbm[i])+"','"+cf.GB2Uni(glfxclmc[i])+"','"+jldwbm[i]+"',"+xhl+","+dj+",'"+yhmc+"',TRUNC(SYSDATE),'"+bjjbbm+"','"+cf.GB2Uni(bz[i])+"',"+jqsfl+","+bsfl+","+tvocsfl+")";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//更新报价成本＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		double clcb=0;//材料成本
		double rgcb=0;//人工成本
		double jxcb=0;//机械成本
		double cbenj=0;//成本价
		ls_sql="select sum(dj*xhl)";
		ls_sql+=" from  bj_jzglfxb";
		ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh[i]+"' and glflbm='1'";//1:材料
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			clcb=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql="select sum(dj*xhl)";
		ls_sql+=" from  bj_jzglfxb";
		ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh[i]+"' and glflbm='2'";//2:人工
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			rgcb=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql="select sum(dj*xhl)";
		ls_sql+=" from  bj_jzglfxb";
		ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh[i]+"' and glflbm='3'";//3:机械
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			jxcb=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		cbenj=cf.round(clcb+rgcb+jxcb,2);

		ls_sql="update bj_jzbjb set clcb=?,rgcb=?,jxcb=?,cbenj=? ";
		ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,clcb);
		ps.setDouble(2,rgcb);
		ps.setDouble(3,jxcb);
		ps.setDouble(4,cbenj);
		ps.executeUpdate();
		ps.close();
		//更新报价成本＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
	}

	String getxmbh=null;
	String getglfxclbm=null;
	int count=0;
	ls_sql="select xmbh,glfxclbm,count(*)";
	ls_sql+=" from  bj_jzglfxb";
	ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and glfxclbm is not null";
	ls_sql+=" group by xmbh,glfxclbm";
	ls_sql+=" having count(*)>1";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		getxmbh=rs.getString(1);
		getglfxclbm=rs.getString(2);
		count=rs.getInt(3);

		out.println("<BR>错误！项目编号["+getxmbh+"]中材料编码["+getglfxclbm+"]重复");
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		conn.rollback();
		out.println("<P>存盘失败！");
		return;
	}

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
	out.print("Exception: " + e);
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