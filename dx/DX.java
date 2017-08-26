package dx;

import java.io.*;
import java.util.*;
import ybl.common.CommonFunction;
import java.sql.*;

import com.roya.mcc.thirdapi.sendsms.ISMSService;
import com.roya.mcc.thirdapi.sendsms.SMSService;

public class DX
{
	private String url=null;		//������ַ
	private String yeurl=null;		//��ѯ�����ַ
	private String username=null;	//�û���
	private String password=null;	//����


	public DX ()					//���캯����ȡ�����ļ�
	{
		url="http://www.inhesms.cn/sms/send.aspx?";
		yeurl="http://www.inhesms.cn/sms/GetBalance.aspx?";
		username="2330HB-TOOW-01-0002";
		password="2144430281";
	}

	//�����Ͷ���
	//destPhone  �ֻ�����
	//content  ��������
	//yhmc  ������
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
			fhStr+="�����ļ���ʧ!..........<br>";
			return fhStr;
		}

		if (destPhone==null || destPhone.equals(""))
		{
			fhStr+="�ֻ�����Ϊ��<br>";
			return fhStr;
		}

		int len = destPhone.length();
		if (len<11)
		{
			fhStr+="�ֻ��ĳ��Ȳ���С��11λ��"+destPhone+"<br>";
			return fhStr;
		}

		if ( destPhone.charAt(0)!='1' ) 
		{
			fhStr+="�ֻ������һλֻ����1��"+destPhone+"<br>";
			return fhStr;
		}

		for(int i=0; i<len; i++) 
		{
			if (  !(  (destPhone.charAt(i)>='0' && destPhone.charAt(i)<='9'))  ) 
			{
				fhStr+="�ֻ�����ֻ�ܰ�����0-9�����֡���"+destPhone+"<br>";
				return fhStr;
			}
		}


		if (content==null || content.equals(""))
		{
			fhStr+="��������Ϊ��<br>";
			return fhStr;
		}

		java.io.InputStream l_urlStream   =null;
		java.io.BufferedReader   l_reader=null;



		try
		{
		
			int xh=0;//�������
			int mark=0;//�Ƿ�ֶ�������
			int zsl=0;//�ֽ��������
			if (content.length()>70)
			{
				mark=1;
				zsl=content.length()/65;
				if (zsl*65<content.length())
				{
					zsl++;
				}
			}

			//�ָ�������ݣ�ÿ�����70���ַ�
			while (true)
			{
				sTotalString="";//������ֶ����,����for�´�ѭ���ļ��

				if (content.equals(""))
				{
					break;
				}

				xh++;

				//ÿ�����70���ַ�
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



				//����ת���ɱ����ʽ
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
					fhStr=fhStr+"����:["+destPhone+"]����ʧ��,�޷���ֵ!���������ļ����������Ƿ�ͨ!..........<br>";
					sTotalString="9";//9���޷���ֵ
				}
				else//���ӳɹ�
				{ 
					if (sTotalString.equals("1"))//�ɹ�����
					{
						fhStr=fhStr+"����:["+destPhone+"]���ͳɹ�!<br>";
					}
					else if (sTotalString.equals("-100"))
					{
						fhStr=fhStr+"����:["+destPhone+"]  <font color='blue'>����ʧ��!</font><br>";
					}
					else if (sTotalString.equals("-2"))
					{
						fhStr=fhStr+"����:["+destPhone+"]����ʧ��!  <font color='blue'>����������!</font><br>";
					}
					else if (sTotalString.equals("-3"))
					{
						fhStr=fhStr+"����:["+destPhone+"]����ʧ��!  <font color='blue'>�û��������벻��ȷ!</font><br>";
					}
					else if (sTotalString.equals("-4"))
					{
						fhStr=fhStr+"����:["+destPhone+"]����ʧ��!  <font color='blue'>�û��˺�����!</font><br>";
					}
					else 
					{
						sTotalString="8";//8��δ֪ԭ��

						fhStr=fhStr+"����:["+destPhone+"]����ʧ��!  <font color='blue'>δ֪ԭ��!</font><br>";
					}
				}
				//д����ŷ�����־
//				InertDx_yfdx(destPhone,ls,yhmc,"1",sTotalString);//1.�˹�����;0.��ʱ����

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

