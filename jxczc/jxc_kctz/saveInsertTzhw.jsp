<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ylsh=null;
String lsh=null;
String ls=null;
String tzph = request.getParameter("tzph");
String[] clbmjh =request.getParameterValues("clbm");
String[] drhwjh =request.getParameterValues("drhw");
String[] zljbjh =request.getParameterValues("zljb");
String[] kcsljh =request.getParameterValues("kcsl");
String[] drsljh =request.getParameterValues("drsl");
String[] dchjbhjh =request.getParameterValues("dchjbh");
String[] dchwbhjh =request.getParameterValues("dchwbh");
String dchjbh=null;
String dchwbh=null;
String clbm=null;
String drhw=null;
String zljb=null;
String drhjbh=null;
long dtzph=0;
double mmt=0;
double xykcsl=0;
double cum=0;
double kcsl=0;
double drsl=0;
int maxxh=0;
int nu=0;
int cct=0;
int tty=0;
String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
PreparedStatement ps2=null;
ResultSet rs2 = null;

try {
	conn=cf.getConnection();    //得到连接
	
	conn.setAutoCommit(false);
	
	try{
			if (!(tzph.equals("")))  dtzph=Long.parseLong(tzph.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>变量tzph不存在");
			conn.rollback();return;
		}
		catch (Exception e){
			out.println("<BR>[调整批号]类型转换发生意外:"+e);
			conn.rollback();return;
		}
	//查询最大序号
			ls_sql=" select MAX(tzxh) xh";
			ls_sql+=" from jxc_hjtzmx ";
			ls_sql+=" where tzph='"+tzph+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
			if (rs.next())
			{
				maxxh=rs.getInt("xh");
				
			}
			rs.close();
			ps.close();

	for (int i=0;i<clbmjh.length ;i++ )
	{
		nu++;
		clbm=clbmjh[i];
		if (clbm==null || clbm.equals(""))
		{out.println("序号【"+nu+"】材料编码不能为空！");
			conn.rollback();return;}
		
		//调出货架
		dchjbh=dchjbhjh[i];
		if (dchjbh==null || dchjbh.equals(""))
		{out.println("【"+clbm+"】调出货架不能为空！");
			conn.rollback();return;}
		
		//调出货位
		dchwbh=dchwbhjh[i];
		if (dchwbh==null || dchwbh.equals(""))
		{out.println("【"+clbm+"】调出货位不能为空！");
			conn.rollback();return;}
		
		//调入货位
		drhw=drhwjh[i];
		if (drhw==null || drhw.equals(""))
		{out.println("【"+clbm+"】调入货位不能为空！");
			conn.rollback();return;}
		
		//质量级别
		zljb=zljbjh[i];
		if (zljb==null || zljb.equals(""))
		{out.println("【"+clbm+"】质量级别不能为空！");
		conn.rollback();return;}
		
		//库存数量
		ls=kcsljh[i];
		try{
			if (!(ls.equals("")))  kcsl=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>变量kcsljh[i]不存在");
			conn.rollback();return;
		}
		catch (Exception e){
			out.println("<BR>[库存数量]类型转换发生意外:"+e);
			conn.rollback();return;
		}

		//调入数量
		ls=drsljh[i];
		try{
			if (!(ls.equals("")))  drsl=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>变量drsljh[i]不存在");
			conn.rollback();return;
		}
		catch (Exception e){
			out.println("<BR>[出库数量]类型转换发生意外:"+e);
			conn.rollback();return;
		}
		if (drsl<=0)
		{
			out.println("【"+clbm+"】调出数量必须大于零！");
			conn.rollback();return;
		}
		if (drsl>kcsl)
		{
			out.println("【"+clbm+"】调出数量不能大于库存数量！");
			conn.rollback();return;
		}
		
if (!(drhw.equals("0")) && drsl>0)//自动出库 更新出库明细
		{
			//查询货架编码
			ls_sql=" select hjbh";
			ls_sql+=" from jxc_hwmc ";
			ls_sql+=" where hwbh='"+drhw+"'";
			ps= conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
			if (rs.next())
			{
				drhjbh=cf.fillNull(rs.getString("hjbh"));
			}
			else
			{out.print("错误！！！不存在的货架编码["+drhw+"]");conn.rollback();return;}
			rs.close();
			ps.close();

			cct++;
			ls_sql=" select tzsl";
			ls_sql+=" from jxc_hjtzmx ";
			ls_sql+=" where tzph='"+tzph+"' and clbm='"+clbm+"' and drhw='"+drhw+"' and zljb='"+zljb+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
			if (rs.next())
			{
				mmt=rs.getDouble("tzsl");
				if (mmt>0)
				{
					out.print("<font clolr=\"red\">错误：第【"+nu+"】行【"+clbm+"】重复存盘！</font><br>");
					conn.rollback();return;
				}
			}
			rs.close();
			ps.close();
			
//			if (maxxh==0){maxxh=1;}
			tty=maxxh+cct;

			ls_sql="insert into jxc_hjtzmx ( tzph,tzxh,clbm,zljb,tzsl,dchj,dchw,drhj,drhw ) ";
			ls_sql+=" values ( ?,?,?,?,?,?,?,?,? ) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,dtzph);
			ps.setDouble(2,tty);
			ps.setString(3,clbm);
			ps.setString(4,zljb);
			ps.setDouble(5,drsl);
			ps.setString(6,dchjbh);
			ps.setString(7,dchwbh);
			ps.setString(8,drhjbh);
			ps.setString(9,drhw);
			if (ps.executeUpdate()!=1)
			{
				out.println("<BR>存盘失败！");
				conn.rollback();return;
			}
			else
			{
				out.print("【"+clbm+"】更新成功！<br>");
			}
			if (ps != null) ps.close();
			//将数据写入库存
			cum=drsl;
			ls_sql = " select kcsl,lsh";
			ls_sql+= " from jxc_kcb";
			ls_sql +=" where jxc_kcb.clbm='"+clbm+"' and jxc_kcb.hwbh='"+dchwbh+"' and zljb='"+zljb+"'  ";
			ls_sql +=" order by scrq ";
			ps2= conn.prepareStatement(ls_sql);
			rs2=ps2.executeQuery();
			while(rs2.next())
			{//7737
				ylsh=cf.fillNull(rs2.getString("lsh"));
				xykcsl=rs2.getDouble("kcsl");
				if (cum>0)
				{//7739
					//产生主键流水号
						ls_sql=" select lpad(NVL(max(lsh),0)+1,13,0) lsh";
						ls_sql+=" from jxc_kcb ";
						ps= conn.prepareStatement(ls_sql);
						rs=ps.executeQuery();
						if (rs.next())
						{
							lsh=rs.getString("lsh");
						}
						rs.close();
						ps.close();
					if (cum<=xykcsl)//执行插入操作 并返回
					{
						//将库存表中数据写入提货单
						ls_sql=" insert into jxc_kcb(lsh,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,gysmc,cllbbm,xh,nbbm,gg,clysbm,djzl,jldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz,clbm,zljb,clzk,rkph,ckph,scph,scrq,hwbh,hjbh,ckbh,dqbm,rkj,kcsl,kcje,jqpjcbj) ";
						ls_sql+=" select '"+lsh+"',clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,gysmc,cllbbm,xh,nbbm,gg,clysbm,djzl,jldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz,clbm,zljb,clzk,rkph,ckph,scph,scrq,'"+drhw+"','"+drhjbh+"',ckbh,dqbm,rkj,'"+cum+"',rkj*"+cum+",jqpjcbj ";
						ls_sql+=" from jxc_kcb ";
						ls_sql+=" where lsh='"+ylsh+"' ";
						ps= conn.prepareStatement(ls_sql);
						if (ps.executeUpdate()!=1)
						{
							out.println("<BR>存盘失败！1");
							conn.rollback();return;
						}
						else
						{
							out.print("【"+clbm+"】更新库存成功！<br>");
						}
						if (ps != null) ps.close();
						//更新库存数据
						ls_sql=" update jxc_kcb set kcsl=kcsl-"+cum+",kcje=(kcsl-"+cum+")*rkj ";
						ls_sql+=" where  lsh='"+ylsh+"' ";
						ps= conn.prepareStatement(ls_sql);
						if (ps.executeUpdate()!=1)
						{
							out.println("<BR>存盘失败！1");
							conn.rollback();return;
						}
						else
						{
							out.print("更新库存成功！<br>");
						}
						if (ps != null) ps.close();
						cum=0;
					}
					else//执行插入 不返回
					{
						cum=cum-xykcsl;
						//更新库存数据
						ls_sql=" update jxc_kcb set hjbh='"+drhjbh+"',hwbh='"+drhw+"' ";
						ls_sql+=" where  lsh='"+ylsh+"' ";
						ps= conn.prepareStatement(ls_sql);
						if (ps.executeUpdate()!=1)
						{
							out.println("<BR>存盘失败！1");
							conn.rollback();return;
						}
						else
						{
							out.print("更新库存成功！<br>");
						}
						if (ps != null) ps.close();
					}
				}//7739
			}//7737
			rs2.close();
			ps2.close();
			if (cum>0)//如果全部循环完 这个值还大于零 那么说明出库数量>库存 
			{
				out.print("错误！库存数量不足！！！");
				conn.rollback();return;
			}
			//将库存中数量为零的记录清除掉
			ls_sql="delete from jxc_kcb ";
			ls_sql+=" where kcsl=0 ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
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
	out.print("<BR>ls_sql=" + ls_sql );
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

