<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String boloniKhbh=request.getParameter("boloniKhbh");
String dwlx=(String)session.getAttribute("dwlx");
String dwbh=(String)session.getAttribute("dwbh");
String ls=null;
//String khbh=null;
String khxm=null;
String xb=null;
String cqbm=null;
String xqbm=null;
String fwdz=null;
String lxfs=null;
String zybm=null;
long fj=0;
String sjs=null;
String khlxbm=null;
java.sql.Date yjzxsj=null;
String zxysbm=null;
String fwlxbm=null;
String hxbm=null;
long fwmj=0;
String fgyqbm=null;
String hdbz=null;
String cgdz=null;
String yzxxbz=null;
String sfxhf=null;
java.sql.Date hfrq=null;
String zxdm=null;
String zxdjbm=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
//khbh=cf.GB2Uni(request.getParameter("khbh"));
khxm=cf.GB2Uni(request.getParameter("khxm"));
xb=cf.GB2Uni(request.getParameter("xb"));
cqbm=cf.GB2Uni(request.getParameter("cqbm"));
xqbm=cf.GB2Uni(request.getParameter("xqbm"));
fwdz=cf.GB2Uni(request.getParameter("fwdz"));
lxfs=cf.GB2Uni(request.getParameter("lxfs"));
String nlqjbm=request.getParameter("nlqjbm");
String ysrbm=cf.GB2Uni(request.getParameter("ysrbm"));
zybm=cf.GB2Uni(request.getParameter("zybm"));
ls=request.getParameter("fj");
try{
	if (!(ls.equals("")))  fj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[房价]类型转换发生意外:"+e);
	return;
}
sjs=cf.GB2Uni(request.getParameter("sjs"));
khlxbm=cf.GB2Uni(request.getParameter("khlxbm"));
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
zxysbm=cf.GB2Uni(request.getParameter("zxysbm"));
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
	out.println("<BR>[建筑面积]类型转换发生意外:"+e);
	return;
}
fgyqbm=cf.GB2Uni(request.getParameter("fgyqbm"));
hdbz=cf.GB2Uni(request.getParameter("hdbz"));
cgdz=cf.GB2Uni(request.getParameter("cgdz"));
yzxxbz=cf.GB2Uni(request.getParameter("yzxxbz"));
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
zxdm=cf.GB2Uni(request.getParameter("zxdm"));
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
bz=cf.GB2Uni(request.getParameter("bz"));

if (!dwlx.equals("F2"))
{
	zxdm=cf.GB2Uni(request.getParameter("zxdm"));
}
else{//店面登记
	zxdm=dwbh;
}

String ywy=cf.GB2Uni(request.getParameter("ywy"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String jzbz=cf.GB2Uni(request.getParameter("jzbz"));
String sjsbh=cf.GB2Uni(request.getParameter("sjsbh"));
String rddqbm=cf.GB2Uni(request.getParameter("rddqbm"));
String hxwzbm=cf.GB2Uni(request.getParameter("hxwzbm"));
String louhao=cf.GB2Uni(request.getParameter("louhao"));

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
String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));
String cxhdbmxq=cf.GB2Uni(request.getParameter("cxhdbmxq"));
String cxhdbmzh=cf.GB2Uni(request.getParameter("cxhdbmzh"));
String qtdh=cf.GB2Uni(request.getParameter("qtdh"));
String email=cf.GB2Uni(request.getParameter("email"));

String zzystybj=cf.GB2Uni(request.getParameter("zzystybj"));
String zzydlgj=cf.GB2Uni(request.getParameter("zzydlgj"));


String hdsfss=null;
if (hdbz.equals("1"))
{
	hdsfss=null;
}
else{
	hdsfss="0";
}

String[] xxlybm=request.getParameterValues("xxlybm");

String yxtxdz=cf.GB2Uni(request.getParameter("yxtxdz"));
String sshybm=cf.GB2Uni(request.getParameter("sshybm"));
String gmyx=cf.GB2Uni(request.getParameter("gmyx"));
String ybjyx=cf.GB2Uni(request.getParameter("ybjyx"));

