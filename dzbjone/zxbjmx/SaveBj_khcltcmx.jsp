<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String row=request.getParameter("row");


String khbh=cf.GB2Uni(request.getParameter("khbh"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String tcmc=cf.GB2Uni(request.getParameter("tcmc"));
String hxbm=cf.GB2Uni(request.getParameter("hxbm"));
String lx=request.getParameter("lx");


String[] cpmcs=request.getParameterValues("cpmc");
String[] jgwzbms=request.getParameterValues("jgwzbm");

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
			out.println("错误！["+cf.GB2Uni(jgwzbms[i-1])+"]["+cf.GB2Uni(cpmcs[i-1])+"]未选择任何项目");
			return;
		}

		int cpsl=0;
		ls_sql="SELECT cpsl";
		ls_sql+=" FROM bj_khcltcmx";
		ls_sql+=" where khbh='"+khbh+"' and tcmc='"+tcmc+"' and jgwzbm='"+cf.GB2Uni(jgwzbms[i-1])+"' and cpmc='"+cf.GB2Uni(cpmcs[i-1])+"'";
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

		ls_sql="delete from bj_khcltcmx ";
		ls_sql+=" where khbh='"+khbh+"' and tcmc='"+tcmc+"' and jgwzbm='"+cf.GB2Uni(jgwzbms[i-1])+"' and cpmc='"+cf.GB2Uni(cpmcs[i-1])+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_khcltcmx (khbh,cpmc,cpsl    ,cpbm,dqbm,hxbm,tcmc,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj   ,lx,bz)  ";
		ls_sql+=" select                    ?,cpmc,"+cpsl+",cpbm,dqbm,hxbm,tcmc,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,''    ,?  ,SYSDATE,? ,bz";
		ls_sql+=" FROM bj_cltczcmx";
		ls_sql+=" where dqbm='"+dqbm+"' and hxbm='"+hxbm+"' and tcmc='"+tcmc+"' and cpbm='"+cpbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,yhmc);
		ps.setString(3,lx);//1：温暖套餐；2：静音套餐
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