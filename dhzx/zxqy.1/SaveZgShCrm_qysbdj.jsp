<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String zgshjl=cf.GB2Uni(request.getParameter("zgshjl"));
String zgshyj=cf.GB2Uni(request.getParameter("zgshyj"));

String zgshr=cf.GB2Uni(request.getParameter("zgshr"));
java.sql.Date zgshsj=null;
ls=request.getParameter("zgshsj");
try{
	if (!(ls.equals("")))  zgshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zgshsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʱ��]����ת����������:"+e);
	return;
}
String jdzgsbyybm=cf.GB2Uni(request.getParameter("jdzgsbyybm"));
String jdzgsbkhlx=cf.GB2Uni(request.getParameter("jdzgsbkhlx"));

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

	if (!clzt.equals("2"))//1�����ʦ�ύ��2����Ʋ���ˡ�3���г�����ˡ�4���Ӵ�������ˡ�5���ط�
	{
		out.println("����״̬����ȷ");
		return;
	}


	conn.setAutoCommit(false);

	ls_sql="update crm_qysbdj set zgshjl=?,zgshr=?,zgshsj=?,zgshyj=?,jdzgsbyybm=?,jdzgsbkhlx=?,clzt='4'";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zgshjl);
	ps.setString(2,zgshr);
	ps.setDate(3,zgshsj);
	ps.setString(4,zgshyj);
	ps.setString(5,jdzgsbyybm);
	ps.setString(6,jdzgsbkhlx);
	ps.executeUpdate();
	ps.close();

	if (zgshjl.equals("N"))//Y��ͨ����N��δͨ��
	{
		ls_sql="update crm_zxkhxx set zxzt='5',hfsbyybm=?,hfsbkhlx=?,hfsbyyxs=?,hfsbsj=?";//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ����6��ɢ��
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,jdzgsbyybm);
		ps.setString(2,jdzgsbkhlx);
		ps.setString(3,zgshyj);
		ps.setDate(4,zgshsj);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql="update crm_zxkhxx set zxzt='4',hfsbyybm=?,hfsbkhlx=?,hfsbyyxs=?,hfsbsj=?";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,jdzgsbyybm);
		ps.setString(2,jdzgsbkhlx);
		ps.setString(3,zgshyj);
		ps.setDate(4,zgshsj);
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