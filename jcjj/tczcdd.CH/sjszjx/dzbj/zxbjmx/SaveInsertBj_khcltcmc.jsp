<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");


String zjxxh=request.getParameter("zjxxh");
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String tcmc=cf.GB2Uni(cf.getParameter(request,"tcmc"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String hxbm=cf.GB2Uni(request.getParameter("hxbm"));
String lx=cf.GB2Uni(request.getParameter("lx"));

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

	int count=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM bj_khcltcmch";
    ls_sql+=" where zjxxh='"+zjxxh+"' and tcmc='"+tcmc+"' and lx='"+lx+"'";//1：温暖套餐；2：静音套餐
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
		out.println("错误！已选择");
		return;
	}

	count=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM bj_khcltcmch";
		ls_sql+=" where zjxxh='"+zjxxh+"' and lx='"+lx+"' and zjlx!='3'";//1：原套餐；3：删除套餐；4：新增套餐
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
		out.println("错误！只能选择一个");
		return;
	}

	String zcsfxxz="";
	ls_sql="SELECT zcsfxxz";
	ls_sql+=" FROM bj_cltcmc";
    ls_sql+=" where dqbm='"+dqbm+"' and hxbm='"+hxbm+"' and tcmc='"+tcmc+"'";
    ls_sql+=" and bj_cltcmc.lx='"+lx+"'";//1：温暖套餐；2：静音套餐
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcsfxxz=rs.getString("zcsfxxz");
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="delete from bj_khcltcmch ";
    ls_sql+=" where zjxxh='"+zjxxh+"' and tcmc='"+tcmc+"' and lx='"+lx+"'";//1：温暖套餐；2：静音套餐
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khcltcfjslh ";
    ls_sql+=" where zjxxh='"+zjxxh+"' and tcmc='"+tcmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khcltcmxh ";
    ls_sql+=" where zjxxh='"+zjxxh+"' and tcmc='"+tcmc+"' and lx='"+lx+"'";//1：温暖套餐；2：静音套餐
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_khcltcmch ( zjxxh,khbh,dqbm,hxbm,tcmc,tcjg,zcsfxxz,lx,zjlx) ";
	ls_sql+=" select                   ?    ,?   ,dqbm,hxbm,tcmc,tcjg,zcsfxxz,lx,'4'";//1：原套餐；3：删除套餐；4：新增套餐
	ls_sql+=" FROM bj_cltcmc";
    ls_sql+=" where dqbm='"+dqbm+"' and hxbm='"+hxbm+"' and tcmc='"+tcmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zjxxh);
	ps.setString(2,khbh);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_khcltcfjslh ( zjxxh,khbh,dqbm,hxbm,tcmc,jgwzbm,bzsl,sl) ";
	ls_sql+=" select                     ?    ,?   ,dqbm,hxbm,tcmc,jgwzbm,sl  ,0";
	ls_sql+=" FROM bj_cltcfjsl";
    ls_sql+=" where dqbm='"+dqbm+"' and hxbm='"+hxbm+"' and tcmc='"+tcmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zjxxh);
	ps.setString(2,khbh);
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