<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String grxm=request.getParameter("grxm");
String zpmc=request.getParameter("zpmc");

String ls=getServletContext().getRealPath("")+"/yblimg/grsh/";


java.io.File dir=new java.io.File(ls);
java.io.File lsFile=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try 
{
	conn=cf.getConnection();


			
	lsFile=new java.io.File(ls+"/"+zpmc);
	if (lsFile.exists())
	{
		if (lsFile.delete())
		{
			ls_sql="update crm_grxx set zpmc=null,shr=null,shsj=null";
			ls_sql+=" where khbh='"+khbh+"' and grxm='"+grxm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			out.println("³É¹¦É¾³ýÍ¼Æ¬£º"+zpmc);
		}
		else{
			out.println("<BR>£¡£¡£¡£¡É¾³ýÍ¼Æ¬Ê§°Ü£º"+zpmc);
		}
	}
	else{
		ls_sql="update crm_grxx set zpmc=null,shr=null,shsj=null";
		ls_sql+=" where khbh='"+khbh+"' and grxm='"+grxm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		out.println("³É¹¦É¾³ýÍ¼Æ¬£º"+zpmc);
	}

	String pgrshbz="";//1£ºÎ´ÉóºË£»2£ºÉóºË
	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_grxx";
	ls_sql+=" where khbh='"+khbh+"' and shsj is null";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		pgrshbz="1";
	}
	else {
		pgrshbz="2";
	}

	ls_sql="update crm_khxx set pgrshbz=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,pgrshbz);
	ps.executeUpdate();
	ps.close();

}
catch(Exception e)
{
	System.out.print("<BR>³ö´í:" + e);
	System.out.print("<BR>SQL=" + ls_sql);
	return;
}
finally
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}

}

%>
