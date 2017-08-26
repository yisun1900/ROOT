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
String yzxxbz=null;
cqbm=cf.GB2Uni(request.getParameter("cqbm"));
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

String ywy=cf.GB2Uni(request.getParameter("ywy"));
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
String cxhdbmxq=cf.GB2Uni(request.getParameter("cxhdbmxq"));
String cxhdbmzh=cf.GB2Uni(request.getParameter("cxhdbmzh"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));

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
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String yzxdm=null;
String ysjs=null;
java.sql.Date ysjsfpsj=null;
java.sql.Date yzxdmfpsj=null;

try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh!='"+wherekhbh+"' and fwdz='"+fwdz+"' ";
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

/*
	//联系方式不能重复
	ls_sql="select count(*)";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh!='"+wherekhbh+"' and lxfs='"+lxfs+"'";
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
		out.println("<P>存盘失败！此[联系方式]已存在");
		return;
	}
*/
	//检查是否允许修改：【姓名】、【房屋地址】＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋
	String qdzt=null;
	ls_sql="select zt";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qdzt=rs.getString("zt");
	}
	rs.close();
	ps.close();

	if (qdzt!=null)
	{
		String ykhxm=null;
		String yfwdz=null;
		ls_sql="select khxm,fwdz";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where khbh='"+wherekhbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ykhxm=rs.getString("khxm");
			yfwdz=rs.getString("fwdz");
		}
		rs.close();
		ps.close();
		if (!ykhxm.equals(khxm))
		{
			out.println("<P>错误！该客户已签：家装或集成的订单，不能再修改【姓名】");
			return;
		}
		if (!yfwdz.equals(fwdz))
		{
			out.println("<P>错误！该客户已签：家装或集成的订单，不能再修改【房屋地址】");
			return;
		}
	}
	//检查是否允许修改：【姓名】、【房屋地址】－－－－－－－－－－－－－－－－－－－－－－－－

	
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

	conn.setAutoCommit(false);

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

	ls_sql="update crm_zxkhxx set khxm=?,xb=?,fwdz=?,lxfs=?,fwlxbm=?,hxbm=?,fwmj=?,fgyqbm=?,zxysbm=?,sfxhf=?,hfrq=?,hdbz=?,khlxbm=?,bz=?,cqbm=?        ,cgdz=?,yzxxbz=?,xqbm=?,nlqjbm=?,zybm=?,fj=?,yjzxsj=?,ywy=?   ,jhjfsj=?,hdr=?,hdsfss=?,jzbz=?,rddqbm=?,hxwzbm=?,ysrbm=?,louhao=?,cxhdbm=?,cxhdbmxq=?,cxhdbmzh=?";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  and zxzt not in('3','4')";
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
	ps.setString(23,ywy);

	ps.setDate(24,jhjfsj);
	ps.setString(25,hdr);
	ps.setString(26,hdsfss);
	ps.setString(27,jzbz);
	ps.setString(28,rddqbm);
	ps.setString(29,hxwzbm);
	ps.setString(30,ysrbm);
	ps.setString(31,louhao);
	ps.setString(32,cxhdbm);
	ps.setString(33,cxhdbmxq);
	ps.setString(34,cxhdbmzh);

	ps.executeUpdate();
	ps.close();

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