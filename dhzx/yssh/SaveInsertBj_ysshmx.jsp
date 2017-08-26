<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ysshjl=request.getParameter("ysshjl");
String[] shxmbm=request.getParameterValues("shxmbm");
String[] shxmbmch=request.getParameterValues("shxmbmch");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String ysshbz=null;
	String khbh=null;
	ls_sql="select ysshbz,khbh";
	ls_sql+=" from  bj_ysshjl";
	ls_sql+=" where  ysshjl='"+ysshjl+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ysshbz=cf.fillNull(rs.getString("ysshbz"));
		khbh=cf.fillNull(rs.getString("khbh"));
	}
	rs.close();
	ps.close();
	if (!ysshbz.equals("C"))////N£ºÎ´ÉêÇë£»B£ºÉêÇëÉóºË£»C£ºÊÜÀíÉêÇë£»Y£ºÉóºËÍ¨¹ý£»M£ºÉóºËÎ´Í¨¹ý
	{
		out.println("´íÎó£¡ÒÑÉóºË");
		return;
	}

	String minysshjl=null;
	ls_sql="select min(ysshbz)";
	ls_sql+=" from  bj_ysshjl";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		minysshjl=rs.getString(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql=" delete from  bj_ysshmx";
	ls_sql+=" where  ysshjl='"+ysshjl+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	String xuhao=ysshjl.substring(7,10);
	System.out.println(xuhao);
	if (shxmbmch!=null)
	{
		for (int i=0;i<shxmbmch.length ;i++ )
		{
			int xh=Integer.parseInt(shxmbmch[i]);
			String bhgsl=request.getParameter("bhgsl"+xh);

			ls_sql="insert into bj_ysshmx ( ysshjl,shxmbm,bhgsl,kf,bz ) ";
			if("001".equals(xuhao))
			ls_sql+=" select ?,shxmbm,?,0,bz ";
			else
			ls_sql+=" select ?,shxmbm,?,kf,bz ";
			ls_sql+=" from dm_ysshxmbm ";
			ls_sql+=" where shxmbm='"+shxmbm[xh]+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ysshjl);
			ps.setString(2,bhgsl);
			ps.executeUpdate();
			ps.close();
		}
	}

	

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("´æÅÌ³É¹¦£¡");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("´æÅÌÊ§°Ü,·¢ÉúÒâÍâ: " + e);
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