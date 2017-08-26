<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long ygbh=0;
String yhmc=null;
String bianhao=null;
String sfzh=null;
String xzzwbm=null;
java.sql.Date lzrq=null;
String lzyy=null;
String dwbh=null;
String ssfgs=null;
String lrr=null;
java.sql.Date lrsj=null;
ls=request.getParameter("ygbh");
try{
	if (!(ls.equals("")))  ygbh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ygbh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[员工序号]类型转换发生意外:"+e);
	return;
}
yhmc=cf.GB2Uni(request.getParameter("yhmc"));
bianhao=cf.GB2Uni(request.getParameter("bianhao"));
sfzh=cf.GB2Uni(request.getParameter("sfzh"));
xzzwbm=cf.GB2Uni(request.getParameter("xzzwbm"));
ls=request.getParameter("lzrq");
try{
	if (!(ls.equals("")))  lzrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lzrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[离职日期]类型转换发生意外:"+e);
	return;
}
lzyy=cf.GB2Uni(request.getParameter("lzyy"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
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
String lzyyflbm=cf.GB2Uni(request.getParameter("lzyyflbm"));
String czsqxh=cf.GB2Uni(request.getParameter("czsqxh"));
String lzlx=cf.GB2Uni(request.getParameter("lzlx"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String yhdlm=null;
	String sfzszg="";
	ls_sql="select yhdlm,sfzszg";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where  (ygbh='"+ygbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yhdlm=rs.getString(1);
		sfzszg=cf.fillNull(rs.getString(2));
	}
	rs.close();
	ps.close();

	if (sfzszg.equals("S") || sfzszg.equals("T"))
	{
		out.println("错误！员工已离职");
		return;
	}

	int xh=0;
	ls_sql="select NVL(max(xh),0)";
	ls_sql+=" from  rs_yhlzjl";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	xh++;

	conn.setAutoCommit(false);

	ls_sql="update rs_czsq set clzt='05'";
	ls_sql+=" where sqxh='"+czsqxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into rs_yhlzjl ( xh,ygbh,yhmc,bianhao,sfzh,xzzwbm,lzrq,lzyy,dwbh,ssfgs,lrr,lrsj,lzyyflbm,czsqxh,lzlx,ysfzszg ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,xh);
	ps.setLong(2,ygbh);
	ps.setString(3,yhmc);
	ps.setString(4,bianhao);
	ps.setString(5,sfzh);
	ps.setString(6,xzzwbm);
	ps.setDate(7,lzrq);
	ps.setString(8,lzyy);
	ps.setString(9,dwbh);
	ps.setString(10,ssfgs);
	ps.setString(11,lrr);
	ps.setDate(12,lrsj);
	ps.setString(13,lzyyflbm);
	ps.setString(14,czsqxh);
	ps.setString(15,lzlx);
	ps.setString(16,sfzszg);
	ps.executeUpdate();
	ps.close();

	ls_sql="update sq_yhxx set lzrq=?,lzyy=?,lzxh=?,lzyyflbm=?,sfzszg=?,kdlxtbz='N',yhdlm=null,yhkl=null";
	ls_sql+=" where  (ygbh='"+ygbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,lzrq);
	ps.setString(2,lzyy);
	ps.setInt(3,xh);
	ps.setString(4,lzyyflbm);
	ps.setString(5,lzlx);
	ps.executeUpdate();
	ps.close();

	//取消用户权限
	if (yhdlm!=null)//Y：是；N：否
	{
		ls_sql="delete from sq_yhssz where yhdlm='"+yhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from sq_yhewqx where yhdlm='"+yhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//用户授权日志
		String ip=request.getRemoteHost();
		String lrrdlm=(String)session.getAttribute("yhdlm");
		String lrrxm=(String)session.getAttribute("yhmc");
		ls_sql="insert into sq_yhsqrz (xh,ip,lrrdlm,lrrxm,lrsj,yhdlm,yhmc,yhzbh,czlx,bz) ";
		ls_sql+=" values ( (select NVL(max(xh),0)+1 from sq_yhsqrz),?,?,?,SYSDATE,?,?,'all','2','离职') ";//1：插入；2：删除；3：修改
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ip);
		ps.setString(2,lrrdlm);
		ps.setString(3,lrrxm);
		ps.setString(4,yhdlm);
		ps.setString(5,yhmc);
		ps.executeUpdate();
		ps.close();

	}

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