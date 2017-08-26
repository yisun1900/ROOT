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
String sjs=null;
double qye=0;
double wdzgce=0;
double sjf=0;
java.sql.Date qyrq=null;
String khlxbm=null;
String bz=null;


String[] xxlybm=request.getParameterValues("xxlybm");
khxm=cf.GB2Uni(request.getParameter("khxm"));
xb=cf.GB2Uni(request.getParameter("xb"));
fwdz=cf.GB2Uni(request.getParameter("fwdz"));
lxfs=cf.GB2Uni(request.getParameter("lxfs"));

sjs=cf.GB2Uni(request.getParameter("sjs"));
ls=request.getParameter("qye");
try{
	if (!(ls.equals("")))  qye=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qye不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签约额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wdzgce");
try{
	if (!(ls.equals("")))  wdzgce=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wdzgce不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[未打折工程额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjf");
try{
	if (!(ls.equals("")))  sjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计费]类型转换发生意外:"+e);
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
khlxbm=cf.GB2Uni(request.getParameter("khlxbm"));
bz=cf.GB2Uni(request.getParameter("bz"));



String ywy=cf.GB2Uni(request.getParameter("ywy"));
String jzbz=cf.GB2Uni(request.getParameter("jzbz"));
String sjsbh=cf.GB2Uni(request.getParameter("sjsbh"));

//折扣率
double zkl=0;
ls=request.getParameter("zkl");
try{
	if (!(ls.equals("")))  zkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折扣率]类型转换发生意外:"+e);
	return;
}

String sfzhm=cf.GB2Uni(request.getParameter("sfzhm"));
String zt=cf.GB2Uni(request.getParameter("zt"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String cqbm=cf.GB2Uni(request.getParameter("cqbm"));
String xqbm=cf.GB2Uni(request.getParameter("xqbm"));
String louhao=cf.GB2Uni(request.getParameter("louhao"));
String qtdh=cf.GB2Uni(request.getParameter("qtdh"));
String email=cf.GB2Uni(request.getParameter("email"));

String smhtbh=cf.GB2Uni(request.getParameter("smhtbh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	ls_sql="update crm_zxkhxx set khxm=?,xb=?,fwdz=?,lxfs=?,qtdh=?,email=?,cqbm=?,xqbm=?,louhao=?";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khxm);
	ps.setString(2,xb);
	ps.setString(3,fwdz);
	ps.setString(4,lxfs);
	ps.setString(5,qtdh);
	ps.setString(6,email);
	ps.setString(7,cqbm);
	ps.setString(8,xqbm);
	ps.setString(9,louhao);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_khxxly ";
	ls_sql+=" where  khlx='1' and khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<xxlybm.length ;i++ )
	{
		ls_sql="insert into crm_khxxly ( khbh,xxlybm,khlx)";
		ls_sql+=" values ( ?,?,'1')";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,xxlybm[i]);
		ps.executeUpdate();
		ps.close();
	}


	ls_sql="update crm_khxx set khxm=?,xb=?,fwdz=?,lxfs=?,qtdh=?,email=?,sfzhm=?   ,zkl=?,wdzgce=?,qye=?,sjf=?,qyrq=?,sjsbh=?,khlxbm=?,jzbz=?,zt=?,bz=?,cqbm=?,xqbm=?,louhao=?,smhtbh=? ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khxm);
	ps.setString(2,xb);
	ps.setString(3,fwdz);
	ps.setString(4,lxfs);
	ps.setString(5,qtdh);
	ps.setString(6,email);
	ps.setString(7,sfzhm);

	ps.setDouble(8,zkl);
	ps.setDouble(9,wdzgce);
	ps.setDouble(10,qye);
	ps.setDouble(11,sjf);

	ps.setDate(12,qyrq);
	ps.setString(13,sjsbh);
	ps.setString(14,khlxbm);
	ps.setString(15,jzbz);
	ps.setString(16,zt);
	ps.setString(17,bz);
	ps.setString(18,cqbm);
	ps.setString(19,xqbm);
	ps.setString(20,louhao);
	ps.setString(21,smhtbh);
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