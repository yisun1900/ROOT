<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String clbm=null;
String clmc=null;
String clgg=null;
String lrjsfs=null;
String lrbfb=null;
String bz=null;
String jldwmc=null;
String qybfb=null;
String jgdwbh=null;
String cldlmc=null;
double bfb=0;
clbm=cf.GB2Uni(request.getParameter("clbm"));
clmc=cf.GB2Uni(request.getParameter("clmc"));
clgg=cf.GB2Uni(request.getParameter("clgg"));
lrjsfs=cf.GB2Uni(request.getParameter("lrjsfs"));
lrbfb=cf.GB2Uni(request.getParameter("lrbfb"));
bz=cf.GB2Uni(request.getParameter("bz"));
jldwmc=cf.GB2Uni(request.getParameter("jldwmc"));
qybfb=cf.GB2Uni(request.getParameter("qybfb"));
cldlmc=cf.GB2Uni(request.getParameter("cldlmc"));
if (lrjsfs.equals("2"))
{
	try
		{
		bfb = Double.parseDouble(lrbfb);
		}
	catch(Exception e){
		out.print("[利润百分比]数字格式不正确，请您确认");
		return;
		}
}

String lrr=cf.GB2Uni(request.getParameter("lrr"));
java.sql.Date lrsj=null;
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
String wxr=cf.GB2Uni(request.getParameter("wxr"));
String lx=cf.GB2Uni(request.getParameter("lx"));
String paixu=cf.GB2Uni(request.getParameter("paixu"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  cl_clbm";
	ls_sql+=" where clbm='"+clbm+"'";
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
		out.println("错误！[材料编码]已经被使用!");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="insert into cl_clbm ( clbm,clmc,clgg,jldwmc,lrjsfs,lrbfb,cldlmc,bz,lrr,lrsj,wxr,lx,paixu ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clbm);
	ps.setString(2,clmc);
	ps.setString(3,clgg);
	ps.setString(4,jldwmc);
	ps.setString(5,lrjsfs);
	ps.setDouble(6,bfb);
	ps.setString(7,cldlmc);
	ps.setString(8,bz);
	ps.setString(9,lrr);
	ps.setDate(10,lrsj);
	ps.setString(11,wxr);
	ps.setString(12,lx);
	ps.setString(13,paixu);
	ps.executeUpdate();
	ps.close();

	//初始化材料价格明细（cl_jgmx）
	ls_sql="select dwbh ";
	ls_sql+=" from sq_dwxx ";
	ls_sql+=" where dwlx='F0' and cxbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jgdwbh=rs.getString(1);

		sql=" insert into cl_jgmx ( clbm,dwbh,cj,cjjsj,fgsdj,gdj,ckmc,sfrk,tzr,tzsj,sfycx,BJJBBM ) ";
		sql+=" values ( ?,?,0,0,0,0,'请录入供应商','Y',?,?,'N','0' ) ";
		ps1= conn.prepareStatement(sql);
		ps1.setString(1,clbm);
		ps1.setString(2,jgdwbh);
		ps1.setString(3,lrr);
		ps1.setDate(4,lrsj);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
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
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>