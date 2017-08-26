<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String azsjbz=cf.GB2Uni(request.getParameter("azsjbz"));
String kazsjlrr=cf.GB2Uni(request.getParameter("kazsjlrr"));
String kazsjstr=request.getParameter("kazsj");
java.sql.Date kazsj=null;
ls=request.getParameter("kazsj");
try{
	if (!(ls.equals("")))  kazsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kazsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[协商安装时间]类型转换发生意外:"+e);
	return;
}
java.sql.Date lrsj=null;
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}

String ddbh=request.getParameter("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String clzt=null;
String pdgc=null;
String khbh=null;

try {
	conn=cf.getConnection();

	ls_sql="select clzt,khbh,pdgc";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
		pdgc=rs.getString("pdgc");
		khbh=rs.getString("khbh");
	}
	rs.close();
	ps.close();
	if (!clzt.equals("25"))
	{
		out.println("！错误，处理状态不正确");
		return;
	}

	
	int mrazhs=0;
	ls_sql="select mrazhs";
	ls_sql+=" from  sq_gysxx";
	ls_sql+=" where  gysbh='"+pdgc+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mrazhs=rs.getInt("mrazhs");
	}
	rs.close();
	ps.close();

	if (mrazhs!=0)
	{
		int ydhs=0;
		ls_sql="select count(*)";
		ls_sql+=" from  jc_jjdd";
		ls_sql+=" where  pdgc='"+pdgc+"'  and clzt not in('33','35','98','99') and kazsj=TO_DATE('"+kazsjstr+"','YYYY-MM-DD')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			ydhs=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (ydhs+1>mrazhs)
		{
			out.println("！错误，超过每日安装限制，户数限制："+mrazhs+"户，目前已约定："+ydhs+"户");
			return;
		}
	}

	int count=0;
	ls_sql =" select count(*)";
	ls_sql+=" from jc_jjazsjjl";
	ls_sql+=" where ddbh='"+ddbh+"' and kazsj=?";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,kazsj);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	if (count>0)
	{
		ls_sql="update jc_jjazsjjl set lrsj=?,lrr=?,bz=?";
		ls_sql+=" where ddbh='"+ddbh+"' and kazsj=?";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,lrsj);
		ps.setString(2,kazsjlrr);
		ps.setString(3,azsjbz);
		ps.setDate(4,kazsj);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql="insert into jc_jjazsjjl (ddbh,kazsj,khbh,lrsj,lrr,bz)";
		ls_sql+=" values(?,?,?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ddbh);
		ps.setDate(2,kazsj);
		ps.setString(3,khbh);
		ps.setDate(4,lrsj);
		ps.setString(5,kazsjlrr);
		ps.setString(6,azsjbz);
		ps.executeUpdate();
		ps.close();
	}


	ls_sql="update jc_jjdd set kazsj=?,kazsjlrr=?,azsjbz=?,clzt='27'";
	ls_sql+=" where  ddbh='"+ddbh+"' and clzt='25'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,kazsj);
	ps.setString(2,kazsjlrr);
	ps.setString(3,azsjbz);
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