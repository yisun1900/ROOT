<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");

String rootPath=getServletContext().getRealPath("");
%>

<%
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

Connection conn  = null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;

String driver = "sun.jdbc.odbc.JdbcOdbcDriver";
String url = "jdbc:odbc:impcgdd";
String user = "";
String passwd = "";

int count=0;
	


try {
	//拷贝标准凭证文件
	String DBFSourece=rootPath+"\\foxpro\\JINDIEPZ.DBF";
	String DownFile=rootPath+"\\foxpro\\"+yhdlm+".dbf";

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
	

	Class.forName (driver);
	conn = DriverManager.getConnection(url, user, passwd);

	java.sql.Date fdate=null;
	java.sql.Date ftransdate=null;
	int fperiod=0;//会计期间
	String fgroup=null;//凭证字
	int fnum=0;//凭证号
	int fentryid=0;//分录号
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
	double fexchrate=0;//汇率
	String fdc=null;
	double ffcyamt=0;//原币金额
	double fqty=0;//数量
	double fprice=0;//单价

	double fdebit=0;//借方发生额
	double fcredit=0;//贷方发生额
	String fsettlcode=null;
	String fsettleno=null;
	String fprepare=null;
	String fpay=null;
	String fcash=null;
	String fposter=null;
	String fchecker=null;
	int fattchment=0;//附件张数

	int fposted=0;
	String fmodule=null;
	int fdeleted=0;//凭证序号
	int fserialno=0;//凭证序号
	String funitname=null;
	String freference=null;
	int fcashflow=0;//是否已指定现金流量

	conn.setAutoCommit(false);

	
	int row=0;
	ls_sql="select fdate,ftransdate,fperiod,fgroup,fnum,fentryid,fexp,facctid,fclsname1";
	ls_sql+=" ,fobjid1,fobjname1,fclsname2,fobjid2,fobjname2,fclsname3,fobjid3,fobjname3,fclsname4,fobjid4 ";
	ls_sql+=" ,fobjname4,fclsname5,fobjid5,fobjname5,fclsname6,fobjid6,fobjname6,fclsname7,fobjid7,fobjname7";
	ls_sql+=" ,fclsname8,fobjid8,fobjname8,ftransid,fcyid,fexchrate,fdc,ffcyamt,fqty,fprice";
	ls_sql+=" ,fdebit,fcredit,fsettlcode,fsettleno,fprepare,fpay,fcash,fposter,fchecker,fattchment ";
	ls_sql+=" ,fposted,fmodule,fdeleted,fserialno,funitname,freference,fcashflow";
	ls_sql+= " from 1234";
	ls_sql+= " order by fnum,fentryid";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while(rs.next())
	{
		row++;

		out.println(row);

		fdate=rs.getDate("fdate");
		ftransdate=rs.getDate("ftransdate");//业务日期
		fperiod=rs.getInt("fperiod");
		fgroup=cf.fillNull(rs.getString("fgroup"));
		fnum=rs.getInt("fnum");
		fentryid=rs.getInt("fentryid");
		fexp=cf.fillNull(rs.getString("fexp"));
		facctid=cf.fillNull(rs.getString("facctid"));//科目号
		fclsname1=cf.fillNull(rs.getString("fclsname1"));

		fobjid1=cf.fillNull(rs.getString("fobjid1"));//合同号
		fobjname1=cf.fillNull(rs.getString("fobjname1"));//品牌，客户姓名
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
		fdc=cf.fillNull(rs.getString("fdc"));//借贷标志,1：借（退款）；0：贷（收款）
		ffcyamt=rs.getDouble("ffcyamt");//实收款金额
		fqty=rs.getDouble("fqty");
		fprice=rs.getDouble("fprice");

		fdebit=rs.getDouble("fdebit");
		fcredit=rs.getDouble("fcredit");
		fsettlcode=cf.fillNull(rs.getString("fsettlcode"));
		fsettleno=cf.fillNull(rs.getString("fsettleno"));
		fprepare=cf.fillNull(rs.getString("fprepare"));//收款人
		fpay=cf.fillNull(rs.getString("fpay"));
		fcash=cf.fillNull(rs.getString("fcash"));
		fposter=cf.fillNull(rs.getString("fposter"));
		fchecker=cf.fillNull(rs.getString("fchecker"));
		fattchment=rs.getInt("fattchment");

		fposted=rs.getInt("fposted");
		fmodule=cf.fillNull(rs.getString("fmodule"));
		fdeleted=rs.getInt("fdeleted");
		fserialno=rs.getInt("fserialno");
		funitname=cf.fillNull(rs.getString("funitname"));
		freference=cf.fillNull(rs.getString("freference"));
		fcashflow=rs.getInt("fcashflow");


		ls_sql="insert into "+yhdlm+"(fdate,ftransdate,fperiod,fgroup,fnum,fentryid,fexp,facctid,fclsname1,fobjid1";
		ls_sql+=" ,fobjname1,fclsname2,fobjid2,fobjname2,fclsname3,fobjid3,fobjname3,fclsname4,fobjid4,fobjname4 ";
		ls_sql+=" ,fclsname5,fobjid5,fobjname5,fclsname6,fobjid6,fobjname6,fclsname7,fobjid7,fobjname7,fclsname8";
		ls_sql+=" ,fobjid8,fobjname8,ftransid,fcyid,fexchrate,fdc,ffcyamt,fqty,fprice,fdebit";
		ls_sql+=" ,fcredit,fsettlcode,fsettleno,fprepare,fpay,fcash,fposter,fchecker,fattchment,fposted ";
		ls_sql+=" ,fmodule,fdeleted,fserialno,funitname,freference,fcashflow) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?) ";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDate(1,fdate);
		ps1.setDate(2,ftransdate);//业务日期
		ps1.setInt(3,fperiod);
		ps1.setString(4,fgroup);
		ps1.setInt(5,fnum);
		ps1.setInt(6,fentryid);
		ps1.setString(7,fexp);
		ps1.setString(8,facctid);//科目号
		ps1.setString(9,fclsname1);
		ps1.setString(10,fobjid1);//合同号


		ps1.setString(11,fobjname1);//品牌，客户姓名
		ps1.setString(12,fclsname2);
		ps1.setString(13,fobjid2);
		ps1.setString(14,fobjname2);
		ps1.setString(15,fclsname3);
		ps1.setString(16,fobjid3);
		ps1.setString(17,fobjname3);
		ps1.setString(18,fclsname4);
		ps1.setString(19,fobjid4);
		ps1.setString(20,fobjname4);


		ps1.setString(21,fclsname5);
		ps1.setString(22,fobjid5);
		ps1.setString(23,fobjname5);
		ps1.setString(24,fclsname6);
		ps1.setString(25,fobjid6);
		ps1.setString(26,fobjname6);
		ps1.setString(27,fclsname7);
		ps1.setString(28,fobjid7);
		ps1.setString(29,fobjname7);
		ps1.setString(30,fclsname8);

		ps1.setString(31,fobjid8);
		ps1.setString(32,fobjname8);
		ps1.setString(33,ftransid);
		ps1.setString(34,fcyid);
		ps1.setDouble(35,fexchrate);
		ps1.setString(36,fdc);//借贷标志,1：借（退款）；0：贷（收款）
		ps1.setDouble(37,ffcyamt);//实收款金额
		ps1.setDouble(38,fqty);
		ps1.setDouble(39,fprice);
		ps1.setDouble(40,fdebit);

		ps1.setDouble(41,fcredit);
		ps1.setString(42,fsettlcode);
		ps1.setString(43,fsettleno);
		ps1.setString(44,fprepare);//收款人
		ps1.setString(45,fpay);
		ps1.setString(46,fcash);
		ps1.setString(47,fposter);
		ps1.setString(48,fchecker);
		ps1.setInt(49,fattchment);
		ps1.setInt(50,fposted);

		ps1.setString(51,fmodule);
		ps1.setInt(52,fdeleted);
		ps1.setInt(53,fserialno);
		ps1.setString(54,funitname);
		ps1.setString(55,freference);
		ps1.setInt(56,fcashflow);

		ps1.executeUpdate();
		ps1.close();

	
	}

	conn.commit();

	out.print("<P>成功导出凭证："+yhdlm+".dbf、"+yhdlm+"CF.dbf，共导出记录数："+row);
}
catch (Exception e) {
	conn.rollback();

	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);

	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn);    //释放连接
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>
<BR><BR>点击鼠标右键下载凭证（两个文件）：
<A HREF="/foxpro/<%=yhdlm%>.dbf"><%=yhdlm%>.dbf</A> 
&nbsp;&nbsp;
<A HREF="/foxpro/<%=yhdlm%>CF.dbf"><%=yhdlm%>CF.dbf</A>