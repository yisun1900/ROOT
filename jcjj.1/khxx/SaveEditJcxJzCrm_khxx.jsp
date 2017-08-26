<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String fwlxbm=null;
String hxbm=null;
long fwmj=0;
String fgyqbm=null;
String zxysbm=null;
String sfxhf=null;
java.sql.Date hfrq=null;
String hdbz=null;
String khlxbm=null;
String bz=null;
String rddqbm=cf.GB2Uni(request.getParameter("rddqbm"));
String hxwzbm=cf.GB2Uni(request.getParameter("hxwzbm"));
khxm=cf.GB2Uni(request.getParameter("khxm"));
xb=cf.GB2Uni(request.getParameter("xb"));
fwdz=cf.GB2Uni(request.getParameter("fwdz"));
lxfs=cf.GB2Uni(request.getParameter("lxfs"));
fwlxbm=cf.GB2Uni(request.getParameter("fwlxbm"));
hxbm=cf.GB2Uni(request.getParameter("hxbm"));
ls=request.getParameter("fwmj");
try{
	if (!(ls.equals("")))  fwmj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fwmj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[套内建筑面积]类型转换发生意外:"+e);
	return;
}
fgyqbm=cf.GB2Uni(request.getParameter("fgyqbm"));
zxysbm=cf.GB2Uni(request.getParameter("zxysbm"));
sfxhf=cf.GB2Uni(request.getParameter("sfxhf"));
ls=request.getParameter("hfrq");
try{
	if (!(ls.equals("")))  hfrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量hfrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[回访日期]类型转换发生意外:"+e);
	return;
}
hdbz=cf.GB2Uni(request.getParameter("hdbz"));
khlxbm=cf.GB2Uni(request.getParameter("khlxbm"));
bz=cf.GB2Uni(request.getParameter("bz"));

String cqbm=null;
String cgdz=null;
cqbm=cf.GB2Uni(request.getParameter("cqbm"));
cgdz=cf.GB2Uni(request.getParameter("cgdz"));

java.sql.Date yjzxsj=null;
String zybm=request.getParameter("zybm");
String xqbm=cf.GB2Uni(request.getParameter("xqbm"));
String nlqjbm=request.getParameter("nlqjbm");
String ysrbm=cf.GB2Uni(request.getParameter("ysrbm"));
int fj=0;

ls=request.getParameter("yjzxsj");
try{
	if (!(ls.equals("")))  yjzxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yjzxsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[预计装修时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("fj");
try{
	if (!(ls.equals("")))  fj=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[房价]类型转换发生意外:"+e);
	return;
}

String jzbz=cf.GB2Uni(request.getParameter("jzbz"));

java.sql.Date jhjfsj=null;
String hdr=null;
hdr=cf.GB2Uni(request.getParameter("hdr"));
ls=request.getParameter("jhjfsj");
try{
	if (!(ls.equals("")))  jhjfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhjfsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划交房时间]类型转换发生意外:"+e);
	return;
}

String louhao=cf.GB2Uni(request.getParameter("louhao"));
String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String zxdm=cf.GB2Uni(request.getParameter("zxdm"));
String zxdjbm=null;
String lrr=null;
java.sql.Date lrsj=null;
zxdjbm=cf.GB2Uni(request.getParameter("zxdjbm"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}

String hdsfss=null;
if (hdbz.equals("1"))
{
	hdsfss=null;
}
else{
	hdsfss="0";
}



String[] xxlybm=request.getParameterValues("xxlybm");


if (cf.isHanzi(khxm)!=2)//0:非汉字无空格；1:非汉字有空格；2：全汉字无空格；3：全汉字有空格；4：包含汉字无空格；5：包含汉字有空格
{
	out.println("<BR>错误，存盘失败！请输入正确的[姓名]，中间不允许包含空格");
	return;
}
if (cf.isHanzi(xqbm)!=2 && cf.isHanzi(xqbm)!=4)//0:非汉字无空格；1:非汉字有空格；2：全汉字无空格；3：全汉字有空格；4：包含汉字无空格；5：包含汉字有空格
{
	out.println("<BR>错误，存盘失败！请输入正确的[小区]，中间不允许包含空格");
	return;
}

String wherekhbh=null;
wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));


