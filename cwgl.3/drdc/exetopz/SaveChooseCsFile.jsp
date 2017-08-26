<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");

String fgsbh=request.getParameter("fgsbh");
String kmdm=request.getParameter("kmdm");
String[] hth =request.getParameterValues("hth");
String[] sskstr =request.getParameterValues("ssk");
String[] jskstr =request.getParameterValues("jsk");

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

String driver = "sun.jdbc.odbc.JdbcOdbcDriver";
String url = "jdbc:odbc:impcgdd";
String user = "";
String passwd = "";

int count=0;
	

String kmmc=null;//科目名称
String fexp=null;//凭证摘要
String gyscwdm=null;//财务代码
String gysbh=null;//家居供应商

java.sql.Date sksj=cf.getDate();

String fclsname1=null;//第一个核算项目所属类别名称
String fobjid1=null;//第一个核算项目ID
String fobjname1=null;//第一个核算项目名称
String fclsname2=null;//第二个核算项目所属类别名称
String fobjid2=null;//第二个核算项目ID
String fobjname2=null;//第二个核算项目名称
String fclsname3=null;//第三个核算项目所属类别名称
String fobjid3=null;//第三个核算项目ID
String fobjname3=null;//第三个核算项目名称
String fclsname4=null;//第4个核算项目所属类别名称
String fobjid4=null;//第4个核算项目ID
String fobjname4=null;//第4个核算项目名称

String khbh=null;//客户编号
String khxm=null;//客户姓名
String sjs=null;//设计师
String sjsbh=null;//所属设计室编号
String dwbh=null;//店面编码


