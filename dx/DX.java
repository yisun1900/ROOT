package dx;

import java.io.*;
import java.util.*;
import ybl.common.CommonFunction;
import java.sql.*;

import com.roya.mcc.thirdapi.sendsms.ISMSService;
import com.roya.mcc.thirdapi.sendsms.SMSService;

public class DX
{
	private String url=null;		//短信网址
	private String yeurl=null;		//查询余额网址
	private String username=null;	//用户名
	private String password=null;	//密码


	public DX ()					//构造函数读取配置文件
	{
		url="http://www.inhesms.cn/sms/send.aspx?";
		yeurl="http://www.inhesms.cn/sms/GetBalance.aspx?";
		username="2330HB-TOOW-01-0002";
		password="2144430281";
	}

	//单发送短信
	//destPhone  手机号码
	//content  短信内容
	//yhmc  发送人
	public String jsdxfs(String destPhone,String content,String yhmc) throws Exception
	{
		String	UTFcontent=null;
		String	sURL="";
		String  sCurrentLine   =   "";   
		String  sTotalString   =   ""; 
		String[] fhjg=null;
		String sxurl="";
		String sjg=null;
		String fhStr="";

		if (url==null || url=="")
		{
			fhStr+="配置文件丢失!..........<br>";
			return fhStr;
		}

		if (destPhone==null || destPhone.equals(""))
		{
			fhStr+="手机号码为空<br>";
			return fhStr;
		}

		int len = destPhone.length();
		if (len<11)
		{
			fhStr+="手机的长度不能小于11位："+destPhone+"<br>";
			return fhStr;
		}

		if ( destPhone.charAt(0)!='1' ) 
		{
			fhStr+="手机号码第一位只能是1："+destPhone+"<br>";
			return fhStr;
		}

		for(int i=0; i<len; i++) 
		{
			if (  !(  (destPhone.charAt(i)>='0' && destPhone.charAt(i)<='9'))  ) 
			{
				fhStr+="手机号码只能包括『0-9的数字』："+destPhone+"<br>";
				return fhStr;
			}
		}


		if (content==null || content.equals(""))
		{
			fhStr+="发送内容为空<br>";
			return fhStr;
		}

		java.io.InputStream l_urlStream   =null;
		java.io.BufferedReader   l_reader=null;



		try
		{
		
			int xh=0;//短信序号
			int mark=0;//是否分多条发送
			int zsl=0;//分解后总数量
			if (content.length()>70)
			{
				mark=1;
				zsl=content.length()/65;
				if (zsl*65<content.length())
				{
					zsl++;
				}
			}

			//分割短信内容，每次最多70个字符
			while (true)
			{
				sTotalString="";//将这个字段清空,用于for下次循环的检查

				if (content.equals(""))
				{
					break;
				}

				xh++;

				//每次最多70个字符
				String ls=null;
				if (mark==0)
				{
					ls=content;
					content="";
				}
				else{
					if (content.length()>65)
					{
						ls=content.substring(0,65);
						content=content.substring(65);
					}
					else{
						ls=content;
						content="";
					}

					ls="["+xh+"/"+zsl+"]"+ls;
				}



				//汉字转换成编码格式
				UTFcontent=java.net.URLEncoder.encode(ls,"UTF-8");

				sURL=url+"regnum="+username.substring(2)+"&pwd="+password.substring(2)+"&content="+UTFcontent+"&phone="+destPhone;

				java.net.URL   l_url   =   new   java.net.URL(sURL);   
				java.net.HttpURLConnection   l_connection   =   (java.net.HttpURLConnection)   l_url.openConnection();   
				l_connection.connect();   

				l_urlStream   =   l_connection.getInputStream();   
				l_reader   =   new   java.io.BufferedReader(new   java.io.InputStreamReader(l_urlStream));   
				while   ((sCurrentLine = l_reader.readLine())!=null)   
				{   
					  sTotalString+=sCurrentLine;   
				}
				l_urlStream.close();
				l_reader.close();


				if (sTotalString==null || sTotalString=="")
				{
					fhStr=fhStr+"号码:["+destPhone+"]发送失败,无返回值!请检查配置文件或者网络是否畅通!..........<br>";
					sTotalString="9";//9：无返回值
				}
				else//连接成功
				{ 
					if (sTotalString.equals("1"))//成功发送
					{
						fhStr=fhStr+"号码:["+destPhone+"]发送成功!<br>";
					}
					else if (sTotalString.equals("-100"))
					{
						fhStr=fhStr+"号码:["+destPhone+"]  <font color='blue'>发送失败!</font><br>";
					}
					else if (sTotalString.equals("-2"))
					{
						fhStr=fhStr+"号码:["+destPhone+"]发送失败!  <font color='blue'>参数不完整!</font><br>";
					}
					else if (sTotalString.equals("-3"))
					{
						fhStr=fhStr+"号码:["+destPhone+"]发送失败!  <font color='blue'>用户名或密码不正确!</font><br>";
					}
					else if (sTotalString.equals("-4"))
					{
						fhStr=fhStr+"号码:["+destPhone+"]发送失败!  <font color='blue'>用户账号余额不足!</font><br>";
					}
					else 
					{
						sTotalString="8";//8：未知原因

						fhStr=fhStr+"号码:["+destPhone+"]发送失败!  <font color='blue'>未知原因!</font><br>";
					}
				}
				//写入短信发送日志
//				InertDx_yfdx(destPhone,ls,yhmc,"1",sTotalString);//1.人工发送;0.定时发送

			}
		}
		catch (Exception e)
		{
			throw e; 
		}
		finally 
		{
			try{
				if (l_urlStream!=null)
				{
					l_urlStream.close();
				}
				if (l_reader!=null)
				{
					l_reader.close();
				}
			}
			catch (Exception e){
				throw e; 
			}
		}

		return fhStr;

	}


}

