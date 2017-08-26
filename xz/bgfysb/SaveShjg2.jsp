<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] sqxh=request.getParameterValues("sqxh");
String[] pzjeStr=request.getParameterValues("pzje");

double pzje=0;
String ls=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<sqxh.length ;i++ )
	{
	
		ls=pzjeStr[i];
		try{
			if (!(ls.equals("")))  pzje=Double.parseDouble(pzjeStr[i].trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>变量pzje不存在");
			return;
		}
		catch (Exception e){
		    conn.rollback();
			out.println("<BR>[批准金额]类型转换发生意外:"+e);
			return;
		}


		ls_sql="update xz_bgfysbb set pzje=?";
		ls_sql+=" where  sqxh='"+sqxh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,pzje);
		ps.executeUpdate();
		ps.close();

	}//for


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