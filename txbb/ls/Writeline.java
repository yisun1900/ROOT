package ybl.common;

import ybl.card.*;
import java.sql.*;
import java.io.*;
import java.util.*;
import javax.servlet.jsp.JspWriter;
import ybl.sql.connection.*;

public class Writeline
{
	private ConnectionManager s_connmgr; //Tomcat的连接池变量
	private String poolName;//连接池名称
/*************************************************************************
/*功能：构造函数，初始化：s_connmgr、poolName
/*输入：
/*返回：
/************************************************************************/
	public Writeline()
	{
		poolName="search".substring(0,6);
		s_connmgr = ConnectionManager.getInstance();
	}

/*************************************************************************
/*功能：获得数据库连接，连接池名称连接为：poolName
/*输入：
/*返回：获得的数据库连接实例
/************************************************************************/
	public Connection getConnection() throws Exception
	{
		Connection conn  = null;
		try
		{
			conn=s_connmgr.getConnection(poolName.substring(0,poolName.length()));    //得到连接
			return conn;
		}
		catch (Exception e)
		{
			System.out.println("CommonFunction.getConnection Exception:"+e);
			throw e;
		}
	}
/*************************************************************************
/*功能：关闭数据库连接，连接池名称连接为：poolName
/*输入： conn：要关闭的数据库连接
/*返回：
/************************************************************************/
	public void close(Connection conn)//释放连接
    {
		if ((conn!= null)&&(s_connmgr!=null)) s_connmgr.freeConnection(poolName,conn);    
    }
/*************************************************************************
/*功能：获得数据库连接
/*输入： poolName：连接池名称
/*返回：获得的数据库连接实例
/************************************************************************/
	public Connection getConnection(String poolName) throws Exception
	{
		Connection conn  = null;
		try
		{
			conn=s_connmgr.getConnection(poolName.substring(0,poolName.length()));    //得到连接
			return conn;
		}
		catch (Exception e)
		{
			System.out.println("CommonFunction.getConnection Exception:"+e);
			throw e;
		}
	}
    
/*************************************************************************
/*功能：关闭数据库连接
/*输入：     conn：要关闭的数据库连接
/*输入： poolName：连接池名称
/*返回：
/************************************************************************/
	public void close(String poolName, Connection conn)//释放连接
    {
		if ((conn!= null)&&(s_connmgr!=null)) s_connmgr.freeConnection(poolName,conn);    
    }
	
	public boolean isNull(Object GB) {
		if (GB==null){
			return true;
		}
		else{
			return false;
		}
	}
/****************************************************************
*输出VML基本图形，根据SQL显示报表
*把结果以input的形式输出到界面上 供javaScript调用
*****************************************************************/
	public ArrayList writeLine(String sql,String txfs) throws Exception
	{
		ArrayList<String> vmlgroup=new ArrayList<String>();
		Connection conn  = null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String listname=null;
		String listsj=null;
		String listsl=null;
		try
		{
			conn=getConnection();
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery();

			int i=0;
			String linetablemc="";
			String linetablesj="";
			String linetabsize="";
			String scriptlist="";
			String vmldiv="<html xmlns:v=\"urn:schemas-microsoft-com:vml\"><STYLE>v\\:* { BEHAVIOR: url(#default#VML)}</STYLE><DIV ID=\"ybllinehead\"></DIV><DIV ID=\"ybllinetab\">正在读取数据,请稍后......</DIV>";
			vmlgroup.add(vmldiv);
			//生成VML文件头,以及容器
			while (rs.next())
			{
				linetablemc=rs.getString(1);
				linetablesj=rs.getString(2);
				if (linetablesj==null || linetablesj.equals(""))
				{
					continue;
				}
				listname = "<input type=\"hidden\" name=\"ybllylinetabxsmc\" value=\""+linetablemc+"\">";
				vmlgroup.add(listname);
				//返回数据的名称
				listsj = "<input type=\"hidden\" name=\"ybllylinetabxssj\" value=\""+linetablesj+"\">";
				vmlgroup.add(listsj);
				//返回数据的集合
			i++;
			}
			linetabsize=String.valueOf(i);
			listsl = "<input type=\"hidden\" name=\"ybllylinetabxssl\" value=\""+linetabsize+"\">";
			vmlgroup.add(listsl);
			//数据的个数
			if (txfs.equals("1"))//1:线图;2:柱图;3:饼图;
			{
				scriptlist="<SCRIPT language=javascript src=\"/js/linetab.js\"></SCRIPT>";
			}
			else if (txfs.equals("2"))//1:线图;2:柱图;3:饼图;
			{
				scriptlist="<SCRIPT language=javascript src=\"/js/Recttab.js\"></SCRIPT>";
			}
			vmlgroup.add(scriptlist);
			return vmlgroup;
		}
		catch (Exception e)
		{
			System.out.println(e);
			throw new Exception(e.getMessage());
		}
		finally 
		{
			try{
				if (rs!= null) rs.close(); 
				if (ps!= null) ps.close(); 
				if (conn != null) close(conn); 
			}
			catch (Exception e){
				if (conn != null) close(conn); 
				throw new Exception(e.getMessage());
			}
		}

	}
};