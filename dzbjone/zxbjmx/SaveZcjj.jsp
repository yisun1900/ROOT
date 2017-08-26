<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
String tcsjflbm=cf.GB2Uni(request.getParameter("tcsjflbm"));

String khbjjbbm=cf.GB2Uni(request.getParameter("khbjjbbm"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));

Connection conn  = null;
ResultSet rs=null;
PreparedStatement ps=null;
String ls_sql=null;

try {
	conn=cf.getConnection();


	String getzxzt=null;//0：未分配店面；1: 分配店面；2: 店面退回客户；3：已签约；4：公司签单失败；5：重新分配店面
	ls_sql="SELECT zxzt";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
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

	ls_sql=" delete from  bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
    ls_sql+=" and tccplbbm in(select tccplbbm from bj_khzcxmxj where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//客户品牌升级差价表（bj_khppsjcjb）
	ls_sql=" delete from bj_khppsjcjb "; 
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
    ls_sql+=" and tccplbbm in(select tccplbbm from bj_khzcxmxj where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql=" update  bj_khzcxmxj set bjjbbm='"+bjjbbm+"',sjsfycx='1'";//1：无促销；2：无数量限制促销；3：有数量限制促销
	ls_sql+=" ,sjsl=0,sjjshsl=0,sjsfsl=0,sjcj=0,sjsfje=0";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"'";
	ps= conn.prepareStatement(ls_sql);
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>