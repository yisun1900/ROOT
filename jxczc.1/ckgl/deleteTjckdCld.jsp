<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ckph=cf.GB2Uni(request.getParameter("ckph"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	//检查是否录入了数据
	String lydh="";
	String cklx=null;
	String dqbm=null;
	String ckdzt="";
	String ckbh="";
	ls_sql=" select cklx,dqbm,lydh,ckdzt,ckbh";
	ls_sql+=" from jxc_ckd ";
	ls_sql+=" where ckph='"+ckph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	int count=0;
	if (rs.next())
	{
		cklx=cf.fillNull(rs.getString("cklx"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		lydh=cf.fillNull(rs.getString("lydh"));
		ckdzt=cf.fillNull(rs.getString("ckdzt"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
	}
	rs.close();
	ps.close();

	if (!ckdzt.equals("9"))
	{
		out.println("错误！出库单未提交");
		return;
	}

	jxc.JxcClass jxc=new jxc.JxcClass();
	String jz=jxc.isJz(conn,ckbh);
	if (jz.equals("N"))//N未结转；Y：已结转
	{
		out.print("上个月没有结转，不能进行库存操作！"+jz);
		return;
	}

	conn.setAutoCommit(false);

	//检查出库数量是否符合
	String clbm=null;
	String zljb=null;
	double cksl=0;
	String xsfs=null;
	ls_sql=" select clbm,zljb,xsfs,sum(cksl) cksl ";
	ls_sql+=" from jxc_ckmx ";
	ls_sql+=" where ckph='"+ckph+"' ";
	ls_sql+=" group by clbm,zljb,xsfs ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		clbm=cf.fillNull(rs.getString("clbm"));
		zljb=cf.fillNull(rs.getString("zljb"));
		xsfs=cf.fillNull(rs.getString("xsfs"));
		cksl=rs.getDouble("cksl");


		//代销品不需出库
		if (xsfs.equals("1"))//1：代销品；2：现货销售；3：期货销售；4：允许负库存
		{
			continue;
		}

		//更新：材料价格表＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		if (zljb.equals("1"))//正常品
		{
			//修改材料价格表正常品总数量
			ls_sql=" update jxc_cljgb set zcpzsl=zcpzsl+"+cksl+",dhsl=dhsl+"+cksl;
			ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
		else if (zljb.equals("2"))//残次品
		{
			//修改材料价格表残次品总数量
			ls_sql=" update jxc_cljgb set ccpzsl=ccpzsl+"+cksl+",dhsl=dhsl+"+cksl;
			ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
		else if (zljb.equals("3"))//报废品
		{
			//修改材料价格表报废品总数量
			ls_sql=" update jxc_cljgb set bfpzsl=bfpzsl+"+cksl+",dhsl=dhsl+"+cksl;
			ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
		//更新：材料价格表＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
	}
	rs.close();
	ps.close();

	//更新：库存表＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	//产生主键流水号
	int maxlsh=0;
	ls_sql=" select NVL(max(TO_NUMBER(lsh)),0) lsh";
	ls_sql+=" from jxc_kcb ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())//库存有货 直接更新数量
	{
		maxlsh=rs.getInt("lsh");
	}
	rs.close();
	ps.close();


	String lsh=null;
	String ylsh=null;
	double rkj=0;
	double kcje=0;

	ls_sql=" select lsh,clbm,cksl,rkj";
	ls_sql+=" from jxc_ckcpxx ";
	ls_sql+=" where ckph='"+ckph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		ylsh=cf.fillNull(rs.getString("lsh"));
		clbm=cf.fillNull(rs.getString("clbm"));
		cksl=rs.getDouble("cksl");
		rkj=rs.getDouble("rkj");

		//修改:是否有负库存
		ls_sql=" update jxc_ckmx set sfyfkc='1',fkcs=0";
		ls_sql+=" where clbm='"+clbm+"' and ckph='"+ckph+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		kcje=cksl*rkj;

		//产生主键流水号
		maxlsh++;
		lsh=maxlsh+"";
		lsh=cf.addZero(lsh,13);

		//将【出库产品信息】数据返【库存表】
		ls_sql =" insert into jxc_kcb (kcsl,kcje,lsh   ,clbm,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,gysmc,cllbbm,xh,nbbm,gg,clysbm,djzl,jldwbm,bzgg,bzjldwbm,glfzclbm,glfzclmc,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz,zljb,clzk,rkph,rkxh,rksj,dbph,scph,scrq,hwbh,hjbh,ckbh,dqbm,rkj,jqpjcbj,lsj,xsj,dfgsjg,dgzjg,ztbz)";
		ls_sql+=" select               ?   ,?   ,?     ,clbm,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,gysmc,cllbbm,xh,nbbm,gg,clysbm,djzl,jldwbm,bzgg,bzjldwbm,glfzclbm,glfzclmc,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz,zljb,clzk,rkph,rkxh,rksj,dbph,scph,scrq,hwbh,hjbh,ckbh,dqbm,rkj,jqpjcbj,NVL(lsj,0),NVL(xsj,0),NVL(dfgsjg,0),NVL(dgzjg,0),ztbz";
		ls_sql+=" from jxc_ckcpxx ";
		ls_sql+=" where ckph='"+ckph+"' and lsh='"+ylsh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDouble(1,cksl);
		ps1.setDouble(2,kcje);
		ps1.setString(3,lsh);
		ps1.executeUpdate();
		ps1.close();

		//加权平均成本价
		jxc.JsJqpjcbj(conn,dqbm,clbm);
	}
	rs.close();
	ps.close();
	//更新：库存表＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	//删除：【出库产品信息】
	ls_sql="delete from jxc_ckcpxx ";
	ls_sql+=" where ckph='"+ckph+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//更新出库单状态
	ls_sql=" update jxc_ckd set ckdzt='0',sfyfkc='1',ckzsl=0,ckzje=0,ckzcb=0 ";//1：无负库存
	ls_sql+=" where  ckph='"+ckph+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	//更新:材料单.状态、材料单明细.出库数量＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	if (cklx.equals("P"))
	{	
		int mark=0;
		int mark1=0;
		double pssl=0;
		ls_sql=" select clbm,pssl";
		ls_sql+=" from jxc_clpsmx ";
		ls_sql+=" where psph='"+lydh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		while (rs.next())
		{
			clbm=rs.getString("clbm");
			pssl=rs.getDouble("pssl");

			cksl=0;
			ls_sql=" select sum(cksl) cksl";
			ls_sql+=" from jxc_ckd,jxc_ckmx ";
			ls_sql+=" where jxc_ckd.ckph=jxc_ckmx.ckph and jxc_ckd.cklx='"+cklx+"' and jxc_ckd.lydh='"+lydh+"' and jxc_ckd.ckdzt!='0' and jxc_ckmx.clbm='"+clbm+"'";
			ls_sql+=" group by clbm";
			ps1= conn.prepareStatement(ls_sql);
			rs1=ps1.executeQuery();
			if (rs1.next())
			{
				cksl=rs1.getDouble("cksl");
			}
			rs1.close();
			ps1.close();

			if (cksl>pssl)
			{
				conn.rollback();
				out.println("错误！材料【"+clbm+"】出库数量["+cksl+"]超过材料单数量["+pssl+"]");
				return;
			}
			else if (cksl<pssl)
			{
				mark++;
			}
			if (cksl>0)
			{
				mark1++;
			}

			//更新：材料单明细(jxc_clpsmx).出库数量cksl
			ls_sql=" update jxc_clpsmx set cksl="+cksl;
			ls_sql+=" where clbm='"+clbm+"' and psph='"+lydh+"' ";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
		rs.close();
		ps.close();

		double ycksl=0;
		double yckje=0;
		ls_sql=" select sum(cksl) cksl,sum(round(cksl*dj,2)) yckje";
		ls_sql+=" from jxc_clpsmx ";
		ls_sql+=" where psph='"+lydh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			ycksl=rs.getDouble("cksl");
			yckje=rs.getDouble("yckje");
		}
		rs.close();
		ps.close();

		//更新：材料单明细(jxc_clpsmx).出库数量cksl
		ls_sql=" update jxc_clpsd set ycksl="+ycksl+",yckje="+yckje;
		ls_sql+=" where psph='"+lydh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		if (mark1==0)//无出库
		{
			ls_sql="update jxc_clpsd set psdzt='2' ";
			ls_sql+=" where psph='"+lydh+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else{//有出库
			if (mark==0)//全出库
			{
				ls_sql="update jxc_clpsd set psdzt='3' ";
				ls_sql+=" where psph='"+lydh+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
			else{//有部分未出库
				ls_sql="update jxc_clpsd set psdzt='5' ";
				ls_sql+=" where psph='"+lydh+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
		}

	}
	//更新:材料单.状态、材料单明细.出库数量＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	//更新:申购单.状态、申购明细.出库数量＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	else if (cklx.equals("S"))
	{	
		int mark=0;
		int mark1=0;
		double shsl=0;
		ls_sql=" select clbm,shsl";
		ls_sql+=" from jxc_clsgmx ";
		ls_sql+=" where sgph='"+lydh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		while (rs.next())
		{
			clbm=rs.getString("clbm");
			shsl=rs.getDouble("shsl");

			//已提交的所有出库数量小计
			cksl=0;
			ls_sql=" select sum(cksl) cksl";
			ls_sql+=" from jxc_ckd,jxc_ckmx ";
			ls_sql+=" where jxc_ckd.ckph=jxc_ckmx.ckph and jxc_ckd.ckdzt!='0'";
			ls_sql+=" and jxc_ckd.cklx='"+cklx+"' and jxc_ckd.lydh='"+lydh+"' and jxc_ckmx.clbm='"+clbm+"'";
			ls_sql+=" group by clbm";
			ps1= conn.prepareStatement(ls_sql);
			rs1=ps1.executeQuery();
			if (rs1.next())
			{
				cksl=rs1.getDouble("cksl");
			}
			rs1.close();
			ps1.close();

			if (cksl>shsl)//出库数量 > 来源单数量 :出错
			{
				conn.rollback();
				out.println("错误！材料【"+clbm+"】[出库数量:"+cksl+"]超过[申购数量:"+shsl+"]");
				return;
			}
			else if (cksl<shsl)
			{
				mark++;//有部分未出库
			}

			if (cksl>0)//判断是否已出库
			{
				mark1++;
			}

			//更新：材料单明细(jxc_clsgmx).出库数量cksl
			ls_sql=" update jxc_clsgmx set ycksl="+cksl;
			ls_sql+=" where clbm='"+clbm+"' and sgph='"+lydh+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
		rs.close();
		ps.close();

		//处理：材料申购单.状态＋＋＋＋＋＋＋＋开始
		if (mark1==0)//无出库
		{
			ls_sql="update jxc_clsgd set sgdzt='2' ";//2：审核通过
			ls_sql+=" where sgph='"+lydh+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else{//有出库
			if (mark==0)//全出库
			{
				ls_sql="update jxc_clsgd set sgdzt='3' ";//3：已出库
				ls_sql+=" where sgph='"+lydh+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
			else{//有部分未出库
				ls_sql="update jxc_clsgd set sgdzt='5' ";//5：部分出库
				ls_sql+=" where sgph='"+lydh+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
		}
		//处理：材料申购单.状态＝＝＝＝＝＝＝＝＝＝结束

	}
	//更新:申购单.状态、申购明细.出库数量＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
		alert("删除提交成功！");
		window.close();
	//-->
	</SCRIPT>
	&nbsp;<br>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{	conn.setAutoCommit(true);
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