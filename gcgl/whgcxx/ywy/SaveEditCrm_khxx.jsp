<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khxm=cf.GB2Uni(request.getParameter("khxm"));
String ssfgs=request.getParameter("ssfgs");
String oldywy=cf.GB2Uni(request.getParameter("oldywy"));
String newywy=cf.GB2Uni(request.getParameter("newywy"));
String xgsm=cf.GB2Uni(request.getParameter("xgsm"));
String ywybm=cf.GB2Uni(request.getParameter("ywybm"));
String ywyssxz=cf.GB2Uni(request.getParameter("ywyssxz"));
String scbjl=cf.GB2Uni(request.getParameter("scbjl"));

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

	ls_sql="update crm_khxx set ywy=?,ywybm=?,ywyssxz=?,scbjl=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newywy);
	ps.setString(2,ywybm);
	ps.setString(3,ywyssxz);
	ps.setString(4,scbjl);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_zxkhxx set ywy=?,ywybm=?,ywyssxz=?,scbjl=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newywy);
	ps.setString(2,ywybm);
	ps.setString(3,ywyssxz);
	ps.setString(4,scbjl);
	ps.executeUpdate();
	ps.close();


	ls_sql ="insert into crm_khxxxgjl (xgjlh,khbh,xgqnr,xghnr,czlx,lrr,lrsj,lrbm,bz) ";
	ls_sql+=" values(?,?,?,?,?,?,SYSDATE,?,?)";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xgjlh);
	ps.setString(2,khbh);
	ps.setString(3,oldywy);
	ps.setString(4,newywy+","+scbjl );
	ps.setString(5,"修改业务员");
	ps.setString(6,yhmc);
	ps.setString(7,lrbm);
	ps.setString(8,xgsm);
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