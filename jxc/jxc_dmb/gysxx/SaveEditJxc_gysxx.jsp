<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long gysbm=0;
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
String gyslx=null;
String kdlxtbz=null;
long lxdlsbcs=0;
java.sql.Date mmxgsj=null;
long mmsyzq=0;
long yxdlsbcs=0;
String sfsd=null;
String bz=null;
String sfhz=null;
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
sfhz=cf.GB2Uni(request.getParameter("sfhz"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
gyslx=cf.GB2Uni(request.getParameter("gyslx"));
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
ls=request.getParameter("lxdlsbcs");
try{
	if (!(ls.equals("")))  lxdlsbcs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lxdlsbcs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[已经登陆失败次数]类型转换发生意外:"+e);
	return;
}
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
sfsd=cf.GB2Uni(request.getParameter("sfsd"));
bz=cf.GB2Uni(request.getParameter("bz"));
String cllx=cf.GB2Uni(request.getParameter("cllx"));

String[] ssfgs=request.getParameterValues("ssfgs");

String wheregysbm=null;
wheregysbm=cf.GB2Uni(request.getParameter("wheregysbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	
	String oldyhdlm=null;
	ls_sql="select yhdlm";
	ls_sql+=" from  jxc_gysxx";
	ls_sql+=" where gysbm='"+wheregysbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		oldyhdlm=rs.getString(1);
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  jxc_gysxx";
	ls_sql+=" where  yhdlm='"+yhdlm+"'";
	ls_sql+=" and gysbm!='"+wheregysbm+"'";
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
	ls_sql+=" where  gysmc='"+gysmc+"' and dqbm='"+dqbm+"'";
	ls_sql+=" and gysbm!='"+wheregysbm+"'";
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
	
	conn.setAutoCommit(false);
	
	ls_sql="update jxc_gysxx set dqbm=?,gysmc=?,gysdz=?,gysfzr=?,gysdh=?,gyscz=?,email=?,yhdlm=?,yhkl=?,yhmc=?,cwdm=?,kdlxtbz=?,lxdlsbcs=?,mmsyzq=?,yxdlsbcs=?,sfsd=?,bz=?,gyslx=?,sfhz=?,cllx=? ";
	ls_sql+=" where  (gysbm="+wheregysbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,gysmc);
	ps.setString(3,gysdz);
	ps.setString(4,gysfzr);
	ps.setString(5,gysdh);
	ps.setString(6,gyscz);
	ps.setString(7,email);
	ps.setString(8,yhdlm);
	ps.setString(9,yhkl);
	ps.setString(10,yhmc);
	ps.setString(11,cwdm);
	ps.setString(12,kdlxtbz);
	ps.setLong(13,lxdlsbcs);
	ps.setLong(14,mmsyzq);
	ps.setLong(15,yxdlsbcs);
	ps.setString(16,sfsd);
	ps.setString(17,bz);
	ps.setString(18,gyslx);
	ps.setString(19,sfhz);
	ps.setString(20,cllx);
	ps.executeUpdate();
	ps.close();

	if (oldyhdlm!=null && yhdlm.equals(""))
	{
		//取消用户权限
		ls_sql="delete from sq_yhssz where yhdlm='"+oldyhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from  sq_yhewqx where yhdlm='"+oldyhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

/*
		//用户授权日志
		String ip=request.getRemoteHost();
		String lrrdlm=(String)session.getAttribute("yhdlm");
		String lrrxm=(String)session.getAttribute("yhmc");
		ls_sql="insert into sq_yhsqrz (xh,ip,lrrdlm,lrrxm,lrsj,yhdlm,yhzbh,czlx,bz) ";
		ls_sql+=" values ( (select NVL(max(xh),0)+1 from sq_yhsqrz),?,?,?,SYSDATE,?,'all','2','删除用户登陆名') ";//1：插入；2：删除；3：修改
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ip);
		ps.setString(2,lrrdlm);
		ps.setString(3,lrrxm);
		ps.setString(4,oldyhdlm);
		ps.executeUpdate();
		ps.close();
*/
	}
	else if (oldyhdlm!=null && !yhdlm.equals(oldyhdlm))
	{
		//取消用户权限
		ls_sql="update sq_yhssz set yhdlm='"+yhdlm+"' where yhdlm='"+oldyhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update sq_yhewqx set yhdlm='"+yhdlm+"' where yhdlm='"+oldyhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}


	ls_sql="update jxc_ppgysdzb set gysmc=?";
	ls_sql+=" where gysbm='"+wheregysbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gysmc);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from jxc_gyssqfgs";
	ls_sql+=" where gysbm='"+wheregysbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (ssfgs!=null)
	{
		for (int i=0;i<ssfgs.length ;i++ )
		{
			ls_sql="insert into jxc_gyssqfgs (gysbm,ssfgs ) ";
			ls_sql+=" values ( ?,? ) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,wheregysbm);
			ps.setString(2,ssfgs[i]);
			ps.executeUpdate();
			ps.close();
		}
	}


	//对所属分公司进行检查，『品牌供应商授权分公司』要不超过『供应商授权分公司』＋＋＋＋＋＋＋＋＋＋＋开始
/*
	String getdwmc="";
	int mark=0;
	ls_sql="select dwmc";
	ls_sql+=" from  sq_ppgyssqfgs,sq_gysxx,sq_dwxx";
	ls_sql+=" where sq_ppgyssqfgs.gysbh=sq_gysxx.gysbh ";
	ls_sql+=" and sq_ppgyssqfgs.ssfgs=sq_dwxx.dwbh ";
	ls_sql+=" and sq_gysxx.gysbm='"+wheregysbm+"'";
	ls_sql+=" and sq_ppgyssqfgs.ssfgs not in(select ssfgs from sq_gyssqfgs where gysbm='"+wheregysbm+"')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getdwmc+=rs.getString(1)+"；";
		mark++;

	}
	rs.close();
	ps.close();

	if (mark>0)
	{
		conn.rollback();
		out.println("错误！因在『品牌供应商授权分公司』中存在，如下供应商所属分公司不能删除："+getdwmc);
		return;
	}
*/	
	
	//对所属分公司进行检查，『品牌供应商授权分公司』要不大于『供应商授权分公司』========================结束

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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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