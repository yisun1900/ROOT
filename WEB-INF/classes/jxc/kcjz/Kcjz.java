package jxc.kcjz;

import java.io.*;
import ybl.common.CommonFunction;
import java.sql.*;
//0:未结转；1：已结转
public class Kcjz
{
	public String cxkcjz (String ckbh) throws Exception
	{
	String sfjz="1";
	String sfcx="Y";
	int count=0;
	String ls_sql=null;
	CommonFunction cf;
	cf = new CommonFunction();
	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	try {
		conn=cf.getConnection();
//		conn.setAutoCommit(false);
		//检查库存数与提货单是否有货
		ls_sql=" select count(*) ";
		ls_sql+=" from jxc_kcb ";
		ls_sql+=" where ckbh='"+ckbh+"' ";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>=1)
		{
		sfcx="Y";
		}
		else
		{sfcx="N";}

		if (sfcx.equals("N"))
		{		
			ls_sql=" select count(*) ";
			ls_sql+=" from jxc_ckthd ";
			ls_sql+=" where ckbh='"+ckbh+"' ";
		//	out.println(ls_sql);
			ps= conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();
			if (count>=1)
			{
			sfcx="Y";
			}
			else
			{sfcx="N";}
		}

		
		if (sfcx.equals("Y"))
		{
			ls_sql=" select count(*) ";
			ls_sql+=" from jxc_kcjz ";
			ls_sql+=" where ckbh='"+ckbh+"' and to_char(jzrq,'YYYY-MM')=to_char((add_months(SYSDATE,-1)),'YYYY-MM') ";
		//	out.println(ls_sql);
			ps= conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);
				if (count>=1)
				{
				sfjz="1";
				}
				else
				{sfjz="0";}
			}
			rs.close();
			ps.close();
		}

		}
		catch (Exception e) {
		throw e;
		}
		finally 
		{
			try{
				if (rs != null) rs.close(); 
				if (ps != null) ps.close(); 
				if (conn != null) cf.close(conn); 
			}
			catch (Exception e){
				if (conn != null) cf.close(conn); 
				throw e;
			}
		}
	return sfjz;
	}
}