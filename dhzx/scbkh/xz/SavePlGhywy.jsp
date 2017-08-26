<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");

String[] scbkhbh=request.getParameterValues("scbkhbh");
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String ywybm=cf.GB2Uni(request.getParameter("ywybm"));
String ywyssxz=cf.GB2Uni(request.getParameter("ywyssxz"));
String newywy=cf.GB2Uni(request.getParameter("newywy"));

if (newywy==null || newywy.equals(""))
{
	out.println("错误！新业务员为空");
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

java.sql.Date newywyfpsj=null;

int count=0;
String newywygh="";

try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<scbkhbh.length ;i++ )
	{
		String oldywy=null;
		String khxm=null;

		ls_sql="select ywy,khxm";
		ls_sql+=" from  crm_scbkhxx";
		ls_sql+=" where  (scbkhbh='"+scbkhbh[i]+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			oldywy=cf.fillNull(rs.getString("ywy"));
			khxm=cf.fillNull(rs.getString("khxm"));
		}
		ps.close();
		rs.close();


		ls_sql="update crm_scbkhxx set ywy=?,ywybm=?,ywyssxz=?";
		ls_sql+=" where  (scbkhbh='"+scbkhbh[i]+"')  ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,newywy);
		ps.setString(2,ywybm);
		ps.setString(3,ywyssxz);
		ps.executeUpdate();
		ps.close();


	}

	conn.commit();
		
	%>
	<SCRIPT language=javascript >
	<!--
	alert("更换成功！");
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