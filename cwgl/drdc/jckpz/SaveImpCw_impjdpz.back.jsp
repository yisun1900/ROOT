<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>ƾ֤������ </title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");
String drdw=(String)session.getAttribute("dwbh");
String drfgs=(String)session.getAttribute("ssfgs");
String lrdw=(String)session.getAttribute("dwbh");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

Connection conn1  = null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql1=null;

try 
{
	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename=rootPath+"\\foxpro\\IMP_"+yhdlm+".DBF";
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer);
	f.close();
%>


<%
	String driver = "sun.jdbc.odbc.JdbcOdbcDriver";
	String url = "jdbc:odbc:impcgdd";
	String user = "";
	String passwd = "";

	conn1=cf.getConnection();    //�õ�����
	
	Class.forName (driver);
	conn = DriverManager.getConnection(url, user, passwd);
	
	java.sql.Date fdate=null;
	java.sql.Date ftransdate=null;
	int fperiod=0;//����ڼ�
	String fgroup=null;//ƾ֤��
	int fnum=0;//ƾ֤��
	int fentryid=0;//��¼��
	String fexp=null;
	String facctid=null;
	String fclsname1=null;

	String fobjid1=null;
	String fobjname1=null;
	String fclsname2=null;
	String fobjid2=null;
	String fobjname2=null;
	String fclsname3=null;
	String fobjid3=null;
	String fobjname3=null;
	String fclsname4=null;
	String fobjid4=null;

	String fobjname4=null;
	String fclsname5=null;
	String fobjid5=null;
	String fobjname5=null;
	String fclsname6=null;
	String fobjid6=null;
	String fobjname6=null;
	String fclsname7=null;
	String fobjid7=null;
	String fobjname7=null;

	String fclsname8=null;
	String fobjid8=null;
	String fobjname8=null;
	String ftransid=null;
	String fcyid=null;
	double fexchrate=0;//����
	String fdc=null;
	double ffcyamt=0;//ԭ�ҽ��
	double fqty=0;//����
	double fprice=0;//����

	double fdebit=0;//�跽������
	double fcredit=0;//����������
	String fsettlcode=null;
	String fsettleno=null;
	String fprepare=null;
	String fpay=null;
	String fcash=null;
	String fposter=null;
	String fchecker=null;
	int fattchment=0;//��������

	String fposted=null;
	String fmodule=null;
	String fdeleted=null;
	int fserialno=0;//ƾ֤���
	String funitname=null;
	String freference=null;
	int fcashflow=0;//�Ƿ���ָ���ֽ�����


	conn1.setAutoCommit(false);

	long xuhao=0;
	ls_sql=" select NVL(max(xuhao),0) " ;
	ls_sql+=" from cw_impjdpz " ;
	ps1= conn1.prepareStatement(ls_sql);
	rs1=ps1.executeQuery();
	if(rs1.next())
	{         
		xuhao = rs1.getLong(1);			    
	}
	rs1.close();
	ps1.close();

	
	int row=0;
	ls_sql="select fdate,ftransdate,fperiod,fgroup,fnum,fentryid,fexp,facctid,fclsname1";
	ls_sql+=" ,fobjid1,fobjname1,fclsname2,fobjid2,fobjname2,fclsname3,fobjid3,fobjname3,fclsname4,fobjid4 ";
	ls_sql+=" ,fobjname4,fclsname5,fobjid5,fobjname5,fclsname6,fobjid6,fobjname6,fclsname7,fobjid7,fobjname7";
	ls_sql+=" ,fclsname8,fobjid8,fobjname8,ftransid,fcyid,fexchrate,fdc,ffcyamt,fqty,fprice";
	ls_sql+=" ,fdebit,fcredit,fsettlcode,fsettleno,fprepare,fpay,fcash,fposter,fchecker,fattchment ";
	ls_sql+=" ,fposted,fmodule,fdeleted,fserialno,funitname,freference,fcashflow";
	ls_sql+= " from IMP_"+yhdlm;
	ls_sql+= " order by fnum,fentryid";
