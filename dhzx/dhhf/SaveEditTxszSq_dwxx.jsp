<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
String[] txlx=request.getParameterValues("txlx");
String[] txtsStr=request.getParameterValues("txts");

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="delete from crm_txxxsz ";
	ls_sql+=" where ssfgs='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<txlx.length ;i++ )
	{
		int txts=0;
		if (!txtsStr[i].trim().equals("") && !txtsStr[i].trim().equals("0")) 
		{
			try{
				txts=Integer.parseInt(txtsStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>[提醒天数]不是数字:"+txtsStr[i]);
				return;
			}

			ls_sql="insert into crm_txxxsz (ssfgs,txlx,txts)";
			ls_sql+=" values ( ?,?,?)";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,dwbh);
			ps.setString(2,txlx[i]);
			ps.setInt(3,txts);
			ps.executeUpdate();
			ps.close();
		}
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
	out.print("<BR>" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>






