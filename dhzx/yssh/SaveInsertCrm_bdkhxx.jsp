<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khxm=null;
String bdr=null;
String bdcs=null;
String fwdz=null;
String lxfs=null;
String ywy=null;
String ywyssxz=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String ssfgs=null;
String bz=null;
khxm=cf.GB2Uni(request.getParameter("khxm"));
bdr=cf.GB2Uni(request.getParameter("bdr"));
bdcs=cf.GB2Uni(request.getParameter("bdcs"));
fwdz=cf.GB2Uni(request.getParameter("fwdz"));
lxfs=cf.GB2Uni(request.getParameter("lxfs"));
ywy=cf.GB2Uni(request.getParameter("ywy"));
ywyssxz=cf.GB2Uni(request.getParameter("ywyssxz"));
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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
bz=cf.GB2Uni(request.getParameter("bz"));

String cqbm=cf.GB2Uni(request.getParameter("cqbm"));
String jiedao=cf.GB2Uni(request.getParameter("jiedao"));
String xqbm=cf.GB2Uni(request.getParameter("xqbm"));
String louhao=cf.GB2Uni(request.getParameter("louhao"));

String qtdh=null;
String xqlx=null;
long fwmj=0;
String hxbm=null;
long fj=0;
String khzyxz=null;
java.sql.Date yjzxsj=null;
String jzdsmc=null;
String sfxhf=null;
java.sql.Date xchfsj=null;
qtdh=cf.GB2Uni(request.getParameter("qtdh"));
xqlx=cf.GB2Uni(request.getParameter("xqlx"));
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
//hxbm=cf.GB2Uni(request.getParameter("hxbm"));
//ls=request.getParameter("fj");
//try{
//	if (!(ls.equals("")))  fj=Long.parseLong(ls.trim());
//}
//catch (java.lang.NullPointerException nulle){
//	out.println("<BR>变量fj不存在");
//	return;
//}
//catch (Exception e){
//	out.println("<BR>[房价]类型转换发生意外:"+e);
//	return;
//}
//khzyxz=cf.GB2Uni(request.getParameter("khzyxz"));
//ls=request.getParameter("yjzxsj");
//try{
//	if (!(ls.equals("")))  yjzxsj=java.sql.Date.valueOf(ls.trim());
//}
//catch (java.lang.NullPointerException nulle){
//	out.println("<BR>变量[yjzxsj]不存在");
//	return;
//}
//catch (Exception e){
//	out.println("<BR>[预计装修时间]类型转换发生意外:"+e);
//	return;
//}
//jzdsmc=cf.GB2Uni(request.getParameter("jzdsmc"));
//sfxhf=cf.GB2Uni(request.getParameter("sfxhf"));
//ls=request.getParameter("xchfsj");
//try{
//	if (!(ls.equals("")))  xchfsj=java.sql.Date.valueOf(ls.trim());
//}
//catch (java.lang.NullPointerException nulle){
//	out.println("<BR>变量[xchfsj]不存在");
//	return;
//}
//catch (Exception e){
//	out.println("<BR>[下次回访时间]类型转换发生意外:"+e);
//	return;
//}

String dqbm=cf.GB2Uni(request.getParameter("dqbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_bdkhxx";
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
		out.println("<BR>提醒！此[房屋地址]已存在");
		return;
	}


	ls_sql="select count(*)";
	ls_sql+=" from  crm_bdkhxx";
	ls_sql+=" where lxfs='"+lxfs+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>=2)
	{
		out.println("<BR>错误！此[手机]已存在两次");
		return ;
	}

	ls_sql="select count(*)";
	ls_sql+=" from  crm_bdkhxx";
	ls_sql+=" where qtdh='"+qtdh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>=2)
	{
		out.println("<BR>错误！此[其它电话]已存在两次");
		return;
	}
	
	
	
	//String zt="1";//1：跟踪；2：失败；3：移交；4：已接收；5：准备移交


	//String sfxxq=null;//是否新小区 Y：是；N：否
//
//	count=0;
//	ls_sql="SELECT count(*)";
//	ls_sql+=" FROM yx_lsdcb ";
//	ls_sql+=" where dqbm='"+dqbm+"' and xqmc='"+xqbm+"'";
//	ps= conn.prepareStatement(ls_sql);
//	rs =ps.executeQuery();
//	if (rs.next())
//	{   
//		count=rs.getInt(1);
//	}
//	rs.close();
//	ps.close();
//
//	if (count==0)
//	{
//		sfxxq="Y";
//	}
//	else{
//		sfxxq="N";
//	}
//
//	if (count==0)
//	{
//		ls_sql="SELECT count(*)";
//		ls_sql+=" FROM yx_xxqmd ";
//		ls_sql+=" where dqbm='"+dqbm+"' and xqmc='"+xqbm+"'";
//		ps= conn.prepareStatement(ls_sql);
//		rs =ps.executeQuery();
//		if (rs.next())
//		{   
//			count=rs.getInt(1);
//		}
//		rs.close();
//		ps.close();
//	}


	int xh=0;
	ls_sql="select NVL(max(TO_NUMBER(bdkhbh))+1,1)";
	ls_sql+=" from  crm_bdkhxx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	ps.close();
	rs.close();
	String bdkhbh=cf.addZero(xh,7);

	conn.setAutoCommit(false);

	ls_sql="insert into crm_bdkhxx (bdkhbh,khxm,cqbm,jiedao,xqbm,louhao,fwdz,lxfs,qtdh  ";
	ls_sql+=" ,fwmj,bdr,bdcs ";
	ls_sql+=" ,lrr,lrsj,lrbm,ssfgs,bz) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?   ,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bdkhbh);
	ps.setString(2,khxm);
	ps.setString(3,cqbm);
	ps.setString(4,jiedao);
	ps.setString(5,xqbm);
	ps.setString(6,louhao);
	ps.setString(7,fwdz);
	ps.setString(8,lxfs);
	ps.setString(9,qtdh);
	ps.setLong(10,fwmj);
	ps.setString(11,bdr);
	ps.setString(12,bdcs);
	ps.setString(13,lrr);
	ps.setDate(14,lrsj);
	ps.setString(15,lrbm);
	ps.setString(16,ssfgs);
	ps.setString(17,bz);

	ps.executeUpdate();
	ps.close();

	//if (count==0)
//	{
//		ls_sql="insert into yx_xxqmd (dqbm,xqmc,cqbm,dz,lrr,lrsj,fgsbh,zt) ";
//		ls_sql+=" values ( ?,?,?,?,?,?,?,'1' ) ";//1：未确认；2：已确认
//		ps= conn.prepareStatement(ls_sql);
//		ps.setString(1,dqbm);
//		ps.setString(2,xqbm);
//		ps.setString(3,cqbm);
//		ps.setString(4,fwdz);
//		ps.setString(5,lrr);
//		ps.setDate(6,lrsj);
//		ps.setString(7,ssfgs);
//		ps.executeUpdate();
//		ps.close();
//	}

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