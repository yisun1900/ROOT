<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="alter table jc_mmbjb add (dqbm char(2) null,lrr varchar2(20) null,lrsj date null,lrbm char(5) null,tlmpmdj NUMBER(16,2) null)";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_mmbjb set dqbm='01',lrr='0',lrsj=TO_DATE('2000-01-01','YYYY-MM-DD'),lrbm='FBJ00',tlmpmdj=0";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="alter table jc_mmbjb modify (dqbm char(2) not null,lrr varchar2(20) not null,lrsj date not null,lrbm char(5) not null,tlmpmdj NUMBER(16,2) not null)";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();



	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
//	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
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