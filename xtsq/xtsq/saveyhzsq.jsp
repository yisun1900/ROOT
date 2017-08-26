<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='010401'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[用户组授权]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
%>
<%

String ls=null;
String cdbh="";
String yhzbh=cf.GB2Uni(request.getParameter("yhzbh"));


Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="delete from sq_yhzqx where yhzbh='"+yhzbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	java.util.Enumeration paramName=null;
	paramName=request.getParameterNames();

	while (paramName.hasMoreElements())
	{
		ls=(String)paramName.nextElement() ;
		ls=request.getParameter(ls);
		if (ls.startsWith("cdbh"))
		{
			cdbh=ls.substring(4);

			ls_sql="insert into sq_yhzqx ( yhzbh,cdbh) ";
			ls_sql+=" values( '"+yhzbh+"','"+cdbh+"')";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}

	conn.commit();

	out.print("存盘成功");
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>