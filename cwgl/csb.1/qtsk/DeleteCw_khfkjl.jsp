<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yhmc=(String)session.getAttribute("yhmc");

String[] fkxh=request.getParameterValues("fkxh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khbh=null;
String zffs=null;
String zckx=null;
String scbz=null;
String czlx=null;
String glxh=null;
String fklxbm=null;
String gljlbz=null;
String fkyjjzsj=null;

String ddbh=null;
String zjxbh=null;
String zcddbh=null;
String zczjxbh=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<fkxh.length ;i++ )
	{
		glxh=null;
		ls_sql="select khbh,scbz,zffs,zckx,czlx,glxh,fklxbm,gljlbz,yjjzsj,ddbh,zjxbh,zcddbh,zczjxbh";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where fkxh='"+fkxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			khbh=rs.getString("khbh");
			scbz=rs.getString("scbz");
			zffs=rs.getString("zffs");
			zckx=rs.getString("zckx");
			czlx=rs.getString("czlx");
			glxh=rs.getString("glxh");
			fklxbm=rs.getString("fklxbm");
			gljlbz=cf.fillNull(rs.getString("gljlbz"));
			fkyjjzsj=cf.fillNull(rs.getString("yjjzsj"));
			ddbh=cf.fillNull(rs.getString("ddbh"));
			zjxbh=cf.fillNull(rs.getString("zjxbh"));
			zcddbh=cf.fillNull(rs.getString("zcddbh"));
			zczjxbh=cf.fillNull(rs.getString("zczjxbh"));
		}
		else{
			conn.rollback();
			out.println("错误！不存在的收款序号："+fkxh[i]);
			return;
		}
		rs.close();
		ps.close();

		String khjsbz="";
		ls_sql="select khjsbz";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khjsbz=cf.fillNull(rs.getString("khjsbz"));
		}
		rs.close();
		ps.close();

		if (khjsbz.equals("Y"))
		{
			conn.rollback();
			out.println("错误！客户已结算，不能再修改");
			return;
		}

		if (!fkyjjzsj.equals(""))
		{
//			conn.rollback();
//			out.println("收款记录已结转，不能再修改，结转时间："+yjjzsj);
//			return;
		}

		if (gljlbz.equals("Y"))//N：非关联记录；Y：关联记录
		{
			String glfkxh=null;
			ls_sql="select fkxh";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where glxh='"+glxh+"' and gljlbz='N'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				glfkxh=cf.fillNull(rs.getString("fkxh"));
			}
			rs.close();
			ps.close();

			conn.rollback();
			out.println("<P>错误！收款记录["+fkxh[i]+"]是关联记录，不能直接删除，请删除原始记录："+glfkxh);
			return;
		}



		if (scbz.equals("Y"))
		{
			conn.rollback();
			out.println("<P>错误！收款序号["+fkxh[i]+"]已被删除");
			return;
		}
		if (!czlx.equals("1"))//1：录入；2：导出；3：导入
		{
			conn.rollback();
			out.println("<P>错误！收款序号["+fkxh[i]+"]凭证已导出");
			return;
		}

		//
		if (glxh==null)
		{
			ls_sql="update cw_khfkjl set scbz='Y',scsj=SYSDATE,scr='"+yhmc+"'";
			ls_sql+=" where fkxh='"+fkxh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else{//删除关联记录
			ls_sql="update cw_khfkjl set scbz='Y',scsj=SYSDATE,scr='"+yhmc+"'";
			ls_sql+=" where fkxh in(select fkxh from cw_glfkjl where glxh="+glxh+")";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

		//更新：量房订金标志、活动订金标志、设计费标志
		if (fklxbm.equals("52"))//52：量房订金
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
		else if (fklxbm.equals("51"))//51：促销活动订金
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
		else if (fklxbm.equals("53"))//53：设计费
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
				maxsjsj=rs.getDate(2);//交设计费时间
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

		if (zffs.equals("31"))//转帐款项
		{
			if ( zckx.equals("11"))//11：家装款
			{
				//家装款更新+++++++++++++++++++++++++++++++++++++++
				double getsfke=0;//
				ls_sql="select sum(fkje)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					getsfke=rs.getDouble(1);//已收工程款
				}
				rs.close();
				ps.close();

				//取财务收款情况
				double getcwsfke=0;//

				ls_sql="select sum(fkje)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N'";
				ls_sql+=" and ( skdd='1' OR (skdd='2' and dsksjbz='Y') )";//1：财务收款；2：非财务代收款
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					getcwsfke=rs.getDouble(1);//已收工程款
				}
				rs.close();
				ps.close();

				double getzjxssk=0;
				ls_sql="select sum(fkje)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N' and fkcs in(8)";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					getzjxssk=rs.getDouble(1);//增减项实收款
				}
				rs.close();
				ps.close();

				//更新：工程款实收款率、工程款实收款额
				ls_sql="update crm_khxx set sfke=?,cwsfke=?,zjxssk=?";
				ls_sql+=" where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDouble(1,getsfke);
				ps.setDouble(2,getcwsfke);
				ps.setDouble(3,getzjxssk);
				ps.executeUpdate();
				ps.close();

				//家装款更新--------------------------------------------
			}
			else if (zckx.equals("52"))//52：量房订金
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
			else if (zckx.equals("51"))//51：促销活动订金
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
			else if (zckx.equals("53"))//53：设计费
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
					maxsjsj=rs.getDate(2);//交设计费时间
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
			else if (zckx.equals("23"))//23:主材
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
					java.sql.Date maxsksj=null;
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
						maxsksj=rs.getDate(2);
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
							yjjzsj=maxsksj;

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
					java.sql.Date maxsksj=null;
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
						maxsksj=rs.getDate(2);
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
							yjjzsj=maxsksj;

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

		//如果有转出，检查是否允许修改
		double jcfkje=0;
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='"+fklxbm+"' and scbz='N'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			jcfkje=rs.getDouble(1);
		}
		rs.close();
		ps.close();
		if (jcfkje<0)
		{
			conn.rollback();
			out.println("<P>错误！！！本项收款已为负数，请仔细检查是否有错误："+fkxh[i]);
			return;
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
	}	

	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>