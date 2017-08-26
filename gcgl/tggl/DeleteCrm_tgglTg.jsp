<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] djbh = request.getParameterValues("djbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<djbh.length ;i++ )
	{
		String zt=null;
		String khbh=null;
		ls_sql=" select zt,khbh";
		ls_sql+=" from  crm_tggl";
		ls_sql+=" where  djbh='"+djbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zt=cf.fillNull(rs.getString("zt"));
			khbh=cf.fillNull(rs.getString("khbh"));
		}
		rs.close();
		ps.close();

		if (!zt.equals("6"))//5：停工申请；6：停工审批；7：办理停工；8：办理复工
		{
			conn.rollback();
			out.println("<BR>！！！错误，状态不正确:"+zt);
			return;
		}


		ls_sql="delete from crm_tggl  ";
		ls_sql+=" where  djbh='"+djbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		
		ls_sql="update crm_khxx set tgbz='W',tgkssj=null,gjfgsj=null,tgyybm=null";
		ls_sql+=" where  khbh='"+khbh+"'";
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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
		if (conn != null) cf.close(conn); 
	}
}
%>