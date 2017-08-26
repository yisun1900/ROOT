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

	ls_sql="alter table jc_mmzjx add (pdgc char(5) null,pdgcmc VARCHAR2(50) NULL,gys VARCHAR2(50) NULL,ppmc VARCHAR2(50) NULL,clgw VARCHAR2(20) NULL,ztjjgw VARCHAR2(20) NULL,xmzy VARCHAR2(20) NULL,mmcljs VARCHAR2(20) NULL )";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_mmzjx set pdgc=(select pdgc from jc_mmydd where jc_mmzjx.yddbh=jc_mmydd.yddbh)";
	ls_sql+=",pdgcmc=(select pdgcmc from jc_mmydd where jc_mmzjx.yddbh=jc_mmydd.yddbh)";
	ls_sql+=",gys=(select gys from jc_mmydd where jc_mmzjx.yddbh=jc_mmydd.yddbh)";
	ls_sql+=",ppmc=(select ppmc from jc_mmydd where jc_mmzjx.yddbh=jc_mmydd.yddbh)";
	ls_sql+=",clgw=(select clgw from jc_mmydd where jc_mmzjx.yddbh=jc_mmydd.yddbh)";
	ls_sql+=",ztjjgw=(select ztjjgw from jc_mmydd where jc_mmzjx.yddbh=jc_mmydd.yddbh)";
	ls_sql+=",xmzy=(select xmzy from jc_mmydd where jc_mmzjx.yddbh=jc_mmydd.yddbh)";
	ls_sql+=",mmcljs=(select mmcljs from jc_mmydd where jc_mmzjx.yddbh=jc_mmydd.yddbh)";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_mmzjx set clzt='99'";
	ls_sql+=" where yddbh in(select yddbh from jc_mmydd where clzt='99')";
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