<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long gysbm=0;
String gysmc=null;
ls=request.getParameter("gysbm");
try{
	if (!(ls.equals("")))  gysbm=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gysbm不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[供应商编码]类型转换发生意外:"+e);
	return;
}
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));

String whereppbm=null;
String wheregysbm=null;
whereppbm=cf.GB2Uni(request.getParameter("whereppbm"));
wheregysbm=cf.GB2Uni(request.getParameter("wheregysbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String cllx=null;
	ls_sql="select gysmc,cllx ";
	ls_sql+=" from  jxc_gysxx";
	ls_sql+=" where gysbm='"+gysbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gysmc=rs.getString("gysmc");
		cllx=rs.getString("cllx");
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="delete from jxc_ppgysdzb ";
	ls_sql+=" where  (ppbm="+whereppbm+") and  (gysbm!="+wheregysbm+") and  (ssfgs='"+ssfgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="update jxc_ppgysdzb set gysbm=?,gysmc=?,cllx=?";
	ls_sql+=" where  (ppbm="+whereppbm+") and  (gysbm="+wheregysbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,gysbm);
	ps.setString(2,gysmc);
	ps.setString(3,cllx);
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
	out.print("<BR>出错:" + e);
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