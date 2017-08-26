<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=request.getParameter("khbh");
String[] shxmbm=request.getParameterValues("shxmbm");
String[] shxmbmch=request.getParameterValues("shxmbmch");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
int htshdf=0;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql=" delete from  crm_htshmx";
	ls_sql+=" where  khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<shxmbmch.length ;i++ )
	{

		int xh=Integer.parseInt(shxmbmch[i]);
		String bhgsl=request.getParameter("bhgsl"+xh);

		ls_sql="insert into crm_htshmx ( khbh,shxmbm,bhgsl,kf ) ";
		ls_sql+=" select ?,shxmbm,?,kf ";
		ls_sql+=" from dm_shxmbm ";
		ls_sql+=" where shxmbm='"+shxmbm[xh]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,bhgsl);
		ps.executeUpdate();
		ps.close();
	}
	

	
	ls_sql="select sum(bhgsl*kf)";
	ls_sql+=" from  crm_htshmx";
	ls_sql+=" where  khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		htshdf=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="update crm_khxx set htshdf=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,htshdf);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！扣分总和：<%=htshdf%>");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
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