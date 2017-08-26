<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");


String oldsgd=cf.GB2Uni(request.getParameter("oldsgd"));
String oldsgbz=cf.GB2Uni(request.getParameter("oldsgbz"));
String oldzjxm=cf.GB2Uni(request.getParameter("oldzjxm"));

String sgd=cf.GB2Uni(request.getParameter("sgd"));
String sgbz=cf.GB2Uni(request.getParameter("sgbz"));
String zjxm=cf.GB2Uni(request.getParameter("zjxm"));

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String xgjlh=null;
	int count=0;
	ls_sql="select NVL(max(substr(xgjlh,8,2)),0)";
	ls_sql+=" from  crm_khxxxgjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	ps.close();
	rs.close();
	
	xgjlh=khbh+cf.addZero(count+1,2);

	conn.setAutoCommit(false);



	ls_sql="update crm_khxx set sgd=?,sgbz=?,zjxm=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sgd);
	ps.setString(2,sgbz);
	ps.setString(3,zjxm);
	ps.executeUpdate();
	ps.close();

	ls_sql ="insert into crm_khxxxgjl (xgjlh,khbh,xgqnr,xghnr,czlx,lrr,lrsj,lrbm) ";
	ls_sql+=" values(?,?,?,?,?,?,SYSDATE,?)";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xgjlh);
	ps.setString(2,khbh);
	ps.setString(3,"");
	ps.setString(4,sgd+";"+sgbz+";"+zjxm );
	ps.setString(5,"修改施工队工程担当");
	ps.setString(6,yhmc);
	ps.setString(7,lrbm);
	ps.executeUpdate();
	ps.close();

	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	parent.window.close();
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