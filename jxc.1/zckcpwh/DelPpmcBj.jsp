<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=cf.GB2Uni(cf.getParameter(request,"dqbm"));
String cldlbm=cf.GB2Uni(cf.getParameter(request,"cldlbm"));
String ppmc=cf.GB2Uni(cf.getParameter(request,"ppmc"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	String clbm=null;
	ls_sql =" select jxc_clbm.clbm";
	ls_sql+=" from jxc_clbm,jxc_cljgb";
	ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm and jxc_cljgb.dqbm='"+dqbm+"' and jxc_clbm.cldlbm='"+cldlbm+"' and jxc_clbm.ppmc='"+ppmc+"'";
    ls_sql+=" and jxc_cljgb.xsfs in('2','3')";//1：代销品；2：现货销售；3：期货销售；4：虚拟出入库
    ls_sql+=" and jxc_clbm.cllb='0'";//0：主材；1：辅材
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		clbm=rs.getString("clbm");

		ls_sql="delete from  jxc_cljgb ";
		ls_sql+=" where dqbm='"+dqbm+"' and clbm='"+clbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="delete from  jxc_clbm ";
		ls_sql+=" where clbm='"+clbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

	}
	rs.close();
	ps.close();

	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>