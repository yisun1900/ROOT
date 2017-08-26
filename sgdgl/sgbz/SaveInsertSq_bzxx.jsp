<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String bzmc=null;
String sgd=null;
String xb=null;
String dh=null;
String zz=null;
String sfzh=null;
String bz=null;
bzmc=cf.GB2Uni(request.getParameter("bzmc"));
sgd=cf.GB2Uni(request.getParameter("sgd"));
xb=cf.GB2Uni(request.getParameter("xb"));
dh=cf.GB2Uni(request.getParameter("dh"));
zz=cf.GB2Uni(request.getParameter("zz"));
sfzh=cf.GB2Uni(request.getParameter("sfzh"));
bz=cf.GB2Uni(request.getParameter("bz"));

String sgdjbbm=cf.GB2Uni(request.getParameter("sgdjbbm"));
int grsl=0;
ls=request.getParameter("grsl");
try{
	if (!(ls.equals("")))  grsl=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量grsl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工人数量]类型转换发生意外:"+e);
	return;
}
int yygrsl=0;
ls=request.getParameter("yygrsl");
try{
	if (!(ls.equals("")))  yygrsl=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yygrsl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[已用工人数量]类型转换发生意外:"+e);
	return;
}
int kygrsl=0;
ls=request.getParameter("kygrsl");
try{
	if (!(ls.equals("")))  kygrsl=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kygrsl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[可用工人数量]类型转换发生意外:"+e);
	return;
}
String tdbz=cf.GB2Uni(request.getParameter("tdbz"));
java.sql.Date rzsj=null;
ls=request.getParameter("rzsj");
try{
	if (!(ls.equals("")))  rzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[rzsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[入职时间]类型转换发生意外:"+e);
	return;
}
java.sql.Date lzsj=null;
ls=request.getParameter("lzsj");
try{
	if (!(ls.equals("")))  lzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lzsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[离职时间]类型转换发生意外:"+e);
	return;
}

String jjlxr=cf.GB2Uni(request.getParameter("jjlxr"));
String jjlxrdh=cf.GB2Uni(request.getParameter("jjlxrdh"));
String jjlxrdz=cf.GB2Uni(request.getParameter("jjlxrdz"));
String sfqldht=cf.GB2Uni(request.getParameter("sfqldht"));
String sfsbx=cf.GB2Uni(request.getParameter("sfsbx"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc='"+bzmc+"'";
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
		out.println("错误！该班长已存在");
		return;
	}

	count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  sq_bzxx";
	ls_sql+=" where bzmc='"+bzmc+"' and tdbz in('K','L')";
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
		out.println("提醒！该班长已入过职");
	}

	String ssfgs=null;
	String getsgdjbbm="";
	double khmyd=0;
	ls_sql="select ssfgs,sgdjbbm,khmyd";
	ls_sql+=" from  sq_sgd";
	ls_sql+=" where sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=rs.getString("ssfgs");
		getsgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
		khmyd=rs.getDouble("khmyd");
	}
	rs.close();
	ps.close();


	double pjde=0;
	int zxzsgds=0;
	int zdzsgds=0;
	ls_sql="select pjde,zxzsgds,zdzsgds ";
	ls_sql+=" from  kp_yzfdzpdcs";
	ls_sql+=" where ssfgs='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		pjde=rs.getDouble("pjde");
		zxzsgds=rs.getInt("zxzsgds");
		zdzsgds=rs.getInt("zdzsgds");
	}
	rs.close();
	ps.close();

	int mqzsgds=0;
	double kjdzxz=0;
	double kjdzdz=0;
	
	if (getsgdjbbm.equals("A"))//标兵
	{
		if (sgdjbbm.equals("A"))//标兵,B≥2A
		{
			kjdzxz=pjde*2;
			kjdzdz=pjde*1000;
		}
		else if (sgdjbbm.equals("B"))//优秀,3A＞B≥A
		{
			kjdzxz=pjde;
			kjdzdz=pjde*3;
		}
		else if (sgdjbbm.equals("C"))//普通,B＜A
		{
			kjdzxz=0;
			kjdzdz=pjde;
		}
	}
	else if (getsgdjbbm.equals("B"))//优秀
	{
		if (sgdjbbm.equals("A"))//标兵,3A＞B≥1.5A
		{
			kjdzxz=pjde*1.5;
			kjdzdz=pjde*3;
		}
		else if (sgdjbbm.equals("B"))//优秀,2A＞B≥A
		{
			kjdzxz=pjde;
			kjdzdz=pjde*2;
		}
		else if (sgdjbbm.equals("C"))//普通,B＜A
		{
			kjdzxz=0;
			kjdzdz=pjde;
		}
	}
	else if (getsgdjbbm.equals("C"))//普通
	{
		if (sgdjbbm.equals("A"))//标兵
		{
		}
		else if (sgdjbbm.equals("B"))//优秀,1.5A＞B≥A
		{
			kjdzxz=pjde;
			kjdzdz=pjde*1.5;
		}
		else if (sgdjbbm.equals("C"))//普通,B＜A
		{
			kjdzxz=0;
			kjdzdz=pjde;
		}
	}

	conn.setAutoCommit(false);

	ls_sql="insert into sq_bzxx ( bzmc,sgd,xb,dh,zz,sfzh,bz,sgdjbbm,grsl,tdbz ,khmyd,mqzsgds,zxzsgds,zdzsgds,kjdzxz,kjdzdz,jjlxr,jjlxrdh,jjlxrdz,sfqldht,yygrsl,kygrsl,sfsbx,rzsj,lzsj) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,? ,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bzmc);
	ps.setString(2,sgd);
	ps.setString(3,xb);
	ps.setString(4,dh);
	ps.setString(5,zz);
	ps.setString(6,sfzh);
	ps.setString(7,bz);
	ps.setString(8,sgdjbbm);
	ps.setInt(9,grsl);
	ps.setString(10,tdbz);

	ps.setDouble(11,khmyd);
	ps.setInt(12,mqzsgds);
	ps.setInt(13,zxzsgds);
	ps.setInt(14,zdzsgds);
	ps.setDouble(15,kjdzxz);
	ps.setDouble(16,kjdzdz);
	ps.setString(17,jjlxr);
	ps.setString(18,jjlxrdh);
	ps.setString(19,jjlxrdz);
	ps.setString(20,sfqldht);
	ps.setInt(21,yygrsl);
	ps.setInt(22,kygrsl);
	ps.setString(23,sfsbx);
	ps.setDate(24,rzsj);
	ps.setDate(25,lzsj);
	ps.executeUpdate();
	ps.close();

	ls_sql="update sq_sgd set bzs=(select count(*) from sq_bzxx where sgd='"+sgd+"')";
	ls_sql+=" where sgd='"+sgd+"'";
//	out.println(ls_sql);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>