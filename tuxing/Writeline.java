package ybl.common;

import ybl.card.*;
import java.sql.*;
import java.io.*;
import java.util.*;
import javax.servlet.jsp.JspWriter;
import ybl.sql.connection.*;

public class Writeline
{
	private ConnectionManager s_connmgr; //Tomcat�����ӳر���
	private String poolName;//���ӳ�����
/*************************************************************************
/*���ܣ����캯������ʼ����s_connmgr��poolName
/*���룺
/*���أ�
/************************************************************************/
	public Writeline()
	{
		poolName="search".substring(0,6);
		s_connmgr = ConnectionManager.getInstance();
	}

/*************************************************************************
/*���ܣ�������ݿ����ӣ����ӳ���������Ϊ��poolName
/*���룺
/*���أ���õ����ݿ�����ʵ��
/************************************************************************/
	public Connection getConnection() throws Exception
	{
		Connection conn  = null;
		try
		{
			conn=s_connmgr.getConnection(poolName.substring(0,poolName.length()));    //�õ�����
			return conn;
		}
		catch (Exception e)
		{
			System.out.println("CommonFunction.getConnection Exception:"+e);
			throw e;
		}
	}
/*************************************************************************
/*���ܣ��ر����ݿ����ӣ����ӳ���������Ϊ��poolName
/*���룺 conn��Ҫ�رյ����ݿ�����
/*���أ�
/************************************************************************/
	public void close(Connection conn)//�ͷ�����
    {
		if ((conn!= null)&&(s_connmgr!=null)) s_connmgr.freeConnection(poolName,conn);    
    }
/*************************************************************************
/*���ܣ�������ݿ�����
/*���룺 poolName�����ӳ�����
/*���أ���õ����ݿ�����ʵ��
/************************************************************************/
	public Connection getConnection(String poolName) throws Exception
	{
		Connection conn  = null;
		try
		{
			conn=s_connmgr.getConnection(poolName.substring(0,poolName.length()));    //�õ�����
			return conn;
		}
		catch (Exception e)
		{
			System.out.println("CommonFunction.getConnection Exception:"+e);
			throw e;
		}
	}
    
/*************************************************************************
/*���ܣ��ر����ݿ�����
/*���룺     conn��Ҫ�رյ����ݿ�����
/*���룺 poolName�����ӳ�����
/*���أ�
/************************************************************************/
	public void close(String poolName, Connection conn)//�ͷ�����
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
*���VML����ͼ�Σ�����SQL��ʾ����
*�ѽ����input����ʽ����������� ��javaScript����
*****************************************************************/
	public ArrayList writeLine(String sql,String txfs) throws Exception
	{
		ArrayList<String> vmlgroup=new ArrayList<String>();
		Connection conn  = null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String listsl=null;
		String sqlsjlistarray="";//�����������
		String sqlmclistarray="";//������ݵ�����
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
			String vmldiv="<html xmlns:v=\"urn:schemas-microsoft-com:vml\"><STYLE>v\\:* { BEHAVIOR: url(#default#VML)}</STYLE><DIV ID=\"ybllinehead\"></DIV><DIV ID=\"ybllinetab\">���ڶ�ȡ����,���Ժ�......</DIV>";
			vmlgroup.add(vmldiv);
			//����VML�ļ�ͷ,�Լ�����
			while (rs.next())
			{
				linetablemc=rs.getString(1);
				linetablesj=rs.getString(2);
				if (linetablesj==null || linetablesj.equals(""))
				{
					//continue;
					linetablesj="0";
				}
				if (i==0)
				{
					sqlsjlistarray+=linetablesj;
					sqlmclistarray+=linetablemc;
				}
				else
				{
				sqlsjlistarray+=","+linetablesj;
				sqlmclistarray+=","+linetablemc;
				}
			i++;
			}
			linetabsize=String.valueOf(i);
			//���ݵĸ���
			if (txfs.equals("1"))//1:��ͼ;2:��ͼ;3:��ͼ;
			{
				scriptlist="<SCRIPT language=javascript src=\"/js/linetab.js\"></SCRIPT>";
				scriptlist+="<SCRIPT language=javascript>";
				scriptlist+="init('"+sqlsjlistarray+"','"+sqlmclistarray+"','"+linetabsize+"')";
				scriptlist+="</SCRIPT>";
			}
			else if (txfs.equals("2"))//1:��ͼ;2:��ͼ;3:��ͼ;
			{
				scriptlist="<SCRIPT language=javascript src=\"/js/Recttab.js\"></SCRIPT>";
				scriptlist+="<SCRIPT language=javascript>";
				scriptlist+="init('"+sqlsjlistarray+"','"+sqlmclistarray+"','"+linetabsize+"')";
				scriptlist+="</SCRIPT>";
			}
			else if (txfs.equals("3"))//1:��ͼ;2:��ͼ;3:��ͼ;
			{
				scriptlist="<SCRIPT language=javascript src=\"/js/pietab.js\"></SCRIPT>";
				scriptlist+="<SCRIPT language=javascript>";
				scriptlist+="init('"+sqlsjlistarray+"','"+sqlmclistarray+"','"+linetabsize+"')";
				scriptlist+="</SCRIPT>";
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