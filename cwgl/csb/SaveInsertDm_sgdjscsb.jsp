<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String fgsbh=null;
long bfcs=0;
String bfjs=null;
double bfbl=0;
double sdlbfbl=0;
String kzbjjs=null;
String sfwgjs=null;
String sdljsfs=null;
String sfkclk=null;
String sfkgdyp=null;
String sfkyfgf=null;
String sfkzbj=null;
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
ls=request.getParameter("bfcs");
try{
	if (!(ls.equals("")))  bfcs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bfcs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[拨付次数]类型转换发生意外:"+e);
	return;
}
bfjs=cf.GB2Uni(request.getParameter("bfjs"));
ls=request.getParameter("bfbl");
try{
	if (!(ls.equals("")))  bfbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[bfbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[拨付比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sdlbfbl");
try{
	if (!(ls.equals("")))  sdlbfbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sdlbfbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[水电路拨付比例]类型转换发生意外:"+e);
	return;
}
kzbjjs=cf.GB2Uni(request.getParameter("kzbjjs"));
sfwgjs=cf.GB2Uni(request.getParameter("sfwgjs"));
sdljsfs=cf.GB2Uni(request.getParameter("sdljsfs"));
sfkclk=cf.GB2Uni(request.getParameter("sfkclk"));
sfkgdyp=cf.GB2Uni(request.getParameter("sfkgdyp"));
sfkyfgf=cf.GB2Uni(request.getParameter("sfkyfgf"));
sfkzbj=cf.GB2Uni(request.getParameter("sfkzbj"));

double kzbjbl=0;
ls=request.getParameter("kzbjbl");
try{
	if (!(ls.equals("")))  kzbjbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[kzbjbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣质保金比例]类型转换发生意外:"+e);
	return;
}

double zxxs=0;
ls=request.getParameter("zxxs");
try{
	if (!(ls.equals("")))  zxxs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zxxs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增项系数]类型转换发生意外:"+e);
	return;
}

double jxxs=0;
ls=request.getParameter("jxxs");
try{
	if (!(ls.equals("")))  jxxs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jxxs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[减项系数]类型转换发生意外:"+e);
	return;
}

double lkhjbfb=0;
ls=request.getParameter("lkhjbfb");
try{
	if (!(ls.equals("")))  lkhjbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lkhjbfb]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[最大领款合计百分比]类型转换发生意外:"+e);
	return;
}

String sgdjbxg=cf.GB2Uni(request.getParameter("sgdjbxg"));
String zjxjffs=cf.GB2Uni(request.getParameter("zjxjffs"));
double ljzjxxs=0;
ls=request.getParameter("ljzjxxs");
try{
	if (!(ls.equals("")))  ljzjxxs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ljzjxxs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[累计增减项系数]类型转换发生意外:"+e);
	return;
}
String sfkyqpc=cf.GB2Uni(request.getParameter("sfkyqpc"));
String sfkclfk=cf.GB2Uni(request.getParameter("sfkclfk"));
String sfkclyf=cf.GB2Uni(request.getParameter("sfkclyf"));
String sfkzckk=cf.GB2Uni(request.getParameter("sfkzckk"));
String sfkfkje=cf.GB2Uni(request.getParameter("sfkfkje"));
String sfjjlje=cf.GB2Uni(request.getParameter("sfjjlje"));
String sfjqtje=cf.GB2Uni(request.getParameter("sfjqtje"));
String zjxbhfw=cf.GB2Uni(request.getParameter("zjxbhfw"));
String zjxsjd=cf.GB2Uni(request.getParameter("zjxsjd"));

String sdlqz=cf.GB2Uni(request.getParameter("sdlqz"));
String sfjzcjl=cf.GB2Uni(request.getParameter("sfjzcjl"));
String zcsfjs=cf.GB2Uni(request.getParameter("zcsfjs"));
String zcjehqfs=cf.GB2Uni(request.getParameter("zcjehqfs"));
String zcjsblkg=cf.GB2Uni(request.getParameter("zcjsblkg"));
double zcjsbl=0;
ls=request.getParameter("zcjsbl");
try{
	if (!(ls.equals("")))  zcjsbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zcjsbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[主材结算比例]类型转换发生意外:"+e);
	return;
}

double fkbl=0;
ls=request.getParameter("fkbl");
try{
	if (!(ls.equals("")))  fkbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[fkbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[要求付款比例]类型转换发生意外:"+e);
	return;
}
String sksh=cf.GB2Uni(request.getParameter("sksh"));
String[] gcjdbm=request.getParameterValues("gcjdbm");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="delete from dm_yqgcjd ";
	ls_sql+=" where fgsbh='"+fgsbh+"' and bfcs="+bfcs;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	String gcjdmc="";
	for (int i=0;i<gcjdbm.length ;i++ )
	{
		ls_sql="select gcjdmc";
		ls_sql+=" from  dm_gcjdbm";
		ls_sql+=" where gcjdbm='"+gcjdbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			gcjdmc+=cf.fillNull(rs.getString("gcjdmc"))+"、";
		}
		rs.close();
		ps.close();

		ls_sql="insert into dm_yqgcjd ( fgsbh,bfcs,gcjdbm) ";
		ls_sql+=" values ( ?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,fgsbh);
		ps.setLong(2,bfcs);
		ps.setString(3,gcjdbm[i]);
		ps.executeUpdate();
		ps.close();
	}

	ls_sql="insert into dm_sgdjscsb ( fgsbh,bfcs,bfjs,bfbl,sdlbfbl,kzbjjs,sfwgjs,sdljsfs,sfkclk,sfkgdyp,sfkyfgf,sfkzbj,sgdjbxg,kzbjbl,zxxs,jxxs,lkhjbfb,zjxjffs,ljzjxxs,sfkyqpc,sfkclfk,sfkclyf,sfkzckk,sfkfkje,sfjjlje,sfjqtje,zjxbhfw,zjxsjd ,sdlqz,sfjzcjl,zcsfjs,zcjehqfs,zcjsblkg,zcjsbl,fkbl,sksh,gcjdmc) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setLong(2,bfcs);
	ps.setString(3,bfjs);
	ps.setDouble(4,bfbl);
	ps.setDouble(5,sdlbfbl);
	ps.setString(6,kzbjjs);
	ps.setString(7,sfwgjs);
	ps.setString(8,sdljsfs);
	ps.setString(9,sfkclk);
	ps.setString(10,sfkgdyp);
	ps.setString(11,sfkyfgf);
	ps.setString(12,sfkzbj);
	ps.setString(13,sgdjbxg);
	ps.setDouble(14,kzbjbl);
	ps.setDouble(15,zxxs);
	ps.setDouble(16,jxxs);
	ps.setDouble(17,lkhjbfb);
	ps.setString(18,zjxjffs);
	ps.setDouble(19,ljzjxxs);
	ps.setString(20,sfkyqpc);
	ps.setString(21,sfkclfk);
	ps.setString(22,sfkclyf);
	ps.setString(23,sfkzckk);
	ps.setString(24,sfkfkje);
	ps.setString(25,sfjjlje);
	ps.setString(26,sfjqtje);
	ps.setString(27,zjxbhfw);
	ps.setString(28,zjxsjd);

	ps.setString(29,sdlqz);
	ps.setString(30,sfjzcjl);
	ps.setString(31,zcsfjs);
	ps.setString(32,zcjehqfs);
	ps.setString(33,zcjsblkg);
	ps.setDouble(34,zcjsbl);
	ps.setDouble(35,fkbl);
	ps.setString(36,sksh);
	ps.setString(37,gcjdmc);
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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