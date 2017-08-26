<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date fglrsj=null;
String fglrr=null;
String fgsm=null;

ls=request.getParameter("fglrsj");
try{
	if (!(ls.equals("")))  fglrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[fglrsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����¼��ʱ��]����ת����������:"+e);
	return;
}
fglrr=cf.GB2Uni(request.getParameter("fglrr"));
fgsm=cf.GB2Uni(request.getParameter("fgsm"));
java.sql.Date sjfgsj=null;
ls=request.getParameter("sjfgsj");
try{
	if (!(ls.equals("")))  sjfgsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjfgsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�ʸ�������]����ת����������:"+e);
	return;
}

String djbh=cf.GB2Uni(request.getParameter("djbh"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String zt=null;
	String tgshjg=null;
	ls_sql=" select zt,tgshjg";
	ls_sql+=" from  crm_tggl";
	ls_sql+=" where  djbh='"+djbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zt=cf.fillNull(rs.getString("zt"));
		tgshjg=cf.fillNull(rs.getString("tgshjg"));
	}
	rs.close();
	ps.close();

	if (!zt.equals("8"))
	{
		out.println("<BR>���������󣬸���״̬����ȷ");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_tggl set sjfgsj=?,fglrsj=?,fglrr=?,fgsm=?";
	ls_sql+=" where  djbh='"+djbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,sjfgsj);
	ps.setDate(2,fglrsj);
	ps.setString(3,fglrr);
	ps.setString(4,fgsm);
	ps.executeUpdate();
	ps.close();

		
	ls_sql="update crm_khxx set tgbz='N',tgjzsj=?,tgsm=?";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,sjfgsj);
	ps.setString(2,fgsm);
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