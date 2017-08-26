<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");


String lx=cf.GB2Uni(request.getParameter("lx"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String tcmc=cf.GB2Uni(cf.getParameter(request,"tcmc"));
String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));
String[] cpbm=request.getParameterValues("cpbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
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


	for (int i=0;i<cpbm.length ;i++ )
	{
		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khcltcmx";
		ls_sql+=" where khbh='"+khbh+"' and tcmc='"+tcmc+"' and jgwzbm='"+jgwzbm+"' and cpbm='"+cpbm[i]+"'";
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
			out.println("错误！已选择:"+cpbm[i]);
			return;
		}

		ls_sql="insert into bj_khcltcmx (khbh,cpmc,cpbm,dqbm,tcmc,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj   ,lx,bz)  ";
		ls_sql+=" select                    ?,cpmc,cpbm,dqbm,tcmc,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,0 ,''    ,?  ,SYSDATE,? ,bz";
		ls_sql+=" FROM bj_cltczcmx";
		ls_sql+=" where cpbm='"+cpbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,yhmc);
		ps.setString(3,lx);//1：温暖套餐；2：静音套餐
		ps.executeUpdate();
		ps.close();
	}

	double bzsl=0;
	ls_sql="SELECT bzsl";
	ls_sql+=" FROM bj_khcltcfjsl";
	ls_sql+=" where khbh='"+khbh+"' and tcmc='"+tcmc+"' and jgwzbm='"+jgwzbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bzsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double cpsl=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM bj_khcltcmx";
	ls_sql+=" where khbh='"+khbh+"' and tcmc='"+tcmc+"' and jgwzbm='"+jgwzbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cpsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	if (cpsl>bzsl)
	{
		conn.rollback();
		out.println("错误！选择超过数量限制："+bzsl);
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>