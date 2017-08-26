<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String sjbshjl=cf.GB2Uni(request.getParameter("sjbshjl"));
String sjbshyj=cf.GB2Uni(request.getParameter("sjbshyj"));

String sjbshr=cf.GB2Uni(request.getParameter("sjbshr"));
java.sql.Date sjbshsj=null;
ls=request.getParameter("sjbshsj");
try{
	if (!(ls.equals("")))  sjbshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjbshsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʱ��]����ת����������:"+e);
	return;
}
String sjbsbyybm=cf.GB2Uni(request.getParameter("sjbsbyybm"));
String sjbsbkhlx=cf.GB2Uni(request.getParameter("sjbsbkhlx"));

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String clzt="";
	ls_sql="select clzt";
	ls_sql+=" from  crm_qysbdj";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	if (!clzt.equals("1"))//1���ύ�ɵ���2���ɵ���ˡ�5���ط�
	{
		out.println("����״̬����ȷ");
		return;
	}


	conn.setAutoCommit(false);

	ls_sql="update crm_qysbdj set sjbshjl=?,sjbshr=?,sjbshsj=?,sjbshyj=?,sjbsbyybm=?,sjbsbkhlx=?,clzt='2'";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sjbshjl);
	ps.setString(2,sjbshr);
	ps.setDate(3,sjbshsj);
	ps.setString(4,sjbshyj);
	ps.setString(5,sjbsbyybm);
	ps.setString(6,sjbsbkhlx);
	ps.executeUpdate();
	ps.close();

	if (sjbshjl.equals("N"))//Y��ͨ����N��δͨ��
	{
		ls_sql="update crm_zxkhxx set zxzt='5',hfsbyybm=null,hfsbkhlx=null,hfsbyyxs=?,hfsbsj=?";//0��δ������棻1: ������棻2: �ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ����6��ɢ��
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sjbshyj);
		ps.setDate(2,sjbshsj);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql="update crm_zxkhxx set zxzt='4',hfsbyybm=?,hfsbkhlx=?,hfsbyyxs=?,hfsbsj=?";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sjbsbyybm);
		ps.setString(2,sjbsbkhlx);
		ps.setString(3,sjbshyj);
		ps.setDate(4,sjbshsj);
		ps.executeUpdate();
		ps.close();
	}

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
	out.print("Exception: " + e);
	out.print("Exception: " + ls_sql);
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