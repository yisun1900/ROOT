<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gysbm=null;
String gys=null;
String dqbm=null;
String gysdz=null;
String gysfzr=null;
String gysdh=null;
String gyscz=null;
String email=null;
String yhdlm=null;
String bz=null;
gysbm=cf.GB2Uni(request.getParameter("gysbm"));
gys=cf.GB2Uni(request.getParameter("gys"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
gysdz=cf.GB2Uni(request.getParameter("gysdz"));
gysfzr=cf.GB2Uni(request.getParameter("gysfzr"));
gysdh=cf.GB2Uni(request.getParameter("gysdh"));
gyscz=cf.GB2Uni(request.getParameter("gyscz"));
email=cf.GB2Uni(request.getParameter("email"));
yhdlm=cf.GB2Uni(request.getParameter("yhdlm"));
bz=cf.GB2Uni(request.getParameter("bz"));

String yhkl=cf.GB2Uni(request.getParameter("yhkl"));
String yhmc=cf.GB2Uni(request.getParameter("yhmc"));
String cwdm=cf.GB2Uni(request.getParameter("cwdm"));
String kdlxtbz=cf.GB2Uni(request.getParameter("kdlxtbz"));
String[] ssfgs=request.getParameterValues("ssfgs");

String wheregysbm=cf.GB2Uni(request.getParameter("wheregysbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String oldyhdlm=null;
	ls_sql="select yhdlm";
	ls_sql+=" from  sq_gysbm";
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
	ls_sql+=" from  sq_gysbm";
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
	ls_sql+=" from  sq_gysbm";
	ls_sql+=" where  gys='"+gys+"' and dqbm='"+dqbm+"'";
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
	
	ls_sql="update sq_gysbm set gysbm=?,gys=?,dqbm=?,gysdz=?,gysfzr=?,gysdh=?,gyscz=?,email=?,bz=?,yhdlm=?,yhkl=?,yhmc=?,cwdm=?,lxdlsbcs=0,kdlxtbz=? ";
	ls_sql+=" where gysbm='"+wheregysbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gysbm);
	ps.setString(2,gys);
	ps.setString(3,dqbm);
	ps.setString(4,gysdz);
	ps.setString(5,gysfzr);
	ps.setString(6,gysdh);
	ps.setString(7,gyscz);
	ps.setString(8,email);
	ps.setString(9,bz);
	ps.setString(10,yhdlm);
	ps.setString(11,yhkl);
	ps.setString(12,yhmc);
	ps.setString(13,cwdm);
	ps.setString(14,kdlxtbz);
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


	ls_sql="update sq_gysxx set gysbm=?,gys=?";
	ls_sql+=" where gysbm='"+wheregysbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gysbm);
	ps.setString(2,gys);
	ps.executeUpdate();
	ps.close();

	ls_sql="update sq_gyslxr set gysbm=?";
	ls_sql+=" where gysbm='"+wheregysbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gysbm);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from sq_gyssqfgs";
	ls_sql+=" where gysbm='"+wheregysbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (ssfgs!=null)
	{
		for (int i=0;i<ssfgs.length ;i++ )
		{
			ls_sql="insert into sq_gyssqfgs (gysbm,ssfgs ) ";
			ls_sql+=" values ( ?,? ) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,gysbm);
			ps.setString(2,ssfgs[i]);
			ps.executeUpdate();
			ps.close();
		}
	}


	//对所属分公司进行检查，『品牌供应商授权分公司』要不超过『供应商授权分公司』＋＋＋＋＋＋＋＋＋＋＋开始

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
	conn.rollback();
	out.print("Exception: " + e);
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