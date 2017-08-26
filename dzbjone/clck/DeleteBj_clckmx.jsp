<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ckdh=cf.GB2Uni(request.getParameter("ckdh"));
String[] wlbm=request.getParameterValues("wlbm");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double sl=0;

try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);


	for (int i=0;i<wlbm.length ;i++ )
	{
		//材料出库明细
		ls_sql="delete from bj_clckmx ";
		ls_sql+=" where ckdh='"+ckdh+"' and wlbm='"+cf.GB2Uni(wlbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	}

	double ckzsl=0;
	double ckzje=0;

	ls_sql="select sum(sl),sum(je) ";
	ls_sql+=" from  bj_clckmx";
	ls_sql+=" where  (ckdh='"+ckdh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ckzsl=rs.getDouble(1);
		ckzje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="update bj_clckd set ckzsl="+ckzsl+",ckzje="+ckzje;
	ls_sql+=" where ckdh='"+ckdh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
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