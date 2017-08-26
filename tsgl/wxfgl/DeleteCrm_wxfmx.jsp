<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrxh[]=request.getParameterValues("lrxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<lrxh.length ;i++ )
	{
		String jsbz=null;
		String tsjlh=null;
		ls_sql="select jsbz,tsjlh";
		ls_sql+=" from  crm_wxfmx";
		ls_sql+=" where  (lrxh="+lrxh[i]+")  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			jsbz=rs.getString("jsbz");
			tsjlh=rs.getString("tsjlh");
		}
		else{
			conn.rollback();
			out.println("´íÎó£¡ÐòºÅ£º"+lrxh[i]+"²»´æÔÚ");
			return;
		}
		rs.close();
		ps.close();

		if (jsbz.equals("Y"))
		{
			conn.rollback();
			out.println("´íÎó£¡ÐòºÅ£º"+lrxh[i]+"ÒÑ½áËã£¬²»ÄÜÔÙÉ¾³ý");
			return;
		}

		ls_sql="delete from crm_wxfmx ";
		ls_sql+=" where  (lrxh="+lrxh[i]+")  ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		double wxrgf=0;
		double wxcf=0;
		double wxclf=0;
		double wxzfy=0;
		double zrfcdfy=0;
		double sqyzfy=0;
		double gscdfy=0;
		double qtfcdfy=0;
	
		ls_sql="select sum(wxrgf),sum(wxcf),sum(wxclf),sum(wxzfy),sum(zrfcdfy),sum(sqyzfy),sum(gscdfy),sum(qtfcdfy)";
		ls_sql+=" from  crm_wxfmx";
		ls_sql+=" where tsjlh='"+tsjlh+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			wxrgf=rs.getDouble(1);
			wxcf=rs.getDouble(2);
			wxclf=rs.getDouble(3);
			wxzfy=rs.getDouble(4);
			zrfcdfy=rs.getDouble(5);
			sqyzfy=rs.getDouble(6);
			gscdfy=rs.getDouble(7);
			qtfcdfy=rs.getDouble(8);
		}
		rs.close();
		ps.close();
		
		ls_sql="update crm_tsjl set wxrgf=?,wxcf=?,wxclf=?,wxzfy=?,zrfcdfy=?,sqyzfy=?,gscdfy=?,qtfcdfy=?";
		ls_sql+=" where tsjlh='"+tsjlh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,wxrgf);
		ps.setDouble(2,wxcf);
		ps.setDouble(3,wxclf);
		ps.setDouble(4,wxzfy);
		ps.setDouble(5,zrfcdfy);
		ps.setDouble(6,sqyzfy);
		ps.setDouble(7,gscdfy);
		ps.setDouble(8,qtfcdfy);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>