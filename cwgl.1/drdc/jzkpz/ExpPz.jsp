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

	String pzfl=request.getParameter("pzfl");
	String czlx=request.getParameter("czlx");
	if (pzfl.equals("1"))//收工程款（现金）
	{
		//工程款,1：工程款；2：集成款
		if (czlx.equals("1"))//没有导出
		{
			wheresql+=" and cw_khfkjl.zffs in(select zffsbm from cw_zffsbm where lx='1') and cw_khfkjl.zffs!='31' ";
			wheresql+=" and cw_khfkjl.fklxbm in(select fklxbm from cw_fklxbm where pzfl='1')";
			wheresql+=" and cw_khfkjl.czlx='1'";
		}
		else if (czlx.equals("2"))//已导出
		{
			wheresql+=" and cw_khfkjl.zffs in(select zffsbm from cw_zffsbm where lx='1') and cw_khfkjl.zffs!='31' ";
			wheresql+=" and cw_khfkjl.fklxbm in(select fklxbm from cw_fklxbm where pzfl='1')";
			wheresql+=" and cw_khfkjl.czlx='2'";
		}
	}
	else if (pzfl.equals("2"))//收工程款（非现金）
	{
		//工程款,1：工程款；2：集成款 
		if (czlx.equals("1"))//没有导出
		{
			wheresql+=" and cw_khfkjl.zffs in(select zffsbm from cw_zffsbm where lx='2') and cw_khfkjl.zffs!='31' ";
			wheresql+=" and cw_khfkjl.fklxbm in(select fklxbm from cw_fklxbm where pzfl='1')";
			wheresql+=" and cw_khfkjl.czlx='1'";
		}
		else if (czlx.equals("2"))//已导出
		{
			wheresql+=" and cw_khfkjl.zffs in(select zffsbm from cw_zffsbm where lx='2') and cw_khfkjl.zffs!='31' ";
			wheresql+=" and cw_khfkjl.fklxbm in(select fklxbm from cw_fklxbm where pzfl='1')";
			wheresql+=" and cw_khfkjl.czlx='2'";
		}
	}
	else if (pzfl.equals("3"))//转入、转出工程款
	{
		//工程款,1：工程款；2：集成款 + 转出工程款
		if (czlx.equals("1"))//没有导出
		{
			wheresql+=" and (";
			wheresql+="           ( cw_khfkjl.zffs in('31') ";//转入工程款
			wheresql+="             and (cw_khfkjl.czlx='1' OR (cw_khfkjl.czlx='2' and cw_khfkjl.zrkdcpz='0'))";
			wheresql+="             and  cw_khfkjl.fklxbm in( select fklxbm from cw_fklxbm where pzfl='1') )";
			wheresql+="       OR  ( cw_khfkjl.zffs in('31')";//转出工程款
			wheresql+="             and (cw_khfkjl.czlx='1' OR (cw_khfkjl.czlx='2' and cw_khfkjl.zckdcpz='0'))";
			wheresql+="             and cw_khfkjl.zckx   in( select fklxbm from cw_fklxbm where pzfl='1') )";
			wheresql+="     )";
		}
		else if (czlx.equals("2"))//已导出
		{
			wheresql+=" and (";
			wheresql+="           ( cw_khfkjl.zffs in('31') ";//转入工程款
			wheresql+="             and cw_khfkjl.czlx='2' and cw_khfkjl.zrkdcpz='1' ";
			wheresql+="             and  cw_khfkjl.fklxbm in( select fklxbm from cw_fklxbm where pzfl='1') )";
			wheresql+="       OR  ( cw_khfkjl.zffs in('31')";//转出工程款
			wheresql+="             and cw_khfkjl.czlx='2' and cw_khfkjl.zckdcpz='1' ";
			wheresql+="             and cw_khfkjl.zckx   in( select fklxbm from cw_fklxbm where pzfl='1') )";
			wheresql+="     )";
		}
	}


	String sjr=null;
	sjr=request.getParameter("sjr");
	if (sjr!=null)
	{
		sjr=cf.GB2Uni(sjr);
		if (!(sjr.equals("")))	wheresql+=" and  (cw_khfkjl.sjr='"+sjr+"')";
	}
	String sjsj=null;
	sjsj=request.getParameter("sjsj");
	if (sjsj!=null)
	{
		sjsj=sjsj.trim();
		if (!(sjsj.equals("")))	wheresql+="  and (cw_khfkjl.sjsj>=TO_DATE('"+sjsj+"','YYYY/MM/DD'))";
	}
	sjsj=request.getParameter("sjsj2");
	if (sjsj!=null)
	{
		sjsj=sjsj.trim();
		if (!(sjsj.equals("")))	wheresql+="  and (cw_khfkjl.sjsj<=TO_DATE('"+sjsj+"','YYYY/MM/DD'))";
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
	
String khbh=null;
String hth=null;
String khxm=null;
String sjs=null;
String sgd=null;
String sgdmc=null;
String fgsbh=null;
String getdwbh=null;
String dwmc=null;
String getfkcs=null;
String fkcsmc=null;
String getfklxbm=null;
String getzffs=null;
String getzckx=null;
String getzcgysbh=null;
String getzrkdcpz=null;
String getzckdcpz=null;
String fkxh=null;
double fkje=0;
String getgysbh=null;
String getskdd=null;
String getdsksjbz=null;
String skr=null;
java.sql.Date sksj=null;
String getscbz=null;
String getczlx=null;


String kmdm=null;//科目号编码
String kmmc=null;//科目号名称

String fexp=null;//凭证摘要

String bianhao=null;//取设计师工号

try {
	//拷贝导出文件++++++++++++++++开始

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

	//拷贝导出文件-----------------结束
	

	Class.forName (driver);
	conn = DriverManager.getConnection(url, user, passwd);

	conn1=cf.getConnection();    //得到连接

	conn1.setAutoCommit(false);

	int row=0;
	double allsk=0;
	ls_sql="SELECT cw_khfkjl.zffs,cw_khfkjl.zckx,cw_khfkjl.zcgysbh,cw_khfkjl.zrkdcpz,cw_khfkjl.zckdcpz,cw_khfkjl.khbh,crm_khxx.hth hth,crm_khxx.khxm,crm_khxx.sjs,crm_khxx.sjsgh,cw_khfkjl.fgsbh,crm_khxx.dwbh,dwmc,cw_khfkjl.fklxbm,cw_khfkjl.fkcs,fkcsmc,fkxh,cw_khfkjl.fkje,cw_khfkjl.gysbh,skdd,dsksjbz,cw_khfkjl.sjr,cw_khfkjl.sjsj,cw_khfkjl.scbz,cw_khfkjl.czlx";
	ls_sql+=" FROM cw_khfkjl,crm_khxx,sq_dwxx,cw_fkcs  ";
    ls_sql+=" where cw_khfkjl.khbh=crm_khxx.khbh(+) and crm_khxx.dwbh=sq_dwxx.dwbh(+) and cw_khfkjl.fkcs=cw_fkcs.fkcs(+)";
    ls_sql+=" and cw_khfkjl.khlx in('2','4') ";
    ls_sql+=wheresql;
    ls_sql+=wheresql1;

	ls_sql+=" UNION all";

	ls_sql+=" SELECT cw_khfkjl.zffs,cw_khfkjl.zckx,cw_khfkjl.zcgysbh,cw_khfkjl.zrkdcpz,cw_khfkjl.zckdcpz,crm_zxkhxx.khbh,crm_zxkhxx.khbh hth,crm_zxkhxx.khxm,crm_zxkhxx.sjs,crm_zxkhxx.sjsgh,cw_khfkjl.fgsbh,cw_khfkjl.dwbh,dwmc,cw_khfkjl.fklxbm,cw_khfkjl.fkcs,fkcsmc,fkxh,cw_khfkjl.fkje,cw_khfkjl.gysbh,skdd,dsksjbz,cw_khfkjl.sjr,cw_khfkjl.sjsj,cw_khfkjl.scbz,cw_khfkjl.czlx";
	ls_sql+=" FROM cw_khfkjl,crm_zxkhxx,sq_dwxx,cw_fkcs ";
    ls_sql+=" where cw_khfkjl.khbh=crm_zxkhxx.khbh(+) and cw_khfkjl.dwbh=sq_dwxx.dwbh(+) and cw_khfkjl.fkcs=cw_fkcs.fkcs(+)";
    ls_sql+=" and cw_khfkjl.khlx in('1') ";
    ls_sql+=wheresql;
    ls_sql+=wheresql2;
//	out.println(ls_sql);
	ps1= conn1.prepareStatement(ls_sql);
	rs1=ps1.executeQuery();
	while(rs1.next())
	{
		row++;

		getzffs=cf.fillNull(rs1.getString("zffs"));
		getzckx=cf.fillNull(rs1.getString("zckx"));
		getzcgysbh=cf.fillNull(rs1.getString("zcgysbh"));
		getzrkdcpz=cf.fillNull(rs1.getString("zrkdcpz"));
		getzckdcpz=cf.fillNull(rs1.getString("zckdcpz"));
		khbh=cf.fillNull(rs1.getString("khbh"));
		hth=cf.fillNull(rs1.getString("hth"));//咨询客户付款取[客户编号]
		khxm=cf.fillNull(rs1.getString("khxm"));
		sjs=cf.fillNull(rs1.getString("sjs"));
		bianhao=cf.fillNull(rs1.getString("sjsgh"));
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
		skr=cf.fillNull(rs1.getString("sjr"));
		sksj=rs1.getDate("sjsj");
		getscbz=cf.fillNull(rs1.getString("scbz"));
		getczlx=cf.fillNull(rs1.getString("czlx"));


		//收款类型
		String drpzfl="";//导入凭证分类，1：工程款；2：集成款
		ls_sql=" select pzfl" ;
		ls_sql+=" from cw_fklxbm " ;
		ls_sql+=" where fklxbm='"+getfklxbm+"'";
		ps2= conn1.prepareStatement(ls_sql);
		rs2=ps2.executeQuery();
		if(rs2.next())
		{         
			drpzfl = rs2.getString("pzfl");			    
		}
		else{
			conn1.rollback();
			out.println("<BR>错误！收款类型编码：<A HREF='/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh="+fkxh+"' target='_blank'>["+getfklxbm+"]</A>不存在");
			return;
		}
		rs2.close();
		ps2.close();

		 //转出款类型
		String dcpzfl="";//导出凭证分类
		if (!getzckx.equals(""))
		{
			ls_sql=" select pzfl" ;
			ls_sql+=" from cw_fklxbm " ;
			ls_sql+=" where fklxbm='"+getzckx+"'";
			ps2= conn1.prepareStatement(ls_sql);
			rs2=ps2.executeQuery();
			if(rs2.next())
			{         
				dcpzfl = rs2.getString("pzfl");			    
			}
			else{
				conn1.rollback();
				out.println("<BR>错误！收款类型编码：<A HREF='/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh="+fkxh+"' target='_blank'>["+getzckx+"]</A>不存在");
				return;
			}
			rs2.close();
			ps2.close();
		}

		//检查是否复合导出条件＋＋＋＋＋＋＋＋＋＋＋＋开始
		if (getscbz.equals("Y"))//N：未删除；Y：已删除
		{
			conn1.rollback();
			out.println("<BR>错误！收款序号<A HREF='/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh="+fkxh+"' target='_blank'>["+fkxh+"]</A>已删除");
			return;
		}

		if (getczlx.equals("2"))//1：录入；2：导出；3：导入
		{
			if (getzffs.equals("31"))//31：转出
			{
				if (drpzfl.equals("1") && getzrkdcpz.equals("1"))//1：工程款；2：集成款，转入款导出凭证：0：否；1：是
				{
					out.println("<BR>提醒！收款序号<A HREF='/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh="+fkxh+"' target='_blank'>["+fkxh+"]</A>转入款已导出凭证，请确认是否重复导出");
				}
				if (dcpzfl.equals("1") && getzckdcpz.equals("1"))//1：工程款；2：集成款，转出款导出凭证：0：否；1：是
				{
					out.println("<BR>提醒！收款序号<A HREF='/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh="+fkxh+"' target='_blank'>["+fkxh+"]</A>转出款已导出凭证，请确认是否重复导出");
				}
			}
			else{
				out.println("<BR>提醒！收款序号<A HREF='/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh="+fkxh+"' target='_blank'>["+fkxh+"]</A>已导出凭证，请确认是否重复导出");
			}
		}
		else if (getczlx.equals("3"))//1：录入；2：导出；3：导入
		{
			conn1.rollback();
			out.println("<BR>错误！收款序号<A HREF='/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh="+fkxh+"' target='_blank'>["+fkxh+"]</A>是导入凭证，不能被导出");
			return;
		}

		if (getskdd.equals("2") && getdsksjbz.equals("N"))//1：财务收款；2：非财务代收款,N:否；Y:是
		{
			conn1.rollback();
			out.println("<BR>错误！收款序号<A HREF='/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh="+fkxh+"' target='_blank'>["+fkxh+"]</A>代收款没有上缴");
			return;
		}

		//检查是否复合导出条件----------------------结束


		//1、检查本店在职设计师


		if (sjs.equals(""))
		{
			sjs="未知";
	//		bianhao="未知";
			out.println("<BR>提醒！付款记录<A HREF='/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh="+fkxh+"' target='_blank'>["+fkxh+"]</A>设计师不存在");
		}
		else{
			if (bianhao==null || bianhao.equals(""))
			{
				out.println("<BR>提醒！设计师<A HREF='/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh="+fkxh+"' target='_blank'>["+sjs+"]</A>工号不存在");
				bianhao="未知";
			}
		}


		//取凭证的店面编码
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
//			conn1.rollback();
			cwdm="未知";
			out.println("<BR>提醒！店面编码<A HREF='/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh="+fkxh+"' target='_blank'>["+getdwbh+"]</A>不存在");
//			return;
		}
		rs2.close();
		ps2.close();

		if (cwdm==null || cwdm.equals(""))
		{
			conn1.rollback();
			out.println("<BR>错误！店面["+dwmc+"]的财务代码不存在");
			return;
		}

		//收工程款（现金）、收工程款（非现金）、 转入工程款＋＋＋＋＋＋＋＋＋＋＋＋＋开始导出凭证

		String fdc=null;//D：借；C：贷,1：借（退款）；0：贷（收款）
		double fdebit=0;//借方发生额
		double fcredit=0;//贷方发生额

		fdc="0";

		fdebit=0;
		fcredit=fkje;

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


		kmdm="";//科目编码
		kmmc="";//科目名称
		fexp="";//凭证摘要


		if (drpzfl.equals("1"))//1：工程款；2：集成款
		{
			allsk+=fkje;

			if (getfklxbm.equals("11"))//11：家装款
			{
				if (getfkcs.equals(""))
				{
					getfkcs="1";
				}
				ls_sql=" select kmdm,kmmc" ;
				ls_sql+=" from cw_jzkmdm " ;
				ls_sql+=" where fgsbh='"+fgsbh+"' and fklxbm='"+getfklxbm+"' and jdbz='"+fdc+"'  and fkcs='"+getfkcs+"'";//1：借（退款）；0：贷（收款）
				ps2= conn1.prepareStatement(ls_sql);
				rs2=ps2.executeQuery();
				if(rs2.next())
				{         
					kmdm = rs2.getString("kmdm");			    
					kmmc = rs2.getString("kmmc");			    
				}
				else{
					conn1.rollback();
					out.println("<BR>错误！收款类型编码：<A HREF='/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh="+fkxh+"' target='_blank'>["+getfklxbm+"]</A>没有对应的科目");
					return;
				}
				rs2.close();
				ps2.close();

				fexp="收"+khxm+kmmc+"("+fkxh+")";

				fclsname1="客户";
				fobjid1=hth;
				fobjname1=khxm;

				fclsname2="部门";
				fobjid2=cwdm;//财务代码
				fobjname2=dwmc;

				fclsname3="职员";
				fobjid3=bianhao;
				fobjname3=sjs;

				fclsname4="";
				fobjid4="";
				fobjname4="";
			}
			else if (getfklxbm.equals("51") || getfklxbm.equals("91") || getfklxbm.equals("94") || getfklxbm.equals("95"))//51：促销活动订金，91：家装返卷款，94：减项管理费，95：认证费
			{
				ls_sql=" select kmdm,kmmc" ;
				ls_sql+=" from cw_jzkmdm " ;
				ls_sql+=" where fgsbh='"+fgsbh+"' and fklxbm='"+getfklxbm+"' and jdbz='"+fdc+"'";
				ps2= conn1.prepareStatement(ls_sql);
				rs2=ps2.executeQuery();
				if(rs2.next())
				{         
					kmdm = rs2.getString("kmdm");			    
					kmmc = rs2.getString("kmmc");			    
				}
				else{
					conn1.rollback();
					out.println("<BR>错误！收款类型编码：<A HREF='/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh="+fkxh+"' target='_blank'>["+getfklxbm+"]</A>没有对应的科目");
					return;
				}
				rs2.close();
				ps2.close();

				fexp="收"+khxm+kmmc+"("+fkxh+")";

				fclsname1="客户";
				fobjid1=hth;
				fobjname1=khxm;

				fclsname2="部门";
				fobjid2=cwdm;//财务代码
				fobjname2=dwmc;

				fclsname3="";
				fobjid3="";
				fobjname3="";

				fclsname4="";
				fobjid4="";
				fobjname4="";
			}
			else if (getfklxbm.equals("52") || getfklxbm.equals("53") )//52：量房订金，53：设计费
			{
				ls_sql=" select kmdm,kmmc" ;
				ls_sql+=" from cw_jzkmdm " ;
				ls_sql+=" where fgsbh='"+fgsbh+"' and fklxbm='"+getfklxbm+"' and jdbz='"+fdc+"'";
				ps2= conn1.prepareStatement(ls_sql);
				rs2=ps2.executeQuery();
				if(rs2.next())
				{         
					kmdm = rs2.getString("kmdm");			    
					kmmc = rs2.getString("kmmc");			    
				}
				else{
					conn1.rollback();
					out.println("<BR>错误！收款类型编码：<A HREF='/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh="+fkxh+"' target='_blank'>["+getfklxbm+"]</A>没有对应的科目");
					return;
				}
				rs2.close();
				ps2.close();

				fexp="收"+khxm+kmmc+"("+fkxh+")";

				fclsname1="客户";
				fobjid1=hth;
				fobjname1=khxm;

				fclsname2="部门";
				fobjid2=cwdm;//财务代码
				fobjname2=dwmc;

				fclsname3="职员";
				fobjid3=bianhao;
				fobjname3=sjs;

				fclsname4="";
				fobjid4="";
				fobjname4="";
			}
			else if (getfklxbm.equals("61"))//61：家装预付款
			{

				ls_sql=" select crm_khxx.sgd,sgdmc" ;
				ls_sql+=" from crm_khxx,sq_sgd " ;
				ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd and crm_khxx.khbh='"+khbh+"'";
				ps2= conn1.prepareStatement(ls_sql);
				rs2=ps2.executeQuery();
				if(rs2.next())
				{         
					sgd = rs2.getString("sgd");			    
					sgdmc = rs2.getString("sgdmc");			    
				}
				else{
					conn1.rollback();
					out.println("<BR>错误！施工队不存在：<A HREF='/cwgl/qyecx/ViewKhxx.jsp?fkxh="+fkxh+"' target='_blank'>["+khbh+"]</A>");
					return;
				}
				rs2.close();
				ps2.close();

				ls_sql=" select kmdm,kmmc" ;
				ls_sql+=" from cw_jzkmdm " ;
				ls_sql+=" where fgsbh='"+fgsbh+"' and fklxbm='"+getfklxbm+"' and jdbz='"+fdc+"'";
				ps2= conn1.prepareStatement(ls_sql);
				rs2=ps2.executeQuery();
				if(rs2.next())
				{         
					kmdm = rs2.getString("kmdm");			    
					kmmc = rs2.getString("kmmc");			    
				}
				else{
					conn1.rollback();
					out.println("<BR>错误！收款类型编码：<A HREF='/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh="+fkxh+"' target='_blank'>["+getfklxbm+"]</A>没有对应的科目");
					return;
				}
				rs2.close();
				ps2.close();

				fexp="收"+khxm+kmmc+"("+fkxh+")";

				fclsname1="客户";
				fobjid1=hth;
				fobjname1=khxm;

				fclsname2="部门";
				fobjid2=cwdm;//财务代码
				fobjname2=dwmc;

				fclsname3="工长";
				fobjid3=sgd;
				fobjname3=sgdmc;

				fclsname4="";
				fobjid4="";
				fobjname4="";
			}
			else{
				conn1.rollback();
				out.println("<BR>错误！收款类型编码：<A HREF='/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh="+fkxh+"' target='_blank'>["+getfklxbm+"]</A>不属于工程款");
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

			ps.setString(21,"");//第5个核算项目所属类别名称
			ps.setString(22,"");//第5个核算项目ID
			ps.setString(23,"");//第5个核算项目名称
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

			ls_sql="update cw_khfkjl set czlx='2',zrkdcpz='1',dcr=?,dcsj=SYSDATE";
			ls_sql+=" where fkxh='"+fkxh+"'";
			ps2= conn1.prepareStatement(ls_sql);
			ps2.setString(1,yhmc);
			ps2.executeUpdate();
			ps2.close();

		}
		//收工程款（现金）、收工程款（非现金）、 转入工程款－－－－－－－－－－－－－－－结束

		
		//导出[转出款凭证]，收款金额为负值＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		if (getzffs.equals("31") && dcpzfl.equals("1"))//31：转出,//1：工程款；2：集成款
		{
			allsk-=fkje;

			if (getzckx.equals("11"))//11：家装款
			{
				ls_sql=" select kmdm,kmmc" ;
				ls_sql+=" from cw_jzkmdm " ;
				ls_sql+=" where fgsbh='"+fgsbh+"' and fklxbm='"+getzckx+"' and jdbz='0'  and fkcs=1";//1：借（退款）；0：贷（收款）
				ps2= conn1.prepareStatement(ls_sql);
				rs2=ps2.executeQuery();
				if(rs2.next())
				{         
					kmdm = rs2.getString("kmdm");			    
					kmmc = rs2.getString("kmmc");			    
				}
				else{
					conn1.rollback();
					out.println("<BR>错误！收款类型编码：<A HREF='/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh="+fkxh+"' target='_blank'>["+getzckx+"]</A>没有对应的科目");
					return;
				}
				rs2.close();
				ps2.close();

				fexp="转出"+khxm+kmmc+"("+fkxh+")";

				fclsname1="客户";
				fobjid1=hth;
				fobjname1=khxm;

				fclsname2="部门";
				fobjid2=cwdm;//财务代码
				fobjname2=dwmc;

				fclsname3="职员";
				fobjid3=bianhao;
				fobjname3=sjs;

				fclsname4="";
				fobjid4="";
				fobjname4="";
			}
			else if (getzckx.equals("51") || getzckx.equals("91") || getzckx.equals("94") || getzckx.equals("95"))//51：促销活动订金，91：家装返卷款，94：减项管理费，95：认证费
			{
				ls_sql=" select kmdm,kmmc" ;
				ls_sql+=" from cw_jzkmdm " ;
				ls_sql+=" where fgsbh='"+fgsbh+"' and fklxbm='"+getzckx+"' and jdbz='0'";
				ps2= conn1.prepareStatement(ls_sql);
				rs2=ps2.executeQuery();
				if(rs2.next())
				{         
					kmdm = rs2.getString("kmdm");			    
					kmmc = rs2.getString("kmmc");			    
				}
				else{
					conn1.rollback();
					out.println("<BR>错误！收款类型编码：<A HREF='/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh="+fkxh+"' target='_blank'>["+getzckx+"]</A>没有对应的科目");
					return;
				}
				rs2.close();
				ps2.close();

				fexp="转出"+khxm+kmmc+"("+fkxh+")";

				fclsname1="客户";
				fobjid1=hth;
				fobjname1=khxm;

				fclsname2="部门";
				fobjid2=cwdm;//财务代码
				fobjname2=dwmc;

				fclsname3="";
				fobjid3="";
				fobjname3="";

				fclsname4="";
				fobjid4="";
				fobjname4="";
			}
			else if (getzckx.equals("52") || getzckx.equals("53") )//52：量房订金，53：设计费
			{
				ls_sql=" select kmdm,kmmc" ;
				ls_sql+=" from cw_jzkmdm " ;
				ls_sql+=" where fgsbh='"+fgsbh+"' and fklxbm='"+getzckx+"' and jdbz='0'";
				ps2= conn1.prepareStatement(ls_sql);
				rs2=ps2.executeQuery();
				if(rs2.next())
				{         
					kmdm = rs2.getString("kmdm");			    
					kmmc = rs2.getString("kmmc");			    
				}
				else{
					conn1.rollback();
					out.println("<BR>错误！收款类型编码：<A HREF='/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh="+fkxh+"' target='_blank'>["+getzckx+"]</A>没有对应的科目");
					return;
				}
				rs2.close();
				ps2.close();

				fexp="转出"+khxm+kmmc+"("+fkxh+")";

				fclsname1="客户";
				fobjid1=hth;
				fobjname1=khxm;

				fclsname2="部门";
				fobjid2=cwdm;//财务代码
				fobjname2=dwmc;

				fclsname3="职员";
				fobjid3=bianhao;
				fobjname3=sjs;

				fclsname4="";
				fobjid4="";
				fobjname4="";
			}
			else if (getzckx.equals("61"))//61：家装预付款
			{

				ls_sql=" select crm_khxx.sgd,sgdmc" ;
				ls_sql+=" from crm_khxx,sq_sgd " ;
				ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd and crm_khxx.khbh='"+khbh+"'";
				ps2= conn1.prepareStatement(ls_sql);
				rs2=ps2.executeQuery();
				if(rs2.next())
				{         
					sgd = rs2.getString("sgd");			    
					sgdmc = rs2.getString("sgdmc");			    
				}
				else{
					conn1.rollback();
					out.println("<BR>错误！施工队不存在：<A HREF='/cwgl/qyecx/ViewKhxx.jsp?fkxh="+fkxh+"' target='_blank'>["+khbh+"]</A>");
					return;
				}
				rs2.close();
				ps2.close();

				ls_sql=" select kmdm,kmmc" ;
				ls_sql+=" from cw_jzkmdm " ;
				ls_sql+=" where fgsbh='"+fgsbh+"' and fklxbm='"+getzckx+"' and jdbz='0'";
				ps2= conn1.prepareStatement(ls_sql);
				rs2=ps2.executeQuery();
				if(rs2.next())
				{         
					kmdm = rs2.getString("kmdm");			    
					kmmc = rs2.getString("kmmc");			    
				}
				else{
					conn1.rollback();
					out.println("<BR>错误！收款类型编码：<A HREF='/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh="+fkxh+"' target='_blank'>["+getzckx+"]</A>没有对应的科目");
					return;
				}
				rs2.close();
				ps2.close();

				fexp="收"+khxm+kmmc+"("+fkxh+")";

				fclsname1="客户";
				fobjid1=hth;
				fobjname1=khxm;

				fclsname2="部门";
				fobjid2=cwdm;//财务代码
				fobjname2=dwmc;

				fclsname3="工长";
				fobjid3=sgd;
				fobjname3=sgdmc;

				fclsname4="";
				fobjid4="";
				fobjname4="";
			}
			else{
				conn1.rollback();
				out.println("<BR>错误！转出收款类型编码：<A HREF='/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh="+fkxh+"' target='_blank'>["+getzckx+"]</A>不属于工程款");
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

			ps.setString(21,"");//第5个核算项目所属类别名称
			ps.setString(22,"");//第5个核算项目ID
			ps.setString(23,"");//第5个核算项目名称
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
			ps.setDouble(37,-1*fkje);//原币金额
			ps.setDouble(38,0);//数量
			ps.setDouble(39,0);//单价
			ps.setDouble(40,-1*fdebit);//借方发生额

			ps.setDouble(41,-1*fcredit);//贷方发生额
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

			
			
			ls_sql="update cw_khfkjl set czlx='2',zckdcpz='1',dcr=?,dcsj=SYSDATE";
			ls_sql+=" where fkxh='"+fkxh+"'";
			ps2= conn1.prepareStatement(ls_sql);
			ps2.setString(1,yhmc);
			ps2.executeUpdate();
			ps2.close();
		}
		//导出转出款凭证，收款金额为负值----------------------------结束


	}

	//开始导出汇总凭证＋＋＋＋＋＋＋＋＋＋＋＋开始

	if (pzfl.equals("1"))//收工程款（现金）
	{
		fexp="工程收入";
		kmdm="101";
	}
	else if (pzfl.equals("2"))//收工程款（非现金）
	{
		fexp="工程收入";
		kmdm="102.01.06";
	}
	else if (pzfl.equals("3"))//转入、转出工程款
	{
		fexp="工程收入";
		kmdm="102.01.06";
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
		ps.setDate(1,sksj);
		ps.setDate(2,sksj);
		ps.setInt(3,0);//会计期间
		ps.setString(4,"记");//凭证字
		ps.setInt(5,0);//凭证号
		ps.setInt(6,0);//分录号
		ps.setString(7,fexp);//凭证摘要
		ps.setString(8,kmdm);//科目号
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

		row++;
	}

	//开始导出汇总凭证---------------------结束

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