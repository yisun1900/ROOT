<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String rkph=cf.GB2Uni(request.getParameter("rkph"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//检查入库单状态
	String rkdzt=null;
	String gysmc=null;
	String dqbm=null;
	String ckbh=null;
	java.sql.Date rksj=null;
	ls_sql="select rkdzt,gysmc,dqbm,ckbh,rksj ";
	ls_sql+=" from  jxc_rkd ";
	ls_sql+=" where rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		rkdzt=rs.getString("rkdzt");
		gysmc=rs.getString("gysmc");
		dqbm=rs.getString("dqbm");
		ckbh=rs.getString("ckbh");
		rksj=rs.getDate("rksj");
	}
	else{
		out.print("错误！入库单["+rkph+"]不存在！");
		return;
	}
	rs.close();
	ps.close();

	if (!rkdzt.equals("0"))//0：未提交；1：等待审核；2：等待入库；3：已入库；4：已结算；6：等待总部审核
	{
		out.print("错误！入库单已提交");
		return;
	}

	int count=0;
	ls_sql="select count(*) ";
	ls_sql+=" from  jxc_rkmx ";
	ls_sql+=" where rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count==0)
	{
		out.print("错误！入库单没有任何明细，不能提交");
		return;
	}

	//检查是否录入完整
	double rksl=0;
	String clbm=null;
	ls_sql=" select rksl,clbm ";
	ls_sql+=" from jxc_rkmx ";
	ls_sql+=" where rkph='"+rkph+"' ";
	ls_sql+=" order by rkxh";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		rksl=rs.getDouble("rksl");
		clbm=cf.fillNull(rs.getString("clbm"));

		if (rksl==0)
		{
			rs.close();
			ps.close();
			out.print("错误！材料编码【"+clbm+"】录入入库数量");
			return;
		}
		else if (rksl<0)
		{
			rs.close();
			ps.close();
			out.print("错误！材料编码【"+clbm+"】入库数量不能小于零："+rksl);
			return;
		}
	}
	rs.close();
	ps.close();

	jxc.JxcClass jxc=new jxc.JxcClass();
	String jz=jxc.isJz(conn,ckbh);
	if (jz.equals("N"))//N未结转；Y：已结转
	{
		out.print("上个月没有结转，不能进行库存操作！"+jz);
		return;
	}

	conn.setAutoCommit(false);

	double rkzje=0;
	double zcpzje=0;
	double ccpzje=0;
	double wldszje=0;
	double thclzje=0;
	double bfclzje=0;
	ls_sql=" select sum(rkje),sum(rkj*zcpsl),sum(rkj*ccpsl),sum(rkj*wldssl),sum(rkj*thpsl),sum(rkj*bfpsl)";
	ls_sql+=" from jxc_rkmx ";
	ls_sql+=" where rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		rkzje=rs.getDouble(1);
		zcpzje=rs.getDouble(2);
		ccpzje=rs.getDouble(3);
		wldszje=rs.getDouble(4);
		thclzje=rs.getDouble(5);
		bfclzje=rs.getDouble(6);
	}
	rs.close();
	ps.close();
		
	//修改入库单状态，入库单金额
	ls_sql="update jxc_rkd set rkdzt='3',rkzje=?,zcpzje=?,ccpzje=?,wldszje=?,thclzje=?,bfclzje=?";//0：未提交；1：等待审核；2：等待入库；3：已入库；4：已结算；6：等待总部审核
	ls_sql+=" where  rkph='"+rkph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,rkzje);
	ps.setDouble(2,zcpzje);
	ps.setDouble(3,ccpzje);
	ps.setDouble(4,wldszje);
	ps.setDouble(5,thclzje);
	ps.setDouble(6,bfclzje);
	ps.executeUpdate();
	ps.close();

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

	int rkxh=0;
	double rkj=0;
	double zcpsl=0;
	double ccpsl=0;
	double bfpsl=0;
	double ccpzkl=0;
	String scrq=null;
	String scph=null;
	String hjbh=null;
	String nbbm=null;

	ls_sql=" select rkxh,clbm,nbbm,rkj,rksl,zcpsl,ccpsl,bfpsl,ccpzkl,scrq,scph,hjbh";
	ls_sql+=" from jxc_rkmx ";
	ls_sql+=" where rkph='"+rkph+"' ";
	ls_sql+=" order by  rkxh";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		rkxh=rs.getInt("rkxh");
		clbm=rs.getString("clbm");
		nbbm=rs.getString("nbbm");
		rkj=rs.getDouble("rkj");
		rksl=rs.getDouble("rksl");
		zcpsl=rs.getDouble("zcpsl");
		ccpsl=rs.getDouble("ccpsl");
		bfpsl=rs.getDouble("bfpsl");
		ccpzkl=rs.getDouble("ccpzkl");
		scrq=cf.fillNull(rs.getString("scrq"));
		scph=cf.fillNull(rs.getString("scph"));
		hjbh=cf.fillNull(rs.getString("hjbh"));

		if (scrq.equals(""))
		{
			conn.rollback();
			out.println("错误！材料【"+nbbm+"】生产日期不能为空");
			return;
		}

		if (scph.equals(""))
		{
			conn.rollback();
			out.println("错误！材料【"+nbbm+"】生产批号不能为空");
			return;
		}

		if (hjbh.equals(""))
		{
			conn.rollback();
			out.println("错误！材料【"+nbbm+"】入库货架不能为空");
			return;
		}

		double zcpzsl=0;
		double ccpzsl=0;
		double bfpzsl=0;
		String xsfs="";
		ls_sql="SELECT zcpzsl,ccpzsl,bfpzsl,xsfs";
		ls_sql+=" FROM jxc_cljgb";
		ls_sql+=" where dqbm='"+dqbm+"' and clbm='"+clbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zcpzsl=rs1.getDouble("zcpzsl");
			ccpzsl=rs1.getDouble("ccpzsl");
			bfpzsl=rs1.getDouble("bfpzsl");
			xsfs=rs1.getString("xsfs");
		}
		rs1.close();
		ps1.close();

		if (zcpzsl<0)//有负库存
		{
			if (!xsfs.equals("4"))//1：代销品；2：现货销售；3：期货销售；4：允许负库存
			{
				conn.rollback();
				out.println("错误！材料【"+clbm+"】销售方式不允许负库存，可实际出现了负库存["+zcpzsl+"]，请联系系统管理员，确认此材料库存数是否正确");
				return;
			}

			double zcpfkcs=0;
			ls_sql="SELECT sum(fkcs)";
			ls_sql+=" FROM jxc_ckmx";
			ls_sql+=" where sfyfkc='2' and clbm='"+clbm+"' and zljb='1'";//1：无负库存；2：有负库存
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zcpfkcs=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();
			if (zcpzsl!=-1*zcpfkcs)
			{
				conn.rollback();
				out.println("错误！材料【"+clbm+"】价格表负库存为："+zcpzsl+"，而出库明细中负库存为："+zcpfkcs);
				return;
			}
		}


		if (ccpzsl<0)//有负库存
		{
			if (!xsfs.equals("4"))//1：代销品；2：现货销售；3：期货销售；4：允许负库存
			{
				conn.rollback();
				out.println("错误！材料【"+clbm+"】销售方式不允许负库存，可实际出现了负库存["+ccpzsl+"]，请联系系统管理员，确认此材料库存数是否正确");
				return;
			}

			double ccpfkcs=0;
			ls_sql="SELECT sum(fkcs)";
			ls_sql+=" FROM jxc_ckmx";
			ls_sql+=" where sfyfkc='2' and clbm='"+clbm+"' and zljb='2'";//1：无负库存；2：有负库存
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				ccpfkcs=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();
			if (ccpzsl!=-1*ccpfkcs)
			{
				conn.rollback();
				out.println("错误！材料【"+clbm+"】价格表负库存为："+ccpzsl+"，而出库明细中负库存为："+ccpfkcs);
				return;
			}
		}

		if (bfpzsl<0 )//有负库存
		{
			if (!xsfs.equals("4"))//1：代销品；2：现货销售；3：期货销售；4：允许负库存
			{
				conn.rollback();
				out.println("错误！材料【"+clbm+"】销售方式不允许负库存，可实际出现了负库存["+bfpzsl+"]，请联系系统管理员，确认此材料库存数是否正确");
				return;
			}
			double bfpfkcs=0;
			ls_sql="SELECT sum(fkcs)";
			ls_sql+=" FROM jxc_ckmx";
			ls_sql+=" where sfyfkc='2' and clbm='"+clbm+"' and zljb='3'";//1：无负库存；2：有负库存
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				bfpfkcs=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();


			if (bfpzsl!=-1*bfpfkcs)
			{
				conn.rollback();
				out.println("错误！材料【"+clbm+"】价格表负库存为："+bfpzsl+"，而出库明细中负库存为："+bfpfkcs);
				return;
			}

		}

		String lsh="";
		String zljb="";//1：正常品；2：残次品；3：报废品
		double rkje=0;

		//正常品入库＋＋＋＋＋＋＋＋＋＋＋＋开始
		if (zcpsl!=0)
		{
			zljb="1";//1：正常品；2：残次品；3：报废品
			double clzk=10;//残次品折扣率

			double zcpfkcsl=0;//正常品负库存入库数

			//处理负库存＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			if (zcpzsl<0)//有负库存
			{
				//查询负库存出库记录
				String ckph=null;
				int ckxh=0;
				double fkcs=0;
				double ckdj=0;
				ls_sql="SELECT ckph,ckxh,ckdj,fkcs";
				ls_sql+=" FROM jxc_ckmx";
				ls_sql+=" where sfyfkc='2' and clbm='"+clbm+"' and zljb='"+zljb+"'";//1：无负库存；2：有负库存
				ls_sql+=" order by ckph,ckxh";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				while (rs1.next())
				{
					ckph=rs1.getString("ckph");
					ckxh=rs1.getInt("ckxh");
					fkcs=rs1.getDouble("fkcs");
					ckdj=rs1.getDouble("ckdj");


					double cksl=0;
					if (zcpsl>=fkcs)//可以消掉负库存
					{
						cksl=fkcs;

						//修改:是否有负库存
						ls_sql=" update jxc_ckmx set sfyfkc='1',fkcs=0";
						ls_sql+=" where clbm='"+clbm+"' and ckph='"+ckph+"'";//1：无负库存；2：有负库存
						ps2= conn.prepareStatement(ls_sql);
						ps2.executeUpdate();
						ps2.close();
					}
					else{//智能消掉部分负库存
						cksl=zcpsl;

						//修改:是否有负库存
						ls_sql=" update jxc_ckmx set fkcs="+(fkcs-zcpsl);
						ls_sql+=" where clbm='"+clbm+"' and ckph='"+ckph+"'";//1：无负库存；2：有负库存
						ps2= conn.prepareStatement(ls_sql);
						ps2.executeUpdate();
						ps2.close();
					}

					zcpfkcsl+=cksl;//正常品负库存入库数

					double ckje=cksl*ckdj;//出库金额
					String fkcckbz="2";//1：出库时录入；2：负库存入库时录入
					ls_sql =" insert into jxc_ckcpxx (ckph,ckj,cksl,ckje,fkcckbz   ,lsh,clbm         ,clmc         ,cllb         ,cldlbm         ,clxlbm         ,scsmc         ,ppmc         ,gysmc         ,cllbbm         ,xh         ,nbbm         ,gg         ,clysbm         ,djzl         ,jldwbm         ,bzgg         ,bzjldwbm         ,glfzclbm         ,glfzclmc         ,sfbhpj         ,pjts         ,cpjb         ,fgsx         ,cpsm         ,cd         ,zp         ,cgzq         ,bzq         ,bztxq         ,bz         ,zljb,clzk,rkph         ,rkxh         ,rksj,dbph,scph         ,scrq         ,hwbh         ,hjbh        ,ckbh,dqbm,rkj        ,jqpjcbj      ,lsj,xsj,dfgsjg,dgzjg) ";
					ls_sql+=" select                  ?   ,?  ,?   ,?   ,?         ,?  ,jxc_rkmx.clbm,jxc_rkmx.clmc,jxc_clbm.cllb,jxc_rkmx.cldlbm,jxc_rkmx.clxlbm,jxc_clbm.scsmc,jxc_rkmx.ppmc,jxc_rkmx.gysmc,jxc_clbm.cllbbm,jxc_rkmx.xh,jxc_rkmx.nbbm,jxc_rkmx.gg,jxc_clbm.clysbm,jxc_clbm.djzl,jxc_rkmx.jldwbm,jxc_clbm.bzgg,jxc_clbm.bzjldwbm,jxc_clbm.glfzclbm,jxc_clbm.glfzclmc,jxc_clbm.sfbhpj,jxc_clbm.pjts,jxc_clbm.cpjb,jxc_clbm.fgsx,jxc_clbm.cpsm,jxc_clbm.cd,jxc_clbm.zp,jxc_clbm.cgzq,jxc_clbm.bzq,jxc_clbm.bztxq,jxc_clbm.bz,?   ,?   ,jxc_rkmx.rkph,jxc_rkmx.rkxh,?   ,''  ,jxc_rkmx.scph,jxc_rkmx.scrq,jxc_rkmx.hwbh,jxc_rkmx.hjbh,?  ,?   ,jxc_rkmx.rkj,jxc_rkmx.rkj,0  ,0  ,0     ,0";
					ls_sql+=" from jxc_rkmx,jxc_clbm ";
					ls_sql+=" where jxc_rkmx.clbm=jxc_clbm.clbm and jxc_rkmx.rkph='"+rkph+"' and  jxc_rkmx.rkxh='"+rkxh+"'";
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,ckph);
					ps2.setDouble(2,ckdj);
					ps2.setDouble(3,cksl);
					ps2.setDouble(4,ckje);
					ps2.setString(5,fkcckbz);
					ps2.setString(6,rkph+cf.addZero(rkxh,2));

					ps2.setString(7,zljb);
					ps2.setDouble(8,clzk);
					ps2.setDate(9,rksj);
					ps2.setString(10,ckbh);
					ps2.setString(11,dqbm);
					
					ps2.executeUpdate();
					ps2.close();
					
					//修改:负库存
					ls_sql=" update jxc_cljgb set zcpzsl=zcpzsl+"+cksl;
					ls_sql+=" where dqbm='"+dqbm+"' and clbm='"+clbm+"'";
					ps2= conn.prepareStatement(ls_sql);
					ps2.executeUpdate();
					ps2.close();

					
					zcpsl=zcpsl-cksl;
					if (zcpsl==0)//结束循环
					{
						break;
					}
				}
				rs1.close();
				ps1.close();

				//修改:正常品负库存入库数
				ls_sql=" update jxc_rkmx set zcpfkcsl="+zcpfkcsl;
				ls_sql+=" where rkph='"+rkph+"' and rkxh='"+rkxh+"'";
				ps2= conn.prepareStatement(ls_sql);
				ps2.executeUpdate();
				ps2.close();
			}
			//处理负库存＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			if (zcpsl>0)//还有剩余，插入库存表中
			{
				maxlsh++;

				//更新库存
				lsh=maxlsh+"";
				lsh=cf.addZero(lsh,13);

				rkje=zcpsl*rkj;

				//正常品:写入库存表
				ls_sql=" insert into jxc_kcb(lsh,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,gysmc,cllbbm,xh,nbbm,gg,clysbm,djzl,jldwbm,bzgg,bzjldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz ";
				ls_sql+=" ,clbm,zljb,clzk,rkph,rkxh,rksj,scph,scrq,hwbh,hjbh,ckbh,dqbm,rkj,kcsl,kcje,jqpjcbj  ,lsj,xsj,dfgsjg,dgzjg,ztbz) ";
				ls_sql+=" select '"+lsh+"',jxc_rkmx.clmc,cllb,jxc_rkmx.cldlbm,jxc_rkmx.clxlbm,scsmc,jxc_rkmx.ppmc,'"+gysmc+"',cllbbm,jxc_rkmx.xh,jxc_rkmx.nbbm,jxc_rkmx.gg,clysbm,djzl,jxc_rkmx.jldwbm,bzgg,bzjldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz ";
				ls_sql+=" ,jxc_rkmx.clbm,?,?,rkph,rkxh,?,jxc_rkmx.scph,jxc_rkmx.scrq,jxc_rkmx.hwbh,jxc_rkmx.hjbh,?,?,jxc_rkmx.rkj,?,?,0  ,0,0,0,0,'N'";
				ls_sql+=" from jxc_rkmx,jxc_clbm ";
				ls_sql+=" where jxc_rkmx.clbm=jxc_clbm.clbm ";
				ls_sql+=" and jxc_rkmx.rkph='"+rkph+"' and jxc_rkmx.rkxh='"+rkxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.setString(1,zljb);
				ps1.setDouble(2,clzk);
				ps1.setDate(3,rksj);
				ps1.setString(4,ckbh);
				ps1.setString(5,dqbm);
				ps1.setDouble(6,zcpsl);
				ps1.setDouble(7,rkje);
				ps1.executeUpdate();
				ps1.close();

				//修改:库存数
				ls_sql=" update jxc_cljgb set zcpzsl=zcpzsl+"+zcpsl;
				ls_sql+=" where dqbm='"+dqbm+"' and clbm='"+clbm+"'";
				ps2= conn.prepareStatement(ls_sql);
				ps2.executeUpdate();
				ps2.close();
			}
		}
		//正常品入库＝＝＝＝＝＝＝＝＝＝＝＝结束


		//残次品入库＋＋＋＋＋＋＋＋＋＋＋＋开始
		if (ccpsl!=0)
		{
			zljb="2";//1：正常品；2：残次品；3：报废品
			double clzk=ccpzkl;//残次品折扣率

			double ccpfkcsl=0;//残次品负库存入库数

			//处理负库存＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			if (ccpzsl<0)//有负库存
			{
				//查询负库存出库记录
				String ckph=null;
				int ckxh=0;
				double fkcs=0;
				double ckdj=0;
				ls_sql="SELECT ckph,ckxh,ckdj,fkcs";
				ls_sql+=" FROM jxc_ckmx";
				ls_sql+=" where sfyfkc='2' and clbm='"+clbm+"' and zljb='"+zljb+"'";//1：无负库存；2：有负库存
				ls_sql+=" order by ckph,ckxh";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				while (rs1.next())
				{
					ckph=rs1.getString("ckph");
					ckxh=rs1.getInt("ckxh");
					fkcs=rs1.getDouble("fkcs");
					ckdj=rs1.getDouble("ckdj");

					double cksl=0;
					if (ccpsl>=fkcs)//可以消掉负库存
					{
						cksl=fkcs;

						//修改:是否有负库存
						ls_sql=" update jxc_ckmx set sfyfkc='1',fkcs=0";
						ls_sql+=" where clbm='"+clbm+"' and ckph='"+ckph+"'";//1：无负库存；2：有负库存
						ps2= conn.prepareStatement(ls_sql);
						ps2.executeUpdate();
						ps2.close();
					}
					else{//智能消掉部分负库存
						cksl=ccpsl;

						//修改:是否有负库存
						ls_sql=" update jxc_ckmx set fkcs="+(fkcs-ccpsl);
						ls_sql+=" where clbm='"+clbm+"' and ckph='"+ckph+"'";//1：无负库存；2：有负库存
						ps2= conn.prepareStatement(ls_sql);
						ps2.executeUpdate();
						ps2.close();
					}

					ccpfkcsl+=cksl;//残次品负库存入库数

					double ckje=cksl*ckdj;//出库金额
					String fkcckbz="2";//1：出库时录入；2：负库存入库时录入
					ls_sql =" insert into jxc_ckcpxx (ckph,ckj,cksl,ckje,fkcckbz   ,lsh,clbm         ,clmc         ,cllb         ,cldlbm         ,clxlbm         ,scsmc         ,ppmc         ,gysmc         ,cllbbm         ,xh         ,nbbm         ,gg         ,clysbm         ,djzl         ,jldwbm         ,bzgg         ,bzjldwbm         ,glfzclbm         ,glfzclmc         ,sfbhpj         ,pjts         ,cpjb         ,fgsx         ,cpsm         ,cd         ,zp         ,cgzq         ,bzq         ,bztxq         ,bz         ,zljb,clzk,rkph         ,rkxh         ,rksj,dbph,scph         ,scrq         ,hwbh         ,hjbh        ,ckbh,dqbm,rkj        ,jqpjcbj      ,lsj,xsj,dfgsjg,dgzjg) ";
					ls_sql+=" select                  ?   ,?  ,?   ,?   ,?         ,?  ,jxc_rkmx.clbm,jxc_rkmx.clmc,jxc_clbm.cllb,jxc_rkmx.cldlbm,jxc_rkmx.clxlbm,jxc_clbm.scsmc,jxc_rkmx.ppmc,jxc_rkmx.gysmc,jxc_clbm.cllbbm,jxc_rkmx.xh,jxc_rkmx.nbbm,jxc_rkmx.gg,jxc_clbm.clysbm,jxc_clbm.djzl,jxc_rkmx.jldwbm,jxc_clbm.bzgg,jxc_clbm.bzjldwbm,jxc_clbm.glfzclbm,jxc_clbm.glfzclmc,jxc_clbm.sfbhpj,jxc_clbm.pjts,jxc_clbm.cpjb,jxc_clbm.fgsx,jxc_clbm.cpsm,jxc_clbm.cd,jxc_clbm.zp,jxc_clbm.cgzq,jxc_clbm.bzq,jxc_clbm.bztxq,jxc_clbm.bz,?   ,?   ,jxc_rkmx.rkph,jxc_rkmx.rkxh,?   ,''  ,jxc_rkmx.scph,jxc_rkmx.scrq,jxc_rkmx.hwbh,jxc_rkmx.hjbh,?  ,?   ,jxc_rkmx.rkj,jxc_rkmx.rkj,0  ,0  ,0     ,0";
					ls_sql+=" from jxc_rkmx,jxc_clbm ";
					ls_sql+=" where jxc_rkmx.clbm=jxc_clbm.clbm and jxc_rkmx.rkph='"+rkph+"' and  jxc_rkmx.rkxh='"+rkxh+"'";
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,ckph);
					ps2.setDouble(2,ckdj);
					ps2.setDouble(3,cksl);
					ps2.setDouble(4,ckje);
					ps2.setString(5,fkcckbz);
					ps2.setString(6,rkph+cf.addZero(rkxh,2));

					ps2.setString(7,zljb);
					ps2.setDouble(8,clzk);
					ps2.setDate(9,rksj);
					ps2.setString(10,ckbh);
					ps2.setString(11,dqbm);
					
					ps2.executeUpdate();
					ps2.close();
					
					//修改:负库存
					ls_sql=" update jxc_cljgb set ccpzsl=ccpzsl+"+cksl;
					ls_sql+=" where dqbm='"+dqbm+"' and clbm='"+clbm+"'";
					ps2= conn.prepareStatement(ls_sql);
					ps2.executeUpdate();
					ps2.close();

					
					ccpsl=ccpsl-cksl;
					if (ccpsl==0)//结束循环
					{
						break;
					}
				}
				rs1.close();
				ps1.close();


				//修改:残次品负库存入库数
				ls_sql=" update jxc_rkmx set ccpfkcsl="+ccpfkcsl;
				ls_sql+=" where rkph='"+rkph+"' and rkxh='"+rkxh+"'";
				ps2= conn.prepareStatement(ls_sql);
				ps2.executeUpdate();
				ps2.close();
			}
			//处理负库存＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			if (ccpsl>0)//还有剩余，插入库存表中
			{
				maxlsh++;

				//更新库存
				lsh=maxlsh+"";
				lsh=cf.addZero(lsh,13);

				rkje=ccpsl*rkj;

				//正常品:写入库存表
				ls_sql=" insert into jxc_kcb(lsh,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,gysmc,cllbbm,xh,nbbm,gg,clysbm,djzl,jldwbm,bzgg,bzjldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz ";
				ls_sql+=" ,clbm,zljb,clzk,rkph,rkxh,rksj,scph,scrq,hwbh,hjbh,ckbh,dqbm,rkj,kcsl,kcje,jqpjcbj  ,lsj,xsj,dfgsjg,dgzjg,ztbz) ";
				ls_sql+=" select '"+lsh+"',jxc_rkmx.clmc,cllb,jxc_rkmx.cldlbm,jxc_rkmx.clxlbm,scsmc,jxc_rkmx.ppmc,'"+gysmc+"',cllbbm,jxc_rkmx.xh,jxc_rkmx.nbbm,jxc_rkmx.gg,clysbm,djzl,jxc_rkmx.jldwbm,bzgg,bzjldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz ";
				ls_sql+=" ,jxc_rkmx.clbm,?,?,rkph,rkxh,?,jxc_rkmx.scph,jxc_rkmx.scrq,jxc_rkmx.hwbh,jxc_rkmx.hjbh,?,?,jxc_rkmx.rkj,?,?,0  ,0,0,0,0,'N'";
				ls_sql+=" from jxc_rkmx,jxc_clbm ";
				ls_sql+=" where jxc_rkmx.clbm=jxc_clbm.clbm ";
				ls_sql+=" and jxc_rkmx.rkph='"+rkph+"' and jxc_rkmx.rkxh='"+rkxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.setString(1,zljb);
				ps1.setDouble(2,clzk);
				ps1.setDate(3,rksj);
				ps1.setString(4,ckbh);
				ps1.setString(5,dqbm);
				ps1.setDouble(6,ccpsl);
				ps1.setDouble(7,rkje);
				ps1.executeUpdate();
				ps1.close();

				//修改:库存数
				ls_sql=" update jxc_cljgb set ccpzsl=ccpzsl+"+ccpsl;
				ls_sql+=" where dqbm='"+dqbm+"' and clbm='"+clbm+"'";
				ps2= conn.prepareStatement(ls_sql);
				ps2.executeUpdate();
				ps2.close();
			}
		}
		//残次品入库＝＝＝＝＝＝＝＝＝＝＝＝结束

		//报废品入库＋＋＋＋＋＋＋＋＋＋＋＋开始
		if (bfpsl!=0)
		{
			zljb="3";//1：正常品；2：残次品；3：报废品
			double clzk=ccpzkl;//残次品折扣率

			double bfpfkcsl=0;//报废品负库存入库数

			//处理负库存＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			if (bfpzsl<0)//有负库存
			{
				//查询负库存出库记录
				String ckph=null;
				int ckxh=0;
				double fkcs=0;
				double ckdj=0;
				ls_sql="SELECT ckph,ckxh,ckdj,fkcs";
				ls_sql+=" FROM jxc_ckmx";
				ls_sql+=" where sfyfkc='2' and clbm='"+clbm+"' and zljb='"+zljb+"'";//1：无负库存；2：有负库存
				ls_sql+=" order by ckph,ckxh";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				while (rs1.next())
				{
					ckph=rs1.getString("ckph");
					ckxh=rs1.getInt("ckxh");
					fkcs=rs1.getDouble("fkcs");
					ckdj=rs1.getDouble("ckdj");

					double cksl=0;
					if (bfpsl>=fkcs)//可以消掉负库存
					{
						cksl=fkcs;

						//修改:是否有负库存
						ls_sql=" update jxc_ckmx set sfyfkc='1',fkcs=0";
						ls_sql+=" where clbm='"+clbm+"' and ckph='"+ckph+"'";//1：无负库存；2：有负库存
						ps2= conn.prepareStatement(ls_sql);
						ps2.executeUpdate();
						ps2.close();
					}
					else{//智能消掉部分负库存
						cksl=bfpsl;

						//修改:是否有负库存
						ls_sql=" update jxc_ckmx set fkcs="+(fkcs-bfpsl);
						ls_sql+=" where clbm='"+clbm+"' and ckph='"+ckph+"'";//1：无负库存；2：有负库存
						ps2= conn.prepareStatement(ls_sql);
						ps2.executeUpdate();
						ps2.close();
					}

					bfpfkcsl+=cksl;//报废品负库存入库数

					double ckje=cksl*ckdj;//出库金额
					String fkcckbz="2";//1：出库时录入；2：负库存入库时录入
					ls_sql =" insert into jxc_ckcpxx (ckph,ckj,cksl,ckje,fkcckbz   ,lsh,clbm         ,clmc         ,cllb         ,cldlbm         ,clxlbm         ,scsmc         ,ppmc         ,gysmc         ,cllbbm         ,xh         ,nbbm         ,gg         ,clysbm         ,djzl         ,jldwbm         ,bzgg         ,bzjldwbm         ,glfzclbm         ,glfzclmc         ,sfbhpj         ,pjts         ,cpjb         ,fgsx         ,cpsm         ,cd         ,zp         ,cgzq         ,bzq         ,bztxq         ,bz         ,zljb,clzk,rkph         ,rkxh         ,rksj,dbph,scph         ,scrq         ,hwbh         ,hjbh        ,ckbh,dqbm,rkj        ,jqpjcbj      ,lsj,xsj,dfgsjg,dgzjg) ";
					ls_sql+=" select                  ?   ,?  ,?   ,?   ,?         ,?  ,jxc_rkmx.clbm,jxc_rkmx.clmc,jxc_clbm.cllb,jxc_rkmx.cldlbm,jxc_rkmx.clxlbm,jxc_clbm.scsmc,jxc_rkmx.ppmc,jxc_rkmx.gysmc,jxc_clbm.cllbbm,jxc_rkmx.xh,jxc_rkmx.nbbm,jxc_rkmx.gg,jxc_clbm.clysbm,jxc_clbm.djzl,jxc_rkmx.jldwbm,jxc_clbm.bzgg,jxc_clbm.bzjldwbm,jxc_clbm.glfzclbm,jxc_clbm.glfzclmc,jxc_clbm.sfbhpj,jxc_clbm.pjts,jxc_clbm.cpjb,jxc_clbm.fgsx,jxc_clbm.cpsm,jxc_clbm.cd,jxc_clbm.zp,jxc_clbm.cgzq,jxc_clbm.bzq,jxc_clbm.bztxq,jxc_clbm.bz,?   ,?   ,jxc_rkmx.rkph,jxc_rkmx.rkxh,?   ,''  ,jxc_rkmx.scph,jxc_rkmx.scrq,jxc_rkmx.hwbh,jxc_rkmx.hjbh,?  ,?   ,jxc_rkmx.rkj,jxc_rkmx.rkj,0  ,0  ,0     ,0";
					ls_sql+=" from jxc_rkmx,jxc_clbm ";
					ls_sql+=" where jxc_rkmx.clbm=jxc_clbm.clbm and jxc_rkmx.rkph='"+rkph+"' and  jxc_rkmx.rkxh='"+rkxh+"'";
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,ckph);
					ps2.setDouble(2,ckdj);
					ps2.setDouble(3,cksl);
					ps2.setDouble(4,ckje);
					ps2.setString(5,fkcckbz);
					ps2.setString(6,rkph+cf.addZero(rkxh,2));

					ps2.setString(7,zljb);
					ps2.setDouble(8,clzk);
					ps2.setDate(9,rksj);
					ps2.setString(10,ckbh);
					ps2.setString(11,dqbm);
					
					ps2.executeUpdate();
					ps2.close();
					
					//修改:负库存
					ls_sql=" update jxc_cljgb set bfpzsl=bfpzsl+"+cksl;
					ls_sql+=" where dqbm='"+dqbm+"' and clbm='"+clbm+"'";
					ps2= conn.prepareStatement(ls_sql);
					ps2.executeUpdate();
					ps2.close();

					
					bfpsl=bfpsl-cksl;
					if (bfpsl==0)//结束循环
					{
						break;
					}
				}
				rs1.close();
				ps1.close();

				//修改:报废品负库存入库数
				ls_sql=" update jxc_rkmx set bfpfkcsl="+bfpfkcsl;
				ls_sql+=" where rkph='"+rkph+"' and rkxh='"+rkxh+"'";
				ps2= conn.prepareStatement(ls_sql);
				ps2.executeUpdate();
				ps2.close();
			}
			//处理负库存＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			if (bfpsl>0)//还有剩余，插入库存表中
			{
				maxlsh++;

				//更新库存
				lsh=maxlsh+"";
				lsh=cf.addZero(lsh,13);

				rkje=bfpsl*rkj;

				//正常品:写入库存表
				ls_sql=" insert into jxc_kcb(lsh,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,gysmc,cllbbm,xh,nbbm,gg,clysbm,djzl,jldwbm,bzgg,bzjldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz ";
				ls_sql+=" ,clbm,zljb,clzk,rkph,rkxh,rksj,scph,scrq,hwbh,hjbh,ckbh,dqbm,rkj,kcsl,kcje,jqpjcbj  ,lsj,xsj,dfgsjg,dgzjg,ztbz) ";
				ls_sql+=" select '"+lsh+"',jxc_rkmx.clmc,cllb,jxc_rkmx.cldlbm,jxc_rkmx.clxlbm,scsmc,jxc_rkmx.ppmc,'"+gysmc+"',cllbbm,jxc_rkmx.xh,jxc_rkmx.nbbm,jxc_rkmx.gg,clysbm,djzl,jxc_rkmx.jldwbm,bzgg,bzjldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz ";
				ls_sql+=" ,jxc_rkmx.clbm,?,?,rkph,rkxh,?,jxc_rkmx.scph,jxc_rkmx.scrq,jxc_rkmx.hwbh,jxc_rkmx.hjbh,?,?,jxc_rkmx.rkj,?,?,0  ,0,0,0,0,'N'";
				ls_sql+=" from jxc_rkmx,jxc_clbm ";
				ls_sql+=" where jxc_rkmx.clbm=jxc_clbm.clbm ";
				ls_sql+=" and jxc_rkmx.rkph='"+rkph+"' and jxc_rkmx.rkxh='"+rkxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.setString(1,zljb);
				ps1.setDouble(2,clzk);
				ps1.setDate(3,rksj);
				ps1.setString(4,ckbh);
				ps1.setString(5,dqbm);
				ps1.setDouble(6,bfpsl);
				ps1.setDouble(7,rkje);
				ps1.executeUpdate();
				ps1.close();

				//修改:库存数
				ls_sql=" update jxc_cljgb set bfpzsl=bfpzsl+"+bfpsl;
				ls_sql+=" where dqbm='"+dqbm+"' and clbm='"+clbm+"'";
				ps2= conn.prepareStatement(ls_sql);
				ps2.executeUpdate();
				ps2.close();
			}
		}
		//报废品入库＝＝＝＝＝＝＝＝＝＝＝＝结束

		//加权平均成本价
		jxc.JsJqpjcbj(conn,dqbm,clbm);

	}
	rs.close();
	ps.close();


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("提交成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>