<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String[] kpjlh = request.getParameterValues("kpjlh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<kpjlh.length;i++ )
	{
		ls_sql=" delete from kp_yzfsgdpfb where kpjlh='"+kpjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql=" delete from kp_yzfsgdkpjg where kpjlh='"+kpjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		String fgs=null;
		ls_sql="select fgs";
		ls_sql+=" from  kp_kpjl";
		ls_sql+=" where kpjlh='"+kpjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fgs=rs.getString(1);
		}
		rs.close();
		ps.close();
	
		ls_sql=" delete from kp_kpjl where kpjlh='"+kpjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		int maxkpjlh=0;
		ls_sql="select NVL(max(kpjlh),0)";
		ls_sql+=" from  kp_kpjl";
		ls_sql+=" where fgs='"+fgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			maxkpjlh=rs.getInt(1);
		}
		rs.close();
		ps.close();


		ls_sql=" update kp_kpjl set zxbz='Y' where fgs='"+fgs+"' and kpjlh="+maxkpjlh;
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	
	}

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
	out.print("存盘失败,发生意外: " + e);
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