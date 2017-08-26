<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=request.getParameter("dqbm");
String khbh=cf.GB2Uni(request.getParameter("khbh"));

String[] zcmc=request.getParameterValues("zcmc");
String[] jldwbm=request.getParameterValues("jldwbm");
String[] djstr=request.getParameterValues("dj");
String[] slstr=request.getParameterValues("sl");
String[] bz=request.getParameterValues("bz");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double dj=0;
double sl=0;
double je=0;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<zcmc.length ;i++ )
	{
		//[计量单位]是否为空
		if (jldwbm[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[计量单位]为空");
			return;
		}
		//[单价]是否为空
		if (djstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[单价]为空");
			return;
		}
		//[消耗量]是否为空
		if (slstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[数量]为空");
			return;
		}

		sl=0;
		try{
			sl=java.lang.Double.parseDouble(slstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>存盘失败！[单价]输入不正确:"+slstr[i].trim());
			return;
		}
		dj=0;
		try{
			dj=java.lang.Double.parseDouble(djstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>存盘失败！[单价]输入不正确:"+djstr[i].trim());
			return;
		}

		je=cf.doubleTrim(dj*sl);
		
		long xh=0;
		ls_sql="select NVL(max(TO_NUMBER(xh)),0)";
		ls_sql+=" from  bj_zcbjmx";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xh=rs.getLong(1);
		}
		rs.close();
		ps.close();

		xh++;

		//家装工料分析表
		ls_sql="insert into bj_zcbjmx(xh,khbh,zcmc,jldwbm,sl,dj,je,bz)";
		ls_sql+=" values("+xh+",'"+khbh+"','"+cf.GB2Uni(zcmc[i])+"','"+cf.GB2Uni(jldwbm[i])+"',"+sl+","+dj+","+je+",'"+cf.GB2Uni(bz[i])+"')";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	
	}

	double zcbjje=0;
	ls_sql="SELECT sum(je)";
	ls_sql+=" FROM bj_zcbjmx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcbjje=rs.getDouble(1);
	}
	rs.close();
	ps.close();
		
	//修改：电子报价总额
	ls_sql="update crm_zxkhxx set zcbjje=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zcbjje);
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