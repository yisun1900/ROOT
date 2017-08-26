<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xqbm=null;
String xqmc=null;
String cqbm=null;
String dqbm=null;
String yhdlm=null;
String kfs=null;
String sldh=null;
long mpmjj=0;
java.sql.Date rzsj=null;
String bz=null;

xqmc=cf.GB2Uni(request.getParameter("xqmc"));
cqbm=cf.GB2Uni(request.getParameter("cqbm"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
yhdlm=cf.GB2Uni(request.getParameter("yhdlm"));
kfs=cf.GB2Uni(request.getParameter("kfs"));
sldh=cf.GB2Uni(request.getParameter("sldh"));
ls=request.getParameter("mpmjj");
try{
	if (!(ls.equals("")))  mpmjj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量mpmjj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[每平米均价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("rzsj");
try{
	if (!(ls.equals("")))  rzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[入住时间]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	
	int count=0;

	ls_sql="select count(*)";
	ls_sql+=" from  dm_xqbm";
	ls_sql+=" where xqmc='"+xqmc+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	ps.close();
	rs.close();

	if (count>0)
	{
		out.println("错误！此[小区名称]已存在");
		return;
	}

	//小区编码
	int xh=0;
	ls_sql="select NVL(max(TO_NUMBER(substr(xqbm,5,3)))+1,1)";
	ls_sql+=" from  dm_xqbm";
	ls_sql+=" where substr(xqbm,1,4)='"+cqbm+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	ps.close();
	rs.close();
	xqbm=cqbm+cf.addZero(xh,3);
//	out.println(xqbm);
	
	ls_sql="insert into dm_xqbm ( xqbm,xqmc,cqbm,dqbm,yhdlm,kfs,sldh,mpmjj,rzsj,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xqbm);
	ps.setString(2,xqmc);
	ps.setString(3,cqbm);
	ps.setString(4,dqbm);
	ps.setString(5,yhdlm);
	ps.setString(6,kfs);
	ps.setString(7,sldh);
	ps.setLong(8,mpmjj);
	ps.setDate(9,rzsj);
	ps.setString(10,bz);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功，小区编码为：<%=xqbm%>");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
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