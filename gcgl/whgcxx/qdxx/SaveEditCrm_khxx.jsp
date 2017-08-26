<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String ls=null;
String hxbm=null;
String fgflbm=null;
String hxmjbm=null;
String ysbm=null;
long fwmj=0;

 java.sql.Date qyrq=null;
java.sql.Date kgrq=null;
java.sql.Date jgrq=null;
String hdbz=null;
String khlxbm=null;
String bz=null;

String cgdz=null;
String hdr=null;
cgdz=cf.GB2Uni(request.getParameter("cgdz"));
hdr=cf.GB2Uni(request.getParameter("hdr"));

String nlqjbm=request.getParameter("nlqjbm");
String ysrbm=cf.GB2Uni(request.getParameter("ysrbm"));
String qyxh=cf.GB2Uni(request.getParameter("qyxh"));
String[] xxlybm=request.getParameterValues("xxlybm");
hxbm=cf.GB2Uni(request.getParameter("hxbm"));
fgflbm=cf.GB2Uni(request.getParameter("fgflbm"));
ysbm=cf.GB2Uni(request.getParameter("ysbm"));
ls=request.getParameter("fwmj");
try{
	if (!(ls.equals("")))  fwmj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fwmj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[房屋面积]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("qyrq");
try{
	if (!(ls.equals("")))  qyrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qyrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签约日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kgrq");
try{
	if (!(ls.equals("")))  kgrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kgrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[应开工日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jgrq");
try{
	if (!(ls.equals("")))  jgrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jgrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[应竣工日期]类型转换发生意外:"+e);
	return;
}
hdbz=cf.GB2Uni(request.getParameter("hdbz"));
khlxbm=cf.GB2Uni(request.getParameter("khlxbm"));
bz=cf.GB2Uni(request.getParameter("bz"));

String zybm=request.getParameter("zybm");
String czbm=request.getParameter("czbm");
String fjfwbm=cf.GB2Uni(request.getParameter("fjfwbm"));

String sffj=cf.GB2Uni(request.getParameter("sffj"));
double fjje=0;
double gsfje=0;
ls=request.getParameter("fjje");
try{
	if (!(ls.equals("")))  fjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fjje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[返卷总金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gsfje");
try{
	if (!(ls.equals("")))  gsfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gsfje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[公司承担返卷额]类型转换发生意外:"+e);
	return;
}
String sfyrz=cf.GB2Uni(request.getParameter("sfyrz"));

java.sql.Date jyjdrq=null;
ls=request.getParameter("jyjdrq");
try{
	if (!(ls.equals("")))  jyjdrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jyjdrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[建议交底日期]类型转换发生意外:"+e);
	return;
}


String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String kgsjqd=cf.GB2Uni(request.getParameter("kgsjqd"));

String rzsc=cf.GB2Uni(request.getParameter("rzsc"));

int gqts=0;
ls=request.getParameter("gqts");
try{
	if (!(ls.equals("")))  gqts=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gqts不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工期天数]类型转换发生意外:"+e);
	return;
}

String hdsgd=cf.GB2Uni(request.getParameter("hdsgd"));
String hdsgbz=cf.GB2Uni(request.getParameter("hdsgbz"));
String xxlysm=cf.GB2Uni(request.getParameter("xxlysm"));
String fkfabm=request.getParameter("fkfabm");

String hdsfss=null;
if (!hdbz.equals("1"))
{
	hdsfss="0";
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String xgjlh=null;
	int count=0;
	ls_sql="select NVL(max(substr(xgjlh,8,2)),0)";
	ls_sql+=" from  crm_khxxxgjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	ps.close();
	rs.close();
	
	xgjlh=khbh+cf.addZero(count+1,2);

	ls_sql="select hxmjbm";
	ls_sql+=" from  dm_hxmjbm";
	ls_sql+=" where  qd<"+fwmj+" and "+fwmj+"<=zd";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hxmjbm=rs.getString("hxmjbm");
	}
	rs.close();
	ps.close();



	conn.setAutoCommit(false);

	ls_sql="delete from cw_khfkfa  ";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into cw_khfkfa(khbh,fkfabm)";
	ls_sql+=" values(?,?)";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,fkfabm);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_zxkhxx set qdsj=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,qyrq);
	ps.executeUpdate();
	ps.close();


	ls_sql="delete from crm_khxxly ";
	ls_sql+=" where khbh='"+khbh+"' ";
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


	ls_sql="update crm_khxx set hxbm=?,fgflbm=?,ysbm=?,hxmjbm=?,fwmj=?,pmjj=qye/?,qyrq=?,kgrq=?,hdbz=?,khlxbm=?";
	ls_sql+=" ,bz=?,jgrq=?,cgdz=?,hdr=?,hdsfss=?,nlqjbm=?,zybm=?,fjfwbm=?,czbm=?,sffj=?";
	ls_sql+=" ,sfyrz=?,jyjdrq=?,fjje=? ,gsfje=? ,kgsjqd=?,ysrbm=?,rzsc=? ,gqts=?,hdsgd=?,hdsgbz=? ";
	ls_sql+=" ,xxlysm=? ";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hxbm);
	ps.setString(2,fgflbm);
	ps.setString(3,ysbm);
	ps.setString(4,hxmjbm);
	ps.setLong(5,fwmj);
	ps.setLong(6,fwmj);
	ps.setDate(7,qyrq);
	ps.setDate(8,kgrq);
	ps.setString(9,hdbz);
	ps.setString(10,khlxbm);

	ps.setString(11,bz);
	ps.setDate(12,jgrq);
	ps.setString(13,cgdz);
	ps.setString(14,hdr);
	ps.setString(15,hdsfss);
	ps.setString(16,nlqjbm);
	ps.setString(17,zybm);
	ps.setString(18,fjfwbm);
	ps.setString(19,czbm);
	ps.setString(20,sffj);

	ps.setString(21,sfyrz);
	ps.setDate(22,jyjdrq);
	ps.setDouble(23,fjje);
	ps.setDouble(24,gsfje);
	ps.setString(25,kgsjqd);
	ps.setString(26,ysrbm);
	ps.setString(27,rzsc);
	ps.setInt(28,gqts);
	ps.setString(29,hdsgd);
	ps.setString(30,hdsgbz);

	ps.setString(31,xxlysm);


	ps.executeUpdate();
	ps.close();


	ls_sql="update crm_zxkhxx set hxbm=?,ysrbm=? ,xxlysm=? ,fwmj=? ,hdbz=?,khlxbm=?,cgdz=?,hdr=?,hdsfss=?,nlqjbm=?";
	ls_sql+=" ,zybm=?,fjfwbm=? ";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hxbm);
	ps.setString(2,ysrbm);
 	ps.setString(3,xxlysm);
	ps.setLong(4,fwmj);
	ps.setString(5,hdbz);
	ps.setString(6,khlxbm);
	ps.setString(7,cgdz);
	ps.setString(8,hdr);
	ps.setString(9,hdsfss);
	ps.setString(10,nlqjbm);
	ps.setString(11,zybm);
	ps.setString(12,fjfwbm);




	ps.executeUpdate();
	ps.close();

	ls_sql ="insert into crm_khxxxgjl (xgjlh,khbh,xgqnr,xghnr,czlx,lrr,lrsj,lrbm) ";
	ls_sql+=" values(?,?,?,?,?,?,SYSDATE,?)";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xgjlh);
	ps.setString(2,khbh);
	ps.setString(3,"");
	ps.setString(4,sfyrz+";"+rzsc+";"+sffj+";"+fjje+";"+gsfje+";"+qyrq+";"+jyjdrq+";"+kgrq+";"+jgrq);
	ps.setString(5,"修改签单基本信息");
	ps.setString(6,yhmc);
	ps.setString(7,lrbm);
	ps.executeUpdate();
	ps.close();



	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	parent.window.close();
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