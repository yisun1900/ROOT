package dxxt;

import java.io.*;
import java.util.*;
import ybl.common.CommonFunction;
import java.sql.*;

public class FSDX
{
	static String url=null;						//������ַ
	static String yeurl=null;					//��ѯ�����ַ
	static String username=null;				//�û���
	static String password=null;				//����

	CommonFunction cf;
	public FSDX ()								//���캯����ȡ�����ļ�
	{
		cf = new CommonFunction(); 
		try
		{
			//��ȡ�ⲿ�����ļ�
			java.io.InputStream ls = getClass().getResourceAsStream("Server.ini");
			Properties dbProps = new Properties();
            dbProps.load(ls);
			url = dbProps.getProperty("url");
			yeurl = dbProps.getProperty("yeurl");
			username = dbProps.getProperty("username");
			password = dbProps.getProperty("password");
		}
		catch(Exception e){
			System.out.println("��ȡ�����ļ�����:"+e.getMessage());
		}
	}
	//��ʱ���ŷ��ͳ���
	public String jsdxfs(String destPhone,String content,String yhdlm,String dxfsfs)//�������� content ��������
	{
		String	UTFcontent=null;
		String	sURL="";
		String  sCurrentLine   =   "";   
		String  sTotalString   =   ""; 
		String[] sjhm=null;
		String[] fhjg=null;
		String sxurl="";
		String sjg=null;
		String fhStr="";
		try
		{
//		try//����ת���ɱ����ʽ
//		{
//		UTFcontent=java.net.URLEncoder.encode(content,"UTF-8");
//		}
//		catch (Exception e)
//		{
//			System.out.println("�ַ�ת������:"+e.getMessage());
//		}
		if (url==null || url=="")
			{
				fhStr=fhStr+"�����ļ���ʧ!..........<br>";
			}
		UTFcontent=content;
		sjhm=destPhone.split(",");//�����ݹ����Ĳ����ָ������
		
		for (int i=0;i<sjhm.length;i++ )//Ϊ�˱���ͻ����͵�����̫��,ϵͳ����ѭ�����͵ķ�ʽ
		{
//		sURL="http://203.171.239.142:86/sms/send.aspx?username=ybl&password=ybl3721&mos="+sjhm[i].trim()+"&msg="+UTFcontent;
		sURL=url+"username="+username+"&password="+password+"&mos="+sjhm[i].trim()+"&msg="+UTFcontent;
		
		java.net.URL   l_url   =   new   java.net.URL(sURL);   
		java.net.HttpURLConnection   l_connection   =   (java.net.HttpURLConnection)   l_url.openConnection();   
		l_connection.connect();   
			java.io.InputStream l_urlStream   =   l_connection.getInputStream();   
			java.io.BufferedReader   l_reader   =   new   java.io.BufferedReader(new   java.io.InputStreamReader(l_urlStream));   
			while   ((sCurrentLine = l_reader.readLine())!=null)   
			{   
				  sTotalString+=sCurrentLine;   
			}
			fhjg=sTotalString.split(";");
			if (sTotalString==null || sTotalString=="")
			{
				fhStr=fhStr+"����:["+sjhm[i]+"]����ʧ��,�޷���ֵ!���������ļ����������Ƿ�ͨ!..........<br>";
			}
			else if (!(fhjg[0].equals("0")))//0:�ӿ�����ʧ��
			{
				fhStr=fhStr+"����:["+sjhm[i]+"] "+fhjg[1]+" <font color='red'>����ʧ��!..........</font><br>";
			}

			else//���ӳɹ�,�ɹ�����
			{ 
				if (fhjg.length>=4)
				{
					// 1 ����ɹ�
					//-1 ���벻�Ϸ�
					//-2 ������
					if (fhjg[3]!=null && fhjg[3]!="" && fhjg[3].equals("2,"))
					{
						fhStr=fhStr+"����:["+sjhm[i]+"] "+fhjg[1]+" <font color='red'>���벻�Ϸ�,����ʧ��</font><br>";
					}
					else if (fhjg[3]!=null && fhjg[3]!="" && fhjg[3].equals("1,"))
					{
						if (dxfsfs.equals("1"))//���ͼ�ʱ���� Ϊ�Ժ��Ͷ�ʱ�������½ӿ�
							{
								sjg=jssavesql(sjhm[i],UTFcontent,yhdlm,dxfsfs);//1:��ʱ����;0:��ʱ����
								if (sjg.equals("1"))//�ж�д�����ݿ��Ƿ�ɹ�
								{
									fhStr=fhStr+"����:["+sjhm[i]+"] "+fhjg[1]+" <font color='blue'>д�����ݿ�ɹ�!</font><br>";
								}
								else {fhStr=fhStr+"����:["+sjhm[i]+"] "+fhjg[1]+" <font color='yellow'>д�����ݿ�ʧ��!</font><br>";}
							}
					}
					else 
					{
						fhStr=fhStr+"����:["+sjhm[i]+"] "+sTotalString+" <font color='red'>����ʧ��,�����˵���ĵ�,�鿴����ԭ��!</font><br>";
					}
				}
				else 
				{
					if (dxfsfs.equals("1"))//���ͼ�ʱ���� Ϊ�Ժ��Ͷ�ʱ�������½ӿ�
					{
						sjg=jssavesql(sjhm[i],UTFcontent,yhdlm,dxfsfs);//1:��ʱ����;0:��ʱ����
						if (sjg.equals("1"))//�ж�д�����ݿ��Ƿ�ɹ�
						{
							fhStr=fhStr+"����:["+sjhm[i]+"] "+fhjg[1]+" <font color='blue'>д�����ݿ�ɹ�!</font><br>";
						}
						else {fhStr=fhStr+"����:["+sjhm[i]+"] "+fhjg[1]+" <font color='yellow'>д�����ݿ�ʧ��!</font><br>";}
					}
				}
			}
			sTotalString="";//������ֶ����,����for�´�ѭ���ļ��
		}
	}
	catch (Exception e)
	{
		System.out.println("���쳣:"+e.getMessage());
		fhStr+="���쳣:"+e.getMessage();
	}
	return fhStr;

	}
	//��ʱ����д�����ݿ�
	public String jssavesql (String dh,String nr,String fsr,String fs) throws Exception//dh �绰���� nr �������� fs ���ͷ�ʽ:1.��ʱ����0.��ʱ����
	{
	String ccjg="1";//0:ʧ��,1:�ɹ�
	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String ls_sql=null;
	String xh=null;
	try {
		conn=cf.getConnection();
		conn.setAutoCommit(false);
		
		ls_sql=" select lpad(NVL(sum(xh)+1,1),11,0) xh ";
		ls_sql+=" from dx_yfdx";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xh=rs.getString("xh");//���
		}
		rs.close();
		ps.close();
		
		ls_sql="insert into dx_yfdx (xh,jshm,fcsj,fsr,fsfs,fsjg,dxnr) ";
		ls_sql+=" values ( ?,?,SYSDATE,?,?,'1',?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,xh);
		ps.setString(2,dh);
		ps.setString(3,fsr);
		ps.setString(4,fs);
		ps.setString(5,nr);
		ps.executeUpdate();
		ps.close();

		conn.commit();
		}
		catch (Exception e) {
		conn.rollback();
		ccjg="0";
		throw e;
		}
		finally 
		{
			conn.setAutoCommit(true);
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
		return ccjg;
	}
	//��ѯ��� ֱ�ӷ������ֵ
	public String cxye()
	{
		
		String dxye="";
		String csCurrentLine=null;
		String csURL=null;
		if (url==null || url=="")
			{
				dxye="�����ļ���ʧ!..........<br>";
				return dxye;
			}
		csURL=yeurl+"username="+username+"&password="+password;
		try
		{
		java.net.URL   cs_url   =   new   java.net.URL(csURL);   
		java.net.HttpURLConnection   cs_connection   =   (java.net.HttpURLConnection)   cs_url.openConnection();   
		cs_connection.connect();   
			java.io.InputStream cs_urlStream   =   cs_connection.getInputStream();   
			java.io.BufferedReader   cs_reader   =   new   java.io.BufferedReader(new java.io.InputStreamReader(cs_urlStream));   
			while   ((csCurrentLine = cs_reader.readLine())!=null)   
			{   
				  dxye+=csCurrentLine;   
			}
		}
		catch (Exception e)
		{
			System.out.println("���쳣:"+e.getMessage());
		}
		return dxye;
	}
//	public static void main(String args[])
//	{
//		String ssss=DXSX("13811428939","���Ų���111","yangzi","0");
//		System.out.print(ssss);
//	}
}