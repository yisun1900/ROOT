<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String row=request.getParameter("row");
String tcbm=request.getParameter("tcbm");
String khbh=request.getParameter("khbh");
String[] cpmcs=request.getParameterValues("cpmc");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String getzxzt=null;//0：未分配店面；1: 分配店面；2: 店面退回客户；3：已签约；4：公司签单失败；5：重新分配店面
	String getbjjb="";
	ls_sql="SELECT zxzt,bjjb";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
		getbjjb=rs.getString("bjjb");
	}
	rs.close();
	ps.close();
	if (getzxzt.equals("3"))
	{
		int czbzsq=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM cw_czbjsqjl";
		ls_sql+=" where khbh='"+khbh+"' and wcbz='1'";//1：未完成；2：完成；3：业绩结转
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			czbzsq=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (czbzsq==0)
		{
			out.println("错误！客户已签单，不能再修改报价");
			return;
		}
	}
	else if (getzxzt.equals("2") || getzxzt.equals("4"))
	{
		out.println("错误！客户签单失败，不能再修改报价");
		return;
	}

	conn.setAutoCommit(false);

	for (int i=1;i<=Integer.parseInt(row) ;i++ )
	{
		String cpbm=request.getParameter("cpbm"+i);

		if (cpbm==null)
		{
			conn.rollback();
			out.println("错误！["+cf.GB2Uni(cpmcs[i-1])+"]未选择任何项目");
			return;
		}

		int cpsl=0;
		ls_sql="SELECT cpsl";
		ls_sql+=" FROM bj_khzctcmx";
		ls_sql+=" where khbh='"+khbh+"' and tcbm='"+tcbm+"' and cpmc='"+cf.GB2Uni(cpmcs[i-1])+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			cpsl=rs.getInt("cpsl");
		}
		rs.close();
		ps.close();

		if (cpsl==0)
		{
			conn.rollback();
			out.println("错误！["+cf.GB2Uni(cpmcs[i-1])+"]已被删除");
			return;
		}

		ls_sql="delete from bj_khzctcmx ";
		ls_sql+=" where khbh='"+khbh+"' and tcbm='"+tcbm+"' and cpmc='"+cf.GB2Uni(cpmcs[i-1])+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_khzctcmx (khbh,cpmc,cpsl    ,cpbm,tcbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,lrr       ,lrsj   ,bz,lx)";
		ls_sql+=" select           '"+khbh+"',cpmc,"+cpsl+",cpbm,tcbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,'"+yhmc+"',SYSDATE,bz,'1'";//1：家具套餐；2：健康计划
		ls_sql+=" FROM bj_zctcmx  ";
		ls_sql+=" where tcbm='"+tcbm+"' and cpbm='"+cpbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	double tcj=0;
	ls_sql="SELECT tcj";
	ls_sql+=" FROM bj_khzctcmc";
	ls_sql+=" where khbh='"+khbh+"' and tcbm='"+tcbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcj=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double tcmxj=0;
	ls_sql="SELECT sum(ROUND(tcdj*sl,2))";
	ls_sql+=" FROM bj_khzctcmx";
	ls_sql+=" where khbh='"+khbh+"' and tcbm='"+tcbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcmxj=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (tcj!=tcmxj)
	{
		conn.rollback();
		out.println("错误！套餐总价["+tcj+"]不等于明细之和["+tcmxj+"]");
		return;
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