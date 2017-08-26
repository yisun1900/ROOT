<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String ygdjsjd=null;
	ls_sql="select gdjsjd";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ygdjsjd=cf.fillNull(rs.getString("gdjsjd"));
	}
	rs.close();
	ps.close();

	String nextzt="";//下一个结算进度编码
	int bfcs=0;//拨付次数
	ls_sql="select nextzt,bfcs";
	ls_sql+=" from dm_gdjsjd";
	ls_sql+=" where gdjsjd='"+ygdjsjd+"' and ztlx='1'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		nextzt=cf.fillNull(rs.getString("nextzt"));//下一个结算进度编码
		bfcs=rs.getInt("bfcs");//拨付次数
	}
	rs.close();
	ps.close();

	if (!nextzt.equals("X"))//X	可以完工结算
	{
		out.println("<BR>！！！错误，结算进度不正确");
		return;
	}


	conn.setAutoCommit(false);

	ls_sql="update crm_khxx set gdjsjd='"+nextzt+"'";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from cw_sgdjssqjl ";
	ls_sql+=" where  khbh='"+khbh+"' and gdjsjd='"+nextzt+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	String sqr=(String)session.getAttribute("yhmc");
	String sqbm=(String)session.getAttribute("dwbh");

	ls_sql =" insert into cw_sgdjssqjl (khbh      ,gdjsjd      ,ygdjsjd      ,sqr      ,sqsj   ,sqbm      ,zt ,bz) ";
	ls_sql+="                    values('"+khbh+"','"+nextzt+"','"+ygdjsjd+"','"+sqr+"',SYSDATE,'"+sqbm+"','1','')";
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>