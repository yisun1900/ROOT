<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] tsjlhbox=request.getParameterValues("tsjlhbox");
String[] tsjlh=request.getParameterValues("tsjlh");
String[] jasjstr=request.getParameterValues("jasj");
String[] zzjgbm=request.getParameterValues("zzjgbm");
String[] jsxbm=request.getParameterValues("jsxbm");
String[] xh=request.getParameterValues("xh");

java.sql.Date jasj=null;
String ls=null;

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<tsjlh.length ;i++ )
	{
		if (!cf.searchArray(tsjlhbox,tsjlh[i]))
		{
			continue;
		}

		try{
			jasj=java.sql.Date.valueOf(jasjstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>序号为["+xh[i]+"]的[结案时间]格式输入不正确:"+jasjstr[i]);
			return;
		}
		if (zzjgbm[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>序号为["+xh[i]+"]的[客户满意度]未选择");
			return;
		}
		if (jsxbm[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>序号为["+xh[i]+"]的[解决问题及时性]未选择");
			return;
		}

		ls_sql="update crm_tsjl set jasj=?,zzjgbm=?,jsxbm=?,clzt='3'";
		ls_sql+=" where  tsjlh='"+tsjlh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,jasj);
		ps.setString(2,zzjgbm[i]);
		ps.setString(3,jsxbm[i]);
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
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>