package dxxt;

import java.io.*;
import java.util.*;
import ybl.common.CommonFunction;
import java.sql.*;

public class FSDX
{
	static String url=null;						//短信网址
	static String yeurl=null;					//查询余额网址
	static String username=null;				//用户名
	static String password=null;				//密码

	CommonFunction cf;
	public FSDX ()								//构造函数读取配置文件
	{
		cf = new CommonFunction(); 
		try
		{
			//读取外部配置文件
			java.io.InputStream ls = getClass().getResourceAsStream("Server.ini");
			Properties dbProps = new Properties();
            dbProps.load(ls);
			url = dbProps.getProperty("url");
			yeurl = dbProps.getProperty("yeurl");
			username = dbProps.getProperty("username");
			password = dbProps.getProperty("password");
		}
		catch(Exception e){
			System.out.println("读取配置文件错误:"+e.getMessage());
		}
	}
	//及时短信发送程序
	public String jsdxfs(String destPhone,String content,String yhdlm,String dxfsfs)//短信上行 content 短信内容
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
//		try//汉字转换成编码格式
//		{
//		UTFcontent=java.net.URLEncoder.encode(content,"UTF-8");
//		}
//		catch (Exception e)
//		{
//			System.out.println("字符转换错误:"+e.getMessage());
//		}
		if (url==null || url=="")
			{
				fhStr=fhStr+"配置文件丢失!..........<br>";
			}
		UTFcontent=content;
		sjhm=destPhone.split(",");//将传递过来的参数分割成数组
		
		for (int i=0;i<sjhm.length;i++ )//为了避免客户发送的条数太多,系统利用循环发送的方式
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
				fhStr=fhStr+"号码:["+sjhm[i]+"]发送失败,无返回值!请检查配置文件或者网络是否畅通!..........<br>";
			}
			else if (!(fhjg[0].equals("0")))//0:接口连接失败
			{
				fhStr=fhStr+"号码:["+sjhm[i]+"] "+fhjg[1]+" <font color='red'>发送失败!..........</font><br>";
			}

			else//连接成功,成功发送
			{ 
				if (fhjg.length>=4)
				{
					// 1 处理成功
					//-1 号码不合法
					//-2 黑名单
					if (fhjg[3]!=null && fhjg[3]!="" && fhjg[3].equals("2,"))
					{
						fhStr=fhStr+"号码:["+sjhm[i]+"] "+fhjg[1]+" <font color='red'>号码不合法,发送失败</font><br>";
					}
					else if (fhjg[3]!=null && fhjg[3]!="" && fhjg[3].equals("1,"))
					{
						if (dxfsfs.equals("1"))//发送及时短信 为以后发送定时短信留下接口
							{
								sjg=jssavesql(sjhm[i],UTFcontent,yhdlm,dxfsfs);//1:及时短信;0:定时短信
								if (sjg.equals("1"))//判断写入数据库是否成功
								{
									fhStr=fhStr+"号码:["+sjhm[i]+"] "+fhjg[1]+" <font color='blue'>写入数据库成功!</font><br>";
								}
								else {fhStr=fhStr+"号码:["+sjhm[i]+"] "+fhjg[1]+" <font color='yellow'>写入数据库失败!</font><br>";}
							}
					}
					else 
					{
						fhStr=fhStr+"号码:["+sjhm[i]+"] "+sTotalString+" <font color='red'>发送失败,请参照说明文档,查看错误原因!</font><br>";
					}
				}
				else 
				{
					if (dxfsfs.equals("1"))//发送及时短信 为以后发送定时短信留下接口
					{
						sjg=jssavesql(sjhm[i],UTFcontent,yhdlm,dxfsfs);//1:及时短信;0:定时短信
						if (sjg.equals("1"))//判断写入数据库是否成功
						{
							fhStr=fhStr+"号码:["+sjhm[i]+"] "+fhjg[1]+" <font color='blue'>写入数据库成功!</font><br>";
						}
						else {fhStr=fhStr+"号码:["+sjhm[i]+"] "+fhjg[1]+" <font color='yellow'>写入数据库失败!</font><br>";}
					}
				}
			}
			sTotalString="";//将这个字段清空,用于for下次循环的检查
		}
	}
	catch (Exception e)
	{
		System.out.println("流异常:"+e.getMessage());
		fhStr+="流异常:"+e.getMessage();
	}
	return fhStr;

	}
	//及时短信写入数据库
	public String jssavesql (String dh,String nr,String fsr,String fs) throws Exception//dh 电话号码 nr 发送内容 fs 发送方式:1.即时发送0.定时发送
	{
	String ccjg="1";//0:失败,1:成功
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
			xh=rs.getString("xh");//序号
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
	//查询余额 直接返回余额值
	public String cxye()
	{
		
		String dxye="";
		String csCurrentLine=null;
		String csURL=null;
		if (url==null || url=="")
			{
				dxye="配置文件丢失!..........<br>";
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
			System.out.println("流异常:"+e.getMessage());
		}
		return dxye;
	}
//	public static void main(String args[])
//	{
//		String ssss=DXSX("13811428939","短信测试111","yangzi","0");
//		System.out.print(ssss);
//	}
}