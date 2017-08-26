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


	ls_sql="alter table jc_jjzjx add (pdgc char(5) null,pdgcmc VARCHAR2(50) NULL,jjgys VARCHAR2(50) NULL,jjppmc VARCHAR2(50) NULL,xcmgc char(5) null,xcmgcmc VARCHAR2(50) NULL,xcmgys VARCHAR2(50) NULL,xcmppmc VARCHAR2(50) NULL,clgw VARCHAR2(20) NULL,ztjjgw VARCHAR2(20) NULL,xmzy VARCHAR2(20) NULL,jjsjs VARCHAR2(20) NULL,lsclzt CHAR(2) NULL )";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="update jc_jjzjx set pdgc=(select pdgc from jc_jjdd where jc_jjzjx.ddbh=jc_jjdd.ddbh)";
	ls_sql+=",pdgcmc=(select pdgcmc from jc_jjdd where jc_jjzjx.ddbh=jc_jjdd.ddbh)";
	ls_sql+=",jjgys=(select jjgys from jc_jjdd where jc_jjzjx.ddbh=jc_jjdd.ddbh)";
	ls_sql+=",jjppmc=(select jjppmc from jc_jjdd where jc_jjzjx.ddbh=jc_jjdd.ddbh)";
	ls_sql+=",xcmgc=(select xcmgc from jc_jjdd where jc_jjzjx.ddbh=jc_jjdd.ddbh)";
	ls_sql+=",xcmgcmc=(select xcmgcmc from jc_jjdd where jc_jjzjx.ddbh=jc_jjdd.ddbh)";
	ls_sql+=",xcmgys=(select xcmgys from jc_jjdd where jc_jjzjx.ddbh=jc_jjdd.ddbh)";
	ls_sql+=",xcmppmc=(select xcmppmc from jc_jjdd where jc_jjzjx.ddbh=jc_jjdd.ddbh)";
	ls_sql+=",clgw=(select clgw from jc_jjdd where jc_jjzjx.ddbh=jc_jjdd.ddbh)";
	ls_sql+=",ztjjgw=(select ztjjgw from jc_jjdd where jc_jjzjx.ddbh=jc_jjdd.ddbh)";
	ls_sql+=",xmzy=(select xmzy from jc_jjdd where jc_jjzjx.ddbh=jc_jjdd.ddbh)";
	ls_sql+=",jjsjs=(select jjsjs from jc_jjdd where jc_jjzjx.ddbh=jc_jjdd.ddbh)";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_jjzjx set clzt='99'";
	ls_sql+=" where ddbh in(select ddbh from jc_jjdd where clzt='99')";
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