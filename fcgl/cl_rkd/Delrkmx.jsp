<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String rkph=cf.GB2Uni(request.getParameter("rkph"));
String clbm=cf.GB2Uni(request.getParameter("clbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double rkzsl = 0;
double rkzje = 0;
try {
	conn=cf.getConnection();
	ls_sql="delete from cl_rkmx ";
	ls_sql+=" where (rkph='"+rkph+"') and clbm='"+clbm+"'  ";
	ps= conn.prepareStatement(ls_sql);   
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>ɾ�������ϸʧ�ܣ�");
		return;
	}
//==========================================��ѯ���������=====================================================
	ls_sql="select sum(rksl) rkzsl,sum(rkje) rkzje from cl_rkmx ";
	ls_sql+=" where (rkph='"+rkph+"') ";
	ps= conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		rkzsl=rs.getDouble("rkzsl");
		rkzje=rs.getDouble("rkzje");
	}
	else {rkzsl = 0;rkzje = 0;}
	ps.close();
	rs.close();
//==========================================�������������=====================================================
	ls_sql=" update cl_rkd set rkzsl='"+rkzsl+"',rkzje='"+rkzje+"' where (rkph='"+rkph+"') ";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql); 
	ps.executeUpdate();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (rs!= null) rs.close();
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
		<SCRIPT language=javascript >
		<!--
		alert("������ɾ���ɹ���");
		window.opener.location.reload();
		window.close();
		//-->
		</SCRIPT>
