<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xmbm=null;
String xmdlbm=null;
String xmxlbm=null;
String wgjbbm=null;
String xzzwbm=null;
long ygbh=0;
int ygkf=0;
double ygfkje=0;
String zgyq=null;
int sgdkf=0;
double sgdfkje=0;
int wzcs=0;
String bz=null;

xmbm=cf.GB2Uni(request.getParameter("xmbm"));
xmdlbm=cf.GB2Uni(request.getParameter("xmdlbm"));
xmxlbm=cf.GB2Uni(request.getParameter("xmxlbm"));
wgjbbm=cf.GB2Uni(request.getParameter("wgjbbm"));
xzzwbm=cf.GB2Uni(request.getParameter("xzzwbm"));
ls=request.getParameter("ygbh");
try{
	if (!(ls.equals("")))  ygbh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ygbh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[处罚人员编号]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("ygkf");
try{
	if (!(ls.equals("")))  ygkf=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ygkf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[员工扣分]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ygfkje");
try{
	if (!(ls.equals("")))  ygfkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ygfkje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[员工罚款金额]类型转换发生意外:"+e);
	return;
}
zgyq=cf.GB2Uni(request.getParameter("zgyq"));
ls=request.getParameter("sgdkf");
try{
	if (!(ls.equals("")))  sgdkf=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sgdkf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[施工队扣分]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sgdfkje");
try{
	if (!(ls.equals("")))  sgdfkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sgdfkje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[施工队罚款金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wzcs");
try{
	if (!(ls.equals("")))  wzcs=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wzcs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[违章次数]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));

String jcjlh=request.getParameter("jcjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String cfspbz=null;
	ls_sql="select cfspbz";
	ls_sql+=" from  gdm_gdjcjl";
	ls_sql+=" where jcjlh='"+jcjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cfspbz=rs.getString("cfspbz");
	}
	rs.close();
	ps.close();
	if (!cfspbz.equals("1") && !cfspbz.equals("2"))//1：不需审批；2：未审批；3：审批通过；4：审批未通过
	{
		out.println("存盘失败！该施工队检查记录已审批");
		return;
	}


	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  gdm_jcjlmx";
	ls_sql+=" where jcjlh='"+jcjlh+"' and xmbm='"+xmbm+"' ";
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
		out.println("存盘失败！该项目已录入");
		return;
	}

	String xmmc=null;
	ls_sql="select xmmc";
	ls_sql+=" from  gdm_gcxm";
	ls_sql+=" where xmbm='"+xmbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xmmc=rs.getString("xmmc");
	}
	rs.close();
	ps.close();

	String xmdlmc=null;
	ls_sql="select xmdlmc";
	ls_sql+=" from  gdm_xmdlbm";
	ls_sql+=" where xmdlbm='"+xmdlbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xmdlmc=rs.getString("xmdlmc");
	}
	rs.close();
	ps.close();

	String xmxlmc=null;
	ls_sql="select xmxlmc";
	ls_sql+=" from  gdm_xmxlbm";
	ls_sql+=" where xmxlbm='"+xmxlbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xmxlmc=rs.getString("xmxlmc");
	}
	rs.close();
	ps.close();

	String wgjbmc=null;
	ls_sql="select wgjbmc";
	ls_sql+=" from  gdm_wgjbbm";
	ls_sql+=" where wgjbbm='"+wgjbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wgjbmc=rs.getString("wgjbmc");
	}
	rs.close();
	ps.close();

	String yhmc=null;
	String dwbh=null;
	ls_sql="select yhmc,dwbh";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where ygbh='"+ygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yhmc=rs.getString("yhmc");
		dwbh=rs.getString("dwbh");
	}
	rs.close();
	ps.close();

	
	conn.setAutoCommit(false);

	ls_sql="insert into gdm_jcjlmx ( jcjlh,xmbm,xmmc,xmdlbm,xmdlmc,xmxlbm,xmxlmc,wgjbbm,wgjbmc,xzzwbm,dwbh,ygbh,yhmc,ygkf,ygfkje,zgyq,sgdkf,sgdfkje,wzcs,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jcjlh);
	ps.setString(2,xmbm);
	ps.setString(3,xmmc);
	ps.setString(4,xmdlbm);
	ps.setString(5,xmdlmc);
	ps.setString(6,xmxlbm);
	ps.setString(7,xmxlmc);
	ps.setString(8,wgjbbm);
	ps.setString(9,wgjbmc);
	ps.setString(10,xzzwbm);
	ps.setString(11,dwbh);
	ps.setLong(12,ygbh);
	ps.setString(13,yhmc);
	ps.setInt(14,ygkf);
	ps.setDouble(15,ygfkje);
	ps.setString(16,zgyq);
	ps.setInt(17,sgdkf);
	ps.setDouble(18,sgdfkje);
	ps.setInt(19,wzcs);
	ps.setString(20,bz);
	ps.executeUpdate();
	ps.close();

	int allkf=0;
	double allfk=0;
	ls_sql="select sum((ygkf+sgdkf)*wzcs),sum((ygfkje+sgdfkje)*wzcs)";
	ls_sql+=" from  gdm_jcjlmx";
	ls_sql+=" where jcjlh='"+jcjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allkf=rs.getInt(1);
		allfk=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	if (allkf>0 || allfk>0)
	{
		cfspbz="2";//1：不需审批；2：未审批；3：审批通过；4：审批未通过
	}
	else{
		cfspbz="1";
	}

	ls_sql="update gdm_gdjcjl set fkze="+allfk+",kfzs="+allkf+",cfspbz='"+cfspbz+"'";
	ls_sql+=" where  jcjlh='"+jcjlh+"'";
	ps= conn.prepareStatement(ls_sql);
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