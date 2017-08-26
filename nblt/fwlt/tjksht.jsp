<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
int lch=0;
int ygbh=0;
String sfnmt=null;
String bkbh=null;
String tzbh=cf.GB2Uni(request.getParameter("tzbh"));
String hfnr=cf.GB2Uni(request.getParameter("hfnr"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	conn.setAutoCommit(false);
	//查询员工编号
	ls_sql=" select ygbh ";
	ls_sql+=" from sq_yhxx ";
	ls_sql+=" where yhdlm='"+yhdlm+"' ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ygbh=rs.getInt("ygbh");
	}
	rs.close();
	ps.close();
	//生成编号
	ls_sql=" select NVL(max(lch),0)+1 lch ";
	ls_sql+=" from nblt_hfgl ";
	ls_sql+=" where tzbh='"+tzbh+"' ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		lch=rs.getInt("lch");
	}
	rs.close();
	ps.close();
	if (lch<=0)
	{lch=1;}
	//查询板块编号
	ls_sql=" select bkbh ";
	ls_sql+=" from nblt_ftgl ";
	ls_sql+=" where tzbh='"+tzbh+"' ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		bkbh=rs.getString("bkbh");
	}
	rs.close();
	ps.close();
	//查询是否匿名帖
	ls_sql=" select sfnmt ";
	ls_sql+=" from nblt_bkgl ";
	ls_sql+=" where bkbh='"+bkbh+"' ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		sfnmt=rs.getString("sfnmt");
	}
	rs.close();
	ps.close();
	if (sfnmt.equals("Y"))
	{
		ygbh=1;
	}

	////更新帖子的回复数
	ls_sql="update nblt_ftgl set hfcs=hfcs+1,zhhfr=?,zhhfsj=sysdate ";
	ls_sql+=" where tzbh='"+tzbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,ygbh);
	ps.executeUpdate();
	ps.close();

	////更新帖子的回复数
	ls_sql="update nblt_bkgl set hfs=hfs+1 ";
	ls_sql+=" where bkbh='"+bkbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into nblt_hfgl ( tzbh,lch,hfr,hfsj,zhxgsj,hfnr,yhfnr ) ";
	ls_sql+=" values ( ?,?,?,SYSDATE,SYSDATE,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tzbh);
	ps.setInt(2,lch);
	ps.setInt(3,ygbh);
	ps.setString(4,hfnr);
	ps.setString(5,hfnr);
	if (ps.executeUpdate()!=1)
	{
		conn.rollback();
		out.println("<BR>存盘失败！");
		return;
	}
	else
	{	}
	if (ps!= null) ps.close(); 
	conn.commit();
	%>
		<SCRIPT language=javascript >
		<!--
		alert("回复成功！");
		window.location.href="cktz.jsp?tzbh=<%=tzbh%>&yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>&ys=1";
//		window.close();
		//-->
		</SCRIPT>
		<br><a href="cktz.jsp?tzbh=<%=tzbh%>&yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>">如果您的的浏览器没有自动跳转，请点击这里！</a>
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>