<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='010404'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[用户额外权限维护]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
%>
<%

String lsname=null;
String lsvalue=null;
String cdbh="";
String yhdlm=null;
String qxlx=null;
java.util.Enumeration paramName=null;
paramName=request.getParameterNames();
while (paramName.hasMoreElements())
{
	lsname=(String)paramName.nextElement() ;
	lsvalue=request.getParameter(lsname);
//	out.println("<br>lsvalue="+lsvalue);
	if (lsvalue.startsWith("cdbh"))
	{
		cdbh+=",'"+lsvalue.substring(4)+"'";
	}
	else if (lsname.equals("yhdlm"))
	{
		yhdlm=lsvalue;
	}
	else if (lsname.equals("qxlx"))
	{
		qxlx=lsvalue;
	}
}
/*
*/
if (cdbh.equals(""))
{
	cdbh="('')";
}
else{
	cdbh="("+cdbh.substring(1)+")";
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select count(*) from sq_yhxx where yhdlm='"+yhdlm+"'";
	ps=conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	int count=0;
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	if (count<1)
	{
		out.println("没有此用户");
		return;
	}
	rs.close();
	ps.close();

	
	ls_sql="delete from sq_yhewqx where yhdlm='"+yhdlm+"' and qxlx='"+qxlx+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into sq_yhewqx ( yhdlm,cdbh,qxlx) ";
	ls_sql+="select '"+yhdlm+"',cdbh,'"+qxlx+"' from sq_cd where cdbh in "+cdbh;
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	out.print("存盘成功");
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>