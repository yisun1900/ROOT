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
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	//检查出库单状态
	String dqbm=null;
	String mddqbm=null;
	String ckdzt="";
	String ckbh="";
	String lydh="";
	String ckfs="";//1：自动出库（先生产先出库）；2：自动出库（先入库先出库）；3：手工出库
	String ckjxz="";//出库单价选择,1：取价格表（jxc_cljgb.dfgsjg）；2：取入库时定价（jxc_kcb.dfgsjg）；3：取来源单价格(jxc_dbmx.shjg)
	String cklx="";//D：订单出库；B：报废出库；T：退货出库； S：申购出库；P：材料单出库；J：辅材代金券出库；X：销售出库；R:调拨出库
	ls_sql=" select ckdzt,dqbm,mddqbm,lydh,ckfs,ckjxz,cklx,ckbh ";
	ls_sql+=" from jxc_ckd ";
	ls_sql+=" where ckph='"+ckph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ckdzt=rs.getString("ckdzt");
		dqbm=rs.getString("dqbm");
		mddqbm=rs.getString("mddqbm");
		lydh=cf.fillNull(rs.getString("lydh"));
		ckfs=cf.fillNull(rs.getString("ckfs"));
		ckjxz=cf.fillNull(rs.getString("ckjxz"));
		cklx=cf.fillNull(rs.getString("cklx"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
	}
	rs.close();
	ps.close();

	if (!ckdzt.equals("0"))//0:未提交； 1：等待报废审核；2：等待退货审核；3：等待调拨入库；4：已结算；5：退货审核通过6：报废审核未通过；7：退货审核未通过；8:审核通过；9：提交
	{
		out.print("错误！出库单已提交");
		return;
	}


	jxc.JxcClass jxc=new jxc.JxcClass();
	String jz=jxc.isJz(conn,ckbh);
	if (jz.equals("N"))//N未结转；Y：已结转
	{
		out.print("上个月没有结转，不能进行库存操作！"+jz);
		return;
	}

	String sfyfkc="1";//是否有负库存,1：无负库存；2：负库存未入库；3：负库存入库

	conn.setAutoCommit(false);

	//检查出库数量是否符合
	String clbm=null;
	String zljb=null;
	String hwbh=null;
	double ckdj=0;
	double cksl=0;
	
	int lrsl=0;//数否录入明细

	ls_sql=" select clbm,zljb,ckbh,hwbh,ckdj,sum(cksl) cksl ";
	ls_sql+=" from jxc_ckmx ";
	ls_sql+=" where ckph='"+ckph+"' ";
	ls_sql+=" group by clbm,zljb,ckbh,hwbh,ckdj ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		clbm=rs.getString("clbm");
		zljb=rs.getString("zljb");
		ckbh=cf.fillNull(rs.getString("ckbh"));
		hwbh=cf.fillNull(rs.getString("hwbh"));
		ckdj=rs.getDouble("ckdj");
		cksl=rs.getDouble("cksl");

		if (cksl<=0)
		{
			conn.rollback();
			out.print("材料：【"+clbm+"】出库数量必须大于0，不能提交！！！");
			return;
		}

		lrsl++;

		//查询销售方式
		String xsfs="";
		ls_sql=" select xsfs ";
		ls_sql+=" from jxc_cljgb ";
		ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if (rs1.next())
		{
			xsfs=rs1.getString("xsfs");
		}
		rs1.close();
		ps1.close();

		//代销品不需出库
		if (xsfs.equals("1"))//1：代销品；2：现货销售；3：期货销售；4：允许负库存
		{
			continue;
		}
		
		//更新：材料价格表.库存数量＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		double kcsl=0;
		if (xsfs.equals("2") || xsfs.equals("3") || xsfs.equals("4"))//1：代销品；2：现货销售；3：期货销售；4：允许负库存
		{
			if (zljb.equals("1"))//正常品
			{
				kcsl=0;
				ls_sql=" select zcpzsl";
				ls_sql+=" from jxc_cljgb ";
				ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"' ";
				ps1= conn.prepareStatement(ls_sql);
				rs1=ps1.executeQuery();
				if (rs1.next())
				{
					kcsl=rs1.getDouble(1);
				}
				rs1.close();
				ps1.close();

				if (cksl>kcsl)
				{
					if (xsfs.equals("4"))//4：允许负库存
					{
						sfyfkc="2";//是否有负库存,2：负库存未入库

						//修改:是否有负库存
						ls_sql=" update jxc_ckmx set sfyfkc='2',fkcs="+(cksl-kcsl);
						ls_sql+=" where clbm='"+clbm+"' and ckph='"+ckph+"'";
						ps1= conn.prepareStatement(ls_sql);
						ps1.executeUpdate();
						ps1.close();
					}
					else{
						conn.rollback();
						out.print("<BR>材料【"+clbm+"】出错！[出库数："+cksl+"]超出[库存数:"+kcsl+"]");
						return;
					}
				}

				//修改材料价格表：正常品总数量
				ls_sql=" update jxc_cljgb set zcpzsl=zcpzsl-"+cksl+",dhsl=dhsl-"+cksl;
				ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"' ";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();

				//修改:库存数
				ls_sql=" update jxc_cljgb set zcpzsl=zcpzsl+"+cksl;
				ls_sql+=" where dqbm='"+mddqbm+"' and clbm='"+clbm+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();

			}
			else if (zljb.equals("2"))//残次品
			{
				kcsl=0;
				ls_sql=" select ccpzsl";
				ls_sql+=" from jxc_cljgb ";
				ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"' ";
				ps1= conn.prepareStatement(ls_sql);
				rs1=ps1.executeQuery();
				if (rs1.next())
				{
					kcsl=rs1.getDouble(1);
				}
				rs1.close();
				ps1.close();

				if (cksl>kcsl)
				{
					if (xsfs.equals("4"))//4：允许负库存
					{
						sfyfkc="2";//是否有负库存,2：负库存未入库

						//修改:是否有负库存
						ls_sql=" update jxc_ckmx set sfyfkc='2',fkcs="+(cksl-kcsl);
						ls_sql+=" where clbm='"+clbm+"' and ckph='"+ckph+"'";
						ps1= conn.prepareStatement(ls_sql);
						ps1.executeUpdate();
						ps1.close();
					}
					else{
						conn.rollback();
						out.print("<BR>材料【"+clbm+"】出错！[出库数："+cksl+"]超出[库存数:"+kcsl+"]");
						return;
					}
				}

				//修改材料价格表：残次品总数量
				ls_sql=" update jxc_cljgb set ccpzsl=ccpzsl-"+cksl+",dhsl=dhsl-"+cksl;
				ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();

				//修改:库存数
				ls_sql=" update jxc_cljgb set ccpzsl=ccpzsl+"+cksl;
				ls_sql+=" where dqbm='"+mddqbm+"' and clbm='"+clbm+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
			else if (zljb.equals("3"))//报废品
			{
				kcsl=0;
				ls_sql=" select bfpzsl";
				ls_sql+=" from jxc_cljgb ";
				ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1=ps1.executeQuery();
				if (rs1.next())
				{
					kcsl=rs1.getDouble(1);
				}
				rs1.close();
				ps1.close();

				if (cksl>kcsl)
				{
					if (xsfs.equals("4"))//4：允许负库存
					{
						sfyfkc="2";//是否有负库存,2：负库存未入库

						//修改:是否有负库存
						ls_sql=" update jxc_ckmx set sfyfkc='2',fkcs="+(cksl-kcsl);
						ls_sql+=" where clbm='"+clbm+"' and ckph='"+ckph+"'";
						ps1= conn.prepareStatement(ls_sql);
						ps1.executeUpdate();
						ps1.close();
					}
					else{
						conn.rollback();
						out.print("<BR>材料【"+clbm+"】出错！[出库数："+cksl+"]超出[库存数:"+kcsl+"]");
						return;
					}
				}

				//修改材料价格表：报废品总数量
				ls_sql=" update jxc_cljgb set bfpzsl=bfpzsl-"+cksl+",dhsl=dhsl-"+cksl;
				ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();

				//修改:库存数
				ls_sql=" update jxc_cljgb set bfpzsl=bfpzsl+"+cksl;
				ls_sql+=" where dqbm='"+mddqbm+"' and clbm='"+clbm+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
		}
		else{
			conn.rollback();
			out.print("<BR>材料【"+clbm+"】出错！销售方式不正确："+xsfs);
			return;
		}
		//更新：材料价格表.库存数量＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

		
		//更新：库存表＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		String lsh=null;
		double dgzjg=0;
		double sycksl=0;//剩余出库数
		if(!hwbh.equals(""))
		{
			sycksl=cksl;//剩余出库数

			ls_sql = " select lsh,kcsl,dgzjg";
			ls_sql+= " from jxc_kcb";
			ls_sql +=" where jxc_kcb.clbm='"+clbm+"' and zljb='"+zljb+"' and jxc_kcb.ckbh='"+ckbh+"' and jxc_kcb.hwbh='"+hwbh+"'";
			if (ckfs.equals("1"))//1：自动出库（先生产先出库）
			{
				ls_sql +=" order by scrq,rksj ";
			}
			else if (ckfs.equals("2"))//2：自动出库（先入库先出库）
			{
				ls_sql +=" order by rksj,scrq ";
			}
			ps1= conn.prepareStatement(ls_sql);
			rs1=ps1.executeQuery();
			while(rs1.next())
			{
				lsh=cf.fillNull(rs1.getString("lsh"));
				kcsl=rs1.getDouble("kcsl");
				dgzjg=rs1.getDouble("dgzjg");

				if (ckjxz.equals("2"))//1：取价格表工队价；2：取入库时确定的工队价；3：取开单价格；4：人工录入，修改出库价
				{
					ckdj=dgzjg;
				}

				if (sycksl<=0)//已提交，退出
				{
					break;
				}

				double bccksl=0;//计算：本次出库数
				if (kcsl>=sycksl)//库存数>=剩余出库数
				{
					bccksl=sycksl;//本次出库数＝剩余出库数
				}
				else{
					bccksl=kcsl;//本次出库数＝库存数
				}

				sycksl=sycksl-bccksl;//计算：剩余出库数＝剩余出库数－本次出库数

				//更新库存数据
				//将库存表信息写入:出库产品信息
				String fkcckbz="1";//1：出库时录入；2：负库存入库时录入
				double bcckje=bccksl*ckdj;//本次出库金额
				if (kcsl==bccksl)
				{
					ls_sql =" insert into jxc_cklsb (ckph,lsh,clbm,rkph,rkxh,rksj,yckph,hwbh,hjbh,ckbh,dqbm,rkj,jqpjcbj,lsj,xsj,dfgsjg,dgzjg,kcsl,kcje,ckdj,ckje)";
					ls_sql+=" select                    ?,lsh,clbm,rkph,rkxh,rksj,ckph ,hwbh,hjbh,ckbh,dqbm,rkj,jqpjcbj,lsj,xsj,dfgsjg,dgzjg,kcsl,kcje,?,?";
					ls_sql+=" from jxc_kcb ";
					ls_sql+=" where lsh='"+lsh+"'";
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,ckph);
					ps2.setDouble(2,ckdj);
					ps2.setDouble(3,bcckje);
					ps2.executeUpdate();
					ps2.close();

					ls_sql=" update jxc_kcb set ztbz='Y',ckph=?,dqbm=?,rkj=?,kcje=?,rkph=null,rkxh=null,rksj=null,hwbh=null,hjbh=null,ckbh=null";
					ls_sql+=" where  lsh='"+lsh+"' ";
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,ckph);
					ps2.setString(2,mddqbm);
					ps2.setDouble(3,ckdj);
					ps2.setDouble(4,bcckje);
					ps2.executeUpdate();
					ps2.close();
				}
				else{
					//正常品:写入库存表
					//产生主键流水号
					int maxlsh=0;
					ls_sql=" select NVL(max(TO_NUMBER(lsh)),0) lsh";
					ls_sql+=" from jxc_kcb ";
					ps2= conn.prepareStatement(ls_sql);
					rs2=ps2.executeQuery();
					if (rs2.next())//库存有货 直接更新数量
					{
						maxlsh=rs2.getInt("lsh");
					}
					rs2.close();
					ps2.close();

					maxlsh++;

					ls_sql=" insert into jxc_kcb(lsh,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,gysmc,cllbbm,xh,nbbm,gg,clysbm,djzl,jldwbm,bzgg,bzjldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz ";
					ls_sql+=" ,clbm,zljb,clzk,rkph,rkxh,rksj,ckph,scph,scrq,hwbh,hjbh,ckbh,dqbm,rkj,kcsl,kcje,jqpjcbj  ,lsj,xsj,dfgsjg,dgzjg,ztbz) ";
					ls_sql+=" select               ?,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,gysmc,cllbbm,xh,nbbm,gg,clysbm,djzl,jldwbm,bzgg,bzjldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz ";
					ls_sql+=" ,clbm,zljb,clzk,?   ,?   ,?   ,?   ,scph,scrq,?   ,?   ,?   ,?   ,?  ,?   ,?   ,jqpjcbj  ,lsj,xsj,dfgsjg,dgzjg,? ";
					ls_sql+=" from jxc_kcb ";
					ls_sql+=" where lsh='"+lsh+"'";
					ps2= conn.prepareStatement(ls_sql);
					ps2.setInt(1,maxlsh);
					ps2.setString(2,null);
					ps2.setString(3,null);
					ps2.setDate(4,null);
					ps2.setString(5,ckph);
					ps2.setString(6,null);
					ps2.setString(7,null);
					ps2.setString(8,null);
					ps2.setString(9,mddqbm);
					ps2.setDouble(10,ckdj);
					ps2.setDouble(11,bccksl);
					ps2.setDouble(12,bcckje);
					ps2.setString(13,"Y");
					ps2.executeUpdate();
					ps2.close();

					ls_sql =" insert into jxc_cklsb (ckph,lsh,clbm,rkph,rkxh,rksj,yckph,hwbh,hjbh,ckbh,dqbm,rkj,jqpjcbj,lsj,xsj,dfgsjg,dgzjg,kcsl,kcje,ckdj,ckje)";
					ls_sql+=" select                    ?,?,clbm,rkph,rkxh,rksj,ckph ,hwbh,hjbh,ckbh,dqbm,rkj,jqpjcbj,lsj,xsj,dfgsjg,dgzjg,?,?*rkj,?,?";
					ls_sql+=" from jxc_kcb ";
					ls_sql+=" where lsh='"+lsh+"'";
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,ckph);
					ps2.setInt(2,maxlsh);
					ps2.setDouble(3,bccksl);
					ps2.setDouble(4,bccksl);
					ps2.setDouble(5,ckdj);
					ps2.setDouble(6,bcckje);
					ps2.executeUpdate();
					ps2.close();


					ls_sql=" update jxc_kcb set kcsl=kcsl-"+bccksl+",kcje=(kcsl-"+bccksl+")*rkj ";
					ls_sql+=" where  lsh='"+lsh+"' ";
					ps2= conn.prepareStatement(ls_sql);
					ps2.executeUpdate();
					ps2.close();
				}
			}
			rs1.close();
			ps1.close();

		}
		else//没有录入货位编码 按照货架出库
		{
			sycksl=cksl;//剩余出库数

			ls_sql = " select lsh,kcsl,dgzjg";
			ls_sql+= " from jxc_kcb";
			ls_sql +=" where jxc_kcb.clbm='"+clbm+"' and zljb='"+zljb+"' and jxc_kcb.ckbh='"+ckbh+"'";
			if (ckfs.equals("1"))//1：自动出库（先生产先出库）
			{
				ls_sql +=" order by scrq,rksj ";
			}
			else if (ckfs.equals("2"))//2：自动出库（先入库先出库）
			{
				ls_sql +=" order by rksj,scrq ";
			}
			ps1= conn.prepareStatement(ls_sql);
			rs1=ps1.executeQuery();
			while(rs1.next())
			{
				lsh=cf.fillNull(rs1.getString("lsh"));
				kcsl=rs1.getDouble("kcsl");
				dgzjg=rs1.getDouble("dgzjg");

				if (ckjxz.equals("2"))//1：取价格表；2：取入库时定价；3：取来源单价格；4：人工录入
				{
					ckdj=dgzjg;
				}
				
				double bccksl=0;//本次出库数
				if (sycksl<=0)
				{
					break;
				}
				else if (sycksl<=kcsl)//库存数>=需出库数
				{
					bccksl=sycksl;
				}
				else{
					bccksl=kcsl;
				}

				sycksl=sycksl-bccksl;

				//更新库存数据
				//将库存表信息写入:出库产品信息
				String fkcckbz="1";//1：出库时录入；2：负库存入库时录入
				double bcckje=bccksl*ckdj;//本次出库金额

//				out.println(kcsl);
//				out.println(bccksl);
				if (kcsl==bccksl)
				{
					ls_sql =" insert into jxc_cklsb (ckph,lsh,clbm,rkph,rkxh,rksj,yckph,hwbh,hjbh,ckbh,dqbm,rkj,jqpjcbj,lsj,xsj,dfgsjg,dgzjg,kcsl,kcje,ckdj,ckje)";
					ls_sql+=" select                    ?,lsh,clbm,rkph,rkxh,rksj,ckph ,hwbh,hjbh,ckbh,dqbm,rkj,jqpjcbj,lsj,xsj,dfgsjg,dgzjg,kcsl,kcje,?,?";
					ls_sql+=" from jxc_kcb ";
					ls_sql+=" where lsh='"+lsh+"'";
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,ckph);
					ps2.setDouble(2,ckdj);
					ps2.setDouble(3,bcckje);
					ps2.executeUpdate();
					ps2.close();

					ls_sql=" update jxc_kcb set ztbz='Y',ckph=?,dqbm=?,rkj=?,kcje=?,rkph=null,rkxh=null,rksj=null,hwbh=null,hjbh=null,ckbh=null";
					ls_sql+=" where  lsh='"+lsh+"' ";
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,ckph);
					ps2.setString(2,mddqbm);
					ps2.setDouble(3,ckdj);
					ps2.setDouble(4,bcckje);
					ps2.executeUpdate();
					ps2.close();
				}
				else{
					//正常品:写入库存表
					//产生主键流水号
					int maxlsh=0;
					ls_sql=" select NVL(max(TO_NUMBER(lsh)),0) lsh";
					ls_sql+=" from jxc_kcb ";
					ps2= conn.prepareStatement(ls_sql);
					rs2=ps2.executeQuery();
					if (rs2.next())//库存有货 直接更新数量
					{
						maxlsh=rs2.getInt("lsh");
					}
					rs2.close();
					ps2.close();

					maxlsh++;

					ls_sql=" insert into jxc_kcb(lsh,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,gysmc,cllbbm,xh,nbbm,gg,clysbm,djzl,jldwbm,bzgg,bzjldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz ";
					ls_sql+=" ,clbm,zljb,clzk,rkph,rkxh,rksj,ckph,scph,scrq,hwbh,hjbh,ckbh,dqbm,rkj,kcsl,kcje,jqpjcbj  ,lsj,xsj,dfgsjg,dgzjg,ztbz) ";
					ls_sql+=" select               ?,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,gysmc,cllbbm,xh,nbbm,gg,clysbm,djzl,jldwbm,bzgg,bzjldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz ";
					ls_sql+=" ,clbm,zljb,clzk,?   ,?   ,?   ,?   ,scph,scrq,?   ,?   ,?   ,?   ,?  ,?   ,?   ,jqpjcbj  ,lsj,xsj,dfgsjg,dgzjg,? ";
					ls_sql+=" from jxc_kcb ";
					ls_sql+=" where lsh='"+lsh+"'";
					ps2= conn.prepareStatement(ls_sql);
					ps2.setInt(1,maxlsh);
					ps2.setString(2,null);
					ps2.setString(3,null);
					ps2.setDate(4,null);
					ps2.setString(5,ckph);
					ps2.setString(6,null);
					ps2.setString(7,null);
					ps2.setString(8,null);
					ps2.setString(9,mddqbm);
					ps2.setDouble(10,ckdj);
					ps2.setDouble(11,bccksl);
					ps2.setDouble(12,bcckje);
					ps2.setString(13,"Y");
					ps2.executeUpdate();
					ps2.close();

					ls_sql =" insert into jxc_cklsb (ckph,lsh,clbm,rkph,rkxh,rksj,yckph,hwbh,hjbh,ckbh,dqbm,rkj,jqpjcbj,lsj,xsj,dfgsjg,dgzjg,kcsl,kcje,ckdj,ckje)";
					ls_sql+=" select                    ?,?,clbm,rkph,rkxh,rksj,ckph ,hwbh,hjbh,ckbh,dqbm,rkj,jqpjcbj,lsj,xsj,dfgsjg,dgzjg,?,?*rkj,?,?";
					ls_sql+=" from jxc_kcb ";
					ls_sql+=" where lsh='"+lsh+"'";
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,ckph);
					ps2.setInt(2,maxlsh);
					ps2.setDouble(3,bccksl);
					ps2.setDouble(4,bccksl);
					ps2.setDouble(5,ckdj);
					ps2.setDouble(6,bcckje);
					ps2.executeUpdate();
					ps2.close();


					ls_sql=" update jxc_kcb set kcsl=kcsl-"+bccksl+",kcje=(kcsl-"+bccksl+")*rkj ";
					ls_sql+=" where  lsh='"+lsh+"' ";
					ps2= conn.prepareStatement(ls_sql);
					ps2.executeUpdate();
					ps2.close();
				}
			}
			rs1.close();
			ps1.close();
		}
		//更新：库存表＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束


		//更新出库单明细：成本价＋＋＋＋＋＋＋＋＋＋＋开始
		double cbdj=0;
		ls_sql=" select sum(kcje)/sum(kcsl)";
		ls_sql+=" from jxc_cklsb ";
		ls_sql+=" where ckph='"+ckph+"' and clbm='"+clbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if (rs1.next())
		{
			cbdj=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		if (ckjxz.equals("2"))//出库价选择，1：取价格表；2：取入库时定价；3：取来源单价格；4：人工录入
		{
			//更新出库单明细:出库价、成本价
			ls_sql=" update jxc_ckmx set cbdj="+cbdj+",cbje=cksl*"+cbdj;
			ls_sql+=" where ckph='"+ckph+"' and clbm='"+clbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
		else{
			//更新出库单明细:成本价
			ls_sql=" update jxc_ckmx set cbdj="+cbdj+",cbje=cksl*"+cbdj;
			ls_sql+=" where ckph='"+ckph+"' and clbm='"+clbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
		//更新出库单明细：出库价、成本价＝＝＝＝＝＝＝＝＝＝＝＝＝结束
	}
	rs.close();
	ps.close();

	if (lrsl==0)
	{
		conn.rollback();
		out.println("错误！无出库明细，不能提交");
		return;
	}

		
	//修改出库总金额＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	double ckzsl=0;
	double ckzje=0;
	double ckzcb=0;

	ls_sql=" select sum(cksl),sum(ckje),sum(cbje) ";
	ls_sql+=" from jxc_ckmx ";
	ls_sql+=" where ckph='"+ckph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ckzsl=rs.getDouble(1);
		ckzje=rs.getDouble(2);
		ckzcb=rs.getDouble(3);
	}
	rs.close();
	ps.close();

	ls_sql=" update jxc_ckd set ckzsl=?,ckzje=?,ckzcb=?,sfyfkc=?,ckdzt='9' where ckph='"+ckph+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,ckzsl);
	ps.setDouble(2,ckzje);
	ps.setDouble(3,ckzcb);
	ps.setString(4,sfyfkc);
	ps.executeUpdate();
	ps.close();
	//修改出库总金额＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束


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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>