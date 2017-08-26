<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
	String yhmc=(String)session.getAttribute("yhmc");

	String wheresql="";
	String cw_gdjkjl_gdjkjlh=null;
	String cw_gdjkjl_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qye=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_dwbh=null;
	String crm_khxx_sgd=null;
	String crm_khxx_sgbz=null;
	String crm_khxx_zjxm=null;
	String cw_gdjkjl_jklx=null;
	String cw_gdjkjl_jkje=null;
	String cw_gdjkjl_jkblr=null;
	String cw_gdjkjl_jkblsj=null;
	String cw_gdjkjl_lrr=null;
	String cw_gdjkjl_lrsj=null;
	String cw_gdjkjl_lrbm=null;
	String cw_gdjkjl_gdjsjd=null;
	String cw_gdjkjl_gdjsjlh=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String scbz=null;
	scbz=request.getParameter("scbz");
	if (!(scbz.equals("")))	wheresql+=" and  (cw_gdjkjl.scbz='"+scbz+"')";

	String czlx=null;
	czlx=request.getParameter("czlx");
	if (!(czlx.equals("")))	wheresql+=" and  (cw_gdjkjl.czlx='"+czlx+"')";

	cw_gdjkjl_gdjkjlh=request.getParameter("cw_gdjkjl_gdjkjlh");
	if (cw_gdjkjl_gdjkjlh!=null)
	{
		cw_gdjkjl_gdjkjlh=cf.GB2Uni(cw_gdjkjl_gdjkjlh);
		if (!(cw_gdjkjl_gdjkjlh.equals("")))	wheresql+=" and  (cw_gdjkjl.gdjkjlh='"+cw_gdjkjl_gdjkjlh+"')";
	}
	cw_gdjkjl_khbh=request.getParameter("cw_gdjkjl_khbh");
	if (cw_gdjkjl_khbh!=null)
	{
		cw_gdjkjl_khbh=cf.GB2Uni(cw_gdjkjl_khbh);
		if (!(cw_gdjkjl_khbh.equals("")))	wheresql+=" and  (cw_gdjkjl.khbh='"+cw_gdjkjl_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm+"%')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz+"%')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs+"%')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_qye=request.getParameter("crm_khxx_qye");
	if (crm_khxx_qye!=null)
	{
		crm_khxx_qye=crm_khxx_qye.trim();
		if (!(crm_khxx_qye.equals("")))	wheresql+=" and  (crm_khxx.qye="+crm_khxx_qye+") ";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_sgbz=request.getParameter("crm_khxx_sgbz");
	if (crm_khxx_sgbz!=null)
	{
		crm_khxx_sgbz=cf.GB2Uni(crm_khxx_sgbz);
		if (!(crm_khxx_sgbz.equals("")))	wheresql+=" and  (crm_khxx.sgbz='"+crm_khxx_sgbz+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	cw_gdjkjl_jklx=request.getParameter("cw_gdjkjl_jklx");
	if (cw_gdjkjl_jklx!=null)
	{
		cw_gdjkjl_jklx=cf.GB2Uni(cw_gdjkjl_jklx);
		if (!(cw_gdjkjl_jklx.equals("")))	wheresql+=" and  (cw_gdjkjl.jklx='"+cw_gdjkjl_jklx+"')";
	}
	cw_gdjkjl_jkje=request.getParameter("cw_gdjkjl_jkje");
	if (cw_gdjkjl_jkje!=null)
	{
		cw_gdjkjl_jkje=cw_gdjkjl_jkje.trim();
		if (!(cw_gdjkjl_jkje.equals("")))	wheresql+=" and  (cw_gdjkjl.jkje="+cw_gdjkjl_jkje+") ";
	}
	cw_gdjkjl_jkblr=request.getParameter("cw_gdjkjl_jkblr");
	if (cw_gdjkjl_jkblr!=null)
	{
		cw_gdjkjl_jkblr=cf.GB2Uni(cw_gdjkjl_jkblr);
		if (!(cw_gdjkjl_jkblr.equals("")))	wheresql+=" and  (cw_gdjkjl.jkblr='"+cw_gdjkjl_jkblr+"')";
	}
	cw_gdjkjl_jkblsj=request.getParameter("cw_gdjkjl_jkblsj");
	if (cw_gdjkjl_jkblsj!=null)
	{
		cw_gdjkjl_jkblsj=cw_gdjkjl_jkblsj.trim();
		if (!(cw_gdjkjl_jkblsj.equals("")))	wheresql+="  and (cw_gdjkjl.jkblsj=TO_DATE('"+cw_gdjkjl_jkblsj+"','YYYY/MM/DD'))";
	}
	cw_gdjkjl_lrr=request.getParameter("cw_gdjkjl_lrr");
	if (cw_gdjkjl_lrr!=null)
	{
		cw_gdjkjl_lrr=cf.GB2Uni(cw_gdjkjl_lrr);
		if (!(cw_gdjkjl_lrr.equals("")))	wheresql+=" and  (cw_gdjkjl.lrr='"+cw_gdjkjl_lrr+"')";
	}
	cw_gdjkjl_lrsj=request.getParameter("cw_gdjkjl_lrsj");
	if (cw_gdjkjl_lrsj!=null)
	{
		cw_gdjkjl_lrsj=cw_gdjkjl_lrsj.trim();
		if (!(cw_gdjkjl_lrsj.equals("")))	wheresql+="  and (cw_gdjkjl.lrsj=TO_DATE('"+cw_gdjkjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_gdjkjl_lrbm=request.getParameter("cw_gdjkjl_lrbm");
	if (cw_gdjkjl_lrbm!=null)
	{
		cw_gdjkjl_lrbm=cf.GB2Uni(cw_gdjkjl_lrbm);
		if (!(cw_gdjkjl_lrbm.equals("")))	wheresql+=" and  (cw_gdjkjl.lrbm='"+cw_gdjkjl_lrbm+"')";
	}
	cw_gdjkjl_gdjsjd=request.getParameter("cw_gdjkjl_gdjsjd");
	if (cw_gdjkjl_gdjsjd!=null)
	{
		cw_gdjkjl_gdjsjd=cf.GB2Uni(cw_gdjkjl_gdjsjd);
		if (!(cw_gdjkjl_gdjsjd.equals("")))	wheresql+=" and  (cw_gdjkjl.gdjsjd='"+cw_gdjkjl_gdjsjd+"')";
	}
	cw_gdjkjl_gdjsjlh=request.getParameter("cw_gdjkjl_gdjsjlh");
	if (cw_gdjkjl_gdjsjlh!=null)
	{
		cw_gdjkjl_gdjsjlh=cf.GB2Uni(cw_gdjkjl_gdjsjlh);
		if (!(cw_gdjkjl_gdjsjlh.equals("")))	wheresql+=" and  (cw_gdjkjl.gdjsjlh='"+cw_gdjkjl_gdjsjlh+"')";
	}

%>

<%
String yhdlm=(String)session.getAttribute("yhdlm");

String rootPath=getServletContext().getRealPath("");


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
	
String gdjkjlh=null;
String hth=null;
String khxm=null;
String sjs=null;
double jkje=0;
String getscbz=null;
String getczlx=null;

String getdwbh=null;
String dwmc=null;
String sgd=null;
String sgdmc=null;
String jkblr=null;
java.sql.Date jkblsj=null;

String kmhbm=null;//科目号编码
String kmhmc=null;//科目号名称

String fexp=null;//凭证摘要

try {
	//拷贝导出文件
	String DBFSourece=rootPath+"\\foxpro\\NEWYBL.DBF";
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

	DBFSourece=rootPath+"\\foxpro\\NEWYBLCF.dbf";
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

	conn1=cf.getConnection();    //得到连接

	conn1.setAutoCommit(false);

	int row=0;
	double allsk=0;
	ls_sql="SELECT cw_gdjkjl.gdjkjlh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.sjs,crm_khxx.sgd,sgdmc,cw_gdjkjl.jkje,crm_khxx.dwbh,dwmc,cw_gdjkjl.scbz,cw_gdjkjl.czlx,cw_gdjkjl.jkblr,cw_gdjkjl.jkblsj";
	ls_sql+=" FROM crm_khxx,cw_gdjkjl,sq_sgd,sq_dwxx  ";
    ls_sql+=" where cw_gdjkjl.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_khxx.sgd,cw_gdjkjl.gdjkjlh";
	ps1= conn1.prepareStatement(ls_sql);
	rs1=ps1.executeQuery();
	while(rs1.next())
	{
		row++;

		gdjkjlh=cf.fillNull(rs1.getString("gdjkjlh"));
		hth=cf.fillNull(rs1.getString("hth"));
		khxm=cf.fillNull(rs1.getString("khxm"));
		sjs=cf.fillNull(rs1.getString("sjs"));

		sgd=cf.fillNull(rs1.getString("sgd"));
		sgdmc=cf.fillNull(rs1.getString("sgdmc"));
		jkje=rs1.getDouble("jkje");

		getdwbh=cf.fillNull(rs1.getString("dwbh"));
		dwmc=cf.fillNull(rs1.getString("dwmc"));
		getscbz=cf.fillNull(rs1.getString("scbz"));
		getczlx=cf.fillNull(rs1.getString("czlx"));

		jkblr=cf.fillNull(rs1.getString("jkblr"));
		jkblsj=rs1.getDate("jkblsj");


		allsk+=jkje;

		if (getscbz.equals("Y"))//N：未删除；Y：已删除
		{
			conn1.rollback();
			out.println("<BR>错误！领款记录号：["+gdjkjlh+"]已删除");
			return;
		}

		if (getczlx.equals("2"))//1：录入；2：导出；3：导入
		{
//			conn1.rollback();
			out.println("<BR>提醒！领款记录号：["+gdjkjlh+"]已导出，请确认是否重复导出");
//			return;
		}
		else if (getczlx.equals("3"))//1：录入；2：导出；3：导入
		{
			conn1.rollback();
			out.println("<BR>错误！领款记录号：["+gdjkjlh+"]是导入凭证，不能被导出");
			return;
		}


		String bianhao=null;//员工编号
		ls_sql=" select bianhao" ;
		ls_sql+=" from sq_yhxx " ;
		ls_sql+=" where dwbh='"+getdwbh+"' and yhmc='"+sjs+"'";
		ps2= conn1.prepareStatement(ls_sql);
		rs2=ps2.executeQuery();
		if(rs2.next())
		{         
			bianhao = rs2.getString("bianhao");			    
		}
		else{
			conn1.rollback();
			out.println("<BR>错误！设计师：["+sjs+"]工号不存在");
			return;
		}
		rs2.close();
		ps2.close();

		String cwdm=null;//财务代码
		ls_sql=" select cwdm" ;
		ls_sql+=" from sq_dwxx " ;
		ls_sql+=" where dwbh='"+getdwbh+"'";
		ps2= conn1.prepareStatement(ls_sql);
		rs2=ps2.executeQuery();
		if(rs2.next())
		{         
			cwdm = rs2.getString("cwdm");			    
		}
		else{
			conn1.rollback();
			out.println("<BR>错误！店面：["+dwmc+"]财务代码不存在");
			return;
		}
		rs2.close();
		ps2.close();

		String fclsname1=null;//第一个核算项目所属类别名称
		String fobjid1=null;//第一个核算项目ID
		String fobjname1=null;//第一个核算项目名称
		String fclsname2=null;//第二个核算项目所属类别名称
		String fobjid2=null;//第二个核算项目ID
		String fobjname2=null;//第二个核算项目名称
		String fclsname3=null;//第三个核算项目所属类别名称
		String fobjid3=null;//第三个核算项目ID
		String fobjname3=null;//第三个核算项目名称

		fclsname1="客户";
		fobjid1=hth;
		fobjname1=khxm;

		fclsname2="部门";
		fobjid2=cwdm;//财务代码
		fobjname2=dwmc;

		fclsname3="工长";
		fobjid3=sgd;
		fobjname3=sgdmc;

		ls_sql="insert into "+yhdlm+"(fdate,ftransdate,fperiod,fgroup,fnum,fentryid,fexp,facctid,fclsname1,fobjid1";
		ls_sql+=" ,fobjname1,fclsname2,fobjid2,fobjname2,fclsname3,fobjid3,fobjname3,fclsname4,fobjid4,fobjname4 ";
		ls_sql+=" ,fclsname5,fobjid5,fobjname5,fclsname6,fobjid6,fobjname6,fclsname7,fobjid7,fobjname7,fclsname8";
		ls_sql+=" ,fobjid8,fobjname8,ftransid,fcyid,fexchrate,fdc,ffcyamt,fqty,fprice,fdebit";
		ls_sql+=" ,fcredit,fsettlcode,fsettleno,fprepare,fpay,fcash,fposter,fchecker,fattchment,fposted ";
		ls_sql+=" ,fmodule,fdeleted,fserialno,funitname,freference,fcashflow)";
		ls_sql+= " values(?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,jkblsj);
		ps.setDate(2,jkblsj);
		ps.setInt(3,0);//会计期间
		ps.setString(4,"记");//凭证字
		ps.setInt(5,0);//凭证号
		ps.setInt(6,row);//分录号
		ps.setString(7,"二期拨款");//凭证摘要
		ps.setString(8,"115.03");//科目号
		ps.setString(9,fclsname1);//第一个核算项目所属类别名称
		ps.setString(10,fobjid1);//第一个核算项目ID

		ps.setString(11,fobjname1);//第一个核算项目名称
		ps.setString(12,fclsname2);
		ps.setString(13,fobjid2);
		ps.setString(14,fobjname2);
		ps.setString(15,fclsname3);
		ps.setString(16,fobjid3);
		ps.setString(17,fobjname3);
		ps.setString(18,"");//第四个核算项目所属类别名称
		ps.setString(19,"");//第四个核算项目ID
		ps.setString(20,"");//第四个核算项目名称

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
		ps.setString(36,"0");//D：借；C：贷
		ps.setDouble(37,jkje);//原币金额
		ps.setDouble(38,0);//数量
		ps.setDouble(39,0);//单价
		ps.setDouble(40,0);//借方发生额

		ps.setDouble(41,jkje);//贷方发生额
		ps.setString(42,"*");//结算方式名称
		ps.setString(43,"");//结算号
		ps.setString(44,jkblr);//制单人
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

		ls_sql="update cw_gdjkjl set czlx='2',drdcr=?,drdcsj=SYSDATE";
		ls_sql+=" where gdjkjlh='"+gdjkjlh+"' and czlx='1'";
		ps2= conn1.prepareStatement(ls_sql);
		ps2.setString(1,yhmc);
		ps2.executeUpdate();
		ps2.close();

	}

	if (row>0)
	{
		ls_sql="insert into "+yhdlm+"(fdate,ftransdate,fperiod,fgroup,fnum,fentryid,fexp,facctid,fclsname1,fobjid1";
		ls_sql+=" ,fobjname1,fclsname2,fobjid2,fobjname2,fclsname3,fobjid3,fobjname3,fclsname4,fobjid4,fobjname4 ";
		ls_sql+=" ,fclsname5,fobjid5,fobjname5,fclsname6,fobjid6,fobjname6,fclsname7,fobjid7,fobjname7,fclsname8";
		ls_sql+=" ,fobjid8,fobjname8,ftransid,fcyid,fexchrate,fdc,ffcyamt,fqty,fprice,fdebit";
		ls_sql+=" ,fcredit,fsettlcode,fsettleno,fprepare,fpay,fcash,fposter,fchecker,fattchment,fposted ";
		ls_sql+=" ,fmodule,fdeleted,fserialno,funitname,freference,fcashflow)";
		ls_sql+= " values(?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,jkblsj);
		ps.setDate(2,jkblsj);
		ps.setInt(3,0);//会计期间
		ps.setString(4,"记");//凭证字
		ps.setInt(5,0);//凭证号
		ps.setInt(6,0);//分录号
		ps.setString(7,"二期拨款");//凭证摘要
		ps.setString(8,"102.01.06");//科目号
		ps.setString(9,"");//第一个核算项目所属类别名称
		ps.setString(10,"");//第一个核算项目ID

		ps.setString(11,"");//第一个核算项目名称
		ps.setString(12,"");
		ps.setString(13,"");
		ps.setString(14,"");
		ps.setString(15,"");
		ps.setString(16,"");
		ps.setString(17,"");
		ps.setString(18,"");//第四个核算项目所属类别名称
		ps.setString(19,"");//第四个核算项目ID
		ps.setString(20,"");//第四个核算项目名称

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
		ps.setString(36,"1");//D：借；C：贷
		ps.setDouble(37,allsk);//原币金额
		ps.setDouble(38,0);//数量
		ps.setDouble(39,0);//单价
		ps.setDouble(40,allsk);//借方发生额

		ps.setDouble(41,0);//贷方发生额
		ps.setString(42,"*");//结算方式名称
		ps.setString(43,"");//结算号
		ps.setString(44,jkblr);//制单人
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
	conn1.commit();

	out.print("<P>成功导出凭证："+yhdlm+".dbf、"+yhdlm+"CF.dbf，共导出记录数："+row);
}
catch (Exception e) {
	conn1.rollback();

	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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
		if (rs2 != null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn1 != null) cf.close(conn1);    //释放连接
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