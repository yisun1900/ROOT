<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String xsxx=null;
int mmt=0;
String yhdlm=(String)session.getAttribute("yhdlm");
String ygbh=(String)session.getAttribute("ygbh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select count(*) ";
	ls_sql+=" from sq_yhxx ";
	ls_sql+=" where yhdlm='"+yhdlm+"' and ygbh='"+ygbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mmt=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (mmt>0)
	{xsxx="������Ϣ�Ѿ�ͨ����֤������ת����̳�����Ժ󡭡�����";}
	else
	{xsxx="��֤ʧ�ܣ�����µ�½ϵͳ��";}
	out.print(xsxx);
	response.sendRedirect("http://192.168.1.89:8090/nbyj/SelectNbyj_fjx.jsp?yhdlm="+yhdlm+"&yjygbh="+ygbh);
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
