<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long ppbm=0;
String ppmc=null;
long gysbm=0;
String gysmc=null;
String ssfgs=null;
ls=request.getParameter("ppbm");
try{
	if (!(ls.equals("")))  ppbm=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ppbm不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[子品牌编码]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gysbm");
try{
	if (!(ls.equals("")))  gysbm=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gysbm不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[供应商编码]类型转换发生意外:"+e);
	return;
}
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));



String yhdlm=null;
String yhkl=null;
String yhmc=null;
String kdlxtbz=null;
long lxdlsbcs=0;
java.sql.Date mmxgsj=null;
long mmsyzq=0;
long yxdlsbcs=0;
String sfsd=null;

yhdlm=cf.GB2Uni(request.getParameter("yhdlm"));
yhkl=cf.GB2Uni(request.getParameter("yhkl"));
yhmc=cf.GB2Uni(request.getParameter("yhmc"));
kdlxtbz=cf.GB2Uni(request.getParameter("kdlxtbz"));
ls=request.getParameter("mmsyzq");
try{
	if (!(ls.equals("")))  mmsyzq=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量mmsyzq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[密码使用周期]类型转换发生意外:"+e);
	return;
}
if (mmsyzq==0)
{
	mmsyzq=360;
}
ls=request.getParameter("yxdlsbcs");
try{
	if (!(ls.equals("")))  yxdlsbcs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yxdlsbcs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[允许登陆失败次数]类型转换发生意外:"+e);
	return;
}
if (yxdlsbcs==0)
{
	yxdlsbcs=6;
}
sfsd=cf.GB2Uni(request.getParameter("sfsd"));





Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select gysmc ";
	ls_sql+=" from  jxc_gysxx";
	ls_sql+=" where gysbm='"+gysbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gysmc=rs.getString("gysmc");
	}
	rs.close();
	ps.close();

	ls_sql="select ppmc ";
	ls_sql+=" from  jxc_ppxx";
	ls_sql+=" where ppbm='"+ppbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ppmc=rs.getString("ppmc");
	}
	rs.close();
	ps.close();

	String dqbm=null;
	ls_sql="select dqbm ";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	ls_sql="insert into jxc_ppgysdzb ( ppbm,ppmc,gysbm,gysmc,ssfgs ,yhdlm,yhkl,yhmc,kdlxtbz,lxdlsbcs,mmxgsj,mmsyzq,yxdlsbcs,sfsd) ";
	ls_sql+=" values ( ?,?,?,?,?   ,?,?,?,?,?,SYSDATE,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,ppbm);
	ps.setString(2,ppmc);
	ps.setLong(3,gysbm);
	ps.setString(4,gysmc);
	ps.setString(5,ssfgs);

	ps.setString(6,yhdlm);
	ps.setString(7,yhkl);
	ps.setString(8,yhmc);
	ps.setString(9,kdlxtbz);
	ps.setLong(10,lxdlsbcs);
	ps.setLong(11,mmsyzq);
	ps.setLong(12,yxdlsbcs);
	ps.setString(13,sfsd);
	
	
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>