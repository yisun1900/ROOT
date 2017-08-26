<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zjxxh=request.getParameter("zjxxh");
String jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
String tcsjflbm=cf.GB2Uni(request.getParameter("tcsjflbm"));

String khbjjbbm=cf.GB2Uni(request.getParameter("khbjjbbm"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));

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

	String khbh=null;
	ls_sql="select khbh";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
	}
	rs.close();
	ps.close();

	int count=0;

	String bjbbh=null;
	String ssfgs=null;
	String hxbm=null;
	ls_sql="select bjbbh,ssfgs,hxbm";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjbbh=rs.getString("bjbbh");
		ssfgs=rs.getString("ssfgs");
		hxbm=rs.getString("hxbm");
	}
	rs.close();
	ps.close();

	String dqbm=null;
	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();


	double sjcj=-1;

	ls_sql="SELECT sjcj";
	ls_sql+=" FROM bj_tcsjcjb";
	ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+khbjjbbm+"' and bjjbbm1='"+bjjbbm+"' and tcsjflbm='"+tcsjflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjcj=rs.getDouble("sjcj");
	}
	rs.close();
	ps.close();

	if (sjcj==-1)
	{
		out.println("错误！没有升级差价，请联系管理员:"+ls_sql);
		return;
	}

	String bjjbbmQ=null;
	String sjsfycxQ=null;
	double sjslQ=0;
	double sjjshslQ=0;
	double sjsfslQ=0;
	double sjcjQ=0;
	double sjsfjeQ=0;
	ls_sql="select bjjbbm,sjsfycx,sjsl,sjjshsl,sjsfsl,sjcj,sjsfje";
	ls_sql+=" from  bj_khzcxmxjq";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjbbmQ=cf.fillNull(rs.getString("bjjbbm"));
		sjsfycxQ=cf.fillNull(rs.getString("sjsfycx"));
		sjslQ=rs.getDouble("sjsl");
		sjjshslQ=rs.getDouble("sjjshsl");
		sjsfslQ=rs.getDouble("sjsfsl");
		sjcjQ=rs.getDouble("sjcj");
		sjsfjeQ=rs.getDouble("sjsfje");
	}
	rs.close();
	ps.close();

	String bjjbbmH=null;
	ls_sql="select bjjbbm";
	ls_sql+=" from  bj_khzcxmxjh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjbbmH=cf.fillNull(rs.getString("bjjbbm"));
	}
	rs.close();
	ps.close();
	if (bjjbbm.equals(bjjbbmH))//级别没有发生变化，直接推出
	{
		out.println("级别未改变");
		return;
	}

	String sjsfycx="1";//1：无促销；2：无数量限制促销；3：有数量限制促销


	conn.setAutoCommit(false);

	if (bjjbbm.equals(bjjbbmQ))//恢复原来级别，采用原价格，删除已做增建项
	{
		//删除非原项目
		ls_sql=" delete from  bj_khzcxmh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and lx!='1'";//1：原项目；2：增项；3：减项；4：新增项
		ls_sql+=" and tccplbbm in(select tccplbbm from bj_khzcxmxjh where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"')";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//还原原项目
		ls_sql=" update  bj_khzcxmxjh set bjjbbm='"+bjjbbm+"',sjsfycx='"+sjsfycxQ+"'";
		ls_sql+=" ,sjsl="+sjslQ+",sjjshsl="+sjjshslQ+",sjsfsl="+sjsfslQ+",sjcj="+sjcjQ+",sjsfje="+sjsfjeQ;
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else{//进行升级，把原来主材减项，不能直接删除
		//对已选主材做减项＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		//删除非原项目，再对原项目做减项
		ls_sql=" delete from  bj_khzcxmh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and lx!='1'";//1：原项目；2：增项；3：减项；4：新增项
		ls_sql+=" and tccplbbm in(select tccplbbm from bj_khzcxmxjh where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"')";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

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

		String oldsxh=null;
		String getxh=null;
		double oldsl=0;
		String fjddbh=null;

		ls_sql=" select  sxh,xh,sl,fjddbh";
		ls_sql+=" from bj_khzcxmh ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"'";
		ls_sql+=" and tccplbbm in(select tccplbbm from bj_khzcxmxjh where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"')";
		ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			oldsxh=cf.fillNull(rs1.getString("sxh"));
			getxh=cf.fillNull(rs1.getString("xh"));
			fjddbh=cf.fillNull(rs1.getString("fjddbh"));
			oldsl=rs1.getDouble("sl");

			String xclbz="";
			String clzt="";
			ls_sql="select xclbz,clzt";
			ls_sql+=" from  jc_zcdd";
			ls_sql+=" where ddbh='"+fjddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				xclbz=cf.fillNull(rs.getString("xclbz"));
				clzt=cf.fillNull(rs.getString("clzt"));
			}
			rs.close();
			ps.close();
			if (xclbz.equals("2"))//1：非定制式产品；2：定制式产品
			{
				//00：录入预订单：02：预订单已接收；03：测量已通知；05：已测量； 25：通知复尺；26：复尺；07：合同未完成；09：合同已完成；11：合同已确认；13：工厂已接收；27：入库；15：确定送货时间；17：已通知送货；18：已出库；19：已送货；20：部分送货；21：已通知退补货；23：已退补货；30：单项完结；98:取消预订单；99：退单
				if (clzt.compareTo("11")>0 && !clzt.equals("25") && !clzt.equals("26"))
				{
					conn.rollback();
					out.println("错误！【定制产品】厂商已接受，不能升级，型号:"+getxh);
					return;
				}
			}
			else{
				//00：录入预订单：02：预订单已接收；03：测量已通知；05：已测量； 25：通知复尺；26：复尺；07：合同未完成；09：合同已完成；11：合同已确认；13：工厂已接收；27：入库；15：确定送货时间；17：已通知送货；18：已出库；19：已送货；20：部分送货；21：已通知退补货；23：已退补货；30：单项完结；98:取消预订单；99：退单
				if (clzt.equals("19") && clzt.equals("20") && clzt.equals("30"))
				{
					conn.rollback();
					out.println("错误！【非定制式产品】已送货，不能升级，型号:"+getxh);
					return;
				}
			}

			String lx="3";//1：原项目；2：增项；3：减项；4：新增项

			sxh++;

			ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj    ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl   ,xdsl   ,ptcpsm,bjjbbm,oldsxh,lx,ywdhslbz) ";
			ls_sql+=" select                 ?  ,zjxxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj    ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,-1*sl,-1*xdsl,ptcpsm,bjjbbm,sxh   ,? ,'Y'";
			ls_sql+=" from bj_khzcxmh";
			ls_sql+=" where zjxxh='"+zjxxh+"' and sxh="+oldsxh+" and ywdhslbz='Y'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setString(2,lx);//1：原项目；2：增项；3：减项；4：新增项
			ps.executeUpdate();
			ps.close();
		}
		rs1.close();
		ps1.close();

		//对已选主材做减项＝＝＝＝＝＝＝＝＝＝＝＝＝结束

		//取报价升级信息
		int htsjbz=0;
		ls_sql="select count(*)";
		ls_sql+=" from  bj_khzcxmxj";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"' and bjjbbm='"+bjjbbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			htsjbz=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (htsjbz>0)
		{
			ls_sql="select sjcj,sjsfycx";
			ls_sql+=" from  bj_khzcxmxj";
			ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"' and bjjbbm='"+bjjbbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				sjcj=rs1.getDouble("sjcj");
				sjsfycx=cf.fillNull(rs1.getString("sjsfycx"));
			}
			rs1.close();
			ps1.close();
		}

		ls_sql=" update  bj_khzcxmxjh set bjjbbm='"+bjjbbm+"',sjsfycx='"+sjsfycx+"'";
		ls_sql+=" ,sjsl=0,sjjshsl=0,sjsfsl=0,sjcj="+sjcj+",sjsfje=0";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}


	ls_sql=" update  bj_khzcxmxjh set sjcj=0,sjsfycx='1'";//1：无促销；2：无数量限制促销；3：有数量限制促销
	ls_sql+=" where zjxxh='"+zjxxh+"' and sfyxsj='N'";//升级是否收费  Y：是；N：否
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	

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