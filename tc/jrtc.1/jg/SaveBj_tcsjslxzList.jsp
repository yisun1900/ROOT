<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] dwbh=request.getParameterValues("dwbh");
String[] slstr=request.getParameterValues("sl");

int sl=0;

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;

try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<dwbh.length ;i++ )
	{
		try{
			sl=java.lang.Integer.parseInt(slstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>存盘失败！分公司["+dwbh[i]+"]的[促销类别数量限制]输入不是数字:"+slstr[i].trim());
			return;
		}


		ls_sql="delete from bj_tcsjslxz";
		ls_sql+=" where fgsbh='"+dwbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_tcsjslxz(fgsbh,sl)";
		ls_sql+=" values('"+dwbh[i]+"',"+sl+") ";
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