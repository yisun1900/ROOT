<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
String newbzbh=null;
String bzbh=null;
String sgd=null;
String oldsgd="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int row=0;
	ls_sql="select bzbh,sgd";
	ls_sql+=" from  sq_bzxx";
	ls_sql+=" order by sgd";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		bzbh=rs.getString("bzbh");
		sgd=rs.getString("sgd");

		row++;

		ls_sql="update sq_bzxx set bzbh=?";
		ls_sql+=" where bzbh='"+bzbh+"' ";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setInt(1,row);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();

	row=0;
	ls_sql="select bzbh,sgd";
	ls_sql+=" from  sq_bzxx";
	ls_sql+=" order by sgd,bzmc ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		bzbh=rs.getString("bzbh");
		sgd=rs.getString("sgd");

		if (oldsgd.equals(sgd))
		{
			row++;
		}
		else{
			row=0;
			oldsgd=sgd;
		}

		newbzbh=sgd+cf.addZero(row+1,3);

		ls_sql="update sq_bzxx set bzbh=?";
		ls_sql+=" where bzbh='"+bzbh+"' ";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newbzbh);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
//	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
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