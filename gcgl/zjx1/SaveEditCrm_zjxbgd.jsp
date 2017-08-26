<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zjxxh=request.getParameter("zjxxh");

String[] xh=request.getParameterValues("xh");
String[] xmbh=request.getParameterValues("xmbh");
String[] fj=request.getParameterValues("fj");
String[] bgxm=request.getParameterValues("bgxm");
String[] jldw=request.getParameterValues("jldw");
String[] slstr=request.getParameterValues("sl");
String[] djstr=request.getParameterValues("dj");
String[] sjzjje=request.getParameterValues("sjzjje");
String[] sjzjce=request.getParameterValues("sjzjce");
String[] yslxje=request.getParameterValues("yslxje");
String[] yszjce=request.getParameterValues("yszjce");
String[] sm=request.getParameterValues("sm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	double zjje=0;
	double jzjje=0;
	ls_sql="select zjje,jzjje ";
	ls_sql+=" FROM crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjje=rs.getDouble("zjje");
		jzjje=rs.getDouble("jzjje");
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="delete from crm_zjxbgd ";
	ls_sql+=" where crm_zjxbgd.zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<xh.length ;i++ )
	{
		double sl=0;
		double dj=0;
		double je=0;

		if (bgxm[i].equals(""))
		{
			break;
		}

		if (jldw[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[计量单位]为空");
			return;
		}
		if (slstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[数量]为空");
			return;
		}
		else{
			sl=Double.parseDouble(slstr[i].trim());
		}
		if (djstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[单价]为空");
			return;
		}
		else{
			dj=Double.parseDouble(djstr[i].trim());
		}

		je=sl*dj;

		String lx=null;
		if (je>=0)
		{
			lx="1";//1：增项；2：减项
		}
		else{
			lx="2";
		}

		ls_sql="insert into crm_zjxbgd ( zjxxh,xh,xmbh,fj,bgxm,jldw,sl,dj,je,sjzjje,sjzjce,yslxje,yszjce,lx,sm ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,zjxxh);
		ps.setString(2,xh[i]);
		ps.setString(3,cf.GB2Uni(xmbh[i]));
		ps.setString(4,cf.GB2Uni(fj[i]));
		ps.setString(5,cf.GB2Uni(bgxm[i]));
		ps.setString(6,cf.GB2Uni(jldw[i]));
		ps.setDouble(7,sl);
		ps.setDouble(8,dj);
		ps.setDouble(9,je);
		ps.setString(10,sjzjje[i]);
		ps.setString(11,sjzjce[i]);
		ps.setString(12,yslxje[i]);
		ps.setString(13,yszjce[i]);
		ps.setString(14,lx);
		ps.setString(15,cf.GB2Uni(sm[i]));
		ps.executeUpdate();
		ps.close();
	}
	

	conn.commit();

	double allje=0;
	ls_sql="select sum(je) ";
	ls_sql+=" FROM crm_zjxbgd";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (allje!=jzjje)
	{
		out.println("提醒！！！【折后工程增减额："+jzjje+"】不等于【变更明细总额："+allje+"】");
	}

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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>