<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String rwbm=request.getParameter("rwbm");
String[] hxrwbm=request.getParameterValues("hxrwbm");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);


	ls_sql="delete from gdm_rwljgx  ";
	ls_sql+=" where  rwbm='"+rwbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (hxrwbm!=null)
	{
		for (int i=0;i<hxrwbm.length ;i++ )
		{
			if (!hxrwbm[i].equals(""))
			{
				ls_sql="insert into gdm_rwljgx ( rwbm,hxrwbm)";
				ls_sql+=" values ( ?,?)";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,rwbm);
				ps.setString(2,hxrwbm[i]);
				ps.executeUpdate();
				ps.close();
			}
		}
	}

	String hxrw="";
	ls_sql="select rwmc";
	ls_sql+=" from  gdm_rwljgx,gdm_rwbm";
	ls_sql+=" where  gdm_rwljgx.hxrwbm=gdm_rwbm.rwbm";
	ls_sql+=" and  gdm_rwljgx.rwbm='"+rwbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		String rwmc=cf.fillNull(rs.getString("rwmc"));

		hxrw+=rwmc+"；";
	}
	rs.close();
	ps.close();

	ls_sql="update gdm_rwbm set hxrw='"+hxrw+"' ";
	ls_sql+=" where  rwbm='"+rwbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

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
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" +ls_sql);
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
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>