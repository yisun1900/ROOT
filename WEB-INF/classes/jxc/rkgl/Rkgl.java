package jxc.rkgl;

import java.io.*;
import ybl.common.CommonFunction;
import java.sql.*;

public class Rkgl
{
//材料入库
	public String clrk (String rkph,String dqbm,String ckbh,String hjbh) throws Exception//rkph：入库批号；dqbm：地区编码；ckbh：仓库编号；hjbh：货架编号；
	{
	CommonFunction cf;
	cf = new CommonFunction();
	int rksl=0;//记录成功入库的数量
	String restr="";
	String lsh=null;
	String clbm=null;
	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	PreparedStatement ps2=null;
	ResultSet rs2=null;
	PreparedStatement ps3=null;
	ResultSet rs3=null;
	String ls_sql=null;
	String xh=null;
	try {
		conn=cf.getConnection();
		conn.setAutoCommit(false);
		//检查库存中是否有货 
		ls_sql=" select clbm";
		ls_sql+=" from jxc_rkmx ";
		ls_sql+=" where  rkph='"+rkph+"' ";
		//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		while (rs.next())
		{
			clbm=rs.getString("clbm");
			ls_sql=" select clbm ";
			ls_sql+=" from jxc_kcb ";
			ls_sql+=" where  clbm='"+clbm+"' and hjbh='"+hjbh+"' ";
			ps2= conn.prepareStatement(ls_sql);
			rs2=ps2.executeQuery();
			if (rs2.next())//库存有货 直接更新数量
			{
				//更新 库存数量 库存金额 库存金额来自入库单入库价乘以入库数量
				ls_sql="update jxc_kcb set kcsl=kcsl+(select rksl from jxc_rkmx where clbm='"+clbm+"' and rkph='"+rkph+"'),kcje=kcje+(select rksl*rkj from jxc_rkmx where clbm='"+clbm+"' and rkph='"+rkph+"') ";
				ls_sql+=" where  (clbm='"+clbm+"') and  (hjbh="+hjbh+")  ";
				ps3= conn.prepareStatement(ls_sql);
				if (ps3.executeUpdate()!=1)
				{
					restr="<BR>存盘失败！"+ls_sql;
					return restr;
				}
				//更新成本单价
				ls_sql="update jxc_kcb set cbj=round(kcje/kcsl,2) ";
				ls_sql+=" where  (clbm='"+clbm+"') and  (hjbh="+hjbh+") ";
				ps3= conn.prepareStatement(ls_sql);
				if (ps3.executeUpdate()!=1)
				{
					restr="<BR>存盘失败！"+ls_sql;
					return restr;
				}
				else
				{rksl++;}
			}
			else //库存中没有 产生新的编号
			{
				//产生主键流水号
				ls_sql=" select lpad(NVL(max(lsh),0)+1,13,0) lsh";
				ls_sql+=" from jxc_kcb ";
	//			ls_sql+=" where  clbm='"+clbm+"' and hjbh='"+hjbh+"' ";
				ps3= conn.prepareStatement(ls_sql);
				rs3=ps3.executeQuery();
				if (rs3.next())//库存有货 直接更新数量
				{
					lsh=rs3.getString("lsh");
				}
				rs3.close();
				ps3.close();
				//将库存表中不存在的数据写入
				ls_sql=" insert into jxc_kcb(lsh,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,cllbbm,xh,gg,clysbm,jldwbm,sfbhpj,pjts,sfyh,cpjb,fgsx,cpsm,cd,zp,cgzq,bz,clbm,hjbh,ckbh,dqbm,cbj,kcsl,kcje) ";
				ls_sql+=" select '"+lsh+"',clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,cllbbm,xh,gg,clysbm,jldwbm,sfbhpj,pjts,sfyh,cpjb,fgsx,cpsm,cd,zp,cgzq,bz,jxc_rkmx.clbm,'"+hjbh+"','"+ckbh+"','"+dqbm+"',rkj,rksl,round(rkj*rksl,2) ";
				ls_sql+=" from jxc_rkmx,jxc_clbm ";
				ls_sql+=" where jxc_rkmx.clbm=jxc_clbm.clbm and jxc_rkmx.clbm='"+clbm+"'  and jxc_rkmx.rkph='"+rkph+"'";
				ps3= conn.prepareStatement(ls_sql);
				if (ps3.executeUpdate()!=1)
				{
					restr="<BR>存盘失败！"+ls_sql;
					return restr;
				}
				else
				{rksl++;}
			}
			rs2.close();
			ps2.close();		
		}
		rs.close();
		ps.close();
		//更新入库单状态
		ls_sql="update jxc_rkd set rkdzt='3' ";
		ls_sql+=" where  (rkph='"+rkph+"')";
		ps2= conn.prepareStatement(ls_sql);
		if (ps2.executeUpdate()!=1)
		{
			restr="<BR>存盘失败！"+ls_sql;
			return restr;
		}
		conn.commit();
		restr="入库成功："+rksl+"种材料数据已更新！";
		}
		catch (Exception e) {
		conn.rollback();
		throw e;
		}
		finally 
		{
			conn.setAutoCommit(true);
			try{
				if (rs != null) rs.close(); 
				if (ps != null) ps.close(); 
				if (rs2 != null) rs2.close(); 
				if (ps2 != null) ps2.close();
				if (rs3 != null) rs3.close(); 
				if (ps3 != null) ps3.close();
				if (conn != null) cf.close(conn); 
			}
			catch (Exception e){
				if (conn != null) cf.close(conn); 
				throw e;
			}
		}
		return restr;
	}


//删除材料入库单
	public String scrkd (String rkph,String dqbm,String ckbh,String hjbh) throws Exception//rkph：入库批号；dqbm：地区编码；ckbh：仓库编号；hjbh：货架编号；
	{
	CommonFunction cf;
	cf = new CommonFunction();
	int czsl=0;
	int rksl=0;
	int kcsl=0;
	double rkzje=0;
	String restr="";
	String clbm=null;
	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	PreparedStatement ps2=null;
	ResultSet rs2=null;
	PreparedStatement ps3=null;
	ResultSet rs3=null;
	String ls_sql=null;
	String xh=null;
	try {
		conn=cf.getConnection();
		conn.setAutoCommit(false);

		//检查库存中材料是否大于库存，如果小于则说明已经销售 不能删除入库单
		ls_sql=" select clbm,rksl,rkzje";
		ls_sql+=" from jxc_rkmx,jxc_rkd ";
		ls_sql+=" where jxc_rkmx.rkph=jxc_rkd.rkph and jxc_rkmx.rkph='"+rkph+"' ";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		while (rs.next())
		{
			clbm=rs.getString("clbm");
			rksl=rs.getInt("rksl");
			rkzje=rs.getDouble("rkzje");

			ls_sql=" select kcsl";
			ls_sql+=" from jxc_kcb ";
			ls_sql+=" where clbm='"+clbm+"' and ckbh='"+ckbh+"' and hjbh='"+hjbh+"'  ";
		//	out.println(ls_sql);
			ps2= conn.prepareStatement(ls_sql);
			rs2=ps2.executeQuery();
			if (rs2.next())
			{
				kcsl=rs2.getInt("kcsl");
			}
			rs2.close();
			ps2.close();
			if (kcsl>=rksl)//库存大于入库 可以删除
			{
				//修改库存数量 库存金额
				ls_sql="update jxc_kcb set kcsl=kcsl-"+rksl+",kcje=kcje-(select rksl*rkj from jxc_rkmx where clbm='"+clbm+"' and rkph='"+rkph+"')";
				ls_sql+=" where  (clbm='"+clbm+"') and  (hjbh="+hjbh+")  ";
				ps3= conn.prepareStatement(ls_sql);
				if (ps3.executeUpdate()!=1)
				{
					restr="<BR>存盘失败！"+ls_sql;
					return restr;
				}
				else
				{czsl++;}
			}
			else
			{
				restr="不能删除：<br>1.可能货架选择错误！<br>2.可能部分材料已经销售或者出库，导致库存数量不足！";
				return restr;
			}
		}
		rs.close();
		ps.close();
		//更新入库单状态
		ls_sql="update jxc_rkd set rkdzt='2' ";
		ls_sql+=" where  (rkph='"+rkph+"')";
		ps2= conn.prepareStatement(ls_sql);
		if (ps2.executeUpdate()!=1)
		{
			restr="更新入库单失败！";
			return restr;
		}		
		conn.commit();
		restr="删除成功："+czsl+"种材料数据已更新！";
		}
		catch (Exception e) {
		conn.rollback();
		throw e;
		}
		finally 
		{
			conn.setAutoCommit(true);
			try{
				if (rs != null) rs.close(); 
				if (ps != null) ps.close(); 
				if (rs2 != null) rs2.close(); 
				if (ps2 != null) ps2.close();
				if (rs3 != null) rs3.close(); 
				if (ps3 != null) ps3.close();
				if (conn != null) cf.close(conn); 
			}
			catch (Exception e){
				if (conn != null) cf.close(conn); 
				throw e;
			}
		}
		return restr;
	}
}