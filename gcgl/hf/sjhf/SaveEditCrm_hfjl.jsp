<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ls=null;
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String jglxbm=request.getParameter("jglxbm");
String hfsm=cf.GB2Uni(request.getParameter("hfsm"));
String bz=cf.GB2Uni(request.getParameter("bz"));

String clfs=cf.GB2Uni(request.getParameter("clfs"));
String hfr=cf.GB2Uni(request.getParameter("hfr"));
String hfbm=request.getParameter("hfbm");
java.sql.Date hfsj=null;

ls=request.getParameter("hfsj");
try{
	if (!(ls.equals("")))  hfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����hfsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ط�ʱ��]����ת����������:"+e);
	return;
}

String[] dwbh=request.getParameterValues("dwbh");

String wherehfjlh=null;
wherehfjlh=cf.GB2Uni(request.getParameter("wherehfjlh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();


	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_sjhffkbm where clzt='Y' and hfjlh="+wherehfjlh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	ps.close();
	rs.close();
	if (count>0)
	{
		out.println("�����йز����ѶԻط����˴����������޸�");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_sjhfjl set jglxbm=?,hfsm=?,clfs=?,hfsj=?,hfr=?,hfbm=?,bz=? ";
	ls_sql+=" where  (hfjlh="+wherehfjlh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jglxbm);
	ps.setString(2,hfsm);
	ps.setString(3,clfs);
	ps.setDate(4,hfsj);
	ps.setString(5,hfr);
	ps.setString(6,hfbm);
	ps.setString(7,bz);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_sjhffkbm where hfjlh="+wherehfjlh;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (dwbh!=null)
	{
		for (int i=0;i<dwbh.length ;i++ )
		{
			ls_sql="insert into crm_sjhffkbm (hfjlh,dwbh,clzt ) ";
			ls_sql+=" values (?,?,'N') ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,wherehfjlh);
			ps.setString(2,dwbh[i]);
			ps.executeUpdate();
			ps.close();
		}
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