String zxzt="1";
java.sql.Date zxdmfpsj=lrsj;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("错误！已转为家装客户");
		return;
	}

	ls_sql="select count(*)";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where fwdz='"+fwdz+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("提醒！此房屋地址已存在");
	}

	String dmjdjlh=null;//操作序号
	ls_sql="select NVL(max(substr(dmjdjlh,8,3)),0)";
	ls_sql+=" from  crm_dmjdjl";
	ls_sql+=" where khbh='"+wherekhbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	dmjdjlh=wherekhbh+cf.addZero(count+1,3);

	String khfwjlh=null;//操作序号
	ls_sql="select NVL(max(substr(khfwjlh,8,3)),0)";
	ls_sql+=" from  crm_zxkhfwjl";
	ls_sql+=" where khbh='"+wherekhbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	khfwjlh=wherekhbh+cf.addZero(count+1,3);


	conn.setAutoCommit(false);

	ls_sql="update crm_khxx set khxm=?,xb=?,fwdz=?,cqbm=?,lxfs=?,khlxbm=?,zybm=?,bz=?";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khxm);
	ps.setString(2,xb);
	ps.setString(3,fwdz);
	ps.setString(4,cqbm);
	ps.setString(5,lxfs);
	ps.setString(6,khlxbm);
	ps.setString(7,zybm);
	ps.setString(8,bz);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_khxxly ";
	ls_sql+=" where  khlx='2' and khbh='"+wherekhbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<xxlybm.length ;i++ )
	{
		ls_sql="insert into crm_khxxly ( khbh,xxlybm,khlx)";
		ls_sql+=" values ( ?,?,'2')";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,wherekhbh);
		ps.setString(2,xxlybm[i]);
		ps.executeUpdate();
		ps.close();
	}
	
	ls_sql="insert into crm_zxkhxx ( khbh,khxm,xb,cqbm,xqbm,fwdz,lxfs,nlqjbm,zybm,fj,khlxbm,yjzxsj,zxysbm,fwlxbm    ,hxbm,fwmj,fgyqbm,hdbz,cgdz,yzxxbz,sfxhf,hfrq,zxdm,zxdjbm,lrr,lrsj,bz,zxzt    ,lfbz,ctbz,shbz,ssfgs,jhjfsj,hdr,zxdmfpsj,hdsfss,jzbz,sjsjsbz,rddqbm,hxwzbm,ysrbm,louhao,sfzdzbj,khfwjlh,dmjdjlh,cxhdbm,sfjczjz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?,?,?,?,?   ,'N','N','N',?,?,?,?,?,?,'0',?,?,?,?,'N',?,?,?,'1') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,wherekhbh);
	ps.setString(2,khxm);
	ps.setString(3,xb);
	ps.setString(4,cqbm);
	ps.setString(5,xqbm);
	ps.setString(6,fwdz);
	ps.setString(7,lxfs);
	ps.setString(8,nlqjbm);
	ps.setString(9,zybm);
	ps.setLong(10,fj);

	ps.setString(11,khlxbm);
	ps.setDate(12,yjzxsj);
	ps.setString(13,zxysbm);
	ps.setString(14,fwlxbm);

	ps.setString(15,hxbm);
	ps.setLong(16,fwmj);
	ps.setString(17,fgyqbm);
	ps.setString(18,hdbz);
	ps.setString(19,cgdz);
	ps.setString(20,"Y");
	ps.setString(21,sfxhf);
	ps.setDate(22,hfrq);
	ps.setString(23,zxdm);
	ps.setString(24,zxdjbm);
	ps.setString(25,lrr);
	ps.setDate(26,lrsj);
	ps.setString(27,bz);
	ps.setString(28,zxzt);
 
	ps.setString(29,ssfgs);

 	ps.setDate(30,jhjfsj);
	ps.setString(31,hdr);
	ps.setDate(32,zxdmfpsj);
	ps.setString(33,hdsfss);
	ps.setString(34,jzbz);
 
	ps.setString(35,rddqbm);
	ps.setString(36,hxwzbm);
	ps.setString(37,ysrbm);
	ps.setString(38,louhao);
	ps.setString(39,khfwjlh);
   
	ps.setString(40,dmjdjlh);
	ps.setString(41,cxhdbm);

	ps.executeUpdate();
	ps.close();

		//插入：店面接单记录（crm_dmjdjl）
	ls_sql="insert into crm_dmjdjl (dmjdjlh,khbh,ssfgs,zxdm,kssj,kslrr,ydmjdjlh,zxzt)";
	ls_sql+=" values ( ?,?,?,?,TRUNC(SYSDATE),?,?,?)";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dmjdjlh);
	ps.setString(2,wherekhbh);
	ps.setString(3,ssfgs);
	ps.setString(4,zxdm);
	ps.setString(5,lrr);
	ps.setString(6,"");
	ps.setString(7,zxzt);
	ps.executeUpdate();
	ps.close();


	//插入表：咨询客户服务记录（crm_zxkhfwjl）
	ls_sql="insert into crm_zxkhfwjl (khfwjlh,khbh,ssfgs,zxdm,czlx,xzxzt,yzxzt,yzxdm,lrr,lrsj,lrbm,ykhfwjlh,sbyyxs)";
	ls_sql+=" values ( ?,?,?,?,'5',?,?,?,?,TRUNC(SYSDATE),?,?,'集成转家装')";//5: 分配店面
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khfwjlh);
	ps.setString(2,wherekhbh);
	ps.setString(3,ssfgs);
	ps.setString(4,zxdm);
	ps.setString(5,zxzt);
	ps.setString(6,"");
	ps.setString(7,"");
	ps.setString(8,lrr);
	ps.setString(9,zxdjbm);
	ps.setString(10,"");
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("转换成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>