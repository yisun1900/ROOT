<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String yjfjlh=null;
String khbh=null;
String yjfr=null;
java.sql.Date yjfsj=null;
String yjfsm=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
yjfjlh=cf.GB2Uni(request.getParameter("yjfjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
yjfr=cf.GB2Uni(request.getParameter("yjfr"));
ls=request.getParameter("yjfsj");
try{
	if (!(ls.equals("")))  yjfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yjfsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ԥ����ʱ��]����ת����������:"+e);
	return;
}
yjfsm=cf.GB2Uni(request.getParameter("yjfsm"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[lrsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getxmjfzt=null;
	ls_sql="select xmjfzt";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getxmjfzt=cf.fillNull(rs.getString("xmjfzt"));
	}
	rs.close();
	ps.close();

	//N��δ������S��Ԥ������Y���طóɹ���X��ʧ��δ����T��ʧ���Ѵ���W����Ŀ����
	if (!getxmjfzt.equals("N") && !getxmjfzt.equals("X") && !getxmjfzt.equals("T"))
	{
		out.println("����״̬����ȷ");
		return;
	}

	String xmjfzt="S";//N��δ������S��Ԥ������Y���طóɹ���X��ʧ��δ����T��ʧ���Ѵ���W����Ŀ����

	conn.setAutoCommit(false);
	
	ls_sql="insert into crm_xmyjfjl ( yjfjlh,khbh,yjfr,yjfsj,yjfsm,lrr,lrsj,lrbm,yxmjfzt ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,yjfjlh);
	ps.setString(2,khbh);
	ps.setString(3,yjfr);
	ps.setDate(4,yjfsj);
	ps.setString(5,yjfsm);
	ps.setString(6,lrr);
	ps.setDate(7,lrsj);
	ps.setString(8,lrbm);
	ps.setString(9,getxmjfzt);
	ps.executeUpdate();
	ps.close();

		
	ls_sql="update crm_khxx set xmjfzt=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xmjfzt);
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