<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] clbm = request.getParameterValues("clbm");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<clbm.length ;i++ )
	{
		int count=0;
		ls_sql=" select count(*) " ;
		ls_sql+=" from jxc_clbm " ;
		ls_sql+=" where clbm='"+clbm[i]+"'" ;
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)
		{
			conn.rollback();
			out.println("<BR>���󣡣���[���ϱ���"+clbm[i]+"]������");
			return;
		}

		ls_sql=" select count(*) " ;
		ls_sql+=" from jxc_cljgb " ;
		ls_sql+=" where clbm='"+clbm[i]+"'" ;
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			conn.rollback();
			out.println("<BR>���󣡣��������ϼ۸���а������ϡ�"+clbm[i]+"�������ڡ����ϼ۸������ɾ��");
			return;
		}

		ls_sql=" select count(*) " ;
		ls_sql+=" from jxc_kcb " ;
		ls_sql+=" where clbm='"+clbm[i]+"'" ;
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			conn.rollback();
			out.println("<BR>���󣡣�������桿�а������ϡ�"+clbm[i]+"�������ڡ���桿����ɾ��");
			return;
		}

		ls_sql="delete from jxc_clbm ";
		ls_sql+=" where clbm='"+clbm[i]+"'" ;
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("ɾ���ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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