<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String[] khbh=request.getParameterValues("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{
		String ssfgs=null;
		String oldywy=null;
		String khxm=null;

		ls_sql="select ssfgs,ywy,khxm";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where  (khbh='"+khbh[i]+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ssfgs=cf.fillNull(rs.getString("ssfgs"));
			oldywy=cf.fillNull(rs.getString("ywy"));
			khxm=cf.fillNull(rs.getString("khxm"));
		}
		ps.close();
		rs.close();


		ls_sql="update crm_zxkhxx set ywy=null,ywybm=null,ywyssxz=null,scbjl=null";
		ls_sql+=" where  (khbh='"+khbh[i]+"')  ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		ls_sql="update crm_khxx set ywy=null,ywybm=null,ywyssxz=null,scbjl=null";
		ls_sql+=" where  (khbh='"+khbh[i]+"')  ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();



		ls_sql="insert into crm_zxkhywyxhjl (khbh,ssfgs,khxm,oldywy,newywy,xgr,xgsj,xgsm)";
		ls_sql+=" values ( ?,?,?,?,?,?,SYSDATE,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh[i]);
		ps.setString(2,ssfgs);
		ps.setString(3,khxm);
		ps.setString(4,oldywy);
		ps.setString(5,"¿Õ");
		ps.setString(6,yhmc);
		ps.setString(7,"É¾³ý");
		ps.executeUpdate();
		ps.close();



	}

	conn.commit();
		
	%>
	<SCRIPT language=javascript >
	<!--
	alert("É¾³ý³É¹¦£¡");
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