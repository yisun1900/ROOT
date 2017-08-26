<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
	String yhmc=(String)session.getAttribute("yhmc");

	String wheresql="";
	String wheresql1="";
	String wheresql2="";
	String cw_khfkjl_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_hth=null;
	String cw_khfkjl_fkxh=null;
	String cw_khfkjl_sjbh=null;
	String cw_khfkjl_jsjlh=null;
	String fklxbm=null;
	String cw_khfkjl_fkje=null;
	String cw_khfkjl_jkr=null;
	String cw_khfkjl_skr=null;
	String cw_khfkjl_sksj=null;
	String cw_khfkjl_lrdw=null;
	String cw_khfkjl_lrr=null;
	String cw_khfkjl_lrsj=null;
	String zffs=null;
	String zckx=null;
	String skdd=null;
	String dsksjbz=null;
	String skdw=null;

	String zclb=null;
	zclb=request.getParameter("zclb");
	if (zclb!=null)
	{
		zclb=cf.GB2Uni(zclb);
		if (!(zclb.equals("")))	wheresql+=" and  (cw_khfkjl.gysbh in(select gysbh from sq_gysxx where zclb='"+zclb+"'))";
	}
	String gysbh=null;
	gysbh=request.getParameter("gysbh");
	if (gysbh!=null)
	{
		gysbh=cf.GB2Uni(gysbh);
		if (!(gysbh.equals("")))	wheresql+=" and  (cw_khfkjl.gysbh='"+gysbh+"')";
	}

	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql1+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm+"%')";
		if (!(crm_khxx_khxm.equals("")))	wheresql2+=" and  (crm_zxkhxx.khxm like '%"+crm_khxx_khxm+"%')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql1+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz+"%')";
		if (!(crm_khxx_fwdz.equals("")))	wheresql2+=" and  (crm_zxkhxx.fwdz like '%"+crm_khxx_fwdz+"%')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql1+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
		if (!(crm_khxx_hth.equals("")))	wheresql2+=" and   cw_khfkjl.khlx in('2','4')";
	}

	String khlx=null;
	khlx=request.getParameter("khlx");
	if (!(khlx.equals("")))	wheresql+=" and  (cw_khfkjl.khlx='"+khlx+"')";

	String scbz=null;
	scbz=request.getParameter("scbz");
	if (!(scbz.equals("")))	wheresql+=" and  (cw_khfkjl.scbz='"+scbz+"')";

	String czlx=null;
	czlx=request.getParameter("czlx");
	if (!(czlx.equals("")))	wheresql+=" and  (cw_khfkjl.czlx='"+czlx+"')";

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (cw_khfkjl.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	cw_khfkjl_khbh=request.getParameter("cw_khfkjl_khbh");
	if (cw_khfkjl_khbh!=null)
	{
		cw_khfkjl_khbh=cf.GB2Uni(cw_khfkjl_khbh);
		if (!(cw_khfkjl_khbh.equals("")))	wheresql+=" and  (cw_khfkjl.khbh='"+cw_khfkjl_khbh+"')";
	}
	cw_khfkjl_fkxh=request.getParameter("cw_khfkjl_fkxh");
	if (cw_khfkjl_fkxh!=null)
	{
		cw_khfkjl_fkxh=cw_khfkjl_fkxh.trim();
		if (!(cw_khfkjl_fkxh.equals("")))	wheresql+=" and (cw_khfkjl.fkxh="+cw_khfkjl_fkxh+") ";
	}
	cw_khfkjl_sjbh=request.getParameter("cw_khfkjl_sjbh");
	if (cw_khfkjl_sjbh!=null)
	{
		cw_khfkjl_sjbh=cf.GB2Uni(cw_khfkjl_sjbh);
		if (!(cw_khfkjl_sjbh.equals("")))	wheresql+=" and  (cw_khfkjl.sjbh='"+cw_khfkjl_sjbh+"')";
	}
	cw_khfkjl_jsjlh=request.getParameter("cw_khfkjl_jsjlh");
	if (cw_khfkjl_jsjlh!=null)
	{
		cw_khfkjl_jsjlh=cf.GB2Uni(cw_khfkjl_jsjlh);
		if (!(cw_khfkjl_jsjlh.equals("")))	wheresql+=" and  (cw_khfkjl.jsjlh='"+cw_khfkjl_jsjlh+"')";
	}
	fklxbm=request.getParameter("fklxbm");
	if (fklxbm!=null)
	{
		fklxbm=cf.GB2Uni(fklxbm);
		if (!(fklxbm.equals("")))	wheresql+=" and  (cw_khfkjl.fklxbm='"+fklxbm+"')";
	}
	cw_khfkjl_fkje=request.getParameter("cw_khfkjl_fkje");
	if (cw_khfkjl_fkje!=null)
	{
		cw_khfkjl_fkje=cw_khfkjl_fkje.trim();
		if (!(cw_khfkjl_fkje.equals("")))	wheresql+=" and  (cw_khfkjl.fkje="+cw_khfkjl_fkje+") ";
	}
	cw_khfkjl_jkr=request.getParameter("cw_khfkjl_jkr");
	if (cw_khfkjl_jkr!=null)
	{
		cw_khfkjl_jkr=cf.GB2Uni(cw_khfkjl_jkr);
		if (!(cw_khfkjl_jkr.equals("")))	wheresql+=" and  (cw_khfkjl.jkr='"+cw_khfkjl_jkr+"')";
	}
	cw_khfkjl_skr=request.getParameter("cw_khfkjl_skr");
	if (cw_khfkjl_skr!=null)
	{
		cw_khfkjl_skr=cf.GB2Uni(cw_khfkjl_skr);
		if (!(cw_khfkjl_skr.equals("")))	wheresql+=" and  (cw_khfkjl.skr='"+cw_khfkjl_skr+"')";
	}
	cw_khfkjl_sksj=request.getParameter("cw_khfkjl_sksj");
	if (cw_khfkjl_sksj!=null)
	{
		cw_khfkjl_sksj=cw_khfkjl_sksj.trim();
		if (!(cw_khfkjl_sksj.equals("")))	wheresql+="  and (cw_khfkjl.sksj>=TO_DATE('"+cw_khfkjl_sksj+"','YYYY/MM/DD'))";
	}
	cw_khfkjl_sksj=request.getParameter("cw_khfkjl_sksj2");
	if (cw_khfkjl_sksj!=null)
	{
		cw_khfkjl_sksj=cw_khfkjl_sksj.trim();
		if (!(cw_khfkjl_sksj.equals("")))	wheresql+="  and (cw_khfkjl.sksj<=TO_DATE('"+cw_khfkjl_sksj+"','YYYY/MM/DD'))";
	}
	cw_khfkjl_lrdw=request.getParameter("cw_khfkjl_lrdw");
	if (cw_khfkjl_lrdw!=null)
	{
		cw_khfkjl_lrdw=cf.GB2Uni(cw_khfkjl_lrdw);
		if (!(cw_khfkjl_lrdw.equals("")))	wheresql+=" and  (cw_khfkjl.lrdw='"+cw_khfkjl_lrdw+"')";
	}
	skdw=request.getParameter("skdw");
	if (skdw!=null)
	{
		skdw=cf.GB2Uni(skdw);
		if (!(skdw.equals("")))	wheresql+=" and  (cw_khfkjl.skdw='"+skdw+"')";
	}
	cw_khfkjl_lrr=request.getParameter("cw_khfkjl_lrr");
	if (cw_khfkjl_lrr!=null)
	{
		cw_khfkjl_lrr=cf.GB2Uni(cw_khfkjl_lrr);
		if (!(cw_khfkjl_lrr.equals("")))	wheresql+=" and  (cw_khfkjl.lrr='"+cw_khfkjl_lrr+"')";
	}
	cw_khfkjl_lrsj=request.getParameter("cw_khfkjl_lrsj");
	if (cw_khfkjl_lrsj!=null)
	{
		cw_khfkjl_lrsj=cw_khfkjl_lrsj.trim();
		if (!(cw_khfkjl_lrsj.equals("")))	wheresql+="  and (cw_khfkjl.lrsj>=TO_DATE('"+cw_khfkjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_khfkjl_lrsj=request.getParameter("cw_khfkjl_lrsj2");
	if (cw_khfkjl_lrsj!=null)
	{
		cw_khfkjl_lrsj=cw_khfkjl_lrsj.trim();
		if (!(cw_khfkjl_lrsj.equals("")))	wheresql+="  and (cw_khfkjl.lrsj<=TO_DATE('"+cw_khfkjl_lrsj+"','YYYY/MM/DD'))";
	}
	zffs=request.getParameter("zffs");
	if (zffs!=null)
	{
		zffs=cf.GB2Uni(zffs);
		if (!(zffs.equals("")))	wheresql+=" and  (cw_khfkjl.zffs='"+zffs+"')";
	}
	zckx=request.getParameter("zckx");
	if (zckx!=null)
	{
		zckx=cf.GB2Uni(zckx);
		if (!(zckx.equals("")))	wheresql+=" and  (cw_khfkjl.zckx='"+zckx+"')";
	}
	skdd=request.getParameter("skdd");
	if (skdd!=null)
	{
		skdd=cf.GB2Uni(skdd);
		if (!(skdd.equals("")))	wheresql+=" and  (cw_khfkjl.skdd='"+skdd+"')";
	}
	dsksjbz=request.getParameter("dsksjbz");
	if (dsksjbz!=null)
	{
		dsksjbz=cf.GB2Uni(dsksjbz);
		if (!(dsksjbz.equals("")))	wheresql+=" and  (cw_khfkjl.dsksjbz='"+dsksjbz+"')";
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
	
String hth=null;
String khxm=null;
String sjs=null;
String fgsbh=null;
String getdwbh=null;
String dwmc=null;
String getfkcs=null;
String fkcsmc=null;
String getfklxbm=null;
String fkxh=null;
double fkje=0;
String getgysbh=null;
String getskdd=null;
String getdsksjbz=null;
String skr=null;
java.sql.Date sksj=null;
String getscbz=null;
String getczlx=null;

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
	ls_sql="SELECT crm_khxx.hth hth,crm_khxx.khxm,crm_khxx.sjs,cw_khfkjl.fgsbh,crm_khxx.dwbh,dwmc,cw_khfkjl.fklxbm,cw_khfkjl.fkcs,fkcsmc,fkxh,cw_khfkjl.fkje,cw_khfkjl.gysbh,skdd,dsksjbz,cw_khfkjl.skr,cw_khfkjl.sksj,cw_khfkjl.scbz,cw_khfkjl.czlx";
	ls_sql+=" FROM cw_khfkjl,crm_khxx,sq_dwxx,cw_fkcs  ";
    ls_sql+=" where cw_khfkjl.khbh=crm_khxx.khbh(+) and crm_khxx.dwbh=sq_dwxx.dwbh(+) and cw_khfkjl.fkcs=cw_fkcs.fkcs(+)";
    ls_sql+=" and cw_khfkjl.khlx in('2','4') ";
    ls_sql+=wheresql;
    ls_sql+=wheresql1;

	ls_sql+=" UNION all";

	ls_sql+=" SELECT crm_zxkhxx.khbh hth,crm_zxkhxx.khxm,cw_khfkjl.sjs,cw_khfkjl.fgsbh,cw_khfkjl.dwbh,dwmc,cw_khfkjl.fklxbm,cw_khfkjl.fkcs,fkcsmc,fkxh,cw_khfkjl.fkje,cw_khfkjl.gysbh,skdd,dsksjbz,cw_khfkjl.skr,cw_khfkjl.sksj,cw_khfkjl.scbz,cw_khfkjl.czlx";
	ls_sql+=" FROM cw_khfkjl,crm_zxkhxx,sq_dwxx,cw_fkcs ";
    ls_sql+=" where cw_khfkjl.khbh=crm_zxkhxx.khbh(+) and cw_khfkjl.dwbh=sq_dwxx.dwbh(+) and cw_khfkjl.fkcs=cw_fkcs.fkcs(+)";
    ls_sql+=" and cw_khfkjl.khlx in('1') ";
    ls_sql+=wheresql;
    ls_sql+=wheresql2;
	ps1= conn1.prepareStatement(ls_sql);
	rs1=ps1.executeQuery();
	while(rs1.next())
	{
		row++;

		hth=cf.fillNull(rs1.getString("hth"));
		khxm=cf.fillNull(rs1.getString("khxm"));
		sjs=cf.fillNull(rs1.getString("sjs"));
		fgsbh=cf.fillNull(rs1.getString("fgsbh"));
		getdwbh=cf.fillNull(rs1.getString("dwbh"));
		dwmc=cf.fillNull(rs1.getString("dwmc"));

		getfkcs=cf.fillNull(rs1.getString("fkcs"));
		fkcsmc=cf.fillNull(rs1.getString("fkcsmc"));
		getfklxbm=cf.fillNull(rs1.getString("fklxbm"));
		fkxh=cf.fillNull(rs1.getString("fkxh"));
		fkje=rs1.getDouble("fkje");
		getgysbh=cf.fillNull(rs1.getString("gysbh"));
		getskdd=cf.fillNull(rs1.getString("skdd"));
		getdsksjbz=cf.fillNull(rs1.getString("dsksjbz"));
		skr=cf.fillNull(rs1.getString("skr"));
		sksj=rs1.getDate("sksj");
		getscbz=cf.fillNull(rs1.getString("scbz"));
		getczlx=cf.fillNull(rs1.getString("czlx"));

		if (getscbz.equals("Y"))//N：未删除；Y：已删除
		{
			conn1.rollback();
			out.println("<BR>错误！收款序号：["+fkxh+"]已删除");
			return;
		}

		if (getczlx.equals("2"))//1：录入；2：导出；3：导入
		{
//			conn1.rollback();
			out.println("<BR>提醒！收款序号：["+fkxh+"]已导出，请确认是否重复导出");
//			return;
		}
		else if (getczlx.equals("3"))//1：录入；2：导出；3：导入
		{
			conn1.rollback();
			out.println("<BR>错误！收款序号：["+fkxh+"]是导入凭证，不能被导出");
			return;
		}

		if (getskdd.equals("2") && getdsksjbz.equals("N"))//1：财务收款；2：非财务代收款,N:否；Y:是
		{
			conn1.rollback();
			out.println("<BR>错误！收款序号：["+fkxh+"]代收款没有上缴");
			return;
		}

		String fdc=null;//D：借；C：贷,1：借（退款）；0：贷（收款）
		double fdebit=0;//借方发生额
		double fcredit=0;//贷方发生额
		if (fkje>=0)
		{
			fdc="0";
			fdebit=0;
			fcredit=fkje;
		}
		else{
			fdc="1";
			fkje=fkje*-1;
			fdebit=fkje;
			fcredit=0;
		}


		String kmhbm=null;//科目号编码
		String kmhmc=null;//科目号名称

		String fexp=null;//凭证摘要
		if (getfklxbm.equals("11"))//11：家装款
		{
			ls_sql=" select kmhbm,kmhmc" ;
			ls_sql+=" from cw_kmhbm " ;
			ls_sql+=" where fklxbm='"+getfklxbm+"' and jdbz='"+fdc+"'  and fkcs="+getfkcs;//1：借（退款）；0：贷（收款）
			ps2= conn1.prepareStatement(ls_sql);
			rs2=ps2.executeQuery();
			if(rs2.next())
			{         
				kmhbm = rs2.getString("kmhbm");			    
				kmhmc = rs2.getString("kmhmc");			    
			}
			else{
				conn1.rollback();
				out.println("<BR>错误！收款类型编码：["+getfklxbm+"]不存在");
				return;
			}
			rs2.close();
			ps2.close();

			fexp=fkcsmc+"("+fkxh+")";
		}
		else{
			ls_sql=" select kmhbm,kmhmc" ;
			ls_sql+=" from cw_kmhbm " ;
			ls_sql+=" where fklxbm='"+getfklxbm+"' and jdbz='"+fdc+"'";
			ps2= conn1.prepareStatement(ls_sql);
			rs2=ps2.executeQuery();
			if(rs2.next())
			{         
				kmhbm = rs2.getString("kmhbm");			    
				kmhmc = rs2.getString("kmhmc");			    
			}
			else{
				conn1.rollback();
				out.println("<BR>错误！收款类型编码：["+getfklxbm+"]不存在");
				return;
			}
			rs2.close();
			ps2.close();

			fexp=kmhmc+"("+fkxh+")";
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
			out.println("<BR>错误！设计师：["+sjs+"]不存在");
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

		if (!getfklxbm.equals("21") && !getfklxbm.equals("22") && !getfklxbm.equals("23") && !getfklxbm.equals("24"))//21:木门；22:橱柜；23:主材；24：家具
		{
			fclsname1="客户";
			fobjid1=hth;
			fobjname1=khxm;

			fclsname2="部门";
			fobjid2=getdwbh;
			fobjname2=dwmc;

			fclsname3="职员";
			fobjid3=bianhao;
			fobjname3=sjs;
		}
		else{
			String cxgysbh=null;//供应商编号
			ls_sql=" select gysbh" ;
			ls_sql+=" from sq_gysxx " ;
			ls_sql+=" where ssfgs='"+fgsbh+"' and gysmc='"+getgysbh+"'";
			ps2= conn1.prepareStatement(ls_sql);
			rs2=ps2.executeQuery();
			if(rs2.next())
			{         
				cxgysbh = rs2.getString("gysbh");			    
			}
			else{
				conn1.rollback();
				out.println("<BR>错误！供应商名称：["+getgysbh+"]不存在");
				return;
			}
			rs2.close();
			ps2.close();

			fclsname1="其他单位";
//			fobjid1=cxgysbh;
			fobjid1=hth;
			fobjname1=getgysbh;

			fclsname2="";
			fobjid2="";
			fobjname2="";

			fclsname3="";
			fobjid3="";
			fobjname3="";
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
		ps.setString(8,kmhbm);//科目号
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
		ps.setString(36,fdc);//D：借；C：贷
		ps.setDouble(37,fkje);//原币金额
		ps.setDouble(38,0);//数量
		ps.setDouble(39,0);//单价
		ps.setDouble(40,fdebit);//借方发生额

		ps.setDouble(41,fcredit);//贷方发生额
		ps.setString(42,"*");//结算方式名称
		ps.setString(43,"");//结算号
		ps.setString(44,skr);//制单人
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

		ls_sql="update cw_khfkjl set czlx='2',dcr=?,dcsj=SYSDATE";
		ls_sql+=" where fkxh='"+fkxh+"' and czlx='1'";
		ps2= conn1.prepareStatement(ls_sql);
		ps2.setString(1,yhmc);
		ps2.executeUpdate();
		ps2.close();

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