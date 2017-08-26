<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String czph=request.getParameter("czph");

//取得凭证数据库必须参数
String kmdm=request.getParameter("kmdm");//科目代码
String pzz=cf.GB2Uni(request.getParameter("pzz"));//凭证字
int pzh=0;


String rootPath=getServletContext().getRealPath("");
String DBFSourece=rootPath+"/DBF/jdpz.dbf";
String DownFile=rootPath+"/DBF/"+yhdlm+".DBF";
String driver = "sun.jdbc.odbc.JdbcOdbcDriver";
String url = "jdbc:odbc:wqtdbf";
String user = "";
String passwd = "";
Connection conn  = null;
Connection conn1  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String hth="";
String xm=null;
String fklxmc=null;
double fkje=0;
java.sql.Date sksj=null;
String sksjStr=null;
String yuefen=null;
int yf=0;
String bz=null;
String bmbh=null;
String bmdm=null;
String skr=null;
String sjs=null;
String ls_sql=null;
String ls_sql1=null;
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
String zydm=null;

int count=0;

try {


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

	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql1+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
		if (!(crm_khxx_khxm.equals("")))	wheresql2+=" and  (crm_zxkhxx.khxm='"+crm_khxx_khxm+"')";
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
		if (!(crm_khxx_hth.equals("")))	wheresql2+=" and  (crm_zxkhxx.hth='"+crm_khxx_hth+"')";
	}

	String khlx=null;
	khlx=request.getParameter("khlx");
	if (!(khlx.equals("")))	wheresql+=" and  (cw_khfkjl.khlx='"+khlx+"')";

	String scbz=null;
	scbz=request.getParameter("scbz");
	if (!(scbz.equals("")))	wheresql+=" and  (cw_khfkjl.scbz='"+scbz+"')";

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (cw_khfkjl.skdw in(select dwbh from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+fgs+"'))";

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
	//连接Oracle数据库
	conn1=cf.getConnection();    
	//连接DBF数据库
	Class.forName (driver);
	conn = DriverManager.getConnection(url, user, passwd);
	//ls_sql1="SELECT hth,xm,fklxmc,fkje,dwmc,skr,sksj,bz,dwbh from ";
	ls_sql1="SELECT crm_khxx.hth as hth,crm_khxx.khxm as xm,a.fklxmc as fklxmc,cw_khfkjl.fkje as fkje,sq_dwxx.dwbh as dwbh ";
	ls_sql1+=",cw_khfkjl.skr as skr,cw_khfkjl.sksj as sksj,cw_khfkjl.bz as bz,crm_khxx.sjs as sjs ";
	ls_sql1+=" FROM cw_khfkjl,crm_khxx,sq_dwxx,cw_fklxbm a,cw_fklxbm b,cw_zffsbm  ";
    ls_sql1+=" where cw_khfkjl.khbh=crm_khxx.khbh(+) and crm_khxx.dwbh=sq_dwxx.dwbh and cw_khfkjl.fklxbm=a.fklxbm";
	ls_sql1+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm and cw_khfkjl.zckx=b.fklxbm(+)";
    ls_sql1+=" and cw_khfkjl.khlx in('2','4')";
    ls_sql1+=wheresql;
    ls_sql1+=wheresql1;

    ls_sql1+=" UNION all";

	ls_sql1+=" SELECT '',crm_zxkhxx.khxm as xm ,a.fklxmc as fklxmc, cw_khfkjl.fkje as fkje,sq_dwxx.dwbh as dwbh";
	ls_sql1+=",cw_khfkjl.skr as skr,cw_khfkjl.sksj as sksj,cw_khfkjl.bz  as bz,crm_zxkhxx.sjs as sjs ";
	ls_sql1+=" FROM cw_khfkjl,crm_zxkhxx,sq_dwxx,cw_fklxbm a,cw_fklxbm b,cw_zffsbm  ";
    ls_sql1+=" where cw_khfkjl.khbh=crm_zxkhxx.khbh(+) and crm_zxkhxx.zxdm=sq_dwxx.dwbh and cw_khfkjl.fklxbm=a.fklxbm";
	ls_sql1+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm and cw_khfkjl.zckx=b.fklxbm(+)";
    ls_sql1+=" and cw_khfkjl.khlx in('1')";
    ls_sql1+=wheresql;
    ls_sql1+=wheresql2;
    //ls_sql1+=" order by khlx,fkxh";	
	ps1= conn1.prepareStatement(ls_sql1);//连oracle数据库
	rs1=ps1.executeQuery();

	while(rs1.next())
	{

		hth=cf.fillHtml(rs1.getString("hth"));
		xm=cf.fillNull(rs1.getString("xm"));
		fklxmc=cf.fillNull(rs1.getString("fklxmc"));
		fkje=rs1.getDouble("fkje");
		sksj=rs1.getDate("sksj");
		sksjStr=cf.fillNull(rs1.getDate("sksj"));
		yuefen=sksjStr.substring(5,7);//取当前日期月份
		yf=Integer.parseInt(yuefen);
		skr=cf.fillNull(rs1.getString("skr"));
		bz=cf.fillNull(rs1.getString("bz"));
		sjs=cf.fillNull(rs1.getString("sjs"));
		bmbh=cf.fillNull(rs1.getString("dwbh"));
        //通过店面的单位编号求财务软件中的的部门编号
		ls_sql="select bmdm from  cw_bmdm where dwbh='"+dwbh+"' and  bmbh='"+bmbh+"' ";
		ps= conn1.prepareStatement(ls_sql);//连oracle数据库
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			bmdm=cf.fillNull(rs.getString("bmdm"));
		}
		rs.close();
		ps.close();
        //通过设计师姓名求职员代码 
		ls_sql="select zydm from  cw_zydm where dwbh='"+dwbh+"' and  xm='"+sjs+"' ";
		ps= conn1.prepareStatement(ls_sql);//连oracle数据库
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			zydm=cf.fillNull(rs.getString("zydm"));
		}
		rs.close();
		ps.close();

		ls_sql = "insert into "+yhdlm+"(fdate,ftransdate,fentryid,fexp,facctid,fobjid1,fobjname1,fobjid2,fobjid3,fcredit,fperiod,fgroup";
		//ls_sql+= "fposted,fdeleted)";
        ls_sql+= ",fclsname1,fclsname2,fclsname3)";
		ls_sql+= " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		ps= conn.prepareStatement(ls_sql);//连DBase数据库
		ps.setDate(1,sksj);//fdate
		ps.setDate(2,sksj);//,ftransdate
		ps.setInt(3,count);//fentryid序号
		ps.setString(4,xm+fklxmc);//fexp摘要
		ps.setString(5,kmdm);//facctid科目代码
		ps.setString(6,hth);//fobjid1合同号
		ps.setString(7,xm);//fobjname1客户姓名
		ps.setString(8,bmdm);//fobjid2部门代码
		ps.setString(9,zydm);//fobjid3职员（主要指设计师）代码
		ps.setDouble(10,fkje);
		ps.setInt(11,yf);//fperiod
		ps.setString(12,pzz);//fgroup凭证字
		ps.setString(13,"客户");//fgroup凭证字
		ps.setString(14,"部门");//fgroup凭证字
		ps.setString(15,"职员");//fgroup凭证字

		ps.executeUpdate();
		ps.close();
		count++;

	}
	ps1.close();
	rs1.close();
	out.print("<BR>成功生成凭证文件："+cf.GB2Uni(yhdlm)+".DBF，共生成记录数："+count+"（条）");
	out.print("<BR>点击鼠标右键下载!" );
}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql1);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) conn.close();
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn1 != null) cf.close(conn1);    //释放连接
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>
<BR><BR><A HREF="/DBF/<%=yhdlm%>.DBF">点击鼠标右键下载生成的凭证DBF文件</A>
