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
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	String lrr=null;
	String xmbh=null;
	int sqjl=0;
	String shbz=null;
	String xmmc=null;
	double bj=0;
	String gycl=null;
	ls_sql="select lrr,xmbh,sqjl,shbz,xmmc,bj,gycl ";
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
		xmmc=cf.fillNull(rs.getString("xmmc"));
		bj=rs.getDouble("bj");
		gycl=cf.fillNull(rs.getString("gycl"));

		if (shbz.equals("Y") || shbz.equals("W"))
		{
			conn.rollback();
			out.println("错误！项目编号["+xmbh+"]已审核");
			return;
		}

		ls_sql="update bj_zdyxmb set shbz='Y'";
		ls_sql+=" where lrr='"+lrr+"' and xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update bj_zdyshjl set shbz='Y',sfbxg='N',shr='"+yhmc+"',shsj=SYSDATE,shyj='批量同意',yxmmc=?,ybj=?,ygycl=?,yshbz=?  ";
		ls_sql+=" where sqjl="+sqjl;
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,xmmc);
		ps1.setDouble(2,bj);
		ps1.setString(3,gycl);
		ps1.setString(4,shbz);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();
		
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("审核成功！");
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
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>