Hashtable<String,Double> sskHz=new Hashtable<String,Double>();//存放店面实收款汇总
Hashtable<String,Double> jskHz=new Hashtable<String,Double>();//存放店面结算款汇总

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

	//新增凭证
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
	

	Class.forName (driver);
	conn = DriverManager.getConnection(url, user, passwd);

	conn1=cf.getConnection();    //得到连接


	String fklxbm="";//收款类型编码
	kmmc="";//科目名称
	fexp="";//凭证摘要
	gyscwdm="";//财务代码
	gysbh="";//家居供应商

	ls_sql=" select kmmc,fklxbm,cwdm,gysbh" ;
	ls_sql+=" from cw_jckmdm " ;
	ls_sql+=" where kmdm='"+kmdm+"' and fgsbh='"+fgsbh+"'";
	ps2= conn1.prepareStatement(ls_sql);
	rs2=ps2.executeQuery();
	if(rs2.next())
	{         
		kmmc = cf.fillNull(rs2.getString("kmmc"));			    
		fklxbm = cf.fillNull(rs2.getString("fklxbm"));	//21:木门；22:橱柜；23:主材；24：家具   
		gyscwdm = cf.fillNull(rs2.getString("cwdm"));			    
		gysbh = cf.fillNull(rs2.getString("gysbh"));			    
	}
	else{
		out.println("<BR>错误！科目代码：["+kmdm+"]不存在");
		return;
	}
	rs2.close();
	ps2.close();

	if (gyscwdm==null || gyscwdm.equals(""))
	{
		out.println("<BR>错误！家居供应商凭证代码不存在，请到【数据字典－>财务－>集成科目代码->维护】中添加");
		return;
	}

	conn.setAutoCommit(false);

	int row=-1;
	double dmssk=0;
	double allssk=0;
	for (int i=0;i<hth.length ;i++ )
	{
		row++;

		//实收款
		double ssk=0;
		if (sskstr[i]!=null && !sskstr[i].trim().equals(""))
		{
			try{
				ssk=Double.parseDouble(sskstr[i].trim());
			}
			catch (Exception e) {
				conn.rollback();
				out.print("序号["+i+"]出错！[实收款]非数字：" + sskstr[i]);
				return;
			}
		}

		allssk+=ssk;

		
		String fdc="1";//D：借；C：贷,1：借（退款）；0：贷（收款）
		double fdebit=ssk;//借方发生额
		double fcredit=0;//贷方发生额


		fexp="结转"+kmmc+"收入";


		ls_sql=" select khbh,khxm,sjs,sjsbh,dwbh" ;
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
		}
		else{
			conn.rollback();
			out.println("<BR>错误！合同号["+hth[i]+"]不存在");
			return;
		}
		rs1.close();
		ps1.close();
		
		

		String cwdm=null;//财务代码
		String dwmc=null;//财务代码
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
			out.println("<BR>错误！店面编码["+dwbh+"]不存在");
			return;
		}
		rs2.close();
		ps2.close();

		if (cwdm==null || cwdm.equals(""))
		{
			conn.rollback();
			out.println("<BR>错误！店面["+dwmc+"]的财务代码不存在");
			return;
		}

		//计算各店面的汇总+++++++++++++++++++
		//保存店面编码
		double lsHz=0;
		if ((Double)sskHz.get(dwbh)==null)
		{
			lsHz=ssk;
		}
		else{
			lsHz=(Double)sskHz.get(dwbh).doubleValue()+ssk;//获得列类型
		}
		sskHz.put(dwbh,new Double(lsHz));
		//计算各店面的汇总-------------------
		


		fclsname1="客户";
		fobjid1=hth[i];
		fobjname1=khxm;

		fclsname2="部门";
		fobjid2=cwdm;//财务代码
		fobjname2=dwmc;

		fclsname3="家装设计师";
		fobjid3="198";
		fobjname3="09年";

		if (fklxbm.equals("21"))//21:木门；22:橱柜；23:主材；24：家具
		{
			fclsname4="材料顾问";
			fobjid4="04";
			fobjname4="09年";
		}
		else if (fklxbm.equals("22"))
		{
			fclsname4="家居设计师";
			fobjid4="015";
			fobjname4="09年";
		
			/*
			ls_sql=" select cgsjs" ;
			ls_sql+=" from jc_cgdd " ;
			ls_sql+=" where khbh='"+khbh+"'";
			ps1= conn1.prepareStatement(ls_sql);
			rs1=ps1.executeQuery();
			if(rs1.next())
			{         
				fobjname4 = rs1.getString("cgsjs");			    
			}
			else{
				out.println("<BR>提醒！合同号["+hth[i]+"]家居设计师不存在");
				fobjname4="未知";
			}
			rs1.close();
			ps1.close();
			*/

		}
		else if (fklxbm.equals("23"))//23:主材
		{
			fclsname4="材料顾问";
			fobjid4="04";
			fobjname4="09年";
		}
		else if (fklxbm.equals("24"))//24：家具
		{
			fclsname4="家居设计师";
			fobjid4="015";
			fobjname4="09年";
			
			/*
			ls_sql=" select jjsjs" ;
			ls_sql+=" from jc_jjdd " ;
			ls_sql+=" where khbh='"+khbh+"'";
			ps1= conn1.prepareStatement(ls_sql);
			rs1=ps1.executeQuery();
			if(rs1.next())
			{         
				fobjname4 = rs1.getString("jjsjs");			    
			}
			else{
				out.println("<BR>提醒！合同号["+hth[i]+"]家居设计师不存在");
				fobjname4="未知";
			}
			rs1.close();
			ps1.close();
			*/
		}
		else{
			conn.rollback();
			out.println("<BR>错误！["+kmmc+"]收款类型不存在，请在集成科目代码中修改");
			return;
		}

		ls_sql="insert into "+yhdlm+"(fdate,ftransdate,fperiod,fgroup,fnum,fentryid,fexp,facctid,fclsname1,fobjid1";
		ls_sql+=" ,fobjname1,fclsname2,fobjid2,fobjname2,fclsname3,fobjid3,fobjname3,fclsname4,fobjid4,fobjname4 ";
		ls_sql+=" ,fclsname5,fobjid5,fobjname5,fclsname6,fobjid6,fobjname6,fclsname7,fobjid7,fobjname7,fclsname8";
		ls_sql+=" ,fobjid8,fobjname8,ftransid,fcyid,fexchrate,fdc,ffcyamt,fqty,fprice,fdebit";
		ls_sql+=" ,fcredit,fsettlcode,fsettleno,fprepare,fpay,fcash,fposter,fchecker,fattchment,fposted ";
		ls_sql+=" ,fmodule,fdeleted,fserialno,funitname,freference,fcashflow)";
		ls_sql+= " values(?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,sksj);
		ps.setDate(2,sksj);
		ps.setInt(3,0);//会计期间
		ps.setString(4,"记");//凭证字
		ps.setInt(5,0);//凭证号
		ps.setInt(6,row);//分录号
		ps.setString(7,fexp);//凭证摘要
		ps.setString(8,kmdm);//科目号
		ps.setString(9,fclsname1);//第一个核算项目所属类别名称
		ps.setString(10,fobjid1);//第一个核算项目ID

		ps.setString(11,fobjname1);//第一个核算项目名称
		ps.setString(12,fclsname2);
		ps.setString(13,fobjid2);
		ps.setString(14,fobjname2);
		ps.setString(15,fclsname3);
		ps.setString(16,fobjid3);
		ps.setString(17,fobjname3);
		ps.setString(18,fclsname4);//第四个核算项目所属类别名称
		ps.setString(19,fobjid4);//第四个核算项目ID
		ps.setString(20,fobjname4);//第四个核算项目名称

		ps.setString(21,"");
		ps.setString(22,"");
		ps.setString(23,"");
		ps.setString(24,"");
		ps.setString(25,"");
		ps.setString(26,"");
		ps.setString(27,"");
		ps.setString(28,"");
		ps.setString(29,"");
		ps.setString(30,"");

		ps.setString(31,"");
		ps.setString(32,"");
		ps.setString(33,"");//业务编号
		ps.setString(34,"RMB");//币种
		ps.setDouble(35,1);//汇率
		ps.setString(36,fdc);//D：借；C：贷
		ps.setDouble(37,ssk);//原币金额
		ps.setDouble(38,0);//数量
		ps.setDouble(39,0);//单价
		ps.setDouble(40,fdebit);//借方发生额

		ps.setDouble(41,fcredit);//贷方发生额
		ps.setString(42,"*");//结算方式名称
		ps.setString(43,"");//结算号
		ps.setString(44,yhmc);//制单人
		ps.setString(45,"");//
		ps.setString(46,"");//
		ps.setString(47,"");//过账人
		ps.setString(48,"");//审核人
		ps.setInt(49,0);//附件张数
		ps.setInt(50,0);//过账标记

		ps.setString(51,"");//机制凭证模块标识
		ps.setInt(52,0);//删除标记
		ps.setInt(53,0);//凭证序号
		ps.setString(54,"");//单位
		ps.setString(55,"");//参考信息
		ps.setInt(56,0);//是否已指定现金流量
		
		ps.executeUpdate();
		ps.close();

	}

	//输出各店面值
	Enumeration dwbmList=sskHz.keys();
	while (dwbmList.hasMoreElements() )
	{
		row++;

		dwbh=(String)dwbmList.nextElement();
		dmssk=(Double)sskHz.get(dwbh).doubleValue();//获得列类型

		String cwdm=null;//财务代码
		String dwmc=null;//财务代码
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
			out.println("<BR>错误！店面编码["+dwbh+"]不存在");
			return;
		}
		rs2.close();
		ps2.close();

		if (cwdm==null || cwdm.equals(""))
		{
			conn.rollback();
			out.println("<BR>错误！店面["+dwmc+"]的财务代码不存在");
			return;
		}
	
	
		String fdc="0";//D：借；C：贷,1：借（退款）；0：贷（收款）
		double fdebit=0;//借方发生额
		double fcredit=dmssk;//贷方发生额

		fclsname1="部门";
		fobjid1=cwdm;
		fobjname1=dwmc;

		fclsname2="家居供应商";
		fobjid2=gyscwdm;
		fobjname2=gysbh;

		fclsname3="";
		fobjid3="";
		fobjname3="";

		fclsname4="";
		fobjid4="";
		fobjname4="";


		ls_sql="insert into "+yhdlm+"(fdate,ftransdate,fperiod,fgroup,fnum,fentryid,fexp,facctid,fclsname1,fobjid1";
		ls_sql+=" ,fobjname1,fclsname2,fobjid2,fobjname2,fclsname3,fobjid3,fobjname3,fclsname4,fobjid4,fobjname4 ";
		ls_sql+=" ,fclsname5,fobjid5,fobjname5,fclsname6,fobjid6,fobjname6,fclsname7,fobjid7,fobjname7,fclsname8";
		ls_sql+=" ,fobjid8,fobjname8,ftransid,fcyid,fexchrate,fdc,ffcyamt,fqty,fprice,fdebit";
		ls_sql+=" ,fcredit,fsettlcode,fsettleno,fprepare,fpay,fcash,fposter,fchecker,fattchment,fposted ";
		ls_sql+=" ,fmodule,fdeleted,fserialno,funitname,freference,fcashflow)";
		ls_sql+= " values(?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,sksj);
		ps.setDate(2,sksj);
		ps.setInt(3,0);//会计期间
		ps.setString(4,"记");//凭证字
		ps.setInt(5,0);//凭证号
		ps.setInt(6,row);//分录号
		ps.setString(7,fexp);//凭证摘要
		ps.setString(8,"501.02.01");//科目号
		ps.setString(9,fclsname1);//第一个核算项目所属类别名称
		ps.setString(10,fobjid1);//第一个核算项目ID

		ps.setString(11,fobjname1);//第一个核算项目名称
		ps.setString(12,fclsname2);
		ps.setString(13,fobjid2);
		ps.setString(14,fobjname2);
		ps.setString(15,fclsname3);
		ps.setString(16,fobjid3);
		ps.setString(17,fobjname3);
		ps.setString(18,fclsname4);//第四个核算项目所属类别名称
		ps.setString(19,fobjid4);//第四个核算项目ID
		ps.setString(20,fobjname4);//第四个核算项目名称

		ps.setString(21,"");
		ps.setString(22,"");
		ps.setString(23,"");
		ps.setString(24,"");
		ps.setString(25,"");
		ps.setString(26,"");
		ps.setString(27,"");
		ps.setString(28,"");
		ps.setString(29,"");
		ps.setString(30,"");

		ps.setString(31,"");
		ps.setString(32,"");
		ps.setString(33,"");//业务编号
		ps.setString(34,"RMB");//币种
		ps.setDouble(35,1);//汇率
		ps.setString(36,fdc);//D：借；C：贷
		ps.setDouble(37,dmssk);//原币金额
		ps.setDouble(38,0);//数量
		ps.setDouble(39,0);//单价
		ps.setDouble(40,fdebit);//借方发生额

		ps.setDouble(41,fcredit);//贷方发生额
		ps.setString(42,"*");//结算方式名称
		ps.setString(43,"");//结算号
		ps.setString(44,yhmc);//制单人
		ps.setString(45,"");//
		ps.setString(46,"");//
		ps.setString(47,"");//过账人
		ps.setString(48,"");//审核人
		ps.setInt(49,0);//附件张数
		ps.setInt(50,0);//过账标记

		ps.setString(51,"");//机制凭证模块标识
		ps.setInt(52,0);//删除标记
		ps.setInt(53,0);//凭证序号
		ps.setString(54,"");//单位
		ps.setString(55,"");//参考信息
		ps.setInt(56,0);//是否已指定现金流量
		
		ps.executeUpdate();
		ps.close();


	}

	//生成新凭证+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	row=0;
	double dmjsk=0;
	double alljsk=0;
	for (int i=0;i<hth.length ;i++ )
	{
		//结算款
		double jsk=0;
		if (jskstr[i]!=null && !jskstr[i].trim().equals(""))
		{
			try{
				jsk=Double.parseDouble(jskstr[i].trim());
			}
			catch (Exception e) {
				conn.rollback();
				out.print("序号["+i+"]出错！[结算款]非数字：" + jskstr[i]);
				return;
			}
		}

		alljsk+=jsk;

		fexp="结转"+kmmc+"成本";

		ls_sql=" select khbh,khxm,sjs,sjsbh,dwbh" ;
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
		}
		else{
			conn.rollback();
			out.println("<BR>错误！合同号["+hth[i]+"]不存在");
			return;
		}
		rs1.close();
		ps1.close();
		
		

		//计算各店面的汇总+++++++++++++++++++
		//保存店面编码
		double lsHz=0;
		if ((Double)jskHz.get(dwbh)==null)
		{
			lsHz=jsk;
		}
		else{
			lsHz=(Double)jskHz.get(dwbh).doubleValue()+jsk;//获得列类型
		}
		jskHz.put(dwbh,new Double(lsHz));
		//计算各店面的汇总-------------------
		


	}

	//输出各店面值
	dwbmList=jskHz.keys();
	while (dwbmList.hasMoreElements() )
	{
		row++;

		dwbh=(String)dwbmList.nextElement();
		dmjsk=(Double)jskHz.get(dwbh).doubleValue();//获得列类型

		String cwdm=null;//财务代码
		String dwmc=null;//财务代码
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
			out.println("<BR>错误！店面编码["+dwbh+"]不存在");
			return;
		}
		rs2.close();
		ps2.close();

		if (cwdm==null || cwdm.equals(""))
		{
			conn.rollback();
			out.println("<BR>错误！店面["+dwmc+"]的财务代码不存在");
			return;
		}
	
		String fdc="1";//D：借；C：贷,1：借（退款）；0：贷（收款）
		double fdebit=dmjsk;//借方发生额
		double fcredit=0;//贷方发生额

		fclsname1="部门";
		fobjid1=cwdm;
		fobjname1=dwmc;

		fclsname2="家居供应商";
		fobjid2=gyscwdm;
		fobjname2=gysbh;

		fclsname3="";
		fobjid3="";
		fobjname3="";

		fclsname4="";
		fobjid4="";
		fobjname4="";


		ls_sql="insert into "+yhdlm+"1(fdate,ftransdate,fperiod,fgroup,fnum,fentryid,fexp,facctid,fclsname1,fobjid1";
		ls_sql+=" ,fobjname1,fclsname2,fobjid2,fobjname2,fclsname3,fobjid3,fobjname3,fclsname4,fobjid4,fobjname4 ";
		ls_sql+=" ,fclsname5,fobjid5,fobjname5,fclsname6,fobjid6,fobjname6,fclsname7,fobjid7,fobjname7,fclsname8";
		ls_sql+=" ,fobjid8,fobjname8,ftransid,fcyid,fexchrate,fdc,ffcyamt,fqty,fprice,fdebit";
		ls_sql+=" ,fcredit,fsettlcode,fsettleno,fprepare,fpay,fcash,fposter,fchecker,fattchment,fposted ";
		ls_sql+=" ,fmodule,fdeleted,fserialno,funitname,freference,fcashflow)";
		ls_sql+= " values(?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,sksj);
		ps.setDate(2,sksj);
		ps.setInt(3,0);//会计期间
		ps.setString(4,"记");//凭证字
		ps.setInt(5,0);//凭证号
		ps.setInt(6,row);//分录号
		ps.setString(7,fexp);//凭证摘要
		ps.setString(8,"502.02.01");//科目号
		ps.setString(9,fclsname1);//第一个核算项目所属类别名称
		ps.setString(10,fobjid1);//第一个核算项目ID

		ps.setString(11,fobjname1);//第一个核算项目名称
		ps.setString(12,fclsname2);
		ps.setString(13,fobjid2);
		ps.setString(14,fobjname2);
		ps.setString(15,fclsname3);
		ps.setString(16,fobjid3);
		ps.setString(17,fobjname3);
		ps.setString(18,fclsname4);//第四个核算项目所属类别名称
		ps.setString(19,fobjid4);//第四个核算项目ID
		ps.setString(20,fobjname4);//第四个核算项目名称

		ps.setString(21,"");
		ps.setString(22,"");
		ps.setString(23,"");
		ps.setString(24,"");
		ps.setString(25,"");
		ps.setString(26,"");
		ps.setString(27,"");
		ps.setString(28,"");
		ps.setString(29,"");
		ps.setString(30,"");

		ps.setString(31,"");
		ps.setString(32,"");
		ps.setString(33,"");//业务编号
		ps.setString(34,"RMB");//币种
		ps.setDouble(35,1);//汇率
		ps.setString(36,fdc);//D：借；C：贷
		ps.setDouble(37,dmjsk);//原币金额
		ps.setDouble(38,0);//数量
		ps.setDouble(39,0);//单价
		ps.setDouble(40,fdebit);//借方发生额

		ps.setDouble(41,fcredit);//贷方发生额
		ps.setString(42,"*");//结算方式名称
		ps.setString(43,"");//结算号
		ps.setString(44,yhmc);//制单人
		ps.setString(45,"");//
		ps.setString(46,"");//
		ps.setString(47,"");//过账人
		ps.setString(48,"");//审核人
		ps.setInt(49,0);//附件张数
		ps.setInt(50,0);//过账标记

		ps.setString(51,"");//机制凭证模块标识
		ps.setInt(52,0);//删除标记
		ps.setInt(53,0);//凭证序号
		ps.setString(54,"");//单位
		ps.setString(55,"");//参考信息
		ps.setInt(56,0);//是否已指定现金流量
		
		ps.executeUpdate();
		ps.close();


	}
		
	if (row>0)
	{
		kmdm="203.06.01";
		
		String fdc="0";//D：借；C：贷,1：借（退款）；0：贷（收款）
		double fdebit=0;//借方发生额
		double fcredit=alljsk;//贷方发生额

		fclsname1="家居供应商";
		fobjid1=gyscwdm;
		fobjname1=gysbh;

		fclsname2="";
		fobjid2="";
		fobjname2="";

		fclsname3="";
		fobjid3="";
		fobjname3="";

		fclsname4="";
		fobjid4="";
		fobjname4="";

		ls_sql="insert into "+yhdlm+"1(fdate,ftransdate,fperiod,fgroup,fnum,fentryid,fexp,facctid,fclsname1,fobjid1";
		ls_sql+=" ,fobjname1,fclsname2,fobjid2,fobjname2,fclsname3,fobjid3,fobjname3,fclsname4,fobjid4,fobjname4 ";
		ls_sql+=" ,fclsname5,fobjid5,fobjname5,fclsname6,fobjid6,fobjname6,fclsname7,fobjid7,fobjname7,fclsname8";
		ls_sql+=" ,fobjid8,fobjname8,ftransid,fcyid,fexchrate,fdc,ffcyamt,fqty,fprice,fdebit";
		ls_sql+=" ,fcredit,fsettlcode,fsettleno,fprepare,fpay,fcash,fposter,fchecker,fattchment,fposted ";
		ls_sql+=" ,fmodule,fdeleted,fserialno,funitname,freference,fcashflow)";
		ls_sql+= " values(?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,sksj);
		ps.setDate(2,sksj);
		ps.setInt(3,0);//会计期间
		ps.setString(4,"记");//凭证字
		ps.setInt(5,0);//凭证号
		ps.setInt(6,0);//分录号
		ps.setString(7,fexp);//凭证摘要
		ps.setString(8,kmdm);//科目号
		ps.setString(9,fclsname1);//第一个核算项目所属类别名称
		ps.setString(10,fobjid1);//第一个核算项目ID

		ps.setString(11,fobjname1);//第一个核算项目名称
		ps.setString(12,fclsname2);
		ps.setString(13,fobjid2);
		ps.setString(14,fobjname2);
		ps.setString(15,fclsname3);
		ps.setString(16,fobjid3);
		ps.setString(17,fobjname3);
		ps.setString(18,fclsname4);//第四个核算项目所属类别名称
		ps.setString(19,fobjid4);//第四个核算项目ID
		ps.setString(20,fobjname4);//第四个核算项目名称

		ps.setString(21,"");
		ps.setString(22,"");
		ps.setString(23,"");
		ps.setString(24,"");
		ps.setString(25,"");
		ps.setString(26,"");
		ps.setString(27,"");
		ps.setString(28,"");
		ps.setString(29,"");
		ps.setString(30,"");

		ps.setString(31,"");
		ps.setString(32,"");
		ps.setString(33,"");//业务编号
		ps.setString(34,"RMB");//币种
		ps.setDouble(35,1);//汇率
		ps.setString(36,fdc);//D：借；C：贷
		ps.setDouble(37,alljsk);//原币金额
		ps.setDouble(38,0);//数量
		ps.setDouble(39,0);//单价
		ps.setDouble(40,fdebit);//借方发生额

		ps.setDouble(41,fcredit);//贷方发生额
		ps.setString(42,"*");//结算方式名称
		ps.setString(43,"");//结算号
		ps.setString(44,yhmc);//制单人
		ps.setString(45,"");//
		ps.setString(46,"");//
		ps.setString(47,"");//过账人
		ps.setString(48,"");//审核人
		ps.setInt(49,0);//附件张数
		ps.setInt(50,0);//过账标记

		ps.setString(51,"");//机制凭证模块标识
		ps.setInt(52,0);//删除标记
		ps.setInt(53,0);//凭证序号
		ps.setString(54,"");//单位
		ps.setString(55,"");//参考信息
		ps.setInt(56,0);//是否已指定现金流量
		
		ps.executeUpdate();
		ps.close();

		row++;
	}

	conn.commit();

	out.print("<P>成功导出凭证："+yhdlm+".dbf、"+yhdlm+"CF.dbf、"+yhdlm+"1.dbf、"+yhdlm+"1CF.dbf，共导出记录数："+(row+1));
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
		if (conn != null) conn.close();
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn1 != null) cf.close(conn1);    //释放连接
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>
<BR><BR>点击鼠标右键下载凭证（4个文件）：
<A HREF="/foxpro/<%=yhdlm%>.dbf"><%=yhdlm%>.dbf</A> 
&nbsp;&nbsp;
<A HREF="/foxpro/<%=yhdlm%>CF.dbf"><%=yhdlm%>CF.dbf</A>
&nbsp;&nbsp;新凭证：
<A HREF="/foxpro/<%=yhdlm%>1.dbf"><%=yhdlm%>1.dbf</A> 
&nbsp;&nbsp;
<A HREF="/foxpro/<%=yhdlm%>1CF.dbf"><%=yhdlm%>1CF.dbf</A>