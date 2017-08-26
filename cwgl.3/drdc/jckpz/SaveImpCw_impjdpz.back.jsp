<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>凭证－导入 </title>
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

	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\foxpro\\IMP_"+yhdlm+".DBF";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer);
	f.close();
%>


<%
	String driver = "sun.jdbc.odbc.JdbcOdbcDriver";
	String url = "jdbc:odbc:impcgdd";
	String user = "";
	String passwd = "";

	conn1=cf.getConnection();    //得到连接
	
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

	String fposted=null;
	String fmodule=null;
	String fdeleted=null;
	int fserialno=0;//凭证序号
	String funitname=null;
	String freference=null;
	int fcashflow=0;//是否已指定现金流量


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
			out.println("<BR>错误！[凭证号："+fnum+"]和[分录号："+fentryid+"]已被导入");
			return;
		}

		String khbh=null;//客户编号
		String sjs=null;//设计师
		String sjsbh=null;//所属设计室编号
		String dwbh=null;//店面编码
		String fgsbh=null;//所属分公司编号
		String khlx=null;//客户类型
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
			khlx = rs1.getString("zt");	//2：家装客户；3：家装已退单 ；4：非家装客户；5：设计客户
		}
		else{
			conn1.rollback();
			out.println("<BR>错误！合同号：["+fobjid1+"]不存在");
			return;
		}
		rs1.close();
		ps1.close();

		if (khlx.equals("2"))//2：家装客户
		{
			khlx=khlx;
		}
		else if (khlx.equals("4"))//4：非家装客户
		{
			khlx=khlx;
		}
		else if (khlx.equals("5"))//5：设计客户
		{
			khlx=khlx;
		}

		String fklxbm=null;//收款类型编码
		int fkcs=0;//收款期数
		String jdbz=null;//借贷标志,1：借（退款）；0：贷（收款）
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
			out.println("<BR>错误！科目号：["+facctid+"]不存在");
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
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,SYSDATE,?,?,'导入','N' ) ";
		ps1= conn1.prepareStatement(ls_sql);
		ps1.setLong(1,xuhao);
		ps1.setDate(2,fdate);
		ps1.setDate(3,ftransdate);//业务日期
		ps1.setInt(4,fperiod);
		ps1.setString(5,fgroup);
		ps1.setInt(6,fnum);
		ps1.setInt(7,fentryid);
		ps1.setString(8,fexp);
		ps1.setString(9,facctid);//科目号
		ps1.setString(10,fclsname1);

		ps1.setString(11,fobjid1);//合同号
		ps1.setString(12,fobjname1);//品牌，客户姓名
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
		ps1.setString(37,fdc);//借贷标志,1：借（退款）；0：贷（收款）
		ps1.setDouble(38,ffcyamt);//实收款金额
		ps1.setDouble(39,fqty);
		ps1.setDouble(40,fprice);

		ps1.setDouble(41,fdebit);
		ps1.setDouble(42,fcredit);
		ps1.setString(43,fsettlcode);
		ps1.setString(44,fsettleno);
		ps1.setString(45,fprepare);//收款人
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

		//借贷标志,1：借（退款）；0：贷（收款）
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
			out.println("<BR>错误！借贷标志应该为0或1");
			return;
		}

		if (!fklxbm.equals("21") && !fklxbm.equals("22") && !fklxbm.equals("23") && !fklxbm.equals("24"))//21:木门；22:橱柜；23:主材；24：家具
		{
			fobjname1="";//品牌
		}

		//客户付款记录
		String fkxh=null;//收款序号
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
		ls_sql+=" ,skdw,skdd,dsksjbz,sjr,sjsj,sjfkzc,sfyjqk,lrr,lrsj,lrdw  ,scbz,scr,scsj,bz,xuhao,czlx) ";//1：录入；2：导出；3：导入；
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?,SYSDATE,?  ,?,?,?,?,?,'3' ) ";//1：财务收款；2：非财务代收款
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
		ps1.setString(10,fobjname1);//品牌

		ps1.setString(11,"11");//11:现金；12：支票；13：存折；14：银行卡；15：银行转帐；16：现金券；31：转出；99：其它
		ps1.setString(12,null);
		ps1.setInt(13,fkcs);
		ps1.setString(14,null);
		ps1.setString(15,null);
		ps1.setString(16,null);
		ps1.setDouble(17,ffcyamt);//实收款金额
		ps1.setString(18,null);
		ps1.setString(19,fprepare);//收款人
		ps1.setDate(20,ftransdate);//业务日期

		ps1.setString(21,lrdw);
		ps1.setString(22,"1");//是否需审核,1：财务收款；2：非财务代收款
		ps1.setString(23,null);
		ps1.setString(24,null);
		ps1.setString(25,null);
		ps1.setString(26,null);
		ps1.setString(27,null);
		ps1.setString(28,yhmc);
		ps1.setString(29,lrdw);

		ps1.setString(30,"N");//删除标志,N：未删除；Y：已删除
		ps1.setString(31,null);
		ps1.setString(32,null);
		ps1.setString(33,"凭证导入");
		ps1.setLong(34,xuhao);
		ps1.executeUpdate();
		ps1.close();

	
		if (fklxbm.equals("11"))//11：家装款
		{
			double sfke=0;
			ls_sql="select sum(fkje)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N'";
			ps1= conn1.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				sfke=rs1.getDouble(1);//已收工程款
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
				gckzc=rs1.getDouble(1);//转出工程款
			}
			rs1.close();
			ps1.close();

			sfke=sfke-gckzc;

			//更新：工程款实收款率、工程款实收款额
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
	alert("导入数据成功！共导入数据[<%=row%>]条");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn1.rollback();
	out.print("操作失败，Exception:" + e);
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
		if (conn1 != null) cf.close(conn1);    //释放连接

		f.close();
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%> 

</body>
</html>

