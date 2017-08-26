<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] rkph=request.getParameterValues("rkph");
if (rkph.length>1)
{
	out.println("错误！一次不能删除多个");
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	jxc.JxcClass jxc=new jxc.JxcClass();

	conn.setAutoCommit(false);

	for (int i=0;i<rkph.length ;i++ )
	{
		//检查入库单状态
		String rkdzt=null;
		String gysmc=null;
		String dqbm=null;
		String ckbh=null;
		java.sql.Date rksj=null;
		ls_sql="select rkdzt,gysmc,dqbm,ckbh,rksj ";
		ls_sql+=" from  jxc_rkd ";
		ls_sql+=" where rkph='"+rkph[i]+"' ";
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
			conn.rollback();
			out.print("错误！入库单["+rkph[i]+"]不存在！");
			return;
		}
		rs.close();
		ps.close();

		String jz=jxc.isJz(conn,ckbh);
		if (jz.equals("N"))//N未结转；Y：已结转
		{
			out.print("上个月没有结转，不能进行库存操作！"+jz);
			return;
		}

		if (!rkdzt.equals("3"))//0：未提交；1：等待审核；2：等待入库；3：已入库；4：已结算；6：等待总部审核
		{
			conn.rollback();
			out.print("错误！入库单未提交："+rkph[i]);
			return;
		}

		
		//修改入库单状态，入库单金额
		ls_sql="update jxc_rkd set rkdzt='0',rkzje=0,zcpzje=0,ccpzje=0,wldszje=0,thclzje=0,bfclzje=0";//0：未提交；1：等待审核；2：等待入库；3：已入库；4：已结算；6：等待总部审核
		ls_sql+=" where rkph='"+rkph[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		int rkxh=0;
		double rkj=0;
		double zcpsl=0;//正常品数量
		double zcpfkcsl=0;//正常品负库存入库数
		double ccpsl=0;//残次品数量
		double ccpfkcsl=0;//残次品负库存入库数
		double bfpsl=0;//报废品数量
		double bfpfkcsl=0;//报废品负库存入库数
		double ccpzkl=0;
		double rksl=0;
		String clbm=null;

		ls_sql=" select rkxh,clbm,rkj,rksl,zcpsl,zcpfkcsl,ccpsl,ccpfkcsl,bfpsl,bfpfkcsl,ccpzkl";
		ls_sql+=" from jxc_rkmx ";
		ls_sql+=" where rkph='"+rkph[i]+"' ";
		ls_sql+=" order by rkxh";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		while (rs.next())
		{
			rkxh=rs.getInt("rkxh");
			clbm=rs.getString("clbm");
			rkj=rs.getDouble("rkj");
			rksl=rs.getDouble("rksl");
			zcpsl=rs.getDouble("zcpsl");
			zcpfkcsl=rs.getDouble("zcpfkcsl");
			ccpsl=rs.getDouble("ccpsl");
			ccpfkcsl=rs.getDouble("ccpfkcsl");
			bfpsl=rs.getDouble("bfpsl");
			bfpfkcsl=rs.getDouble("bfpfkcsl");
			ccpzkl=rs.getDouble("ccpzkl");

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


			double kcsl=0;
			double cksl=0;
			String ckph="";
			if (xsfs.equals("4"))//1：代销品；2：现货销售；3：期货销售；4：允许负库存
			{
				//修改:负库存入库数
				ls_sql=" update jxc_rkmx set zcpfkcsl=0,ccpfkcsl=0,bfpfkcsl=0";
				ls_sql+=" where rkph='"+rkph[i]+"' and rkxh='"+rkxh+"'";
				ps2= conn.prepareStatement(ls_sql);
				ps2.executeUpdate();
				ps2.close();

				if (zcpsl!=0)
				{
					double zcprks=zcpsl-zcpfkcsl;//正常品:进入库存表数量

					if (zcprks>0 && zcpzsl<zcprks)
					{
						conn.rollback();
						out.println("错误！材料【"+clbm+"】已出库，不能再删除，入库数："+zcprks+"，库存数："+zcpzsl);
						return;
					}

					ls_sql="  SELECT sum(kcsl) kcsl";
					ls_sql+=" FROM jxc_kcb";
					ls_sql+=" where rkph='"+rkph[i]+"' and rkxh='"+rkxh+"' and clbm='"+clbm+"' and ckbh='"+ckbh+"' and zljb='1'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						kcsl=rs1.getDouble("kcsl");
					}
					rs1.close();
					ps1.close();
					if (zcprks>kcsl)
					{
						conn.rollback();
						out.println("入库序号【"+rkxh+"】错误！材料【"+clbm+"】已出库，不能再删除，入库数："+zcprks+"，库存数："+kcsl);
						return;
					}

					ls_sql="  SELECT cksl,ckph";
					ls_sql+=" FROM jxc_ckcpxx";
					ls_sql+=" where rkph='"+rkph[i]+"' and rkxh='"+rkxh+"' and clbm='"+clbm+"' and dqbm='"+dqbm+"' and ckbh='"+ckbh+"'";
					ls_sql+=" and fkcckbz='2'";//1：出库时录入；2：负库存入库时录入
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						cksl=rs1.getDouble("cksl");
						ckph=rs1.getString("ckph");

						//修改:是否有负库存
						ls_sql=" update jxc_ckmx set sfyfkc='2',fkcs="+cksl;
						ls_sql+=" where clbm='"+clbm+"' and ckph='"+ckph+"'";//1：无负库存；2：有负库存
						ps2= conn.prepareStatement(ls_sql);
						ps2.executeUpdate();
						ps2.close();

					}
					rs1.close();
					ps1.close();

					if (zcpsl!=(kcsl+cksl))
					{
						conn.rollback();
						out.println("入库序号【"+rkxh+"】错误！材料【"+clbm+"】已出库，不能再删除，入库数："+zcpsl+"，库存数："+(kcsl+cksl));
						return;
					}

					//修改:库存数
					ls_sql=" update jxc_cljgb set zcpzsl=zcpzsl-"+zcpsl;
					ls_sql+=" where dqbm='"+dqbm+"' and clbm='"+clbm+"'";
					ps2= conn.prepareStatement(ls_sql);
					ps2.executeUpdate();
					ps2.close();
				}
				if (ccpsl!=0)
				{
					double ccprks=ccpsl-ccpfkcsl;//进入库存表数量
					if (ccprks>0 && ccpzsl<ccprks)
					{
						conn.rollback();
						out.println("错误！材料【"+clbm+"】已出库，不能再删除，入库数："+ccprks+"，库存数："+ccpzsl);
						return;
					}


					ls_sql="  SELECT sum(kcsl) kcsl";
					ls_sql+=" FROM jxc_kcb";
					ls_sql+=" where rkph='"+rkph[i]+"' and rkxh='"+rkxh+"' and clbm='"+clbm+"' and ckbh='"+ckbh+"' and zljb='2'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						kcsl=rs1.getDouble("kcsl");
					}
					rs1.close();
					ps1.close();
					if (ccprks>kcsl)
					{
						conn.rollback();
						out.println("入库序号【"+rkxh+"】错误！材料【"+clbm+"】已出库，不能再删除，入库数："+ccprks+"，库存数："+kcsl);
						return;
					}

					ls_sql="  SELECT cksl,ckph";
					ls_sql+=" FROM jxc_ckcpxx";
					ls_sql+=" where rkph='"+rkph[i]+"' and rkxh='"+rkxh+"' and clbm='"+clbm+"' and dqbm='"+dqbm+"' and ckbh='"+ckbh+"'";
					ls_sql+=" and fkcckbz='2'";//1：出库时录入；2：负库存入库时录入
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						cksl=rs1.getDouble("cksl");
						ckph=rs1.getString("ckph");

						//修改:是否有负库存
						ls_sql=" update jxc_ckmx set sfyfkc='2',fkcs="+cksl;
						ls_sql+=" where clbm='"+clbm+"' and ckph='"+ckph+"'";//1：无负库存；2：有负库存
						ps2= conn.prepareStatement(ls_sql);
						ps2.executeUpdate();
						ps2.close();

					}
					rs1.close();
					ps1.close();

					if (ccpsl!=(kcsl+cksl))
					{
						conn.rollback();
						out.println("入库序号【"+rkxh+"】错误！材料【"+clbm+"】已出库，不能再删除，入库数："+ccpsl+"，库存数："+(kcsl+cksl));
						return;
					}
					//修改:库存数
					ls_sql=" update jxc_cljgb set ccpzsl=ccpzsl-"+ccpsl;
					ls_sql+=" where dqbm='"+dqbm+"' and clbm='"+clbm+"'";
					ps2= conn.prepareStatement(ls_sql);
					ps2.executeUpdate();
					ps2.close();
				}
				if (bfpsl!=0)
				{
					double bfprks=bfpsl-bfpfkcsl;//进入库存表数量
					if (bfprks>0 && bfpzsl<bfprks)
					{
						conn.rollback();
						out.println("错误！材料【"+clbm+"】已出库，不能再删除，入库数："+bfprks+"，库存数："+bfpzsl);
						return;
					}


					ls_sql="  SELECT sum(kcsl) kcsl";
					ls_sql+=" FROM jxc_kcb";
					ls_sql+=" where rkph='"+rkph[i]+"' and rkxh='"+rkxh+"' and clbm='"+clbm+"' and ckbh='"+ckbh+"' and zljb='1'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						kcsl=rs1.getDouble("kcsl");
					}
					rs1.close();
					ps1.close();
					if (bfprks>kcsl)
					{
						conn.rollback();
						out.println("入库序号【"+rkxh+"】错误！材料【"+clbm+"】已出库，不能再删除，入库数："+bfprks+"，库存数："+kcsl);
						return;
					}

					ls_sql="  SELECT cksl,ckph";
					ls_sql+=" FROM jxc_ckcpxx";
					ls_sql+=" where rkph='"+rkph[i]+"' and rkxh='"+rkxh+"' and clbm='"+clbm+"' and dqbm='"+dqbm+"' and ckbh='"+ckbh+"'";
					ls_sql+=" and fkcckbz='2'";//1：出库时录入；2：负库存入库时录入
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						cksl=rs1.getDouble("cksl");
						ckph=rs1.getString("ckph");

						//修改:是否有负库存
						ls_sql=" update jxc_ckmx set sfyfkc='2',fkcs="+cksl;
						ls_sql+=" where clbm='"+clbm+"' and ckph='"+ckph+"'";//1：无负库存；2：有负库存
						ps2= conn.prepareStatement(ls_sql);
						ps2.executeUpdate();
						ps2.close();

					}
					rs1.close();
					ps1.close();

					if (bfpsl!=(kcsl+cksl))
					{
						conn.rollback();
						out.println("入库序号【"+rkxh+"】错误！材料【"+clbm+"】已出库，不能再删除，入库数："+bfpsl+"，库存数："+(kcsl+cksl));
						return;
					}

					//修改:库存数
					ls_sql=" update jxc_cljgb set bfpzsl=bfpzsl-"+bfpsl;
					ls_sql+=" where dqbm='"+dqbm+"' and clbm='"+clbm+"'";
					ps2= conn.prepareStatement(ls_sql);
					ps2.executeUpdate();
					ps2.close();
				}

				ls_sql=" delete from jxc_ckcpxx";
				ls_sql+=" where rkph='"+rkph[i]+"' and rkxh='"+rkxh+"' and clbm='"+clbm+"' and dqbm='"+dqbm+"' and ckbh='"+ckbh+"'";
				ls_sql+=" and fkcckbz='2'";//1：出库时录入；2：负库存入库时录入
				ps2= conn.prepareStatement(ls_sql);
				ps2.executeUpdate();
				ps2.close();
				
				//删除库存中的入库批号
				ls_sql="delete from jxc_kcb ";
				ls_sql+=" where rkph='"+rkph[i]+"' and rkxh='"+rkxh+"' and clbm='"+clbm+"' and ckbh='"+ckbh+"'";
				ps2= conn.prepareStatement(ls_sql);
				ps2.executeUpdate();
				ps2.close();

			}
			else{// 非负库存
				if (zcpzsl<zcpsl)
				{
					conn.rollback();
					out.println("错误！材料【"+clbm+"】已出库，不能再删除，入库数："+zcpsl+"，库存数："+zcpzsl);
					return;
				}
				if (ccpzsl<ccpsl)
				{
					conn.rollback();
					out.println("错误！材料【"+clbm+"】已出库，不能再删除，入库数："+ccpsl+"，库存数："+ccpzsl);
					return;
				}
				if (bfpzsl<bfpsl)
				{
					conn.rollback();
					out.println("错误！材料【"+clbm+"】已出库，不能再删除，入库数："+bfpsl+"，库存数："+bfpzsl);
					return;
				}

				if (zcpsl!=0)
				{
					ls_sql="  SELECT kcsl";
					ls_sql+=" FROM jxc_kcb";
					ls_sql+=" where rkph='"+rkph[i]+"' and rkxh='"+rkxh+"' and clbm='"+clbm+"' and ckbh='"+ckbh+"' and zljb='1'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						kcsl=rs1.getDouble("kcsl");
					}
					rs1.close();
					ps1.close();
					if (zcpsl!=kcsl)
					{
						conn.rollback();
						out.println("入库序号【"+rkxh+"】错误！材料【"+clbm+"】已出库，不能再删除，入库数："+zcpsl+"，库存数："+kcsl);
						return;
					}

					//修改:库存数
					ls_sql=" update jxc_cljgb set zcpzsl=zcpzsl-"+zcpsl;
					ls_sql+=" where dqbm='"+dqbm+"' and clbm='"+clbm+"'";
					ps2= conn.prepareStatement(ls_sql);
					ps2.executeUpdate();
					ps2.close();
				}
				if (ccpsl!=0)
				{
					ls_sql="  SELECT kcsl";
					ls_sql+=" FROM jxc_kcb";
					ls_sql+=" where rkph='"+rkph[i]+"' and rkxh='"+rkxh+"' and clbm='"+clbm+"' and ckbh='"+ckbh+"' and zljb='2'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						kcsl=rs1.getDouble("kcsl");
					}
					rs1.close();
					ps1.close();
					if (ccpsl!=kcsl)
					{
						conn.rollback();
						out.println("入库序号【"+rkxh+"】错误！材料【"+clbm+"】已出库，不能再删除，入库数："+ccpsl+"，库存数："+kcsl);
						return;
					}

					//修改:库存数
					ls_sql=" update jxc_cljgb set ccpzsl=ccpzsl-"+ccpsl;
					ls_sql+=" where dqbm='"+dqbm+"' and clbm='"+clbm+"'";
					ps2= conn.prepareStatement(ls_sql);
					ps2.executeUpdate();
					ps2.close();
				}
				if (bfpsl!=0)
				{
					ls_sql="  SELECT kcsl";
					ls_sql+=" FROM jxc_kcb";
					ls_sql+=" where rkph='"+rkph[i]+"' and rkxh='"+rkxh+"' and clbm='"+clbm+"' and ckbh='"+ckbh+"' and zljb='3'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						kcsl=rs1.getDouble("kcsl");
					}
					rs1.close();
					ps1.close();
					if (bfpsl!=kcsl)
					{
						conn.rollback();
						out.println("入库序号【"+rkxh+"】错误！材料【"+clbm+"】已出库，不能再删除，入库数："+bfpsl+"，库存数："+kcsl);
						return;
					}

					//修改:库存数
					ls_sql=" update jxc_cljgb set bfpzsl=bfpzsl-"+bfpsl;
					ls_sql+=" where dqbm='"+dqbm+"' and clbm='"+clbm+"'";
					ps2= conn.prepareStatement(ls_sql);
					ps2.executeUpdate();
					ps2.close();
				}

				//删除库存中的入库批号
				ls_sql="delete from jxc_kcb ";
				ls_sql+=" where rkph='"+rkph[i]+"' and rkxh='"+rkxh+"' and clbm='"+clbm+"' and ckbh='"+ckbh+"'";
				ps2= conn.prepareStatement(ls_sql);
				ps2.executeUpdate();
				ps2.close();
			}

			jxc.JsJqpjcbj(conn,dqbm,clbm);
		}
		rs.close();
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