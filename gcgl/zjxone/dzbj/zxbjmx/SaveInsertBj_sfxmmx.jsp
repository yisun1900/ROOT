<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String khbh=null;
String sfxmbm=null;
String bz=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
sfxmbm=cf.GB2Uni(request.getParameter("sfxmbm"));
double zqsfje=0;
ls=request.getParameter("zqsfje");
try{
	if (!(ls.equals("")))  zqsfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zqsfje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收费金额]类型转换发生意外:"+e);
	return;
}
double dj=0;
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单价]类型转换发生意外:"+e);
	return;
}
double sl=0;
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[数量]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String jldw=cf.GB2Uni(request.getParameter("jldw"));
String zjxxh=request.getParameter("zjxxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String dqbm=cf.executeQuery("select sq_dwxx.dqbm from crm_zxkhxx,sq_dwxx where crm_zxkhxx.zxdm=sq_dwxx.dwbh and crm_zxkhxx.khbh='"+khbh+"'");
if (dqbm==null || dqbm.equals(""))
{
	out.println("错误！无地区编码");
	return;
}

try {
	conn=cf.getConnection();

	String sfwc="";
	ls_sql="select sfwc";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N：未完成；Y：完成
	{
		out.println("错误！增减项已完成，不能再修改");
		return;
	}

	String sflx=null;
	String sfbxx=null;
	String sfjrqye=null;
	String jrsjbz=null;
	String jrglfbz=null;
	String sfxmmc=null;
	double sfbfb=0;
	String sfkdz=null;
	double zdzk=0;
	String sfxmlx=null;
	String sfcysgdjs=null;
	ls_sql="select sflx,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfxmmc,sfkdz,zdzk,sfxmlx,sfcysgdjs";
	ls_sql+=" from  bdm_sfxmbm";
	ls_sql+=" where  dqbm='"+dqbm+"' and sfxmbm='"+sfxmbm+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sflx=rs.getString("sflx");
		sfbxx=rs.getString("sfbxx");
		sfjrqye=rs.getString("sfjrqye");
		jrsjbz=rs.getString("jrsjbz");
		jrglfbz=rs.getString("jrglfbz");
		sfxmmc=rs.getString("sfxmmc");
		sfkdz=rs.getString("sfkdz");
		zdzk=rs.getDouble("zdzk");
		sfxmlx=rs.getString("sfxmlx");
		sfcysgdjs=rs.getString("sfcysgdjs");
	}
	rs.close();
	ps.close();

	double spdxzkl=10;
	ls_sql="select spdxzkl";
	ls_sql+=" from  crm_dxdzyh,crm_dzyhsq";
	ls_sql+=" where crm_dxdzyh.khbh=crm_dzyhsq.khbh and crm_dxdzyh.khbh='"+khbh+"' and sfxmbm='"+sfxmbm+"' and spbz='2'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		spdxzkl=rs.getDouble("spdxzkl");
	}
	rs.close();
	ps.close();

	double qdhdzk=10;
	double glfzk=10;
	ls_sql="select qdhdzk,glfzk";
	ls_sql+=" from  crm_cxhdzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qdhdzk=rs.getDouble("qdhdzk");
		glfzk=rs.getDouble("glfzk");
	}
	rs.close();
	ps.close();
	double cxhdzkl=10;
	if (sflx.equals("5"))//5：管理费
	{
		cxhdzkl=glfzk;
	}
	else if (sflx.equals("3"))//3：税金
	{
		cxhdzkl=10;
	}
	else 
	{
		cxhdzkl=qdhdzk;
	}

	ls_sql="insert into bj_sfxmmxh (khbh,sfxmbm,sfxmmc,sflx,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfbfb,zqsfje   ,dxzkl,cxhdzkl,sfje,bz,sfkdz,zdzk,sfxmlx,sfcysgdjs,dj,jldw,sl,zjxxh) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,sfxmbm);
	ps.setString(3,sfxmmc);
	ps.setString(4,sflx);
	ps.setString(5,sfbxx);
	ps.setString(6,sfjrqye);
	ps.setString(7,jrsjbz);
	ps.setString(8,jrglfbz);
	ps.setDouble(9,sfbfb);
	ps.setDouble(10,zqsfje);

	ps.setDouble(11,spdxzkl);
	ps.setDouble(12,cxhdzkl);
	ps.setDouble(13,zqsfje*cxhdzkl/10.0*spdxzkl/10.0);
	ps.setString(14,bz);
	ps.setString(15,sfkdz);
	ps.setDouble(16,zdzk);
	ps.setString(17,sfxmlx);
	ps.setString(18,sfcysgdjs);
	ps.setDouble(19,dj);
	ps.setString(20,jldw);
	ps.setDouble(21,sl);
	ps.setString(22,zjxxh);
	ps.executeUpdate();
	ps.close();


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
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
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