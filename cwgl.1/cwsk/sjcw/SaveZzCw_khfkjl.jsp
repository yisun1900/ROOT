<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String fgsbh=request.getParameter("fgsbh");
String khbh=request.getParameter("khbh");
String khbh2=request.getParameter("khbh2");
String khxm=cf.GB2Uni(request.getParameter("khxm"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String hth=null;
	String dwbh=null;
	String sjsbh=null;
	String sjs=null;
	ls_sql="select hth,zxdm,sjsbh,sjs";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  ssfgs='"+fgsbh+"' and khxm='"+khxm+"' and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth=rs.getString("hth");
		dwbh=rs.getString("zxdm");
		sjsbh=rs.getString("sjsbh");
		sjs=rs.getString("sjs");
	}
	else{
		rs.close();
		ps.close();

		out.println("错误！转入客户不存在");
		return;
	}
	rs.close();
	ps.close();

	String hth2=null;
	ls_sql="select hth";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  ssfgs='"+fgsbh+"' and khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth2=rs.getString(1);
	}
	else{
		rs.close();
		ps.close();

		out.println("错误！转出客户不存在");
		return;
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	//修改财务信息＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始	
	ls_sql="update cw_khfkjl set fgsbh=?,dwbh=?,sjsbh=?,sjs=?,khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjsbh);
	ps.setString(4,sjs);
	ps.setString(5,khbh);
	ps.executeUpdate();
	ps.close();

	//转入客户信息
		//家装款更新+++++++++++++++++++++++++++++++++++++++开始
		double zjxssk=0;
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N' and fkcs in(8)";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zjxssk=rs.getDouble(1);//增减项实收款
		}
		rs.close();
		ps.close();

		double getsfke=0;//
		java.sql.Date getjzkfksj=null;//家装最近收款时间
		java.sql.Date getjzkscsj=null;//首次付家装款时间
		String getjzkfkxh=null;//家装最近收款序号
		int getjzkfkcs=0;//家装收款期数
		ls_sql="select sum(fkje),max(sksj),min(sksj),max(fkxh),max(fkcs)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getsfke=rs.getDouble(1);//已收工程款
			getjzkfksj=rs.getDate(2);
			getjzkscsj=rs.getDate(3);
			getjzkfkxh=rs.getString(4);
			getjzkfkcs=rs.getInt(5);
		}
		rs.close();
		ps.close();


		//取财务收款情况
		double getcwsfke=0;//
		java.sql.Date getcwjzkfksj=null;//财务家装最近收款时间
		java.sql.Date getcwjzkscsj=null;//财务首次付家装款时间
		String getcwjzkfkxh=null;//财务家装最近收款序号
		int getcwjzkfkcs=0;//财务家装收款期数

		ls_sql="select sum(fkje),max(sjsj),min(sjsj),max(fkxh),max(fkcs)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N' ";
		ls_sql+=" and ( skdd='1' OR (skdd='2' and dsksjbz='Y') )";//1：财务收款；2：非财务代收款
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getcwsfke=rs.getDouble(1);//已收工程款
			getcwjzkfksj=rs.getDate(2);
			getcwjzkscsj=rs.getDate(3);
			getcwjzkfkxh=rs.getString(4);
			getcwjzkfkcs=rs.getInt(5);
		}
		rs.close();
		ps.close();


		ls_sql="update crm_khxx set sfke=?,jzkfkcs=?,jzkfkxh=?,jzkfksj=?,jzkscsj=?   ,cwsfke=?,cwjzkfkcs=?,cwjzkfkxh=?,cwjzkfksj=?,cwjzkscsj=?  ,zjxssk=?";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,getsfke);
		ps.setInt(2,getjzkfkcs);
		ps.setString(3,getjzkfkxh);
		ps.setDate(4,getjzkfksj);
		ps.setDate(5,getjzkscsj);

		ps.setDouble(6,getcwsfke);
		ps.setInt(7,getcwjzkfkcs);
		ps.setString(8,getcwjzkfkxh);
		ps.setDate(9,getcwjzkfksj);
		ps.setDate(10,getcwjzkscsj);

		ps.setDouble(11,zjxssk);
		ps.executeUpdate();
		ps.close();

		//家装款更新--------------------------------------------完成
		if (true)//52：量房订金
		{
			double sfke=0;
			double maxsfke=0;
			java.sql.Date jlfdjsj=null;
			String lfdjbz="N";
			ls_sql="select sum(fkje),max(fkje),min(sksj)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and fklxbm='52' and scbz='N'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sfke=rs.getDouble(1);//量房订金
				maxsfke=rs.getDouble(2);//最大量房订金
				jlfdjsj=rs.getDate(3);//交量房订金时间
			}
			rs.close();
			ps.close();


			if (sfke>0)
			{
				lfdjbz="Y";//N：未交订金；Y：已交订金；T：已退订金
			}
			else 
			{
				if (maxsfke>0)
				{
					lfdjbz="T";
				}
				else{
					lfdjbz="N";
				}
			}

			ls_sql="update crm_zxkhxx set lfdjbz=?,lfdj=?,jlfdjsj=?";//设计费是否可转出
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,lfdjbz);
			ps.setDouble(2,sfke);
			ps.setDate(3,jlfdjsj);
			ps.executeUpdate();
			ps.close();
		}

		if (true)//51：促销活动订金
		{
			double sfke=0;
			double maxsfke=0;
			java.sql.Date jhddjsj=null;
			String hddjbz="N";
			ls_sql="select sum(fkje),max(fkje),min(sksj)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and fklxbm='51' and scbz='N'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sfke=rs.getDouble(1);//活动订金
				maxsfke=rs.getDouble(2);//最大活动订金
				jhddjsj=rs.getDate(3);//交活动订金时间
			}
			rs.close();
			ps.close();

			if (sfke>0)
			{
				hddjbz="Y";//N：未交订金；Y：已交订金；T：已退订金
			}
			else 
			{
				if (maxsfke>0)
				{
					hddjbz="T";
				}
				else{
					hddjbz="N";
				}
			}

			ls_sql="update crm_zxkhxx set hddjbz=?,hddj=?,jhddjsj=?";//设计费是否可转出
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,hddjbz);
			ps.setDouble(2,sfke);
			ps.setDate(3,jhddjsj);
			ps.executeUpdate();
			ps.close();
		}
		if (true)//53：设计费
		{
			double sfke=0;
			double maxsfke=0;
			java.sql.Date jsjfsj=null;
			String sjfbz="N";
			ls_sql="select sum(fkje),max(fkje),min(sksj)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and fklxbm='53' and scbz='N'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sfke=rs.getDouble(1);//设计费
				maxsfke=rs.getDouble(2);//最大设计费
				jsjfsj=rs.getDate(3);//交设计费时间
			}
			rs.close();
			ps.close();


			if (sfke>0)
			{
				sjfbz="Y";//N：未交设计费；Y：已交设计费；T：退设计费
			}
			else 
			{
				if (maxsfke>0)
				{
					sjfbz="T";
				}
				else{
					sjfbz="N";
				}
			}

			ls_sql="update crm_zxkhxx set sjfbz=?,sjf=?,jsjfsj=?";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,sjfbz);
			ps.setDouble(2,sfke);
			ps.setDate(3,jsjfsj);
			ps.executeUpdate();
			ps.close();

			//设置：设计费记入业绩时间＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			double sjhtje=0;
			java.sql.Date sjfjryjsj=null;
			ls_sql="select sjhtje,sjfjryjsj";
			ls_sql+=" from  crm_zxkhxx";
			ls_sql+=" where khbh='"+khbh+"' and qsjhtbz='Y'";//N：未签；Y：签合同
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sjhtje=rs.getDouble(1);//设计合同金额
				sjfjryjsj=rs.getDate(2);//设计费记入业绩时间
			}
			rs.close();
			ps.close();

			double cwsssjf=0;
			java.sql.Date maxsjsj=null;
			ls_sql="select sum(fkje),max(sjsj)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and fklxbm='53' and scbz='N'";
			ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				cwsssjf=rs.getDouble(1);//设计费
				maxsjsj=rs.getDate(2);
			}
			rs.close();
			ps.close();

			if (sjfjryjsj==null)
			{
				if (cwsssjf>=sjhtje)
				{
					sjfjryjsj=maxsjsj;
					ls_sql="update crm_zxkhxx set sjfjryjsj=?";
					ls_sql+=" where khbh='"+khbh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setDate(1,sjfjryjsj);
					ps.executeUpdate();
					ps.close();
				}
			}
			else{
				if (cwsssjf<sjhtje)
				{
					sjfjryjsj=null;
					ls_sql="update crm_zxkhxx set sjfjryjsj=?";
					ls_sql+=" where khbh='"+khbh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setDate(1,sjfjryjsj);
					ps.executeUpdate();
					ps.close();
				}
			}
			//设置：设计费记入业绩时间＝＝＝＝＝＝＝＝＝＝＝＝＝结束
		}


		if (true)//23:主材
		{
			if (!zjxbh.equals(""))
			{
				double sskje=0;//实收款金额
				ls_sql="select sum(fkje)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
				ls_sql+=" and zjxbh='"+zjxbh+"'";
				ls_sql+=" and fklxbm='23'";//23:主材
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sskje=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				if (sskje<0)
				{
					conn.rollback();
					out.println("错误！该订单累计付款总额不能为负数:"+sskje);
					return;
				}

				double shsskje=0;//财务审核实收款金额
				java.sql.Date maxsjsj=null;
				ls_sql="select sum(fkje),max(sjsj)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
				ls_sql+=" and zjxbh='"+zjxbh+"'";
				ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
				ls_sql+=" and fklxbm='23'";//23:主材
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					shsskje=rs.getDouble(1);
					maxsjsj=rs.getDate(2);
				}
				rs.close();
				ps.close();

				ls_sql="update jc_zczjx set sskje=?,shsskje=? ";
				ls_sql+=" where zjxbh='"+zjxbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDouble(1,sskje);
				ps.setDouble(2,shsskje);
				ps.executeUpdate();
				ps.close();

				double getzjxze=0;
				java.sql.Date yjjzsj=null;
				ls_sql="select zjxze,yjjzsj";
				ls_sql+=" from  jc_zczjx";
				ls_sql+=" where zjxbh='"+zjxbh+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					getzjxze=rs.getDouble(1);
					yjjzsj=rs.getDate(2);
				}
				rs.close();
				ps.close();

				if (yjjzsj==null)
				{
					if (shsskje>=getzjxze)
					{
						yjjzsj=maxsjsj;

						ls_sql="update jc_zczjx set yjjzsj=?";
						ls_sql+=" where zjxbh='"+zjxbh+"'";
						ps= conn.prepareStatement(ls_sql);
						ps.setDate(1,yjjzsj);
						ps.executeUpdate();
						ps.close();
					}
				}
				else{
					if (shsskje<getzjxze)
					{
						yjjzsj=null;

						ls_sql="update jc_zczjx set yjjzsj=?";
						ls_sql+=" where zjxbh='"+zjxbh+"'";
						ps= conn.prepareStatement(ls_sql);
						ps.setDate(1,yjjzsj);
						ps.executeUpdate();
						ps.close();
					}
				}

			
			}
			else if (!ddbh.equals(""))
			{
				double sskje=0;//实收款金额
				ls_sql="select sum(fkje)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
				ls_sql+=" and ddbh='"+ddbh+"'";
				ls_sql+=" and zjxbh is null";
				ls_sql+=" and fklxbm='23'";//23:主材
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sskje=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				if (sskje<0)
				{
					conn.rollback();
					out.println("错误！该订单累计付款总额不能为负数:"+sskje);
					return;
				}

				double shsskje=0;//财务审核实收款金额
				java.sql.Date maxsjsj=null;
				ls_sql="select sum(fkje),max(sjsj)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
				ls_sql+=" and ddbh='"+ddbh+"'";
				ls_sql+=" and zjxbh is null";
				ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
				ls_sql+=" and fklxbm='23'";//23:主材
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					shsskje=rs.getDouble(1);
					maxsjsj=rs.getDate(2);
				}
				rs.close();
				ps.close();

				ls_sql="update jc_zcdd set sskje=?,shsskje=? ";
				ls_sql+=" where ddbh='"+ddbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDouble(1,sskje);
				ps.setDouble(2,shsskje);
				ps.executeUpdate();
				ps.close();

				double gethkze=0;
				java.sql.Date yjjzsj=null;
				ls_sql="select hkze,yjjzsj";
				ls_sql+=" from  jc_zcdd";
				ls_sql+=" where ddbh='"+ddbh+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					gethkze=rs.getDouble(1);
					yjjzsj=rs.getDate(2);
				}
				rs.close();
				ps.close();


				if (yjjzsj==null)
				{
					if (shsskje>=gethkze)
					{
						yjjzsj=maxsjsj;

						ls_sql="update jc_zcdd set yjjzsj=?";
						ls_sql+=" where ddbh='"+ddbh+"'";
						ps= conn.prepareStatement(ls_sql);
						ps.setDate(1,yjjzsj);
						ps.executeUpdate();
						ps.close();

					}
				}
				else{
					if (shsskje<gethkze)
					{
						yjjzsj=null;

						ls_sql="update jc_zcdd set yjjzsj=?";
						ls_sql+=" where ddbh='"+ddbh+"'";
						ps= conn.prepareStatement(ls_sql);
						ps.setDate(1,yjjzsj);
						ps.executeUpdate();
						ps.close();
					}
				}
			}
		}
		if (true)//23:主材
		{
			if (!zczjxbh.equals(""))
			{
				double sskje=0;//实收款金额
				ls_sql="select sum(fkje)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
				ls_sql+=" and zjxbh='"+zczjxbh+"'";
				ls_sql+=" and fklxbm='23'";//23:主材
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sskje=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				if (sskje<0)
				{
					conn.rollback();
					out.println("错误！该订单累计付款总额不能为负数:"+sskje);
					return;
				}

				double shsskje=0;//财务审核实收款金额
				java.sql.Date maxsjsj=null;
				ls_sql="select sum(fkje),max(sjsj)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
				ls_sql+=" and zjxbh='"+zczjxbh+"'";
				ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
				ls_sql+=" and fklxbm='23'";//23:主材
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					shsskje=rs.getDouble(1);
					maxsjsj=rs.getDate(2);
				}
				rs.close();
				ps.close();

				ls_sql="update jc_zczjx set sskje=?,shsskje=? ";
				ls_sql+=" where zjxbh='"+zczjxbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDouble(1,sskje);
				ps.setDouble(2,shsskje);
				ps.executeUpdate();
				ps.close();

				double getzjxze=0;
				java.sql.Date yjjzsj=null;
				ls_sql="select zjxze,yjjzsj";
				ls_sql+=" from  jc_zczjx";
				ls_sql+=" where zjxbh='"+zczjxbh+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					getzjxze=rs.getDouble(1);
					yjjzsj=rs.getDate(2);
				}
				rs.close();
				ps.close();

				if (yjjzsj==null)
				{
					if (shsskje>=getzjxze)
					{
						yjjzsj=maxsjsj;

						ls_sql="update jc_zczjx set yjjzsj=?";
						ls_sql+=" where zjxbh='"+zczjxbh+"'";
						ps= conn.prepareStatement(ls_sql);
						ps.setDate(1,yjjzsj);
						ps.executeUpdate();
						ps.close();
					}
				}
				else{
					if (shsskje<getzjxze)
					{
						yjjzsj=null;

						ls_sql="update jc_zczjx set yjjzsj=?";
						ls_sql+=" where zjxbh='"+zczjxbh+"'";
						ps= conn.prepareStatement(ls_sql);
						ps.setDate(1,yjjzsj);
						ps.executeUpdate();
						ps.close();
					}
				}

			
			}
			else if (!zcddbh.equals(""))
			{
				double sskje=0;//实收款金额
				ls_sql="select sum(fkje)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
				ls_sql+=" and ddbh='"+zcddbh+"'";
				ls_sql+=" and zjxbh is null";
				ls_sql+=" and fklxbm='23'";//23:主材
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sskje=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				if (sskje<0)
				{
					conn.rollback();
					out.println("错误！该订单累计付款总额不能为负数:"+sskje);
					return;
				}

				double shsskje=0;//财务审核实收款金额
				java.sql.Date maxsjsj=null;
				ls_sql="select sum(fkje),max(sjsj)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
				ls_sql+=" and ddbh='"+zcddbh+"'";
				ls_sql+=" and zjxbh is null";
				ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
				ls_sql+=" and fklxbm='23'";//23:主材
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					shsskje=rs.getDouble(1);
					maxsjsj=rs.getDate(2);
				}
				rs.close();
				ps.close();

				ls_sql="update jc_zcdd set sskje=?,shsskje=? ";
				ls_sql+=" where ddbh='"+zcddbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDouble(1,sskje);
				ps.setDouble(2,shsskje);
				ps.executeUpdate();
				ps.close();

				double gethkze=0;
				java.sql.Date yjjzsj=null;
				ls_sql="select hkze,yjjzsj";
				ls_sql+=" from  jc_zcdd";
				ls_sql+=" where ddbh='"+zcddbh+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					gethkze=rs.getDouble(1);
					yjjzsj=rs.getDate(2);
				}
				rs.close();
				ps.close();


				if (yjjzsj==null)
				{
					if (shsskje>=gethkze)
					{
						yjjzsj=maxsjsj;

						ls_sql="update jc_zcdd set yjjzsj=?";
						ls_sql+=" where ddbh='"+zcddbh+"'";
						ps= conn.prepareStatement(ls_sql);
						ps.setDate(1,yjjzsj);
						ps.executeUpdate();
						ps.close();

					}
				}
				else{
					if (shsskje<gethkze)
					{
						yjjzsj=null;

						ls_sql="update jc_zcdd set yjjzsj=?";
						ls_sql+=" where ddbh='"+zcddbh+"'";
						ps= conn.prepareStatement(ls_sql);
						ps.setDate(1,yjjzsj);
						ps.executeUpdate();
						ps.close();
					}
				}
			}
		}
	}


	double getkhfkze=0;
	java.sql.Date minkhsksj=null;
	java.sql.Date maxkhsksj=null;
	ls_sql="select sum(fkje),min(sksj),max(sksj)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getkhfkze=rs.getDouble(1);
		minkhsksj=rs.getDate(2);
		maxkhsksj=rs.getDate(3);
	}
	rs.close();
	ps.close();

	ls_sql="update crm_zxkhxx set scfksj=?,zjfksj=?,fkze=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,minkhsksj);
	ps.setDate(2,maxkhsksj);
	ps.setDouble(3,getkhfkze);
	ps.executeUpdate();
	ps.close();
	//修改财务信息========================完成	






	//转出客户信息＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
	//转出客户信息＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
	//家装款更新+++++++++++++++++++++++++++++++++++++++开始
		//家装款更新+++++++++++++++++++++++++++++++++++++++开始
		double zjxssk=0;
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh2+"' and fklxbm='11' and scbz='N' and fkcs in(8)";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zjxssk=rs.getDouble(1);//增减项实收款
		}
		rs.close();
		ps.close();

		double getsfke=0;//
		java.sql.Date getjzkfksj=null;//家装最近收款时间
		java.sql.Date getjzkscsj=null;//首次付家装款时间
		String getjzkfkxh=null;//家装最近收款序号
		int getjzkfkcs=0;//家装收款期数
		ls_sql="select sum(fkje),max(sksj),min(sksj),max(fkxh),max(fkcs)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh2+"' and fklxbm='11' and scbz='N' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getsfke=rs.getDouble(1);//已收工程款
			getjzkfksj=rs.getDate(2);
			getjzkscsj=rs.getDate(3);
			getjzkfkxh=rs.getString(4);
			getjzkfkcs=rs.getInt(5);
		}
		rs.close();
		ps.close();


		//取财务收款情况
		double getcwsfke=0;//
		java.sql.Date getcwjzkfksj=null;//财务家装最近收款时间
		java.sql.Date getcwjzkscsj=null;//财务首次付家装款时间
		String getcwjzkfkxh=null;//财务家装最近收款序号
		int getcwjzkfkcs=0;//财务家装收款期数

		ls_sql="select sum(fkje),max(sjsj),min(sjsj),max(fkxh),max(fkcs)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh2+"' and fklxbm='11' and scbz='N' ";
		ls_sql+=" and ( skdd='1' OR (skdd='2' and dsksjbz='Y') )";//1：财务收款；2：非财务代收款
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getcwsfke=rs.getDouble(1);//已收工程款
			getcwjzkfksj=rs.getDate(2);
			getcwjzkscsj=rs.getDate(3);
			getcwjzkfkxh=rs.getString(4);
			getcwjzkfkcs=rs.getInt(5);
		}
		rs.close();
		ps.close();


		ls_sql="update crm_khxx set sfke=?,jzkfkcs=?,jzkfkxh=?,jzkfksj=?,jzkscsj=?   ,cwsfke=?,cwjzkfkcs=?,cwjzkfkxh=?,cwjzkfksj=?,cwjzkscsj=?  ,zjxssk=?";
		ls_sql+=" where khbh='"+khbh2+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,getsfke);
		ps.setInt(2,getjzkfkcs);
		ps.setString(3,getjzkfkxh);
		ps.setDate(4,getjzkfksj);
		ps.setDate(5,getjzkscsj);

		ps.setDouble(6,getcwsfke);
		ps.setInt(7,getcwjzkfkcs);
		ps.setString(8,getcwjzkfkxh);
		ps.setDate(9,getcwjzkfksj);
		ps.setDate(10,getcwjzkscsj);

		ps.setDouble(11,zjxssk);
		ps.executeUpdate();
		ps.close();

		//家装款更新--------------------------------------------完成
		if (true)//52：量房订金
		{
			double sfke=0;
			double maxsfke=0;
			java.sql.Date jlfdjsj=null;
			String lfdjbz="N";
			ls_sql="select sum(fkje),max(fkje),min(sksj)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh2+"' and fklxbm='52' and scbz='N'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sfke=rs.getDouble(1);//量房订金
				maxsfke=rs.getDouble(2);//最大量房订金
				jlfdjsj=rs.getDate(3);//交量房订金时间
			}
			rs.close();
			ps.close();


			if (sfke>0)
			{
				lfdjbz="Y";//N：未交订金；Y：已交订金；T：已退订金
			}
			else 
			{
				if (maxsfke>0)
				{
					lfdjbz="T";
				}
				else{
					lfdjbz="N";
				}
			}

			ls_sql="update crm_zxkhxx set lfdjbz=?,lfdj=?,jlfdjsj=?";//设计费是否可转出
			ls_sql+=" where khbh='"+khbh2+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,lfdjbz);
			ps.setDouble(2,sfke);
			ps.setDate(3,jlfdjsj);
			ps.executeUpdate();
			ps.close();
		}

		if (true)//51：促销活动订金
		{
			double sfke=0;
			double maxsfke=0;
			java.sql.Date jhddjsj=null;
			String hddjbz="N";
			ls_sql="select sum(fkje),max(fkje),min(sksj)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh2+"' and fklxbm='51' and scbz='N'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sfke=rs.getDouble(1);//活动订金
				maxsfke=rs.getDouble(2);//最大活动订金
				jhddjsj=rs.getDate(3);//交活动订金时间
			}
			rs.close();
			ps.close();

			if (sfke>0)
			{
				hddjbz="Y";//N：未交订金；Y：已交订金；T：已退订金
			}
			else 
			{
				if (maxsfke>0)
				{
					hddjbz="T";
				}
				else{
					hddjbz="N";
				}
			}

			ls_sql="update crm_zxkhxx set hddjbz=?,hddj=?,jhddjsj=?";//设计费是否可转出
			ls_sql+=" where khbh='"+khbh2+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,hddjbz);
			ps.setDouble(2,sfke);
			ps.setDate(3,jhddjsj);
			ps.executeUpdate();
			ps.close();
		}
		if (true)//53：设计费
		{
			double sfke=0;
			double maxsfke=0;
			java.sql.Date jsjfsj=null;
			String sjfbz="N";
			ls_sql="select sum(fkje),max(fkje),min(sksj)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh2+"' and fklxbm='53' and scbz='N'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sfke=rs.getDouble(1);//设计费
				maxsfke=rs.getDouble(2);//最大设计费
				jsjfsj=rs.getDate(3);//交设计费时间
			}
			rs.close();
			ps.close();


			if (sfke>0)
			{
				sjfbz="Y";//N：未交设计费；Y：已交设计费；T：退设计费
			}
			else 
			{
				if (maxsfke>0)
				{
					sjfbz="T";
				}
				else{
					sjfbz="N";
				}
			}

			ls_sql="update crm_zxkhxx set sjfbz=?,sjf=?,jsjfsj=?";
			ls_sql+=" where khbh='"+khbh2+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,sjfbz);
			ps.setDouble(2,sfke);
			ps.setDate(3,jsjfsj);
			ps.executeUpdate();
			ps.close();

			//设置：设计费记入业绩时间＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			double sjhtje=0;
			java.sql.Date sjfjryjsj=null;
			ls_sql="select sjhtje,sjfjryjsj";
			ls_sql+=" from  crm_zxkhxx";
			ls_sql+=" where khbh='"+khbh2+"' and qsjhtbz='Y'";//N：未签；Y：签合同
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sjhtje=rs.getDouble(1);//设计合同金额
				sjfjryjsj=rs.getDate(2);//设计费记入业绩时间
			}
			rs.close();
			ps.close();

			double cwsssjf=0;
			java.sql.Date maxsjsj=null;
			ls_sql="select sum(fkje),max(sjsj)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh2+"' and fklxbm='53' and scbz='N'";
			ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				cwsssjf=rs.getDouble(1);//设计费
				maxsjsj=rs.getDate(2);
			}
			rs.close();
			ps.close();

			if (sjfjryjsj==null)
			{
				if (cwsssjf>=sjhtje)
				{
					sjfjryjsj=maxsjsj;
					ls_sql="update crm_zxkhxx set sjfjryjsj=?";
					ls_sql+=" where khbh='"+khbh2+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setDate(1,sjfjryjsj);
					ps.executeUpdate();
					ps.close();
				}
			}
			else{
				if (cwsssjf<sjhtje)
				{
					sjfjryjsj=null;
					ls_sql="update crm_zxkhxx set sjfjryjsj=?";
					ls_sql+=" where khbh='"+khbh2+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setDate(1,sjfjryjsj);
					ps.executeUpdate();
					ps.close();
				}
			}
			//设置：设计费记入业绩时间＝＝＝＝＝＝＝＝＝＝＝＝＝结束
		}


		if (true)//23:主材
		{
			if (!zjxbh.equals(""))
			{
				double sskje=0;//实收款金额
				ls_sql="select sum(fkje)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh2+"' and scbz='N' ";
				ls_sql+=" and zjxbh='"+zjxbh+"'";
				ls_sql+=" and fklxbm='23'";//23:主材
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sskje=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				if (sskje<0)
				{
					conn.rollback();
					out.println("错误！该订单累计付款总额不能为负数:"+sskje);
					return;
				}

				double shsskje=0;//财务审核实收款金额
				java.sql.Date maxsjsj=null;
				ls_sql="select sum(fkje),max(sjsj)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh2+"' and scbz='N' ";
				ls_sql+=" and zjxbh='"+zjxbh+"'";
				ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
				ls_sql+=" and fklxbm='23'";//23:主材
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					shsskje=rs.getDouble(1);
					maxsjsj=rs.getDate(2);
				}
				rs.close();
				ps.close();

				ls_sql="update jc_zczjx set sskje=?,shsskje=? ";
				ls_sql+=" where zjxbh='"+zjxbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDouble(1,sskje);
				ps.setDouble(2,shsskje);
				ps.executeUpdate();
				ps.close();

				double getzjxze=0;
				java.sql.Date yjjzsj=null;
				ls_sql="select zjxze,yjjzsj";
				ls_sql+=" from  jc_zczjx";
				ls_sql+=" where zjxbh='"+zjxbh+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					getzjxze=rs.getDouble(1);
					yjjzsj=rs.getDate(2);
				}
				rs.close();
				ps.close();

				if (yjjzsj==null)
				{
					if (shsskje>=getzjxze)
					{
						yjjzsj=maxsjsj;

						ls_sql="update jc_zczjx set yjjzsj=?";
						ls_sql+=" where zjxbh='"+zjxbh+"'";
						ps= conn.prepareStatement(ls_sql);
						ps.setDate(1,yjjzsj);
						ps.executeUpdate();
						ps.close();
					}
				}
				else{
					if (shsskje<getzjxze)
					{
						yjjzsj=null;

						ls_sql="update jc_zczjx set yjjzsj=?";
						ls_sql+=" where zjxbh='"+zjxbh+"'";
						ps= conn.prepareStatement(ls_sql);
						ps.setDate(1,yjjzsj);
						ps.executeUpdate();
						ps.close();
					}
				}

			
			}
			else if (!ddbh.equals(""))
			{
				double sskje=0;//实收款金额
				ls_sql="select sum(fkje)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh2+"' and scbz='N' ";
				ls_sql+=" and ddbh='"+ddbh+"'";
				ls_sql+=" and zjxbh is null";
				ls_sql+=" and fklxbm='23'";//23:主材
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sskje=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				if (sskje<0)
				{
					conn.rollback();
					out.println("错误！该订单累计付款总额不能为负数:"+sskje);
					return;
				}

				double shsskje=0;//财务审核实收款金额
				java.sql.Date maxsjsj=null;
				ls_sql="select sum(fkje),max(sjsj)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh2+"' and scbz='N' ";
				ls_sql+=" and ddbh='"+ddbh+"'";
				ls_sql+=" and zjxbh is null";
				ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
				ls_sql+=" and fklxbm='23'";//23:主材
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					shsskje=rs.getDouble(1);
					maxsjsj=rs.getDate(2);
				}
				rs.close();
				ps.close();

				ls_sql="update jc_zcdd set sskje=?,shsskje=? ";
				ls_sql+=" where ddbh='"+ddbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDouble(1,sskje);
				ps.setDouble(2,shsskje);
				ps.executeUpdate();
				ps.close();

				double gethkze=0;
				java.sql.Date yjjzsj=null;
				ls_sql="select hkze,yjjzsj";
				ls_sql+=" from  jc_zcdd";
				ls_sql+=" where ddbh='"+ddbh+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					gethkze=rs.getDouble(1);
					yjjzsj=rs.getDate(2);
				}
				rs.close();
				ps.close();


				if (yjjzsj==null)
				{
					if (shsskje>=gethkze)
					{
						yjjzsj=maxsjsj;

						ls_sql="update jc_zcdd set yjjzsj=?";
						ls_sql+=" where ddbh='"+ddbh+"'";
						ps= conn.prepareStatement(ls_sql);
						ps.setDate(1,yjjzsj);
						ps.executeUpdate();
						ps.close();

					}
				}
				else{
					if (shsskje<gethkze)
					{
						yjjzsj=null;

						ls_sql="update jc_zcdd set yjjzsj=?";
						ls_sql+=" where ddbh='"+ddbh+"'";
						ps= conn.prepareStatement(ls_sql);
						ps.setDate(1,yjjzsj);
						ps.executeUpdate();
						ps.close();
					}
				}
			}
		}
		if (true)//23:主材
		{
			if (!zczjxbh.equals(""))
			{
				double sskje=0;//实收款金额
				ls_sql="select sum(fkje)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh2+"' and scbz='N' ";
				ls_sql+=" and zjxbh='"+zczjxbh+"'";
				ls_sql+=" and fklxbm='23'";//23:主材
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sskje=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				if (sskje<0)
				{
					conn.rollback();
					out.println("错误！该订单累计付款总额不能为负数:"+sskje);
					return;
				}

				double shsskje=0;//财务审核实收款金额
				java.sql.Date maxsjsj=null;
				ls_sql="select sum(fkje),max(sjsj)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh2+"' and scbz='N' ";
				ls_sql+=" and zjxbh='"+zczjxbh+"'";
				ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
				ls_sql+=" and fklxbm='23'";//23:主材
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					shsskje=rs.getDouble(1);
					maxsjsj=rs.getDate(2);
				}
				rs.close();
				ps.close();

				ls_sql="update jc_zczjx set sskje=?,shsskje=? ";
				ls_sql+=" where zjxbh='"+zczjxbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDouble(1,sskje);
				ps.setDouble(2,shsskje);
				ps.executeUpdate();
				ps.close();

				double getzjxze=0;
				java.sql.Date yjjzsj=null;
				ls_sql="select zjxze,yjjzsj";
				ls_sql+=" from  jc_zczjx";
				ls_sql+=" where zjxbh='"+zczjxbh+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					getzjxze=rs.getDouble(1);
					yjjzsj=rs.getDate(2);
				}
				rs.close();
				ps.close();

				if (yjjzsj==null)
				{
					if (shsskje>=getzjxze)
					{
						yjjzsj=maxsjsj;

						ls_sql="update jc_zczjx set yjjzsj=?";
						ls_sql+=" where zjxbh='"+zczjxbh+"'";
						ps= conn.prepareStatement(ls_sql);
						ps.setDate(1,yjjzsj);
						ps.executeUpdate();
						ps.close();
					}
				}
				else{
					if (shsskje<getzjxze)
					{
						yjjzsj=null;

						ls_sql="update jc_zczjx set yjjzsj=?";
						ls_sql+=" where zjxbh='"+zczjxbh+"'";
						ps= conn.prepareStatement(ls_sql);
						ps.setDate(1,yjjzsj);
						ps.executeUpdate();
						ps.close();
					}
				}

			
			}
			else if (!zcddbh.equals(""))
			{
				double sskje=0;//实收款金额
				ls_sql="select sum(fkje)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh2+"' and scbz='N' ";
				ls_sql+=" and ddbh='"+zcddbh+"'";
				ls_sql+=" and zjxbh is null";
				ls_sql+=" and fklxbm='23'";//23:主材
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sskje=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				if (sskje<0)
				{
					conn.rollback();
					out.println("错误！该订单累计付款总额不能为负数:"+sskje);
					return;
				}

				double shsskje=0;//财务审核实收款金额
				java.sql.Date maxsjsj=null;
				ls_sql="select sum(fkje),max(sjsj)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh2+"' and scbz='N' ";
				ls_sql+=" and ddbh='"+zcddbh+"'";
				ls_sql+=" and zjxbh is null";
				ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
				ls_sql+=" and fklxbm='23'";//23:主材
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					shsskje=rs.getDouble(1);
					maxsjsj=rs.getDate(2);
				}
				rs.close();
				ps.close();

				ls_sql="update jc_zcdd set sskje=?,shsskje=? ";
				ls_sql+=" where ddbh='"+zcddbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDouble(1,sskje);
				ps.setDouble(2,shsskje);
				ps.executeUpdate();
				ps.close();

				double gethkze=0;
				java.sql.Date yjjzsj=null;
				ls_sql="select hkze,yjjzsj";
				ls_sql+=" from  jc_zcdd";
				ls_sql+=" where ddbh='"+zcddbh+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					gethkze=rs.getDouble(1);
					yjjzsj=rs.getDate(2);
				}
				rs.close();
				ps.close();


				if (yjjzsj==null)
				{
					if (shsskje>=gethkze)
					{
						yjjzsj=maxsjsj;

						ls_sql="update jc_zcdd set yjjzsj=?";
						ls_sql+=" where ddbh='"+zcddbh+"'";
						ps= conn.prepareStatement(ls_sql);
						ps.setDate(1,yjjzsj);
						ps.executeUpdate();
						ps.close();

					}
				}
				else{
					if (shsskje<gethkze)
					{
						yjjzsj=null;

						ls_sql="update jc_zcdd set yjjzsj=?";
						ls_sql+=" where ddbh='"+zcddbh+"'";
						ps= conn.prepareStatement(ls_sql);
						ps.setDate(1,yjjzsj);
						ps.executeUpdate();
						ps.close();
					}
				}
			}
		}
	}


	getkhfkze=0;
	minkhsksj=null;
	maxkhsksj=null;
	ls_sql="select sum(fkje),min(sksj),max(sksj)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh2+"' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getkhfkze=rs.getDouble(1);
		minkhsksj=rs.getDate(2);
		maxkhsksj=rs.getDate(3);
	}
	rs.close();
	ps.close();

	ls_sql="update crm_zxkhxx set scfksj=?,zjfksj=?,fkze=?";
	ls_sql+=" where khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,minkhsksj);
	ps.setDate(2,maxkhsksj);
	ps.setDouble(3,getkhfkze);
	ps.executeUpdate();
	ps.close();
	//修改财务信息========================完成	

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("合并成功！");
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
