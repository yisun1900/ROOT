<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String pfxmbm=null;
String pfxmmc=null;
long fz=0;
String kpdlbm=null;
pfxmbm=cf.GB2Uni(request.getParameter("pfxmbm"));
pfxmmc=cf.GB2Uni(request.getParameter("pfxmmc"));
ls=request.getParameter("fz");
try{
	if (!(ls.equals("")))  fz=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fz������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ֵ]����ת����������:"+e);
	return;
}
kpdlbm=cf.GB2Uni(request.getParameter("kpdlbm"));
String wherepfxmbm=null;
wherepfxmbm=cf.GB2Uni(request.getParameter("wherepfxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update kp_pfxmbm set pfxmbm=?,pfxmmc=?,fz=?,kpdlbm=? ";
	ls_sql+=" where  (pfxmbm='"+wherepfxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,pfxmbm);
	ps.setString(2,pfxmmc);
	ps.setLong(3,fz);
	ps.setString(4,kpdlbm);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("���̳ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
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