<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String chooseitem=request.getParameter("chooseitem");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	String lrr=null;
	String xmbh=null;
	int sqjl=0;
	String shbz=null;
	ls_sql="select lrr,xmbh,sqjl,shbz ";
	ls_sql+=" from  bj_zdyxmb";
	ls_sql+=" where "+chooseitem;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		lrr=cf.fillNull(rs.getString("lrr"));
		xmbh=cf.fillNull(rs.getString("xmbh"));
		sqjl=rs.getInt("sqjl");
		shbz=cf.fillNull(rs.getString("shbz"));

		if (!shbz.equals("Y") && !shbz.equals("W"))
		{
			conn.rollback();
			out.println("´íÎó£¡ÏîÄ¿±àºÅ["+xmbh+"]Î´ÉóºË");
			return;
		}

		String yxmmc=null;
		double ybj=0;
		String ygycl=null;
		ls_sql="select yxmmc,ybj,ygycl ";
		ls_sql+=" from  bj_zdyshjl";
		ls_sql+=" where sqjl="+sqjl;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			yxmmc=cf.fillNull(rs1.getString("yxmmc"));
			ybj=rs1.getDouble("ybj");
			ygycl=cf.fillNull(rs1.getString("ygycl"));
		}
		rs1.close();
		ps1.close();


		ls_sql="update bj_zdyxmb set shbz='S',xmmc=?,bj=?,gycl=?";
		ls_sql+=" where lrr='"+lrr+"' and xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,yxmmc);
		ps1.setDouble(2,ybj);
		ps1.setString(3,ygycl);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update bj_zdyshjl set shbz='S',sfbxg=null,shr=null,shsj=null,shyj=null,yxmmc=null,ybj=null,ygycl=null,yshbz=null  ";
		ls_sql+=" where sqjl="+sqjl;
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();
		
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("É¾³ýÉóºË³É¹¦£¡");
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>