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
String jiedao=null;
String cgdz=null;
String yzxxbz=null;
cqbm=cf.GB2Uni(request.getParameter("cqbm"));
jiedao=cf.GB2Uni(request.getParameter("jiedao"));
cgdz=cf.GB2Uni(request.getParameter("cgdz"));
yzxxbz=cf.GB2Uni(request.getParameter("yzxxbz"));

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
String email=cf.GB2Uni(request.getParameter("email"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));

String hdsfss=null;
if (hdbz.equals("1"))
{
	hdsfss=null;
}
else{
	hdsfss="0";
}

String yxtxdz=cf.GB2Uni(request.getParameter("yxtxdz"));
String sshybm=cf.GB2Uni(request.getParameter("sshybm"));
String gmyx=cf.GB2Uni(request.getParameter("gmyx"));
String xxlysm=cf.GB2Uni(request.getParameter("xxlysm"));

java.sql.Date jhctsj=null;
ls=request.getParameter("jhctsj");
try{
	if (!(ls.equals("")))  jhctsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jhctsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划出平面图时间]类型转换发生意外:"+e);
	return;
}
java.sql.Date jhcxgtsj=null;
ls=request.getParameter("jhcxgtsj");
try{
	if (!(ls.equals("")))  jhcxgtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jhcxgtsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划出效果图时间]类型转换发生意外:"+e);
	return;
}
java.sql.Date jhcsgtsj=null;
ls=request.getParameter("jhcsgtsj");
try{
	if (!(ls.equals("")))  jhcsgtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jhcsgtsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划出施工图时间]类型转换发生意外:"+e);
	return;
}
java.sql.Date jhzbjsj=null;
ls=request.getParameter("jhzbjsj");
try{
	if (!(ls.equals("")))  jhzbjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jhzbjsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划做电子报价时间]类型转换发生意外:"+e);
	return;
}
String khzyxz=cf.GB2Uni(request.getParameter("khzyxz"));
String djbbh=cf.GB2Uni(request.getParameter("djbbh"));
String xqlx=cf.GB2Uni(request.getParameter("xqlx"));

String[] xxlybm=request.getParameterValues("xxlybm");


String clpp=cf.GB2Uni(request.getParameter("clpp"));
String cph=cf.GB2Uni(request.getParameter("cph"));
String czms=cf.GB2Uni(request.getParameter("czms"));
String gnyq=cf.GB2Uni(request.getParameter("gnyq"));
String hyzk=cf.GB2Uni(request.getParameter("hyzk"));
String sfdkzx=cf.GB2Uni(request.getParameter("sfdkzx"));
String hznl=cf.GB2Uni(request.getParameter("hznl"));
String lrtz=cf.GB2Uni(request.getParameter("lrtz"));
String lfbz=cf.GB2Uni(request.getParameter("lfbz"));
java.sql.Date lfsj=null;
ls=request.getParameter("lfsj");
try{
	if (!(ls.equals("")))  lfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lfsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[量房时间]类型转换发生意外:"+e);
	return;
}
java.sql.Date yylfsj=null;
ls=request.getParameter("yylfsj");
try{
	if (!(ls.equals("")))  yylfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yylfsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[预约量房时间]类型转换发生意外:"+e);
	return;
}
java.sql.Date xclfsj=null;
ls=request.getParameter("xclfsj");
try{
	if (!(ls.equals("")))  xclfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xclfsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[下次来访时间]类型转换发生意外:"+e);
	return;
}



