<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String zjlxbm=null;
String bt=null;
String nr=null;
java.sql.Date lrrq=null;
String yhdlm=null;
zjlxbm=cf.GB2Uni(request.getParameter("zjlxbm"));
bt=cf.GB2Uni(request.getParameter("bt"));
nr=cf.GB2Uni(request.getParameter("nr"));
ls=request.getParameter("lrrq");
try{
	if (!(ls.equals("")))  lrrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lrrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼������]����ת����������:"+e);
	return;
}
yhdlm=cf.GB2Uni(request.getParameter("yhdlm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//�ͻ����
	int jlh=0;
	ls_sql="select NVL(max(jlh)+1,1)";
	ls_sql+=" from  crm_zjsjk";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jlh=rs.getInt(1);
	}
	ps.close();
	rs.close();
	
	
	ls_sql="insert into crm_zjsjk ( jlh,zjlxbm,bt,nr,lrrq,yhdlm ) ";
	ls_sql+=" values ( ?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,jlh);
	ps.setString(2,zjlxbm);
	ps.setString(3,bt);
	ps.setString(4,nr);
	ps.setDate(5,lrrq);
	ps.setString(6,yhdlm);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("���̳ɹ������ɼ�¼��<<%=jlh%>>");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
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