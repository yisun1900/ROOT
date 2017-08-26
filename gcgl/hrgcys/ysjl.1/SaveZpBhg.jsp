<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String[] yszpmc = request.getParameterValues("yszpmc");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<yszpmc.length ;i++ )
	{
		ls_sql="update crm_heyszp set zpshbz='B',kkzpbz='0',shsj=SYSDATE,shr='"+yhmc+"'";
		ls_sql+=" where  yszpmc='"+cf.GB2Uni(yszpmc[i])+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		
	
		String ysjlh=null;
		ls_sql="select ysjlh ";
		ls_sql+=" from  crm_heyszp";
		ls_sql+=" where  yszpmc='"+cf.GB2Uni(yszpmc[i])+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ysjlh=cf.fillNull(rs.getString("ysjlh"));
		}
		rs.close();
		ps.close();
	
		int count=0;
		ls_sql="select count(*) ";
		ls_sql+=" from  crm_heyszp";
		ls_sql+=" where  ysjlh='"+ysjlh+"' ";
		ls_sql+=" and  kkzpbz='1'";//0不可看   1可看
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
	
	
		int bhgzpsl=0;
		ls_sql="select count(*) ";
		ls_sql+=" from  crm_heyszp";
		ls_sql+=" where  ysjlh='"+ysjlh+"' ";
		ls_sql+=" and  zpshbz='B'";//Y：合格；B：不合格；N：未审核
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			bhgzpsl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		int shzpsl=0;
		ls_sql="select count(*) ";
		ls_sql+=" from  crm_heyszp";
		ls_sql+=" where  ysjlh='"+ysjlh+"' ";
		ls_sql+=" and  zpshbz!='N'";//Y：合格；B：不合格；C：不合格重拍；N：未审核
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			shzpsl=rs.getInt(1);
		}
		rs.close();
		ps.close();
	
		ls_sql="update crm_heysjl set khkkzpsl="+count+",bhgzpsl="+bhgzpsl+",shzpsl="+shzpsl;
		ls_sql+=" where  ysjlh='"+ysjlh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (rs!= null) rs.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>