<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");

String ls=null;
String dqbm=null;
String bjjbbm=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;

double bj=0;
double sgcbj=0;
double cbenj=0;

String gycl=cf.GB2Uni(request.getParameter("gycl"));


dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
xmmc=cf.GB2Uni(request.getParameter("xmmc"));
xmdlbm=cf.GB2Uni(request.getParameter("xmdlbm"));
xmxlbm=cf.GB2Uni(request.getParameter("xmxlbm"));
smbm=cf.GB2Uni(request.getParameter("smbm"));
jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));


ls=request.getParameter("bj");
try{
	if (!(ls.equals("")))  bj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程预算价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sgcbj");
try{
	if (!(ls.equals("")))  sgcbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sgcbj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[施工成本价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cbenj");
try{
	if (!(ls.equals("")))  cbenj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cbenj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[成本价]类型转换发生意外:"+e);
	return;
}

java.sql.Date zdyxmyxq=null;
ls=request.getParameter("zdyxmyxq");
try{
	if (!(ls.equals("")))  zdyxmyxq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zdyxmyxq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[自定义项目有效期]类型转换发生意外:"+e);
	return;
}

String flmcgg=cf.GB2Uni(request.getParameter("flmcgg"));
String bz=cf.GB2Uni(request.getParameter("bz"));
String sfxycl=cf.GB2Uni(request.getParameter("sfxycl"));
String sfxyyjd=cf.GB2Uni(request.getParameter("sfxyyjd"));


String xmflbm=cf.GB2Uni(request.getParameter("xmflbm"));


String shr=cf.GB2Uni(request.getParameter("shr"));
java.sql.Date shsj=null;
ls=request.getParameter("shsj");
try{
	if (!(ls.equals("")))  shsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[shsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审核时间]类型转换发生意外:"+e);
	return;
}
String shbz=cf.GB2Uni(request.getParameter("shbz"));
String sfbxg=cf.GB2Uni(request.getParameter("sfbxg"));
String shyj=cf.GB2Uni(request.getParameter("shyj"));


String yxmmc=cf.GB2Uni(request.getParameter("yxmmc"));
String ybj=cf.GB2Uni(request.getParameter("ybj"));
String ygycl=cf.GB2Uni(request.getParameter("ygycl"));

String sqjl=request.getParameter("sqjl");
String xmbh=request.getParameter("xmbh");
String lrr=cf.GB2Uni(request.getParameter("lrr"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	double gcjcbjxs=0;//工程基础报价系数
	double sgcbbjxs=0;//施工成本报价系数 
	double cbbfb=0;//自定义项成本百分比 
	double clfbfb=0;//自定义项材料费百分比 
	ls_sql="select gcjcbjxs,sgcbbjxs,cbbfb,clfbfb";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dqbm='"+dqbm+"' and dwlx in('F0')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gcjcbjxs=rs.getDouble("gcjcbjxs");
		sgcbbjxs=rs.getDouble("sgcbbjxs");
		cbbfb=rs.getDouble("cbbfb");
		clfbfb=rs.getDouble("clfbfb");
	}
	rs.close();
	ps.close();

	if (gcjcbjxs==0)
	{
		out.println("错误！【工程基础报价系数】未初始化");
		return;
	}
	if (sgcbbjxs==0)
	{
		out.println("错误！【施工成本报价系数】未初始化");
		return;
	}

	double sgdbj=bj/gcjcbjxs;
	double clcb=bj*clfbfb/100;

	conn.setAutoCommit(false);

	ls_sql="update bj_zdyxmb set xmmc=?,xmdlbm=?,xmxlbm=?,smbm=?,jldwbm=? ,bj=?,gycl=?,zdyxmyxq=?,flmcgg=?,bz=?,sfxycl=?,sfxyyjd=?,xmflbm=?,shbz=?,sgcbj=?,sgdbj=?,cbenj=?,clcb=?";
	ls_sql+=" where lrr='"+lrr+"' and xmbh='"+xmbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xmmc);
	ps.setString(2,xmdlbm);
	ps.setString(3,xmxlbm);
	ps.setString(4,smbm);
	ps.setString(5,jldwbm);

	ps.setDouble(6,bj);
	ps.setString(7,gycl);
	ps.setDate(8,zdyxmyxq);
	ps.setString(9,flmcgg);
	ps.setString(10,bz);
	ps.setString(11,sfxycl);
	ps.setString(12,sfxyyjd);
	ps.setString(13,xmflbm);
	ps.setString(14,shbz);
	ps.setDouble(15,sgcbj);
	ps.setDouble(16,sgdbj);
	ps.setDouble(17,cbenj);
	ps.setDouble(18,clcb);

	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_zdyshjl set shbz=?,sfbxg=?,shr=?,shsj=SYSDATE,shyj=?,yxmmc=?,ybj=?,ygycl=?  ";
	ls_sql+=" where sqjl="+sqjl;
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shbz);
	ps.setString(2,sfbxg);
	ps.setString(3,shr);
	ps.setString(4,shyj);
	ps.setString(5,yxmmc);
	ps.setString(6,ybj);
	ps.setString(7,ygycl);
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