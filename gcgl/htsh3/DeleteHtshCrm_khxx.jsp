<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] khbh=request.getParameterValues("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int htshdf=0;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{
		ls_sql="update crm_khxx set htshr=null,htshsj=null,htshyj=null,htshdf=0,htshbz='N'";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from crm_htshmx ";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//触发松下亿达系统订单的状态发生改变
		kberp.KbErp kberp=new kberp.KbErp();
		String szrmc=(String)session.getAttribute("yhmc");
		String kbretStr = kberp.setState(conn,khbh[i],"OPEN",szrmc);
		if (!kbretStr.equals("yes"))
		{
			conn.rollback();
			out.println(khbh[i]+"传递松下亿达系统订单状态失败，系统异常："+kbretStr);
			return;
		}


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