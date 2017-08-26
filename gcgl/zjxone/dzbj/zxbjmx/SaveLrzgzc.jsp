<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String[] zcmc=request.getParameterValues("zcmc");
String[] jldwbm=request.getParameterValues("jldwbm");
String[] bz=request.getParameterValues("bz");
String[] djStr=request.getParameterValues("dj");
String[] slStr=request.getParameterValues("sl");
String[] jeStr=request.getParameterValues("je");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	int xh=0;
	ls_sql="select max(xh)";
	ls_sql+=" from  bj_zcbjmx";
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


	for (int i=0;i<zcmc.length ;i++ )
	{
		if (zcmc[i].equals(""))
		{
			continue;
		}

		if (zcmc[i].equals(""))
		{
			conn.rollback();
			out.println("第["+(i+1)+"]行出错！[主材名称]为空");
			return;
		}
		if (jldwbm[i].equals(""))
		{
			conn.rollback();
			out.println("第["+(i+1)+"]行出错！[计量单位]为空");
			return;
		}
		if (slStr[i].equals(""))
		{
			conn.rollback();
			out.println("第["+(i+1)+"]行出错！[数量]为空");
			return;
		}
		if (djStr[i].equals(""))
		{
			conn.rollback();
			out.println("第["+(i+1)+"]行出错！[单价]为空");
			return;
		}
		if (jeStr[i].equals(""))
		{
			conn.rollback();
			out.println("第["+(i+1)+"]行出错！[金额]为空");
			return;
		}
		if (bz[i].equals(""))
		{
			conn.rollback();
			out.println("第["+(i+1)+"]行出错！[规格/型号/品牌]为空");
			return;
		}

		double dj=0;
		double sl=0;
		double je=0;

		try {
			sl=Double.parseDouble(slStr[i]);
		}
		catch (Exception e) {
			conn.rollback();
			out.println("第["+(i+1)+"]行出错！[数量]不是数字:"+slStr[i]);
			return;
		}
		try {
			dj=Double.parseDouble(djStr[i]);
		}
		catch (Exception e) {
			conn.rollback();
			out.println("第["+(i+1)+"]行出错！[单价]不是数字:"+djStr[i]);
			return;
		}
		try {
			je=Double.parseDouble(jeStr[i]);
		}
		catch (Exception e) {
			conn.rollback();
			out.println("第["+(i+1)+"]行出错！[金额]不是数字:"+jeStr[i]);
			return;
		}

		ls_sql="insert into bj_zcbjmx (xh,khbh,zcmc,jldwbm,dj,sl,je,bz) values("+(xh+i)+",'"+khbh+"','"+cf.GB2Uni(zcmc[i])+"','"+cf.GB2Uni(jldwbm[i])+"','"+dj+"','"+sl+"','"+je+"','"+cf.GB2Uni(bz[i])+"') ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	}


	//初始化
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	//更新其它收费项目，调整收费百分比
	dzbj.updateSfxm(conn,khbh,"hmy");
	//获取电子报价金额
	double dzbjze=dzbj.getAllBjje(conn,khbh,"hmy");


	//修改：电子报价总额
	ls_sql="update crm_zxkhxx set dzbjze=?,sfzdzbj='Y'";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
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
	out.print("Exception: " + e);
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