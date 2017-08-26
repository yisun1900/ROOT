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
	String mddqbm=null;
	String ckdzt="";
	String ckbh="";
	ls_sql=" select cklx,dqbm,mddqbm,lydh,ckdzt,ckbh";
	ls_sql+=" from jxc_ckd ";
	ls_sql+=" where ckph='"+ckph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	int count=0;
	if (rs.next())
	{
		cklx=cf.fillNull(rs.getString("cklx"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		mddqbm=cf.fillNull(rs.getString("mddqbm"));
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

			//修改:库存数
			ls_sql=" update jxc_cljgb set zcpzsl=zcpzsl-"+cksl;
			ls_sql+=" where dqbm='"+mddqbm+"' and clbm='"+clbm+"'";
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

			//修改:库存数
			ls_sql=" update jxc_cljgb set ccpzsl=ccpzsl-"+cksl;
			ls_sql+=" where dqbm='"+mddqbm+"' and clbm='"+clbm+"'";
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

			//修改:库存数
			ls_sql=" update jxc_cljgb set bfpzsl=bfpzsl-"+cksl;
			ls_sql+=" where dqbm='"+mddqbm+"' and clbm='"+clbm+"'";
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
//	String clbm=null;
	String rkph=null;
	String rkxh=null;
	java.sql.Date rksj=null;
	String yckph=null;
	String hwbh=null;
	String hjbh=null;
//	String ckbh=null;
//	String dqbm=null;
	double rkj=0;
	double jqpjcbj=0;
	double lsj=0;
	double xsj=0;
	double dfgsjg=0;
	double dgzjg=0;
	double kcsl=0;
	double kcje=0;
	double ckdj=0;
	double ckje=0;

	ls_sql=" select lsh,clbm,rkph,rkxh,rksj,yckph,hwbh,hjbh,ckbh,dqbm,rkj,jqpjcbj,lsj,xsj,dfgsjg,dgzjg,kcsl,kcje,ckdj,ckje";
	ls_sql+=" from jxc_cklsb ";
	ls_sql+=" where ckph='"+ckph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		lsh=cf.fillNull(rs.getString("lsh"));
		clbm=cf.fillNull(rs.getString("clbm"));
		rkph=cf.fillNull(rs.getString("rkph"));
		rkxh=cf.fillNull(rs.getString("rkxh"));
		rksj=rs.getDate("rksj");
		yckph=cf.fillNull(rs.getString("yckph"));
		hwbh=cf.fillNull(rs.getString("hwbh"));
		hjbh=cf.fillNull(rs.getString("hjbh"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		rkj=rs.getDouble("rkj");
		jqpjcbj=rs.getDouble("jqpjcbj");
		lsj=rs.getDouble("lsj");
		xsj=rs.getDouble("xsj");
		dfgsjg=rs.getDouble("dfgsjg");
		dgzjg=rs.getDouble("dgzjg");
		kcsl=rs.getDouble("kcsl");
		kcje=rs.getDouble("kcje");
		ckdj=rs.getDouble("ckdj");
		ckje=rs.getDouble("ckje");

		//修改:是否有负库存
		ls_sql=" update jxc_ckmx set sfyfkc='1',fkcs=0";
		ls_sql+=" where clbm='"+clbm+"' and ckph='"+ckph+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		kcje=cksl*rkj;

		ls_sql=" update jxc_kcb set ztbz='N',ckph=?,dqbm=?,rkj=?,kcje=?,rkph=?,rkxh=?,rksj=?,hwbh=?,hjbh=?,ckbh=?";
		ls_sql+=" where  lsh='"+lsh+"' ";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,yckph);
		ps1.setString(2,dqbm);
		ps1.setDouble(3,rkj);
		ps1.setDouble(4,kcje);
		ps1.setString(5,rkph);
		ps1.setString(6,rkxh);
		ps1.setDate(7,rksj);
		ps1.setString(8,hwbh);
		ps1.setString(9,hjbh);
		ps1.setString(10,ckbh);
		ps1.executeUpdate();
		ps1.close();

		//加权平均成本价
		jxc.JsJqpjcbj(conn,dqbm,clbm);
	}
	rs.close();
	ps.close();
	//更新：库存表＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	//删除：【出库产品信息】
	ls_sql="delete from jxc_cklsb ";
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


	//更新:调拨单.状态、调拨明细.出库数量＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	int mark=0;
	int mark1=0;
	double dbsl=0;
	ls_sql=" select clbm,dbsl";
	ls_sql+=" from jxc_dbmx ";
	ls_sql+=" where dbph='"+lydh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		clbm=rs.getString("clbm");
		dbsl=rs.getDouble("dbsl");

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

		if (cksl>dbsl)//出库数量 > 来源单数量 :出错
		{
			conn.rollback();
			out.println("错误！材料【"+clbm+"】[出库数量:"+cksl+"]超过[调拨数量:"+dbsl+"]");
			return;
		}
		else if (cksl<dbsl)
		{
			mark++;//有部分未出库
		}

		if (cksl>0)//判断是否已出库
		{
			mark1++;
		}

		//更新：材料单明细(jxc_dbmx).出库数量cksl
		ls_sql=" update jxc_dbmx set cksl="+cksl;
		ls_sql+=" where clbm='"+clbm+"' and dbph='"+lydh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();

	//处理：材料调拨单.状态＋＋＋＋＋＋＋＋开始
	if (mark1==0)//无出库
	{
		ls_sql="update jxc_db set dbdzt='2' ";//2：审核通过等待出库
		ls_sql+=" where dbph='"+lydh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else{//有出库
		if (mark==0)//全出库
		{
			ls_sql="update jxc_db set dbdzt='3' ";//3：已出库等待入库
			ls_sql+=" where dbph='"+lydh+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else{//有部分未出库
			ls_sql="update jxc_db set dbdzt='5' ";//5：部分出库
			ls_sql+=" where dbph='"+lydh+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}
	//处理：材料调拨单.状态＝＝＝＝＝＝＝＝＝＝结束

	//更新:调拨单.状态、调拨明细.出库数量＝＝＝＝＝＝＝＝＝＝＝＝＝结束

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