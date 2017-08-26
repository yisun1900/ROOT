<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");


String zjxxh=request.getParameter("zjxxh");
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


	for (int i=0;i<cpbm.length ;i++ )
	{
		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khcltcmxh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and tcmc='"+tcmc+"' and jgwzbm='"+jgwzbm+"' and cpbm='"+cpbm[i]+"'";
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

		ls_sql="insert into bj_khcltcmxh (zjxxh,khbh,cpmc,cpbm,dqbm,tcmc,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj   ,lx,bz,sfbpx)  ";
		ls_sql+=" select                  ?    ,?   ,cpmc,cpbm,dqbm,tcmc,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,0 ,''    ,?  ,SYSDATE,? ,bz,'Y'";
		ls_sql+=" FROM bj_cltczcmx";
		ls_sql+=" where cpbm='"+cpbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,zjxxh);
		ps.setString(2,khbh);
		ps.setString(3,yhmc);
		ps.setString(4,lx);//1：温暖套餐；2：静音套餐
		ps.executeUpdate();
		ps.close();
	}

	double bzsl=0;
	ls_sql="SELECT bzsl";
	ls_sql+=" FROM bj_khcltcfjslh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and tcmc='"+tcmc+"' and jgwzbm='"+jgwzbm+"'";
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
	ls_sql+=" FROM bj_khcltcmxh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and tcmc='"+tcmc+"' and jgwzbm='"+jgwzbm+"'";
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