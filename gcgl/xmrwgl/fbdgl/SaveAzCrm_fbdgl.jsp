<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String azlrr=null;
java.sql.Date sjazsj=null;

azlrr=cf.GB2Uni(request.getParameter("azlrr"));
ls=request.getParameter("sjazsj");
try{
	if (!(ls.equals("")))  sjazsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjazsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�ʰ�װ����]����ת����������:"+e);
	return;
}
String azsfcg=cf.GB2Uni(request.getParameter("azsfcg"));
String azqksm=cf.GB2Uni(request.getParameter("azqksm"));

String fbdbh=null;
fbdbh=cf.GB2Uni(request.getParameter("fbdbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String zt=null;
	String khbh=null;
	String cpflbm=null;
	ls_sql="select zt,khbh,cpflbm";
	ls_sql+=" from  crm_fbdgl";
	ls_sql+=" where fbdbh='"+fbdbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zt=cf.fillNull(rs.getString("zt"));
		khbh=cf.fillNull(rs.getString("khbh"));
		cpflbm=cf.fillNull(rs.getString("cpflbm"));
	}
	rs.close();
	ps.close();
	if (!zt.equals("4"))//1��¼�롢2����������3���µ���4��������ɡ�9����װ���
	{
		out.println("���󣡴���״̬����ȷ");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_fbdgl set azlrr=?,sjazsj=?,azsfcg=?,azqksm=?,zt='9'";
	ls_sql+=" where fbdbh='"+fbdbh+"' and zt='4'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,azlrr);
	ps.setDate(2,sjazsj);
	ps.setString(3,azsfcg);
	ps.setString(4,azqksm);
	ps.executeUpdate();
	ps.close();

	String sfxfb="";
	if (azsfcg.equals("Y"))
	{
		sfxfb="W";//N���޷�����Y���ȴ�������W�������ɹ���S������ʧ��
	}
	else{
		sfxfb="S";
	}

	ls_sql="update crm_cpgzjl set sfxfb=?";
	ls_sql+=" where khbh='"+khbh+"' and cpflbm='"+cpflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sfxfb);
	ps.executeUpdate();
	ps.close();

	conn.commit();

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
	conn.rollback();
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>