<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gys=null;
String dqbm=null;
String gysdz=null;
String gysfzr=null;
String gysdh=null;
String gyscz=null;
String email=null;
String yhdlm=null;
String bz=null;
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

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  sq_gysbm";
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
	ls_sql+=" from  sq_gysbm";
	ls_sql+=" where gys='"+gys+"' and dqbm='"+dqbm+"'";
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
	ls_sql+=" from  sq_gysbm";
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
	
	ls_sql="insert into sq_gysbm ( gysbm,gys,dqbm,gysdz,gysfzr,gysdh,gyscz,email,bz,yhdlm,yhkl,yhmc,cwdm,kdlxtbz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,gysbm);
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

	for (int i=0;i<ssfgs.length ;i++ )
	{
		ls_sql="insert into sq_gyssqfgs (gysbm,ssfgs ) ";
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>