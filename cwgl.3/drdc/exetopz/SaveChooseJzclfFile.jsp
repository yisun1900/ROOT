<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");

String fgsbh=request.getParameter("fgsbh");
String kmdm=request.getParameter("kmdm");
String fexp=cf.GB2Uni(request.getParameter("fexp"));
String fexp1=cf.GB2Uni(request.getParameter("fexp1"));
String[] hth =request.getParameterValues("hth");
String[] rgfstr =request.getParameterValues("rgf");
String[] clfstr =request.getParameterValues("clf");

String rootPath=getServletContext().getRealPath("");
%>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

Connection conn1  = null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;


int count=0;
	

String kmmc=null;//��Ŀ����

java.sql.Date sksj=cf.getDate();

String fclsname1=null;//��һ��������Ŀ�����������
String fobjid1=null;//��һ��������ĿID
String fobjname1=null;//��һ��������Ŀ����
String fclsname2=null;//�ڶ���������Ŀ�����������
String fobjid2=null;//�ڶ���������ĿID
String fobjname2=null;//�ڶ���������Ŀ����
String fclsname3=null;//������������Ŀ�����������
String fobjid3=null;//������������ĿID
String fobjname3=null;//������������Ŀ����
String fclsname4=null;//��4��������Ŀ�����������
String fobjid4=null;//��4��������ĿID
String fobjname4=null;//��4��������Ŀ����

String khbh=null;//�ͻ����
String khxm=null;//�ͻ�����
String sjs=null;//���ʦ
String sjsbh=null;//��������ұ��
String dwbh=null;//�������
String sgd=null;//ʩ���ӱ���
String sgdmc=null;//ʩ��������


Hashtable<String,Double> rgfHz=new Hashtable<String,Double>();//��ŵ���ʵ�տ����
Hashtable<String,Double> clfHz=new Hashtable<String,Double>();//��ŵ����������

