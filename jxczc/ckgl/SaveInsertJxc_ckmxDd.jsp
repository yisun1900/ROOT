<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String lsh=null;
String ckph = request.getParameter("ckph");
String ckbh = request.getParameter("ckbh");
String dqbm = request.getParameter("dqbm");


String[] clbm =request.getParameterValues("clbm");
String[] ckslstr =request.getParameterValues("cksl");
String[] xsfs =request.getParameterValues("xsfs");
String[] kcslstr =request.getParameterValues("kcsl");
String[] xckslstr =request.getParameterValues("xcksl");
String[] ckdjstr =request.getParameterValues("ckdj");
String[] cbdjstr =request.getParameterValues("cbdj");
String[] hjbh =request.getParameterValues("hjbh");
String[] scph =request.getParameterValues("scph");

double cksl=0;
double kcsl=0;
double xcksl=0;//需出库数量
double ckdj=0;
double cbdj=0;

String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
PreparedStatement ps2=null;
ResultSet rs2 = null;

try {
	conn=cf.getConnection();    //得到连接


	//查询出库单
	String ckdzt = null;
	ls_sql = " select ckdzt ";
	ls_sql+= " from jxc_ckd ";
	ls_sql +=" where ckph='"+ckph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ckdzt=cf.fillNull(rs.getString("ckdzt"));
	}
	else
	{
		out.print("错误！不存在的出库单");
		return;
	}
	rs.close();
	ps.close();
	if (!ckdzt.equals("0"))
	{
		out.print("错误！出库单已提交");
		return;
	}

	//查询最大序号
	double ckxh=0;
	ls_sql=" select NVL(max(ckxh),0)";
	ls_sql+=" from jxc_ckmx ";
	ls_sql+=" where ckph='"+ckph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ckxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	for (int i=0;i<clbm.length ;i++ )
	{
		double count=0;
		ls_sql=" select count(*)";
		ls_sql+=" from jxc_ckmx ";
		ls_sql+=" where ckph='"+ckph+"' and clbm='"+clbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count>0)
		{
			conn.rollback();
			out.println("<BR>错误！【"+clbm[i]+"】已出库，可在【修改明细】中修改出库数量");
			return;
		}

		//出库数量
		try{
			cksl=Double.parseDouble(ckslstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>错误！【"+clbm[i]+"】[出库数量]不是数字类型："+ckslstr[i]);
			return;
		}

		if (cksl<0)
		{
			out.println("<BR>错误！【"+clbm[i]+"】出库数量不能小于0");
			conn.rollback();
			return;
		}

		if (cksl==0)
		{
			continue;
		}

		kcsl=Double.parseDouble(kcslstr[i].trim());
		xcksl=Double.parseDouble(xckslstr[i].trim());
		ckdj=Double.parseDouble(ckdjstr[i].trim());
		cbdj=Double.parseDouble(cbdjstr[i].trim());

		//检查：出库数量不能大于需要出库数量＋＋＋＋＋＋＋＋＋＋＋开始
		//出库数量＝需出库数量＝开单数量－已出库数量
		if (cksl>xcksl)
		{
			conn.rollback();
			out.print("<BR>错误！材料【"+clbm[i]+"】【出库数量："+cksl+"】不能大于【需出库数量："+xcksl+"】");
			return;
		}
		//检查：出库数量不能大于需要出库数量＝＝＝＝＝＝＝＝＝＝＝结束

		//检查：出库数量不能大于库存数量＋＋＋＋＋＋＋＋＋＋＋开始
		//1：代销品；2：现货销售；3：期货销售；4：允许负库存
		if (xsfs[i].equals("2") || xsfs[i].equals("3"))
		{
			if (cksl>kcsl)
			{
				conn.rollback();
				out.print("<BR>错误！材料【"+clbm[i]+"】【出库数量："+cksl+"】不能大于【库存数量："+kcsl+"】");
				return;
			}

			double hjkcsl=0;
			ls_sql = " select sum(kcsl)";
			ls_sql+= " from jxc_kcb";
			ls_sql +=" where jxc_kcb.clbm='"+clbm[i]+"' and jxc_kcb.ckbh='"+ckbh+"'";
			if (!hjbh[i].equals(""))
			{
				ls_sql +=" and jxc_kcb.hjbh='"+hjbh[i]+"'";
			}
			if (!cf.GB2Uni(scph[i]).equals(""))
			{
				ls_sql +=" and jxc_kcb.scph='"+cf.GB2Uni(scph[i])+"'";
			}
			ps= conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
			if (rs.next())
			{
				hjkcsl=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			if (cksl>hjkcsl)
			{
				conn.rollback();
				out.print("<BR>错误！材料【"+clbm[i]+"】【出库数量："+cksl+"】不能大于【货架、批好库存数量："+hjkcsl+"】");
				return;
			}
		}


		


		//检查：出库数量不能大于库存数量＝＝＝＝＝＝＝＝＝＝＝结束
		
		ckxh++;

		String zljb="1";//1：正常品；2：残次品；3：报废品
		double ckje=ckdj*cksl;
		double cbje=cbdj*cksl;
		ls_sql="insert into jxc_ckmx (ckph,ckxh  ,clbm,clmc,xh,gg,nbbm,ppmc,gysmc,cldlbm,clxlbm  ,zljb,jldwbm,cksl,ckdj,cbdj,ckje,cbje,ckbh,xsfs,sfyfkc,fkcs            ,hjbh,scph) ";
		ls_sql+=" select              ?,?        ,jxc_clbm.clbm,clmc,xh,gg,nbbm,ppmc,jxc_cljgb.gysmc,jxc_clbm.cldlbm,jxc_clbm.clxlbm  ,?   ,jldwbm,?,?,?,?,?,?,?,'1',0  ,?,?";
		ls_sql+=" from jxc_clbm,jxc_cljgb ";
		ls_sql+=" where  jxc_clbm.clbm=jxc_cljgb.clbm and jxc_clbm.clbm='"+clbm[i]+"' and jxc_cljgb.dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ckph);
		ps.setDouble(2,ckxh);
		ps.setString(3,zljb);
		ps.setDouble(4,cksl);
		ps.setDouble(5,ckdj);
		ps.setDouble(6,cbdj);
		ps.setDouble(7,ckje);
		ps.setDouble(8,cbje);
		ps.setString(9,ckbh);
		ps.setString(10,xsfs[i]);
		ps.setString(11,hjbh[i]);
		ps.setString(12,cf.GB2Uni(scph[i]));
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("保存成功");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>ls_sql=" + ls_sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              

