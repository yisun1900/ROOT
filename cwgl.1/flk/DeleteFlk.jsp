<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] jlh=request.getParameterValues("jlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<jlh.length ;i++ )
	{
		String khbh=null;
		ls_sql="select khbh";
		ls_sql+=" from cw_cflkjl";
		ls_sql+=" where jlh='"+jlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khbh=cf.fillNull(rs.getString("khbh"));
		}
		rs.close();
		ps.close();

		String kgzbz="";
		ls_sql="select kgzbz ";
		ls_sql+=" from  crm_khxx ";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			kgzbz=cf.fillNull(rs.getString("kgzbz"));
		}
		rs.close();
		ps.close();

		if (!kgzbz.equals("Y"))
		{
			conn.rollback();
			out.println("´íÎó£¡Î´³å¿¨");
			return;
		}

		ls_sql="update crm_khxx set clf=0,sgebfb=0,kgzsj=null,kgzr=null,kgzbz='N',kgzsm=null,fwmjcz=0,zccz=0,czkh=null";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql=" delete from cw_cflkjl ";
		ls_sql+=" where jlh='"+jlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
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
	out.print("Exception: " +e);
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