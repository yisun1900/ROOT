<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");

String khxm=cf.GB2Uni(request.getParameter("khxm"));
String ssfgs=request.getParameter("ssfgs");
String oldywy=cf.GB2Uni(request.getParameter("oldywy"));
String newywy=cf.GB2Uni(request.getParameter("newywy"));
String xgsm=cf.GB2Uni(request.getParameter("xgsm"));
String ywybm=cf.GB2Uni(request.getParameter("ywybm"));
String ywyssxz=cf.GB2Uni(request.getParameter("ywyssxz"));
String scbjl=cf.GB2Uni(request.getParameter("scbjl"));

String wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);


	ls_sql="update crm_zxkhxx set ywy=?,ywybm=?,ywyssxz=?,scbjl=?";
	ls_sql+=" where  (khbh='"+wherekhbh+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newywy);
	ps.setString(2,ywybm);
	ps.setString(3,ywyssxz);
	ps.setString(4,scbjl);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into crm_zxkhywyxhjl (khbh,ssfgs,khxm,oldywy,newywy,xgr,xgsj,xgsm)";
	ls_sql+=" values ( ?,?,?,?,?,?,SYSDATE,?)";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,wherekhbh);
	ps.setString(2,ssfgs);
	ps.setString(3,khxm);
	ps.setString(4,oldywy);
	ps.setString(5,newywy);
	ps.setString(6,yhmc);
	ps.setString(7,xgsm);
	ps.executeUpdate();
	ps.close();


	conn.commit();
		
	%>
	<SCRIPT language=javascript >
	<!--
	alert("´æÅÌ³É¹¦£¡");
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>