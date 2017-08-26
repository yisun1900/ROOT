<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String hflxbm=null;
String[] dxpjzbbm=request.getParameterValues("dxpjzbbm");
hflxbm=cf.GB2Uni(request.getParameter("hflxbm"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="delete from hdm_hfxxsz ";
	ls_sql+=" where hflxbm='"+hflxbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (dxpjzbbm!=null)
	{
		for (int i=0;i<dxpjzbbm.length ;i++ )
		{
			ls_sql="insert into hdm_hfxxsz ( hflxbm,dxpjzbbm ) ";
			ls_sql+=" values ( ?,?) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,hflxbm);
			ps.setString(2,dxpjzbbm[i]);
			ps.executeUpdate();
			ps.close();
		}
	}

	
	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	out.print("<BR>����ʧ��,��������: " + e);
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