try {
	//������׼ƾ֤�ļ�
	String DBFSourece=rootPath+"\\foxpro\\JINDIEPZ.DBF";
	String DownFile=rootPath+"\\foxpro\\"+yhdlm+".dbf";

	//�˹���
	FileInputStream fis=new FileInputStream(DBFSourece);
	FileOutputStream fos=new FileOutputStream(DownFile);
	byte[] buffer=new byte[1024];
	int len=0;
	while ((len=fis.read(buffer))!=-1)
	{
		fos.write(buffer,0,len);
	}
	fis.close();
	fos.close();

	DBFSourece=rootPath+"\\foxpro\\JINDIEPZCF.dbf";
	DownFile=rootPath+"\\foxpro\\"+yhdlm+"CF.dbf";

	fis=new FileInputStream(DBFSourece);
	fos=new FileOutputStream(DownFile);
	while ((len=fis.read(buffer))!=-1)
	{
		fos.write(buffer,0,len);
	}
	fis.close();
	fos.close();


	//���Ϸ�
	DBFSourece=rootPath+"\\foxpro\\JINDIEPZ.DBF";
	DownFile=rootPath+"\\foxpro\\"+yhdlm+"1.dbf";

	fis=new FileInputStream(DBFSourece);
	fos=new FileOutputStream(DownFile);
	while ((len=fis.read(buffer))!=-1)
	{
		fos.write(buffer,0,len);
	}
	fis.close();
	fos.close();

	DBFSourece=rootPath+"\\foxpro\\JINDIEPZCF.dbf";
	DownFile=rootPath+"\\foxpro\\"+yhdlm+"1CF.dbf";

	fis=new FileInputStream(DBFSourece);
	fos=new FileOutputStream(DownFile);
	while ((len=fis.read(buffer))!=-1)
	{
		fos.write(buffer,0,len);
	}
	fis.close();
	fos.close();

	String driver = "sun.jdbc.odbc.JdbcOdbcDriver";
	String url = "jdbc:odbc:impcgdd";
	String user = "";
	String passwd = "";

	Class.forName (driver);
	conn = DriverManager.getConnection(url, user, passwd);

	conn1=cf.getConnection();    //�õ�����


	String fklxbm="";//�տ����ͱ���
	kmmc="";//��Ŀ����

	String fgsmc=null;
	ls_sql=" select dwmc" ;
	ls_sql+=" from sq_dwxx " ;
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps2= conn1.prepareStatement(ls_sql);
	rs2=ps2.executeQuery();
	if(rs2.next())
	{         
		fgsmc = cf.fillNull(rs2.getString("dwmc"));			    
	}
	rs2.close();
	ps2.close();

	ls_sql=" select kmmc,fklxbm " ;
	ls_sql+=" from cw_jzkmdm " ;
	ls_sql+=" where kmdm='"+kmdm+"' and fgsbh='"+fgsbh+"'";
	ps2= conn1.prepareStatement(ls_sql);
	rs2=ps2.executeQuery();
	if(rs2.next())
	{         
		kmmc = cf.fillNull(rs2.getString("kmmc"));			    
		fklxbm = cf.fillNull(rs2.getString("fklxbm"));	//21:ľ�ţ�22:����23:���ģ�24���Ҿ�   
	}
	else{
		out.println("<BR>���󣡿�Ŀ���룺["+kmdm+"]������");
		return;
	}
	rs2.close();
	ps2.close();


	conn.setAutoCommit(false);

	int row=-1;
	double dmrgf=0;
	double allrgf=0;
	double dmclf=0;
	double allclf=0;
	for (int i=0;i<hth.length ;i++ )
	{
		row++;

		//�˹���
		double rgf=0;
		if (rgfstr[i]!=null && !rgfstr[i].trim().equals(""))
		{
			try{
				rgf=Double.parseDouble(rgfstr[i].trim());
			}
			catch (Exception e) {
				conn.rollback();
				out.print("���["+(i+1)+"][��ͬ��"+hth[i]+"]����[�˹���]�����֣�" + rgfstr[i]);
				return;
			}
		}

		allrgf+=rgf;

		//���Ϸ�
		double clf=0;
		if (clfstr[i]!=null && !clfstr[i].trim().equals(""))
		{
			try{
				clf=Double.parseDouble(clfstr[i].trim());
			}
			catch (Exception e) {
				conn.rollback();
				out.print("���["+(i+1)+"][��ͬ��"+hth[i]+"]����[���Ϸ�]�����֣�" + clfstr[i]);
				return;
			}
		}

		allclf+=clf;

		
		//ȡ�ͻ���Ϣ��������������������������������ʼ
		ls_sql=" select khbh,khxm,sjs,sjsbh,dwbh,sgd" ;
		ls_sql+=" from crm_khxx " ;
		ls_sql+=" where hth='"+hth[i]+"' and fgsbh='"+fgsbh+"'";
		ps1= conn1.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if(rs1.next())
		{         
			khbh = rs1.getString("khbh").trim();			    
			khxm = rs1.getString("khxm");			    
			sjs = rs1.getString("sjs");			    
			sjsbh = rs1.getString("sjsbh");			    
			dwbh = rs1.getString("dwbh");			    
			sgd = rs1.getString("sgd");			    
		}
		else{
			rs1.close();
			ps1.close();

			String fgsmc1=null;
			ls_sql=" select dwmc" ;
			ls_sql+=" from crm_khxx,sq_dwxx " ;
			ls_sql+=" where crm_khxx.fgsbh=sq_dwxx.dwbh and hth='"+hth[i]+"'";
			ps1= conn1.prepareStatement(ls_sql);
			rs1=ps1.executeQuery();
			if(rs1.next())
			{         
				fgsmc1 = rs1.getString("dwmc");		
				
				rs1.close();
				ps1.close();
				conn.rollback();
				out.println("<P>���["+(i+1)+"]������ͬ��["+hth[i]+"]��["+fgsmc+"]�����ڣ�Ӧ����["+fgsmc1+"]");
				return;
			}
			else{
				rs1.close();
				ps1.close();
				conn.rollback();
				out.println("<P>���["+(i+1)+"]������ͬ��["+hth[i]+"]������");
				return;
			}
		}
		rs1.close();
		ps1.close();
		//ȡ�ͻ���Ϣ��������������������������������������

		//ȡʩ��������������������������������������ʼ
		ls_sql=" select sgdmc" ;
		ls_sql+=" from sq_sgd " ;
		ls_sql+=" where sgd='"+sgd+"' and ssfgs='"+fgsbh+"'";
		ps1= conn1.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if(rs1.next())
		{         
			sgdmc = rs1.getString("sgdmc");			    
		}
		else{
			conn.rollback();
			out.println("<BR>���["+(i+1)+"][��ͬ��"+hth[i]+"]����ʩ����["+sgd+"]������");
			return;
		}
		rs1.close();
		ps1.close();
		//ȡʩ��������������������������������������������
		
		

		//ȡ���������롢���ƣ�������������������������������ʼ
		String cwdm=null;//����������
		String dwmc=null;//��������
		ls_sql=" select dwmc,cwdm" ;
		ls_sql+=" from sq_dwxx " ;
		ls_sql+=" where dwbh='"+dwbh+"'";
		ps2= conn1.prepareStatement(ls_sql);
		rs2=ps2.executeQuery();
		if(rs2.next())
		{         
			dwmc = rs2.getString("dwmc");			    
			cwdm = rs2.getString("cwdm");			    
		}
		else{
			conn.rollback();
			out.println("<BR>���["+(i+1)+"][��ͬ��"+hth[i]+"]�����������["+dwbh+"]������");
			return;
		}
		rs2.close();
		ps2.close();

		if (cwdm==null || cwdm.equals(""))
		{
			conn.rollback();
			out.println("<BR>���["+(i+1)+"][��ͬ��"+hth[i]+"]��������["+dwmc+"]�Ĳ�����벻����");
			return;
		}
		//ȡ���������롢���ƣ�������������������������������������


		//ȡ���ʦ���ţ�������������������������������ʼ
		String bianhao=null;
		ls_sql=" select bianhao" ;
		ls_sql+=" from sq_yhxx " ;
		ls_sql+=" where yhmc='"+sjs+"' and dwbh='"+dwbh+"' and zwbm='04'";
		ps1= conn1.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if(rs1.next())
		{         
			bianhao = rs1.getString("bianhao");			    
		}
		else{
			out.println("<BR>���ѣ����["+(i+1)+"][��ͬ��"+hth[i]+"]���ʦ["+sjs+"]�ڵ���["+dwmc+"]������");
		}
		rs1.close();
		ps1.close();
		//ȡ�ͻ���Ϣ��������������������������������������

		//���������Ļ��ܣ�������������������������������ʼ
		double lsHz=0;//�˹���
		if ((Double)rgfHz.get(dwbh)==null)//�����ڣ�Ϊ��һ��
		{
			lsHz=rgf;
		}
		else{
			lsHz=(Double)rgfHz.get(dwbh).doubleValue()+rgf;//��ȡ���
		}
		rgfHz.put(dwbh,new Double(lsHz));

		lsHz=0;//���Ϸ�
		if ((Double)clfHz.get(dwbh)==null)//�����ڣ�Ϊ��һ��
		{
			lsHz=clf;
		}
		else{
			lsHz=(Double)clfHz.get(dwbh).doubleValue()+clf;//��ȡ���
		}
		clfHz.put(dwbh,new Double(lsHz));
		//���������Ļ��ܣ�������������������������������������
		

		//�˹���ƾ֤����������������������������������ʼ
		fclsname1="�ͻ�";
		fobjid1=hth[i];
		fobjname1=khxm;

		fclsname2="����";
		fobjid2=cwdm;//�������
		fobjname2=dwmc;

		fclsname3="����";
		fobjid3=sgd;
		fobjname3=sgdmc;

		fclsname4="";
		fobjid4="";
		fobjname4="";

		String fdc="0";//D���裻C����,1���裨�˿��0�������տ
		double fdebit=0;//�跽������
		double fcredit=rgf;//����������

		ls_sql="insert into "+yhdlm+"(fdate,ftransdate,fperiod,fgroup,fnum,fentryid,fexp,facctid";
		ls_sql+=" ,fclsname1,fobjid1,fobjname1,fclsname2,fobjid2,fobjname2,fclsname3,fobjid3,fobjname3,fclsname4,fobjid4,fobjname4";
		ls_sql+=" ,fclsname5,fobjid5,fobjname5,fclsname6,fobjid6,fobjname6,fclsname7,fobjid7,fobjname7,fclsname8,fobjid8,fobjname8";
		ls_sql+=" ,ftransid,fcyid,fexchrate,fdc,ffcyamt,fqty,fprice,fdebit";
		ls_sql+=" ,fcredit,fsettlcode,fsettleno,fprepare,fpay,fcash,fposter,fchecker,fattchment,fposted ";
		ls_sql+=" ,fmodule,fdeleted,fserialno,funitname,freference,fcashflow)";
		ls_sql+= " values(?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,sksj);
		ps.setDate(2,sksj);
		ps.setInt(3,1);//����ڼ�
		ps.setString(4,"��");//ƾ֤��
		ps.setInt(5,144);//ƾ֤��
		ps.setInt(6,row);//��¼��
		ps.setString(7,fexp);//ƾ֤ժҪ
		ps.setString(8,kmdm);//��Ŀ��

		ps.setString(9,fclsname1);//��һ��������Ŀ�����������
		ps.setString(10,fobjid1);//��һ��������ĿID
		ps.setString(11,fobjname1);//��һ��������Ŀ����
		ps.setString(12,fclsname2);
		ps.setString(13,fobjid2);
		ps.setString(14,fobjname2);
		ps.setString(15,fclsname3);
		ps.setString(16,fobjid3);
		ps.setString(17,fobjname3);
		ps.setString(18,fclsname4);//���ĸ�������Ŀ�����������
		ps.setString(19,fobjid4);//���ĸ�������ĿID
		ps.setString(20,fobjname4);//���ĸ�������Ŀ����

		ps.setString(21,"");
		ps.setString(22,"");
		ps.setString(23,"");
		ps.setString(24,"");
		ps.setString(25,"");
		ps.setString(26,"");
		ps.setString(27,"");
		ps.setString(28,"");
		ps.setString(29,"");
		ps.setString(30,"");//��8��������Ŀ�����������
		ps.setString(31,"");//��8��������ĿID
		ps.setString(32,"");//��8��������Ŀ����

		ps.setString(33,"");//ҵ����
		ps.setString(34,"RMB");//����
		ps.setDouble(35,1);//����
		ps.setString(36,fdc);//D���裻C����
		ps.setDouble(37,rgf);//ԭ�ҽ��
		ps.setDouble(38,0);//����
		ps.setDouble(39,0);//����
		ps.setDouble(40,fdebit);//�跽������

		ps.setDouble(41,fcredit);//����������
		ps.setString(42,"*");//���㷽ʽ����
		ps.setString(43,"");//�����
		ps.setString(44,yhmc);//�Ƶ���
		ps.setString(45,"");//
		ps.setString(46,"");//
		ps.setString(47,yhmc);//������
		ps.setString(48,"");//�����
		ps.setInt(49,0);//��������
		ps.setInt(50,1);//���˱��

		ps.setString(51,"");//����ƾ֤ģ���ʶ
		ps.setInt(52,0);//ɾ�����
		ps.setInt(53,369);//ƾ֤���
		ps.setString(54,"");//��λ
		ps.setString(55,"");//�ο���Ϣ
		ps.setInt(56,0);//�Ƿ���ָ���ֽ�����
		
		ps.executeUpdate();
		ps.close();

		//�˹���ƾ֤��������������������������������������



		//���Ϸ�ƾ֤����������������������������������ʼ
		fclsname1="�ͻ�";
		fobjid1=hth[i];
		fobjname1=khxm;

		fclsname2="����";
		fobjid2=cwdm;//�������
		fobjname2=dwmc;

		fclsname3="����";
		fobjid3=sgd;
		fobjname3=sgdmc;

		fclsname4="";
		fobjid4="";
		fobjname4="";

		fdc="0";//D���裻C����,1���裨�˿��0�������տ
		fdebit=0;//�跽������
		fcredit=clf;//����������

		ls_sql="insert into "+yhdlm+"1(fdate,ftransdate,fperiod,fgroup,fnum,fentryid,fexp,facctid";
		ls_sql+=" ,fclsname1,fobjid1,fobjname1,fclsname2,fobjid2,fobjname2,fclsname3,fobjid3,fobjname3,fclsname4,fobjid4,fobjname4";
		ls_sql+=" ,fclsname5,fobjid5,fobjname5,fclsname6,fobjid6,fobjname6,fclsname7,fobjid7,fobjname7,fclsname8,fobjid8,fobjname8";
		ls_sql+=" ,ftransid,fcyid,fexchrate,fdc,ffcyamt,fqty,fprice,fdebit";
		ls_sql+=" ,fcredit,fsettlcode,fsettleno,fprepare,fpay,fcash,fposter,fchecker,fattchment,fposted ";
		ls_sql+=" ,fmodule,fdeleted,fserialno,funitname,freference,fcashflow)";
		ls_sql+= " values(?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,sksj);
		ps.setDate(2,sksj);
		ps.setInt(3,1);//����ڼ�
		ps.setString(4,"��");//ƾ֤��
		ps.setInt(5,176);//ƾ֤��
		ps.setInt(6,row);//��¼��
		ps.setString(7,fexp1);//ƾ֤ժҪ
		ps.setString(8,kmdm);//��Ŀ��

		ps.setString(9,fclsname1);//��һ��������Ŀ�����������
		ps.setString(10,fobjid1);//��һ��������ĿID
		ps.setString(11,fobjname1);//��һ��������Ŀ����
		ps.setString(12,fclsname2);
		ps.setString(13,fobjid2);
		ps.setString(14,fobjname2);
		ps.setString(15,fclsname3);
		ps.setString(16,fobjid3);
		ps.setString(17,fobjname3);
		ps.setString(18,fclsname4);//���ĸ�������Ŀ�����������
		ps.setString(19,fobjid4);//���ĸ�������ĿID
		ps.setString(20,fobjname4);//���ĸ�������Ŀ����

		ps.setString(21,"");
		ps.setString(22,"");
		ps.setString(23,"");
		ps.setString(24,"");
		ps.setString(25,"");
		ps.setString(26,"");
		ps.setString(27,"");
		ps.setString(28,"");
		ps.setString(29,"");
		ps.setString(30,"");//��8��������Ŀ�����������
		ps.setString(31,"");//��8��������ĿID
		ps.setString(32,"");//��8��������Ŀ����

		ps.setString(33,"");//ҵ����
		ps.setString(34,"RMB");//����
		ps.setDouble(35,1);//����
		ps.setString(36,fdc);//D���裻C����
		ps.setDouble(37,clf);//ԭ�ҽ��
		ps.setDouble(38,0);//����
		ps.setDouble(39,0);//����
		ps.setDouble(40,fdebit);//�跽������

		ps.setDouble(41,fcredit);//����������
		ps.setString(42,"*");//���㷽ʽ����
		ps.setString(43,"");//�����
		ps.setString(44,yhmc);//�Ƶ���
		ps.setString(45,"");//
		ps.setString(46,"");//
		ps.setString(47,yhmc);//������
		ps.setString(48,"");//�����
		ps.setInt(49,0);//��������
		ps.setInt(50,1);//���˱��

		ps.setString(51,"");//����ƾ֤ģ���ʶ
		ps.setInt(52,0);//ɾ�����
		ps.setInt(53,368);//ƾ֤���
		ps.setString(54,"");//��λ
		ps.setString(55,"");//�ο���Ϣ
		ps.setInt(56,0);//�Ƿ���ָ���ֽ�����
		
		ps.executeUpdate();
		ps.close();

		//���Ϸ�ƾ֤��������������������������������������
	}

	//������������ֵƾ֤������������������������������������ʼ
	Enumeration dwbmList=rgfHz.keys();
	while (dwbmList.hasMoreElements() )
	{
		row++;

		dwbh=(String)dwbmList.nextElement();
		dmrgf=(Double)rgfHz.get(dwbh).doubleValue();//���������
		dmclf=(Double)clfHz.get(dwbh).doubleValue();//���������

		String cwdm=null;//�������
		String dwmc=null;//�������
		ls_sql=" select dwmc,cwdm" ;
		ls_sql+=" from sq_dwxx " ;
		ls_sql+=" where dwbh='"+dwbh+"'";
		ps2= conn1.prepareStatement(ls_sql);
		rs2=ps2.executeQuery();
		if(rs2.next())
		{         
			dwmc = rs2.getString("dwmc");			    
			cwdm = rs2.getString("cwdm");			    
		}
		else{
			conn.rollback();
			out.println("<BR>���󣡵������["+dwbh+"]������");
			return;
		}
		rs2.close();
		ps2.close();

		if (cwdm==null || cwdm.equals(""))
		{
			conn.rollback();
			out.println("<BR>���󣡵���["+dwmc+"]�Ĳ�����벻����");
			return;
		}
	

		//�˹���ƾ֤����������������������������������ʼ
		fclsname1="����";
		fobjid1=cwdm;
		fobjname1=dwmc;

		fclsname2="";
		fobjid2="";
		fobjname2="";

		fclsname3="";
		fobjid3="";
		fobjname3="";

		fclsname4="";
		fobjid4="";
		fobjname4="";
	
		String fdc="1";//D���裻C����,1���裨�˿��0�������տ
		double fdebit=dmrgf;//�跽������
		double fcredit=0;//����������


		ls_sql="insert into "+yhdlm+"(fdate,ftransdate,fperiod,fgroup,fnum,fentryid,fexp,facctid";
		ls_sql+=" ,fclsname1,fobjid1,fobjname1,fclsname2,fobjid2,fobjname2,fclsname3,fobjid3,fobjname3,fclsname4,fobjid4,fobjname4 ";
		ls_sql+=" ,fclsname5,fobjid5,fobjname5,fclsname6,fobjid6,fobjname6,fclsname7,fobjid7,fobjname7,fclsname8,fobjid8,fobjname8";
		ls_sql+=" ,ftransid,fcyid,fexchrate,fdc,ffcyamt,fqty,fprice,fdebit";
		ls_sql+=" ,fcredit,fsettlcode,fsettleno,fprepare,fpay,fcash,fposter,fchecker,fattchment,fposted ";
		ls_sql+=" ,fmodule,fdeleted,fserialno,funitname,freference,fcashflow)";
		ls_sql+= " values(?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,sksj);
		ps.setDate(2,sksj);
		ps.setInt(3,1);//����ڼ�
		ps.setString(4,"��");//ƾ֤��
		ps.setInt(5,144);//ƾ֤��
		ps.setInt(6,row);//��¼��
		ps.setString(7,fexp);//ƾ֤ժҪ
		ps.setString(8,"502.01");//��Ŀ��

		ps.setString(9,fclsname1);//��һ��������Ŀ�����������
		ps.setString(10,fobjid1);//��һ��������ĿID
		ps.setString(11,fobjname1);//��һ��������Ŀ����
		ps.setString(12,fclsname2);
		ps.setString(13,fobjid2);
		ps.setString(14,fobjname2);
		ps.setString(15,fclsname3);
		ps.setString(16,fobjid3);
		ps.setString(17,fobjname3);
		ps.setString(18,fclsname4);//���ĸ�������Ŀ�����������
		ps.setString(19,fobjid4);//���ĸ�������ĿID
		ps.setString(20,fobjname4);//���ĸ�������Ŀ����

		ps.setString(21,"");
		ps.setString(22,"");
		ps.setString(23,"");
		ps.setString(24,"");
		ps.setString(25,"");
		ps.setString(26,"");
		ps.setString(27,"");
		ps.setString(28,"");
		ps.setString(29,"");
		ps.setString(30,"");//��8��������Ŀ�����������
		ps.setString(31,"");//��8��������ĿID
		ps.setString(32,"");//��8��������Ŀ����

		ps.setString(33,"");//ҵ����
		ps.setString(34,"RMB");//����
		ps.setDouble(35,1);//����
		ps.setString(36,fdc);//D���裻C����
		ps.setDouble(37,dmrgf);//ԭ�ҽ��
		ps.setDouble(38,0);//����
		ps.setDouble(39,0);//����
		ps.setDouble(40,fdebit);//�跽������

		ps.setDouble(41,fcredit);//����������
		ps.setString(42,"*");//���㷽ʽ����
		ps.setString(43,"");//�����
		ps.setString(44,yhmc);//�Ƶ���
		ps.setString(45,"");//
		ps.setString(46,"");//
		ps.setString(47,yhmc);//������
		ps.setString(48,"");//�����
		ps.setInt(49,0);//��������
		ps.setInt(50,1);//���˱��

		ps.setString(51,"");//����ƾ֤ģ���ʶ
		ps.setInt(52,0);//ɾ�����
		ps.setInt(53,369);//ƾ֤���
		ps.setString(54,"");//��λ
		ps.setString(55,"");//�ο���Ϣ
		ps.setInt(56,0);//�Ƿ���ָ���ֽ�����
		
		ps.executeUpdate();
		ps.close();
		//�˹���ƾ֤��������������������������������������



		//���Ϸ�ƾ֤����������������������������������ʼ
		fclsname1="����";
		fobjid1=cwdm;
		fobjname1=dwmc;

		fclsname2="";
		fobjid2="";
		fobjname2="";

		fclsname3="";
		fobjid3="";
		fobjname3="";

		fclsname4="";
		fobjid4="";
		fobjname4="";
	
		fdc="1";//D���裻C����,1���裨�˿��0�������տ
		fdebit=dmclf;//�跽������
		fcredit=0;//����������

		ls_sql="insert into "+yhdlm+"1(fdate,ftransdate,fperiod,fgroup,fnum,fentryid,fexp,facctid";
		ls_sql+=" ,fclsname1,fobjid1,fobjname1,fclsname2,fobjid2,fobjname2,fclsname3,fobjid3,fobjname3,fclsname4,fobjid4,fobjname4 ";
		ls_sql+=" ,fclsname5,fobjid5,fobjname5,fclsname6,fobjid6,fobjname6,fclsname7,fobjid7,fobjname7,fclsname8,fobjid8,fobjname8";
		ls_sql+=" ,ftransid,fcyid,fexchrate,fdc,ffcyamt,fqty,fprice,fdebit";
		ls_sql+=" ,fcredit,fsettlcode,fsettleno,fprepare,fpay,fcash,fposter,fchecker,fattchment,fposted ";
		ls_sql+=" ,fmodule,fdeleted,fserialno,funitname,freference,fcashflow)";
		ls_sql+= " values(?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,sksj);
		ps.setDate(2,sksj);
		ps.setInt(3,1);//����ڼ�
		ps.setString(4,"��");//ƾ֤��
		ps.setInt(5,176);//ƾ֤��
		ps.setInt(6,row);//��¼��
		ps.setString(7,fexp1);//ƾ֤ժҪ
		ps.setString(8,"502.01");//��Ŀ��

		ps.setString(9,fclsname1);//��һ��������Ŀ�����������
		ps.setString(10,fobjid1);//��һ��������ĿID
		ps.setString(11,fobjname1);//��һ��������Ŀ����
		ps.setString(12,fclsname2);
		ps.setString(13,fobjid2);
		ps.setString(14,fobjname2);
		ps.setString(15,fclsname3);
		ps.setString(16,fobjid3);
		ps.setString(17,fobjname3);
		ps.setString(18,fclsname4);//���ĸ�������Ŀ�����������
		ps.setString(19,fobjid4);//���ĸ�������ĿID
		ps.setString(20,fobjname4);//���ĸ�������Ŀ����

		ps.setString(21,"");
		ps.setString(22,"");
		ps.setString(23,"");
		ps.setString(24,"");
		ps.setString(25,"");
		ps.setString(26,"");
		ps.setString(27,"");
		ps.setString(28,"");
		ps.setString(29,"");
		ps.setString(30,"");//��8��������Ŀ�����������
		ps.setString(31,"");//��8��������ĿID
		ps.setString(32,"");//��8��������Ŀ����

		ps.setString(33,"");//ҵ����
		ps.setString(34,"RMB");//����
		ps.setDouble(35,1);//����
		ps.setString(36,fdc);//D���裻C����
		ps.setDouble(37,dmclf);//ԭ�ҽ��
		ps.setDouble(38,0);//����
		ps.setDouble(39,0);//����
		ps.setDouble(40,fdebit);//�跽������

		ps.setDouble(41,fcredit);//����������
		ps.setString(42,"*");//���㷽ʽ����
		ps.setString(43,"");//�����
		ps.setString(44,yhmc);//�Ƶ���
		ps.setString(45,"");//
		ps.setString(46,"");//
		ps.setString(47,yhmc);//������
		ps.setString(48,"");//�����
		ps.setInt(49,0);//��������
		ps.setInt(50,1);//���˱��

		ps.setString(51,"");//����ƾ֤ģ���ʶ
		ps.setInt(52,0);//ɾ�����
		ps.setInt(53,368);//ƾ֤���
		ps.setString(54,"");//��λ
		ps.setString(55,"");//�ο���Ϣ
		ps.setInt(56,0);//�Ƿ���ָ���ֽ�����
		
		ps.executeUpdate();
		ps.close();

		//���Ϸ�ƾ֤��������������������������������������


	}
	//������������ֵƾ֤������������������������������������������

		

	conn.commit();

	out.print("<P>�ɹ�����ƾ֤��"+yhdlm+".dbf��"+yhdlm+"CF.dbf����������¼����"+(row+1));
}
catch (Exception e) {
	conn.rollback();

	out.print("��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);

	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) conn.close();
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn1 != null) cf.close(conn1);    //�ͷ�����
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>
<BR><BR>�������Ҽ�����ƾ֤��4���ļ�����
<A HREF="/foxpro/<%=yhdlm%>.dbf"><%=yhdlm%>.dbf���˹��ѣ�</A> 
&nbsp;&nbsp;
<A HREF="/foxpro/<%=yhdlm%>CF.dbf"><%=yhdlm%>CF.dbf���˹��ѣ�</A>
&nbsp;&nbsp;
<A HREF="/foxpro/<%=yhdlm%>1.dbf"><%=yhdlm%>1.dbf�����Ϸѣ�</A>
&nbsp;&nbsp;
<A HREF="/foxpro/<%=yhdlm%>1CF.dbf"><%=yhdlm%>1CF.dbf�����Ϸѣ�</A>
