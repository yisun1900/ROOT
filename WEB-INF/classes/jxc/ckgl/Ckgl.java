package jxc.ckgl;

import java.io.*;
import ybl.common.CommonFunction;
import java.sql.*;

public class Ckgl
{
//材料出库
	public String clck (String ckph) throws Exception//ckph 出库批号
	{
	CommonFunction cf;
	cf = new CommonFunction();
	int czsl=0;//记录成功出库的数量
	String restr="";
	String lsh=null;
	String clbm=null;
	String dqbm=null;
	String ckbh=null;
	String hjbh=null;
	int sykc=0;//剩余库存
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
		//检查库存数量是否符合出库条件
		ls_sql=" select dqbm,ckbh,hjbh ";
		ls_sql+=" from jxc_ckd ";
		ls_sql+=" where ckph='"+ckph+"' ";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			dqbm=cf.fillNull(rs.getString("dqbm"));
			ckbh=cf.fillNull(rs.getString("ckbh"));
			hjbh=cf.fillNull(rs.getString("hjbh"));
		}
		rs.close();
		ps.close();

		ls_sql=" select kcsl-cksl sykc,jxc_ckmx.clbm clbm ";
		ls_sql+=" from jxc_ckmx,jxc_kcb ";
		ls_sql+=" where jxc_ckmx.ckph='"+ckph+"' and jxc_ckmx.clbm=jxc_kcb.clbm and jxc_kcb.dqbm='"+dqbm+"' and jxc_kcb.ckbh='"+ckbh+"' and jxc_kcb.hjbh='"+hjbh+"' ";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		while (rs.next())
		{
			clbm=cf.fillNull(rs.getString("clbm"));
			sykc=rs.getInt("sykc");
			if (sykc<0)
			{
				restr="错误！材料【"+clbm+"】库存数量不足！";
				return restr;
			}
			else
			{
				//更新库存数量，库存总金额
				ls_sql="update jxc_kcb set kcsl="+sykc+",kcje=cbj*"+sykc+" ";
				ls_sql+=" where  jxc_kcb.clbm='"+clbm+"' and jxc_kcb.dqbm='"+dqbm+"' and jxc_kcb.ckbh='"+ckbh+"' and jxc_kcb.hjbh='"+hjbh+"'   ";
				ps2= conn.prepareStatement(ls_sql);
				if (ps2.executeUpdate()!=1)
				{
					restr="<BR>更新库存失败！";
					return restr;
				}
				else
				{czsl++;}
			}
		}
		rs.close();
		ps.close();
	
		//修改出库单状态，出库单金额
		ls_sql="update jxc_ckd set ckdzt='9',ckzje=(select sum(ckj*cksl) from jxc_ckmx where ckph='"+ckph+"') ";
		ls_sql+=" where  (ckph='"+ckph+"')  ";
		ps= conn.prepareStatement(ls_sql);
		if (ps.executeUpdate()!=1)
		{
			restr="<BR>更新出库单状态失败！";
			return restr;
		}
		else
		{
			restr="出库成功："+czsl+"种材料数据已更新！";
	
		}
		conn.commit();
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
//删除出库单
	public String scckd (String ckph) throws Exception//ckph 出库批号
	{
	CommonFunction cf;
	cf = new CommonFunction();
	int czsl=0;//记录成功出库的数量
	String restr="";
	String lsh=null;
	String clbm=null;
	String dqbm=null;
	String ckbh=null;
	String hjbh=null;
	int sykc=0;//剩余库存
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
		//检查库存数量是否符合出库条件
		ls_sql=" select dqbm,ckbh,hjbh ";
		ls_sql+=" from jxc_ckd ";
		ls_sql+=" where ckph='"+ckph+"' ";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			dqbm=cf.fillNull(rs.getString("dqbm"));
			ckbh=cf.fillNull(rs.getString("ckbh"));
			hjbh=cf.fillNull(rs.getString("hjbh"));
		}
		rs.close();
		ps.close();

		ls_sql=" select kcsl+cksl sykc,jxc_ckmx.clbm clbm ";
		ls_sql+=" from jxc_ckmx,jxc_kcb ";
		ls_sql+=" where jxc_ckmx.ckph='"+ckph+"' and jxc_ckmx.clbm=jxc_kcb.clbm and jxc_kcb.dqbm='"+dqbm+"' and jxc_kcb.ckbh='"+ckbh+"' and jxc_kcb.hjbh='"+hjbh+"' ";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		while (rs.next())
		{
			clbm=cf.fillNull(rs.getString("clbm"));
			sykc=rs.getInt("sykc");
			if (sykc<0)
			{
				restr="错误！材料【"+clbm+"】库存数量不足！";
				return restr;
			}
			else
			{
				//更新库存数量，库存总金额
				ls_sql="update jxc_kcb set kcsl="+sykc+",kcje=cbj*"+sykc+" ";
				ls_sql+=" where  jxc_kcb.clbm='"+clbm+"' and jxc_kcb.dqbm='"+dqbm+"' and jxc_kcb.ckbh='"+ckbh+"' and jxc_kcb.hjbh='"+hjbh+"'   ";
				ps2= conn.prepareStatement(ls_sql);
				if (ps2.executeUpdate()!=1)
				{
					restr="<BR>更新库存失败！";
					return restr;
				}
				else
				{czsl++;}
			}
		}
		rs.close();
		ps.close();
	
		//修改出库单状态，出库单金额
		ls_sql="update jxc_ckd set ckdzt='0',ckzje=(select sum(ckj*cksl) from jxc_ckmx where ckph='"+ckph+"') ";
		ls_sql+=" where  (ckph='"+ckph+"')  ";
		ps= conn.prepareStatement(ls_sql);
		if (ps.executeUpdate()!=1)
		{
			restr="<BR>更新出库单状态失败！";
			return restr;
		}
		else
		{
			restr="删除出库成功："+czsl+"种材料数据已更新！";
	
		}
		conn.commit();
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