<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String yhjs=(String)session.getAttribute("yhjs");
String khbh=request.getParameter("khbh");
String damxbm=request.getParameter("damxbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String dalqbz=null;
	ls_sql="select dalqbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dalqbz=rs.getString(1);
	}
	rs.close();
	ps.close();

	if (dalqbz.equals("3"))//1��δ��������2���ѽ�������3���ѹ鵵
	{
		out.println("�����ѹ鵵�������޸�");
		return;
	}

	ls_sql="delete from crm_gcdagl ";
	ls_sql+=" where khbh='"+khbh+"'  and damxbm='"+damxbm+"'";
	if (!yhjs.equals("A0") && !yhjs.equals("F0"))
	{
		ls_sql+=" and lrr='"+yhmc+"'";
	}
	ps= conn.prepareStatement(ls_sql);
	if (ps.executeUpdate()!=1)
	{
		out.println("����ɾ��ʧ��");
	}
	else{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("ɾ���ɹ���");
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>