//	out.println(ls_sql1);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while(rs.next())
	{
		xuhao++;
		row++;

		fdate=rs.getDate("fdate");
		ftransdate=rs.getDate("ftransdate");//ҵ������
		fperiod=rs.getInt("fperiod");
		fgroup=cf.fillNull(rs.getString("fgroup"));
		fnum=rs.getInt("fnum");
		fentryid=rs.getInt("fentryid");
		fexp=cf.fillNull(rs.getString("fexp"));
		facctid=cf.fillNull(rs.getString("facctid"));//��Ŀ��
		fclsname1=cf.fillNull(rs.getString("fclsname1"));

		fobjid1=cf.fillNull(rs.getString("fobjid1"));//��ͬ��
		fobjname1=cf.fillNull(rs.getString("fobjname1"));//Ʒ�ƣ��ͻ�����
		fclsname2=cf.fillNull(rs.getString("fclsname2"));
		fobjid2=cf.fillNull(rs.getString("fobjid2"));
		fobjname2=cf.fillNull(rs.getString("fobjname2"));
		fclsname3=cf.fillNull(rs.getString("fclsname3"));
		fobjid3=cf.fillNull(rs.getString("fobjid3"));
		fobjname3=cf.fillNull(rs.getString("fobjname3"));
		fclsname4=cf.fillNull(rs.getString("fclsname4"));
		fobjid4=cf.fillNull(rs.getString("fobjid4"));

		fobjname4=cf.fillNull(rs.getString("fobjname4"));
		fclsname5=cf.fillNull(rs.getString("fclsname5"));
		fobjid5=cf.fillNull(rs.getString("fobjid5"));
		fobjname5=cf.fillNull(rs.getString("fobjname5"));
		fclsname6=cf.fillNull(rs.getString("fclsname6"));
		fobjid6=cf.fillNull(rs.getString("fobjid6"));
		fobjname6=cf.fillNull(rs.getString("fobjname6"));
		fclsname7=cf.fillNull(rs.getString("fclsname7"));
		fobjid7=cf.fillNull(rs.getString("fobjid7"));
		fobjname7=cf.fillNull(rs.getString("fobjname7"));

		fclsname8=cf.fillNull(rs.getString("fclsname8"));
		fobjid8=cf.fillNull(rs.getString("fobjid8"));
		fobjname8=cf.fillNull(rs.getString("fobjname8"));
		ftransid=cf.fillNull(rs.getString("ftransid"));
		fcyid=cf.fillNull(rs.getString("fcyid"));
		fexchrate=rs.getDouble("fexchrate");
		fdc=cf.fillNull(rs.getString("fdc"));//�����־,1���裨�˿��0�������տ
		ffcyamt=rs.getDouble("ffcyamt");//ʵ�տ���
		fqty=rs.getDouble("fqty");
		fprice=rs.getDouble("fprice");

		fdebit=rs.getDouble("fdebit");
		fcredit=rs.getDouble("fcredit");
		fsettlcode=cf.fillNull(rs.getString("fsettlcode"));
		fsettleno=cf.fillNull(rs.getString("fsettleno"));
		fprepare=cf.fillNull(rs.getString("fprepare"));//�տ���
		fpay=cf.fillNull(rs.getString("fpay"));
		fcash=cf.fillNull(rs.getString("fcash"));
		fposter=cf.fillNull(rs.getString("fposter"));
		fchecker=cf.fillNull(rs.getString("fchecker"));
		fattchment=rs.getInt("fattchment");

		fposted=cf.fillNull(rs.getString("fposted"));
		fmodule=cf.fillNull(rs.getString("fmodule"));
		fdeleted=cf.fillNull(rs.getString("fdeleted"));
		fserialno=rs.getInt("fserialno");
		funitname=cf.fillNull(rs.getString("funitname"));
		freference=cf.fillNull(rs.getString("freference"));
		fcashflow=rs.getInt("fcashflow");

		int count=0;
		ls_sql=" select count(*) " ;
		ls_sql+=" from cw_impjdpz " ;
		ls_sql+=" where scbz='N' and fnum="+fnum+" and fentryid="+fentryid ;
		ps1= conn1.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if(rs1.next())
		{         
			count = rs1.getInt(1);			    
		}
		rs1.close();
		ps1.close();

		if (count>0)
		{
			conn1.rollback();
			out.println("<BR>����[ƾ֤�ţ�"+fnum+"]��[��¼�ţ�"+fentryid+"]�ѱ�����");
			return;
		}

		String khbh=null;//�ͻ����
		String sjs=null;//���ʦ
		String sjsbh=null;//��������ұ��
		String dwbh=null;//�������
		String fgsbh=null;//�����ֹ�˾���
		String khlx=null;//�ͻ�����
		ls_sql=" select khbh,sjs,sjsbh,dwbh,fgsbh,zt" ;
		ls_sql+=" from crm_khxx " ;
		ls_sql+=" where hth='"+fobjid1+"'";
		ps1= conn1.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if(rs1.next())
		{         
			khbh = rs1.getString("khbh").trim();			    
			sjs = rs1.getString("sjs");			    
			sjsbh = rs1.getString("sjsbh");			    
			dwbh = rs1.getString("dwbh");			    
			fgsbh = rs1.getString("fgsbh");			    
			khlx = rs1.getString("zt");	//2����װ�ͻ���3����װ���˵� ��4���Ǽ�װ�ͻ���5����ƿͻ�
		}
		else{
			conn1.rollback();
			out.println("<BR>���󣡺�ͬ�ţ�["+fobjid1+"]������");
			return;
		}
		rs1.close();
		ps1.close();

		if (khlx.equals("2"))//2����װ�ͻ�
		{
			khlx=khlx;
		}
		else if (khlx.equals("4"))//4���Ǽ�װ�ͻ�
		{
			khlx=khlx;
		}
		else if (khlx.equals("5"))//5����ƿͻ�
		{
			khlx=khlx;
		}

		String fklxbm=null;//�տ����ͱ���
		int fkcs=0;//�տ�����
		String jdbz=null;//�����־,1���裨�˿��0�������տ
		ls_sql=" select fklxbm,fkcs,jdbz" ;
		ls_sql+=" from cw_kmhbm " ;
		ls_sql+=" where kmhbm='"+facctid+"'";
		ps1= conn1.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if(rs1.next())
		{         
			fklxbm = rs1.getString("fklxbm");			    
			fkcs = rs1.getInt("fkcs");			    
			jdbz = rs1.getString("jdbz");			    
		}
		else{
			conn1.rollback();
			out.println("<BR>���󣡿�Ŀ�ţ�["+facctid+"]������");
			return;
		}
		rs1.close();
		ps1.close();


		ls_sql="insert into cw_impjdpz(xuhao,fdate,ftransdate,fperiod,fgroup,fnum,fentryid,fexp,facctid,fclsname1";
		ls_sql+=" ,fobjid1,fobjname1,fclsname2,fobjid2,fobjname2,fclsname3,fobjid3,fobjname3,fclsname4,fobjid4 ";
		ls_sql+=" ,fobjname4,fclsname5,fobjid5,fobjname5,fclsname6,fobjid6,fobjname6,fclsname7,fobjid7,fobjname7";
		ls_sql+=" ,fclsname8,fobjid8,fobjname8,ftransid,fcyid,fexchrate,fdc,ffcyamt,fqty,fprice";
		ls_sql+=" ,fdebit,fcredit,fsettlcode,fsettleno,fprepare,fpay,fcash,fposter,fchecker,fattchment ";
		ls_sql+=" ,fposted,fmodule,fdeleted,fserialno,funitname,freference,fcashflow,drsj,drr,drfgs,bz,scbz) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,SYSDATE,?,?,'����','N' ) ";
		ps1= conn1.prepareStatement(ls_sql);
		ps1.setLong(1,xuhao);
		ps1.setDate(2,fdate);
		ps1.setDate(3,ftransdate);//ҵ������
		ps1.setInt(4,fperiod);
		ps1.setString(5,fgroup);
		ps1.setInt(6,fnum);
		ps1.setInt(7,fentryid);
		ps1.setString(8,fexp);
		ps1.setString(9,facctid);//��Ŀ��
		ps1.setString(10,fclsname1);

		ps1.setString(11,fobjid1);//��ͬ��
		ps1.setString(12,fobjname1);//Ʒ�ƣ��ͻ�����
		ps1.setString(13,fclsname2);
		ps1.setString(14,fobjid2);
		ps1.setString(15,fobjname2);
		ps1.setString(16,fclsname3);
		ps1.setString(17,fobjid3);
		ps1.setString(18,fobjname3);
		ps1.setString(19,fclsname4);
		ps1.setString(20,fobjid4);


		ps1.setString(21,fobjname4);
		ps1.setString(22,fclsname5);
		ps1.setString(23,fobjid5);
		ps1.setString(24,fobjname5);
		ps1.setString(25,fclsname6);
		ps1.setString(26,fobjid6);
		ps1.setString(27,fobjname6);
		ps1.setString(28,fclsname7);
		ps1.setString(29,fobjid7);
		ps1.setString(30,fobjname7);

		ps1.setString(31,fclsname8);
		ps1.setString(32,fobjid8);
		ps1.setString(33,fobjname8);
		ps1.setString(34,ftransid);
		ps1.setString(35,fcyid);
		ps1.setDouble(36,fexchrate);
		ps1.setString(37,fdc);//�����־,1���裨�˿��0�������տ
		ps1.setDouble(38,ffcyamt);//ʵ�տ���
		ps1.setDouble(39,fqty);
		ps1.setDouble(40,fprice);

		ps1.setDouble(41,fdebit);
		ps1.setDouble(42,fcredit);
		ps1.setString(43,fsettlcode);
		ps1.setString(44,fsettleno);
		ps1.setString(45,fprepare);//�տ���
		ps1.setString(46,fpay);
		ps1.setString(47,fcash);
		ps1.setString(48,fposter);
		ps1.setString(49,fchecker);
		ps1.setInt(50,fattchment);

		ps1.setString(51,fposted);
		ps1.setString(52,fmodule);
		ps1.setString(53,fdeleted);
		ps1.setInt(54,fserialno);
		ps1.setString(55,funitname);
		ps1.setString(56,freference);
		ps1.setInt(57,fcashflow);
		ps1.setString(58,yhmc);
		ps1.setString(59,drfgs);

		ps1.executeUpdate();
		ps1.close();

		//�����־,1���裨�˿��0�������տ
		if (fdc.equals("1"))
		{
			ffcyamt=ffcyamt*-1;
		}
		else if (fdc.equals("0"))
		{
		}
		else
		{
			conn1.rollback();
			out.println("<BR>���󣡽����־Ӧ��Ϊ0��1");
			return;
		}

		if (!fklxbm.equals("21") && !fklxbm.equals("22") && !fklxbm.equals("23") && !fklxbm.equals("24"))//21:ľ�ţ�22:����23:���ģ�24���Ҿ�
		{
			fobjname1="";//Ʒ��
		}

		//�ͻ������¼
		String fkxh=null;//�տ����
		ls_sql="select NVL(max(substr(fkxh,83)),0)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps1= conn1.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		fkxh=khbh+cf.addZero(count+1,3);

		ls_sql="insert into cw_khfkjl (fkxh,khbh,sjs,sjsbh,dwbh,fgsbh,khlx,sjbh,fklxbm,gysbh";
		ls_sql+=" ,zffs,zckx,fkcs,yfkbl,yfkje,sfkbl,fkje,jkr,skr,sksj";
		ls_sql+=" ,skdw,skdd,dsksjbz,sjr,sjsj,sjfkzc,sfyjqk,lrr,lrsj,lrdw  ,scbz,scr,scsj,bz,xuhao,czlx) ";//1��¼�룻2��������3�����룻
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?,SYSDATE,?  ,?,?,?,?,?,'3' ) ";//1�������տ2���ǲ�����տ�
		ps1= conn1.prepareStatement(ls_sql);
		ps1.setString(1,fkxh);
		ps1.setString(2,khbh);
		ps1.setString(3,sjs);
		ps1.setString(4,sjsbh);
		ps1.setString(5,dwbh);
		ps1.setString(6,fgsbh);
		ps1.setString(7,khlx);
		ps1.setString(8,null);
		ps1.setString(9,fklxbm);
		ps1.setString(10,fobjname1);//Ʒ��

		ps1.setString(11,"11");//11:�ֽ�12��֧Ʊ��13�����ۣ�14�����п���15������ת�ʣ�16���ֽ�ȯ��31��ת����99������
		ps1.setString(12,null);
		ps1.setInt(13,fkcs);
		ps1.setString(14,null);
		ps1.setString(15,null);
		ps1.setString(16,null);
		ps1.setDouble(17,ffcyamt);//ʵ�տ���
		ps1.setString(18,null);
		ps1.setString(19,fprepare);//�տ���
		ps1.setDate(20,ftransdate);//ҵ������

		ps1.setString(21,lrdw);
		ps1.setString(22,"1");//�Ƿ������,1�������տ2���ǲ�����տ�
		ps1.setString(23,null);
		ps1.setString(24,null);
		ps1.setString(25,null);
		ps1.setString(26,null);
		ps1.setString(27,null);
		ps1.setString(28,yhmc);
		ps1.setString(29,lrdw);

		ps1.setString(30,"N");//ɾ����־,N��δɾ����Y����ɾ��
		ps1.setString(31,null);
		ps1.setString(32,null);
		ps1.setString(33,"ƾ֤����");
		ps1.setLong(34,xuhao);
		ps1.executeUpdate();
		ps1.close();

	
		if (fklxbm.equals("11"))//11����װ��
		{
			double sfke=0;
			ls_sql="select sum(fkje)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N'";
			ps1= conn1.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				sfke=rs1.getDouble(1);//���չ��̿�
			}
			rs1.close();
			ps1.close();

			double gckzc=0;
			ls_sql="select sum(fkje)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and zffs='31' and zckx='11' and scbz='N'";
			ps1= conn1.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				gckzc=rs1.getDouble(1);//ת�����̿�
			}
			rs1.close();
			ps1.close();

			sfke=sfke-gckzc;

			//���£����̿�ʵ�տ��ʡ����̿�ʵ�տ��
			ls_sql="update crm_khxx set sfke=?,jzkfkcs=?,jzkfkxh=?,jzkfksj=?";
			ls_sql+=" where khbh='"+khbh+"'";
			ps1= conn1.prepareStatement(ls_sql);
			ps1.setDouble(1,sfke);
			ps1.setInt(2,fkcs);
			ps1.setString(3,fkxh);
			ps1.setDate(4,ftransdate);
			ps1.executeUpdate();
			ps1.close();
		}
	
	
	}

	conn1.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("�������ݳɹ�������������[<%=row%>]��");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn1.rollback();
	out.print("����ʧ�ܣ�Exception:" + e);
	return;
}
finally 
{
	conn1.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) conn.close();
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn1 != null) cf.close(conn1);    //�ͷ�����

		f.close();
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%> 

</body>
</html>