if (cf.isHanzi(khxm)!=2 && cf.isHanzi(khxm)!=4)//0:非汉字无空格；1:非汉字有空格；2：全汉字无空格；3：全汉字有空格；4：包含汉字无空格；5：包含汉字有空格
{
	out.println("<BR>错误，存盘失败！请输入正确的[姓名]，中间不允许包含空格");
	return;
}
if (cf.isHanzi(xqbm)!=2 && cf.isHanzi(xqbm)!=4)//0:非汉字无空格；1:非汉字有空格；2：全汉字无空格；3：全汉字有空格；4：包含汉字无空格；5：包含汉字有空格
{
	out.println("<BR>错误，存盘失败！请输入正确的[小区]，中间不允许包含空格");
	return;
}
String khlxfs=cf.GB2Uni(request.getParameter("khlxfs"));
String sfyckh=cf.GB2Uni(request.getParameter("sfyckh"));
String pdqybm=cf.GB2Uni(request.getParameter("pdqybm"));

String khbh=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh!='"+khbh+"' and fwdz='"+fwdz+"' ";
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

	//联系方式不能重复
	ls_sql="select count(*)";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh!='"+khbh+"' and lxfs='"+lxfs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("<P>提醒！此[联系方式]已存在");
	}


	//检查是否允许修改：【姓名】、【房屋地址】＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋
	String qdzt=null;
	ls_sql="select zt";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qdzt=rs.getString("zt");
	}
	rs.close();
	ps.close();

	String ykhxm=null;
	String yfwdz=null;
	ls_sql="select khxm,fwdz";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ykhxm=rs.getString("khxm");
		yfwdz=rs.getString("fwdz");
	}
	rs.close();
	ps.close();

	if (qdzt!=null)
	{
		if (!ykhxm.equals(khxm))
		{
			out.println("<P>提醒！该客户已签：家装或集成的订单");
		}
		if (!yfwdz.equals(fwdz))
		{
			out.println("<P>提醒！该客户已签：家装或集成的订单");
		}
	}

	int fkjl=0;
	ls_sql="select count(*)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fkjl=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (fkjl>0)
	{
		if (!ykhxm.equals(khxm))
		{
			out.println("<P>提醒！该客户已付款，不能再修改【姓名】");
		}
		if (!yfwdz.equals(fwdz))
		{
			out.println("<P>提醒！该客户已付款，不能再修改【房屋地址】");
		}
	}

	//检查是否允许修改：【姓名】、【房屋地址】－－－－－－－－－－－－－－－－－－－－－－－－

	
	//检查是否签设计合同或者签套餐意向书，如果是则不让修改客户姓名等信息	
	String qsjhtbz="";
	String qtchtbz="";
	ls_sql="select qsjhtbz,qtchtbz";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		
		qsjhtbz=cf.fillNull(rs.getString("qsjhtbz"));
		qtchtbz=cf.fillNull(rs.getString("qtchtbz"));
	}
	rs.close();
	ps.close();
	
	if (qsjhtbz.equals("Y"))
	{
		out.println("提醒！已签设计合同，不能在修改姓名");
	}
	if (qtchtbz.equals("Y"))
	{
		out.println("提醒！已签套餐合同，不能在修改姓名");
	}



	conn.setAutoCommit(false);

	ls_sql="delete from crm_khxxly ";
	ls_sql+=" where  khlx='2' and khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<xxlybm.length ;i++ )
	{
		ls_sql="insert into crm_khxxly ( khbh,xxlybm,khlx)";
		ls_sql+=" values ( ?,?,'2')";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,xxlybm[i]);
		ps.executeUpdate();
		ps.close();
	}

	ls_sql="update crm_zxkhxx set khxm=?,xb=?,fwdz=?,lxfs=?,fwlxbm=?,hxbm=?,fwmj=?,fgyqbm=?,zxysbm=?,sfxhf=?   ,hfrq=?,hdbz=?,khlxbm=?,bz=?,cqbm=?,cgdz=?,yzxxbz=?,xqbm=?,nlqjbm=?,zybm=?   ,fj=?,yjzxsj=?,jhjfsj=?,hdr=?,hdsfss=?,jzbz=?,ysrbm=?,louhao=?,email=?,yxtxdz=?   ,sshybm=?,gmyx=?,xxlysm=?,jhctsj=?,jhcxgtsj=?,jhcsgtsj=?,jhzbjsj=?,khzyxz=?,jiedao=?,djbbh=?   ,xqlx=?,clpp=?,cph=?,czms=?,gnyq=?,hyzk=?,sfdkzx=?,hznl=?,lrtz=?,yylfsj=?   ,xclfsj=? ,lfbz=?,lfsj=?,sfyckh=?,pdqybm=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khxm);
	ps.setString(2,xb);
	ps.setString(3,fwdz);
	ps.setString(4,lxfs);
	ps.setString(5,fwlxbm);
	ps.setString(6,hxbm);
	ps.setLong(7,fwmj);
	ps.setString(8,fgyqbm);
	ps.setString(9,zxysbm);
	ps.setString(10,sfxhf);

	ps.setDate(11,hfrq);
	ps.setString(12,hdbz);
	ps.setString(13,khlxbm);
	ps.setString(14,bz);
	ps.setString(15,cqbm);
	ps.setString(16,cgdz);
	ps.setString(17,yzxxbz);
	ps.setString(18,xqbm);
	ps.setString(19,nlqjbm);
	ps.setString(20,zybm);

	ps.setInt(21,fj);
	ps.setDate(22,yjzxsj);
	ps.setDate(23,jhjfsj);
	ps.setString(24,hdr);
	ps.setString(25,hdsfss);
	ps.setString(26,jzbz);
	ps.setString(27,ysrbm);
	ps.setString(28,louhao);
	ps.setString(29,email);
	ps.setString(30,yxtxdz);

	ps.setString(31,sshybm);
	ps.setString(32,gmyx);
	ps.setString(33,xxlysm);
	ps.setDate(34,jhctsj);
	ps.setDate(35,jhcxgtsj);
	ps.setDate(36,jhcsgtsj);
	ps.setDate(37,jhzbjsj);
	ps.setString(38,khzyxz);
	ps.setString(39,jiedao);
	ps.setString(40,djbbh);

	ps.setString(41,xqlx);
	ps.setString(42,clpp);
	ps.setString(43,cph);
	ps.setString(44,czms);
	ps.setString(45,gnyq);
	ps.setString(46,hyzk);
	ps.setString(47,sfdkzx);
	ps.setString(48,hznl);
	ps.setString(49,lrtz);
	ps.setDate(50,yylfsj);

	ps.setDate(51,xclfsj);
	ps.setString(52,lfbz);
	ps.setDate(53,lfsj);
	ps.setString(54,sfyckh);
	ps.setString(55,pdqybm);

	ps.executeUpdate();
	ps.close();

	//增加：客户联系方式＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	ls_sql="delete from crm_khlxfs ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	java.util.StringTokenizer rowArray=new java.util.StringTokenizer(khlxfs,"*");
	int row=rowArray.countTokens();
	for (int i=0;i<row;i++ )
	{
		String rowStr=rowArray.nextToken();
		java.util.StringTokenizer colArray=new java.util.StringTokenizer(rowStr,"^");
		int col=colArray.countTokens();

		String lxr="";
		String lx="";
		String dhqh="";
		String qhdh="";
		String dhhm="";
		String fenji="";

		if (col>0)
		{
			lxr=colArray.nextToken();
		}
		if (col>1)
		{
			lx=colArray.nextToken();
		}
		if (col>2)
		{
			dhqh=colArray.nextToken();
		}
		if (col>3)
		{
			qhdh=colArray.nextToken();
		}
		if (col>4)
		{
			dhhm=colArray.nextToken();
		}
		if (col>5)
		{
			fenji=colArray.nextToken();
		}

		ls_sql="insert into crm_khlxfs ( khbh,qhdh,lxr,dhhm,fj,dhqh,lx,bz ) ";
		ls_sql+=" values ( '"+khbh+"','"+qhdh+"','"+lxr+"','"+dhhm+"','"+fenji+"','"+dhqh+"','"+lx+"','' ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	//增加：客户联系方式＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
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