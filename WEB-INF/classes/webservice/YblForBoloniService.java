package webservice;
import ybl.common.*;
import java.sql.*;
public class YblForBoloniService {

String ls_sql=null;
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
PreparedStatement ps=null;
CommonFunction cf=new CommonFunction();
public String newOrUpdateOrder(String order_id,String kb_zt)
{
	String s="no";
	int m=0;
	int n=0;
	try {
		conn=cf.getConnection();
		ls_sql="select count(*) from jc_order_kb where order_id='"+order_id+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if(rs.next())
		{
			n=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if(n==0)
		{
		ls_sql="insert into jc_order_kb(order_id,order_kbzt) values('"+order_id+"','"+kb_zt+"') ";
		}
		if(n>0)
		{
		ls_sql="update jc_order_kb set order_kbzt='"+kb_zt+"' where order_id='"+order_id+"'";
		}
		ps= conn.prepareStatement(ls_sql);
		m=ps.executeUpdate();
		if (m!=1)
		{
			s="no";
		}
		else
		{
			s="yes";
		}
		ps.close();
		conn.close();
		
			
	}
	catch (Exception e) {
		System.out.print("Exception: " + e);
		
	}
	return s;
}


	
	
}  
	  
	 
	 
	
