<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int zxzsgds=0;
	int zdzsgds=0;
	ls_sql="select zxzsgds,zdzsgds ";
	ls_sql+=" from  kp_yzfdzpdcs";
	ls_sql+=" where ssfgs='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zxzsgds=rs.getInt("zxzsgds");
		zdzsgds=rs.getInt("zdzsgds");
	}
	rs.close();
	ps.close();

	ls_sql="update sq_bzxx set zxzsgds=?,zdzsgds=? ";
	ls_sql+=" where sgd in(select sgd from sq_sgd where ssfgs='"+ssfgs+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,zxzsgds);
	ps.setInt(2,zdzsgds);
	ps.executeUpdate();
	ps.close();


	String sgd=null;
	ls_sql="select sgd";
	ls_sql+=" from  sq_sgd";
	ls_sql+=" where ssfgs='"+ssfgs+"' and cxbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sgd=rs.getString("sgd");

		zxzsgds=0;//最小在施工地数
		zdzsgds=0;//最大在施工地数
		ls_sql="select sum(zxzsgds),sum(zdzsgds)";
		ls_sql+=" from sq_bzxx";  
		ls_sql+=" where sgd='"+sgd+"' and tdbz='N'";
		ps1=conn.prepareStatement(ls_sql);  
		rs1=ps1.executeQuery();
		if (rs1.next())
		{
			zxzsgds=rs1.getInt(1); 
			zdzsgds=rs1.getInt(2); 
		} 
		rs1.close();
		ps1.close();


		ls_sql="update sq_sgd set zxzsgds="+zxzsgds+",zdzsgds="+zdzsgds;
		ls_sql+=" where ssfgs='"+ssfgs+"' and sgd='"+sgd+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();
	
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
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>