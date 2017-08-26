<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String tcmc=cf.GB2Uni(request.getParameter("tcmc"));
String lx=request.getParameter("lx");

String[] slStr=request.getParameterValues("sl");
String[] cpbm=request.getParameterValues("cpbm");
String[] jgwzbm=request.getParameterValues("jgwzbm");

if (cpbm==null)
{
	return;
}

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

	for (int i=0;i<cpbm.length;i++ )
	{
		double sl=0;
		try {
			sl=Double.parseDouble(slStr[i].trim());
		}
		catch (Exception e) {
			conn.rollback();
			out.print("错误！输入非数字:" + slStr[i]);
			return;
		}

		ls_sql="update bj_khcltcmx set sl="+sl;
		ls_sql+=" where khbh='"+khbh+"' and tcmc='"+tcmc+"' and jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"' and cpbm='"+cf.GB2Uni(cpbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update bj_khcltcfjsl set sl=(select sum(sl) from bj_khcltcmx where khbh='"+khbh+"' and tcmc='"+tcmc+"' and jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"')";
		ls_sql+=" where khbh='"+khbh+"' and tcmc='"+tcmc+"' and jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khcltcfjsl";
		ls_sql+=" where khbh='"+khbh+"' and tcmc='"+tcmc+"' and jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"' and sl>bzsl";
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
			conn.rollback();
			out.println("错误！["+cf.GB2Uni(jgwzbm[i])+"]大于标准数量");
			return;
		}
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