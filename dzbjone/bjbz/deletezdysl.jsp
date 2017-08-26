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

		if (!shbz.equals("S"))
		{
			conn.rollback();
			out.println("错误！项目编号["+xmbh+"]未受理");
			return;
		}

		String yshbz=null;
		ls_sql="select yshbz";
		ls_sql+=" from  bj_zdyshjl";
		ls_sql+=" where sqjl="+sqjl;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			yshbz=cf.fillNull(rs1.getString("yshbz"));
		}
		rs1.close();
		ps1.close();

		if (yshbz.equals(""))
		{
			yshbz="N";
		}

		ls_sql="update bj_zdyxmb set shbz='N'";
		ls_sql+=" where lrr='"+lrr+"' and xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update bj_zdyshjl set shbz='N',slr=null,slsj=null,slsm=null,yshbz=null ";
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
	alert("删除受理成功！");
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