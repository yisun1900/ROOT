<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");

String dqbm=request.getParameter("dqbm");

String[] cldlbm=request.getParameterValues("cldlbm");
String[] wlllbz=request.getParameterValues("wlllbz");
String[] wlbm=request.getParameterValues("wlbm");
String[] glmc=request.getParameterValues("glmc");
String[] xhgg=request.getParameterValues("xhgg");
String[] pp=request.getParameterValues("pp");
String[] jldwbm=request.getParameterValues("jldwbm");
String[] djstr=request.getParameterValues("dj");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double dj=0;

try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);


	for (int i=0;i<wlbm.length ;i++ )
	{
		//[工料分类]是否为空
		if (cldlbm[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[工料分类]为空");
			return;
		}
		//[物料编码]是否为空
		if (wlllbz[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！序号["+(i+1)+"]的[需到物流领料]为空");
			return;
		}
		//[物料编码]是否为空
		if (wlbm[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！序号["+(i+1)+"]的[物料编码]为空");
			return;
		}

		//[工料名称]是否为空
		if (glmc[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[工料名称]为空");
			return;
		}
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
		dj=0;
		try{
			dj=java.lang.Double.parseDouble(djstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>存盘失败！工料名称为["+cf.GB2Uni(glmc[i])+"]的[单价]输入不正确:"+djstr[i].trim());
			return;
		}

		//家装工料分析表
		ls_sql="insert into bj_jscljgb(dqbm,cldlbm,wlbm,glmc,pp,xhgg,jldwbm,dj,lrr,lrsj,wlllbz)";
		ls_sql+=" values('"+dqbm+"','"+cldlbm[i]+"','"+cf.GB2Uni(wlbm[i])+"','"+cf.GB2Uni(glmc[i])+"','"+cf.GB2Uni(pp[i])+"','"+cf.GB2Uni(xhgg[i])+"','"+jldwbm[i]+"',"+dj+",'"+yhmc+"',TRUNC(SYSDATE),'"+wlllbz[i]+"')";
		ps= conn.prepareStatement(ls_sql);
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
	out.print("Exception: " + e);
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