//返回值：0:非汉字无空格；1:非汉字有空格；2：全汉字无空格；3：全汉字有空格；4：包含汉字无空格；5：包含汉字有空格
if (cf.isHanzi(khxm)!=2 && cf.isHanzi(khxm)!=4)//0:非汉字无空格；1:非汉字有空格；2：全汉字无空格；3：全汉字有空格；4：包含汉字无空格；5：包含汉字有空格
{
	out.println("<BR>错误，存盘失败！请输入正确的[姓名]，中间包含不允许的字符");
	return;
}
if (cf.isHanzi(xqbm)!=2 && cf.isHanzi(xqbm)!=4)//0:非汉字无空格；1:非汉字有空格；2：全汉字无空格；3：全汉字有空格；4：包含汉字无空格；5：包含汉字有空格
{
	out.println("<BR>错误，存盘失败！请输入正确的[小区]，中间包含不允许的字符");
	return;
}


String sjsgh="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
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

	String getkhbh=null;
	String getkhxm=null;
	String getfwdz=null;
	String getlrr=null;
	String getlrsj=null;
	String getdwmc=null;
	ls_sql="select khbh,khxm,fwdz,lrr,lrsj,dwmc";
	ls_sql+=" from  crm_zxkhxx,sq_dwxx";
	ls_sql+=" where crm_zxkhxx.zxdjbm=sq_dwxx.dwbh and crm_zxkhxx.lxfs='"+lxfs+"' ";
	ls_sql+=" and rownum<5";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getkhbh=cf.fillNull(rs.getString("khbh"));
		getkhxm=cf.fillNull(rs.getString("khxm"));
		getfwdz=cf.fillNull(rs.getString("fwdz"));
		getlrr=cf.fillNull(rs.getString("lrr"));
		getlrsj=cf.fillNull(rs.getDate("lrsj"));
		getdwmc=cf.fillNull(rs.getString("dwmc"));

		out.println("<P>错误！电话已存在，『"+getkhbh+"："+getkhxm+"："+getfwdz+"』『"+getdwmc+"』于"+getlrsj+"录入");
		return;
	}
	rs.close();
	ps.close();



	//客户编号
	int xh=0;
	ls_sql="select NVL(max(TO_NUMBER(khbh))+1,1)";
	ls_sql+=" from  crm_zxkhxx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	ps.close();
	rs.close();
	String khbh=cf.addZero(xh,7);

	//客户编号
	while (true)
	{
		khbh=cf.addZero(xh,7);

		ls_sql="select count(*)";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'";
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
			xh++;
		}
		else{
			break;
		}
	}

	/*检查促销活动是否可共享＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始*/
	String kgxqthd="";
	if (!cxhdbm.equals(""))
	{
		ls_sql="select kgxqthd";
		ls_sql+=" from  jc_cxhd";
		ls_sql+=" where cxhdmc ='"+cxhdbm+"' and fgsbh='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			kgxqthd=rs.getString(1);
		}
		rs.close();
		ps.close();

		if (kgxqthd.equals("1"))//1：不可共享；2：可共享
		{
			if (!cxhdbmxq.equals("") || !cxhdbmzh.equals(""))
			{
				out.println("<BR>错误！！！公司促销活动["+cxhdbm+"]不可共享其它活动");
				return;
			}
		}
	}

	if (!cxhdbmxq.equals(""))
	{
		ls_sql="select kgxqthd";
		ls_sql+=" from  jc_cxhd";
		ls_sql+=" where cxhdmc ='"+cxhdbmxq+"' and fgsbh='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			kgxqthd=rs.getString(1);
		}
		rs.close();
		ps.close();

		if (kgxqthd.equals("1"))//1：不可共享；2：可共享
		{
			if ( (!cxhdbm.equals("无活动") && !cxhdbm.equals("")) || !cxhdbmzh.equals(""))
			{
				out.println("<BR>错误！！！小区促销活动["+cxhdbmxq+"]不可共享其它活动");
				return;
			}
		}
	}

	if (!cxhdbmzh.equals(""))
	{
		ls_sql="select kgxqthd";
		ls_sql+=" from  jc_cxhd";
		ls_sql+=" where cxhdmc ='"+cxhdbmzh+"' and fgsbh='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			kgxqthd=rs.getString(1);
		}
		rs.close();
		ps.close();

		if (kgxqthd.equals("1"))//1：不可共享；2：可共享
		{
			if ((!cxhdbm.equals("无活动") && !cxhdbm.equals("")) || !cxhdbmxq.equals(""))
			{
				out.println("<BR>错误！！！展会促销活动["+cxhdbmzh+"]不可共享其它活动");
				return;
			}
		}
	}
	/*检查促销活动是否可共享=====================================结束*/

	conn.setAutoCommit(false);

	//sjs不为空，记录：设计师分配时间（sjsfpsj）,zxdm不为空，记录：咨询店面分配时间（zxdmfpsj）
	java.sql.Date sjsfpsj=null;
	java.sql.Date zxdmfpsj=null;
	String zxzt=null;
	String khfwjlh=null;
	String sjsjdjlh=null;
	String dmjdjlh=null;

	if (zxdm==null || zxdm.equals(""))
	{
		zxdmfpsj=null;
		zxzt="0";//0：未分配店面；1: 分配店面；2: 飞单审核未通过；3：已签约；4：飞单；5：飞单审核未通过
	}
	else{
		zxdmfpsj=cf.getDate();
		zxzt="1";//0：未分配店面；1: 分配店面；2: 飞单审核未通过；3：已签约；4：飞单；5：飞单审核未通过

		//插入：店面接单记录（crm_dmjdjl）
		dmjdjlh=khbh+"001";
		ls_sql="insert into crm_dmjdjl (dmjdjlh,khbh,ssfgs,zxdm,kssj,kslrr,zxzt)";
		ls_sql+=" values ( ?,?,?,?,?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,dmjdjlh);
		ps.setString(2,khbh);
		ps.setString(3,ssfgs);
		ps.setString(4,zxdm);
		ps.setDate(5,lrsj);
		ps.setString(6,lrr);
		ps.setString(7,zxzt);
		ps.executeUpdate();
		ps.close();

	}

	if (sjs==null || sjs.equals(""))
	{
		sjsfpsj=null;
	}
	else{
		sjsfpsj=cf.getDate();

		ls_sql="select sq_yhxx.ygbh";
		ls_sql+=" from  sq_yhxx,sq_sqbm";
		ls_sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+zxdm+"' ";
		ls_sql+=" and sq_yhxx.yhmc ='"+sjs+"' and sq_yhxx.zwbm='04' and sq_yhxx.sfzszg in('Y','N')";//04:设计师
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sjsgh=cf.fillNull(rs.getString("ygbh"));
		}
		else{
			conn.rollback();
			out.println("<BR>错误！该单位无此设计师");
			return;
		}
		rs.close();
		ps.close();

		
		//插入表：设计师接单记录（crm_sjsjdjl）
		sjsjdjlh=khbh+"001";
		ls_sql="insert into crm_sjsjdjl  (sjsjdjlh,khbh,ssfgs,zxdm,sjs,kssj,kslrr,zxzt)";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sjsjdjlh);
		ps.setString(2,khbh);
		ps.setString(3,ssfgs);
		ps.setString(4,zxdm);
		ps.setString(5,sjs);
		ps.setDate(6,lrsj);
		ps.setString(7,lrr);
		ps.setString(8,zxzt);
		ps.executeUpdate();
		ps.close();
	}

	String czlx=null;//1: 总部客户资料录入；2: 分公司客户资料录入；3: 店面客户资料录入
	if (dwlx.equals("A0") || dwlx.equals("A1"))
	{
		czlx="1";
	}
	else if (dwlx.equals("F0") || dwlx.equals("F1"))
	{
		czlx="2";
	}
	else{//店面登记
		czlx="3";
	}
	//插入表：咨询客户服务记录（crm_zxkhfwjl）
	khfwjlh=khbh+"001";
	ls_sql="insert into crm_zxkhfwjl (khfwjlh,khbh,ssfgs,zxdm,sjs,czlx,xzxzt,lrr,lrsj,lrbm)";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?)";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khfwjlh);
	ps.setString(2,khbh);
	ps.setString(3,ssfgs);
	ps.setString(4,zxdm);
	ps.setString(5,sjs);
	ps.setString(6,czlx);
	ps.setString(7,zxzt);
	ps.setString(8,lrr);
	ps.setDate(9,lrsj);
	ps.setString(10,zxdjbm);
	ps.executeUpdate();
	ps.close();

	//客户信息来源
	for (int i=0;i<xxlybm.length ;i++ )
	{
		ls_sql="insert into crm_khxxly ( khbh,xxlybm,khlx)";
		ls_sql+=" values ( ?,?,'2')";//1：签约客户；2：咨询客户
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,xxlybm[i]);
		ps.executeUpdate();
		ps.close();
	}

	ls_sql="insert into crm_zxkhxx ( khbh,khxm,xb,cqbm,xqbm,fwdz,lxfs,nlqjbm,zybm,fj,sjs,khlxbm,yjzxsj,zxysbm,fwlxbm    ,hxbm,fwmj,fgyqbm,hdbz,cgdz,yzxxbz,sfxhf,hfrq,zxdm,zxdjbm,lrr,lrsj,bz,zxzt,ywy    ,lfbz,ctbz,shbz,ssfgs,sjsfpsj,jhjfsj,hdr,zxdmfpsj,hdsfss,jzbz,sjsbh,sjsjsbz,rddqbm,hxwzbm,ysrbm   ,louhao,sfzdzbj,khfwjlh,sjsjdjlh,dmjdjlh,cxhdbm,sjsgh,sfjczjz,lfdjbz,hddjbz,lrkhxm,lrfwdz,lrlxfs,sjfbz   ,qtdh,email,cxhdbmxq,cxhdbmzh,cxgtbz,csgtbz,qsjhtbz,ysshbz,bjdysq,yxtxdz,sshybm,gmyx,ybjyx,zzystybj,zzydlgj,boloni_khbh) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?,?,SYSDATE,?,?,?   ,'N','N','N',?,?,?,?,?,?,?,?,'0',?,?,?   ,?,'N',?,?,?,?,?,'2','N','N',?,?,?,'N'   ,?,?,?,?,'N','N','N','N','0',?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,khxm);
	ps.setString(3,xb);
	ps.setString(4,cqbm);
	ps.setString(5,xqbm);
	ps.setString(6,fwdz);
	ps.setString(7,lxfs);
	ps.setString(8,nlqjbm);
	ps.setString(9,zybm);
	ps.setLong(10,fj);
	ps.setString(11,sjs);
	ps.setString(12,khlxbm);
	ps.setDate(13,yjzxsj);
	ps.setString(14,zxysbm);
	ps.setString(15,fwlxbm);

	ps.setString(16,hxbm);
	ps.setLong(17,fwmj);
	ps.setString(18,fgyqbm);
	ps.setString(19,hdbz);
	ps.setString(20,cgdz);
	ps.setString(21,yzxxbz);
	ps.setString(22,sfxhf);
	ps.setDate(23,hfrq);
	ps.setString(24,zxdm);
	ps.setString(25,zxdjbm);
	ps.setString(26,lrr);
	ps.setString(27,bz);
	ps.setString(28,zxzt);
	ps.setString(29,ywy);

	ps.setString(30,ssfgs);
	ps.setDate(31,sjsfpsj);
	ps.setDate(32,jhjfsj);
	ps.setString(33,hdr);
	ps.setDate(34,zxdmfpsj);
	ps.setString(35,hdsfss);
	ps.setString(36,jzbz);
	ps.setString(37,sjsbh);
	ps.setString(38,rddqbm);
	ps.setString(39,hxwzbm);
	ps.setString(40,ysrbm);

	ps.setString(41,louhao);
	ps.setString(42,khfwjlh);
	ps.setString(43,sjsjdjlh);
	ps.setString(44,dmjdjlh);
	ps.setString(45,cxhdbm);
	ps.setString(46,sjsgh);
	ps.setString(47,khxm);
	ps.setString(48,fwdz);
	ps.setString(49,lxfs);

	ps.setString(50,qtdh);
	ps.setString(51,email);
	ps.setString(52,cxhdbmxq);
	ps.setString(53,cxhdbmzh);
	ps.setString(54,yxtxdz);
	ps.setString(55,sshybm);
	ps.setString(56,gmyx);
	ps.setString(57,ybjyx);
	ps.setString(58,zzystybj);
	ps.setString(59,zzydlgj);
	ps.setString(60,boloniKhbh);

	ps.executeUpdate();
	ps.close();


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！生成客户编号<<%=khbh%>>");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL: " + ls_sql);
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