<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String gcysbbh=cf.GB2Uni(request.getParameter("gcysbbh"));
String gcysbbhnew=cf.GB2Uni(request.getParameter("gcysbbhnew"));


Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql =" insert into dm_heysxm (gcysbbh,gcysxmbm,gcysxmmc,ysxmflbm,dygcjdbm,sfsgjdb,jdbm,sfhf,hflxbm,ljskbfb,yszxsl,byxsl,fbyxzxsl,ysbzsm,bz,yssx)";
	ls_sql+=" select                       ?,gcysxmbm,gcysxmmc,ysxmflbm,dygcjdbm,sfsgjdb,jdbm,sfhf,hflxbm,ljskbfb,yszxsl,byxsl,fbyxzxsl,ysbzsm,bz,yssx";
	ls_sql+=" from dm_heysxm";
	ls_sql+=" where gcysbbh='"+gcysbbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gcysbbhnew);
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("复制成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>