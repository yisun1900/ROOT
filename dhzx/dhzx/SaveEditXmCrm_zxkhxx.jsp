<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khxm=cf.GB2Uni(request.getParameter("khxm"));
String cqbm=cf.GB2Uni(request.getParameter("cqbm"));
String xqbm=cf.GB2Uni(request.getParameter("xqbm"));
String jiedao=cf.GB2Uni(request.getParameter("jiedao"));
String louhao=cf.GB2Uni(request.getParameter("louhao"));
String fwdz=cf.GB2Uni(request.getParameter("fwdz"));

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh!='"+khbh+"' and fwdz='"+fwdz+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("提醒！此房屋地址已存在");
	}



	conn.setAutoCommit(false);

	ls_sql="update crm_zxkhxx set khxm=?,cqbm=?,xqbm=?,louhao=?,jiedao=?,fwdz=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khxm);
	ps.setString(2,cqbm);
	ps.setString(3,xqbm);
	ps.setString(4,louhao);
	ps.setString(5,jiedao);
	ps.setString(6,fwdz);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_khxx set khxm=?,cqbm=?,xqbm=?,louhao=?,jiedao=?,fwdz=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khxm);
	ps.setString(2,cqbm);
	ps.setString(3,xqbm);
	ps.setString(4,louhao);
	ps.setString(5,jiedao);
	ps.setString(6,fwdz);
	ps.executeUpdate();
	ps.close();


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
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