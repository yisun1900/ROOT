<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String dqbm=request.getParameter("dqbm");
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));

String[] glbxh=request.getParameterValues("glbxh");
String[] glflbm=request.getParameterValues("glflbm");
String[] glfxclbm=request.getParameterValues("glfxclbm");
String[] glfxclmc=request.getParameterValues("glfxclmc");
String[] djstr=request.getParameterValues("dj");
String[] jldwbm=request.getParameterValues("jldwbm");
String[] xhlstr=request.getParameterValues("xhl");
String[] jqsflstr=request.getParameterValues("jqsfl");
String[] bsflstr=request.getParameterValues("bsfl");
String[] tvocsflstr=request.getParameterValues("tvocsfl");
String[] lx=request.getParameterValues("lx");
String[] wlllbz=request.getParameterValues("wlllbz");
String[] bz=request.getParameterValues("bz");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double dj=0;
double xhl=0;
int count=0;
double jqsfl=0;
double bsfl=0;
double tvocsfl=0;

try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);


	for (int i=0;i<glflbm.length ;i++ )
	{
		//未录信息
		if (glflbm[i].equals(""))
		{
			continue;
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
			ls_sql+=" and jxc_cljgb.dqbm='"+dqbm+"' and jxc_clbm.nbbm='"+cf.GB2Uni(glfxclbm[i])+"'";
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
		//[材料名称]是否为空
		if (glfxclmc[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[材料名称]为空");
			return;
		}
		//[计量单位]是否为空
		if (jldwbm[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[计量单位]为空");
			return;
		}
		//[消耗量]是否为空
		if (xhlstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[数量]为空");
			return;
		}
		//[单价]是否为空
		if (djstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[单价]为空");
			return;
		}

		xhl=0;
		try{
			xhl=java.lang.Double.parseDouble(xhlstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>存盘失败！材料名称为["+cf.GB2Uni(glfxclmc[i])+"]的[数量]输入不正确:"+xhlstr[i].trim());
			return;
		}

		dj=0;
		try{
			dj=java.lang.Double.parseDouble(djstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>存盘失败！材料名称为["+cf.GB2Uni(glfxclmc[i])+"]的[单价]输入不正确:"+djstr[i].trim());
			return;
		}

		//[甲醛释放量]是否为空
		if (jqsflstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[甲醛释放量]为空");
			return;
		}

		jqsfl=0;
		try{
			jqsfl=java.lang.Double.parseDouble(jqsflstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>存盘失败！材料名称为["+cf.GB2Uni(glfxclmc[i])+"]的[甲醛释放量]输入不正确:"+jqsflstr[i].trim());
			return;
		}
		//[苯释放量]是否为空
		if (bsflstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[苯释放量]为空");
			return;
		}

		bsfl=0;
		try{
			bsfl=java.lang.Double.parseDouble(bsflstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>存盘失败！材料名称为["+cf.GB2Uni(glfxclmc[i])+"]的[苯释放量]输入不正确:"+bsflstr[i].trim());
			return;
		}
		//[TVOC释放量]是否为空
		if (tvocsflstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[TVOC释放量]为空");
			return;
		}

		tvocsfl=0;
		try{
			tvocsfl=java.lang.Double.parseDouble(tvocsflstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>存盘失败！材料名称为["+cf.GB2Uni(glfxclmc[i])+"]的[甲醛释放量]输入不正确:"+tvocsflstr[i].trim());
			return;
		}
		


		if (glflbm[i].equals("1"))
		{
			if (wlllbz[i].equals(""))
			{
				conn.rollback();
				out.println("<BR>存盘失败！材料名称为["+cf.GB2Uni(glfxclmc[i])+"]，请选择【是否需要物流领料】");
				return;
			}
		}
		else{
			wlllbz[i]="";
		}

		int newglbxh=0;

		if (glbxh[i].equals(""))
		{
			ls_sql="select NVL(max(TO_NUMBER(glbxh)),0)";
			ls_sql+=" from  bj_jzglfxb";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				newglbxh=rs.getInt(1);
			}
			rs.close();
			ps.close();

			newglbxh++;

			//家装工料分析表
			ls_sql="insert into bj_jzglfxb(glbxh,bjbbh,dqbm,bjjbbm,xmbh,glflbm,glfxclbm,glfxclmc,dj,jldwbm,xhl,jqsfl,bsfl,tvocsfl,lx,wlllbz,lrr,lrsj,bz)";
			ls_sql+=" values("+newglbxh+",'"+bjbbh+"','"+dqbm+"','"+bjjbbm+"','"+xmbh+"','"+glflbm[i]+"','"+cf.GB2Uni(glfxclbm[i])+"','"+cf.GB2Uni(glfxclmc[i])+"',"+dj+",'"+jldwbm[i]+"',"+xhl+","+jqsfl+","+bsfl+","+tvocsfl+",'"+cf.GB2Uni(lx[i])+"','"+wlllbz[i]+"','"+yhmc+"',TRUNC(SYSDATE),'"+cf.GB2Uni(bz[i])+"')";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else{
			//家装工料分析表
			ls_sql="update bj_jzglfxb set glflbm='"+glflbm[i]+"',glfxclbm='"+cf.GB2Uni(glfxclbm[i])+"',glfxclmc='"+cf.GB2Uni(glfxclmc[i])+"'";
			ls_sql+=" ,dj="+dj+",jldwbm='"+jldwbm[i]+"',xhl="+xhl+",jqsfl="+jqsfl+",bsfl="+bsfl+",tvocsfl="+tvocsfl+",lx='"+cf.GB2Uni(lx[i])+"',wlllbz='"+wlllbz[i]+"',lrr='"+yhmc+"',lrsj=TRUNC(SYSDATE),bz='"+cf.GB2Uni(bz[i])+"'";
			ls_sql+=" where glbxh="+glbxh[i];
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

		//更新报价成本＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		double clcb=0;//材料成本
		double rgcb=0;//人工成本
		double jxcb=0;//机械成本
		double cbenj=0;//成本价
		ls_sql="select sum(dj*xhl)";
		ls_sql+=" from  bj_jzglfxb";
		ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"' and glflbm='1'";//1:材料
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
		ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"' and glflbm='2'";//2:人工
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
		ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"' and glflbm='3'";//3:机械
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
		ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,clcb);
		ps.setDouble(2,rgcb);
		ps.setDouble(3,jxcb);
		ps.setDouble(4,cbenj);
		ps.executeUpdate();
		ps.close();
		//更新报价成本＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
	}

	String getglfxclbm=null;
	count=0;
	ls_sql="select glfxclbm,count(*)";
	ls_sql+=" from  bj_jzglfxb";
	ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"' and glfxclbm is not null";
	ls_sql+=" group by glfxclbm";
	ls_sql+=" having count(*)>1";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		getglfxclbm=rs.getString(1);
		count=rs.getInt(2);

		out.println("<BR>错误！材料编码["+getglfxclbm+"]重复");
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