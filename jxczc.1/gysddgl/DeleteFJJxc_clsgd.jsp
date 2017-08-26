<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] sgph=request.getParameterValues("sgph");
if (sgph.length>1)
{
	out.println("����ÿ��ֻ��ɾ��1��");
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	String sfzcgd=null;
	ls_sql="select sfzcgd";
	ls_sql+=" from  jxc_clsgd";
	ls_sql+=" where sgph='"+sgph[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfzcgd=cf.fillNull(rs.getString("sfzcgd"));
	}
	rs.close();
	ps.close();

	if (!sfzcgd.equals("M"))//N��δת��Y��תΪ�ɹ��ƻ���M��תΪ��Ӧ�̶���
	{
		conn.rollback();
		out.println("����δתΪ��Ӧ�̶���");
		return;
	}

	String gysddph=null;
	String ddzt=null;
	ls_sql="select gysddph,ddzt";
	ls_sql+=" from  jxc_gysdd";
	ls_sql+=" where sgph='"+sgph[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gysddph=cf.fillNull(rs.getString("gysddph"));
		ddzt=cf.fillNull(rs.getString("ddzt"));
	}
	rs.close();
	ps.close();

	if (!ddzt.equals("0"))//7��δ�ύ��0�����ύ��1�����µ���2���ѽ��ܣ�3�����ַ�����5������ɷ�����4������⣻6�����ڰ�����⣻ 9���ѽ���
	{
		conn.rollback();
		out.println("���󣡹�Ӧ�̶������µ�");
		return;
	}


	ls_sql="delete from jxc_gysdd ";
	ls_sql+=" where gysddph='"+gysddph+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from jxc_gysddmx ";
	ls_sql+=" where gysddph='"+gysddph+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update  jxc_clsgd set sfzcgd='N',sfrksgdw='N'";
	ls_sql+=" where sgph='"+sgph[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();
		
	%>
	<SCRIPT language=javascript >
	<!--
	alert("ɾ���ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>����ʧ��,��������: " + e);
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