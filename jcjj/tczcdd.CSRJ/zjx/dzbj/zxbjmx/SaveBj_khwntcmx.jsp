<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String row=request.getParameter("row");


String zjxxh=request.getParameter("zjxxh");
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String tcmc=cf.GB2Uni(request.getParameter("tcmc"));
String hxbm=cf.GB2Uni(request.getParameter("hxbm"));
String lx=request.getParameter("lx");


String[] cpmcs=request.getParameterValues("cpmc");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String sfwc="";
	ls_sql="select sfwc";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N：未完成；Y：完成
	{
		out.println("错误！增减项已完成，不能再修改");
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
		ls_sql+=" FROM bj_khwntcmxh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and tcmc='"+tcmc+"' and cpmc='"+cf.GB2Uni(cpmcs[i-1])+"'";
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

		ls_sql="delete from bj_khwntcmxh ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and tcmc='"+tcmc+"' and cpmc='"+cf.GB2Uni(cpmcs[i-1])+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_khwntcmxh (zjxxh,khbh,cpmc,cpsl    ,cpbm,dqbm,hxbm,tcmc,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj   ,lx,bz,sfbpx)  ";
		ls_sql+=" select                  ?    ,?   ,cpmc,"+cpsl+",cpbm,dqbm,hxbm,tcmc,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,''    ,?  ,SYSDATE,? ,bz,'Y'";
		ls_sql+=" FROM bj_wntczcmx";
		ls_sql+=" where dqbm='"+dqbm+"' and hxbm='"+hxbm+"' and tcmc='"+tcmc+"' and cpbm='"+cpbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,zjxxh);
		ps.setString(2,khbh);
		ps.setString(3,yhmc);
		ps.setString(4,lx);//1：温暖套餐；2：静音套餐
		ps.executeUpdate();
		ps.close();

	}

	double tcjg=0;
	ls_sql="SELECT tcjg";
	ls_sql+=" FROM bj_khwntcmch";
	ls_sql+=" where zjxxh='"+zjxxh+"' and tcmc='"+tcmc+"' and lx='"+lx+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcjg=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double tcmxj=0;
	ls_sql="SELECT sum(ROUND(tcdj*sl,2))";
	ls_sql+=" FROM bj_khwntcmxh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and tcmc='"+tcmc+"' and lx='"+lx+"'";
    ls_sql+=" and sfbpx='Y'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcmxj=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (tcjg!=tcmxj)
	{
		conn.rollback();
		out.println("错误！套餐总价["+tcjg+"]不等于明细之和["+tcmxj+"]");
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