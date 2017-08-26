<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dqbm=null;
String gysmc=null;
String gysdz=null;
String gysfzr=null;
String gysdh=null;
String gyscz=null;
String email=null;
String yhdlm=null;
String yhkl=null;
String yhmc=null;
String cwdm=null;
String kdlxtbz=null;
long lxdlsbcs=0;
java.sql.Date mmxgsj=null;
long mmsyzq=0;
long yxdlsbcs=0;
String sfsd=null;
String bz=null;
String sfhz=null;
sfhz=cf.GB2Uni(request.getParameter("sfhz"));
String gyslx=null;
gyslx=cf.GB2Uni(request.getParameter("gyslx"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
gysmc=cf.GB2Uni(request.getParameter("gysmc"));
gysdz=cf.GB2Uni(request.getParameter("gysdz"));
gysfzr=cf.GB2Uni(request.getParameter("gysfzr"));
gysdh=cf.GB2Uni(request.getParameter("gysdh"));
gyscz=cf.GB2Uni(request.getParameter("gyscz"));
email=cf.GB2Uni(request.getParameter("email"));
yhdlm=cf.GB2Uni(request.getParameter("yhdlm"));
yhkl=cf.GB2Uni(request.getParameter("yhkl"));
yhmc=cf.GB2Uni(request.getParameter("yhmc"));
cwdm=cf.GB2Uni(request.getParameter("cwdm"));
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
	mmsyzq=60;
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
bz=cf.GB2Uni(request.getParameter("bz"));
String cllx=cf.GB2Uni(request.getParameter("cllx"));

String[] ssfgs=request.getParameterValues("ssfgs");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  jxc_gysxx";
	ls_sql+=" where  yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("错误！用户登陆名已存在");
		return;
	}
	else{
		ls_sql="select count(*)";
		ls_sql+=" from  sq_yhxx";
		ls_sql+=" where yhdlm='"+yhdlm+"'";
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
			out.println("错误！[用户登录名]已被内部员工占用");
			return;
		}
	}


	count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  jxc_gysxx";
	ls_sql+=" where gysmc='"+gysmc+"' and dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("错误！供应商名称已存在");
		return;
	}


	int gysbm=0;
	ls_sql="select NVL(max(gysbm),0)";
	ls_sql+=" from  jxc_gysxx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gysbm=rs.getInt(1);
	}
	rs.close();
	ps.close();

	gysbm++;

	conn.setAutoCommit(false);

	ls_sql="insert into jxc_gysxx ( gysbm,dqbm,gysmc,gyslx,gysdz,gysfzr,gysdh,gyscz,email,yhdlm,yhkl,yhmc,cwdm,kdlxtbz,lxdlsbcs,mmxgsj,mmsyzq,yxdlsbcs,sfsd,bz,sfhz,cllx ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,SYSDATE,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,gysbm);
	ps.setString(2,dqbm);
	ps.setString(3,gysmc);
	ps.setString(4,gyslx);
	ps.setString(5,gysdz);
	ps.setString(6,gysfzr);
	ps.setString(7,gysdh);
	ps.setString(8,gyscz);
	ps.setString(9,email);
	ps.setString(10,yhdlm);
	ps.setString(11,yhkl);
	ps.setString(12,yhmc);
	ps.setString(13,cwdm);
	ps.setString(14,kdlxtbz);
	ps.setLong(15,lxdlsbcs);
	ps.setLong(16,mmsyzq);
	ps.setLong(17,yxdlsbcs);
	ps.setString(18,sfsd);
	ps.setString(19,bz);
	ps.setString(20,sfhz);
	ps.setString(21,cllx);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from jxc_gyssqfgs";
	ls_sql+=" where gysbm='"+gysbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<ssfgs.length ;i++ )
	{
		ls_sql="insert into jxc_gyssqfgs (gysbm,ssfgs ) ";
		ls_sql+=" values ( ?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,gysbm);
		ps.setString(2,ssfgs[i]);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！供应商编码为：<%=gysbm%>");
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>